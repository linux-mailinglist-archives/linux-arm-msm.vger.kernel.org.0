Return-Path: <linux-arm-msm+bounces-62723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1648CAEAF2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 08:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EFA61C2022D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 06:48:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C626219A89;
	Fri, 27 Jun 2025 06:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a0YRaaiX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88A4217648;
	Fri, 27 Jun 2025 06:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751006904; cv=none; b=F+OEZhMsQdoEoCRyvTD+uAf8AzpUGZXurCCsrHZpCOrD+GSU3d9V7RfVt1gMe3IiC7YyKMAy1XqQ6ey+IFkPlQUgfSWldYTFdXeh8htBtmBaY8tSnPOE1xzMEnA3E1Zr66+L9k7fJourGDF+qjf2uDjsZLv7w0r1fsmjHsj5EVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751006904; c=relaxed/simple;
	bh=CPmH2UhNzzOyJtYz2BQ/oL4YX14EzvZdOTMg/i8Nq0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nrg2BCi3tF2EWuqlkvRI1CHcsshg4E8GwKicOVp74ZBQYSl5rcAHhOU4wZNnX9g+b/m0I3FblSMc/Ggl7LMi8wjwXf5WdfieyxsMV5pReiGF6aSeoC2nrmj4OflWZEmoW18ZKvwfPrTiJrl6kvNOmOEe7xIRaDSGv+BNQ+B5zRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a0YRaaiX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4D6aQ017705;
	Fri, 27 Jun 2025 06:48:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mSsPZr6Ke43hyQo46CPdW0QQxvYRDMtBeeUW7tXGa8Q=; b=a0YRaaiXK3fy6bYV
	uxoSsQTQy3ytNXmSWZJ+zd6kNzw9PlvTaTu3Ui7X8TKJZzUreJEtwXw+h67m8KkE
	W4MDh/QTeGc0nMa4wJOyFS/zhvej0bF4VFlrpCwrD56ZPGGHOHmRPHBzMVJUmeML
	oacmAe9Yb2+qTcuc9y7cd3Z0jDt+tnPxiBBt8p1cBqRMC93nuKGNgN3g/NNDrrjZ
	A+fhvWgihFqXCijUnJMp4WWNIG7cdY9KaRQoSYnTDoijSlZiWHWPFBTVeuqBZBC5
	0bbntNrpwv9rgF7gMkAnucPM9uxamJeBYISjOLI3Lj3P+b0s55I0frlrvzocegYb
	VWY0/w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx425k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 06:48:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55R6mFVe014123
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 06:48:15 GMT
Received: from [10.216.48.74] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 26 Jun
 2025 23:48:09 -0700
Message-ID: <f6ae7d50-e021-bc82-741e-935af3a4496b@quicinc.com>
Date: Fri, 27 Jun 2025 12:18:03 +0530
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
        <quic_nitirawa@quicinc.com>, <quic_sartgarg@quicinc.com>,
        <kernel@oss.qualcomm.com>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-2-quic_sachgupt@quicinc.com>
 <72b02fd1-5195-4bb0-b01d-5481b49a5680@kernel.org>
 <379e9199-4a9e-cd38-20cb-0fbd76fa33b3@quicinc.com>
 <abdde4ff-eae2-44c4-8608-89c762790549@kernel.org>
From: Ram Prakash Gupta <quic_rampraka@quicinc.com>
In-Reply-To: <abdde4ff-eae2-44c4-8608-89c762790549@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 069sUsop3btBy8DGgJZzhcy9wXDqBk3B
X-Proofpoint-ORIG-GUID: 069sUsop3btBy8DGgJZzhcy9wXDqBk3B
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685e3eb0 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=RBDf3ioivJUjA6cGglgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA1MiBTYWx0ZWRfX9lpa1pXDb9Bk
 dGjVD21mfbTT00m4gM9C1BqSOGS9HYpf2PhoOJ4V0VPCdu+Cz+w/Tk3BfX/jgDNrVoWwxLKhYZU
 8TXJ6F/pkc6wrlyrzoobQaBHpmX1KmuMywMktm4Wq7pcR5GT51RTDPy61WlGW1b9atsPPlM1EMM
 6BN7aHTdmr+1mOCuzShUEkoVLwRgN8I0hdraE99bCktOjDz2rvqqrkMDjzSwlWxA+R0xUiLg4DK
 qMRLpBjf2goaREdR2Th2+R1tV//cNFLBbQRdS1Pis86TCriOzxe6j3JUANoeTGMocUhOlD4sNyG
 AIvmOzH+pkKu2s0L/QtRvK6IFtXrVzq+ferizxlThhBGTO3HWG/QHYoNNtGUICDI9UAx5SzpDu6
 Hnb8en4Pg75ZhFW3vP9vYHmxRIue1TZDU9XX1+o/Vr3Gu8Spn8E4B17Yw/x0jgKhDVAm8lJV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_02,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270052


On 6/26/2025 11:12 PM, Krzysztof Kozlowski wrote:
> On 26/06/2025 16:16, Ram Prakash Gupta wrote:
>> On 1/22/2025 3:56 PM, Krzysztof Kozlowski wrote:
>>> On 22/01/2025 10:47, Sachin Gupta wrote:
>>>> Document the 'dll-hsr-list' property for MMC device tree bindings.
>>>> The 'dll-hsr-list' property defines the DLL configurations for HS400
>>>> and HS200 modes.
>>>>
>>>> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
>>>> ---
>>>>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
>>>>  1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> index 8b393e26e025..65dc3053df75 100644
>>>> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
>>>> @@ -133,6 +133,11 @@ properties:
>>>>      $ref: /schemas/types.yaml#/definitions/uint32
>>>>      description: platform specific settings for DLL_CONFIG reg.
>>>>  
>>>> +  qcom,dll-hsr-list:
>>>> +    maxItems: 10
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> uint32 has only one item. Anyway, there is already DLL there, so don't
>>> duplicate or explain why this is different. Explain also why this is not
>>> deducible from the compatible.
>
> Timeline still amazes me. I will be grumpy on this thread.
>
>> I will change it to reflect array from uint32.
>> There is change with artanis DLL hw addition where it need total of 5 entries
>> (dll_config, dll_config_2, dll_config_3, dll_usr_ctl, ddr_config)
>> for each HS400 and HS200 modes, hence the new addition in dt. And these values
>> are not fixed and varies for every SoC, hence this needs to be passed through
>> dt like it was passed earlier for qcom,dll-config & qcom,ddr-config.
>
> Eh, no. That's not a valid reason. It's still SoC deducible. Don't bring
> your downstream practices here, but remove EVERYTHING from downstream
> and start doing things like upstream is doing.
>
> Best regards,
> Krzysztof

Sorry I did not get it - you mean to say keep these values in driver file?
how is it possible to tie these value with only one compatible which can vary
with every soc or you are suggesting me to make code change in driver for every
target having artanis dll hw.

And sorry but considering upstream only this design was put in place, its not
about downstream, since there are already dll_config and ddr_config which are
passed through dt, its logical here to pass rest of the dll related parameters
through dt only.

Thanks,
Ram


