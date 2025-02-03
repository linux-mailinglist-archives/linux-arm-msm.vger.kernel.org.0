Return-Path: <linux-arm-msm+bounces-46693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2FA251F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 06:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD512164257
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 05:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B954E3594B;
	Mon,  3 Feb 2025 05:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hpXa7Huo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEEC23A6;
	Mon,  3 Feb 2025 05:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738559515; cv=none; b=kEon7j3qTxvxVl6jayMYZPreQCdMEaw0NZX9kqyjk1KyalscWXthcN/ALOPXUim/+5nCaCUbzx20jY3raRfflllhlFSgQDzyJQOXwiPytUPaF43xt35Y3pGyYskAQtumNITN1CvhZzFsi1FAp8k/dCEStB1/97wGui0dq9o3F1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738559515; c=relaxed/simple;
	bh=EE5BWW6S+jQVlXUrEb1w/ROXsxiLZ2ytZwHRHQ0G4Tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=PoptKsypCCpliC3TkpsJug3sp4B7TKWtyMtjr/JIYh80k1v5C9lZIXLLgG9yy466IFP03RoKI9lW2S/c5kHZFWbNcAgIwH/DICBMBPczHTysZdXmLQk27pFmCMo5CMOXdF+Rrt+CJDyewpIdrr1GO5M7ShplM2m0iDhqrgR3/Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hpXa7Huo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51313f8F028359;
	Mon, 3 Feb 2025 05:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LAnVZy9dnDxfBGSk1QI1Ada8QoUxoMy+3kYJsHo6mqA=; b=hpXa7Huo+HdByZ76
	YstxHE53ta5ZWIl52uhE6hmeUeiUJ2do2JPA/BIoK+r54tbefmkMAWuSoeNnxbWV
	UmvL8W0JjdoB+scFz84twJNxs5g6WhpdQfLce2USUTqDuscYg9E8bXrWdVRaGWPM
	8yHhR+iHHyDcFv77QH8pEFfQsUpcB3OM5poQK1n2BkFllEfFA3onDaWROe0/tJer
	Dy183Xv3HqpXKKVdeej5279MYkHiZgdC6beg0BogAQot/xbNfrXeJ7n9Ax3LvuCN
	oUa2A69dgL5QNAcisvVlUWHh6BssK5pB+SOTj3IMJknLkDQTsMnzYdhqh9TCxSGv
	WNrB6A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jkt9ga08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 05:11:49 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5135Bm0Q011488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 05:11:48 GMT
Received: from [10.219.57.57] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 2 Feb 2025
 21:11:44 -0800
Message-ID: <0d4e9563-4a1c-4b7d-b075-eb5a6595ebe4@quicinc.com>
Date: Mon, 3 Feb 2025 10:41:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <andersson@kernel.org>
CC: <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Prakash Gupta
	<quic_guptap@quicinc.com>
References: <20241227110024.30203-1-quic_pbrahma@quicinc.com>
 <1c8af731-c551-4d72-84a0-f14d57bec4ec@oss.qualcomm.com>
 <e7abe34c-9df9-425b-933e-cc744a63b80c@quicinc.com>
 <41fd6b59-249d-4f19-9ff8-4ae169a6db05@oss.qualcomm.com>
 <27aa8dc3-34b9-40e7-93bc-e52118b46138@quicinc.com>
 <ba800255-e2b0-4b92-9ff0-f7ed744fec8c@oss.qualcomm.com>
 <d28f5482-81bc-4600-9a60-872dadd22b96@quicinc.com>
 <5defdbcb-f134-4332-8b63-50794da6e2cd@oss.qualcomm.com>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <5defdbcb-f134-4332-8b63-50794da6e2cd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tggpiVwz1r45JOWcdr0WxbkBM82PCFPy
X-Proofpoint-GUID: tggpiVwz1r45JOWcdr0WxbkBM82PCFPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030043


On 2/1/2025 9:21 PM, Konrad Dybcio wrote:
> On 30.01.2025 6:40 AM, Pratyush Brahma wrote:
>> On 1/29/2025 7:56 PM, Konrad Dybcio wrote:
>>> On 28.01.2025 11:02 AM, Pratyush Brahma wrote:
>>>> On 1/9/2025 8:56 PM, Konrad Dybcio wrote:
>>>>> On 8.01.2025 1:10 PM, Pratyush Brahma wrote:
>>>>>> On 12/30/2024 6:49 PM, Konrad Dybcio wrote:
>>>>>>> On 27.12.2024 12:00 PM, Pratyush Brahma wrote:
>>>>>>>> Add the device node for gfx smmu that is required for gpu
>>>>>>>> specific address translations.
>>>>>>>>
>>>>>>>> This patch depends on the patch series [1] posted by Imran Shaik
>>>>>>>> adding the clock support for gpu.
>>>>>>>>
>>>>>>>> [1] https://lore.kernel.org/all/802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com/
>>>>>>>>
>>>>>>>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>>>>>>>> ---
>>>>>>>>      arch/arm64/boot/dts/qcom/qcs8300.dtsi | 37 +++++++++++++++++++++++++++
>>>>>>>>      1 file changed, 37 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>>>>> index 80226992a65d..8eb688e2df0a 100644
>>>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>>>>> @@ -816,6 +816,43 @@
>>>>>>>>                  #power-domain-cells = <1>;
>>>>>>>>              };
>>>>>>>>      +        adreno_smmu: iommu@3da0000 {
>>>>>>>> +            compatible = "qcom,qcs8300-smmu-500", "qcom,adreno-smmu",
>>>>>>>> +                   "qcom,smmu-500", "arm,mmu-500";
>>>>>>>> +            reg = <0x0 0x3da0000 0x0 0x20000>;
>>>>>>>> +            #iommu-cells = <2>;
>>>>>>>> +            #global-interrupts = <2>;
>>>>>>>> +            dma-coherent;
>>>>>>>> +
>>>>>>>> +            power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>>>>> +            clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>>>>>>>> +                 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
>>>>>>>> +                 <&gpucc GPU_CC_AHB_CLK>,
>>>>>>>> +                 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
>>>>>>>> +                 <&gpucc GPU_CC_CX_GMU_CLK>,
>>>>>>>> +                 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>>>>>>>> +                 <&gpucc GPU_CC_HUB_AON_CLK>;
>>>>>>>> +            clock-names = "gcc_gpu_memnoc_gfx_clk",
>>>>>>>> +                      "gcc_gpu_snoc_dvm_gfx_clk",
>>>>>>>> +                      "gpu_cc_ahb_clk",
>>>>>>>> +                      "gpu_cc_hlos1_vote_gpu_smmu_clk",
>>>>>>>> +                      "gpu_cc_cx_gmu_clk",
>>>>>>>> +                      "gpu_cc_hub_cx_int_clk",
>>>>>>>> +                      "gpu_cc_hub_aon_clk";
>>>>>>> Most of these entries look totally bogus, please make sure you only
>>>>>>> reference the ones actually required
>>>>>> These entries are exactly similar to the ones we use in sa8775p as well [1] and the usecases
>>>>>> haven't changed between qcs8300 and sa8775p.
>>>>>>
>>>>>> Can you please let me know which entries you find irrelevant here?
>>>>> Well, I'm particularly unsure about CX_GMU and the HUB clocks.
>>>>> I >>don't think<< they don't have much to do with the SMMU, but please
>>>>> check internally with someone who knows for sure
>>>> I checked internally and found that these clocks are required for gpu smmu operations
>>>> as we don't use interconnect voting mechanism here as we do downstream. Hence the
>>>> list of clocks is same across all targets using gpu smmu as described in [1] previously.
>>> I managed to dig up some documents too.. It seems you're right, however the order
>>> is supposed to be slightly different:
>>>
>>> GPU_CC_CX_GMU_CLK
>>> GPU_CC_HUB_CX_INT_CLK
>>> GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK
>>> GCC_GPU_MEMNOC_GFX_CLK
>>>
>>> Unsure if it *actually* matters given we've added them in a random order on a
>>> multitude of platforms and there haven't been any visible adverse effects.
>> Thanks for checking this. We haven't really adhered to this order in
>> most of our platforms and things have been running fine. So I guess it doesn't matter.
>> However, I'll still send out the next patchset in the order you've mentioned. Just so that we
>> are in consonance, the final order would look like the following. Please correct me if you'd
>> prefer otherwise.
>>
>>                  clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>>                                 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>>                                 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
>>                                 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>>                                 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
>>                                 <&gpucc GPU_CC_AHB_CLK>,
>>                                 <&gpucc GPU_CC_HUB_AON_CLK>;
> Looks good, please double-check if it works without clk_ignore_unused
Thanks. Yes, these have been tested without clk_ignore_unused. I will 
send out the next set of patches
with this order.
>
> Konrad

-- 
Thanks and Regards
Pratyush Brahma


