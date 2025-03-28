Return-Path: <linux-arm-msm+bounces-52754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0EAA74889
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 11:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF701189EE31
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 10:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4967D215040;
	Fri, 28 Mar 2025 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Cle+KAwE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B670212FB4;
	Fri, 28 Mar 2025 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743158521; cv=none; b=pqjxS31AkcahY9T+ZmgRwwbD2LXjo/4Ilpx9RosNR0Eu/bU2XfnPILHd9iRBknqqAVCuJvxlF/ptPLCadXqdVFtAZCVQrX/J1T6Tc0UdqWJSERG7qwzcV1XVnqRz+67RrkmYGkvYdbAvvCdmnyL/6p6CpMsDP8k4dVBNxr0i1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743158521; c=relaxed/simple;
	bh=6y8gILQuBMHPj8pYA1VAx4a5WmpazOm0mjeW+sXSeqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gYlDvCWdjSodQjjCqQMf+RVdC8sVXOg71/fx3yc5Ogj+Yh7UrdAltU89+tHdO/ghLCdYyE8MD9DpwtgKy80HZIEdMjuVpWh2WchhqPyqw3mRAi5W5DHpS147fzUhpVgQQfMhW6N6E0JslpAa3Ne2iovL5DFe4wLTsNk13AV6qHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Cle+KAwE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S4fCjY003114;
	Fri, 28 Mar 2025 10:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U9shwV8jYzki+0G3AAf+1vTrrfZ0zsCQPcwcQKvaiw4=; b=Cle+KAwEx3xYxG4o
	opi/abdQngcGJRmXxv00ah+ecxSy7spTme1EdUx4L0Au4wtxWKjMDREQDuEBkrVf
	oy0N6k5JVVYTmXDN+6M6nFGO9d48wULHTS+15/x8wkww8y7mJOXRaEvZVJRN/twq
	6im2Td4903hP775WQUi6XK3HtQRu6EXdH+xl5GiUNPSIbF16nqZE+rUhd+UqQUXv
	EmfvK2TpBZrxn0YbvgChM0EKy/kfoGUOUKwaTGEkV9pREk1l+LRVczLI1M40QbeW
	eBwBPyrLyEUtg+dBxJYz1eQo9UZd54u2TusT59kQ5uA0DxpEa6yGgOKGX3dmymJC
	NP5fjQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xe1eka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 10:41:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52SAfs6o006513
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Mar 2025 10:41:54 GMT
Received: from [10.218.22.7] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Mar
 2025 03:41:47 -0700
Message-ID: <b3228ab0-63c0-4cb4-9671-87601a7bed9b@quicinc.com>
Date: Fri, 28 Mar 2025 16:11:44 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/18] clk: qcom: common: Handle runtime power
 management in qcom_cc_really_probe
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        "Satya Priya
 Kakitapalli" <quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-5-895fafd62627@quicinc.com>
 <db2566c3-d9e4-4c16-9389-0406de288d7d@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <db2566c3-d9e4-4c16-9389-0406de288d7d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: LOmsBaTLAC5MG-AGqHAqxsfkR7zl1vN0
X-Proofpoint-GUID: LOmsBaTLAC5MG-AGqHAqxsfkR7zl1vN0
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e67cf3 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=u_DjpzmifzGFAh8HdrwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=963 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280073



On 3/27/2025 9:28 PM, Bryan O'Donoghue wrote:
> On 27/03/2025 09:52, Jagadeesh Kona wrote:
>> -        return ret;
>> +        goto put_rpm;
>> +
>> +    ret = qcom_cc_icc_register(dev, desc);
>> +
>> +put_rpm:
>> +    if (desc->use_rpm)
>> +        pm_runtime_put(dev);
>>   -    return qcom_cc_icc_register(dev, desc);
>> +    return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
> 
> Doesn't look right you're missing the put if register goes wrong
> 

The intention is to call pm_runtime_put() regardless of the return value
from qcom_cc_icc_register(), as it is the final API call. Therefore, the
return type is not checked, and pm_runtime_put() is called in both success
and failure cases before returning the final return code.

Thanks,
Jagadeesh

>     ret = qcom_cc_icc_register(dev, desc);
> 
>     if (ret)
>         goto put_rpm;
> 
>     return 0;
> 
> put_rpm:
>     if (desc->us_rpm)
>         pm_runtime_put();
> 
>     return ret;

