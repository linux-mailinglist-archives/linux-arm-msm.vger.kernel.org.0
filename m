Return-Path: <linux-arm-msm+bounces-71066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB16B393E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 08:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01695687047
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 06:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12BB2494FE;
	Thu, 28 Aug 2025 06:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="juskHd96"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A7F2557A;
	Thu, 28 Aug 2025 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756362940; cv=none; b=lIoMpxU7xOLk0ZlPlpDZGrXPo0CRtTsMU+NhJ+YWvoMuo1Gnbc8CvxjCHtucacnUIUvYbb07TGBZF6eaBIqTiX5djq/mWOgtxIbEXV1WYCQ/TgTil/6RoTstWyq9bzzH/O+9w9gW4EwgwlcCrJvdEJbbxku4DpM9R3plrJnB3OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756362940; c=relaxed/simple;
	bh=D7Wsx+YmElZk2nSTwxSXIyDTgyzPKmxATkQYpF/FD5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rQGwUcsOQMttxtk1kqmoF8ZUjXgY6Tvw2LyuA4jG6Mh6SbQw8WaDh7ahz5qmzdl+4CyGAzM6tdT5IG0PqNtpluypEqyoV17WlbIbzF0InZ8qPeWrkG1kcVZfLLVQK+5OQGY2JXrtefeA88hRJSvDp3cbsdLW40P20CX8PAq1JT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=juskHd96; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RNR329005840;
	Thu, 28 Aug 2025 06:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AmP5/BXSlc7TfPFm8n2LKx+TMYlFAAXd8EtzdB20D7k=; b=juskHd96uo7Ndkf/
	5ovOseu1AlpknGRAVBds1Ld6xiZBH6vZiHrE5whcWyhIpTM0goDZ4xEmPttv4vwO
	8REYXVglrqeUas4pLIUctUwAV1yoP9caBO7Fziak+8g/32A07F1p4mD1akVD4z8/
	5EjuNj5AJrRZyh+SayvlKa2owmpQDHn+Sk4aPjaNElRTSYO931cy76KyIrlOK2Nr
	5D0vpsO+VQXco/EVd4n4YRKTw0qVMou5YD+tiSlkEu35i6uYSkVTN03/F4FA5xCF
	ylO3OvvJWVWZWXK+Ngp+rsDdQIoDnSrrMQQW3yHen651qB0R+8uC8oqXBuIMu9ES
	lMgq4Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpggxd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:35:32 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57S6ZV8e010922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:35:31 GMT
Received: from [10.218.18.194] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 27 Aug
 2025 23:35:24 -0700
Message-ID: <25ea5786-1005-43e0-8985-04182d018aa0@quicinc.com>
Date: Thu, 28 Aug 2025 12:05:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: lemans-evk: Extend peripheral and
 subsystem support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wasim Nazir
	<wasim.nazir@oss.qualcomm.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, <kernel@oss.qualcomm.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <netdev@vger.kernel.org>,
        Viken Dadhaniya
	<viken.dadhaniya@oss.qualcomm.com>,
        Nirmesh Kumar Singh
	<quic_nkumarsi@quicinc.com>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>,
        Mohd Ayaan Anwar
	<quic_mohdayaa@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Vishal Kumar Pal
	<quic_vispal@quicinc.com>,
        <krishna.chundru@oss.qualcomm.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-3-08016e0d3ce5@oss.qualcomm.com>
 <kycmxk3qag7uigoiitzcxcak22cewdv253fazgaidjcnzgzlkz@htrh22msxteq>
Content-Language: en-US
From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
In-Reply-To: <kycmxk3qag7uigoiitzcxcak22cewdv253fazgaidjcnzgzlkz@htrh22msxteq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lAOC_ct_E1SmZ15DT20wAkdshIBbrsR5
X-Proofpoint-ORIG-GUID: lAOC_ct_E1SmZ15DT20wAkdshIBbrsR5
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68aff8b5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=rEvOE1C9dwyv97nfEU0A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX0wMgkEpBAOXU
 fqL/yr6KletEM2IovlsIDP1jdLMuCeODPY+PMyKOW2ssJG/S+RAEpN7allBP8v7gu3X5ThBJ4x4
 8MvKGs5H7egThyqmUHrsfwEJk4qN3hnzAXC01XZ9iayrv83O6fPuf1hqZvKAqa7huNswG6bazsQ
 gnsV/ONIffrzVDWhekDSYgqUCYu1FgthPc3YH11g+tsBWmZ1uHtlU6OGhaYz+z1NEtQGLyFA6tO
 SGhRg3zBKmTYHvAQA972KGaQndlnsDNt38u7mKv92UKncmSU4NbNQhIKWXammQjheiomXDDJTMd
 uSsSER/ALR9GpOTZML84iINH+2ctwrc84EQWBYXq3yCmO6wu0Y0DPKCvFQHa1xz+a99pyfTqx8E
 rpH+lsZw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1011 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199


On 8/27/2025 7:05 AM, Dmitry Baryshkov wrote:
> On Tue, Aug 26, 2025 at 11:51:02PM +0530, Wasim Nazir wrote:
>> Enhance the Qualcomm Lemans EVK board file to support essential
>> peripherals and improve overall hardware capabilities, as
>> outlined below:
>>    - Enable GPI (Generic Peripheral Interface) DMA-0/1/2 and QUPv3-0/2
>>      controllers to facilitate DMA and peripheral communication.
>>    - Add support for PCIe-0/1, including required regulators and PHYs,
>>      to enable high-speed external device connectivity.
>>    - Integrate the TCA9534 I/O expander via I2C to provide 8 additional
>>      GPIO lines for extended I/O functionality.
>>    - Enable the USB0 controller in device mode to support USB peripheral
>>      operations.
>>    - Activate remoteproc subsystems for supported DSPs such as Audio DSP,
>>      Compute DSP-0/1 and Generic DSP-0/1, along with their corresponding
>>      firmware.
>>    - Configure nvmem-layout on the I2C EEPROM to store data for Ethernet
>>      and other consumers.
>>    - Enable the QCA8081 2.5G Ethernet PHY on port-0 and expose the
>>      Ethernet MAC address via nvmem for network configuration.
>>      It depends on CONFIG_QCA808X_PHY to use QCA8081 PHY.
>>    - Add support for the Iris video decoder, including the required
>>      firmware, to enable video decoding capabilities.
>>    - Enable SD-card slot on SDHC.
>>
>> Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> Co-developed-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
>> Signed-off-by: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
>> Co-developed-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
>> Signed-off-by: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
>> Co-developed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> Co-developed-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
>> Signed-off-by: Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>
>> Co-developed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
>> Co-developed-by: Monish Chunara <quic_mchunara@quicinc.com>
>> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
>> Co-developed-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
>> Signed-off-by: Vishal Kumar Pal <quic_vispal@quicinc.com>
>> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/lemans-evk.dts | 387 ++++++++++++++++++++++++++++++++
>>   1 file changed, 387 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> index 9e415012140b..642b66c4ad1e 100644
>> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
>> @@ -16,7 +16,10 @@ / {
>>   	compatible = "qcom,lemans-evk", "qcom,qcs9100", "qcom,sa8775p";
>>   
>>   	aliases {
>> +		ethernet0 = &ethernet0;
>> +		mmc1 = &sdhc;
>>   		serial0 = &uart10;
>> +		serial1 = &uart17;
>>   	};
>>   
>>   	chosen {
>> @@ -46,6 +49,30 @@ edp1_connector_in: endpoint {
>>   			};
>>   		};
>>   	};
>> +
>> +	vmmc_sdc: regulator-vmmc-sdc {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "vmmc_sdc";
> Non-switchable, always enabled?
>
>> +
>> +		regulator-min-microvolt = <2950000>;
>> +		regulator-max-microvolt = <2950000>;
>> +	};
>> +
>> +	vreg_sdc: regulator-vreg-sdc {
>> +		compatible = "regulator-gpio";
>> +
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <2950000>;
>> +		regulator-name = "vreg_sdc";
>> +		regulator-type = "voltage";
> This one also can not be disabled?
>
>> +
>> +		startup-delay-us = <100>;
>> +
>> +		gpios = <&expander1 7 GPIO_ACTIVE_HIGH>;
>> +
>> +		states = <1800000 0x1
>> +			  2950000 0x0>;
>> +	};
>>   };
>>   
>>   &apps_rsc {
>> @@ -277,6 +304,161 @@ vreg_l8e: ldo8 {
>>   	};
>>   };
>>   
>> +&ethernet0 {
>> +	phy-handle = <&hsgmii_phy0>;
>> +	phy-mode = "2500base-x";
>> +
>> +	pinctrl-0 = <&ethernet0_default>;
>> +	pinctrl-names = "default";
>> +
>> +	snps,mtl-rx-config = <&mtl_rx_setup>;
>> +	snps,mtl-tx-config = <&mtl_tx_setup>;
>> +	snps,ps-speed = <1000>;
>> +
>> +	nvmem-cells = <&mac_addr0>;
>> +	nvmem-cell-names = "mac-address";
>> +
>> +	status = "okay";
>> +
>> +	mdio {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		hsgmii_phy0: ethernet-phy@1c {
>> +			compatible = "ethernet-phy-id004d.d101";
>> +			reg = <0x1c>;
>> +			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
>> +			reset-assert-us = <11000>;
>> +			reset-deassert-us = <70000>;
>> +		};
>> +	};
>> +
>> +	mtl_rx_setup: rx-queues-config {
>> +		snps,rx-queues-to-use = <4>;
>> +		snps,rx-sched-sp;
>> +
>> +		queue0 {
>> +			snps,dcb-algorithm;
>> +			snps,map-to-dma-channel = <0x0>;
>> +			snps,route-up;
>> +			snps,priority = <0x1>;
>> +		};
>> +
>> +		queue1 {
>> +			snps,dcb-algorithm;
>> +			snps,map-to-dma-channel = <0x1>;
>> +			snps,route-ptp;
>> +		};
>> +
>> +		queue2 {
>> +			snps,avb-algorithm;
>> +			snps,map-to-dma-channel = <0x2>;
>> +			snps,route-avcp;
>> +		};
>> +
>> +		queue3 {
>> +			snps,avb-algorithm;
>> +			snps,map-to-dma-channel = <0x3>;
>> +			snps,priority = <0xc>;
>> +		};
>> +	};
>> +
>> +	mtl_tx_setup: tx-queues-config {
>> +		snps,tx-queues-to-use = <4>;
>> +
>> +		queue0 {
>> +			snps,dcb-algorithm;
>> +		};
>> +
>> +		queue1 {
>> +			snps,dcb-algorithm;
>> +		};
>> +
>> +		queue2 {
>> +			snps,avb-algorithm;
>> +			snps,send_slope = <0x1000>;
>> +			snps,idle_slope = <0x1000>;
>> +			snps,high_credit = <0x3e800>;
>> +			snps,low_credit = <0xffc18000>;
>> +		};
>> +
>> +		queue3 {
>> +			snps,avb-algorithm;
>> +			snps,send_slope = <0x1000>;
>> +			snps,idle_slope = <0x1000>;
>> +			snps,high_credit = <0x3e800>;
>> +			snps,low_credit = <0xffc18000>;
>> +		};
>> +	};
>> +};
>> +
>> +&gpi_dma0 {
>> +	status = "okay";
>> +};
>> +
>> +&gpi_dma1 {
>> +	status = "okay";
>> +};
>> +
>> +&gpi_dma2 {
>> +	status = "okay";
>> +};
>> +
>> +&i2c18 {
>> +	status = "okay";
>> +
>> +	expander0: pca953x@38 {
>> +		compatible = "ti,tca9538";
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +		reg = <0x38>;
>> +	};
>> +
>> +	expander1: pca953x@39 {
>> +		compatible = "ti,tca9538";
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +		reg = <0x39>;
>> +	};
>> +
>> +	expander2: pca953x@3a {
>> +		compatible = "ti,tca9538";
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +		reg = <0x3a>;
>> +	};
>> +
>> +	expander3: pca953x@3b {
>> +		compatible = "ti,tca9538";
>> +		#gpio-cells = <2>;
>> +		gpio-controller;
>> +		reg = <0x3b>;
>> +	};
>> +
>> +	eeprom@50 {
>> +		compatible = "atmel,24c256";
>> +		reg = <0x50>;
>> +		pagesize = <64>;
>> +
>> +		nvmem-layout {
>> +			compatible = "fixed-layout";
>> +			#address-cells = <1>;
>> +			#size-cells = <1>;
>> +
>> +			mac_addr0: mac-addr@0 {
>> +				reg = <0x0 0x6>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&iris {
>> +	firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
> Should it be just _s6.mbn or _s6_16mb.mbn?
>
>> +
>> +	status = "okay";
>> +};
>> +
>>   &mdss0 {
>>   	status = "okay";
>>   };
>> @@ -323,14 +505,196 @@ &mdss0_dp1_phy {
>>   	status = "okay";
>>   };
>>   
>> +&pcie0 {
>> +	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> I think Mani has been asking lately to define these GPIOs inside the
> port rather than in the host controller.

Hi Dmitry,

For moving these to the port requires changes in the sa8775p.dtsi to change
phys property from controller node to port node.

Mani is asking to add these for newer platforms like QCS8300 not for 
existing one's.

- Sushrut

>> +
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pcie0_default_state>;
>> +
>> +	status = "okay";
>> +};
>> +
> [...]
>
>> @@ -356,6 +720,29 @@ &ufs_mem_phy {
>>   	status = "okay";
>>   };
>>   
>> +&usb_0 {
>> +	status = "okay";
>> +};
>> +
>> +&usb_0_dwc3 {
>> +	dr_mode = "peripheral";
> Is it actually peripheral-only?
>
>> +};
>> +

