Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C373F7B4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Aug 2021 19:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242243AbhHYRO3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 13:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242222AbhHYRON (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 13:14:13 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5D1C0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 10:13:27 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id i3-20020a056830210300b0051af5666070so46028096otc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 10:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=UCTcnsSbnb2BZPV5ZPemMMiSns8GwhF8Z8WDFU9MAlI=;
        b=Ibh57Mm8xpQqtAjHZeGcPf8lxPMd2widHCoILjnCYnTqer/uKN4ADjUsOUz/d8yeOn
         JSABs5wZGdIApigvNsHdWChYLvkAAtKABlqdFHzntcL38IXkoEf5VBY9P0iet573RMyT
         0mRFTWy4GCeiC1ANUzQ3PzLdIqEpqXZRaGZlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=UCTcnsSbnb2BZPV5ZPemMMiSns8GwhF8Z8WDFU9MAlI=;
        b=BHMdu14BvUhazTLEsh8VN0bAgflZa2bKiCHnMMO08PYOzKgxKXLwBLMx3c0tvy9lXo
         NXqhlzUKbkHdKaB7Eo470nRZh26k6KjYjOSQDDxRA2/4eI5bpVPEYitGUs5Fm8GEEZAI
         PMUjwCEnW+X8rwbbZBUiYHhV3f19t3JyBpuEqmvJDZA5PVKA61EprXYk9FELB6nbbvxE
         C6QbWoFRR/NeDx+vRMnbebyCZbHIYo89wKiM1XEm7yhYSDQGK+0B45fBzB1sHUUEagjn
         KHg1zeo1zr75M5SK+XIDe31s2lv4Ia73ZS2XKm84IUOt4vb3Sk1KzxiygUK1xYD6/K0U
         sZLQ==
X-Gm-Message-State: AOAM533JyEL0d7CI0KiVAsjExIAGUvdAf2ZkDT2qfvtm7dm4bCFB3sMy
        RJELlG488B6LoMmNaY2X+bjje67Tvd3ou+Rbu8/DhQ==
X-Google-Smtp-Source: ABdhPJzUAvvASSSNhBU6e1q+DsAdjQ//tA+JJPp3BoOFd00NZu2mdaPhv4bOdOq7WiLeweSJGe5V1lDrezdQ5NtyZMU=
X-Received: by 2002:a05:6830:2473:: with SMTP id x51mr31010415otr.34.1629911607276;
 Wed, 25 Aug 2021 10:13:27 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Aug 2021 17:13:26 +0000
MIME-Version: 1.0
In-Reply-To: <1629847226-10112-1-git-send-email-khsieh@codeaurora.org>
References: <1629847226-10112-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 25 Aug 2021 17:13:26 +0000
Message-ID: <CAE-0n50Yp00hzAhSET8txib3BhTzz2ptOaLhERoF-ggUGU6ChQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: Add Display Port node
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, robh+dt@kernel.org, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        mkrishn@codeaurora.org, kalyan_t@codeaurora.org,
        rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-08-24 16:20:26)
> Add display port supported node for sc7280. Also correct dp-phy node
> tx/rx/pcs/tx2/rx2 base reg address to fix aux channel read/write
> failure issue.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-idp2.dts |  9 +++

Please split the idp diff from the sc7280.dts diff so that there are two
patches instead of one. It helps with ignoring the idp diff.

>  arch/arm64/boot/dts/qcom/sc7280.dtsi     | 98 +++++++++++++++++++++++++++++---
>  2 files changed, 100 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> index b1cf70e..4aea369 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
> @@ -202,3 +202,12 @@ ap_h1_spi: &spi14 {};
>                 backlight = <&backlight>;
>         };
>  };
> +
> +&msm_dp {
> +       status = "okay";
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&dp_hot_plug_det>;
> +       data-lanes = <0 1>;
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l1b_0p8>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index c29226b..a350d84 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2918,15 +2918,11 @@
>                         dp_phy: dp-phy@88ea200 {
>                                 reg = <0 0x088ea200 0 0x200>,
>                                       <0 0x088ea400 0 0x200>,
> -                                     <0 0x088eac00 0 0x400>,
> +                                     <0 0x088eaa00 0 0x200>,
>                                       <0 0x088ea600 0 0x200>,
> -                                     <0 0x088ea800 0 0x200>,
> -                                     <0 0x088eaa00 0 0x100>;
> +                                     <0 0x088ea800 0 0x200>;

So this was wrong? Best to split that out into another patch with the
appropriate Fixes tag.

>                                 #phy-cells = <0>;
>                                 #clock-cells = <1>;
> -                               clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
> -                               clock-names = "pipe0";
> -                               clock-output-names = "usb3_phy_pipe_clk_src";

And then mention this part in the commit text of the fixing patch.

>                         };
>                 };
>
> @@ -3389,6 +3392,74 @@
>                                         };
>                                 };
>                         };
> +
> +                       msm_dp: displayport-controller@ae90000 {
> +                               status = "disabled";
> +                               compatible = "qcom,sc7180-dp";

Can we add qcom,sc7280-dp as well? Just in case anything is wrong with
sc7280 specifically.

> +
> +                               reg = <0 0x0ae90000 0 0x1400>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <12 IRQ_TYPE_NONE>;

Drop IRQ_TYPE_NONE per the binding it is one cell, not two.

> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +                               clock-names = "core_iface", "core_aux", "ctrl_link",
> +                                             "ctrl_link_iface", "stream_pixel";

Can we get clock-names on one line matching the clocks property please?
That makes it easier to match it up between the two properties.

> +                               #clock-cells = <1>;
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> +                                                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +                               assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
> +                               phys = <&dp_phy>;
> +                               phy-names = "dp";
> +
> +                               operating-points-v2 = <&dp_opp_table>;
> +                               power-domains = <&rpmhpd SC7180_CX>;
> +
> +                               #sound-dai-cells = <0>;

Nitpick: Newline here.

> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               dp_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf0_out>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               dp_out: endpoint { };
> +                                       };
> +                               };
> +
> +                               dp_opp_table: dp-opp-table {

dp_opp_table: opp-table {

> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-160000000 {
> +                                               opp-hz = /bits/ 64 <160000000>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
> +                                       };
> +
> +                                       opp-270000000 {
> +                                               opp-hz = /bits/ 64 <270000000>;
> +                                               required-opps = <&rpmhpd_opp_svs>;
> +                                       };
> +
> +                                       opp-540000000 {
> +                                               opp-hz = /bits/ 64 <540000000>;
> +                                               required-opps = <&rpmhpd_opp_svs_l1>;
> +                                       };
> +
> +                                       opp-810000000 {
> +                                               opp-hz = /bits/ 64 <810000000>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +                               };
> +                       };
>                 };
>
>                 dispcc: clock-controller@af00000 {
> @@ -3398,7 +3469,8 @@
>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>                                  <&dsi_phy 0>,
>                                  <&dsi_phy 1>,
> -                                <0>, <0>,
> +                                <&dp_phy 0>,
> +                                <&dp_phy 1>,
>                                  <&msm_edp 0>,
>                                  <&msm_edp 1>;
>                         clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
> @@ -3525,6 +3597,18 @@
>                                  };
>                          };
>
> +                       dp_hot_plug_det: dp-hot-plug-det {
> +                                pinmux {
> +                                        pins = "gpio47";
> +                                        function = "dp_hot";
> +                                };
> +
> +                               pinconf {
> +                                       pins = "gpio47";
> +                                       bias-disable;
> +                               };

Combine these two nodes (pinmux and pinconf) into one please.

                         dp_hot_plug_det: dp-hot-plug-det {
                                  pins = "gpio47";
                                  function = "dp_hot";
                                  bias-disable;
			 };

> +                        };
> +
>                         qspi_clk: qspi-clk {
>                                 pins = "gpio14";
>                                 function = "qspi_clk";
