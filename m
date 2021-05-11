Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793E6379EB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 06:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhEKEoW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 May 2021 00:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhEKEoW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 May 2021 00:44:22 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA225C06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:43:16 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id i23-20020a9d68d70000b02902dc19ed4c15so12486301oto.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 21:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t6IRcBGYCOTUbL8z6SUEUBoF0mJvtqPt5zeQmnnFxik=;
        b=G3qHG41R4J+SIQ0TOHoAYpj+/ngyVrduOebcDHoEwTIEd+jmoCcwygmQTtrPv9EaOt
         Ckz7VEsRZ0Rs759+n+ZR4XChA9kt0snmUyX2g0bmAhuXoVshOWQ5GBxxZ3i1F0b8yVdq
         H3wQkzWiaKjDPbcay0t28gvzzUng8UBPxqOSv9S+VGAh4Bvy4i+F0MzLUpQzVLLFCL7C
         pwdESHLLy3ei9Qw+nxeIu/lBlAeixxlFL4e4gwNGZewHMxqrN5Nt0QdGKnxgRivz6VYD
         zaDOObGJPy5H+a5mbRx5gM5s4wgdjPXgQ67h6m2ObdV4hxZjJ8YGl31t71/8ARxbEowZ
         M/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t6IRcBGYCOTUbL8z6SUEUBoF0mJvtqPt5zeQmnnFxik=;
        b=YtiJPMXMnjhnS+tFp2sQ7LmG9JJwl/39CMTDMK2oSrxE+AuwdwE0NwMsRMWDv1u7yQ
         wLFdNF2+QjYDoaRzCsTWCO2EtapWE3Mqs/KkzHEdETYEiyrz3hGYASeQ7/H/XYmhZMc0
         u+YAKZRNFGIh1JnlQlCholQaxpGpz+Me7H46H+4//RBzaUr/u0MweZiBZdDY33GH/xT9
         cUW0N5GHM7Ap8A54tNvWddc+p0xpLvUJYcZbYG00pA0e2eJAJxP7BwUrF8zYXiduJy+m
         56CH3pRwqpFRL08bOMhIHAajrV8Xci9C766jbcJfM8f5mG/uUjy5FrWijCk2cg8+HtV9
         2o5Q==
X-Gm-Message-State: AOAM533s1ECv+hIPB0tvqIseZYJIXhtNoF2yihDlWEUSFAXWT5x1a1yC
        AQUGbw8QW/cl80cWRI8ddghUuswgopQVTQ==
X-Google-Smtp-Source: ABdhPJxzymCUyIAna2oQgiJVXDT4++v8/avfRVij5tHOOtsqFayJF3Xbx0o8b1O7ZNsi9NI7ZofNYw==
X-Received: by 2002:a9d:7e91:: with SMTP id m17mr24115875otp.192.1620708196065;
        Mon, 10 May 2021 21:43:16 -0700 (PDT)
Received: from yoga ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
        by smtp.gmail.com with ESMTPSA id c9sm3082269ooq.31.2021.05.10.21.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 21:43:15 -0700 (PDT)
Date:   Mon, 10 May 2021 23:43:12 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH] arm64: dts: qcom: add initial device-tree for Microsoft
 Surface Duo
Message-ID: <20210511044312.GK2484@yoga>
References: <20210510120547.1315536-1-balbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210510120547.1315536-1-balbi@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 10 May 07:05 CDT 2021, Felipe Balbi wrote:

> From: Felipe Balbi <felipe.balbi@microsoft.com>
> 
> Microsoft Surface Duo is based on SM8150 chipset. This new Device Tree
> is a copy of sm8150-mtp with a the addition of the volume up key and
> relevant i2c nodes.
> 

This is really nice to see. Some comments below.

[..]
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
> new file mode 100644
> index 000000000000..f53d4b3dd482
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
> @@ -0,0 +1,545 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (C) 2021, Microsoft Corporation
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include "sm8150.dtsi"
> +#include "pm8150.dtsi"
> +#include "pm8150b.dtsi"
> +#include "pm8150l.dtsi"
> +
> +/ {
> +	model = "Microsoft Surface Duo";
> +	compatible = "microsoft,surface-duo", "qcom,sm8150-mtp";
> +
> +	aliases {
> +		serial0 = &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
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
> +	 * Apparently RPMh does not provide support for PM8150 S4 because it
> +	 * is always-on; model it as a fixed regulator.
> +	 */
> +	vreg_s4a_1p8: pm8150-s4 {
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
> +	gpio_keys {
> +		compatible = "gpio-keys";
> +
> +		vol_up {
> +			label = "Volume Up";
> +			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +	};
> +};
> +
> +&tlmm {

Please sort all nodes alphabetically.

> +	da7280_intr_default: da7280-intr-default {
> +		pins = "gpio42";
> +		function = "gpio";
> +		bias-pull-up;
> +		input-enable;
> +	};
> +};
[..]
> +&remoteproc_adsp {
> +	status = "okay";
> +	firmware-name = "qcom/sm8150/adsp.mdt";

For platforms where we have a Dragonboard or similar we push the
test-signed firmware to qcom/<platform>/. I presume that the Duo
wouldn't run on the test-signed firmware.

So I think it's better to make this qcom/sm8150/ms-duo/adsp.mdt...from
the start.

> +};
> +
> +&remoteproc_cdsp {
> +	status = "okay";
> +	firmware-name = "qcom/sm8150/cdsp.mdt";
> +};
> +
> +&remoteproc_mpss {
> +	status = "okay";
> +	firmware-name = "qcom/sm8150/modem.mdt";
> +};
> +
> +&remoteproc_slpi {
> +	status = "okay";
> +	firmware-name = "qcom/sm8150/slpi.mdt";
> +};

Regards,
Bjorn
