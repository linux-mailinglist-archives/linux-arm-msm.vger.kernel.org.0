Return-Path: <linux-arm-msm+bounces-71127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D90B39E2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 15:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 103EE1658CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 13:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A7331062E;
	Thu, 28 Aug 2025 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m+3D6639"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E479E3101AA;
	Thu, 28 Aug 2025 13:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756386503; cv=none; b=L6by1Hw/OR+0byP4uElZ2+33LUBFUYQUf6KmJ0EFcEe9tND/YplUVYKmBqzC2r4i2b6YmsVAyo//WXxmIwM5RyFcziihuo9G1WhgPvBrUwLCrA/fO/sNFG5muKIhV8iiB/pQ3kWQLm4rEffZPfiZe9xKtBKF2chUwDRrQo+cNgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756386503; c=relaxed/simple;
	bh=bnsmQ4s4YWXJEDmMTz0QbTVQlweoxxc3e9tF9RSetQQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bqRrikqSMiA8ndHaUAlNXNqr2qy64bAWtn83wftwWU17g1vEahC5rv/75doiXFh2O7sskTzflQIw77n4CBJoCiRQ9wIoksunaieeKlsl232mZCnpDp64ZUQmFXibkr05APOXGB3thfaGt4J7kwoDE/xpZZRd5uAQB3FFgx2FWh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m+3D6639; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S63EwH027598;
	Thu, 28 Aug 2025 13:08:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vrdw+Tgzdk6KQ1M/oXrNvjDzl29uEYdaV4aSNDrWSQI=; b=m+3D6639bDFhafuy
	FvwyQI21uFhL7ZLrbwpeTAHI/lH8mDPwb7sNzoBDbU6cTH6Y8RptdjbJWSwcaWeb
	4tRmSEUfHXDYLgFkQycY8CO3egVabIgVcLB/XXG1r/UxmbokIEtMZjmOmxAb6kto
	OZnzgBO0ExEQW8G2zErX56HM1tTZL805P2AmFOG9aIVMzayvSjb36oHpB7GOBysP
	gKdBOAc6AvNwsRTFCcN1ZKTuJuy15dv09ED8cbNm4Skgon7HVPyAA7tz98L9qKgi
	UOGVPyaP1JhZRPf1aP537/D0aAodsPSOu7BvjgMmt1uoflycFsv6++zioFzvYY6c
	brrgvQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48se16y9n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 13:08:17 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57SD8Gnk010048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 13:08:16 GMT
Received: from [10.216.33.147] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Thu, 28 Aug
 2025 06:08:08 -0700
Message-ID: <3f94ccc8-ac8a-4c62-8ac6-93dd603dcd36@quicinc.com>
Date: Thu, 28 Aug 2025 18:38:03 +0530
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
	<quic_vispal@quicinc.com>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-3-08016e0d3ce5@oss.qualcomm.com>
 <kycmxk3qag7uigoiitzcxcak22cewdv253fazgaidjcnzgzlkz@htrh22msxteq>
Content-Language: en-US
From: Sushrut Shree Trivedi <quic_sushruts@quicinc.com>
In-Reply-To: <kycmxk3qag7uigoiitzcxcak22cewdv253fazgaidjcnzgzlkz@htrh22msxteq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xWVoiKJQdA9VK6RH9UbmDoG0QcWlTwmL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDEyMCBTYWx0ZWRfX3brSb8+JSlMh
 ohtVL9JAV9mLq2IfvBu2skWZ+E9LCavoj5WJZSmgrrBM/qbB/m+fM2HF8ZrCxUCzursjDUtHuF0
 GV5yC3+OQ+TH+lUY9hT/OI6jNoHqlX+apQ2oGXf2BmoYsWs48upCC6dub2FuC3DwWq+XrCD2TsO
 xutxjWpBvmHg7tLTpMHbNt20XZm9oThBeBQU5TQ87v1m63PPnlLezLF7qLQbJ2rjBo4t7AVlkdp
 PZ5mXmh187NSQIxRiutlXaR/06uoDOO+VMOsDa2wIfaCAlj2xIco5qjmoKc9hB76xOVabyHwDNb
 lPKgD8quSWvvSvMbNQnmJEqsD3bJ1r1T8xrrYelvjDVpYu7kVP85B75AGkk795Q6Vu0ufaKCjRE
 dmGLklzV
X-Proofpoint-ORIG-GUID: xWVoiKJQdA9VK6RH9UbmDoG0QcWlTwmL
X-Authority-Analysis: v=2.4 cv=CNYqXQrD c=1 sm=1 tr=0 ts=68b054c1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=rEvOE1C9dwyv97nfEU0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508260120


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
>
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

Hi Dmitry,

HW supports OTG mode also, but for enabling OTG we need below mentioned
driver changes in dwc3-qcom.c :

a) dwc3 core callback registration by dwc3 glue driver; this change is under
     review in upstream.
b) vbus supply enablement for host mode; this change is yet to be submitted
     to upstream.

Post the above mentioned driver changes, we are planning to enable OTG on
usb0.

- Sushrut

>> +};
>> +

