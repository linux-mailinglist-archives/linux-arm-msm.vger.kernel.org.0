Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9B439FCAD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 18:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbhFHQls (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 12:41:48 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:26591 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231175AbhFHQlr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 12:41:47 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623170383; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LL6+qgW3rmuRKM9S+PCBqJt/OfcrnMD/aBcCL3HKNniaYUOO9Fmh/wW50KJ+lFYtUJ
    rkugGASHwEc1CHcCkgywmm+LbtOeGSspZWLaCMad1eCPTyyV0m8Dcinp9TlJtcjXJcie
    XcTvRSpxYSbtgLeyZSaIqLuBMGWldAzFYLRFOrT9SoKuxcEfoBsjpeVivhMyfQ3+8oQf
    9z2FdZpxAH7HKfA8DY6I8u7vXotmA3mankWLKy+EdH2VeCnIl62s6RVsIfu3FKULi5fe
    tKkwx7Sw/vWH6DhBeDAaqkYWe2pX3qTGtwaAvyv0DZkyxMtMrTYkb1cpe1bHUMuoyFsj
    cyGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623170383;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=TsO8zQvAeuILETbsyy0wjP+jllz1JH7CujPdRGXvvo4=;
    b=Nio76JFLhrGOfQX0ghSa0O5VlpjPJlGgRjBvP9mgoXXsnRbd6qkn6PK9iu+KvU+iTe
    dxcSGbd6qoc5pg24LNDcP3kCMxjX2cuGb5V8FaG7gmlr2sz73BEoBa3QP0Pp74n6BTdj
    NfdnjB04/t1BFXkpbYtvEaAKKA4k/Ky20IYPjEE9Uo/aniVdeyeQ7jX6rUMhA9O4rUbU
    S4izJqHH9disCvsZPWA9HNaaqj0v9/4rQYMNe7QC9JPJnTD4GGdfAhivLaERVjRQMzfA
    wLBEE2sLAfOI+mHnM4eFB+MoVnulkyq3Xi6mnXfsk7FLlJpYs6oOcrL96sInPqdtpn1Q
    1LWA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623170383;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=TsO8zQvAeuILETbsyy0wjP+jllz1JH7CujPdRGXvvo4=;
    b=tkkz+lEedL3UbGv8FPiMM2FfiAeJSpHMVmgM5zSMpd5XOKja3hAz1P0QqRrfUeFFo7
    BxJlAKN1sNViM7MkTopSHnXTI0I0qFg41F1MRnUm0g8fbKa9WT3QdPtkCluSy8R0bQnp
    eEfjqUnrFLXr9B3ZZFTBWS5o+FiMti0Pa0phWqmY1vp9YvkzGEG7Vdoszj4l2cvc21oT
    pSmiDL9RObq0NBYorBIzTP9iN3GMLT6svtNvSdj7Dhy7kxyUuyFXsp0mJetjVnDtUu++
    t/9eySlRmpzqSiE2WNgb+wz0N4ZxFBrpu+UtuLfUbYTX6sZM9TmV6K0dhZD36mGo5tSr
    oG0w==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IcbDBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
    with ESMTPSA id y01375x58GdggUM
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 8 Jun 2021 18:39:42 +0200 (CEST)
Date:   Tue, 8 Jun 2021 18:39:36 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: Add support for SONY Xperia X
 Performance / XZ / XZs (msm8996, Tone platform)
Message-ID: <YL+dSBRwS3bf1ztb@gerhold.net>
References: <20210608152737.154218-1-konrad.dybcio@somainline.org>
 <20210608152737.154218-3-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608152737.154218-3-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 08, 2021 at 05:27:36PM +0200, Konrad Dybcio wrote:
> From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> 
> Add support for following boards:
> 
> - Xperia X Performance (dora)
> - Xperia XZ (kagura)
> - Xperia XZs (keyaki)
> 
> They are all based on the SONY Tone platform and feature largely similar hardware
> with the most obvious differences being lack of USB-C and ToF sensor on Dora and
> different camera sensor on Keyaki.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Changes since v2:
> - Remove unneeded labels from the pinned(pun intended)-by-default pins
> 
>  arch/arm64/boot/dts/qcom/Makefile             |   6 +
>  .../msm8996-pmi8996-sony-xperia-tone-dora.dts |  11 +
>  ...sm8996-pmi8996-sony-xperia-tone-kagura.dts |  11 +
>  ...sm8996-pmi8996-sony-xperia-tone-keyaki.dts |  11 +
>  .../qcom/msm8996-sony-xperia-tone-dora.dts    |  27 +
>  .../qcom/msm8996-sony-xperia-tone-kagura.dts  |  15 +
>  .../qcom/msm8996-sony-xperia-tone-keyaki.dts  |  26 +
>  .../dts/qcom/msm8996-sony-xperia-tone.dtsi    | 959 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/msm8996.dtsi         |  12 +-
>  9 files changed, 1072 insertions(+), 6 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-dora.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-kagura.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-pmi8996-sony-xperia-tone-keyaki.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
> 
[...]
> diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
> new file mode 100644
> index 000000000000..1f71b3b2dc57
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
> @@ -0,0 +1,959 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, AngeloGioacchino Del Regno
> + *                     <angelogioacchino.delregno@somainline.org>
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> +#include "msm8996.dtsi"
> +#include "pm8994.dtsi"
> +#include "pmi8994.dtsi"
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-mpp.h>
> +
> +/delete-node/ &hdmi;
> +/delete-node/ &hdmi_phy;
> +/delete-node/ &mdp5_intf3_out;

Is it not enough to set those to status = "disabled"? Kind of strange
that you have to delete those entirely. I guess ideally "hdmi" should
even be disabled by default in the SoC device tree.

> +/delete-node/ &slpi_region;
> +/delete-node/ &venus_region;
> +/delete-node/ &zap_shader_region;
> +
> +/ {
> +	qcom,msm-id = <246 0x30001>; /* MSM8996 V3.1 (Final) */
> +	qcom,pmic-id = <0x20009 0x2000a 0 0>; /* PM8994 + PMI8994 */
> +	qcom,board-id = <8 0>;
> +
> +	chosen {
> +		/*
> +		 * Due to an unknown-for-a-few-years regression,
> +		 * SDHCI only works on MSM8996 in PIO (lame) mode.
> +		 */
> +		bootargs = "sdhci.debug_quirks=0x40 sdhci.debug_quirks2=0x4 maxcpus=2";
> +	};
> +
> +	reserved-memory {
> +		ramoops@a7f00000 {
> +			compatible = "ramoops";
> +			reg = <0 0xa7f00000 0 0x100000>;
> +			record-size = <0x20000>;
> +			console-size = <0x40000>;
> +			ftrace-size = <0x20000>;
> +			pmsg-size = <0x20000>;
> +			ecc-size = <16>;
> +		};
> +
> +		cont_splash_mem: memory@83401000 {
> +			reg = <0 0x83401000 0 0x23ff000>;
> +			no-map;
> +		};
> +
> +		zap_shader_region: gpu@90400000 {
> +			compatible = "shared-dma-pool";
> +			reg = <0x0 0x90400000 0x0 0x2000>;
> +			no-map;
> +		};
> +
> +		slpi_region: memory@90500000 {
> +			reg = <0 0x90500000 0 0xa00000>;
> +			no-map;
> +		};
> +
> +		venus_region: memory@90f00000 {
> +			reg = <0 0x90f00000 0 0x500000>;
> +			no-map;
> +		};
> +	};
> +
> +	panel_tvdd: tvdd-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "panel_tvdd";
> +		gpio = <&tlmm 50 GPIO_ACTIVE_HIGH>;

regulator-fixed is active-low without "enable-active-high;"
If that's what you want it's probably more clear to write
GPIO_ACTIVE_LOW. Otherwise, perhaps you forgot that property? :)

Stephan
