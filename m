Return-Path: <linux-arm-msm+bounces-46566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3601EA228A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 06:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 91AD5165908
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 05:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF646183CBB;
	Thu, 30 Jan 2025 05:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HR87IvFp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149702AE74;
	Thu, 30 Jan 2025 05:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738215683; cv=none; b=UvnJFq6s38vKGARfj46cl0iu7Y1WiWzmlHqBM+wTm0b/H4XTf22lYonEeKYVveA4CmQJxO7SCF+cjnzHeS7eWsqtIwJ3i9bxnOSfKVwlSNTwRf46ppmopBEzRAmQDWqXSVG+tzGAUrxFlb5NS71yurlgO6IcAA48JRW0YSJCobw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738215683; c=relaxed/simple;
	bh=OS7zJYaqdtmlc1+LJim/nI8jhP+5wi3QjafWV8fA92w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=okxbZdFtHyuj1DYFKnw3+KVjptZC/fwjfoBfEjf88zhkRQFKMXeNlxRFfYprkoiyHnTW0QESY7bwqAYP2Pp4aatasw75zOaFw7qKr0Zzk9nTxHISKzSt7oKB07dYXzTXjOsksqs0jxDOj6k18o6QxXzktWxN1XZyK94H8JT/NhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HR87IvFp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50U0Qht5008837;
	Thu, 30 Jan 2025 05:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/zeS9/cSYNvAfuPbgs78wHUPJ8+rbANcaQU7MjneQro=; b=HR87IvFpBxkc18tL
	A631DMAGmgOyVHBMfE+4jMwxZN21Ss2FZYU1GJHGmhmEs7aWbL9iLDJmuvv85YO5
	cnOIisXY08k08Wu+BjcZSCktfJLqYpxfUUL3bkJJ9sXZ2sqfLqsRSy8TQdK0Euzx
	LfquKmadmU79hgTUXAW1AJmeB0lY0Q2RCkPDZQSlk4xUlgXqhLZP16xJNsKaGQb2
	Pi1n36/r8ol1kx+msLxEtSOoAZ5uJn4QVEZVlBZyk3OGTb/tw8oxoWVlzz0h/Fs6
	LRxk3vxFVTWuq/mVtCXXQivPzjJ4PJMg43vGmVvqWbjrMjZ3aiL6CnBr+b7Gzx+G
	/nznSA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fxvwrdyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 05:41:18 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50U5ew0o013712
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 05:40:58 GMT
Received: from [10.216.18.103] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 Jan
 2025 21:40:54 -0800
Message-ID: <d28f5482-81bc-4600-9a60-872dadd22b96@quicinc.com>
Date: Thu, 30 Jan 2025 11:10:45 +0530
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
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <ba800255-e2b0-4b92-9ff0-f7ed744fec8c@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0cE47wSXT8dYRztXFVImDF1IvjYcS4aP
X-Proofpoint-ORIG-GUID: 0cE47wSXT8dYRztXFVImDF1IvjYcS4aP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxlogscore=935 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300042


On 1/29/2025 7:56 PM, Konrad Dybcio wrote:
> On 28.01.2025 11:02 AM, Pratyush Brahma wrote:
>> On 1/9/2025 8:56 PM, Konrad Dybcio wrote:
>>> On 8.01.2025 1:10 PM, Pratyush Brahma wrote:
>>>> On 12/30/2024 6:49 PM, Konrad Dybcio wrote:
>>>>> On 27.12.2024 12:00 PM, Pratyush Brahma wrote:
>>>>>> Add the device node for gfx smmu that is required for gpu
>>>>>> specific address translations.
>>>>>>
>>>>>> This patch depends on the patch series [1] posted by Imran Shaik
>>>>>> adding the clock support for gpu.
>>>>>>
>>>>>> [1] https://lore.kernel.org/all/802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com/
>>>>>>
>>>>>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/qcs8300.dtsi | 37 +++++++++++++++++++++++++++
>>>>>>     1 file changed, 37 insertions(+)
>>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>>> index 80226992a65d..8eb688e2df0a 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>>> @@ -816,6 +816,43 @@
>>>>>>                 #power-domain-cells = <1>;
>>>>>>             };
>>>>>>     +        adreno_smmu: iommu@3da0000 {
>>>>>> +            compatible = "qcom,qcs8300-smmu-500", "qcom,adreno-smmu",
>>>>>> +                   "qcom,smmu-500", "arm,mmu-500";
>>>>>> +            reg = <0x0 0x3da0000 0x0 0x20000>;
>>>>>> +            #iommu-cells = <2>;
>>>>>> +            #global-interrupts = <2>;
>>>>>> +            dma-coherent;
>>>>>> +
>>>>>> +            power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>>> +            clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>>>>>> +                 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
>>>>>> +                 <&gpucc GPU_CC_AHB_CLK>,
>>>>>> +                 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
>>>>>> +                 <&gpucc GPU_CC_CX_GMU_CLK>,
>>>>>> +                 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>>>>>> +                 <&gpucc GPU_CC_HUB_AON_CLK>;
>>>>>> +            clock-names = "gcc_gpu_memnoc_gfx_clk",
>>>>>> +                      "gcc_gpu_snoc_dvm_gfx_clk",
>>>>>> +                      "gpu_cc_ahb_clk",
>>>>>> +                      "gpu_cc_hlos1_vote_gpu_smmu_clk",
>>>>>> +                      "gpu_cc_cx_gmu_clk",
>>>>>> +                      "gpu_cc_hub_cx_int_clk",
>>>>>> +                      "gpu_cc_hub_aon_clk";
>>>>> Most of these entries look totally bogus, please make sure you only
>>>>> reference the ones actually required
>>>> These entries are exactly similar to the ones we use in sa8775p as well [1] and the usecases
>>>> haven't changed between qcs8300 and sa8775p.
>>>>
>>>> Can you please let me know which entries you find irrelevant here?
>>> Well, I'm particularly unsure about CX_GMU and the HUB clocks.
>>> I >>don't think<< they don't have much to do with the SMMU, but please
>>> check internally with someone who knows for sure
>> I checked internally and found that these clocks are required for gpu smmu operations
>> as we don't use interconnect voting mechanism here as we do downstream. Hence the
>> list of clocks is same across all targets using gpu smmu as described in [1] previously.
> I managed to dig up some documents too.. It seems you're right, however the order
> is supposed to be slightly different:
>
> GPU_CC_CX_GMU_CLK
> GPU_CC_HUB_CX_INT_CLK
> GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK
> GCC_GPU_MEMNOC_GFX_CLK
>
> Unsure if it *actually* matters given we've added them in a random order on a
> multitude of platforms and there haven't been any visible adverse effects.
Thanks for checking this. We haven't really adhered to this order in
most of our platforms and things have been running fine. So I guess it 
doesn't matter.
However, I'll still send out the next patchset in the order you've 
mentioned. Just so that we
are in consonance, the final order would look like the following. Please 
correct me if you'd
prefer otherwise.

                 clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
                                <&gpucc GPU_CC_HUB_CX_INT_CLK>,
                                <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
                                <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
                                <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
                                <&gpucc GPU_CC_AHB_CLK>,
                                <&gpucc GPU_CC_HUB_AON_CLK>;

>
> With GPU_CC_AHB not being mentioned but it being quite reasonable to be there
> judging by its name. Enabling HLOS1_VOTE normally enables some more clocks (some
> known by Linux, some not), but here the docs are rather cryptic on that topic.
>
> I'm not sure about SNoC_DVM on this one as well, but other SoCs require it so
> it's probably safe so assume this one does so as well
Yes, I have been conservative to include all the clocks that are 
required on other platforms
here as well.
>
> I've verified the interrupt numbers, so please just alter the property order /
> whitespaces / general style of the node to match x1e80100.dtsi and we'll get
> this merged

Sure, will take care of this in the next version.

> Konrad

-- 
Thanks and Regards
Pratyush Brahma


