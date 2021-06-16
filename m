Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 023F83A8D7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 02:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhFPAdv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 20:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbhFPAdv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 20:33:51 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE69C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 17:31:46 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 6-20020a9d07860000b02903e83bf8f8fcso729373oto.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 17:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QMHdARVwl+IDYkd7VNNhU2Et6yVJrDozO1ga8CSIno0=;
        b=pAiOg3t3XnlFAlKo9Aadp0BZ3zGRyxRQidsjlA9eWffnB2wjytihEVgwSRuMO+Nrcu
         wL4wCCEhjucGYpremAnRAyXYHytDYPJnKupmClJNqMMx9/QzwRLg5k4zMRMuQXRMn4kI
         DfKYUD7DJpChp5FT574jVYwVFNpxcTAz2W0/QHY2CCGxzjhsZTBq1Fa+VBmi9GKzgO1i
         0hxexfx5F0R3+C4dhRpntJ7ksZegDmhG0gU/yfLSv4/3WstS6BUgmmpT5LYsKOZ4mriY
         yS3svuvYRZ8RghoEn6DchW2IixI4VEfeMLZQnyRSU1RxWy+0Oifu549cYhUCGpp8y1+B
         4Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QMHdARVwl+IDYkd7VNNhU2Et6yVJrDozO1ga8CSIno0=;
        b=M1fpc/DYk20IaxnxkUFo5hlOEqtHvDJXSGXbwD1WfhrQG6vqxBUIFanZXaUYPR7IMQ
         pDSRMErsWkiR3HMZMUDnqztlOubcH6zmoBfPdznqp6mKZMk5YKzUp/OBYqMulmsUsHwq
         +v01HS6ItXHi2XVlDKi49chwvqP2IrX8kE+F9EeMzFqbE5j0eV3/acEwg5HSLuHHD6v1
         K4aHSY6Y+UAmhIKQzKM78qKxNe1TqC4bsuni8MwOvvnnwZ//LgdP8M1WEcwsygFABi58
         Fu8XP3k9woXcsXjqVOUfim8EBDfucKP2vkqkFVKqwPR13pXiPczbAqJzu5sEFVUT3KLc
         w+AQ==
X-Gm-Message-State: AOAM531a+J4abmHzQ602wEajjDrcL24f2cqy4Nynt2fh4dDq7PGMGWmK
        Jtmd4ff8BvnYs6EKhfEz+pEGMQ==
X-Google-Smtp-Source: ABdhPJxlCQHDVTx0W9WaTyg2sjAibZypse/HApK6/qMcAFAwx6bGTYr2uXc/g4mS01nhrMHiAQTv7g==
X-Received: by 2002:a05:6830:cd:: with SMTP id x13mr1563342oto.166.1623803505478;
        Tue, 15 Jun 2021 17:31:45 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i5sm123925oov.21.2021.06.15.17.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 17:31:45 -0700 (PDT)
Date:   Tue, 15 Jun 2021 19:31:43 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Martin Botka <martin.botka@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        konrad.dybcio@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH V3 2/2] arch: arm64: dts: qcom: Add support for Sony
 Xperia 10II
Message-ID: <YMlGb4W1c3VyKeCj@builder.lan>
References: <20210613080522.25230-1-martin.botka@somainline.org>
 <20210613080522.25230-2-martin.botka@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210613080522.25230-2-martin.botka@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 13 Jun 03:05 CDT 2021, Martin Botka wrote:

> This commits add support for Sony Xperia 10II based on the SM6125 SoC.
> 
> Currently working features:
> - dmesg output to bootloader preconfigured display
> - USB
> - eMMC
> - Volume down button
> 
> Signed-off-by: Martin Botka <martin.botka@somainline.org>
> ---
> Changes in v2, v3:
> None
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../qcom/sm6125-sony-xperia-seine-pdx201.dts  | 105 ++++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 456502aeee49..5a70dd9593c2 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -69,6 +69,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-enchilada.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-fajita.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> new file mode 100644
> index 000000000000..b1d6de430273
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm6125-sony-xperia-seine-pdx201.dts
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2021, Martin Botka <martin.botka@somainline.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sm6125.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +
> +/ {
> +	/* required for bootloader to select correct board */
> +	qcom,msm-id = <394 0x10000>; /* sm6125 v1 */
> +	qcom,board-id = <34 0>;
> +
> +	model = "Sony Xperia 10 II";
> +	compatible = "sony,pdx201", "qcom,sm6125";
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		framebuffer0: framebuffer@5c000000 {
> +			compatible = "simple-framebuffer";
> +			reg = <0 0x5c000000 0 (2520 * 1080 * 4)>;
> +			width = <1080>;
> +			height = <2520>;
> +			stride = <(1080 * 4)>;
> +			format = "a8r8g8b8";
> +		};
> +	};
> +
> +	extcon_usb: extcon-usb {
> +		compatible = "linux,extcon-usb-gpio";
> +		id-gpio = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	gpio_keys {

No '_' in node names, please go '-'.

> +		status = "okay";
> +		compatible = "gpio-keys";
> +		input-name = "gpio-keys";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		autorepeat;
> +
> +		vol_dn {

Ditto.

> +			label = "Volume Down";
> +			gpios = <&tlmm 47 GPIO_ACTIVE_LOW>;
> +			linux,input-type = <1>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +			gpio-key,wakeup;
> +			debounce-interval = <15>;
> +		};
> +	};
> +	

Stray indentation on this line.

Thanks,
Bjorn

> +	reserved_memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		debug_mem: memory@ffb00000 {
> +			reg = <0x0 0xffb00000 0x0 0xc0000>;
> +			no-map;
> +		};
> +
> +		last_log_mem: memory@ffbc0000 {
> +			reg = <0x0 0xffbc0000 0x0 0x80000>;
> +			no-map;
> +		};
> +
> +		pstore_mem: ramoops@ffc00000 {
> +			compatible = "ramoops";
> +			reg = <0x0 0xffc40000 0x0 0xc0000>;
> +			record-size = <0x1000>;
> +			console-size = <0x40000>;
> +			msg-size = <0x20000 0x20000>;
> +		};
> +
> +		cmdline_mem: memory@ffd00000 {
> +			reg = <0x0 0xffd40000 0x0 0x1000>;
> +			no-map;
> +		};
> +	};
> +};
> +
> +&hsusb_phy1 {
> +	status = "okay";
> +};
> +
> +&sdhc_1 {
> +	status = "okay";
> +};
> +
> +&tlmm {
> +	gpio-reserved-ranges = <22 2>, <28 6>;
> +};
> +
> +&usb3 {
> +	status = "okay";
> +};
> +
> +&usb3_dwc3 {
> +	extcon = <&extcon_usb>;
> +};
> -- 
> 2.31.1
> 
