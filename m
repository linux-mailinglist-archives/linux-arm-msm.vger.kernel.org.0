Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0144187EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 11:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbhIZJn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 05:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbhIZJn1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 05:43:27 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABEDC061570
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 02:41:51 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id q6so1659432ilm.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 02:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sURKX3yyrfO/8LKThpmlC5JRuURmlywhZ+iusQpU9BE=;
        b=rRBkLthjRwcxXRXYpSHEzoHOb05+vektXd26Xqn5FRVM2KJ9TVSC+KFqV+In8drboY
         C5a8FM6hLRZXdatifFicUrsEhjcyHTKLL+bS1dqyb1Dz6dlD++rAHxRoTciaLhMPRtGN
         irFvRSE5iAxhRjFr4D3rHLJOaljU+NYWneHWInmt6X90xiQYRfLw/uC2HMRBhtMvYEvy
         euiDnyBZD5uVp/bQF4Uo7JMsP1TDXc63Y81AfTSPs90gSoC3symGn0qwHgOLY2YmQuwi
         civEnaoHY4vduya3jdKLjurQrzYRhI5xZ9FnjfsDuckYPanEKck2qmucV/maKYaUZep7
         21yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sURKX3yyrfO/8LKThpmlC5JRuURmlywhZ+iusQpU9BE=;
        b=MHKahBwzouVOqJAOYEjgQog5cxaSNBdRT7PhYxUBwrKgOMCYpbms1IwxMpLF+oHzFa
         olKe9Gjff3eM4VXHjRVy9LKU7MI4E5YDhwFiDgGo+niADWSYGGlOcO7gTPXP1CxxIp4P
         GSVUUM41C9O+2AzHOkSNtLoy81uNcDyRBNpQ6XcPqYYU2ihZYZc/5hioDuToGzN+Hl26
         s71vDcknPIpDPM8bxh8kQQUc38FK60Nld7ifvwp/tj4XYVbhBnHqND7lntyi94kmllKc
         vuurNvAltFlpzCh2Ef5ZixQUKujqTfGl3pNEMGUapbZSiKZ951YLJ1HqjIvhJMUgcrJB
         0s+Q==
X-Gm-Message-State: AOAM531K3uMV28WKu1fcqNyfM+sYT35IUrR35BGT5U+5iUeDdf5PO+hv
        hPExtaifrKeUvzQC4O+69lcjX0r8QG+UQaFqpcvhxA==
X-Google-Smtp-Source: ABdhPJwVQBHRN1knXuI4zae36PRZGQeKKRF3Hx1VMBXqjP7WEcuIOIcdHRTsHdPxGzwNJm/nxdp/fP3EdS063+NkKGY=
X-Received: by 2002:a92:b703:: with SMTP id k3mr15029251ili.95.1632649310890;
 Sun, 26 Sep 2021 02:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210926075951.28034-1-shawn.guo@linaro.org>
In-Reply-To: <20210926075951.28034-1-shawn.guo@linaro.org>
From:   Amit Pundir <amit.pundir@linaro.org>
Date:   Sun, 26 Sep 2021 15:11:14 +0530
Message-ID: <CAMi1Hd3iG9a3AAJgR49kfDhK303T0WB6AajfX1WOw7-X8K20+Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: Drop vdd-supply from qusb2-phy devices
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Caleb Connolly <caleb@connolly.tech>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        dt <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Sept 2021 at 13:29, Shawn Guo <shawn.guo@linaro.org> wrote:
>
> Looking at qcom,qusb2-phy.yaml bindings and qusb2_phy_vreg_names[] in
> qusb2-phy driver, vdd-supply is not a supported/valid property.  Drop it
> from qusb2-phy devices on various boards.
>

No obvious regression on PocoF1 (Beryllium).

Tested-by: Amit Pundir <amit.pundir@linaro.org>

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts               | 1 -
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi          | 1 -
>  arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 1 -
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi            | 2 --
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts            | 2 --
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts               | 2 --
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 1 -
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts  | 1 -
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts  | 2 --
>  9 files changed, 13 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index acdb36f4479f..5ec47eaa4a90 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -429,7 +429,6 @@
>
>  &usb_1_hsphy {
>         status = "okay";
> -       vdd-supply = <&vreg_l4a_0p8>;
>         vdda-pll-supply = <&vreg_l11a_1p8>;
>         vdda-phy-dpdm-supply = <&vreg_l17a_3p0>;
>         qcom,imp-res-offset-value = <8>;
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 0f2b3c00e434..ed68f1233d66 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -928,7 +928,6 @@ ap_spi_fp: &spi10 {
>
>  &usb_1_hsphy {
>         status = "okay";
> -       vdd-supply = <&vdd_qusb_hs0_core>;
>         vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
>         vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
>         qcom,imp-res-offset-value = <8>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> index 11d0a8c1cf35..b05d5433a674 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> @@ -228,7 +228,6 @@
>  &qusb2phy {
>         status = "okay";
>
> -       vdd-supply = <&vreg_l1b_0p925>;
>         vdda-pll-supply = <&vreg_l10a_1p8>;
>         vdda-phy-dpdm-supply = <&vreg_l7b_3p125>;
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index dfd1b42c07fd..12fa059bef5a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -807,7 +807,6 @@ ap_ts_i2c: &i2c14 {
>  &usb_1_hsphy {
>         status = "okay";
>
> -       vdd-supply = <&vdda_usb1_ss_core>;
>         vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
>         vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
>
> @@ -829,7 +828,6 @@ ap_ts_i2c: &i2c14 {
>  &usb_2_hsphy {
>         status = "okay";
>
> -       vdd-supply = <&vdda_usb2_ss_core>;
>         vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
>         vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 2d5533dd4ec2..894be3b6aea5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -940,7 +940,6 @@
>  &usb_1_hsphy {
>         status = "okay";
>
> -       vdd-supply = <&vreg_l1a_0p875>;
>         vdda-pll-supply = <&vreg_l12a_1p8>;
>         vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
>
> @@ -968,7 +967,6 @@
>  &usb_2_hsphy {
>         status = "okay";
>
> -       vdd-supply = <&vreg_l1a_0p875>;
>         vdda-pll-supply = <&vreg_l12a_1p8>;
>         vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index 52dd7a858231..08485eb5963a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -517,7 +517,6 @@
>  &usb_1_hsphy {
>         status = "okay";
>
> -       vdd-supply = <&vdda_usb1_ss_core>;
>         vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
>         vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
>
> @@ -551,7 +550,6 @@
>  &usb_2_hsphy {
>         status = "okay";
>
> -       vdd-supply = <&vdda_usb2_ss_core>;
>         vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
>         vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index d4355522374a..911105d7603d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -580,7 +580,6 @@
>  &usb_1_hsphy {
>         status = "okay";
>
> -       vdd-supply = <&vdda_usb1_ss_core>;
>         vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
>         vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> index c60c8c640e17..9dc173c1f0be 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium.dts
> @@ -496,7 +496,6 @@
>  &usb_1_hsphy {
>         status = "okay";
>
> -       vdd-supply = <&vreg_l1a_0p875>;
>         vdda-pll-supply = <&vreg_l12a_1p8>;
>         vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index 385e5029437d..e330721cd6cd 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -646,7 +646,6 @@
>  &usb_1_hsphy {
>         status = "okay";
>
> -       vdd-supply = <&vdda_usb1_ss_core>;
>         vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
>         vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
>
> @@ -674,7 +673,6 @@
>  &usb_2_hsphy {
>         status = "okay";
>
> -       vdd-supply = <&vdda_usb2_ss_core>;
>         vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
>         vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
>
> --
> 2.17.1
>
