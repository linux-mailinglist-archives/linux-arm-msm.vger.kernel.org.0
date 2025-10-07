Return-Path: <linux-arm-msm+bounces-76194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4401CBC1228
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 13:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86E743B615B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 11:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334022D94BF;
	Tue,  7 Oct 2025 11:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="f3cQ3vX3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FADD22B8AB;
	Tue,  7 Oct 2025 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835830; cv=none; b=CS4R+6Og5VwhwudCW9/Zh50b0CyPK62l26N0K/IlH3nZ0FTYxgs98aDEsbUM1S/rr6/fOsD4J9lFtBtWj9QBU3vFHLPBI2D0aqMRoAkXdmD5AOHhXmhj54cRyU9+wxrzaWefHSf/Ltq/BparwT4yz02Bc6EJvunjIhzFrsBv420=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835830; c=relaxed/simple;
	bh=dTlWqI9MDbTPXjNObomXrRjydpXiYIqN1Xq05lAl5jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=VBzj1pexHSUpfaDf4hzIwJ/XLrTpE1cOvlKw9sCmWvtZTIASSJficgDQqXwbzkml31w6isAtH/ov97QkgVq3VW6++yjyJdqgfWNNnf18XDH18wo12F/NWhWd6Tui8FdWSzqFlne+OznyzyjkGM/etXoW7Ftc9Sg4OGMQfhlxPz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=f3cQ3vX3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5973m764004958;
	Tue, 7 Oct 2025 11:17:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AzwZV3lhbGPsR0uXeFxUfkE+5WX8Kk287FDa3Qgag1g=; b=f3cQ3vX3TpiQm/ZE
	m8ZiTtsGJ++drn1xl0m5Se2ZEM3sK39iG2FG2f1d7SG9MJ7cl9/1xd2UOzqBZGd1
	J8DsWzfsESWUFv2ey2w8iEbJBoxqeq/s/DKFRHgAA80ZSs2WDzOpj2ERkT2KyySD
	sLIrZRyi/uALeQVh2TOp2UkE/5Tof4MpkSuoyyhL2+BabMd2LPc52oap9INXL3b1
	+2WSjuGgQx+BirkiHsO2uxhlMTLqdNnWrfmUr8BjNG/7tFtl2OzdGVdqQW5BC4G9
	mY4OSc2z092eoAvfRZfygOy6LWTTjgG7GBd5l6v3Vl4/A6Hxc7NBE6T723xmns+0
	qjU1QQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvrhpu3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 11:17:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 597BH0uV009622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Oct 2025 11:17:00 GMT
Received: from [10.217.216.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 7 Oct
 2025 04:16:55 -0700
Message-ID: <817f02aa-dfb8-a134-2fd4-fbdf8e8a714e@quicinc.com>
Date: Tue, 7 Oct 2025 16:46:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 1/4] dt-bindings: mmc: Add dll-hsr-list for HS400 and
 HS200 modes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter
	<adrian.hunter@intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>, <linux-mmc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <dmitry.baryshkov@oss.qualcomm.com>,
        <quic_pragalla@quicinc.com>, <quic_sayalil@quicinc.com>,
        <quic_nitirawa@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <kernel@oss.qualcomm.com>, Sachin Gupta <quic_sachgupt@quicinc.com>
References: <20250929113515.26752-1-quic_rampraka@quicinc.com>
 <20250929113515.26752-2-quic_rampraka@quicinc.com>
 <20251006214830.GB625548-robh@kernel.org>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <20251006214830.GB625548-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNiBTYWx0ZWRfX6RQ0kTSZW4R5
 bwjSohAl9l2XlwT+RN1dyIUocTTLwtHh/q1L9lfwE4HcP5LlYFCuNC3s87HNKVRODwuB24hOqdz
 Ck2d92lMIYwiIKfCfYfjd/30Ot/WJiREcVG8pchgA8IyUs+rPSMxS0ix7xlSuQXS7KAed7+QqDz
 LZtj6SdL+xR+RxRnqipACI1b1h9L6GtIOfO8wKe2rbuvY63b7a4FolIEuXyaYnmTxf8n0h0JIEr
 k1/TUDkCOwFaDSQh/sMDuAv0jt40hCpiIJhWEUr+wVlMYsbEdlASikUqCxvu59Mt5yyhvNlyZtQ
 rAB83D4Yg/kR64DZd29Hb1tD00Bw+gelTOwXBBuzSGI54dlvdALQlgmt4v8v82ksUl6M1PlFMI2
 9mQ4tOaeOyn3X9eV/exuM2xHeBsD1A==
X-Proofpoint-GUID: bjPfjbwXZxMNLvL4xrxliimPWRKEvptK
X-Authority-Analysis: v=2.4 cv=XIQ9iAhE c=1 sm=1 tr=0 ts=68e4f6ad cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8
 a=bBXPjYvAnMgFlPrjOloA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: bjPfjbwXZxMNLvL4xrxliimPWRKEvptK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040036


On 10/7/2025 3:18 AM, Rob Herring wrote:
> On Mon, Sep 29, 2025 at 05:05:12PM +0530, Ram Prakash Gupta wrote:
>> From: Sachin Gupta <quic_sachgupt@quicinc.com>
>>
>> Document the 'dll-hsr-list' property for MMC device tree bindings.
>> The 'dll-hsr-list' property defines the DLL configurations for HS400
>> and HS200 modes.
>>
>> QC SoCs can have 0 to 4 SDHCI instances, and each one may need
>> different tuning.
>>
>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>> Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>> index 22d1f50c3fd1..a60222473990 100644
>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>> @@ -137,6 +137,11 @@ properties:
>>      $ref: /schemas/types.yaml#/definitions/uint32
>>      description: platform specific settings for DLL_CONFIG reg.
>>  
>> +  qcom,dll-hsr-list:
> '-list' doesn't add anything.

list was used as there are 5 dll register, but '-list' can be
dropped, and it can be renamed to qcom,dll-hsr, I will update in
next patchset.

>
> What is 'hsr'?

Hardware Settings Reference

>
>> +    maxItems: 10
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description: platform specific settings for DLL registers.
>> +
>>    iommus:
>>      minItems: 1
>>      maxItems: 8
>> -- 
>> 2.34.1
>>

