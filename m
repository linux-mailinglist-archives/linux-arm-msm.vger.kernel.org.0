Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DD703F0C5B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 22:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbhHRUDs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Aug 2021 16:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233061AbhHRUDq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Aug 2021 16:03:46 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26F46C0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 13:03:11 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id n1-20020a9d1e810000b0290514da4485e4so5577171otn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 13:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=ym9Fm7m6sy7H5lKucRZ2VUgiDeDjeE+ZTZ3eJU7aUyo=;
        b=RGbVCrOTkLxQu2zxKW6yFhg7W5vSmAN3IfqwEs7BUS7JBgfw8qXL580OzfpS92Sfrf
         dy0+00BwMrf2PZ531X1BPHjzKL1O/53rEyQ6hVmtHKyffnG4eTjy/4hsLZkfO8oD6SSc
         i5Ty+KBOe4Ukr/MX1bOAwfT4GxEdrDGfFo+Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=ym9Fm7m6sy7H5lKucRZ2VUgiDeDjeE+ZTZ3eJU7aUyo=;
        b=MRBermcu7NWvU1/++RmXrbKOmHZWTNvX0IKJf/bodZe3VF4wex4+AkrnL9ODd3EnmT
         kVOIDXU3TwMDfGR144a/IpXNigb2xHwE+pMnhgbMOds1nvrpp1cwO6V4FB+Q7NMJNxkI
         lXta2mx0H/aO+HGXIXLy4Do39lfgwYjNSGaIEeVYMOqIQwpMAOlWJg4B4W0UrvF3cqmt
         OwrBIE0EVqLk5Jl05kj9AA7L3d5TTNspQPtspAXP1etWSo/TiN1HX4rbl/MtJSXHKyNG
         cqoPSB3dEWQiBpIPz9bsgz1T0BhyIL9I5ntOFfbyAJARXG6ffKMbf8evlNmCA5KWsX08
         ORIw==
X-Gm-Message-State: AOAM532e/YXlGdP49cJc6+0/QEGxBoHPvi6oIBbZJ/M+8qi3M2zcnFx7
        OMwco0jBrHFg14UkRI1wiq5/dHY/MAWlfiJJbJH7hw==
X-Google-Smtp-Source: ABdhPJzb8BQ8psD7FT3EWZH6alcZfS1YeAhQiKsZQiGQprMq6RUws0JGjUe3Y4BcHP1uewICSj9Imei0g0m5f0WxPLw=
X-Received: by 2002:a9d:5542:: with SMTP id h2mr8532610oti.25.1629316990507;
 Wed, 18 Aug 2021 13:03:10 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Aug 2021 13:03:10 -0700
MIME-Version: 1.0
In-Reply-To: <1629282424-4070-4-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org> <1629282424-4070-4-git-send-email-mkrishn@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 18 Aug 2021 13:03:10 -0700
Message-ID: <CAE-0n504ykozx9Uf=B1zcXP+_EdE2Vqz9k1mzRpcwF9S6YpaFw@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: sc7280: add edp display dt nodes
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sankeerth Billakanti <sbillaka@codeaurora.org>,
        kalyan_t@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        khsieh@codeaurora.org, rajeevny@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-08-18 03:27:04)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index aadf55d..5be318e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1412,7 +1412,7 @@
>                         reg = <0 0xaf00000 0 0x20000>;
>                         clocks = <&rpmhcc RPMH_CXO_CLK>,
>                                  <&gcc GCC_DISP_GPLL0_CLK_SRC>,
> -                                <0>, <0>, <0>, <0>, <0>, <0>;
> +                                <0>, <0>, <0>, <0>, <&edp_phy 0>, <&edp_phy 1>;
>                         clock-names = "bi_tcxo", "gcc_disp_gpll0_clk",
>                                       "dsi0_phy_pll_out_byteclk",
>                                       "dsi0_phy_pll_out_dsiclk",
> @@ -1493,6 +1493,12 @@
>                                                         remote-endpoint = <&dsi0_in>;
>                                                 };
>                                         };

Newline here please.

> +                                       port@1 {
> +                                               reg = <1>;
> +                                               dpu_intf5_out: endpoint {
> +                                                       remote-endpoint = <&edp_in>;
> +                                               };
> +                                       };
>                                 };
>
>                                 mdp_opp_table: mdp-opp-table {
> @@ -1608,6 +1614,101 @@
>
>                                 status = "disabled";
>                         };
> +
> +                       msm_edp: edp@aea0000 {
> +                               status = "disabled";

Please pick a place to put status disabled. I don't know what qcom
maintainers want, but please be consistent.

> +                               compatible = "qcom,sc7280-edp";
> +                               reg = <0 0xaea0000 0 0x200>,
> +                                     <0 0xaea0200 0 0x200>,
> +                                     <0 0xaea0400 0 0xc00>,
> +                                     <0 0xaea1000 0 0x400>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <14 IRQ_TYPE_NONE>;

Drop flags.

> +
> +                               clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                                        <&gcc GCC_EDP_CLKREF_EN>,
> +                                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_AUX_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_LINK_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK>;
> +                               clock-names = "core_xo", "core_ref",
> +                                             "core_iface", "core_aux", "ctrl_link",
> +                                             "ctrl_link_iface", "stream_pixel";

One line per string please.

> +                               #clock-cells = <1>;
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
> +                                                 <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
> +                               assigned-clock-parents = <&edp_phy 0>, <&edp_phy 1>;
> +
> +                               phys = <&edp_phy>;
> +                               phy-names = "dp";
> +
> +                               vdda-1p2-supply = <&vreg_l6b_1p2>;
> +                               vdda-0p9-supply = <&vreg_l10c_0p8>;

Can this be done here? Probably needs to move to the board dts/dtsi
file.

> +                               operating-points-v2 = <&edp_opp_table>;
> +                               power-domains = <&rpmhpd SC7280_CX>;
> +
> +                               pinctrl-names = "default";
> +                               pinctrl-0 = <&edp_hot_plug_det>, <&edp_panel_power_on>;
> +
> +                               panel-bklt-gpio = <&pm8350c_gpios 7 GPIO_ACTIVE_HIGH>;
> +                               panel-pwm-gpio = <&pm8350c_gpios 8 GPIO_ACTIVE_HIGH>;

Please no panel-bklt-gpio and panel-pwm-gpio properties.

> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               edp_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf5_out>;
> +                                               };
> +                                       };
> +                               };
> +
> +                               edp_opp_table: edp-opp-table {

edp_opp_table: opp-table {

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
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +
> +                                       opp-810000000 {
> +                                               opp-hz = /bits/ 64 <810000000>;
> +                                               required-opps = <&rpmhpd_opp_nom>;
> +                                       };
> +                               };
> +                       };
> +
> +                       edp_phy: phy@aec2000 {

Good job on using phy!

> +                               status = "disabled";
> +                               compatible = "qcom,sc7280-edp-phy";
> +                               reg = <0 0xaec2a00 0 0x19c>,
> +                                     <0 0xaec2200 0 0xa0>,
> +                                     <0 0xaec2600 0 0xa0>,
> +                                     <0 0xaec2000 0 0x1c0>;
> +
> +                               clocks = <&rpmhcc RPMH_CXO_CLK>,
> +                                        <&gcc GCC_EDP_CLKREF_EN>;
> +                               clock-names = "aux", "cfg_ahb";
> +
> +                               vdda-pll-supply = <&vreg_l6b_1p2>;
> +                               vdda-phy-supply = <&vreg_l10c_0p8>;

Again, still question the ability to put this here vs. in IDP file.

> +
> +                               #clock-cells = <1>;
> +                               #phy-cells = <0>;
> +                       };
>                 };
>
>                 pdc: interrupt-controller@b220000 {
> @@ -1704,6 +1805,30 @@
>                                 function = "qup13";
>                         };
>
> +                       edp_hot_plug_det: edp-hot-plug-det {
> +                               pinmux {
> +                                       pins = "gpio60";
> +                                       function = "edp_hot";
> +                               };
> +                               pinconf {
> +                                       pins = "gpio60";
> +                                       bias-pull-down;
> +                                       input-enable;
> +                               };

Move pinconf stuff to board file (and combine nodes as mka stated).

> +                       };
> +
> +                       edp_panel_power_on: edp-panel-power-on {
> +                               pinmux {
> +                                       pins = "gpio80";
> +                                       function = "gpio";
> +                               };
> +                               pinconf {
> +                                       pins = "gpio80";
> +                                       bias-disable;
> +                                       output-high;
> +                               };
> +                       };
> +
>                         sdc1_on: sdc1-on {
>                                 clk {
>                                         pins = "sdc1_clk";
> --
> 2.7.4
>
