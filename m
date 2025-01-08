Return-Path: <linux-arm-msm+bounces-44363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3907EA05B0E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE26A1888D57
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E928A1F8F19;
	Wed,  8 Jan 2025 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d/GQi6dW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FE01F8AE0;
	Wed,  8 Jan 2025 12:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736338226; cv=none; b=feRJY67bfn1FbmipLB1bDVZvjtjUtbTA0hRyu00hpWqNSHwJk8/oX8DAIrZvFDwuS5zCWXq+DTeUdFsi8pWULxJQlLk9c3+pP2MRKyZtErsIxIt1O7+SwH7QpVCjsqQw1n6q7lXRcNBRUUu/SHBGJveAgYOsmd/0EkvIwI0BC8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736338226; c=relaxed/simple;
	bh=7v6VJpeD1AHjtiI+PW6xiSL0EBTcYgEqbMYj30hmRf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=I0TO/p3xGEVfJ+AqWoeBJHn2dTC6SrdO8TdWNcId4VM3sJxs3wo8G5S9EEw1VKyU39EY0+T0Ru2vJz0D0FxmWHexgzxSro0e2+CdKMoPCXWKTgB3TQLHWnxmzo8Kgi5TZYYodMj5GxHwZbc7BRk4z/oBSeZwJlhRyVvbx+M+GXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d/GQi6dW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BkW7p011537;
	Wed, 8 Jan 2025 12:10:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wbi1dn1BaW4RjtF4+vYEtqjtJxT1Sw34X55ioOywDs=; b=d/GQi6dW4FKa35HK
	RWJSqSTZcN+ZY9/MhVLRf/mCJDm7mUfvjnWnfWRn5r5BiRXKMc7V4tXyg7VXKS6V
	WlhG908RYyyDqkosW8/VydtUZiqaqPHxtlpRObKo0sKOdpTkl1rIZD1tKzj1MAoR
	Az/MH2hgHg8vX38g48KkWQrHx9luj6QZMXQUAJIEYlbIyiIOlHZiKkZ23qLpY6/1
	0WWnhSAA1+XhKvk4xKIPFNfgtgIifVjw4vw/7YxuowMcJRh8GcF7SE5PJU57qDXz
	/Sq+n/Hd80vKk9q36Zmk+Xi3cXyHkxbGs/8ljy8pMvdjiNTQPJMPoKLOkAO5tOQo
	iHXLgw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441ppn0dtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 12:10:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508CALNh003045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 12:10:21 GMT
Received: from [10.219.57.57] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 8 Jan 2025
 04:10:18 -0800
Message-ID: <e7abe34c-9df9-425b-933e-cc744a63b80c@quicinc.com>
Date: Wed, 8 Jan 2025 17:40:09 +0530
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
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241227110024.30203-1-quic_pbrahma@quicinc.com>
 <1c8af731-c551-4d72-84a0-f14d57bec4ec@oss.qualcomm.com>
Content-Language: en-US
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
In-Reply-To: <1c8af731-c551-4d72-84a0-f14d57bec4ec@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YoQtExhHSDPmSlFymms8lJD3RJu8-Ahl
X-Proofpoint-ORIG-GUID: YoQtExhHSDPmSlFymms8lJD3RJu8-Ahl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=856 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080099


On 12/30/2024 6:49 PM, Konrad Dybcio wrote:
> On 27.12.2024 12:00 PM, Pratyush Brahma wrote:
>> Add the device node for gfx smmu that is required for gpu
>> specific address translations.
>>
>> This patch depends on the patch series [1] posted by Imran Shaik
>> adding the clock support for gpu.
>>
>> [1] https://lore.kernel.org/all/802d32f1-ff7e-4d61-83f1-f804ee1750ed@oss.qualcomm.com/
>>
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
> Most of these entries look totally bogus, please make sure you only
> reference the ones actually required
These entries are exactly similar to the ones we use in sa8775p as well 
[1] and the usecases
haven't changed between qcs8300 and sa8775p.

Can you please let me know which entries you find irrelevant here?

[1] commit 1a1ff00c1626c "arm64: dts: qcom: sa8775p: add the GPU IOMMU node"

>
> Konrad

-- 
Thanks and Regards
Pratyush Brahma


