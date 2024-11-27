Return-Path: <linux-arm-msm+bounces-39285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F367A9DA539
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 10:57:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B51062825D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 09:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08911946A0;
	Wed, 27 Nov 2024 09:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gYnJ4UEt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E0A6A8D2;
	Wed, 27 Nov 2024 09:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732701432; cv=none; b=rzfO23B0u2jAUHVCH2sJEUxCrn+KNeiLCBQiYCNKEFP9+COw90oc0leDEub5e/xE0ps8MI5wehoSwGo2zdxDn1vzHZ2Cxl0wKgeKKPHFYhFT/Oiah7vW+YgqKxb+8dccekP3t51FVwwViI929v6V6TY15iDwkcjip53XyY2BZuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732701432; c=relaxed/simple;
	bh=piY6NVUpel+wRUEZs6EFQ1GXhVd8+X8WGGcAIQ5rvhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WCYtzftH+bp8W/rFre/kJxlfH/W1T2FZ8grOgrrkapSKfMZ00ccrQEgkjLhN1GOBODt0gpdYUBkJrOhimeTgiQ38Q+AHfjLfQO94b2l8tuBUHQ1n5bvhUR5UfDj51mlxknDAcN3rd7untH700EN97L/OITHdkCJ2/fG1PMEMyjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gYnJ4UEt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AR9JE1J006025;
	Wed, 27 Nov 2024 09:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IE5v750NhfcBCh+HTstqz8SDcyR6ATb9vcpl8k+7QvQ=; b=gYnJ4UEtWpzjKNm4
	k6o4zGbeBYs6LrJADAxNpAg7yL2mT7WaHFcOGJW61gpZm9Dvi+8bO2fw1H47zUyU
	mpxSvo9aMvZYBVaciA0nMxhzK2ZjNkGKka6i5FLfaNDE8zUYTaQlGKoqSIicuV9j
	hFcZTBAdVlZaBrXsK5P41uu68j4lm1Yu29TI4w7urJnvcvVstks1s+Fn4pfGmfQi
	qwj4wdc6kBP+2ZHCHGiTFMOFSddS+kQ76mYYRfcq+0aaV67hoWdeKaNxqYAe9Lv2
	7o7k03Z5uQI81ispFKU4iijf7mRmSS5jEkREf5iZyG7onv71+PqTMHCtK4tGEyAq
	b3mXig==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 434ts1p2pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 09:56:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AR9uw5D001804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Nov 2024 09:56:58 GMT
Received: from [10.64.68.102] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 27 Nov
 2024 01:56:48 -0800
Message-ID: <b3fa1fa6-3ed5-4f4c-a3bb-607b06774cdb@quicinc.com>
Date: Wed, 27 Nov 2024 17:56:45 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcs8300: enable pcie0 for QCS8300
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <robh+dt@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <bhelgaas@google.com>,
        <kw@linux.com>, <lpieralisi@kernel.org>, <quic_qianyu@quicinc.com>,
        <conor+dt@kernel.org>, <neil.armstrong@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>
CC: <quic_shashim@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_tdas@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <quic_aiquny@quicinc.com>, <kernel@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>
References: <20241114095409.2682558-1-quic_ziyuzhan@quicinc.com>
 <20241114095409.2682558-5-quic_ziyuzhan@quicinc.com>
 <a02925d7-2d09-4902-97e4-5e7f09d7ef21@oss.qualcomm.com>
Content-Language: en-US
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
In-Reply-To: <a02925d7-2d09-4902-97e4-5e7f09d7ef21@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tTg52swv73q9BIT9C6iEByOmYqdiO0Sv
X-Proofpoint-ORIG-GUID: tTg52swv73q9BIT9C6iEByOmYqdiO0Sv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411270082


On 11/14/2024 9:02 PM, Konrad Dybcio wrote:
> On 14.11.2024 10:54 AM, Ziyue Zhang wrote:
>> Add configurations in devicetree for PCIe0, including registers, clocks,
>> interrupts and phy setting sequence.
>>
>> Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
>> ---
>>   arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  44 +++++-
>>   arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 176 ++++++++++++++++++++++
> This implies this patch should be two separate ones
>
>
> [...]
>
>
>> +&tlmm {
>> +	pcie0_default_state: pcie0-default-state {
>> +		perst-pins {
>> +			pins = "gpio2";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-pull-down;
>> +		};
>> +
>> +		clkreq-pins {
>> +			pins = "gpio1";
>> +			function = "pcie0_clkreq";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
>> +		};
>> +
>> +		wake-pins {
>> +			pins = "gpio0";
> Sorting these in an increasing order would be welcome
>
>
>>   
>> +		pcie0: pci@1c00000 {
>> +			compatible = "qcom,pcie-qcs8300","qcom,pcie-sa8775p";
> Missing ' ' after ','
>
>> +			reg = <0x0 0x01c00000 0x0 0x3000>,
>> +			      <0x0 0x40000000 0x0 0xf20>,
>> +			      <0x0 0x40000f20 0x0 0xa8>,
>> +			      <0x0 0x40001000 0x0 0x4000>,
>> +			      <0x0 0x40100000 0x0 0x100000>,
>> +			      <0x0 0x01c03000 0x0 0x1000>;
>> +
>> +			reg-names = "parf",
>> +				    "dbi",
>> +				    "elbi",
>> +				    "atu",
>> +				    "config",
>> +				    "mhi";
>> +
>> +			device_type = "pci";
> Please try to match the style in x1e80100, it's mostly coherent but
> things like newlines differ, which is tiny but mildly annoying
>
>> +
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
>> +				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
> Looks like there's a bit more space in there
>> +			bus-range = <0x00 0xff>;
>> +
>> +			dma-coherent;
>> +
>> +			linux,pci-domain = <0>;
>> +			num-lanes = <2>;
>> +
>> +			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			interrupt-names = "msi0",
>> +					  "msi1",
>> +					  "msi2",
>> +					  "msi3",
>> +					  "msi4",
>> +					  "msi5",
>> +					  "msi6",
>> +					  "msi7";
> Please also add a "global" interrupt.. looks like it's GIC_SPI 166, but
> please confirm
> okay
>> +
>> +			#interrupt-cells = <1>;
>> +			interrupt-map-mask = <0 0 0 0x7>;
>> +			interrupt-map = <0 0 0 1 &intc GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 2 &intc GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 3 &intc GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 4 &intc GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
>> +				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
>> +				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>;
>> +
>> +			clock-names = "aux",
>> +				      "cfg",
>> +				      "bus_master",
>> +				      "bus_slave",
>> +				      "slave_q2a";
>> +
>> +			assigned-clocks = <&gcc GCC_PCIE_0_AUX_CLK>;
>> +			assigned-clock-rates = <19200000>;
>> +
>> +			interconnects = <&pcie_anoc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
> QCOM_ICC_TAG_ALWAYS
> okay
>> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
> QCOM_ICC_TAG_ACTIVE_ONLY
>
> [...]
> okay
>> +
>> +			pcieport0: pcie@0 {
>> +				device_type = "pci";
>> +				reg = <0x0 0x0 0x0 0x0 0x0>;
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				ranges;
>> +				bus-range = <0x01 0xff>;
>> +			};
> Are you going to use this? If not, please drop

its required by wlan driver we need it

BRs

Ziyue

>
>> +		};
>> +
>> +		pcie0_phy: phy@1c04000 {
>> +			compatible = "qcom,qcs8300-qmp-gen4x2-pcie-phy";
>> +			reg = <0x0 0x1c04000 0x0 0x2000>;
>> +
>> +			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
> This clock goes to the RC, it should be _PHY_AUX (which you put below
> as phy_aux), please replace it.
> will do it
>> +				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
>> +				 <&gcc GCC_PCIE_CLKREF_EN>,
>> +				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
>> +				 <&gcc GCC_PCIE_0_PIPE_CLK>,
>> +				 <&gcc GCC_PCIE_0_PIPEDIV2_CLK>,
>> +				 <&gcc GCC_PCIE_0_PHY_AUX_CLK>;
>> +
>> +			clock-names = "aux",
>> +				      "cfg_ahb",
>> +				      "ref",
>> +				      "rchng",
>> +				      "pipe",
>> +				      "pipediv2",
>> +				      "phy_aux";
> Konrad

