Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4204B2BBCF9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Nov 2020 05:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgKUE20 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 23:28:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726433AbgKUE20 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 23:28:26 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A539C061A47
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 20:28:26 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id k3so10773067otp.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 20:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RrVnhY0xrtX6cR24sK+ovHu3EWIBRCE8PhOJl9rEWDw=;
        b=GQUkUyQRpyly/oDa3dMP5A+gQHJz2hBEmNlC83tHBJUagwei/0Ulh6kQWb95h2POhl
         pXlNDF+SbIr9jsuaRS+DjXMJ7+1kVpugsQDRVyqIwo3CJFs04hNf3TnyTbvMPofgMzGN
         AlqBox4+gu8wNd+wDneX5djCFxAwssnyGEriQ5RjLgtFGHqBnvN3a0pou3dsVglfbjkd
         4y1cu10c+h/ug7w5cJ4p8uQklZeUR1yLjk19+0anTkoscq76WU+DsFzFLnd1XvailJOo
         ByKHTpqEZNS2pvjRdTvo4jPqxwdZ0UJ4BCIFHnOcpaP5tiQtIccZYxIY+Dr63ztgHQHx
         VR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RrVnhY0xrtX6cR24sK+ovHu3EWIBRCE8PhOJl9rEWDw=;
        b=iXi6jd7nwIVGHtlLVWRTYtc19HXtJnHOWuLgJ1Jb4hyW4fkoCauAfAJhMe8hbPjfpU
         xk3/k1tALStyGjE4MvjmIPXqr5/19K/piPuK8UgN+xGuPRMl2JtDOmPLn+KyTA6NW8wM
         w5ESrlxQm/D7dm2d3E3p9TudWhLLKYFFNuD+4KPCSJBSr9xPEi75Os70BX+wjT5/IpWJ
         8y+GJ5Qf3p/5yYB45iSRe5aW/Ra01IXpoCj+2873R15gVBAW+6Ro9p8xV9XNfa46d6bu
         I836w74VA6Fe813ffmKpkmPpS0CLZgkT5qCMGqYVb5oO4sWOnG7o39253XOFbW7QSnK3
         4wXQ==
X-Gm-Message-State: AOAM532pgjU+oQU155DucTyZFSvA7xoMqhgF+7d0DfQDUwtOwd5Q+PRZ
        BwBu2zawTssWUpqRW6tlTmJ1a8IdRHOkiw==
X-Google-Smtp-Source: ABdhPJwSyOT/wgZnmmxQndxC5aRFDY7aF/v4m9IczY3MdDxKFtfG+54j0fELNhNf6ZdclQiK/Nyi3A==
X-Received: by 2002:a05:6830:1308:: with SMTP id p8mr14898630otq.330.1605932905627;
        Fri, 20 Nov 2020 20:28:25 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t19sm2522035otp.51.2020.11.20.20.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 20:28:24 -0800 (PST)
Date:   Fri, 20 Nov 2020 22:28:23 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: sdm845: add oneplus 6/t devices
Message-ID: <20201121042823.GM8532@builder.lan>
References: <20201112161920.2671430-1-caleb@connolly.tech>
 <20201112161920.2671430-4-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112161920.2671430-4-caleb@connolly.tech>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 12 Nov 10:21 CST 2020, Caleb Connolly wrote:
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> new file mode 100644
> index 000000000000..4e6477f1e574
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -0,0 +1,822 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SDM845 OnePlus 6(T) (enchilada / fajita) common device tree source
> + *
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/input/linux-event-codes.h>

Please keep these sorted alphabetically.

> +#include "sdm845.dtsi"
> +
> +// Needed for some GPIO (like the volume buttons)

This is or is going to be needed for more things, so feel free to skip
this comment.

> +#include "pm8998.dtsi"
> +#include "pmi8998.dtsi"
> +
> +/ {
> +
> +	aliases {
> +		hsuart0 = &uart6;
> +	};
> +
> +	vph_pwr: vph-pwr-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +	};
> +
> +	/*
> +	 * Apparently RPMh does not provide support for PM8998 S4 because it
> +	 * is always-on; model it as a fixed regulator.
> +	 */
> +	vreg_s4a_1p8: pm8998-smps4 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_s4a_1p8";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		vin-supply = <&vph_pwr>;
> +	};
> +
> +	/*
> +	 * The touchscreen regulator seems to be controlled somehow by a gpio.
> +	 */
> +	ts_1p8_supply: ts_1v8_regulator {

Please don't use _ in the node name.

> +		compatible = "regulator-fixed";
> +		regulator-name = "ts_1p8_supply";
> +
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 88 0>;
> +		enable-active-high;
> +		regulator-boot-on;
> +	};
> +
> +	gpio_tristate_key: gpio-keys {
> +		compatible = "gpio-keys";
> +		label = "Tri-state keys";

What kind of button is this?

> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tri_state_key_default>;
> +
> +		state-top {
> +			label = "Tri-state key top";
> +			linux,code = <KEY_MACRO1>;
> +			interrupt-parent = <&tlmm>;
> +			interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
> +			debounce-interval = <500>;
> +			linux,can-disable;
> +		};
> +
> +		state-middle {
> +			label = "Tri-state key middle";
> +			linux,code = <KEY_MACRO2>;
> +			interrupt-parent = <&tlmm>;
> +			interrupts = <52 IRQ_TYPE_EDGE_FALLING>;
> +			debounce-interval = <500>;
> +			linux,can-disable;
> +		};
> +
> +		state-bottom {
> +			label = "Tri-state key bottom";
> +			linux,code = <KEY_MACRO3>;
> +			interrupt-parent = <&tlmm>;
> +			interrupts = <126 IRQ_TYPE_EDGE_FALLING>;
> +			debounce-interval = <500>;
> +			linux,can-disable;
> +		};
> +	};
[..]
> +/* Reserved memory changes */
> +/delete-node/ &rmtfs_mem;
> +
> +/ {

You already have one top-level section higher up, please group this in
there as well.

> +	reserved-memory {
[..]
> +&mdss {

To avoid trouble finding your way around this file in the future I would
prefer if you sorted the nodes alphabetically.

> +	status = "okay";
> +};
> +
[..]
> +&i2c12 {
> +	status = "okay";
> +
> +	touchscreen: synaptics-rmi4-i2c@20 {

You don't reference &touchscreen, so please omit this..

Regards,
Bjorn
