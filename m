Return-Path: <linux-arm-msm+bounces-44365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC26A05B22
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:13:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 958891668DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:13:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEE41F8F16;
	Wed,  8 Jan 2025 12:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BRh3p/i7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E7B1F76C3;
	Wed,  8 Jan 2025 12:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736338402; cv=none; b=bbAGGb9yFPbz8kqdKx/HqeTYU4O5fhVZuzB8VhqsxAoK2vTrDTCcDvJSADD5932tC0O2xYEx6HFWiEG87aG23h6k/QX695bVAUETLIXGezZeB3Z0P5yr9B9DZOWTnNuKkNeb6KRrTLT11fVq3bSxo+nYkOu2VSAFHQC1CQH73W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736338402; c=relaxed/simple;
	bh=YsPBQ3E0ASSxV/GSZxKRqIgvMWIYsJO2oaJpavYp0J8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZojJqUJpbvjeToIyKf8XlnQaT+fJNgHusFbYDiFP58rUIW+8Wb2X/YIELuFnb6QUYO5x0aIQQEIguP0xlLJlqX/d/PGHTuybm6pBNaXCOg+WLICn0aXKRLMyWVCA0YO+id7Z/fLs3tXp7rWVA+jGHlTCQg4Cm/qTIEKbMlcMUKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BRh3p/i7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkTd0029426;
	Wed, 8 Jan 2025 12:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aMh+t18gQrKLkd2MQJomreIlFaS4QzSHKw4FstOCKVU=; b=BRh3p/i7LAzHlKRe
	74G4xFEkd2wYUFWllWagAsrk38lAVcnQuNEOb9ZxIKiY7GtcStxIjB7S5/mCIEQL
	UvKyn/D1J2H5x3BWFsjXEI0djF4TrijOxYfeGZACMeHr6GFD1fBNrmYlJKycy/uv
	sfMvgq8xteCPNzDqZR0Q/tnf7MT2buVbCXQkndzqa6/Vw1NNbYM354c6UIPYzRBC
	Y/hglrR8EVk+J7HrhNF0LNEVXIaI+YWCTTPeaJoy7Wd5wUfNloOU8G9EfKjWI0U1
	XQpTi8iPyoPJP7WozYUPjZKuqjXu0L0z3Uj5CAEohrQkLuXHfpSUw/pvJ0rEDCk+
	yuELdA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441ms8rrjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 12:13:17 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508CDGpa006505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 12:13:16 GMT
Received: from [10.219.57.57] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 04:13:14 -0800
Message-ID: <18327fca-2c9e-4b33-8085-270cd2c29aa4@quicinc.com>
Date: Wed, 8 Jan 2025 17:43:11 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: qcs8300: Add device node for
 gfx_smmu
To: Bjorn Andersson <andersson@kernel.org>
CC: <konradybcio@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241227110024.30203-1-quic_pbrahma@quicinc.com>
 <64ak7h5pwqinmcymas5i4xexa6bntvti7zkwfhzx7qrsmgaow3@zmn7jffcrp5f>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <64ak7h5pwqinmcymas5i4xexa6bntvti7zkwfhzx7qrsmgaow3@zmn7jffcrp5f>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: t5TbF3v8GW2b-3XMqRm-mFYPsn9XjjnF
X-Proofpoint-GUID: t5TbF3v8GW2b-3XMqRm-mFYPsn9XjjnF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=879 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080100


On 12/28/2024 9:05 AM, Bjorn Andersson wrote:
> On Fri, Dec 27, 2024 at 04:30:24PM +0530, Pratyush Brahma wrote:
>> Add the device node for gfx smmu that is required for gpu
>> specific address translations.
>>
>> This patch depends on the patch series [1] posted by Imran Shaik
>> adding the clock support for gpu.
>>
>> [1] https://lore.kernel.org/all/802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com/
> It's over a month since Konrad rejected that patch so you're just
> wasting out time sending this to the list.
>
> Further, this dependency has no value in the git history, and as such it
> should not be mentioned in the commit message, but rather under the
> '---' line.
>
> Lastly, you sent this same patch both as part of a series and then
> alone, within 2 minutes. go/upstream has instructions on how to use b4
> instead of making these manual mistakes.
>
>
> PS. Just to be clear, either make sure this patch is sent together with
> the next version of [1], or wait for that to have become available in
> linux-next before resubmitting it.
I see the patch [1] has been merged now [2]. Will resend another version 
of this on top of
the merged commit using b4.

[2] 
https://lore.kernel.org/all/173631205044.113795.272368168541784140.b4-ty@kernel.org/

>
> Regards,
> Bjorn
>
>> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi | 37 +++++++++++++++++++++++++++
>>   1 file changed, 37 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> index 80226992a65d..8eb688e2df0a 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
>> @@ -816,6 +816,43 @@
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		adreno_smmu: iommu@3da0000 {
>> +			compatible = "qcom,qcs8300-smmu-500", "qcom,adreno-smmu",
>> +				   "qcom,smmu-500", "arm,mmu-500";
>> +			reg = <0x0 0x3da0000 0x0 0x20000>;
>> +			#iommu-cells = <2>;
>> +			#global-interrupts = <2>;
>> +			dma-coherent;
>> +
>> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
>> +			clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
>> +				 <&gpucc GPU_CC_AHB_CLK>,
>> +				 <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
>> +				 <&gpucc GPU_CC_CX_GMU_CLK>,
>> +				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
>> +				 <&gpucc GPU_CC_HUB_AON_CLK>;
>> +			clock-names = "gcc_gpu_memnoc_gfx_clk",
>> +				      "gcc_gpu_snoc_dvm_gfx_clk",
>> +				      "gpu_cc_ahb_clk",
>> +				      "gpu_cc_hlos1_vote_gpu_smmu_clk",
>> +				      "gpu_cc_cx_gmu_clk",
>> +				      "gpu_cc_hub_cx_int_clk",
>> +				      "gpu_cc_hub_aon_clk";
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
>> +		};
>> +
>>   		pmu@9091000 {
>>   			compatible = "qcom,qcs8300-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
>>   			reg = <0x0 0x9091000 0x0 0x1000>;
>> -- 
>> 2.17.1
>>
-- 
Thanks and Regards
Pratyush Brahma


