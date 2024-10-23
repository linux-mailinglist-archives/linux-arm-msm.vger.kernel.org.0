Return-Path: <linux-arm-msm+bounces-35493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ECA9ABB52
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 04:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40BA01F229FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 02:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC3D381BA;
	Wed, 23 Oct 2024 02:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnbA5SIs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D64E20322;
	Wed, 23 Oct 2024 02:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729649395; cv=none; b=jeUyfsT4YMX/3v5bz/EFydhrD0ZffdIAw6qG2yriyH1sDkBCYiWIsktjk2kS9yx14CpZtXRl872S+0xduUT7cNqLww26jol5QRIy1WUR7zLWBStkOwgi1kumKemXdGpU99sudiyyJz11THCjfB3hhpROTCmMVMz6MdQAqUWbptk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729649395; c=relaxed/simple;
	bh=xBZxtNYntM7U8IxJuKull26tfjBq0CS2mL9SXRmQqEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u55pLjK3lCUuWBJhvigBYMvRDBNFrX0VFaS7FGX5iwchsKjIn0H0l6GPpAa63ZkzHwOmxhI9Z/DwbGFnWcEtrlgC/9+rH1HZHUZcIPhmyt47KP+z3IYQkXb0Kp5ULpvxPTIi3KsCEzLBWtbIbVsz2U1YTWEtKCcUYgItC5/HVJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnbA5SIs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F402AC4CEE3;
	Wed, 23 Oct 2024 02:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729649395;
	bh=xBZxtNYntM7U8IxJuKull26tfjBq0CS2mL9SXRmQqEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LnbA5SIsEQXUVEIuKJG8TQnbFXHXeOjNEtWkDwvyMMYBur1JSZdQ9RogYd/277rkG
	 wUiXLD7rrgggJClMqij1eBR72clRKFDjUHrnlXmN+FbKXeQNkDkChNf6kITGLyWCKd
	 WlN1bcynPyL+8JrBSr+q2rVRRevkec/rofgZ51/UbZ0eBr2DJSwy3Xs5gC8QoVcRFv
	 eLRNEbKw9yDMO7sG+jZvWcSsEGjJEvHzzegkdGafl+EfgVAAk9wK0JBx24Aiv67Yr0
	 3GHJPw5wSQpxlB+iMEQVb+MC6nx1jEG0FYyjCszavYPi/IJthrKsb7RlK7nbmHxfgl
	 4ev5JUQGzXiHA==
Date: Tue, 22 Oct 2024 21:09:51 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Tingguo Cheng <quic_tingguoc@quicinc.com>
Subject: Re: [PATCH v4 6/7] arm64: dts: qcom: add base QCS615 RIDE dts
Message-ID: <4bhsuysjm2uwkk52g4pkspiadsf5y4m2afotj7ggo2lnj24ip2@yqkijcdkiloj>
References: <20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com>
 <20241022-add_initial_support_for_qcs615-v4-6-0a551c6dd342@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-add_initial_support_for_qcs615-v4-6-0a551c6dd342@quicinc.com>

On Tue, Oct 22, 2024 at 04:54:34PM GMT, Lijuan Gao wrote:

"arm64: dts: qcom: add base QCS615 RIDE dts"
         ^ You already have dts here     ^ no need to put it here again


I'd suggest that we make the subject "arm64: dts: qcom: Add QCS615 RIDE board"

> Add initial support for Qualcomm QCS615 RIDE board and enable
> the QCS615 RIDE board to shell with uart console.
> 
> [Tingguo: added regulator nodes]

Are you saying:
- Lijuan wrote the patch
- Lijuan signed the certificate of origin (i.e. he's allowed to
  contribute its content)
- Tingguo added regulator nodes
- Tingguo signed the certificate of origin (i.e. patch was based on work
  that was certified)
  
Or are you saying:
"Tingguo and I developed this patch in pair programming fashion"

If so, I'd suggest dropping the "[Tingguo:...]" line.

> Co-developed-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 219 +++++++++++++++++++++++++++++++
>  2 files changed, 220 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 065bb19481c1..f14643187cac 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -110,6 +110,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> new file mode 100644
> index 000000000000..ee6cab3924a6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -0,0 +1,219 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "qcs615.dtsi"
> +/ {
> +	model = "Qualcomm Technologies, Inc. QCS615 Ride";
> +	compatible = "qcom,qcs615-ride", "qcom,qcs615";
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	clocks {
> +		sleep_clk: sleep-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		xo_board_clk: xo-board-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <38400000>;
> +			#clock-cells = <0>;
> +		};
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		compatible = "qcom,pm8150-rpmh-regulators";
> +		qcom,pmic-id = "a";
> +
> +		vreg_s3a: smps3 {

You don't reference any of these regulators.

Can you please confirm that when you boot the qcs615 ride device with
this dtb it actually boots with a debug uart and does not crash when the
regulator framework disable all these "unused" regulators?

Regards,
Bjorn

> +			regulator-name = "vreg_s3a";
> +			regulator-min-microvolt = <600000>;
> +			regulator-max-microvolt = <650000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s4a: smps4 {
> +			regulator-name = "vreg_s4a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1829000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s5a: smps5 {
> +			regulator-name = "vreg_s5a";
> +			regulator-min-microvolt = <1896000>;
> +			regulator-max-microvolt = <2040000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_s6a: smps6 {
> +			regulator-name = "vreg_s6a";
> +			regulator-min-microvolt = <1304000>;
> +			regulator-max-microvolt = <1404000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l1a: ldo1 {
> +			regulator-name = "vreg_l1a";
> +			regulator-min-microvolt = <488000>;
> +			regulator-max-microvolt = <852000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2a: ldo2 {
> +			regulator-name = "vreg_l2a";
> +			regulator-min-microvolt = <1650000>;
> +			regulator-max-microvolt = <3100000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3a: ldo3 {
> +			regulator-name = "vreg_l3a";
> +			regulator-min-microvolt = <1000000>;
> +			regulator-max-microvolt = <1248000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5a: ldo5 {
> +			regulator-name = "vreg_l5a";
> +			regulator-min-microvolt = <875000>;
> +			regulator-max-microvolt = <975000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7a: ldo7 {
> +			regulator-name = "vreg_l7a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1900000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l8a: ldo8 {
> +			regulator-name = "vreg_l8a";
> +			regulator-min-microvolt = <1150000>;
> +			regulator-max-microvolt = <1350000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l10a: ldo10 {
> +			regulator-name = "vreg_l10a";
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l11a: ldo11 {
> +			regulator-name = "vreg_l11a";
> +			regulator-min-microvolt = <1232000>;
> +			regulator-max-microvolt = <1260000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l12a: ldo12 {
> +			regulator-name = "vreg_l12a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1890000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l13a: ldo13 {
> +			regulator-name = "vreg_l13a";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3230000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l15a: ldo15 {
> +			regulator-name = "vreg_l15a";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1904000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l16a: ldo16 {
> +			regulator-name = "vreg_l16a";
> +			regulator-min-microvolt = <3000000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-allow-set-load;
> +			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
> +						   RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l17a: ldo17 {
> +			regulator-name = "vreg_l17a";
> +			regulator-min-microvolt = <2950000>;
> +			regulator-max-microvolt = <3312000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
> +};
> +
> +&gcc {
> +	clocks = <&rpmhcc RPMH_CXO_CLK>,
> +		 <&rpmhcc RPMH_CXO_CLK_A>,
> +		 <&sleep_clk>;
> +};
> +
> +&qupv3_id_0 {
> +	status = "okay";
> +};
> +
> +&rpmhcc {
> +	clocks = <&xo_board_clk>;
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&watchdog {
> +	clocks = <&sleep_clk>;
> +};
> 
> -- 
> 2.46.0
> 

