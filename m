Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06FC7149744
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2020 19:48:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgAYSsC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jan 2020 13:48:02 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:36689 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726690AbgAYSsC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jan 2020 13:48:02 -0500
Received: by mail-oi1-f194.google.com with SMTP id c16so2910886oic.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jan 2020 10:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b12gXgpzEnBV3TEYdPU7aJgxJdZG+mmVOMizdv7D9OM=;
        b=1/pz4dmo+4bjSLgMNaNpA3Czc/sNhbfo/ORbNsADjHPQ9l5yWtw9Hw6YyOLDClKe3H
         WCdjBANplR3BKmUQkQ+RQfEs9ydqabe/DHY8NXtZExTl5e3oztQaJ+ONHJuiqQEYFwdy
         9BZS9erPhWmY6rMt5MFZpDstAi45Lt+TNbtHGNNGbrIp6TWCsWKDfqIrD6NxcT9zRJJ6
         aHW1QziVMPMOlcb1rpJng8x+PGOWngzzH69LkmFTS7haAnQ33zW2tBZrrfkFLaa1UGgx
         S+ufHfaERiw5y/noWJ8eOKa+kRzsJ3EhSElcxVxzXTpLzfa+t5dtfMouFMkhTZhXBemz
         uxkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b12gXgpzEnBV3TEYdPU7aJgxJdZG+mmVOMizdv7D9OM=;
        b=aVbPS4Siqgt7V9dzAtkLUfY/pZG3QxuiM10fRWYGaD41pPIDtDbPz8chWTa4YHYBfk
         70vQGP1VbiVyzlNxoKSHN12j2dKTl70teOtl+eqr/0oQ9M2UUs+50SyKwenqNT90b2h3
         ZAYp/bxZiOkhK1/oChQMEm1YJrG7eJkxFDwcmz0cWiz5E2MvSls+pnPb1iQTUb2VQR2s
         0LXzzhTzK8YB74rEAUcoh8GvQ1U83oRZ4f473RsLKsYze41g0sI2A5lmND56QH/fpJmd
         Cte1VqJpPwFdnMNn4LBgBOsa3DhvJZsGMjjEHkx49UwjJVIsmYRukrAb5Z5pn8scgs1y
         ob2w==
X-Gm-Message-State: APjAAAXDW3sHvaYGzgpJ4iOowLdeSWVWpPG5M8sSOWs4/RZx4GeyXuwI
        N1gIaQRyB5vcp7vpvjkGNfCDCG/cQgQ+dr6JCOsJMw==
X-Google-Smtp-Source: APXvYqzjoQm8D0lkiup3uzD9802Tr6NdcVAByCveRRYecEhMl3BTa39maSqadZosmdNmbAEzmsF4kV8aiig3D1sKhZU=
X-Received: by 2002:a05:6808:4c2:: with SMTP id a2mr2943772oie.118.1579978081358;
 Sat, 25 Jan 2020 10:48:01 -0800 (PST)
MIME-Version: 1.0
References: <20200108125455.308969-1-robert.marko@sartura.hr>
In-Reply-To: <20200108125455.308969-1-robert.marko@sartura.hr>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Sat, 25 Jan 2020 19:47:50 +0100
Message-ID: <CA+HBbNE2Hd4Cse4qeuQuBb-6sYXRyckUQs3Udj9qxvTbzLNQyg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: qcom: add gpio-ranges property
To:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Christian Lamparter <chunkeey@gmail.com>,
        Sven Eckelmann <sven.eckelmann@openmesh.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Any issues that are preventing merging of this patch?

Cheers

On Wed, Jan 8, 2020 at 1:55 PM Robert Marko <robert.marko@sartura.hr> wrote:
>
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
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
> Changes since v1:
> - Split ARM and ARM64 DTS changes into separate patches
>
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 1 +
>  arch/arm/boot/dts/qcom-apq8084.dtsi | 1 +
>  arch/arm/boot/dts/qcom-ipq4019.dtsi | 1 +
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 1 +
>  arch/arm/boot/dts/qcom-mdm9615.dtsi | 1 +
>  arch/arm/boot/dts/qcom-msm8660.dtsi | 1 +
>  arch/arm/boot/dts/qcom-msm8960.dtsi | 1 +
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 1 +
>  8 files changed, 8 insertions(+)
>
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 8b79b4112ee1..2687c4e890ba 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -350,6 +350,7 @@
>                         reg = <0x800000 0x4000>;
>
>                         gpio-controller;
> +                       gpio-ranges = <&tlmm_pinmux 0 0 90>;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
> index 0a0fb147ebb9..4cc2d33f3d3b 100644
> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> @@ -401,6 +401,7 @@
>                         compatible = "qcom,apq8084-pinctrl";
>                         reg = <0xfd510000 0x4000>;
>                         gpio-controller;
> +                       gpio-ranges = <&tlmm 0 0 147>;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index 72d4e290b543..b6e5203a210b 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -201,6 +201,7 @@
>                         compatible = "qcom,ipq4019-pinctrl";
>                         reg = <0x01000000 0x300000>;
>                         gpio-controller;
> +                       gpio-ranges = <&tlmm 0 0 100>;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 16c0da97932c..4021f661cd11 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -119,6 +119,7 @@
>                         reg = <0x800000 0x4000>;
>
>                         gpio-controller;
> +                       gpio-ranges = <&qcom_pinmux 0 0 69>;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> index 356e9535f7a6..347b4f7d7889 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> @@ -128,6 +128,7 @@
>                 msmgpio: pinctrl@800000 {
>                         compatible = "qcom,mdm9615-pinctrl";
>                         gpio-controller;
> +                       gpio-ranges = <&msmgpio 0 0 88>;
>                         #gpio-cells = <2>;
>                         interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
>                         interrupt-controller;
> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
> index ec5cbc468bd3..480fc08cbe8e 100644
> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
> @@ -115,6 +115,7 @@
>                         reg = <0x800000 0x4000>;
>
>                         gpio-controller;
> +                       gpio-ranges = <&tlmm 0 0 173>;
>                         #gpio-cells = <2>;
>                         interrupts = <0 16 0x4>;
>                         interrupt-controller;
> diff --git a/arch/arm/boot/dts/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom-msm8960.dtsi
> index f2aeaccdc1ad..172ea3c70eac 100644
> --- a/arch/arm/boot/dts/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8960.dtsi
> @@ -107,6 +107,7 @@
>                 msmgpio: pinctrl@800000 {
>                         compatible = "qcom,msm8960-pinctrl";
>                         gpio-controller;
> +                       gpio-ranges = <&msmgpio 0 0 152>;
>                         #gpio-cells = <2>;
>                         interrupts = <0 16 0x4>;
>                         interrupt-controller;
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 369e58f64145..1689cf925b03 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -707,6 +707,7 @@
>                         compatible = "qcom,msm8974-pinctrl";
>                         reg = <0xfd510000 0x4000>;
>                         gpio-controller;
> +                       gpio-ranges = <&msmgpio 0 0 146>;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <2>;
> --
> 2.24.1
>
