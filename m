Return-Path: <linux-arm-msm+bounces-63034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2134AED4A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 08:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6B551894DEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Jun 2025 06:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0DE1E8333;
	Mon, 30 Jun 2025 06:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DTyDAlsa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEF3199BC;
	Mon, 30 Jun 2025 06:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751265219; cv=none; b=Rxpu/nCFIPWr0wnDNFgkRXsGVx9sRuUta2R+G61W35mDvMc1Cto5GQGjoUYPDH1lTZlaE+oviL6OutposkrQBAUzAPzTmp2dVo3sfSoG93WKzemIfjo81USbfBG03g78j7Gcly6F69qT103tsHPOdmSnyhC1YGPokTgW60yA5L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751265219; c=relaxed/simple;
	bh=7DtllwwKByPlp9eu16Mmt6F0qn8vZ+Xmdgb9mLWmraE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DEL+NRQf1qxaQHzaoHXru7qcrpbnYRIkbJXyxqIObbsljBM/RkmtaRPXhV5InN7IZ5mG60jjZnwss9m4Rl90qbxabMCJE2e8pGPbZrVz6N6DzxukEJWTZ9Y8V10F5kQualaJG0qBNhVCtKWGPDH6R9JBhGUiNxkVdUVkWvkR6o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DTyDAlsa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TLeoc3007424;
	Mon, 30 Jun 2025 06:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8/zGp6Xz/Zt9jT/fzPh9nFeSI4zwpmPMD5kpSQY2aR0=; b=DTyDAlsaACMVI3e+
	YJmElPwCk5eDZkqGziWkhEIRlDEsTjWw+2thwkvzRe7ccC8sC66wghBwqFF5yuH9
	WeUs+U4r1E8n7eOgvJLNEGYLaiFEt8dWoEjjZ0dNabFFXInhxVlzv1U//RXy+sza
	a55x0ZEFdcmHQxl6SnSBuowqHi8kjSs6kl18BQ5tzwTuT8Z3UYU5aiPrvy51q+r2
	JT/XxbAbbEeZvs/XlTdZdGRXOruusKqOlahIeXNfMnmuwA1BeUzr7gKq7K1Bgjqv
	Jmc7z26aJvHVwk0/+dzidA/AVXqJEEqH3uCNN1DAlGuFAdYQ+/OXHVEOz77Of4IF
	rJKZ1A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j801uknm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 06:33:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55U6XTTO011424
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 06:33:29 GMT
Received: from [10.218.36.129] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 29 Jun
 2025 23:33:23 -0700
Message-ID: <0d43b504-7f10-cb21-f8df-49677bc99ed1@quicinc.com>
Date: Mon, 30 Jun 2025 12:03:18 +0530
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
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Sachin Gupta <quic_sachgupt@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_narepall@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sartgarg@quicinc.com>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-2-quic_sachgupt@quicinc.com>
 <72b02fd1-5195-4bb0-b01d-5481b49a5680@kernel.org>
 <379e9199-4a9e-cd38-20cb-0fbd76fa33b3@quicinc.com>
 <abdde4ff-eae2-44c4-8608-89c762790549@kernel.org>
 <99b9e6aa-36b4-456c-ba46-6e1207cc1019@oss.qualcomm.com>
 <627428b1-7381-44bf-9d66-f185f2e216f6@kernel.org>
Content-Language: en-US
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <627428b1-7381-44bf-9d66-f185f2e216f6@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qznaPttHlAaZaKnvUmkLh9nunmEFtmpL
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=68622fba cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=ia3MPIjHn3TQ6u26krAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: qznaPttHlAaZaKnvUmkLh9nunmEFtmpL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA1MyBTYWx0ZWRfX0hTZhNVyc/Gm
 HiObLHQmUvjqTGY2hHkZ1L75niwY8jorSKKzLyCs1WqjpKEjjX/J437wqn1zirBIz9w8yFmRP57
 QZKTQnmCCbcOep0mufXXA1U3FUdgVSEUanV28pcLcHW1ARcEddbT5hivGZjI19i150ZkBlzit40
 M6T1/HwLWK12nRrvWGjRtpIKBj+DrCi86jba/XYnopCknz+APk+Fqvd3vZHVPjXLXHsz9U0mGUv
 Co8nXUyuU2vewHjbR57EueDbfaEyhWEeJreGVSYOt887yH2ZhaXbEB6VR7SkHmDU9CqogJwc/Bb
 BlaseFxXeTKfCu2RLSvMkRBzr2kd6UfSEV1jf3ywWGJccHnltmq0tgspFe7ZJfV6TYCzoUqwmWq
 8kJ5Hbd+8ApJbF/tdx1B14P/1Vt7SR4BhcE1kNArOPHiQW5k/D7piXLZCZGnt3y3qjhbFwIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506300053


On 6/27/2025 8:20 PM, Krzysztof Kozlowski wrote:
> On 27/06/2025 15:57, Konrad Dybcio wrote:
>> On 6/26/25 7:42 PM, Krzysztof Kozlowski wrote:
>>> On 26/06/2025 16:16, Ram Prakash Gupta wrote:
>>>> On 1/22/2025 3:56 PM, Krzysztof Kozlowski wrote:
>>>>> On 22/01/2025 10:47, Sachin Gupta wrote:
>>>>>> Document the 'dll-hsr-list' property for MMC device tree bindings.
>>>>>> The 'dll-hsr-list' property defines the DLL configurations for HS400
>>>>>> and HS200 modes.
>>>>>>
>>>>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>>>> ---
>>>>>>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>>>>>>  1 file changed, 5 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>>>> index 8b393e26e025..65dc3053df75 100644
>>>>>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>>>> @@ -133,6 +133,11 @@ properties:
>>>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>      description: platform specific settings for DLL_CONFIG reg.
>>>>>>  
>>>>>> +  qcom,dll-hsr-list:
>>>>>> +    maxItems: 10
>>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> uint32 has only one item. Anyway, there is already DLL there, so don't
>>>>> duplicate or explain why this is different. Explain also why this is not
>>>>> deducible from the compatible.
>>>
>>> Timeline still amazes me. I will be grumpy on this thread.
>>>
>>>> I will change it to reflect array from uint32.
>>>> There is change with artanis DLL hw addition where it need total of 5 entries
>>>> (dll_config, dll_config_2, dll_config_3, dll_usr_ctl, ddr_config)
>>>> for each HS400 and HS200 modes, hence the new addition in dt. And these values
>>>> are not fixed and varies for every SoC, hence this needs to be passed through
>>>> dt like it was passed earlier for qcom,dll-config & qcom,ddr-config.
>>>
>>> Eh, no. That's not a valid reason. It's still SoC deducible. Don't bring
>>> your downstream practices here, but remove EVERYTHING from downstream
>>> and start doing things like upstream is doing.
>> QC SoCs have between 0 and 4 SDHCI instances, each one potentially requiring
>> different tuning, let's keep this data in DT
>
> OK, this should be explained in commit msg.
>
> Best regards,
> Krzysztof

sure, I will update this into commit message.

Thanks,
Ram


