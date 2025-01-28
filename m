Return-Path: <linux-arm-msm+bounces-46357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 720D3A20825
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 11:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1ED7161AC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 10:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AEC19F104;
	Tue, 28 Jan 2025 10:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RstmT225"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9F619F103;
	Tue, 28 Jan 2025 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058566; cv=none; b=GDrYB0GN994APWf2mTUUqkxjxE00UhgjHt2vZsxniISHjXh08C08vWx7DqPxs3z3C2RpCW0J1HOlF327q/mXRgyb/upe8d/cZudahlRlg0/xxeA0NW2aCgYg+8lDEtFEKr1/3u3E1K3jBIX1Jhe4EEy8wXnp7smqXaYiFbhnrzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058566; c=relaxed/simple;
	bh=wwE92+WBK8hl/Dx781FVGFXk/gvnWFzDgbYVdj6qle0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Gjz/uIoQKYi+wvAdF9Vfv8s5QJdEkYZ71WnEMFn4yN2PBJIMXawpeF8aX/Aj2H1luzVB4fTKK9cAlExSTyrkbS2URZ9BZi7U614BxKfWMvJnyBdp/TLNV5JlynaJ4Znm/uAOn5Peqf8mWJ0oS/jjefY8jiBkJvX+fRsxVjlmoZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RstmT225; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S9lWIJ018312;
	Tue, 28 Jan 2025 10:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IDLMrbpHNNym0vn68KNbcKFpIsk2STRx8jysXH0owU0=; b=RstmT2251xkkTHTB
	lG47Hcnikx36wBgqzgt2fR7aSbHca73EidE/U9FvlyTOj43QLorrvi9YAGpytz7V
	hUUNFnS3/UtROsgUjJ2F6NBWnBl7aP92Ts2H6Qh6BiIQ8/ma7flzkyI4ft/Hw4Ha
	tuh5buT2iLCpfNqb+bLn6p/7XTI57jH3BcM1yojVm6POezZ8nWZw6HPmVghr7EiL
	0bDdu9QwqMFxW1g9TxRwgRTNXpYsr4YOKAt9TxgdN7WEs/IzCsbXZ2LapmZwHqdu
	92ttZKcHJLJbRrsaXugcKZOEDzsUNjlfYqfMxuxTZGqia4C8RKNrgapgYQxfPnS3
	MSLC3Q==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44evwug19j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 10:02:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50SA2eR9017802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 10:02:40 GMT
Received: from [10.218.5.175] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 28 Jan
 2025 02:02:36 -0800
Message-ID: <27aa8dc3-34b9-40e7-93bc-e52118b46138@quicinc.com>
Date: Tue, 28 Jan 2025 15:32:28 +0530
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
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <41fd6b59-249d-4f19-9ff8-4ae169a6db05@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PhJwdjxkUgJJmyDXZkoK9E4KrRFFHZCt
X-Proofpoint-ORIG-GUID: PhJwdjxkUgJJmyDXZkoK9E4KrRFFHZCt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_03,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=889
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501280077


On 1/9/2025 8:56 PM, Konrad Dybcio wrote:
> On 8.01.2025 1:10 PM, Pratyush Brahma wrote:
>> On 12/30/2024 6:49 PM, Konrad Dybcio wrote:
>>> On 27.12.2024 12:00 PM, Pratyush Brahma wrote:
>>>> Add the device node for gfx smmu that is required for gpu
>>>> specific address translations.
>>>>
>>>> This patch depends on the patch series [1] posted by Imran Shaik
>>>> adding the clock support for gpu.
>>>>
>>>> [1] https://lore.kernel.org/all/802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com/
>>>>
>>>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qcs8300.dtsi | 37 +++++++++++++++++++++++++++
>>>>    1 file changed, 37 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>> index 80226992a65d..8eb688e2df0a 100644
>>>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>>>> @@ -816,6 +816,43 @@
>>>>                #power-domain-cells = <1>;
>>>>            };
>>>>    +        adreno_smmu: iommu@3da0000 {
>>>> +            compatible = "qcom,qcs8300-smmu-500", "qcom,adreno-smmu",
>>>> +                   "qcom,smmu-500", "arm,mmu-500";
>>>> +            reg = <0x0 0x3da0000 0x0 0x20000>;
>>>> +            #iommu-cells = <2>;
>>>> +            #global-interrupts = <2>;
>>>> +            dma-coherent;
>>>> +
>>>> +            power-domains = <&gpucc GPU_CC_CX_GDSC>;
>>>> +            clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>>>> +                 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
>>>> +                 <&gpucc GPU_CC_AHB_CLK>,
>>>> +                 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
>>>> +                 <&gpucc GPU_CC_CX_GMU_CLK>,
>>>> +                 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>>>> +                 <&gpucc GPU_CC_HUB_AON_CLK>;
>>>> +            clock-names = "gcc_gpu_memnoc_gfx_clk",
>>>> +                      "gcc_gpu_snoc_dvm_gfx_clk",
>>>> +                      "gpu_cc_ahb_clk",
>>>> +                      "gpu_cc_hlos1_vote_gpu_smmu_clk",
>>>> +                      "gpu_cc_cx_gmu_clk",
>>>> +                      "gpu_cc_hub_cx_int_clk",
>>>> +                      "gpu_cc_hub_aon_clk";
>>> Most of these entries look totally bogus, please make sure you only
>>> reference the ones actually required
>> These entries are exactly similar to the ones we use in sa8775p as well [1] and the usecases
>> haven't changed between qcs8300 and sa8775p.
>>
>> Can you please let me know which entries you find irrelevant here?
> Well, I'm particularly unsure about CX_GMU and the HUB clocks.
> I >>don't think<< they don't have much to do with the SMMU, but please
> check internally with someone who knows for sure
I checked internally and found that these clocks are required for gpu 
smmu operations
as we don't use interconnect voting mechanism here as we do downstream. 
Hence the
list of clocks is same across all targets using gpu smmu as described in 
[1] previously.
> Konrad

-- 
Thanks and Regards
Pratyush Brahma


