Return-Path: <linux-arm-msm+bounces-47243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A66CEA2D845
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 20:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADF2F1883C27
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Feb 2025 19:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D79C91F3BB8;
	Sat,  8 Feb 2025 19:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e2dWfyZi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0974D241123;
	Sat,  8 Feb 2025 19:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739042315; cv=none; b=kkxftXdm34DVwGTIAhRXPb8nALQ3z/QVBMH5/XJfky1IWk2xl+8B7URn8jaXeTQBl6FjOh/CsfXIPFUkv4vRzBzwY96LRV7oJeRUBjgjGM2I2gWBFOwqCgteOy+UdIUP7EGDiYNzOJdPb02sczWEWWQHmJTk/eAbU+UD+K0gQJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739042315; c=relaxed/simple;
	bh=06YsivD9cPlw1p3NS3iYiNBnIeE6ip0XuydpWe4ZnRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nDYy+veaEd7A0UjRhdN3lRG81uqBK8SrwLjaUJV75CASKnfaVHXXtfOL0hnix5GPAUnPw7BWnRD15xOFrpvQCQD+X6M800yA+fU1x29YPbofpvKmNpl6/Iw+ZvoqlmamDSWC3QdBrlK9a7/prU9MqOWKQCSi1Eiyyrd/Wf3jMg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e2dWfyZi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518JHspA014951;
	Sat, 8 Feb 2025 19:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N9IY6xAkgcl+dzkucgeRtwv5Q9qiGeswZuCATj1aeE4=; b=e2dWfyZi5vSyMQbD
	r5ya7xsAnuOUAJE2RKs6tp09Xg9FrPDyB9cDcPTbBL4F2P81CE1AJUy01+BNm9Rk
	Fe2Ea3PVRKA2TBlzlok9Ff8A4QkKJb2Kp8qZBgJCfCu2FYV+AnwbR4mp/9CISKpN
	wov50/JVzqlAsc9XVsyiXla8H33NoS7rsiJD/sivWYNbvlUjuMLhnoBHZ6SMCsX4
	X7o/wbsNAFxPArcRAT45VSAfrgTRBqqcuk9x+Ro1HP+GEO45JgGS+CK7rbcn4OWa
	nQu98ffvTx0XzJabDUwd8lGDmXUeVtzT2Wn8GjG2/ru42dM/R6nOeUaNcja+xkv5
	d2CA4g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dx93d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 19:18:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 518JI8gX002434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 8 Feb 2025 19:18:09 GMT
Received: from [10.216.46.73] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 8 Feb 2025
 11:18:00 -0800
Message-ID: <be8a4f65-3b36-4740-a4f7-312126cfd547@quicinc.com>
Date: Sun, 9 Feb 2025 00:47:56 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750
 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
CC: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        Manish Pandey <quic_mapa@quicinc.com>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <20250113-sm8750_ufs_master-v1-4-b3774120eb8c@quicinc.com>
 <vifyx2lcaq3lhani5ovmxxqsknhkx24ggbu7sxnulrxv4gxzsk@bvmk3znm2ivl>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <vifyx2lcaq3lhani5ovmxxqsknhkx24ggbu7sxnulrxv4gxzsk@bvmk3znm2ivl>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H7MMEz91xnntvLV_dF1Nb-28qP3oy1uj
X-Proofpoint-ORIG-GUID: H7MMEz91xnntvLV_dF1Nb-28qP3oy1uj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_08,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502080163



On 1/14/2025 4:22 PM, Dmitry Baryshkov wrote:
> On Mon, Jan 13, 2025 at 01:46:27PM -0800, Melody Olvera wrote:
>> From: Nitin Rawat <quic_nitirawa@quicinc.com>
>>
>> Add UFS host controller and PHY nodes for SM8750 SoC.
>>
>> Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
>> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8750.dtsi | 81 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..20690c102244b337847a6482dd83c37e19746de9 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -13,6 +13,7 @@
>>   #include <dt-bindings/power/qcom,rpmhpd.h>
>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>   #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>> +#include <dt-bindings/gpio/gpio.h>
>>   
>>   / {
>>   	interrupt-parent = <&intc>;
>> @@ -1939,6 +1940,86 @@ mmss_noc: interconnect@1780000 {
>>   			#interconnect-cells = <2>;
>>   		};
>>   
>> +		ufs_mem_phy: phy@1d80000 {
>> +			compatible = "qcom,sm8750-qmp-ufs-phy";
>> +			reg = <0x0 0x01d80000 0x0 0x2000>;
>> +
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
>> +				 <&tcsrcc TCSR_UFS_CLKREF_EN>;
>> +			clock-names =	"ref",
>> +					"ref_aux",
>> +					"qref";
>> +
>> +			resets = <&ufs_mem_hc 0>;
>> +			reset-names = "ufsphy";
>> +
>> +			power-domains = <&gcc GCC_UFS_MEM_PHY_GDSC>;
>> +
>> +			#clock-cells = <1>;
>> +			#phy-cells = <0>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>> +		ufs_mem_hc: ufs@1d84000 {
>> +			compatible = "qcom,sm8750-ufshc", "qcom,ufshc", "jedec,ufs-2.0";
>> +			reg = <0x0 0x01d84000 0x0 0x3000>;
>> +
>> +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
>> +				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
>> +				 <&gcc GCC_UFS_PHY_AHB_CLK>,
>> +				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
>> +				 <&rpmhcc RPMH_LN_BB_CLK3>,
>> +				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
>> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
>> +				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
>> +			clock-names = "core_clk",
>> +				      "bus_aggr_clk",
>> +				      "iface_clk",
>> +				      "core_clk_unipro",
>> +				      "ref_clk",
>> +				      "tx_lane0_sync_clk",
>> +				      "rx_lane0_sync_clk",
>> +				      "rx_lane1_sync_clk";
>> +			freq-table-hz = <100000000 403000000>,
>> +					<0 0>,
>> +					<0 0>,
>> +					<100000000 403000000>,
>> +					<100000000 403000000>,
>> +					<0 0>,
>> +					<0 0>,
>> +					<0 0>;
> 
> Use OPP table instead

Currently, OPP is not enabled in the device tree for any previous 
targets. I plan to enable OPP in a separate patch at a later stage. This 
is because there is an ongoing patch in the upstream that aims to enable 
multiple-level clock scaling using OPP, which may introduce changes to 
the device tree entries. To avoid extra efforts, I intend to enable OPP 
once that patch is merged.
Please let me know if you have any concerns.


> 
>> +
>> +			resets = <&gcc GCC_UFS_PHY_BCR>;
>> +			reset-names = "rst";
>> +
>> +
>> +			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>> +					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
>> +					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
> 
> Shouldn't cpu-ufs be ACTIVE_ONLY?

As per ufs driver implementation, Icc voting from ufs driver is removed 
as part of low power mode (suspend or clock gating) and voted again in 
resume/ungating path. Hence TAG_ALWAYS will have no power concern.
All previous targets have the same configuration.

Thanks,
Nitin


> 
>> +			interconnect-names = "ufs-ddr",
>> +					     "cpu-ufs";
>> +
>> +			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
>> +			required-opps = <&rpmhpd_opp_nom>;
>> +
>> +			iommus = <&apps_smmu 0x60 0>;
>> +			dma-coherent;
>> +
>> +			lanes-per-direction = <2>;
>> +
>> +			phys = <&ufs_mem_phy>;
>> +			phy-names = "ufsphy";
>> +
>> +			#reset-cells = <1>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>>   		tcsr_mutex: hwlock@1f40000 {
>>   			compatible = "qcom,tcsr-mutex";
>>   			reg = <0x0 0x01f40000 0x0 0x20000>;
>>
>> -- 
>> 2.46.1
>>
> 


