Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3512346495
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 17:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbhCWQLt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 12:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233186AbhCWQLZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 12:11:25 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF6BC061765
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 09:11:24 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id x189so3554558ybg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 09:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r6fYm6v1+NtzKjblEgfJQxdoG2k+Zr4a48HLzY6DGeM=;
        b=Ic+KwvlJ8HOwCoKVzzalG/b7Hzm0Al9PNMvylKP5sUlNEoJ0G9iJ3MQJL94eDkMAFU
         +WELO/x1LOHKUo4akkPP8hukD6LBxVrBIFLykoO54LeHI6DFoBm8zgnA8RDVeafWTlMj
         4YZI4iE2/ktV71JzLUXJZATeOZTQ+GPSfl7s9v0xUnwGzfL/wpakU86XzYAh6J7mgHVu
         fMsLtskyVZOOs31IqGTpEpCanFaW0utsWGoRCKo+z5rpdR5Xf4CvMS3uEBZz+Xms5vrW
         XAQC/n/07mxzggNwvbSNeYxY/A0mSmFJnH1BthVjVXSqjnajVCze+L/6bXPmhI0HT3XN
         IoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r6fYm6v1+NtzKjblEgfJQxdoG2k+Zr4a48HLzY6DGeM=;
        b=NPLMGOQjD26b/Qqy68tQE9Es6DeimQoYx3Sj94XjRwIgsCltZdGKvDx+tLOG+JwSO2
         wxiEbu0QUmiV+eatwEZRiC2Ma2zOBV+a9PkZjMBmQEX0B9cLoe1Hj9ncIUAzm4Cw7L8m
         g9kqqsjHj85YW7q96jQITlUcGkmHzLQQOIJmnIPUqbAL2VZlIvyMCSYfrKCe+hm56JOI
         Y90Y0kwP9BVhgCW0FW5sMYCzsJVavkWn7XhAv7PBQTyBzckcRVXhhWaVXZoAocsbLBO8
         Rf+fNCNVP+Fmnmfi45Wyfs0bMQyCL+n0x8ba2JveXXVl6xhh5vfLYaQkL3X4d54+JYuR
         c8/Q==
X-Gm-Message-State: AOAM533A/7WrIwcaDxP5olkJwExoZ3DbBb6tR0lc9ArzBCXkO/nIJ216
        csOgVeRrQKyX7hb0Vw/Gz/ruo0PTWKXmrWxYp8bP5A==
X-Google-Smtp-Source: ABdhPJzgE+mNtUNHuqxKsfgIZ8b84w7N2wjcsxFsTXtVFk5PNzpfYZOgD2sKu+eV+N7xl1p/0tdo7DDT1QFH2jK8Rsw=
X-Received: by 2002:a25:2f4b:: with SMTP id v72mr6107133ybv.79.1616515882962;
 Tue, 23 Mar 2021 09:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <1616264220-25825-1-git-send-email-sbhanu@codeaurora.org>
In-Reply-To: <1616264220-25825-1-git-send-email-sbhanu@codeaurora.org>
From:   Doug Anderson <dianders@google.com>
Date:   Tue, 23 Mar 2021 09:11:11 -0700
Message-ID: <CAD=FV=WLZCSd6D5VFyD+1KBp5n1qyszER2EVaEMwYjQfPSSDnA@mail.gmail.com>
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD card
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        sartgarg@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Mar 20, 2021 at 11:18 AM Shaik Sajida Bhanu
<sbhanu@codeaurora.org> wrote:
>
> Add nodes for eMMC and SD card on sc7280.
>
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
>
> ---
> This change is depends on the below patch series:
> https://lore.kernel.org/patchwork/project/lkml/list/?series=488871
> https://lore.kernel.org/patchwork/project/lkml/list/?series=489530
> https://lore.kernel.org/patchwork/project/lkml/list/?series=488429
>
> Changes since V1:
>         - Moved SDHC nodes as suggested by Bjorn Andersson.
>         - Dropped "pinconf-" prefix as suggested by Bjorn Andersson.
>         - Removed extra newlines as suggested by Konrad Dybcio.
>         - Changed sd-cd pin to bias-pull-up in sdc2_off as suggested by
>           Veerabhadrarao Badiganti.
>         - Added bandwidth votes for eMMC and SD card.
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts |  25 ++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 213 ++++++++++++++++++++++++++++++++
>  2 files changed, 238 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 54d2cb3..4105263 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -8,6 +8,7 @@
>  /dts-v1/;
>
>  #include "sc7280.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>
>  / {
>         model = "Qualcomm Technologies, Inc. sc7280 IDP platform";
> @@ -242,6 +243,30 @@
>         status = "okay";
>  };
>
> +&sdhc_1 {
> +       status = "okay";

When I apply your patch I find that your sort order is wrong. "s"
comes before "u" and after "q" in the alphabet so "sdhc_1" and
"sdhc_2" should sort _after "qupv3_id_0" and before "uart5"


> +       pinctrl-names = "default", "sleep";
> +       pinctrl-0 = <&sdc1_on>;
> +       pinctrl-1 = <&sdc1_off>;
> +
> +       vmmc-supply = <&vreg_l7b_2p9>;
> +       vqmmc-supply = <&vreg_l19b_1p8>;
> +};
> +
> +&sdhc_2 {
> +       status = "okay";
> +
> +       pinctrl-names = "default","sleep";
> +       pinctrl-0 = <&sdc2_on>;
> +       pinctrl-1 = <&sdc2_off>;
> +
> +       vmmc-supply = <&vreg_l9c_2p9>;
> +       vqmmc-supply = <&vreg_l6c_2p9>;
> +
> +       cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;

Where is the pinctrl for the card detect?  Oh, I see it's in
"sdc2_on". Probably would be good to break it out since this is
board-specific. See below.


> +};
> +
>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>
>  &qup_uart5_default {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 8f6b569..69eb064 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -20,6 +20,11 @@
>
>         chosen { };
>
> +       aliases {
> +               mmc1 = &sdhc_1;
> +               mmc2 = &sdhc_2;
> +       };
> +
>         clocks {
>                 xo_board: xo-board {
>                         compatible = "fixed-clock";
> @@ -305,6 +310,64 @@
>                         #power-domain-cells = <1>;
>                 };
>
> +               sdhc_1: sdhci@7c4000 {
> +                       compatible = "qcom,sdhci-msm-v5";

Please make the compatible:
  compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";

...and add to the bindings. It should be a trivial bindings patch so
not too much trouble.

NOTE: even though the "qcom,sc7280-sdhci" should be in the bindings
and here you _shouldn't_ be adding any code for it. Just let the
fallback compatible string ("qcom,sdhci-msm-v5") do its magic. Adding
the sc7280 specific version is more of a "just in case we need it
later" type thing.


> +                       reg = <0 0x7c4000 0 0x1000>,
> +                                       <0 0x7c5000 0 0x1000>;
> +                       reg-names = "hc", "cqhci";
> +
> +                       iommus = <&apps_smmu 0xC0 0x0>;
> +                       interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "hc_irq", "pwr_irq";
> +
> +                       clocks = <&gcc GCC_SDCC1_APPS_CLK>,
> +                                       <&gcc GCC_SDCC1_AHB_CLK>,
> +                                       <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "core", "iface", "xo";

I'm curious: why is the "xo" clock needed here but not for sc7180?


> +                       interconnects = <&aggre1_noc MASTER_SDCC_1 0 &mc_virt SLAVE_EBI1 0>,
> +                                       <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_1 0>;
> +                       interconnect-names = "sdhc-ddr","cpu-sdhc";
> +                       power-domains = <&rpmhpd SC7280_CX>;
> +                       operating-points-v2 = <&sdhc1_opp_table>;
> +
> +                       bus-width = <8>;
> +                       non-removable;

This was actually a problem on sc7180 too, but you probably don't want
"non-removable" in the SoC file. Board files really should be adding
this. Though the SoC might be designed with the idea that this would
be used for a non-removable eMMC card I don't know why it wouldn't be
possible for someone to hook this up to an external slot and use a
GPIO somewhere as a card detect.


> +                       supports-cqe;
> +                       no-sd;
> +                       no-sdio;

Does the port really not support SD / SDIO, or are you adding these
two properties just because on your reference board it's not hooked up
to SD/SDIO? What exactly makes it impossible to use SD/SDIO on this
port?


> +                       max-frequency = <192000000>;

Why do you need to specify this?


> +                       qcom,dll-config = <0x0007642c>;
> +                       qcom,ddr-config = <0x80040868>;

These magic hex values really have no place being in dts which should
have things expressed at a higher level. ...but I guess that ship has
sailed and this is in the bindings so I guess we're stuck with them,
so I guess they're fine.


> +                       mmc-ddr-1_8v;
> +                       mmc-hs200-1_8v;
> +                       mmc-hs400-1_8v;
> +                       mmc-hs400-enhanced-strobe;
> +
> +                       status = "disabled";
> +
> +                       sdhc1_opp_table: sdhc1-opp-table {
> +                               compatible = "operating-points-v2";
> +
> +                               opp-100000000 {
> +                                       opp-hz = /bits/ 64 <100000000>;
> +                                       required-opps = <&rpmhpd_opp_low_svs>;
> +                                       opp-peak-kBps = <1200000 76000>;
> +                                       opp-avg-kBps = <1200000 50000>;

Why are the kBps numbers so vastly different than the ones on sc7180
for the same OPP point. That implies:

a) sc7180 is wrong.

b) This patch is wrong.

c) The numbers are essentially random and don't really matter.

Can you identify which of a), b), or c) is correct, or propose an
alternate explanation of the difference?


> +                               };
> +
> +                               opp-384000000 {
> +                                       opp-hz = /bits/ 64 <384000000>;
> +                                       required-opps = <&rpmhpd_opp_nom>;
> +                                       opp-peak-kBps = <5400000 1600000>;
> +                                       opp-avg-kBps = <6000000 300000>;

These opp numbers are also quite different than sc7180


> +                               };
> +                       };
> +               };
> +
>                 qupv3_id_0: geniqup@9c0000 {
>                         compatible = "qcom,geni-se-qup";
>                         reg = <0 0x009c0000 0 0x2000>;
> @@ -328,6 +391,54 @@
>                         };
>                 };
>
> +               sdhc_2: sdhci@8804000 {
> +                       compatible = "qcom,sdhci-msm-v5";
> +                       reg = <0 0x08804000 0 0x1000>;
> +
> +                       iommus = <&apps_smmu 0x100 0x0>;
> +                       interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +                                       <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "hc_irq", "pwr_irq";
> +
> +                       clocks = <&gcc GCC_SDCC2_APPS_CLK>,
> +                                       <&gcc GCC_SDCC2_AHB_CLK>,
> +                                       <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names = "core", "iface", "xo";
> +                       interconnects = <&aggre1_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
> +                                       <&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_SDCC_2 0>;
> +                       interconnect-names = "sdhc-ddr","cpu-sdhc";
> +                       power-domains = <&rpmhpd SC7280_CX>;
> +                       operating-points-v2 = <&sdhc2_opp_table>;
> +
> +                       bus-width = <4>;
> +
> +                       no-mmc;
> +                       no-sdio;

Similar question to above: why exactly would mmc not work? Are you
saying that if someone hooked this up to a full sized SD card slot and
placed an MMC card into the slot that it wouldn't work? Similar
question about SDIO. If someone placed an external SDIO card into your
slot, would it not work?


> +                       max-frequency = <202000000>;

Not needed?

> +
> +                       qcom,dll-config = <0x0007642c>;
> +
> +                       status = "disabled";
> +
> +                       sdhc2_opp_table: sdhc2-opp-table {
> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-100000000 {
> +                                               opp-hz =/bits/ 64 <100000000>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
> +                                               opp-peak-kBps = <1200000 76000>;
> +                                               opp-avg-kBps = <1200000 50000>;
> +                                       };
> +                                       opp-202000000 {

Blank line between the OPPs?

> +                                               opp-hz = /bits/ 64 <202000000>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                               opp-peak-kBps = <3500000 1200000>;
> +                                               opp-avg-kBps = <5000000 100000>;
> +                                       };

Similar questions about why the OPPs are so vastly different from sc7180.

> +                               };
> +               };
> +
>                 pdc: interrupt-controller@b220000 {
>                         compatible = "qcom,sc7280-pdc", "qcom,pdc";
>                         reg = <0 0x0b220000 0 0x30000>;
> @@ -374,6 +485,108 @@
>                                 pins = "gpio46", "gpio47";
>                                 function = "qup13";
>                         };
> +
> +                       sdc1_on: sdc1-on {
> +                               clk {
> +                                       pins = "sdc1_clk";
> +                                       bias-disable;
> +                                       drive-strength = <16>;
> +                               };
> +
> +                               cmd {
> +                                       pins = "sdc1_cmd";
> +                                       bias-pull-up;
> +                                       drive-strength = <10>;
> +                               };
> +
> +                               data {
> +                                       pins = "sdc1_data";
> +                                       bias-pull-up;
> +                                       drive-strength = <10>;
> +                               };
> +
> +                               rclk {
> +                                       pins = "sdc1_rclk";
> +                                       bias-pull-down;
> +                               };

* generally "bias" doesn't belong in the SoC file but instead should
be in the board file. Some boards might have external pulls (even if
the internal ones would work fine, hardware designers do weird things)
and thus might need to disable the internal ones (double pulls are not
great).

* generally drive-strength doesn't belong in the SoC file but should
be in the board file. Different boards with different layouts might
need different drive strengths, right?

If you remove those two things, I guess there's not actually much left
in the SoC dtsi file so I guess move these all to the board file? That
seems to be what we ended up with in "qrb5165-rb5.dts" / "sm8250.dtsi"
which is an example of a board using the new style of pinctrl for
devicetree.


> +                       };
> +
> +                       sdc1_off: sdc1-off {
> +                               clk {
> +                                       pins = "sdc1_clk";
> +                                       bias-disable;
> +                                       drive-strength = <2>;
> +                               };
> +
> +                               cmd {
> +                                       pins = "sdc1_cmd";
> +                                       bias-pull-up;
> +                                       drive-strength = <2>;
> +                               };
> +
> +                               data {
> +                                       pins = "sdc1_data";
> +                                       bias-pull-up;
> +                                       drive-strength = <2>;
> +                               };
> +
> +                               rclk {
> +                                       pins = "sdc1_rclk";
> +                                       bias-pull-down;
> +                               };
> +                       };

No need for a sleep state for the rclk since it's the same as the
active state, right? NOTE: one way to handle this would be to define
one node per pingroup and thus do something like:

pinctrl-names = "default", "sleep";
pinctrl-0 = <&sdc1_clk>, <&sdc1_cmd>, <&sdc1_data>, <&sdc1_rclk>;
pinctrl-1 = <&sdc1_clk_sleep>, <&sdc1_cmd_sleep>, <&sdc1_data_sleep>,
<&sdc1_rclk>;

I do wish we could avoid having to duplicate the "bias" in every board
file. Hrm, I wonder if this could be made simpler by actually putting
the "sleep" states in the sc7180.dtsi file (not the board file) and
using "bias-bus-hold" to avoid it being board specific?

Thus (assuming it works), the total summary would be:

1. Board dts file fully defines "sdc1_clk", "sdc1_cmd", "sdc1_data",
"sdc1_rclk", specifying whatever bias and drive strength needed for
the board.

2. SoC dtsi fully defines "sdc1_clk_sleep", "sdc1_cmd_sleep",
"sdc1_data_sleep", "sdc1_rclk_sleep", specifying drive-strength of 2
(for outputs) and "bias-bus-hold" which is OK for all board.


> +
> +                       sdc2_on: sdc2-on {
> +                               clk {
> +                                       pins = "sdc2_clk";
> +                                       bias-disable;
> +                                       drive-strength = <16>;
> +                               };
> +
> +                               cmd {
> +                                       pins = "sdc2_cmd";
> +                                       bias-pull-up;
> +                                       drive-strength = <10>;
> +                               };
> +
> +                               data {
> +                                       pins = "sdc2_data";
> +                                       bias-pull-up;
> +                                       drive-strength = <10>;
> +                               };
> +
> +                               sd-cd {
> +                                       pins = "gpio91";

NOTE: even if we find some reason to keep some of the pinctrl in the
SoC dtsi file, the card detect almost certainly needs to move _fully_
to the board dts file. Different boards could use a different card
detect pin.

> +                                       bias-pull-up;
> +                                       drive-strength = <2>;

Drive strength isn't needed for input pins. Please remove.

> +                               };
> +                       };
> +
> +                       sdc2_off: sdc2-off {
> +                               clk {
> +                                       pins = "sdc2_clk";
> +                                       bias-disable;
> +                                       drive-strength = <2>;
> +                               };
> +
> +                               cmd {
> +                                       pins = "sdc2_cmd";
> +                                       bias-pull-up;
> +                                       drive-strength = <2>;
> +                               };
> +
> +                               data {
> +                                       pins = "sdc2_data";
> +                                       bias-pull-up;
> +                                       drive-strength = <2>;
> +                               };
> +
> +                               sd-cd {
> +                                       pins = "gpio91";
> +                                       bias-pull-up;
> +                                       drive-strength = <2>;
> +                               };

There's definitely no need for a separate sleep state for the CD line.


-Doug
