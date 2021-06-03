Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51CB139ABCA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 22:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhFCUbD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 16:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhFCUbC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 16:31:02 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910E4C061756
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jun 2021 13:29:17 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so7029041otl.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 13:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=xX3VYyjxzdpIjPz97c6PlVOdKP115o6p3Ui5EeqQcH8=;
        b=ih5nYpGzowbPdJfl92eNjSiXeyjEU8mqtDMi6euxHBeilZo65ZqleTe1Pm4RddVC4c
         B6r57+8YHVolT9AF5qMAGOdIsftI5Q9ik+rlE9alUQvw0PzTC6OwyETotdcYfF0LmBAX
         Mt53RFDUjlIO50L5YY2Ogw6GD8v/kIWSbrUGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=xX3VYyjxzdpIjPz97c6PlVOdKP115o6p3Ui5EeqQcH8=;
        b=UBaoVGrvF0s0cvb3fFN1Hq++Awah7o8hlLKa0tuHGi86lABpp8KwuP7mHNij/U5hDJ
         Sz5hOC4l25Ya7MInPCK4FQ0DYgXL71jnlijr2kPAMWovEf+2yyFMx2xti/0cAYDsNXMy
         ePgVWetVKYv0/x37eZ0f2WLQKEf6YkQzDIRneadsJzJDX6rlVzeXKvvceQ81ksvqkXOS
         DLiGdD1NrT3nhFBWXDXGnJhE/VYCa7NvKl3umQRgCvf+5oa9u+dchGkzu0jVou4vTD2B
         g7vmzr/8BbuCmL6DwAOg2gZn7R5F6j0ZvIvPM1d7Wtw8b8+kSRMTWppnQy6EQSQnaj7w
         WQ/w==
X-Gm-Message-State: AOAM533cvZBOak85SecSD38sbMNwEi/PHNXc/4KNfiKDMe2KWN3UDO9j
        HwxSUKULwFPaqX1Bn3VaLyuSYqGy7yT6iLW9STr2xHkCSiA=
X-Google-Smtp-Source: ABdhPJzEi43bs9A+1vKefCz1MnfpsKOuD1JXyyzfdyZKIKc9+GkL0Ty/1xFukAjWe+ur6BBOKH+NbAOBWyYfWF7fh9I=
X-Received: by 2002:a9d:18e:: with SMTP id e14mr933504ote.34.1622752156132;
 Thu, 03 Jun 2021 13:29:16 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Jun 2021 20:29:15 +0000
MIME-Version: 1.0
In-Reply-To: <1622738250-1469-1-git-send-email-khsieh@codeaurora.org>
References: <1622738250-1469-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 3 Jun 2021 20:29:15 +0000
Message-ID: <CAE-0n53t0fjZYTrsV3fwbPajswLXpgcm6crTAD6sYzTn7xNe8g@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7180: Add DisplayPort node
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        robdclark@gmail.com, robh+dt@kernel.org, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-06-03 09:37:30)
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 24d293e..40367a2 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -786,6 +786,15 @@ hp_i2c: &i2c9 {
>         status = "okay";
>  };
>
> +&dp {

This is in the wrong place now. Bjorn's suggestion for mdss_dp sounds
good to me, and then putting the node in alphabetical order.

> +        status = "okay";
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&dp_hot_plug_det>;
> +        data-lanes = <0 1>;
> +        vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
> +        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
> +};
> +
>  &pm6150_adc {
>         charger-thermistor@4f {
>                 reg = <ADC5_AMUX_THM3_100K_PU>;
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 6228ba2..05a4133 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3148,6 +3155,77 @@
>
>                                 status = "disabled";
>                         };
> +
> +                       dp: displayport-controller@ae90000 {
> +                               compatible = "qcom,sc7180-dp";
> +                               status = "disabled";
> +
> +                               reg = <0 0x0ae90000 0 0x1400>;
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <12>;
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_AUX_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_LINK_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_LINK_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK>;
> +                               clock-names = "core_iface", "core_aux", "ctrl_link",
> +                                             "ctrl_link_iface", "stream_pixel";
> +                               #clock-cells = <1>;
> +                               assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
> +                                                 <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
> +                               assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
> +                               phys = <&dp_phy>;
> +                               phy-names = "dp";
> +
> +                               operating-points-v2 = <&opp_table>;
> +                               power-domains = <&rpmhpd SC7180_CX>;

I'm also curious about the power domain for DP. My guess is that both
DSI and DP nodes should be a child of mdss if they're in the display
subsystem and powered down/inaccessible when the mdss_gdsc is disabled.

> +
> +                               #sound-dai-cells = <0>;
> +
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
> +                               opp_table: dp-opp-table {

I meant

	dp_opp_table: opp-table {
		...
	};

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
