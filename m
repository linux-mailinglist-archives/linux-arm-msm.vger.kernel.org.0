Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E6C63F0C41
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Aug 2021 21:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233682AbhHRUAP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Aug 2021 16:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233641AbhHRUAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Aug 2021 16:00:10 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D7FC061796
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 12:59:35 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id f33-20020a4a89240000b029027c19426fbeso1057296ooi.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Aug 2021 12:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Kbl2rut4rs05Gb47fn+fLcGDcQB3ZfWsMkd/ogdwojY=;
        b=ayXmpFaVf9gLjyf5iQTDu3yhPbQ1e/R792xuozeUlxwoGEtfu6sNdbYJZsp2T7oaez
         m9oQ/RsByN9xd+yEoKJ21eCLr2hHs5JjDAz1d7+JBr+WsOyTVUIKvQIzeDRohqcybtfP
         fR1xsYuQ0H6YlVnXX1us/atl9xVrC6L0QhsSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Kbl2rut4rs05Gb47fn+fLcGDcQB3ZfWsMkd/ogdwojY=;
        b=gAC9VP6lP6G8ePBSNtLWD/hKGyK2+aupT0C8dHuBeVkvjnYGTXxdOVnMI+F+5EQoK1
         9gO6fAMvkJ9BJV6vlayBLVHtIr8Qhhklo6JAOT1wCgaHosN1n0INrvkqzKtLJqTieUh3
         48igG+IdytUmI7qw/UoNhcwabmr+2uNWYWwgDIR/f/YDU/m44rz8gD1gd5iVV+9E/q1x
         yvN8iUGlpa91ODIBPuax49ciVyqqHJRf9QQWfD6VX314IRiHDMDe1Dii28roIH0wpVFw
         Hla8B3hbjE/u53waGssQQ5ES3lenKuXjoWYRHC1fWou1JoHZzaUL9dmk0K4AR9Z7yS2p
         OuGw==
X-Gm-Message-State: AOAM530XKEH4CbT9R71jihMRhXdkHx6qjF8OzTLGYF6EJXKDOurj3h3p
        xq3OSUmiBgL0JeeILJv9f0QIuvIBuLvczUwSsAPyzA==
X-Google-Smtp-Source: ABdhPJyGRWBU7UV1cjOTGM+Yo7Up2DBfhglDhGTBusbRPyvM2WJkliQTCdZp58CBulZ9jetWAa/ZNuHvM9ntxKdLKx0=
X-Received: by 2002:a4a:3651:: with SMTP id p17mr8162982ooe.92.1629316774589;
 Wed, 18 Aug 2021 12:59:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 18 Aug 2021 12:59:34 -0700
MIME-Version: 1.0
In-Reply-To: <1629282424-4070-3-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org> <1629282424-4070-3-git-send-email-mkrishn@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 18 Aug 2021 12:59:34 -0700
Message-ID: <CAE-0n52Sc4h9eZDiRPucv2oSj5TH9A00H0mOJfxxs=6aGpObhA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] arm64: dts: qcom: sc7280: Add DSI display nodes
To:     Krishna Manikandan <mkrishn@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>, kalyan_t@codeaurora.org,
        sbillaka@codeaurora.org, abhinavk@codeaurora.org,
        robdclark@gmail.com, bjorn.andersson@linaro.org,
        khsieh@codeaurora.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Krishna Manikandan (2021-08-18 03:27:03)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index fd7ff1c..aadf55d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -1507,6 +1519,95 @@
>                                         };
>                                 };
>                         };
> +
> +                       dsi0: dsi@ae94000 {
> +                               compatible = "qcom,mdss-dsi-ctrl";
> +                               reg = <0 0x0ae94000 0 0x400>;
> +                               reg-names = "dsi_ctrl";
> +
> +                               interrupt-parent = <&mdss>;
> +                               interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;

Drop flags as the #interrupt-cells is 0 for mdss

> +
> +                               clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_ESC0_CLK>,
> +                                        <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&gcc GCC_DISP_HF_AXI_CLK>;
> +                               clock-names = "byte",
> +                                             "byte_intf",
> +                                             "pixel",
> +                                             "core",
> +                                             "iface",
> +                                             "bus";
> +
> +                               operating-points-v2 = <&dsi_opp_table>;
> +                               power-domains = <&rpmhpd SC7280_CX>;
> +
> +                               phys = <&dsi_phy>;
> +                               phy-names = "dsi";
> +
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +
> +                               status = "disabled";
> +
> +                               ports {
> +                                       #address-cells = <1>;
> +                                       #size-cells = <0>;
> +
> +                                       port@0 {
> +                                               reg = <0>;
> +                                               dsi0_in: endpoint {
> +                                                       remote-endpoint = <&dpu_intf1_out>;
> +                                               };
> +                                       };
> +
> +                                       port@1 {
> +                                               reg = <1>;
> +                                               dsi0_out: endpoint {
> +                                               };
> +                                       };
> +                               };
> +
> +                               dsi_opp_table: dsi-opp-table {

dsi_opp_table: opp-table {

> +                                       compatible = "operating-points-v2";
> +
> +                                       opp-187500000 {
> +                                               opp-hz = /bits/ 64 <187500000>;
> +                                               required-opps = <&rpmhpd_opp_low_svs>;
> +                                       };
> +
> +                                       opp-300000000 {
> +                                               opp-hz = /bits/ 64 <300000000>;
> +                                               required-opps = <&rpmhpd_opp_svs>;
> +                                       };
> +
> +                                       opp-358000000 {
> +                                               opp-hz = /bits/ 64 <358000000>;
> +                                               required-opps = <&rpmhpd_opp_svs_l1>;
> +                                       };
> +                               };
> +                       };
> +
> +                       dsi_phy: dsi-phy@ae94400 {

phy@ae94400

> +                               compatible = "qcom,sc7280-dsi-phy-7nm";
> +                               reg = <0 0x0ae94400 0 0x200>,
> +                                     <0 0x0ae94600 0 0x280>,
> +                                     <0 0x0ae94900 0 0x280>;
> +                               reg-names = "dsi_phy",
> +                                           "dsi_phy_lane",
> +                                           "dsi_pll";
> +
> +                               #clock-cells = <1>;
> +                               #phy-cells = <0>;
> +
> +                               clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +                                        <&rpmhcc RPMH_CXO_CLK>;
> +                               clock-names = "iface", "ref";
> +
> +                               status = "disabled";
> +                       };
