Return-Path: <linux-arm-msm+bounces-35496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E47B79ABC03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 05:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48BE4B219A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 03:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B75638289A;
	Wed, 23 Oct 2024 03:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tAReNJPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA26A48;
	Wed, 23 Oct 2024 03:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729653148; cv=none; b=jThRCFdZmEVuwWqqsa4kiLMTtQKOAnHjEx8FW3pah/h+UlcGjGx2E+tj+l8rJA42p5uuYgzxVP88BVr3hjmONVfXADFCnGYPGXbCKAQngbi6R0na7S1cTT+PWAGKIV+WJUE3ZuA8E1+L9Pu5EMoAekbMWGRP9LYdsmthHrYFv6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729653148; c=relaxed/simple;
	bh=/cRm+yhf9/g6LLOJDGAu3Sj+nmlDEdcWa7TkjJMKzGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPTkyO4xDlEZl034Zd8zXZxd1DdFH0okdSDd2vGo+OqTbGjalpQFANXiaJH0sseuve4MeNuGNe2bQHHlA9doW4eRttjTYb1ZRQC+lPODfr9d5Yi5MgP8PnniAL6tZgtw1VO/Cl70fzDLnUDF4jI28B/+gPptd/k8q5RO62pVaQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tAReNJPI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAD0C4CEC3;
	Wed, 23 Oct 2024 03:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729653148;
	bh=/cRm+yhf9/g6LLOJDGAu3Sj+nmlDEdcWa7TkjJMKzGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tAReNJPI6WLIonXKW9zcLjyRjuGeuGFCmtav5L88BvCeScXSkfF+qovo6+Wx7TrVn
	 HEdFiuVqOOmPDor1gjJ8TjuisgaAmStYenEuagRa4OqymP85uHVznVpX4DLfj0rnCm
	 KRGg0I34y3hmZIR5M8ndXtCVj0AQjBpGk8HT5r00UIVwuCMFZXR2KM/gG5epuBQHh+
	 r4Uaki55xuHdfSBImpP8VoZL2c5TI0FjKsJnYRSfhqZRFIsPbfI/sjd1kEksi3mB2J
	 s86Be++Xn3bMSRQ7x2o+6/VkyfuNwOQ733y0voga/WhQ7OsMt+xLwemeYLgR6PQoGN
	 bJNbymxtlrQqA==
Date: Tue, 22 Oct 2024 22:12:24 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Taniya Das <quic_tdas@quicinc.com>, 
	Jishnu Prakash <quic_jprakash@quicinc.com>, Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Subject: Re: [PATCH 4/5] arm64: dts: qcom: Add base sm8750 dtsi and mtp and
 qrd dts
Message-ID: <qqdtpvx6dnot2ncmj7khzpyaftnfjyrxmg5bz6t6id7uwutcyc@qvrybabbxxlp>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <20241021232114.2636083-5-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021232114.2636083-5-quic_molvera@quicinc.com>

On Mon, Oct 21, 2024 at 04:21:13PM GMT, Melody Olvera wrote:

2 "and", 2 "dts" and a "dtsi" in the subject. I'd prefer a more
succinct:

"arm64: dts: qcom: Add SM8750 platform, mtp and qrd"

> Add base dtsi for the sm8750 SoC describing the CPUs, GCC and
> RPMHCC clock controllers, geni UART, interrupt controller, TLMM,
> reserved memory, interconnects, regulator, and SMMU nodes. Also add
> MTP and QRD board dts files for sm8750.
> 

Nice.

> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Co-developed-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |    2 +
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts |  968 ++++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts |  965 ++++++++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2903 +++++++++++++++++++++++
>  4 files changed, 4838 insertions(+)

Most reviewers will prefer the platform and individual devices to be
added in separate patches, to not hit 5kloc. I don't mind it...

>  create mode 100644 arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8750.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 065bb19481c1..3bedfa6b37f2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -269,6 +269,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> new file mode 100644
> index 000000000000..e1a94dc76e2f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -0,0 +1,968 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8750.dtsi"
> +#include "pm8010.dtsi"
> +#include "pm8550.dtsi"
> +#define PMK8550VE_SID 8
> +#include "pm8550ve.dtsi"
> +#include "pmd8028.dtsi"
> +#include "pmih0108.dtsi"
> +#include "pmk8550.dtsi"
> +#include "pmr735d_a.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SM8750 MTP";
> +	compatible = "qcom,sm8750-mtp", "qcom,sm8750";

Can we please here have a:

	chassis-type = "handset";

> +
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> new file mode 100644
> index 000000000000..af0174d95e3a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
> @@ -0,0 +1,965 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8750.dtsi"
> +#include "pm8010.dtsi"
> +#include "pm8550.dtsi"
> +#define PMK8550VE_SID 8
> +#include "pm8550ve.dtsi"
> +#include "pmd8028.dtsi"
> +#include "pmih0108.dtsi"
> +#include "pmk8550.dtsi"
> +#include "pmr735d_a.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SM8750 QRD";
> +	compatible = "qcom,sm8750-qrd", "qcom,sm8750";

chassis-type please.

> +
> +	aliases {
> +		serial0 = &uart7;
> +	};
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> new file mode 100644
> index 000000000000..98ab82caa007
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -0,0 +1,2903 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8750-gcc.h>
> +#include <dt-bindings/clock/qcom,sm8750-tcsr.h>
> +#include <dt-bindings/dma/qcom-gpi.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
> +#include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom,rpmhpd.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen { };

You should be able to omit this...

> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		CPU0: cpu@0 {

I just merged a cleanup series from Krzysztof, making all labels lower
case. So, I'd unfortunately like you to do the same...

> +			device_type = "cpu";
> +			compatible = "qcom,oryon";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&L2_0>;
> +			power-domains = <&CPU_PD0>;
> +			power-domain-names = "psci";
> +			cpu-idle-states = <&CLUSTER0_C4>;
> +
> +			L2_0: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-unified;
> +			};
> +		};
[..]
> +	memory@a0000000 {
> +		device_type = "memory";
> +		/* We expect the bootloader to fill in the size */
> +		reg = <0x0 0xa0000000 0x0 0x0>;

gunyah_hyp_mem below is at 0x80000000, so I presume it's not just size
that's being updated?

> +	};
> +
[..]
> +	soc: soc@0 {
[..]
> +		};
> +
> +

Extra newline, didn't checkpatch --strict complain about that/

> +		cnoc_main: interconnect@1500000 {
> +			compatible = "qcom,sm8750-cnoc-main";
> +			reg = <0x0 0x1500000 0x0 0x16080>;

Until here you padded the base address to 8 digits, making it easy for
humans to keep nodes sorted (by address). Please correct the remaining
7-digit nodes as well, to make it easier for future contributors to get
their ordering right.

> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
> +
> +		config_noc: interconnect@1600000 {
> +			compatible = "qcom,sm8750-cnoc-cfg";
> +			reg = <0x0 0x1600000 0x0 0x6200>;
> +			qcom,bcm-voters = <&apps_bcm_voter>;
> +			#interconnect-cells = <2>;
> +		};
[..]
> +		apps_rsc: rsc@16500000 {
> +			compatible = "qcom,rpmh-rsc";
> +			reg = <0x0 0x16500000 0x0 0x10000>,
> +			      <0x0 0x16510000 0x0 0x10000>,
> +			      <0x0 0x16520000 0x0 0x10000>;
> +			reg-names = "drv-0",
> +				    "drv-1",
> +				    "drv-2";
> +			qcom,drv-count = <3>;
> +
> +			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,tcs-offset = <0xd00>;
> +			qcom,drv-id = <2>;
> +			qcom,tcs-config = <ACTIVE_TCS    3>, <SLEEP_TCS     2>,
> +					  <WAKE_TCS      2>, <CONTROL_TCS   0>;

Is 0 CONTROL_TCSs correct?

> +
> +			label = "apps_rsc";
> +

Regards,
Bjorn

