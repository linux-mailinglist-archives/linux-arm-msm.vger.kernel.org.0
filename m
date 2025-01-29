Return-Path: <linux-arm-msm+bounces-46514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC04A21F10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 15:26:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CF71160151
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 14:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4489F13BAE4;
	Wed, 29 Jan 2025 14:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PdWseG1g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E6F7E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 14:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738160785; cv=none; b=eeoHKAgFghZJdQgkQd/Nbh41nnoYphdkeQ2F10qiiz6DkRTcxcPvk4NGQDlCg0HH6uKAqr0HvgUE036UtwksV+3p9M42KDbvk/B9J8cxXgj5AdqiK5jtBO+5CS+fjTgh8GXqzStftmE0nAP3o6dbXWv2M1W9fiq56DPSzqy00Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738160785; c=relaxed/simple;
	bh=upO1szqsGrctpocpedrWQrUbVSGuOGiUp8W6bu7k4Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bR8fng4FlZNQ+j3ZOZoogWKHgUkvYINLgRZ2aDsqkcphuewoWlpKL9fB8oDZqs8VkjTw+5ZnXKvj0fH5/fF7gHB0dbv+0TuPPM0Uun/zDAWkJBdQLKkoRntwerfCXLaTSsV+hmvh0PrRfKAk7svAjHTGYFI06bA9ZVJ8RnxgIis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PdWseG1g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T4ZfCL023905
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 14:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y90IeSV1c8E1ITAjBf3zASZwIa5fTfZk4/hpGgHosLc=; b=PdWseG1gZStW2kaH
	gdJA6YppHYoKdzSdkAe7v/IzPNxTa37U9LXXyi1pec6AqJIOn1tWzdF6DDGMla7n
	4NSW2eC28RcAUDkx2JAhjlcEq2pkvW8okvHYCOcC/CLVtub1y4z/YrY+IuAiELsi
	ib5/xaRdokjLkYlOs0K4rIpVniXgX19pPjPe/CLa17LZgsWujNYPr4OHPp+ns4LT
	1luN1IHlPHJ9BZEwKja9BdDojIqWVUknTerZp+GKNnzWm3wZhpljzA6EunWo02ab
	Nb18AtYaf6vlmVxLaJrH6USNYARMPtUYytxoOnc6cAe+v/8YVdkoAzVQc+jrLJWf
	cGEHDw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fdd8s0pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 14:26:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467a437e5feso18110461cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 06:26:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738160778; x=1738765578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y90IeSV1c8E1ITAjBf3zASZwIa5fTfZk4/hpGgHosLc=;
        b=IKGgvBAwNy688uWuBDnSvYOr9dC40p5p6VQKZ9Oon9mzthdbKELcQU/jLNM4z9xQ/H
         jgXn0OZEGkKCDOKX/EfcmGH6solaxuhSWI2v+rfE5Duol7meNZwtqUwtmPif/9bUsJxo
         C7XTrGPq306eMpz3ilevIw/LA65iNAfqX5KsQ084B6zGugrB65njGY40B6TgU0i1YqAu
         FuYhlwQaDiqdMu4hmApLbaLzg8BOIsdUkv0Gr/DpQ/s467pDkOU/FSbyfGTcAzcrdRh1
         2211KcMjzzYVcbFPQAVz8x63CIxh+i8g1zN5MQ4e/7Stl6uvG3N9fwgyfIOmpZwo7sBr
         JeoA==
X-Forwarded-Encrypted: i=1; AJvYcCWU+egEDYLvUw+5URAy4mDGl65NxNflLtZXEMdt0brZwKxVX8Bn8dj/Lh/+4hoJod7d6MRF7mBGshpdkUtL@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/rwfchNq/sJCB8tVMJD6tUrXVXiUgU8rooagr7G2cTJ2+V2NR
	ipb0iD9qKlHGV8yv35TSq2Po1wrwifEi/Zug+BZ6p6p5Am5/bVl0zm7MUs9Gto/ADBul3+YvXpK
	fdTAh1Egk5mUXk/U/L76vpZUNAWOcU40tUqG6FeawqKun4/ykF5Ye1oFXFewo2b0r
X-Gm-Gg: ASbGncup3N1PrCVbLlxWG0skyAjpaMQ1XY8Cn3fsU1Oxec6uy+qffleYsp+iEwcpCVI
	Ybj5mpS1XEq8M99S9KKRwh0SXUpSkEXhfDFEfyb492xDFgcYU0c2dK1j/LAHGtxviAAicng8Nu9
	jNQDkoJDW9vuxiozfItNeSY7lOPfRPe8DJinZC2do0EXNzABvpKrDfcyKbdmUhlfYJ3kcjj83OY
	69q2ev+nNEk1TYH4dZgPvcIGHhEvLm/QXcVkqUvXjdJzzb68U0hn/GP6Ga2f2O8plLmcEnvlW5P
	qC5j1SjskhjH99YrwwD/pAjR/rlMmfGuwxlLoT+zP+lbMiXVpl7L303QyaI=
X-Received: by 2002:a05:622a:1496:b0:467:6486:78bb with SMTP id d75a77b69052e-46fd0a41b9fmr18841591cf.5.1738160778382;
        Wed, 29 Jan 2025 06:26:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCNf1RBTp6oWIGRWle1mL3ksQXz1UepkfqPVNPLNu7sLQ0Ep4heqkzXkKY2PW3Bx/m6WbeIg==
X-Received: by 2002:a05:622a:1496:b0:467:6486:78bb with SMTP id d75a77b69052e-46fd0a41b9fmr18841291cf.5.1738160777971;
        Wed, 29 Jan 2025 06:26:17 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab676114a73sm972451466b.162.2025.01.29.06.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:26:17 -0800 (PST)
Message-ID: <ba800255-e2b0-4b92-9ff0-f7ed744fec8c@oss.qualcomm.com>
Date: Wed, 29 Jan 2025 15:26:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
To: Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prakash Gupta <quic_guptap@quicinc.com>
References: <20241227110024.30203-1-quic_pbrahma@quicinc.com>
 <1c8af731-c551-4d72-84a0-f14d57bec4ec@oss.qualcomm.com>
 <e7abe34c-9df9-425b-933e-cc744a63b80c@quicinc.com>
 <41fd6b59-249d-4f19-9ff8-4ae169a6db05@oss.qualcomm.com>
 <27aa8dc3-34b9-40e7-93bc-e52118b46138@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <27aa8dc3-34b9-40e7-93bc-e52118b46138@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Otb2x9xUsBuzws35ToLmURsUlE5oylB5
X-Proofpoint-GUID: Otb2x9xUsBuzws35ToLmURsUlE5oylB5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_02,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 clxscore=1015 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290117

On 28.01.2025 11:02 AM, Pratyush Brahma wrote:
> 
> On 1/9/2025 8:56 PM, Konrad Dybcio wrote:
>> On 8.01.2025 1:10 PM, Pratyush Brahma wrote:
>>> On 12/30/2024 6:49 PM, Konrad Dybcio wrote:
>>>> On 27.12.2024 12:00 PM, Pratyush Brahma wrote:
>>>>> Add the device node for gfx smmu that is required for gpu
>>>>> specific address translations.
>>>>>
>>>>> This patch depends on the patch series [1] posted by Imran Shaik
>>>>> adding the clock support for gpu.
>>>>>
>>>>> [1] https://lore.kernel.org/all/802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com/
>>>>>
>>>>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi | 37 +++++++++++++++++++++++++++
>>>>>    1 file changed, 37 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>> index 80226992a65d..8eb688e2df0a 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>>> @@ -816,6 +816,43 @@
>>>>>                #power-domain-cells = <1>;
>>>>>            };
>>>>>    +        adreno_smmu: iommu@3da0000 {
>>>>> +            compatible = "qcom,qcs8300-smmu-500", "qcom,adreno-smmu",
>>>>> +                   "qcom,smmu-500", "arm,mmu-500";
>>>>> +            reg = <0x0 0x3da0000 0x0 0x20000>;
>>>>> +            #iommu-cells = <2>;
>>>>> +            #global-interrupts = <2>;
>>>>> +            dma-coherent;
>>>>> +
>>>>> +            power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>>> +            clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>>>>> +                 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
>>>>> +                 <&gpucc GPU_CC_AHB_CLK>,
>>>>> +                 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
>>>>> +                 <&gpucc GPU_CC_CX_GMU_CLK>,
>>>>> +                 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>>>>> +                 <&gpucc GPU_CC_HUB_AON_CLK>;
>>>>> +            clock-names = "gcc_gpu_memnoc_gfx_clk",
>>>>> +                      "gcc_gpu_snoc_dvm_gfx_clk",
>>>>> +                      "gpu_cc_ahb_clk",
>>>>> +                      "gpu_cc_hlos1_vote_gpu_smmu_clk",
>>>>> +                      "gpu_cc_cx_gmu_clk",
>>>>> +                      "gpu_cc_hub_cx_int_clk",
>>>>> +                      "gpu_cc_hub_aon_clk";
>>>> Most of these entries look totally bogus, please make sure you only
>>>> reference the ones actually required
>>> These entries are exactly similar to the ones we use in sa8775p as well [1] and the usecases
>>> haven't changed between qcs8300 and sa8775p.
>>>
>>> Can you please let me know which entries you find irrelevant here?
>> Well, I'm particularly unsure about CX_GMU and the HUB clocks.
>> I >>don't think<< they don't have much to do with the SMMU, but please
>> check internally with someone who knows for sure
> I checked internally and found that these clocks are required for gpu smmu operations
> as we don't use interconnect voting mechanism here as we do downstream. Hence the
> list of clocks is same across all targets using gpu smmu as described in [1] previously.

I managed to dig up some documents too.. It seems you're right, however the order
is supposed to be slightly different:

GPU_CC_CX_GMU_CLK
GPU_CC_HUB_CX_INT_CLK
GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK
GCC_GPU_MEMNOC_GFX_CLK

Unsure if it *actually* matters given we've added them in a random order on a
multitude of platforms and there haven't been any visible adverse effects.

With GPU_CC_AHB not being mentioned but it being quite reasonable to be there
judging by its name. Enabling HLOS1_VOTE normally enables some more clocks (some
known by Linux, some not), but here the docs are rather cryptic on that topic.

I'm not sure about SNoC_DVM on this one as well, but other SoCs require it so
it's probably safe so assume this one does so as well

I've verified the interrupt numbers, so please just alter the property order /
whitespaces / general style of the node to match x1e80100.dtsi and we'll get
this merged

Konrad

