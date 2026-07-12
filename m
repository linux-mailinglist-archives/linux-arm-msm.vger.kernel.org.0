Return-Path: <linux-arm-msm+bounces-118584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 96f4ArCvU2padgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:16:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD2674521F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 17:15:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=IYyszvIA;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118584-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118584-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A0BF3008777
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 15:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8969298CAF;
	Sun, 12 Jul 2026 15:15:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038ED224F3;
	Sun, 12 Jul 2026 15:15:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783869357; cv=none; b=qP+mGXcnR2pDFVqIXa06wdU/f2M6iJoiCyctuwQ+BVew1jEg5mtlDpZ/K3XqCKdIMbP2BtyxgdRugClkJ+uaJureQFSGV7I1RaUjXft+45KbbLyE+PYTqKK4gvh2/akjy7TnbftmNT2jGrwCbdcNyeWq3ON3wL1SlhwpLnPoY60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783869357; c=relaxed/simple;
	bh=XE5lwsEH/kW7aQubvLAe3Ub+mc/6FNWYgU7SNAA3eWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIH0uuM0K0gXIM9OD34qKWsEAco3P/AVlv+JAE8tGOR+vUX1Qq2tQDQDZulDoH5EGSkM9noj2FWCq5RQHW4Oit8c3We/9UsJiWnS/kJ4CtPEl96VZYfaTyDUdBZ0Am5p85LwqMfRdwSjnWSH7WFHjtfph7g80RBkYZcbUgQmTWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYyszvIA; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855C71F000E9;
	Sun, 12 Jul 2026 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783869355;
	bh=Ug/A8Mt2stwuZAGbWfcsYv71bhAdo3RZlhYLRyitxB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IYyszvIAQqjTz1YAkXO3IYSAs/OPQPJNs1RP1/iMU6iXq7of8DLP8y2kjvBh+KBYH
	 lx31tacmTX8gsHJsxD+pR/7vaSH1FjcRbdp4GnX6lDGzkKDPUKsulBEKsGPnZTvLn/
	 PHQeol5GXf+IKIbbAyghiZCVtUhrqzHFkM2QuRwZ0cyTRUn7r4DAu65PJEAKNUsO9b
	 FMfVDcw0sesah+InAzcf9V3TMaUBGj+ohFdpYwmwFXZ/E3KgLe6AsGgtZoUHqbzQCJ
	 sgINSiiH18rebYRhHA+QQMsNdlHcLH5P5OtUm2B9nLKfOhwwrXsSt5K1V9Tj9BrYge
	 PwEzqB264bCSg==
Date: Sun, 12 Jul 2026 10:15:52 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: Add device tree for IQ10 RRD
 board
Message-ID: <alOuTNcCjaEkHn0e@baldur>
References: <20260709132013.4096850-1-shengchao.guo@oss.qualcomm.com>
 <20260709132013.4096850-8-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709132013.4096850-8-shengchao.guo@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shengchao.guo@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:deepti.jaggi@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-118584-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,baldur:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4FD2674521F

On Thu, Jul 09, 2026 at 09:20:13PM +0800, Shawn Guo wrote:
> Add initial device tree for the Qualcomm IQ10 RRD board, which is built

I think this is the first time we see this new TLA, please provide its
expansion as well.

> on Nord Embedded variant. Enable the debug UART, UFS storage, PMICs,
> I2C and SPI.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile     |   1 +
>  arch/arm64/boot/dts/qcom/iq10-rrd.dts | 588 ++++++++++++++++++++++++++

I want all Nord-based boards prefixed with "nord-". I shouldn't have to
open the file and look at the includes to figure out which family it
relates to.

>  2 files changed, 589 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/iq10-rrd.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 8e6ef4116146..75d29d602e77 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9650-rdp488.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= iq10-rrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= kaanapali-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk.dtb
> diff --git a/arch/arm64/boot/dts/qcom/iq10-rrd.dts b/arch/arm64/boot/dts/qcom/iq10-rrd.dts
> new file mode 100644
> index 000000000000..39d254b49c14
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/iq10-rrd.dts
> @@ -0,0 +1,588 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024-2025, Qualcomm Innovation Center, Inc. All rights reserved.

What?!

Regards,
Bjorn

> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "nord-embedded.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. IQ10 RRD";
> +	compatible = "qcom,iq10-rrd", "qcom,nord";
> +
> +	aliases {
> +		serial0 = &uart15;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	clocks {
> +		xo_board: xo-board-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		bi_tcxo_div2: bi-tcxo-div2-clk {
> +			compatible = "fixed-factor-clock";
> +			#clock-cells = <0>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-mult = <1>;
> +			clock-div = <2>;
> +		};
> +
> +		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
> +			compatible = "fixed-factor-clock";
> +			#clock-cells = <0>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
> +			clock-mult = <1>;
> +			clock-div = <2>;
> +		};
> +	};
> +
> +	ufs_vdd_hba: regulator-ufs-vdd-hba {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ufs_vdd_hba";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-always-on;
> +	};
> +
> +	ufs_vccq2: regulator-ufs-vccq2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "ufs_vccq2";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&apps_rsc {
> +	/* PMIC A - Kobra_MM (PMM8650AU) - SID 0x0, Bus E0 */
> +	regulators-0 {
> +		compatible = "qcom,pmm8654au-rpmh-regulators";
> +		qcom,pmic-id = "A_E0";
> +
> +		/* LDO Regulators */
> +		vreg_l4a_1p2: ldo4 {
> +			regulator-name = "vreg_l4a_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l6a_1p2: ldo6 {
> +			regulator-name = "vreg_l6a_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7a_1p2: ldo7 {
> +			regulator-name = "vreg_l7a_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8a_1p8: ldo8 {
> +			regulator-name = "vreg_l8a_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* SMPS Regulators */
> +		vreg_s1a_vdd2h_l: smps1 {
> +			regulator-name = "vreg_s1a_vdd2h_l";
> +			regulator-min-microvolt = <900000>;
> +			regulator-max-microvolt = <1100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +
> +		vreg_s3a_1p8: smps3 {
> +			regulator-name = "vreg_s3a_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +
> +		vreg_s5a_mv: smps5 {
> +			regulator-name = "vreg_s5a_mv";
> +			regulator-min-microvolt = <1328000>;
> +			regulator-max-microvolt = <1370000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +
> +		vreg_s6a_vddq_l: smps6 {
> +			regulator-name = "vreg_s6a_vddq_l";
> +			regulator-min-microvolt = <500000>;
> +			regulator-max-microvolt = <570000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s8a_vdda_ebi: smps8 {
> +			regulator-name = "vreg_s8a_vdda_ebi";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +	};
> +
> +	/* PMIC E - Kai_MV - SID 0x4, Bus E0 */
> +	regulators-1 {
> +		compatible = "qcom,pmau0102-rpmh-regulators";
> +		qcom,pmic-id = "E_E0";
> +
> +		/* LDO Regulators */
> +		vreg_l1e_0p9: ldo1 {
> +			regulator-name = "vreg_l1e_0p9";
> +			regulator-min-microvolt = <936000>;
> +			regulator-max-microvolt = <936000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2e_0p9: ldo2 {
> +			regulator-name = "vreg_l2e_0p9";
> +			regulator-min-microvolt = <936000>;
> +			regulator-max-microvolt = <936000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3e_1p8: ldo3 {
> +			regulator-name = "vreg_l3e_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* SMPS Regulators */
> +		vreg_s1e_nsp3: smps1 {
> +			regulator-name = "vreg_s1e_nsp3";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s7e_mxa: smps7 {
> +			regulator-name = "vreg_s7e_mxa";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +	};
> +
> +	/* PMIC F - Kai_MV - SID 0x5, Bus E0 */
> +	regulators-2 {
> +		compatible = "qcom,pmau0102-rpmh-regulators";
> +		qcom,pmic-id = "F_E0";
> +
> +		/* LDO Regulators */
> +		vreg_l1f_vdd2l: ldo1 {
> +			regulator-name = "vreg_l1f_vdd2l";
> +			regulator-min-microvolt = <904000>;
> +			regulator-max-microvolt = <904000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3f_vdd1: ldo3 {
> +			regulator-name = "vreg_l3f_vdd1";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* SMPS Regulators */
> +		vreg_s1f_nsp1: smps1 {
> +			regulator-name = "vreg_s1f_nsp1";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s7f_lv_sub: smps7 {
> +			regulator-name = "vreg_s7f_lv_sub";
> +			regulator-min-microvolt = <1036000>;
> +			regulator-max-microvolt = <1136000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +
> +		vreg_s8f_vddq_h: smps8 {
> +			regulator-name = "vreg_s8f_vddq_h";
> +			regulator-min-microvolt = <500000>;
> +			regulator-max-microvolt = <570000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	/* PMIC G - Kai_MV - SID 0x6, Bus E0 */
> +	regulators-3 {
> +		compatible = "qcom,pmau0102-rpmh-regulators";
> +		qcom,pmic-id = "G_E0";
> +
> +		/* LDO Regulators */
> +		vreg_l2g_0p7: ldo2 {
> +			regulator-name = "vreg_l2g_0p7";
> +			regulator-min-microvolt = <752000>;
> +			regulator-max-microvolt = <752000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* SMPS Regulators */
> +		vreg_s1g_nsp0: smps1 {
> +			regulator-name = "vreg_s1g_nsp0";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5g_vdd2h_h: smps5 {
> +			regulator-name = "vreg_s5g_vdd2h_h";
> +			regulator-min-microvolt = <1080000>;
> +			regulator-max-microvolt = <1150000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +		};
> +	};
> +
> +	/* PMIC H - Kai_MV - SID 0x7, Bus E0 */
> +	regulators-4 {
> +		compatible = "qcom,pmau0102-rpmh-regulators";
> +		qcom,pmic-id = "H_E0";
> +
> +		/* LDO Regulators */
> +		vreg_l1h_0p9: ldo1 {
> +			regulator-name = "vreg_l1h_0p9";
> +			regulator-min-microvolt = <904000>;
> +			regulator-max-microvolt = <904000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2h_1p2: ldo2 {
> +			regulator-name = "vreg_l2h_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* SMPS Regulators */
> +		vreg_s1h_nsp2: smps1 {
> +			regulator-name = "vreg_s1h_nsp2";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5h_mxc: smps5 {
> +			regulator-name = "vreg_s5h_mxc";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	/* PMIC I - Kai_MV - SID 0x8, Bus E0 */
> +	regulators-5 {
> +		compatible = "qcom,pmau0102-rpmh-regulators";
> +		qcom,pmic-id = "I_E0";
> +
> +		/* LDO Regulators */
> +		vreg_l1i_0p9: ldo1 {
> +			regulator-name = "vreg_l1i_0p9";
> +			regulator-min-microvolt = <912000>;
> +			regulator-max-microvolt = <912000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2i_1p2: ldo2 {
> +			regulator-name = "vreg_l2i_1p2";
> +			regulator-min-microvolt = <1200000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3i_2p5: ldo3 {
> +			regulator-name = "vreg_l3i_2p5";
> +			regulator-min-microvolt = <2504000>;
> +			regulator-max-microvolt = <2504000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* SMPS Regulators */
> +		vreg_s2i_gfx0: smps2 {
> +			regulator-name = "vreg_s2i_gfx0";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s7i_mm: smps7 {
> +			regulator-name = "vreg_s7i_mm";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	/* PMIC J - Kai_MV - SID 0x9, Bus E0 */
> +	regulators-6 {
> +		compatible = "qcom,pmau0102-rpmh-regulators";
> +		qcom,pmic-id = "J_E0";
> +
> +		/* SMPS Regulators */
> +		vreg_s7j_gfx1: smps7 {
> +			regulator-name = "vreg_s7j_gfx1";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	/* PMIC K - Kai_MV - SID 0xA, Bus E0 */
> +	regulators-7 {
> +		compatible = "qcom,pmau0102-rpmh-regulators";
> +		qcom,pmic-id = "K_E0";
> +
> +		/* LDO Regulators */
> +		vreg_l1k_vdd2l: ldo1 {
> +			regulator-name = "vreg_l1k_vdd2l";
> +			regulator-min-microvolt = <904000>;
> +			regulator-max-microvolt = <904000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2k_0p9: ldo2 {
> +			regulator-name = "vreg_l2k_0p9";
> +			regulator-min-microvolt = <880000>;
> +			regulator-max-microvolt = <880000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3k_vdd1: ldo3 {
> +			regulator-name = "vreg_l3k_vdd1";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-always-on;
> +			regulator-boot-on;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +
> +	/* PMIC L - Kai_MV - SID 0xB, Bus E0 */
> +	regulators-8 {
> +		compatible = "qcom,pmau0102-rpmh-regulators";
> +		qcom,pmic-id = "L_E0";
> +
> +		/* LDO Regulators */
> +		vreg_l3l_1p8: ldo3 {
> +			regulator-name = "vreg_l3l_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		/* SMPS Regulators */
> +		vreg_s1l_nsp_mxc: smps1 {
> +			regulator-name = "vreg_s1l_nsp_mxc";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s2l_cx: smps2 {
> +			regulator-name = "vreg_s2l_cx";
> +			regulator-min-microvolt = <300000>;
> +			regulator-max-microvolt = <1200000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&i2c7 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c12 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&i2c18 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	audio_dac: dac@31 {
> +		compatible = "ti,pcm1681";
> +		reg = <0x31>;
> +
> +		#sound-dai-cells = <0>;
> +	};
> +};
> +
> +&i2c19 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +};
> +
> +&spi16 {
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	status = "okay";
> +};
> +
> +&uart15 {
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 181 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l3i_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l2i_1p2>;
> +	vccq-max-microamp = <1200000>;
> +	vccq2-supply = <&ufs_vccq2>;
> +	vdd-hba-supply = <&ufs_vdd_hba>;
> +	status = "okay";
> +};
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l1i_0p9>;
> +	vdda-pll-supply = <&vreg_l2h_1p2>;
> +	status = "okay";
> +};
> -- 
> 2.43.0
> 

