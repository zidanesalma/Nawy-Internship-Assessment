const dates = ["2010/02/20", "19/12/2016", "11-18-2012", "20130720"];


const validPatterns = {
    "yearMonthDaySlash": /^\d{4}\/(0[1-9]|1[0-2])\/(0[1-9]|[1-2][0-9]|3[01])$/, //YYYY/MM/DD
    "dayMonthYearSlash": /^(0[1-9]|[1-2][0-9]|3[01])\/(0[1-9]|1[0-2])\/\d{4}$/, // DD/MM/YYYY
    "monthDayYearHyphen": /^(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[01])-\d{4}$/, // MM-DD-YYYY
};

function matchPattern(date) {
    for (const key in validPatterns) {
        if (date.match(validPatterns[key])) {
            return key;
        }
    }
    return "null";
}

function transformDateFormatHelper(date, key) {
    let temp;
    if (key === "yearMonthDaySlash" || key === "dayMonthYearSlash")
        temp = date.replace(/\//g, '');
    if (key === "dayMonthYearSlash" )
        temp = temp.substring(4) + temp.substring(2, 4) + temp.substring(0, 2);
    else if (key === "monthDayYearHyphen") {
        temp = date.replace(/-/g, '');
        temp = temp.substring(4) + temp.substring(0, 2) + temp.substring(2, 4);
    }
    return temp;
}

function transformDateFormat(dates) {
    let result = [];
    for(const date of dates){
        let key = matchPattern(date);
        if( key !== "null")
            result.push(transformDateFormatHelper(date,key));
        else 
            console.log("the entry " + date + " has invalid format!");
    }
    return result;
}


 //Should return ["20100220", "20161219", "20121118"]
console.log(transformDateFormat(dates));
