Return-Path: <linux-arm-msm+bounces-39816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1669DFDF9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:00:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A4C228208D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94451FA147;
	Mon,  2 Dec 2024 10:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m8NKRSXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF3915A8;
	Mon,  2 Dec 2024 10:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733133641; cv=none; b=r1dORd/54cIIUIxaG4qAxurBnMCJV0Dr3mRzlhBwN29f6sBNW30bppvyiC0sCiSDtNf3GZakAgq059FPLTuROR4Qbdmf+8m/bi3CcEch9Aj5y1mYaQ99AcB0iGO0SZgxT2pX2XymBVqNwHmPreM6mLrbcksYg1/3fOC1eg2NbxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733133641; c=relaxed/simple;
	bh=icZCGmtk1DzL9HBbjQGZeFbvR7o/kKnLVv3vWsSW6Oo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NTZFMzmngGWfEF0N+UsE54ofKlgksvP3FXs746X3EeHxLUfOzoCTkllAPvMpq2HNjez8oTMSw2zKAETtLdzwvuRpiEexy40HhaXT/N5X4z6bw3oXFERem/fv/h+jS+f/uAOSrAPMhXQjP96/fW6BFAUDzSES6YLybr+rmNs5JAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m8NKRSXk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B29KcSo028211;
	Mon, 2 Dec 2024 10:00:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6PW9fOxBZRxPpo7YtTCol7KQG5Qyjq+kU1ABzjHmWuQ=; b=m8NKRSXkUqcs+Ryr
	dZqTr1BEhva2kvMDJ1Bu7988TVLvzYxsbwPSaqXbpHwSyLEfuvp6zIDkyTZBcUO6
	+L27esdZq5c1Z+AcufjQP0by//jZzGWzlxIBXE1cWS7Ksxncq58CF+LnwItiUcXf
	H3R7MhvEwYfcCKvOzz1NOzBShUelDiS/HZOWJclBe5m0vstGkWaStjK2dY1WLdc1
	IPpIwHvv+ojW+5jR6+jy1IsgTZDS0x22qTU4JsI5LSdbYTLfUHqc9MTvlODvz9kD
	6yX3VTV7bE6Y282OzmuCD0VEyJ3tNW1CCQPKFUb/trf20XqxT1DySgUCvS+G0fsw
	Ug+iVQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ufe4a69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 10:00:31 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2A0VFs031561
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 10:00:31 GMT
Received: from [10.233.21.53] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 2 Dec 2024
 02:00:28 -0800
Message-ID: <80b1a205-422f-4e6d-97e9-69ee335a31f8@quicinc.com>
Date: Mon, 2 Dec 2024 18:00:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: add QCS8300 platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-3-26aa8a164914@quicinc.com>
 <2a2a780d-5e3e-4582-b75d-211732a9b727@oss.qualcomm.com>
Content-Language: en-US
From: Jingyi Wang <quic_jingyw@quicinc.com>
In-Reply-To: <2a2a780d-5e3e-4582-b75d-211732a9b727@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HEOdVLP-gKj__kJ1q_HwxYOSaysqhkX_
X-Proofpoint-GUID: HEOdVLP-gKj__kJ1q_HwxYOSaysqhkX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020088



On 11/29/2024 4:14 AM, Konrad Dybcio wrote:
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
will separate into 2 clusters.
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
well noted.
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
well noted.
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
well noted.
> [...]
> 
>> +	arch_timer: timer {
> 
> Ditto
> 
well noted.
> Konrad

Thanks,
Jingyi

