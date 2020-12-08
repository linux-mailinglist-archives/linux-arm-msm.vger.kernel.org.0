Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9D8C2D3615
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 23:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729323AbgLHWTh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 17:19:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbgLHWTg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 17:19:36 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68EAC061793
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Dec 2020 14:18:50 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id d8so283701otq.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Dec 2020 14:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=blw9u33C6QMukJLWz7Q0aaoqDjTwOgfBTVpKEmoWh2E=;
        b=HQXRB0mOVdMWGfyj8GJKggPh76v2KJDixK+Sm84cE4/+N2gzEmcMMUSPsm09TVQQtx
         YT2CIDSDVDDK+GYveXHXcNXdXNlOfkPJP5GINys13s3CUc2Lc10AwCoJKC3jykbdn/DU
         AENPHpl5q0vEpLB181hiPjw8K7sU/ZxAE+YKJvVGIHY3yzfGj9/mbnciKUkSluFvRLlm
         ENHrfn8EObRx7+RjtIJBSoe0lCtALBctNBzQaNNwGHwHsInCLJX834KI+JpZfMDiKNIK
         47KRNpcs5Hn4nIZWqip0OGI6REaOkOzm9jbIsk8bzp/h3P8g0A8P1920ekese7k/ia/n
         unnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=blw9u33C6QMukJLWz7Q0aaoqDjTwOgfBTVpKEmoWh2E=;
        b=Ndx7JwS8ZAxkmSzfskCwqQPn9O5J2lgGjXnhSO9a6PbbxW9YVP1rIciXV1G4H94Q03
         u3183WRkQ/Vx2ppAnpyOkAnyuAH1uKfGta5j12SBNhLiDelb/QCRn0yKQ7vpjGktbdVl
         I5DESn88/Z7T5XAUFiCswksHT2jk49MlEp+W7E//QYzMmdNjcTPDRXRt1b0UJm9mHo1e
         UEISxTaMmJg5CTo+SNpRUeGUMPZjnCCRBfFB12lNq5Hw1DbZt9wGjSwyDw8wyQUQ69PS
         bOPutZlOnPnkNSSqc7An0GfElsdM6kNcGkAiEbRBCcjfanV1nsTTRIwAmLqWG3m+kQqb
         IDDw==
X-Gm-Message-State: AOAM533vNLq/GDZgEHODoA82YfIWR8AKABS0zqRFgCCNulVwWKlk5a++
        9fAPaV2C4rkwFbp6v+npaH/etQ==
X-Google-Smtp-Source: ABdhPJyu/fsPG1ITGVJilfsctlEFdbwPinFC94wqo4GCpgBGQcw8Lt/e5hbO4kkatVzBRDGpDaPGTg==
X-Received: by 2002:a9d:4795:: with SMTP id b21mr182779otf.65.1607465930167;
        Tue, 08 Dec 2020 14:18:50 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z14sm19439otk.70.2020.12.08.14.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 14:18:49 -0800 (PST)
Date:   Tue, 8 Dec 2020 16:18:47 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     "J.R. Divya Antony" <d.antony.jr@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Add device tree for ASUS Zenfone 2
 Laser
Message-ID: <X8/7x2uSE4/6MGNM@builder.lan>
References: <20201208170855.9189-1-d.antony.jr@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201208170855.9189-1-d.antony.jr@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 08 Dec 11:08 CST 2020, J.R. Divya Antony wrote:

> ASUS Zenfone 2 Laser Z00L is a smartphone based on MSM8916 SoC
> released on 2015.
> 
> Add a device tree for Z00L with initial support for:
>   - SDHCI (internal storage)
>   - USB Device Mode
>   - UART
>   - Regulators
> 
> Signed-off-by: J.R. Divya Antony <d.antony.jr@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts | 160 ++++++++++++++++++
>  2 files changed, 161 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 5113fac80b7a..6a4be237f344 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-db820c.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq6018-cp01-c1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-asus-z00l.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-longcheer-l8150.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-a3u-eur.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> new file mode 100644
> index 000000000000..c7307a310781
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts
> @@ -0,0 +1,160 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/dts-v1/;
> +
> +#include "msm8916-pm8916.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Asus Zenfone 2 Laser";
> +	compatible = "asus,z00l", "qcom,msm8916";
> +
> +	aliases {
> +		serial0 = &blsp1_uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	usb_id: usb-id {
> +		compatible = "linux,extcon-usb-gpio";
> +		id-gpios = <&msmgpio 110 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_id_default>;
> +	};
> +};
> +
> +&blsp1_uart2 {
> +	status = "okay";
> +};
> +
> +&usb {

It's very convenient to keep labels sorted alphabetically.

Apart from that I think this looks good.

Regards,
Bjorn
