Return-Path: <linux-arm-msm+bounces-66982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F4080B14C58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 12:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F14AB18A2572
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 10:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DE7F2877CA;
	Tue, 29 Jul 2025 10:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIqYr+qZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8412877DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753785470; cv=none; b=X8o/fQzaxVuIzWRfAHS2OGxYB9xEzWX90U7DP6mSuDu1Q3runX4OxLz0UHEhiGpz3Z1aDbShfCbK6lgYK35Gzkhwrk5o0rh+bINfdLHy6HS82k0ExZ6mZ5XHE/SWs4P0gUHoR1eXIxdj26gmDkr9+D/XPGPFLhnhMaF6Ax8dEhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753785470; c=relaxed/simple;
	bh=t/Tzk0eqHJESNc4UOnS4PeN2HgjCRScb6A9bnWgjMvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtSk2QED22ftyEhQFYB7HBMCb2dCKoULVQJ+fA5KpAtT4NHPTelLARHZw3tus3OblhXQxAwFBuQi7yzCCWgMjPtQwgRAMfDdLPsIFzJppydnV2Os8OPeieJz00E+NNg/DyKLKPGuKd20511tDIY5FJxFkFu1kcXQHmdJ1Ai4r40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIqYr+qZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T98Hop023603
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n1R4mju8ZSTGSZweeBkN7L1q
	qPhwFKyQ/vq7O2AYnGw=; b=fIqYr+qZkHAvz83pHJeTcwLETL1cdR2uVJf7uoR/
	wJQ3MBUmyciX8n8CMdt9VWnEH+5IXRX025uTOIjCYwc2T82YmFEUp3aUbHY2izL6
	tFYMAPD/K9N6mgWRB6rnX3OVchdggcbyZGPlIdLsm0gvNJObeIb9vJAiN3TWPi91
	oS44cI83TBnnGjtdoWBdoUU3DfVVVSV+EtPxkpnLLhKUhr5J4BqwKj9e3Xl7qGKf
	g857MImoZvvgda0vziYjayjBzh3CdWD2Fak3BO+D7w7V72RhCjkiy9mPC169rlb+
	+9sswfD0ENWVyOwVLwrjJDQbdXF+WCf5D0V/50Ee4HFnzQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qqqd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 10:37:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70749d4c689so30305226d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 03:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753785465; x=1754390265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1R4mju8ZSTGSZweeBkN7L1qqPhwFKyQ/vq7O2AYnGw=;
        b=X3vHjDvlQZ/mGPPFFmu0dlHIvXBGW0YFehqCVkh6o/HFLlFKzTtgpFi/dYWPw/T23r
         QBlHkOpUhEg38zxRErXza2cSs8PfUBkkrVafx2aBr+P/tuHVYp0gU28MmSq70LP+pDbh
         dhtTyi80kJJAN3u6RRs6S3Vx/n0kl4GQcKlBEqs6gOSHcxRnOBKHEqEO8bzdoK5XaeQq
         eMRJMQyvofp1xSReMoysIIsXy84mdQ7fuJkOLa/+PwGV9m0b2H7iaB17KIEaFzqbTInF
         eCnyFR2vkVKPaVd5tJLpJx0LjtrgHoEmYZKHklQKVyTkM99MTBFSo3tsV7Txx/rW9V++
         BjIg==
X-Forwarded-Encrypted: i=1; AJvYcCVsD4AMqaFVzcXi4SPR7c04pkIWbOOPAQcU2jXIsqFh7gUgXRtx41+F6lpHav2QmcbZJOM8ripvJJwXXZUL@vger.kernel.org
X-Gm-Message-State: AOJu0YxTo3QHHUZRJHzyKQ+2Cy1eJqBkPjJyowEHX2+wECIEGcTJUO+O
	iBZVwd9HExo5UNQkjr+amFEsMChyuAG2yAOX6t2VnQ7LeL3uYhl8yCzOEms7sN6CaRFrd/CF+JO
	fGdcIbVLAiWkIcLhDYDkPmjEChI7v3Y7Rxd5+zUU8gURDJIU3a3/Mv9Wp8Io928TAIQpU
X-Gm-Gg: ASbGncuOJmSJS1ivjnZx+cVCGQSZt2XOoaSpNKx9Ds4Y1ZY+zVURptOHkNxNCe5J4NP
	Z04o4QuXRtllYkvnW32ZTDNSJRa32DED1DSDA74wvQjpejZfc4xCz+pvZ5Sd1oZilGBwaua+evm
	MDJZ0ezhxGyYf5cSW0AF27mw/LRGqzCHsjht8GfQNorAkJ52bx09sTA/DnDVOEW3V3yNdkJE3zN
	3xWDVHdGgrxV4QKgXmail5kk1f3xkyJM5RRfnrd6RqPFp+u09ILggY+/dR8tBofjCwzIqF3Tita
	kGv9l9yDPdnZt+T4YU2wOOUGfwfr7cjGBPRDyYIcxHVzcjzz0iSDgIFmqYz/5KswkJzbvf38z/I
	Ov1uTx337g3zzL6Y0QI9G3AvP94xrOxv/wbu8WpRSWHmPrVIV1cOL
X-Received: by 2002:a05:6214:234c:b0:706:de4c:fddf with SMTP id 6a1803df08f44-707204eb7bfmr185146746d6.9.1753785465176;
        Tue, 29 Jul 2025 03:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpaDAzE2s9RpE4SnCQeCvJJJ4lvIG/M+Pk6LVG/t2r6XOva3D7irDqj3Qb7DmNvFg/8H+YgA==
X-Received: by 2002:a05:6214:234c:b0:706:de4c:fddf with SMTP id 6a1803df08f44-707204eb7bfmr185145706d6.9.1753785463466;
        Tue, 29 Jul 2025 03:37:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b6316d6cbsm1641849e87.29.2025.07.29.03.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 03:37:42 -0700 (PDT)
Date: Tue, 29 Jul 2025 13:37:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
Message-ID: <pbvyog477v32s4lu72z52dhsond5yud5w3nxmcouvr6ljlndlh@ws46dncy35c6>
References: <20250729-hamoa_initial-v3-0-806e092789dc@oss.qualcomm.com>
 <20250729-hamoa_initial-v3-4-806e092789dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-hamoa_initial-v3-4-806e092789dc@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDA4MiBTYWx0ZWRfX065WT+5u5YkQ
 F2pkSa6LDwJ7zhVaSWueIKeG63YUpS40R0zI7iJ2XuZPuSmJ9zLbLCZ1IhNaNAE5V+c1vD7Y4mG
 QzqUaJqq3TTvekG+KFdCxK7dyeVZqts6mczAwSP4YEXoPFDCL4h8QgrhDfrmu6RxtxVXTLupMYo
 BVH9kiBqdyJ3nuvfAVFyBihlGzaG6Pa78hZFabPeHkCucNwrsI52iNiAQPoT8ra8cq1A0Q+Qquz
 xQ4fp+AzAq11y02auYgyerHftRmTeAcGsZcG7pGD3hzFQ+wEIQnOUwscCZqccyt+R9drEIFZGRN
 mVQhkDP9RIMZ0YIEAZw5LP2xGivo6/ajUkZLq5GetmCSU2uyEM4teQI84151kaiDReZdXQe9iE9
 N1tSyXP8zcWvAUfO8LRt2uME2IFlf77OcsXJvD0Paih5n1HT+wyz7aeDu9geyWTXDC419R/q
X-Proofpoint-ORIG-GUID: 4nkOU_AW5E7UI5xJ2Sq84KjA3uq-7xEE
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6888a47b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ozt4DjDmHokV6crStI8A:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: 4nkOU_AW5E7UI5xJ2Sq84KjA3uq-7xEE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_02,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290082

On Tue, Jul 29, 2025 at 09:32:00AM +0800, Yijie Yang wrote:
> The HAMOA-IOT-EVK is an evaluation platform for IoT products, composed of
> the Hamoa IoT SoM and a carrier board. Together, they form a complete
> embedded system capable of booting to UART.
> 
> This change enables and overlays the following peripherals on the carrier
> board:
> - UART
> - On-board regulators
> - USB Type-C mux
> - Pinctrl
> - Embedded USB (EUSB) repeaters
> - NVMe
> - pmic-glink
> - USB DisplayPorts
> 
> Written with contributions from Shuai Zhang (added Bluetooth) and Yongxing
> Mou (added USB DisplayPorts).

Please use S-o-B + Co-developed-by instead. You can add comments on the
tag line after the hash sign.

> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |   1 +
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 992 +++++++++++++++++++++++++++++
>  2 files changed, 993 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 4bfa926b6a0850c3c459bcba28129c559d50a7cf..c5994b75d3e56e74ffb64b2389ee1bcc086f3065 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -13,6 +13,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8039-t2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8094-sony-xperia-kitakami-karin_windy.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq5332-rdp441.dtb
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..02daec04f933c0b3ab9bd329f56ac1ba0401ddef
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -0,0 +1,992 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include "hamoa-iot-som.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
> +	compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		serial0 = &uart21;
> +		serial1 = &uart14;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	pmic-glink {
> +		compatible = "qcom,x1e80100-pmic-glink",
> +			     "qcom,sm8550-pmic-glink",
> +			     "qcom,pmic-glink";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
> +				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
> +
> +		connector@0 {
> +			compatible = "usb-c-connector";
> +			reg = <0>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_ss0_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss0_ss_in: endpoint {
> +						remote-endpoint = <&usb_1_ss0_qmpphy_out>;

No retimers on SS0?

> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_ss0_sbu: endpoint {
> +						remote-endpoint = <&usb_1_ss0_sbu_mux>;
> +					};
> +				};
> +			};
> +		};
> +
> +		connector@1 {
> +			compatible = "usb-c-connector";
> +			reg = <1>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_ss1_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss1_ss_in: endpoint {
> +						remote-endpoint = <&retimer_ss1_ss_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_ss1_con_sbu_in: endpoint {
> +						remote-endpoint = <&retimer_ss1_con_sbu_out>;
> +					};
> +				};
> +			};
> +		};
> +
> +		connector@2 {
> +			compatible = "usb-c-connector";
> +			reg = <2>;
> +			power-role = "dual";
> +			data-role = "dual";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					pmic_glink_ss2_hs_in: endpoint {
> +						remote-endpoint = <&usb_1_ss2_dwc3_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					pmic_glink_ss2_ss_in: endpoint {
> +						remote-endpoint = <&retimer_ss2_ss_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_ss2_con_sbu_in: endpoint {
> +						remote-endpoint = <&retimer_ss2_con_sbu_out>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +
> +	vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vreg_edp_3p3: regulator-edp-3p3 {

regulator-edp-3p3 < regulator-vph-pwr

> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_EDP_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&edp_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vreg_nvme: regulator-nvme {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_NVME_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&nvme_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {

Hmm, so there are regulators for the retimer, but they are not used.
Could you please point out, why?

> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR0_1P15";
> +		regulator-min-microvolt = <1150000>;
> +		regulator-max-microvolt = <1150000>;
> +
> +		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb0_pwr_1p15_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR0_1P8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb0_1p8_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR0_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb0_3p3_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR1_1P15";
> +		regulator-min-microvolt = <1150000>;
> +		regulator-max-microvolt = <1150000>;
> +
> +		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb1_pwr_1p15_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR1_1P8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb1_pwr_1p8_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR1_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb1_pwr_3p3_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr2_1p15: regulator-rtmr2-1p15 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR2_1P15";
> +		regulator-min-microvolt = <1150000>;
> +		regulator-max-microvolt = <1150000>;
> +
> +		gpio = <&tlmm 189 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb2_pwr_1p15_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr2_1p8: regulator-rtmr2-1p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR2_1P8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 126 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb2_pwr_1p8_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR2_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 187 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb2_pwr_3p3_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	usb-1-ss0-sbu-mux {
> +		compatible = "onnn,fsusb42", "gpio-sbu-mux";
> +
> +		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
> +		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&usb_1_ss0_sbu_default>;
> +		pinctrl-names = "default";
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		port {
> +			usb_1_ss0_sbu_mux: endpoint {
> +				remote-endpoint = <&pmic_glink_ss0_sbu>;
> +			};
> +		};
> +	};
> +
> +	vreg_wcn_3p3: regulator-wcn-3p3 {

regulator-wcn-3p3 < usb-1-ss0-sbu-mux

> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&wcn_sw_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	/*
> +	 * TODO: These two regulators are actually part of the removable M.2
> +	 * card and not the CRD mainboard. Need to describe this differently.
> +	 * Functionally it works correctly, because all we need to do is to
> +	 * turn on the actual 3.3V supply above.
> +	 */
> +	vreg_wcn_0p95: regulator-wcn-0p95 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_0P95";
> +		regulator-min-microvolt = <950000>;
> +		regulator-max-microvolt = <950000>;
> +
> +		vin-supply = <&vreg_wcn_3p3>;
> +	};
> +
> +	vreg_wcn_1p9: regulator-wcn-1p9 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_WCN_1P9";
> +		regulator-min-microvolt = <1900000>;
> +		regulator-max-microvolt = <1900000>;
> +
> +		vin-supply = <&vreg_wcn_3p3>;
> +	};
> +
> +	vreg_wwan: regulator-wwan {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "SDX_VPH_PWR";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 221 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&wwan_sw_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	wcn7850-pmu {
> +		compatible = "qcom,wcn7850-pmu";
> +
> +		vdd-supply = <&vreg_wcn_0p95>;
> +		vddio-supply = <&vreg_l15b_1p8>;
> +		vddaon-supply = <&vreg_wcn_0p95>;
> +		vdddig-supply = <&vreg_wcn_0p95>;
> +		vddrfa1p2-supply = <&vreg_wcn_1p9>;
> +		vddrfa1p8-supply = <&vreg_wcn_1p9>;
> +
> +		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&wcn_bt_en>;
> +		pinctrl-names = "default";
> +
> +		regulators {
> +			vreg_pmu_rfa_cmn: ldo0 {
> +				regulator-name = "vreg_pmu_rfa_cmn";
> +			};
> +
> +			vreg_pmu_aon_0p59: ldo1 {
> +				regulator-name = "vreg_pmu_aon_0p59";
> +			};
> +
> +			vreg_pmu_wlcx_0p8: ldo2 {
> +				regulator-name = "vreg_pmu_wlcx_0p8";
> +			};
> +
> +			vreg_pmu_wlmx_0p85: ldo3 {
> +				regulator-name = "vreg_pmu_wlmx_0p85";
> +			};
> +
> +			vreg_pmu_btcmx_0p85: ldo4 {
> +				regulator-name = "vreg_pmu_btcmx_0p85";
> +			};
> +
> +			vreg_pmu_rfa_0p8: ldo5 {
> +				regulator-name = "vreg_pmu_rfa_0p8";
> +			};
> +
> +			vreg_pmu_rfa_1p2: ldo6 {
> +				regulator-name = "vreg_pmu_rfa_1p2";
> +			};
> +
> +			vreg_pmu_rfa_1p8: ldo7 {
> +				regulator-name = "vreg_pmu_rfa_1p8";
> +			};
> +
> +			vreg_pmu_pcie_0p9: ldo8 {
> +				regulator-name = "vreg_pmu_pcie_0p9";
> +			};
> +
> +			vreg_pmu_pcie_1p8: ldo9 {
> +				regulator-name = "vreg_pmu_pcie_1p8";
> +			};
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";
> +		reg = <0x08>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK5>;
> +
> +		vdd-supply = <&vreg_rtmr2_1p15>;
> +		vdd33-supply = <&vreg_rtmr2_3p3>;
> +		vdd33-cap-supply = <&vreg_rtmr2_3p3>;
> +		vddar-supply = <&vreg_rtmr2_1p15>;
> +		vddat-supply = <&vreg_rtmr2_1p15>;
> +		vddio-supply = <&vreg_rtmr2_1p8>;
> +
> +		reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&rtmr2_default>;
> +		pinctrl-names = "default";
> +
> +		orientation-switch;
> +		retimer-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				retimer_ss2_ss_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss2_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				retimer_ss2_ss_in: endpoint {
> +					remote-endpoint = <&usb_1_ss2_qmpphy_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				retimer_ss2_con_sbu_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss2_con_sbu_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c5 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	eusb3_repeater: redriver@47 {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x47>;
> +		#phy-cells = <0>;
> +
> +		vdd3v3-supply = <&vreg_l13b_3p0>;
> +		vdd1v8-supply = <&vreg_l4b_1p8>;
> +
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&eusb3_reset_n>;
> +		pinctrl-names = "default";
> +	};
> +
> +	eusb5_repeater: redriver@43 {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x43>;
> +		#phy-cells = <0>;
> +
> +		vdd3v3-supply = <&vreg_l13b_3p0>;
> +		vdd1v8-supply = <&vreg_l4b_1p8>;
> +
> +		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&eusb5_reset_n>;
> +		pinctrl-names = "default";
> +	};
> +
> +	eusb6_repeater: redriver@4f {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x4f>;
> +		#phy-cells = <0>;
> +
> +		vdd3v3-supply = <&vreg_l13b_3p0>;
> +		vdd1v8-supply = <&vreg_l4b_1p8>;
> +
> +		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&eusb6_reset_n>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
> +&i2c7 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	typec-mux@8 {
> +		compatible = "parade,ps8830";
> +		reg = <0x8>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK4>;
> +
> +		vdd-supply = <&vreg_rtmr1_1p15>;
> +		vdd33-supply = <&vreg_rtmr1_3p3>;
> +		vdd33-cap-supply = <&vreg_rtmr1_3p3>;
> +		vddar-supply = <&vreg_rtmr1_1p15>;
> +		vddat-supply = <&vreg_rtmr1_1p15>;
> +		vddio-supply = <&vreg_rtmr1_1p8>;
> +
> +		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&rtmr1_default>;
> +		pinctrl-names = "default";
> +
> +		retimer-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				retimer_ss1_ss_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss1_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				retimer_ss1_ss_in: endpoint {
> +					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				retimer_ss1_con_sbu_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dp0 {
> +	status = "okay";
> +};
> +
> +&mdss_dp0_out {
> +	data-lanes = <0 1>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp1 {
> +	status = "okay";
> +};
> +
> +&mdss_dp1_out {
> +	data-lanes = <0 1>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp2 {
> +	status = "okay";
> +};
> +
> +&mdss_dp2_out {
> +	data-lanes = <0 1>;
> +	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
> +};
> +
> +&mdss_dp3 {
> +	/delete-property/ #sound-dai-cells;
> +
> +	status = "okay";
> +
> +	aux-bus {
> +		panel {
> +			compatible = "edp-panel";
> +			power-supply = <&vreg_edp_3p3>;
> +
> +			port {
> +				edp_panel_in: endpoint {
> +					remote-endpoint = <&mdss_dp3_out>;
> +				};
> +			};
> +		};
> +	};
> +
> +	ports {
> +		port@1 {

Rebase on top of https://lore.kernel.org/r/20250724-move-edp-endpoints-v1-0-6ca569812838@oss.qualcomm.com

> +			reg = <1>;
> +
> +			mdss_dp3_out: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				link-frequencies = /bits/ 64 <1620000000 2700000000
> +							      5400000000 8100000000>;
> +
> +				remote-endpoint = <&edp_panel_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dp3_phy {
> +	vdda-phy-supply = <&vreg_l3j_0p8>;
> +	vdda-pll-supply = <&vreg_l2j_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&pcie6a {
> +	vddpe-3v3-supply = <&vreg_nvme>;
> +};
> +
> +&pm8550_gpios {
> +	rtmr0_default: rtmr0-reset-n-active-state {
> +		pins = "gpio10";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +		bias-disable;
> +		input-disable;
> +		output-enable;
> +	};
> +
> +	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
> +		pins = "gpio11";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +		bias-disable;
> +		input-disable;
> +		output-enable;
> +	};
> +};
> +
> +&pm8550ve_9_gpios {
> +	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
> +		pins = "gpio8";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +		bias-disable;
> +		input-disable;
> +		output-enable;
> +	};
> +};
> +
> +&pmc8380_5_gpios {
> +	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
> +		pins = "gpio8";
> +		function = "normal";
> +		power-source = <1>; /* 1.8V */
> +		bias-disable;
> +		input-disable;
> +		output-enable;
> +	};
> +};
> +
> +&smb2360_0 {
> +	status = "okay";
> +};
> +
> +&smb2360_0_eusb2_repeater {
> +	vdd18-supply = <&vreg_l3d_1p8>;
> +	vdd3-supply = <&vreg_l2b_3p0>;
> +};
> +
> +&smb2360_1 {
> +	status = "okay";
> +};
> +
> +&smb2360_1_eusb2_repeater {
> +	vdd18-supply = <&vreg_l3d_1p8>;
> +	vdd3-supply = <&vreg_l14b_3p0>;
> +};
> +
> +&smb2360_2 {
> +	status = "okay";
> +};
> +
> +&smb2360_2_eusb2_repeater {
> +	vdd18-supply = <&vreg_l3d_1p8>;
> +	vdd3-supply = <&vreg_l8b_3p0>;
> +};
> +
> +&tlmm {
> +	edp_reg_en: edp-reg-en-state {
> +		pins = "gpio70";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +
> +	eusb3_reset_n: eusb3-reset-n-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};
> +
> +	eusb5_reset_n: eusb5-reset-n-state {
> +		pins = "gpio7";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +		output-low;
> +	};
> +
> +	eusb6_reset_n: eusb6-reset-n-state {
> +		pins = "gpio184";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +		output-low;
> +	};
> +
> +	nvme_reg_en: nvme-reg-en-state {
> +		pins = "gpio18";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	rtmr1_default: rtmr1-reset-n-active-state {
> +		pins = "gpio176";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	rtmr2_default: rtmr2-reset-n-active-state {
> +		pins = "gpio185";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
> +		pins = "gpio188";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	usb1_pwr_1p8_reg_en: usb1-pwr-1p8-reg-en-state {
> +		pins = "gpio175";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	usb1_pwr_3p3_reg_en: usb1-pwr-3p3-reg-en-state {
> +		pins = "gpio186";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	usb2_pwr_1p15_reg_en: usb2-pwr-1p15-reg-en-state {
> +		pins = "gpio189";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	usb2_pwr_1p8_reg_en: usb2-pwr-1p8-reg-en-state {
> +		pins = "gpio126";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
> +		pins = "gpio187";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
> +		mode-pins {
> +			pins = "gpio166";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <2>;
> +			output-high;

What does this pin do? It's not recommended to set GPIO values through
pinctrl.

> +		};
> +
> +		oe-n-pins {
> +			pins = "gpio168";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <2>;
> +		};
> +
> +		sel-pins {
> +			pins = "gpio167";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <2>;
> +		};
> +	};
> +
> +	wcn_bt_en: wcn-bt-en-state {
> +		pins = "gpio116";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	wwan_sw_en: wwan-sw-en-state {
> +		pins = "gpio221";
> +		function = "gpio";
> +		drive-strength = <4>;
> +		bias-disable;
> +	};
> +
> +	wcn_sw_en: wcn-sw-en-state {
> +		pins = "gpio214";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	wcn_usb_sw_n: wcn-usb-sw-n-state {

What does this pin do? Using pinctrl to set GPIO values is not
recommended AFAIR.

> +		pins = "gpio225";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;
> +	};
> +};
> +
> +&uart14 {
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "qcom,wcn7850-bt";
> +		max-speed = <3200000>;
> +
> +		vddaon-supply = <&vreg_pmu_aon_0p59>;
> +		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> +		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> +		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> +		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> +		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> +		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> +	};
> +};
> +
> +&uart21 {
> +	compatible = "qcom,geni-debug-uart";
> +
> +	status = "okay";
> +};
> +
> +&usb_1_ss0_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_ss0_hs_in>;
> +};
> +
> +&usb_1_ss0_hsphy {
> +	phys = <&smb2360_0_eusb2_repeater>;
> +};
> +
> +&usb_1_ss0_qmpphy_out {
> +	remote-endpoint = <&pmic_glink_ss0_ss_in>;
> +};
> +
> +&usb_1_ss1_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_ss1_hs_in>;
> +};
> +
> +&usb_1_ss1_hsphy {
> +	phys = <&smb2360_1_eusb2_repeater>;
> +};
> +
> +&usb_1_ss1_qmpphy_out {
> +	remote-endpoint = <&retimer_ss1_ss_in>;
> +};
> +
> +&usb_1_ss2_dwc3_hs {
> +	remote-endpoint = <&pmic_glink_ss2_hs_in>;
> +};
> +
> +&usb_1_ss2_hsphy {
> +	phys = <&smb2360_2_eusb2_repeater>;
> +};
> +
> +&usb_1_ss2_qmpphy_out {
> +	remote-endpoint = <&retimer_ss2_ss_in>;
> +};
> +
> +&usb_2_hsphy {
> +	phys = <&eusb5_repeater>;
> +
> +	pinctrl-0 = <&wcn_usb_sw_n>;
> +	pinctrl-names = "default";
> +};
> +
> +&usb_mp_hsphy0 {
> +	phys = <&eusb6_repeater>;
> +};
> +
> +&usb_mp_hsphy1 {
> +	phys = <&eusb3_repeater>;
> +};
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

