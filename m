Return-Path: <linux-arm-msm+bounces-62656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3541CAEA02E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 16:17:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD2BE16AA95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79DE287271;
	Thu, 26 Jun 2025 14:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QuLC9237"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1703E28507F;
	Thu, 26 Jun 2025 14:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947399; cv=none; b=ZJGzcgCDPOIHk1GDgMK11pmxWlj9J1L4S+kwgeqC/daganb59gKOZIFJABEb4k1uoj1L+tWlZGvbsFrbLIPY2ZlI8q4g/epB8jZE4gFcAed1rYyOUglSr+zV1deYIekLDXIXoQG9f+fzXYalnACXjEceLTpkq1s5/AgSamD1l7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947399; c=relaxed/simple;
	bh=GwBi4n0JlW43cz36R/qfINrSWt1USAJ/uXPLyybQO+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nSCPbKzLCXOZam7UZf/Wzv5pReK31/jVDnFQR8jycsP5A3AW3V16HFAO48AHLrL17ub7zOagCJZlxFdBI0dRj403V+53TooDSTPAhDr8Hgoi9gm4Buh47JL0Qx/J/9kT6WvvzxieIY/T86t8Z6Hc18GU7GBlwOUV3RmA5mdLfTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QuLC9237; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9Uusn031185;
	Thu, 26 Jun 2025 14:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bfGS8hpzciiHwx/PSRhY0YfVUjjIVFBig3eSfl/wbao=; b=QuLC9237ZNIuiNAX
	wMSvWImxFQ0JUZVCeXLRx0c4W03pyyo0vgDf3bzmOOpOQ0TAciuIox8Wp75g56bU
	o/9XHkjlhtVvpCy8qWPQMkBrbiRfqDUZ9Zf61F505cbI3KtHiOfM9Jd9fgOF4Mmt
	5uWy67nENIuoYddIXYrW7qX62oX9YQGproIt1vbA4awYCoaYjMujALf7GOLFw6/N
	j935sP7bj9yLkQ95tIrxgDNqDVrL8lODo6Xvv0U0j+r7zWxVGoGSxl1I/594MHCi
	ra+t3asi1Noe7YMG4ppWvKQlhtUe8tLXyQdsT1bDVdi8H/MuZbAA0AR13eQlyzeX
	nfNfFw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b43fw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:16:32 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55QEGUh9013653
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:16:30 GMT
Received: from [10.216.48.74] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Jun
 2025 07:16:25 -0700
Message-ID: <379e9199-4a9e-cd38-20cb-0fbd76fa33b3@quicinc.com>
Date: Thu, 26 Jun 2025 19:46:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V3 1/4] dt-bindings: mmc: Add dll-hsr-list for HS400 and
 HS200 modes
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sachin Gupta
	<quic_sachgupt@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sartgarg@quicinc.com>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-2-quic_sachgupt@quicinc.com>
 <72b02fd1-5195-4bb0-b01d-5481b49a5680@kernel.org>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <72b02fd1-5195-4bb0-b01d-5481b49a5680@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMSBTYWx0ZWRfX04S0ZwAErbug
 1LGiGvFp9cGI3qEB/0h/aeSfPASH/N96d7fBx3R8VLeKUD6bN57hc8eG/KbFUPqqSfIMPUWxR/d
 aKcyVVoWdezq8qJZysfLjeyxx+b+rz/eYJM+r6JxwU0857FZaGWepNZ7NIcaZpCNdhorJ/Ut3Le
 8FlHTHOCx4slo6H36XhqtSLaYHhAqwBA21byzJn5uV//cPcTbBWLx1CeurBeUfH1JPnuMInLFIJ
 AOUJ2lBTk816j8hWXtZqrmcJghNEGuQqLK4MRvUPFfVg+D032gO64WGUsYrnm5kO8QMI7D2QN4j
 BBnsjYgfN3696cRavzXbcpU2B45Ib4C/wcjmKvxlptbyQ9lJ4epnhu+Hne5cqOQaJ9pqrhuLROO
 CtPD7ZEqgdz4slt698FaXRkhA28iN+5V3zHDz+v0CU7zQ55JfYSzz9AVltkXtRtoTCtW8CEj
X-Proofpoint-ORIG-GUID: QOgtJn9LSxAAE1l36YIN931YlvunmJAy
X-Proofpoint-GUID: QOgtJn9LSxAAE1l36YIN931YlvunmJAy
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685d5640 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=ikfpGsmVBwgCooMSvQQA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260121

On 1/22/2025 3:56 PM, Krzysztof Kozlowski wrote:
> On 22/01/2025 10:47, Sachin Gupta wrote:
>> Document the 'dll-hsr-list' property for MMC device tree bindings.
>> The 'dll-hsr-list' property defines the DLL configurations for HS400
>> and HS200 modes.
>>
>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>> index 8b393e26e025..65dc3053df75 100644
>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>> @@ -133,6 +133,11 @@ properties:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>>      description: platform specific settings for DLL_CONFIG reg.
>>  
>> +  qcom,dll-hsr-list:
>> +    maxItems: 10
>> +    $ref: /schemas/types.yaml#/definitions/uint32
> uint32 has only one item. Anyway, there is already DLL there, so don't
> duplicate or explain why this is different. Explain also why this is not
> deducible from the compatible.

I will change it to reflect array from uint32.
There is change with artanis DLL hw addition where it need total of 5 entries
(dll_config, dll_config_2, dll_config_3, dll_usr_ctl, ddr_config)
for each HS400 and HS200 modes, hence the new addition in dt. And these values
are not fixed and varies for every SoC, hence this needs to be passed through
dt like it was passed earlier for qcom,dll-config & qcom,ddr-config.

And backward compatibility would be taken care by check for qcom,dll-hsr-list,
where new settings would apply for soc where qcom,dll-hsr-list is added into
dt.

>
> Please provide here link to DTS user so we can validate how you use it.
>
>
> Best regards,
> Krzysztof

