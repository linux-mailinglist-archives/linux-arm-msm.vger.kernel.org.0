Return-Path: <linux-arm-msm+bounces-47415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 295A5A2EB20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 12:32:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C37863A7F31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 11:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EF01E260A;
	Mon, 10 Feb 2025 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="I1nw7tqi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D9D1DEFFC;
	Mon, 10 Feb 2025 11:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187113; cv=none; b=jXHfYrCkl96OQIMUDux4Fzero4iGpdUBLgjZk4U1KDTmOKKx0EceKUJH3PY29KfdnxdbIULZHjyyzNjFQbpW1dVViH25HmwlrH1IpMqm3DN33+e3XFSzuLhz3M+8ZM73wpRihaRB17r5jf/87lhIz4IRCrKF6BIWAjtdJhv+lbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187113; c=relaxed/simple;
	bh=lHfVa4WaezjaNaPZ+xqar2iWP4d9jh7xMhWtcE8W7mQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Zzmx/G65jRR2/jfqUWVJejAfdIxzxOqGoX8XMx02owi0r9pmaX6PxhPZq2zw35YnuqCJEi2cPHzyT+F/jd8bH8rB9N/8wJC2tNa71+xTMKbzZqzJOp3Qs6wrTPBqNB9ZZTILuxV6B+YhlGGldU+KARCEAz/Xv9B7SM45SWdshYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=I1nw7tqi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A75xOs010163;
	Mon, 10 Feb 2025 11:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DX94Y1DLftOcH76cc/D2dTQlv3D9/SsCUAFkAr8Sem8=; b=I1nw7tqiz/kFxhle
	Holws7trVi6BbmPtbdZWtxDXO1BYTSZYNzA6vQX6lyPfjqpMGFS8TaxpIqaPB9pS
	r+F6220WPsqkv5A6PeAfjP8HaEjV16ol5TChfvLQXyuW9+0lbtncAgLwNes/Y8Yl
	L+LHCj5IoMnNPgMCNJza9rwcrPQ7MuwvlvruR13buTflMezkp90Bs1C4xEnHSsCs
	rn8dFMFO72BhMpf2fae4LYcQJ13YrcGnq4kGhOK70rxKYJxIgMUnml7Z2vCX/npH
	UBC0vUf0AyyGf935f+62qdKw6m+pbQLXZ59TWMeiIAHc0kP8wXSRHfUKf6j5+u4O
	4C9b7A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qcs58sem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 11:31:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51ABVdQB028977
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 11:31:39 GMT
Received: from [10.216.18.35] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Feb
 2025 03:31:35 -0800
Message-ID: <6ddda82b-d90c-4f16-a1e5-1a63fca7aba2@quicinc.com>
Date: Mon, 10 Feb 2025 17:01:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg
 Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
 <20250203-b4-branch-gfx-smmu-v4-2-eaa7aa762f48@quicinc.com>
 <464vbzwgv44fn4iw5vj5yzpstzhcsb7rzuedf4fwl23hmdhews@d4q33ro6hxq3>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <464vbzwgv44fn4iw5vj5yzpstzhcsb7rzuedf4fwl23hmdhews@d4q33ro6hxq3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1FNwXa16gvd1MBf64JJ-2x1HySUAS9rq
X-Proofpoint-GUID: 1FNwXa16gvd1MBf64JJ-2x1HySUAS9rq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_06,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxlogscore=946 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 adultscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502100097


On 2/10/2025 4:31 PM, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 11:17:02AM +0530, Pratyush Brahma wrote:
>> Add the device node for gfx smmu that is required for gpu
>> specific address translations.
>>
>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 39 +++++++++++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index 4a057f7c0d9fae0ebd1b3cf3468746b382bc886b..7a8211bec139375b5aab939f123d88fca7aceff2 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -2674,6 +2674,45 @@ gpucc: clock-controller@3d90000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		adreno_smmu: iommu@3da0000 {
>> +			compatible = "qcom,qcs8300-smmu-500", "qcom,adreno-smmu",
>> +				     "qcom,smmu-500", "arm,mmu-500";
>> +			reg = <0x0 0x3da0000 0x0 0x20000>;
>> +			#iommu-cells = <2>;
>> +			#global-interrupts = <2>;
>> +
>> +			interrupts = <GIC_SPI 672 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
>> +				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
>> +				 <&gpucc GPU_CC_AHB_CLK>,
>> +				 <&gpucc GPU_CC_HUB_AON_CLK>;
>> +
>> +			 clock-names = "gcc_gpu_memnoc_gfx_clk",
> Stray whitespace after the Tab symbol
>
>> +				       "gcc_gpu_snoc_dvm_gfx_clk",
>> +				       "gpu_cc_ahb_clk",
>> +				       "gpu_cc_hlos1_vote_gpu_smmu_clk",
>> +				       "gpu_cc_cx_gmu_clk",
>> +				       "gpu_cc_hub_cx_int_clk",
>> +				       "gpu_cc_hub_aon_clk";
> clocks and clock-names do not match.
>
>> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>> +			dma-coherent;
>> +		};
>> +
>>   		pmu@9091000 {
>>   			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
>>   			reg = <0x0 0x9091000 0x0 0x1000>;
>>
>> -- 
>> 2.34.1
>>
Thanks for checking. Will address these in next version.

-- 
Thanks and Regards
Pratyush Brahma


