Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC191592A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 16:13:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730222AbgBKPNq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 10:13:46 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:46157 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728985AbgBKPNo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 10:13:44 -0500
Received: by mail-ua1-f68.google.com with SMTP id l6so4047275uap.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2020 07:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GUARnD6k50jzUsw10kMIXjV4VmujixpGyNZoQ1+vFIw=;
        b=vezmg+e2zVcCqvOz1QNUIhR6b4psUJ7GBjXUl/w5u3TKKW5m2at+Dkenjv6Z4DUTFI
         Tk0wTGDgR75xfdMkdy0hvZZojCjOVrXPeyjV/zwyKx+3mGrbq9y2tRX9+HwnygydMFO/
         95NDXx1CjgmBO9SLKD/eIx0AzfTj81rp4frsf+iGJYx3sH5Y/yJXRL7UxmdiFGMEddYx
         S4EhjTxhAEKrLig/K5wUNsDw902thoBRCv9xdoV7euC7E/BlQrPQn6BpDHxeHNf8YAJE
         EZ3gSfrwgeri4HLwd9vjx75vhLrxHqm/bJ0m5JfdhE0FMIHxPc2Qdd1eAVbTja/NN4dX
         wONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GUARnD6k50jzUsw10kMIXjV4VmujixpGyNZoQ1+vFIw=;
        b=i9OL0MeLAu8Gdhpdemcqx3Ls2uOhX8Z3CUr4VgG/9SLktlJidwW3w5R2Ex5asyFfcP
         CoGtJE57zEvnRB+6BfTdGo1+qqH54obzAmkrexA47Ew8R6NcSikMctVLJuOgEFqZhyrI
         O33E+86+508ZZvRGTsbSwmwXe1etE0OtfyCz3HW+BWeg+C5WtZXPnCSpjmlh/VjQdzVP
         CZRkbQd/gPHSGPKLG3H0W3qEfyh9AqfMHrIMAi928NG3XGMYwbV0SYeVM3yRq7ANuGX2
         lXSz1MAYO3jXZL361rJcUOI845LzEKMlBwa3nvP/rzJfSBamcSWma7AOdkjcjmlk8T1s
         fhmQ==
X-Gm-Message-State: APjAAAWHjxfh1TSZXGYagG0OK1Yq0raG2WDbKMvEx8lVg6/jEIeHIr5Z
        lpIQmQxqmbD7RBWz8WZL/nEIg8hrH8lsQuHGbpw+Nw==
X-Google-Smtp-Source: APXvYqzE310oyVlFxDykq0yJMv5V52vUJ/aZlRdz88ytg55ClBK5PqlR6olX6sPJIZQLvU4FVZaHf/beaLIbPl6zeIY=
X-Received: by 2002:ab0:e16:: with SMTP id g22mr1849367uak.129.1581434022257;
 Tue, 11 Feb 2020 07:13:42 -0800 (PST)
MIME-Version: 1.0
References: <1578495250-10672-1-git-send-email-sbhanu@codeaurora.org> <25a96f3f-c4cd-4ff1-3ce6-d894fb1c20fe@codeaurora.org>
In-Reply-To: <25a96f3f-c4cd-4ff1-3ce6-d894fb1c20fe@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 11 Feb 2020 16:13:05 +0100
Message-ID: <CAPDyKFqxDWhPAxo56D1LCCCxNTgwfCmjLd=6_5jNiDGJx==EYg@mail.gmail.com>
Subject: Re: [PATCH V3] arm64: dts: qcom: sc7180: Add nodes for eMMC and SD card
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 11 Feb 2020 at 15:30, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> ping!
>

I think you need to ping the SoC maintainers, this isn't something
that I normally pick up via the mmc subsystem.

Kind regards
Uffe

> On 1/8/2020 8:24 PM, Shaik Sajida Bhanu wrote:
> > From: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> >
> > Add sdhc instances for supporting eMMC and SD-card on sc7180.
> > The regulators should be in HPM state for proper functionality of
> > eMMC and SD-card. Updating corresponding regulators accordingly.
> >
> > Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> > Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> > ---
> > Changes since V2:
> >       - Added cmdq register space and support-cqe flag.
> >       - Incorporated review comments by Matthias Kaehlcke.
> >
> > Changes since V1:
> >       - Updated the regulator min, max voltages as per
> >         eMMC/SD-card voltage requirements
> >       - Enabled IOMMU for eMMC and SD-card.
> >       - Added pull and drive strength to SD-card cd-gpio.
> >       - Incorporated review comments by Matthias Kaehlcke.
> > ---
> >   arch/arm64/boot/dts/qcom/sc7180-idp.dts |  47 +++++++---
> >   arch/arm64/boot/dts/qcom/sc7180.dtsi    | 148 ++++++++++++++++++++++++++++++++
> >   2 files changed, 183 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > index 388f50a..a790d82 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> > @@ -7,6 +7,7 @@
> >
> >   /dts-v1/;
> >
> > +#include <dt-bindings/gpio/gpio.h>
> >   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >   #include "sc7180.dtsi"
> >   #include "pm6150.dtsi"
> > @@ -101,9 +102,9 @@
> >               };
> >
> >               vreg_l12a_1p8: ldo12 {
> > -                     regulator-min-microvolt = <1696000>;
> > -                     regulator-max-microvolt = <1952000>;
> > -                     regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <1800000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >               };
> >
> >               vreg_l13a_1p8: ldo13 {
> > @@ -143,9 +144,9 @@
> >               };
> >
> >               vreg_l19a_2p9: ldo19 {
> > -                     regulator-min-microvolt = <2696000>;
> > -                     regulator-max-microvolt = <3304000>;
> > -                     regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +                     regulator-min-microvolt = <2960000>;
> > +                     regulator-max-microvolt = <2960000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >               };
> >       };
> >
> > @@ -189,9 +190,9 @@
> >               };
> >
> >               vreg_l6c_2p9: ldo6 {
> > -                     regulator-min-microvolt = <2696000>;
> > -                     regulator-max-microvolt = <3304000>;
> > -                     regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +                     regulator-min-microvolt = <1800000>;
> > +                     regulator-max-microvolt = <2950000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >               };
> >
> >               vreg_l7c_3p0: ldo7 {
> > @@ -207,9 +208,9 @@
> >               };
> >
> >               vreg_l9c_2p9: ldo9 {
> > -                     regulator-min-microvolt = <2952000>;
> > -                     regulator-max-microvolt = <3304000>;
> > -                     regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> > +                     regulator-min-microvolt = <2960000>;
> > +                     regulator-max-microvolt = <2960000>;
> > +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> >               };
> >
> >               vreg_l10c_3p3: ldo10 {
> > @@ -254,6 +255,28 @@
> >       status = "okay";
> >   };
> >
> > +&sdhc_1 {
> > +     status = "okay";
> > +
> > +     pinctrl-names = "default", "sleep";
> > +     pinctrl-0 = <&sdc1_on>;
> > +     pinctrl-1 = <&sdc1_off>;
> > +     vmmc-supply = <&vreg_l19a_2p9>;
> > +     vqmmc-supply = <&vreg_l12a_1p8>;
> > +};
> > +
> > +&sdhc_2 {
> > +     status = "okay";
> > +
> > +     pinctrl-names = "default","sleep";
> > +     pinctrl-0 = <&sdc2_on>;
> > +     pinctrl-1 = <&sdc2_off>;
> > +     vmmc-supply  = <&vreg_l9c_2p9>;
> > +     vqmmc-supply = <&vreg_l6c_2p9>;
> > +
> > +     cd-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
> > +};
> > +
> >   &uart3 {
> >       status = "okay";
> >   };
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 3676bfd..525bc02 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -226,6 +226,33 @@
> >                       };
> >               };
> >
> > +             sdhc_1: sdhci@7c4000 {
> > +                     compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
> > +                     reg = <0 0x7c4000 0 0x1000>,
> > +                             <0 0x07c5000 0 0x1000>;
> > +                     reg-names = "hc_mem", "cqhci_mem";
> > +
> > +                     iommus = <&apps_smmu 0x60 0x0>;
> > +                     interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
> > +                                     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names = "hc_irq", "pwr_irq";
> > +
> > +                     clocks = <&gcc GCC_SDCC1_APPS_CLK>,
> > +                                     <&gcc GCC_SDCC1_AHB_CLK>;
> > +                     clock-names = "core", "iface";
> > +
> > +                     bus-width = <8>;
> > +                     non-removable;
> > +                     supports-cqe;
> > +
> > +                     mmc-ddr-1_8v;
> > +                     mmc-hs200-1_8v;
> > +                     mmc-hs400-1_8v;
> > +                     mmc-hs400-enhanced-strobe;
> > +
> > +                     status = "disabled";
> > +             };
> > +
> >               qupv3_id_0: geniqup@8c0000 {
> >                       compatible = "qcom,geni-se-qup";
> >                       reg = <0 0x008c0000 0 0x6000>;
> > @@ -929,6 +956,127 @@
> >                                       function = "qup15";
> >                               };
> >                       };
> > +
> > +                     sdc1_on: sdc1-on {
> > +                             pinconf-clk {
> > +                                     pins = "sdc1_clk";
> > +                                     bias-disable;
> > +                                     drive-strength = <16>;
> > +                             };
> > +
> > +                             pinconf-cmd {
> > +                                     pins = "sdc1_cmd";
> > +                                     bias-pull-up;
> > +                                     drive-strength = <10>;
> > +                             };
> > +
> > +                             pinconf-data {
> > +                                     pins = "sdc1_data";
> > +                                     bias-pull-up;
> > +                                     drive-strength = <10>;
> > +                             };
> > +
> > +                             pinconf-rclk {
> > +                                     pins = "sdc1_rclk";
> > +                                     bias-pull-down;
> > +                             };
> > +                     };
> > +
> > +                     sdc1_off: sdc1-off {
> > +                             pinconf-clk {
> > +                                     pins = "sdc1_clk";
> > +                                     bias-disable;
> > +                                     drive-strength = <2>;
> > +                             };
> > +
> > +                             pinconf-cmd {
> > +                                     pins = "sdc1_cmd";
> > +                                     bias-pull-up;
> > +                                     drive-strength = <2>;
> > +                             };
> > +
> > +                             pinconf-data {
> > +                                     pins = "sdc1_data";
> > +                                     bias-pull-up;
> > +                                     drive-strength = <2>;
> > +                             };
> > +
> > +                             pinconf-rclk {
> > +                                     pins = "sdc1_rclk";
> > +                                     bias-pull-down;
> > +                             };
> > +                     };
> > +
> > +                     sdc2_on: sdc2-on {
> > +                             pinconf-clk {
> > +                                     pins = "sdc2_clk";
> > +                                     bias-disable;
> > +                                     drive-strength = <16>;
> > +                             };
> > +
> > +                             pinconf-cmd {
> > +                                     pins = "sdc2_cmd";
> > +                                     bias-pull-up;
> > +                                     drive-strength = <10>;
> > +                             };
> > +
> > +                             pinconf-data {
> > +                                     pins = "sdc2_data";
> > +                                     bias-pull-up;
> > +                                     drive-strength = <10>;
> > +                             };
> > +
> > +                             pinconf-sd-cd {
> > +                                     pins = "gpio69";
> > +                                     bias-pull-up;
> > +                                     drive-strength = <2>;
> > +                             };
> > +                     };
> > +
> > +                     sdc2_off: sdc2-off {
> > +                             pinconf-clk {
> > +                                     pins = "sdc2_clk";
> > +                                     bias-disable;
> > +                                     drive-strength = <2>;
> > +                             };
> > +
> > +                             pinconf-cmd {
> > +                                     pins = "sdc2_cmd";
> > +                                     bias-pull-up;
> > +                                     drive-strength = <2>;
> > +                             };
> > +
> > +                             pinconf-data {
> > +                                     pins = "sdc2_data";
> > +                                     bias-pull-up;
> > +                                     drive-strength = <2>;
> > +                             };
> > +
> > +                             pinconf-sd-cd {
> > +                                     pins = "gpio69";
> > +                                     bias-disable;
> > +                                     drive-strength = <2>;
> > +                             };
> > +                     };
> > +             };
> > +
> > +             sdhc_2: sdhci@8804000 {
> > +                     compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
> > +                     reg = <0 0x08804000 0 0x1000>;
> > +                     reg-names = "hc_mem";
> > +
> > +                     iommus = <&apps_smmu 0x80 0>;
> > +                     interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
> > +                                     <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-names = "hc_irq", "pwr_irq";
> > +
> > +                     clocks = <&gcc GCC_SDCC2_APPS_CLK>,
> > +                                     <&gcc GCC_SDCC2_AHB_CLK>;
> > +                     clock-names = "core", "iface";
> > +
> > +                     bus-width = <4>;
> > +
> > +                     status = "disabled";
> >               };
> >
> >               qspi: spi@88dc000 {
