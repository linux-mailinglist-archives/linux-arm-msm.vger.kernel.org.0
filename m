Return-Path: <linux-arm-msm+bounces-39814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D869DFDD3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CCCCB21B69
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C552C1FBCA2;
	Mon,  2 Dec 2024 09:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DX+ETSJy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067641FBC84;
	Mon,  2 Dec 2024 09:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733133302; cv=none; b=LbYp2rsI/flmZuvrTDWPNWueAziM4HK43sEinasvSIvU2on0yzLLHy7OQiuhsoCMHUBHkS0Ujoak4+MHnBkpLN0tbFjiOTDSeMFQq7jwHbIVGwZO3gh2w4jXjhopIp1jKJj46KbAviHtU+ZmGOey5MnAPYzGvdxDTcnJzFTFYmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733133302; c=relaxed/simple;
	bh=Nh03FhQFoZ1oQdBWoCjviICu57cYNqNKfHcnJ+0m7UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T9TOC/zlUFqgJJRI0ET/eOKbd3ye8i1sgmKsEYSUOmlnqIB1fNDrSfn9QltxEfwC2jgNth7RcDdoE8seoWzZeDsA8jNr407VH8K+0kqx8jHrB3Z0cUQ1LFZ+G/oKAVu3JoPdc8DVrOCKWeotMd78XD04XUsxHQn7/yWpEXshjhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DX+ETSJy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B28RKcM008726;
	Mon, 2 Dec 2024 09:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qc054gM7Bv2R/3/jFzj28NNSZl9oumKdCqduypG+yy4=; b=DX+ETSJy3vxKk52I
	fZSs2VwQ1mOluu2ygvYkpaatLNBNIdpRAzSlzWE++q/DFb7KtU4pYrkUzH09xN78
	8s21Cv+zBe4CcNqdC9/vrgrBEm6nODqWnIii+Mvtr4or3tQUHAyChYrqYb1v2ntQ
	6kLfW8eZls5L3m8r5a/AfvnaUWlFU2zM2TapS70UGxCTkFIsGTfSneg38ll9h+4v
	AZYgVOrXHU8MVEkggmpnYn5MjZijMPtwNiofIUZLuttpdhB5hcAvWryIc/BY8vLT
	ab55v2PTtCbHRFBfW6DTmqfxbA6D7drRbH2qgMOsdZrqZpFVyMR2uoFcIGYCDLBN
	hsbn0A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437u36ccp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 09:54:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B29soul023039
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 09:54:50 GMT
Received: from [10.64.68.72] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 01:54:46 -0800
Message-ID: <4c39e6f8-22d2-4568-9116-01294f85a283@quicinc.com>
Date: Mon, 2 Dec 2024 17:54:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: add QCS8300 platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-3-26aa8a164914@quicinc.com>
 <2a2a780d-5e3e-4582-b75d-211732a9b727@oss.qualcomm.com>
From: Xin Liu <quic_liuxin@quicinc.com>
In-Reply-To: <2a2a780d-5e3e-4582-b75d-211732a9b727@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sG6BpQ02kSGQrQNSp8cy4NXRDen06MUL
X-Proofpoint-ORIG-GUID: sG6BpQ02kSGQrQNSp8cy4NXRDen06MUL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 clxscore=1011 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412020087



在 2024/11/29 4:14, Konrad Dybcio 写道:
> On 28.11.2024 9:44 AM, Jingyi Wang wrote:
>> Add initial DTSI for QCS8300 SoC.
>>
>> Features added in this revision:
>> - CPUs with PSCI idle states
>> - Interrupt-controller with PDC wakeup support
>> - Timers, TCSR Clock Controllers
>> - Reserved Shared memory
>> - GCC and RPMHCC
>> - TLMM
>> - Interconnect
>> - QuP with uart
>> - SMMU
>> - QFPROM
>> - Rpmhpd power controller
>> - UFS
>> - Inter-Processor Communication Controller
>> - SRAM
>> - Remoteprocs including ADSP,CDSP and GPDSP
>> - BWMONs
>>
>> Written with help from Zhenhua Huang(added the smmu node), Xin Liu(added
>> ufs, adsp and gpdsp nodes), Tingguo Cheng(added the rpmhpd node), Kyle
>> Deng(added the aoss_qmp node), Raviteja Laggyshetty(added interconnect
>> nodes) and Cong Zhang(added the INTID of EL2 non-secure physical timer).
>>
>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
>> ---
> 
> [...]
> 
>> +		cpu-map {
>> +			cluster0 {
>> +				core0 {
>> +					cpu = <&cpu0>;
>> +				};
>> +
>> +				core1 {
>> +					cpu = <&cpu1>;
>> +				};
>> +
>> +				core2 {
>> +					cpu = <&cpu2>;
>> +				};
>> +
>> +				core3 {
>> +					cpu = <&cpu3>;
>> +				};
>> +
>> +				core4 {
>> +					cpu = <&cpu4>;
>> +				};
> 
> The MPIDR_EL1 register value (CPU node reg) suggests they are not
> part of the same cluster (as you confirmed in the psci idle domains
> description)
> 
> [...]
> 
>> +
>> +		ufs_mem_hc: ufs@1d84000 {
>> +			compatible = "qcom,qcs8300-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
>> +			reg = <0x0 0x01d84000 0x0 0x3000>;
>> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
>> +			phys = <&ufs_mem_phy>;
>> +			phy-names = "ufsphy";
>> +			lanes-per-direction = <2>;
>> +			#reset-cells = <1>;
>> +			resets = <&gcc GCC_UFS_PHY_BCR>;
>> +			reset-names = "rst";
>> +
>> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +
>> +			iommus = <&apps_smmu 0x100 0x0>;
>> +			dma-coherent;
>> +
>> +			interconnects = <&aggre1_noc MASTER_UFS_MEM 0
> 
> QCOM_ICC_TAG_ALWAYS, file-wide
> 
> [...]
> 
>> +		ufs_mem_phy: phy@1d87000 {
>> +			compatible = "qcom,qcs8300-qmp-ufs-phy", "qcom,sa8775p-qmp-ufs-phy";
>> +			reg = <0x0 0x01d87000 0x0 0xe10>;
>> +			/*
>> +			 * Yes, GCC_EDP_REF_CLKREF_EN is correct in qref. It
>> +			 * enables the CXO clock to eDP *and* UFS PHY.
>> +			 */
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>> +				 <&gcc GCC_EDP_REF_CLKREF_EN>;
> 
> Are you sure about this, or is this just copypasted from sa8775p?
Thank you for your comments. I confirm with the colleague responsible 
for this area, and configuring the clock this way is correct.
> 
> [...]
> 
>> +
>> +		intc: interrupt-controller@17a00000 {
>> +			compatible = "arm,gic-v3";
>> +			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */
>> +			      <0x0 0x17a60000 0x0 0x100000>;    /* GICR * 8 */
> 
> Drop these comments
> 
>> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
>> +			#interrupt-cells = <3>;
>> +			interrupt-controller;
>> +			#redistributor-regions = <1>;
>> +			redistributor-stride = <0x0 0x20000>;
>> +		};
>> +
>> +		memtimer: timer@17c20000 {
> 
> Unused label
> 
> [...]
> 
>> +	arch_timer: timer {
> 
> Ditto
> 
> Konrad


