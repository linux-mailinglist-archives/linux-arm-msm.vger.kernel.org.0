Return-Path: <linux-arm-msm+bounces-44059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18DA033A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 00:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90D6F1885DC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 23:59:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E631E1C3B;
	Mon,  6 Jan 2025 23:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCyBtnKQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678821DFE00;
	Mon,  6 Jan 2025 23:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736207944; cv=none; b=FhXtbV7zM9B6ipMhT1ORmLoyebfIAUYpJTNfQP2Wu6sD40EqrUCyXVbWjWA3TUbvMSt9pSKwvRj192ruvJOsORmDjAyXiUgNaCkoMNhQYyBnlDMpALxFcZ9VbBxTfJjoiDFricdnUdri9ScrWq4rtCef9a62Jo+1KbzlRH4iCa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736207944; c=relaxed/simple;
	bh=3PTF41EA7k/Rx5ZzDxwFRH7DgwB1BCAeE916Zji+3mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YkToZlA4wQTnLpkuScgrkWA2EASKHiG5F5IUrn+EQBKq6u7TM4EWgPYN7kGiz3V72t9i1phhCPrFdcIiLEb+/BwZUXTffmPgLlb2NBI/GWPGpzqFpUrWBRl3BcSrqsw8gIHewVk7/emDHXO7LjE0Lf+b1osa8dbChjb7VZBDFlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCyBtnKQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36547C4CED2;
	Mon,  6 Jan 2025 23:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736207944;
	bh=3PTF41EA7k/Rx5ZzDxwFRH7DgwB1BCAeE916Zji+3mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCyBtnKQmNkKcluzkmSycUsoHZMEga90EkGxqUdpKTQR1UZR3A7lH1WcSjFwz7SjG
	 kBvRTldP4+9vkuelxcAsRSsijNRLbWbbexdnB5A6ccwFksQ/ZAK+yGgHRyRiMrzcqk
	 6YtV8+bvUrilVtK3SKv+dULokVI8p3yzVklKMU8DKULBdNfJjh3TS3dp+56y3syWo5
	 Ug830aa4/nw36dntxkkyC/WBlLcKiRrGfIM0XbKf+CI0b3e6Os+/XPhw5bf7mzSmQ/
	 lr7AERLnKEqdRrYQDgEnXaxrwtftTtyLtUjl5WWQU/4R3DhL3BJ4me72Dj2g+IGqrJ
	 TQ93pJsQFehNA==
Date: Mon, 6 Jan 2025 17:59:01 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com
Subject: Re: [PATCH v5 5/6] arm64: dts: qcom: Add support for QCS9075 Ride &
 Ride-r3
Message-ID: <44tjbxjrigbfu4dfrlbvdprablyhf3i5u4fvg3iwucfvmvljqv@t43py5mb4rg3>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
 <20241229152332.3068172-6-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241229152332.3068172-6-quic_wasimn@quicinc.com>

On Sun, Dec 29, 2024 at 08:53:31PM +0530, Wasim Nazir wrote:
> Add device tree support for QCS9075 Ride & Ride-r3 boards.
> 
> QCS9075 lacks the safety monitoring features of Safety-Island (SAIL)
> subsystem which is available in QCS9100, and it affects thermal
> management.
> 
> Also, between ride and ride-r3 ethernet phy is different.
> Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.
> 

This commit message is written under the assumption that the reader
first reads the patch, to determine what QCS9075 subtracts features
from.

Please describe what the QCS9075 Ride and Ride R3 are, if it's just a
variant of QCS9100 without SAIL, write that - and if that is all the
difference, then Dmitry's request makes total sense.


Also, subject prefix doesn't match upstream style. Prefix with the
subsystem/platform/device and avoid "for XYZ". See "git log" on a few
of the other files to see how it should look like.

Thanks,
Bjorn

> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile            |  2 +
>  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 46 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 46 ++++++++++++++++++++
>  3 files changed, 94 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 78613a1bd34a..41cb2bbd3472 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -118,6 +118,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> new file mode 100644
> index 000000000000..d9a8956d3a76
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include "sa8775p-ride.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
> +	compatible = "qcom,qcs9075-ride-r3", "qcom,qcs9075", "qcom,sa8775p";
> +};
> +
> +&ethernet0 {
> +	phy-mode = "2500base-x";
> +};
> +
> +&ethernet1 {
> +	phy-mode = "2500base-x";
> +};
> +
> +&mdio {
> +	compatible = "snps,dwmac-mdio";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	sgmii_phy0: phy@8 {
> +		compatible = "ethernet-phy-id31c3.1c33";
> +		reg = <0x8>;
> +		device_type = "ethernet-phy";
> +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <11000>;
> +		reset-deassert-us = <70000>;
> +	};
> +
> +	sgmii_phy1: phy@0 {
> +		compatible = "ethernet-phy-id31c3.1c33";
> +		reg = <0x0>;
> +		device_type = "ethernet-phy";
> +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <11000>;
> +		reset-deassert-us = <70000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> new file mode 100644
> index 000000000000..3b524359a72d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include "sa8775p-ride.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
> +	compatible = "qcom,qcs9075-ride", "qcom,qcs9075", "qcom,sa8775p";
> +};
> +
> +&ethernet0 {
> +	phy-mode = "sgmii";
> +};
> +
> +&ethernet1 {
> +	phy-mode = "sgmii";
> +};
> +
> +&mdio {
> +	compatible = "snps,dwmac-mdio";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	sgmii_phy0: phy@8 {
> +		compatible = "ethernet-phy-id0141.0dd4";
> +		reg = <0x8>;
> +		device_type = "ethernet-phy";
> +		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <11000>;
> +		reset-deassert-us = <70000>;
> +	};
> +
> +	sgmii_phy1: phy@a {
> +		compatible = "ethernet-phy-id0141.0dd4";
> +		reg = <0xa>;
> +		device_type = "ethernet-phy";
> +		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <11000>;
> +		reset-deassert-us = <70000>;
> +	};
> +};
> --
> 2.47.0
> 

