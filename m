Return-Path: <linux-arm-msm+bounces-46941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA559A289C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 12:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47B3D16342B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 11:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E625F2288C3;
	Wed,  5 Feb 2025 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WiL6YqpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8D621CFF0;
	Wed,  5 Feb 2025 11:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738756576; cv=none; b=haoBzpbMTDBTMRLln0wcsuFIIU6CdPVDdonPPhgdm0PiOQSizf2yuGQi/tNXouRhoLgQFISRlSw1Vvu2Pb/bRupEkF448h1j9PNpTgitUZLLvNTV/XYLVuzoRn6lNpurmeaQzgqAsQ7w07S1MjlbN5pMkEpZ30B3Q3mZA9kmeEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738756576; c=relaxed/simple;
	bh=ZeNqWnGBUHdjbh6jxGItIR1Qfr8YwI/0OgUmeErnptw=;
	h=Message-ID:Date:MIME-Version:Subject:References:From:To:CC:
	 In-Reply-To:Content-Type; b=dfMrG9EfjXJQxgV0RYEC/HxA9DGS2MKFf7X1lw7b69qdbSxrmicYA9XEOR3yO9kBYrxkHNpSb+nRTrb38hoMPuZDqvmLkkCzWBqp4/9seBClRSqUNrjCzZChuISGJlvyQlq0q/nVoOxJkfs1x+3VMDnkHD28iFjM7Tpnb6yFi9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WiL6YqpV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 515Ah8BT025274;
	Wed, 5 Feb 2025 11:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H97mfn5h6EgoPMU2fFHXHGRuHucEZel5RK4+JcfSGKA=; b=WiL6YqpVeIPIzXqN
	TkmLeTHDba1mPx6qsqgICceKurWrFEb263VOReRLrK6AP3TFcOXiG8b1HgRShy9F
	/6404nHlcanC75b+jXMKPau086cRHaxvYYaZ/z7/I2Kq5zP3fMfhlLkLNy+ZIsPN
	VD0pc0g5DCZX9RoBhbye6ZQ3VWZBDftFiKwQkfQzKBOe+4yvfKYzINixE/Vn+zmn
	1FLBbMWEHzQI9axKMV83Q4IK00FnYqvzp7BjMWa+3o87DI0ApedB25nK0XfE8JJt
	SU3KXBiXf7Nu1BGMLvZIoa4aYkHqABbKruxDhkJDsw5c4z7hSG/6NbItDZrzNjcW
	wyru6g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44m6fqr5mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Feb 2025 11:56:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 515Bu7XR017852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Feb 2025 11:56:07 GMT
Received: from [10.219.0.139] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Feb 2025
 03:56:02 -0800
Message-ID: <3c0746c2-ec51-4ce9-82e4-80191c4894bc@quicinc.com>
Date: Wed, 5 Feb 2025 17:25:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] arm64: dts: qcom: qcs6490-rb3gen: add and enable
 BT node
References: <20250130183434.2394058-2-quic_janathot@quicinc.com>
 <4de200f8-5924-449d-a5a7-cf08306cb916@quicinc.com>
Content-Language: en-US
From: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC: <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
        <quic_anubhavg@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-bluetooth@vger.kernel.org>
In-Reply-To: <4de200f8-5924-449d-a5a7-cf08306cb916@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sIlujtZCgxI0vyA7y-nSviLlrz2Fzo04
X-Proofpoint-ORIG-GUID: sIlujtZCgxI0vyA7y-nSviLlrz2Fzo04
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_05,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050096


Hi All,

On 1/31/2025 4:33 PM, Janaki Ramaiah Thota wrote:
> Add the PMU node for WCN6750 present on the qcs6490-rb3gen
> board and assign its power outputs to the Bluetooth module.
> 
> In WCN6750 module sw_ctrl and wifi-enable pins are handled
> in the wifi controller firmware. Therefore, it is not required
> to have those pins' entries in the PMU node.
> 
> Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 167 ++++++++++++++++++-
>   1 file changed, 166 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/ 
> boot/dts/qcom/qcs6490-rb3gen2.dts
> index 7a36c90ad4ec..0a3243499dfb 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: BSD-3-Clause
>   /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights 
> reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights 
> reserved.
>    */
>    /dts-v1/;
> @@ -34,6 +34,7 @@ / {
>        aliases {
>           serial0 = &uart5;
> +        serial1 = &uart7;
>       };
>        chosen {
> @@ -218,6 +219,63 @@ vph_pwr: vph-pwr-regulator {
>           regulator-min-microvolt = <3700000>;
>           regulator-max-microvolt = <3700000>;
>       };
> +
> +    wcn6750-pmu {
> +        compatible = "qcom,wcn6750-pmu";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&bt_en>;
> +        vddaon-supply = <&vreg_s7b_0p972>;
> +        vddasd-supply = <&vreg_l11c_2p8>;
> +        vddpmu-supply = <&vreg_s7b_0p972>;
> +        vddrfa0p8-supply = <&vreg_s7b_0p972>;
> +        vddrfa1p2-supply = <&vreg_s8b_1p272>;
> +        vddrfa1p7-supply = <&vreg_s1b_1p872>;
> +        vddrfa2p2-supply = <&vreg_s1c_2p19>;
> +
> +        bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
> +
> +        regulators {
> +            vreg_pmu_rfa_cmn: ldo0 {
> +                regulator-name = "vreg_pmu_rfa_cmn";
> +            };
> +
> +            vreg_pmu_aon_0p59: ldo1 {
> +                regulator-name = "vreg_pmu_aon_0p59";
> +            };
> +
> +            vreg_pmu_wlcx_0p8: ldo2 {
> +                regulator-name = "vreg_pmu_wlcx_0p8";
> +            };
> +
> +            vreg_pmu_wlmx_0p85: ldo3 {
> +                regulator-name = "vreg_pmu_wlmx_0p85";
> +            };
> +
> +            vreg_pmu_btcmx_0p85: ldo4 {
> +                regulator-name = "vreg_pmu_btcmx_0p85";
> +            };
> +
> +            vreg_pmu_rfa_0p8: ldo5 {
> +                regulator-name = "vreg_pmu_rfa_0p8";
> +            };
> +
> +            vreg_pmu_rfa_1p2: ldo6 {
> +                regulator-name = "vreg_pmu_rfa_1p2";
> +            };
> +
> +            vreg_pmu_rfa_1p7: ldo7 {
> +                regulator-name = "vreg_pmu_rfa_1p7";
> +            };
> +
> +            vreg_pmu_pcie_0p9: ldo8 {
> +                regulator-name = "vreg_pmu_pcie_0p9";
> +            };
> +
> +            vreg_pmu_pcie_1p8: ldo9 {
> +                regulator-name = "vreg_pmu_pcie_1p8";
> +            };
> +        };
> +    };
>   };
>    &apps_rsc {
> @@ -799,6 +857,39 @@ &pon_resin {
>       status = "okay";
>   };
>   +&qup_uart7_cts {
> +    /*
> +     * Configure a bias-bus-hold on CTS to lower power
> +     * usage when Bluetooth is turned off. Bus hold will
> +     * maintain a low power state regardless of whether
> +     * the Bluetooth module drives the pin in either
> +     * direction or leaves the pin fully unpowered.
> +     */
> +    bias-bus-hold;
> +};
> +
> +&qup_uart7_rts {
> +    /* We'll drive RTS, so no pull */
> +    drive-strength = <2>;
> +    bias-disable;
> +};
> +
> +&qup_uart7_rx {
> +    /*
> +     * Configure a pull-up on RX. This is needed to avoid
> +     * garbage data when the TX pin of the Bluetooth module is
> +     * in tri-state (module powered off or not driving the
> +     * signal yet).
> +     */
> +    bias-pull-up;
> +};
> +
> +&qup_uart7_tx {
> +    /* We'll drive TX, so no pull */
> +    drive-strength = <2>;
> +    bias-disable;
> +};
> +
>   &qupv3_id_0 {
>       status = "okay";
>   };
> @@ -842,12 +933,86 @@ &sdhc_2 {
>   &tlmm {
>       gpio-reserved-ranges = <32 2>, /* ADSP */
>                      <48 4>; /* NFC */
> +
> +    bt_en: bt-en-state {
> +        pins = "gpio85";
> +        function = "gpio";
> +        output-low;
> +        bias-disable;
> +    };
> +
> +    qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
> +        pins = "gpio28";
> +        function = "gpio";
> +        /*
> +         * Configure a bias-bus-hold on CTS to lower power
> +         * usage when Bluetooth is turned off. Bus hold will
> +         * maintain a low power state regardless of whether
> +         * the Bluetooth module drives the pin in either
> +         * direction or leaves the pin fully unpowered.
> +         */
> +        bias-bus-hold;
> +    };
> +
> +    qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
> +        pins = "gpio29";
> +        function = "gpio";
> +        /*
> +         * Configure pull-down on RTS. As RTS is active low
> +         * signal, pull it low to indicate the BT SoC that it
> +         * can wakeup the system anytime from suspend state by
> +         * pulling RX low (by sending wakeup bytes).
> +         */
> +        bias-pull-down;
> +    };
> +
> +    qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
> +        pins = "gpio31";
> +        function = "gpio";
> +        /*
> +         * Configure a pull-up on RX. This is needed to avoid
> +         * garbage data when the TX pin of the Bluetooth module
> +         * is floating which may cause spurious wakeups.
> +         */
> +        bias-pull-up;
> +    };
> +
> +    qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
> +        pins = "gpio30";
> +        function = "gpio";
> +        /*
> +         * Configure pull-up on TX when it isn't actively driven
> +         * to prevent BT SoC from receiving garbage during sleep.
> +         */
> +        bias-pull-up;
> +    };
>   };
>    &uart5 {
>       status = "okay";
>   };
>   +&uart7 {
> +    /delete-property/interrupts;
> +    interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> +                <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> +    pinctrl-1 =  <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>,
> +        <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
> +    pinctrl-names = "default", "sleep";
> +    status = "okay";
> +
> +    bluetooth: bluetooth {
> +        compatible = "qcom,wcn6750-bt";
> +        vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +        vddaon-supply = <&vreg_pmu_aon_0p59>;
> +        vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
> +        vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +        vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
> +        vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +        max-speed = <3200000>;
> +    };
> +};
> +
>   &usb_1 {
>       status = "okay";
>   };

Could you please help to review this change? Thanks!

Regards,
Janakiram

