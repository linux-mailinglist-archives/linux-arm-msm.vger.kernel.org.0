Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE5BC1318A5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 20:23:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgAFTWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 14:22:51 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37969 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbgAFTWv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 14:22:51 -0500
Received: by mail-pl1-f193.google.com with SMTP id f20so22210307plj.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 11:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KdftAnIW8rUBSrygr+EOFDY9I5XXFEmjIdjB6P9VVq8=;
        b=GlOGH7hZF290sHkinghXAuqMbejbswgIc9hacj4LkXuJqa7+InCG3gZegv0M/zvbqV
         C6saEjo62XezrKoPVfKUluu4bGklaP3qCVOjSdah/ygBqWkfT2S8pqRCe99HQbLPFtX3
         Iq/w/s5EF4tJtxgE+YY+rSIx6UegTXyg16fSM3H0de1O6IdIjNgXU7YkGqWXBVbEOTIt
         4VgJUYXLhUeKzvM7m33paIkwseusWZNWJ43J7AOb1i1TT6F4r2u4CwRLrKIUtp8CKGsA
         /T2X9vMphhM92qPV8EiaBTlihKgAewLI7Q6UZ/93T0bkquFXpezLu48F/iKDmU3xR7nt
         YWSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KdftAnIW8rUBSrygr+EOFDY9I5XXFEmjIdjB6P9VVq8=;
        b=QscsvBOzKi9kVars7x3ccvCnCgx+t0kgBE+K/erIjtJpMk1cGxbbVSX9vqHQpSLU49
         xw36ep5hhG0OFWvH0xVp++BGFGJKxfPTN0B4xPq6qFhRdNy6+oucdw8wAANTNnZHGdqa
         xUAzW1ioecNRx/T1JPzyFnTR3zle6yGSGHO7+eKquB8N/K+6iwl6iLj6jf9SwyM71BR9
         UIlci084FeYhE+uBnyJ/5DkV7QK0qsoQ1cVlQ7JfKAkND5AUpeSu7t1eL2FEp6VGPdJ2
         uTO7QnsGU2jGEQ0qvUIqfSVpfQby8bNZ0PdsXoEQYPsp2ifk6DaBCBUuDE5bgnpqZQpP
         k1HQ==
X-Gm-Message-State: APjAAAWXftHgJdHWc2993rm+jRIlrsYCoU4oAX3pBemgtUqd+1pcvm2l
        aZleF0ohE+AwLf3rSbVO/es9zw==
X-Google-Smtp-Source: APXvYqyrgCXI49gaIHsDdBJTj8i0HIZ6B4HTwo9fWn4c+taY05p4vlIxihJExLvlEXeY6SyOucbe5A==
X-Received: by 2002:a17:90a:2004:: with SMTP id n4mr45083272pjc.20.1578338570685;
        Mon, 06 Jan 2020 11:22:50 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j10sm25369557pjb.14.2020.01.06.11.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 11:22:50 -0800 (PST)
Date:   Mon, 6 Jan 2020 11:22:48 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Christian Lamparter <chunkeey@gmail.com>,
        Sven Eckelmann <sven.eckelmann@openmesh.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: Re: [PATCH] ARM: dts: qcom: add gpio-ranges property
Message-ID: <20200106192248.GX3755841@builder>
References: <20200106143633.1268701-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106143633.1268701-1-robert.marko@sartura.hr>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 06 Jan 06:36 PST 2020, Robert Marko wrote:

> From: Christian Lamparter <chunkeey@gmail.com>
> 
> This patch adds the gpio-ranges property to almost all of
> the Qualcomm ARM platforms that utilize the pinctrl-msm
> framework.
> 
> The gpio-ranges property is part of the gpiolib subsystem.
> As a result, the binding text is available in section
> "2.1 gpio- and pin-controller interaction" of
> Documentation/devicetree/bindings/gpio/gpio.txt
> 
> For more information please see the patch titled:
> "pinctrl: msm: fix gpio-hog related boot issues" from
> this series.
> 
> Reported-by: Sven Eckelmann <sven.eckelmann@openmesh.com>
> Tested-by: Sven Eckelmann <sven.eckelmann@openmesh.com> [ipq4019]
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
> Tested-by: Robert Marko <robert.marko@sartura.hr> [ipq4019]
> Cc: Luka Perkov <luka.perkov@sartura.hr>

Thanks for follow up on this Robert!

We carry dts patches for arm and arm64 in different branches on their
way towards Torvalds, can you please split the patch in two? (Double
check that the two parts adds up to an equivalent change and you can
carry the reviewed-by and tested-by on the two patches).

Also I need your Signed-off-by at the end of the tags-list as you
forward Christian's patch.

Regards,
Bjorn

> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi   | 1 +
>  arch/arm/boot/dts/qcom-apq8084.dtsi   | 1 +
>  arch/arm/boot/dts/qcom-ipq4019.dtsi   | 1 +
>  arch/arm/boot/dts/qcom-ipq8064.dtsi   | 1 +
>  arch/arm/boot/dts/qcom-mdm9615.dtsi   | 1 +
>  arch/arm/boot/dts/qcom-msm8660.dtsi   | 1 +
>  arch/arm/boot/dts/qcom-msm8960.dtsi   | 1 +
>  arch/arm/boot/dts/qcom-msm8974.dtsi   | 1 +
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/msm8992.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/msm8994.dtsi | 1 +
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 1 +
>  13 files changed, 13 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 8b79b4112ee1..2687c4e890ba 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -350,6 +350,7 @@
>  			reg = <0x800000 0x4000>;
>  
>  			gpio-controller;
> +			gpio-ranges = <&tlmm_pinmux 0 0 90>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
> index 0a0fb147ebb9..4cc2d33f3d3b 100644
> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> @@ -401,6 +401,7 @@
>  			compatible = "qcom,apq8084-pinctrl";
>  			reg = <0xfd510000 0x4000>;
>  			gpio-controller;
> +			gpio-ranges = <&tlmm 0 0 147>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index 72d4e290b543..b6e5203a210b 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -201,6 +201,7 @@
>  			compatible = "qcom,ipq4019-pinctrl";
>  			reg = <0x01000000 0x300000>;
>  			gpio-controller;
> +			gpio-ranges = <&tlmm 0 0 100>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 16c0da97932c..4021f661cd11 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -119,6 +119,7 @@
>  			reg = <0x800000 0x4000>;
>  
>  			gpio-controller;
> +			gpio-ranges = <&qcom_pinmux 0 0 69>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> index 356e9535f7a6..347b4f7d7889 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> @@ -128,6 +128,7 @@
>  		msmgpio: pinctrl@800000 {
>  			compatible = "qcom,mdm9615-pinctrl";
>  			gpio-controller;
> +			gpio-ranges = <&msmgpio 0 0 88>;
>  			#gpio-cells = <2>;
>  			interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-controller;
> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
> index ec5cbc468bd3..480fc08cbe8e 100644
> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
> @@ -115,6 +115,7 @@
>  			reg = <0x800000 0x4000>;
>  
>  			gpio-controller;
> +			gpio-ranges = <&tlmm 0 0 173>;
>  			#gpio-cells = <2>;
>  			interrupts = <0 16 0x4>;
>  			interrupt-controller;
> diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
> index f2aeaccdc1ad..172ea3c70eac 100644
> --- a/arch/arm/boot/dts/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
> @@ -107,6 +107,7 @@
>  		msmgpio: pinctrl@800000 {
>  			compatible = "qcom,msm8960-pinctrl";
>  			gpio-controller;
> +			gpio-ranges = <&msmgpio 0 0 152>;
>  			#gpio-cells = <2>;
>  			interrupts = <0 16 0x4>;
>  			interrupt-controller;
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 369e58f64145..1689cf925b03 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -707,6 +707,7 @@
>  			compatible = "qcom,msm8974-pinctrl";
>  			reg = <0xfd510000 0x4000>;
>  			gpio-controller;
> +			gpio-ranges = <&msmgpio 0 0 146>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index 67ee5f560104..2b31823d3ccd 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -21,6 +21,7 @@
>  			reg = <0x1000000 0x300000>;
>  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
> +			gpio-ranges = <&tlmm 0 0 70>;
>  			#gpio-cells = <0x2>;
>  			interrupt-controller;
>  			#interrupt-cells = <0x2>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 5ea9fb8f2f87..2d1cbe762b3a 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -374,6 +374,7 @@
>  			reg = <0x1000000 0x300000>;
>  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
> +			gpio-ranges = <&msmgpio 0 0 122>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8992.dtsi b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> index 8be60c08a9ab..2021795c99ad 100644
> --- a/arch/arm64/boot/dts/qcom/msm8992.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8992.dtsi
> @@ -171,6 +171,7 @@
>  			reg = <0xfd510000 0x4000>;
>  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
> +			gpio-ranges = <&msmgpio 0 0 146>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> index 3932757f78b7..b1c2d7d6a0f2 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> @@ -133,6 +133,7 @@
>  			reg = <0xfd510000 0x4000>;
>  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
> +			gpio-ranges = <&msmgpio 0 0 146>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 87f4d9c1b0d4..81576aeb2408 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1234,6 +1234,7 @@
>  			reg = <0x01010000 0x300000>;
>  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>  			gpio-controller;
> +			gpio-ranges = <&msmgpio 0 0 150>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> -- 
> 2.24.1
> 
