Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A7F31D1E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 22:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbhBPVPP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 16:15:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbhBPVPO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 16:15:14 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737B5C061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 13:14:34 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id 2so5358652qvd.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Feb 2021 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hB08Hex5jH3OEAwklXJjRqVB/0tlAly1XWF95x0VQAc=;
        b=Q526qaMU53BUMzYgjojnwGio2tYsiwj5uxhUKAB3JJw/p0dimgu7Zp2Mrgyx6fAY5m
         M8MpdngAvwcQ8slGAu6GoxouaHCt+7mwKrNv94hHaueLi09VBNrxkf3t+adRah7qTQmS
         T78+3w4ajMKFqnpUMQjqYgzRf+BWdvqL8XJ+s6t7iNpgD9Rwk0KO9Wliz2mcUxsSdYQe
         yAkcVXhERW26z1KRYzgsnOm6eL04huF6xvlX+NZ1MgbEy0HICrUxbAoe8nc8a9qOY9wL
         X+OGQa8GOyeiQPkk0qlRj75zjNS+Ox/nJwoeFlxhG1cW7+fzEFdbGy+QSmuxsAICtB2O
         +xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hB08Hex5jH3OEAwklXJjRqVB/0tlAly1XWF95x0VQAc=;
        b=CgqRry70/kNo/aaEFjfDOB62heXYL2mBL06PITE50ModheS8Gf9TLah7yHbQU+okjn
         c2ELgd5YdqSei/u6myCMNknJpp2GArUdXzJSroEymoDTbwqgLwT9AVyNvmp8IL58zqB7
         7KCcJyyJC7tQrOmAwcT3UmSGORW1nGqs/tpGIv9bM0WB+23RJYVtyOxq8Lafl8EfpyFi
         pvpZcE4sX5uUpTOxRaletA4onNSes2TlL1mMG4RkoCf2/F/PvQMmqGayuhgk3U8MoV+/
         9lHj7cCpP0BdC8YE7gueBnaE2Uq5ScpI0VtIk597AIBDqAmierXI16pSE4utphgSGK8T
         pVEA==
X-Gm-Message-State: AOAM532OFtlK7sf7Io8f/AFDA+cKU3E59K1J7/0Rk0MWS6JGzIoWQ1H3
        IUiGeTTp1Wp2Q+l/QUoSPd3+ZxT0lNCAunXvELmv5Q==
X-Google-Smtp-Source: ABdhPJxRsexzUUIspfEwIft7NyimSulqoXLWIV9rHB642HY3AbcyOHP52tDypBxYriF5ePnqgbG7ipU/OaZHMLXBJCI=
X-Received: by 2002:a0c:9142:: with SMTP id q60mr16928396qvq.23.1613510073677;
 Tue, 16 Feb 2021 13:14:33 -0800 (PST)
MIME-Version: 1.0
References: <20210215162607.21360-1-jonathan@marek.ca> <20210215162607.21360-3-jonathan@marek.ca>
In-Reply-To: <20210215162607.21360-3-jonathan@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 17 Feb 2021 00:14:21 +0300
Message-ID: <CAA8EJpqaVQ_eLrm2QLPvL+ieMabmKJdy0D9iciuC-G=1aiy1nQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8250: fix display nodes
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Except for the compatible value changes:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

May I suggest to split the compatibility name changes into a separate
series from this patch (without it the patch stands a chance of being
accepted into the stable tree, if I'm not mistaken).

On Mon, 15 Feb 2021 at 19:27, Jonathan Marek <jonathan@marek.ca> wrote:
>
> Apply these fixes to the newly added sm8250 display ndoes
>  - Use sm8250 compatibles instead of sdm845 compatibles
>  - Remove "notused" interconnect (which apparently was blindly copied from
>    my old patches)
>  - Use dispcc node example from dt-bindings, removing clocks which aren't
>    documented or used by the driver and fixing the region size.
>
> Fixes: 7c1dffd471b1 ("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 31 +++++++---------------------
>  1 file changed, 8 insertions(+), 23 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 947e1accae3a..693ac533f9b6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -2323,14 +2323,13 @@ usb_2_dwc3: dwc3@a800000 {
>                 };
>
>                 mdss: mdss@ae00000 {
> -                       compatible = "qcom,sdm845-mdss";
> +                       compatible = "qcom,sm8250-mdss";
>                         reg = <0 0x0ae00000 0 0x1000>;
>                         reg-names = "mdss";
>
> -                       interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc SLAVE_DISPLAY_CFG>,
> -                                       <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
> +                       interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
>                                         <&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>;
> -                       interconnect-names = "notused", "mdp0-mem", "mdp1-mem";
> +                       interconnect-names = "mdp0-mem", "mdp1-mem";
>
>                         power-domains = <&dispcc MDSS_GDSC>;
>
> @@ -2356,7 +2355,7 @@ mdss: mdss@ae00000 {
>                         ranges;
>
>                         mdss_mdp: mdp@ae01000 {
> -                               compatible = "qcom,sdm845-dpu";
> +                               compatible = "qcom,sm8250-dpu";
>                                 reg = <0 0x0ae01000 0 0x8f000>,
>                                       <0 0x0aeb0000 0 0x2008>;
>                                 reg-names = "mdp", "vbif";
> @@ -2580,7 +2579,7 @@ opp-358000000 {
>
>                 dispcc: clock-controller@af00000 {
>                         compatible = "qcom,sm8250-dispcc";
> -                       reg = <0 0x0af00000 0 0x20000>;
> +                       reg = <0 0x0af00000 0 0x10000>;
>                         mmcx-supply = <&mmcx_reg>;
>                         clocks = <&rpmhcc RPMH_CXO_CLK>,
>                                  <&dsi0_phy 0>,
> @@ -2588,28 +2587,14 @@ dispcc: clock-controller@af00000 {
>                                  <&dsi1_phy 0>,
>                                  <&dsi1_phy 1>,
>                                  <0>,
> -                                <0>,
> -                                <0>,
> -                                <0>,
> -                                <0>,
> -                                <0>,
> -                                <0>,
> -                                <0>,
> -                                <&sleep_clk>;
> +                                <0>;
>                         clock-names = "bi_tcxo",
>                                       "dsi0_phy_pll_out_byteclk",
>                                       "dsi0_phy_pll_out_dsiclk",
>                                       "dsi1_phy_pll_out_byteclk",
>                                       "dsi1_phy_pll_out_dsiclk",
> -                                     "dp_link_clk_divsel_ten",
> -                                     "dp_vco_divided_clk_src_mux",
> -                                     "dptx1_phy_pll_link_clk",
> -                                     "dptx1_phy_pll_vco_div_clk",
> -                                     "dptx2_phy_pll_link_clk",
> -                                     "dptx2_phy_pll_vco_div_clk",
> -                                     "edp_phy_pll_link_clk",
> -                                     "edp_phy_pll_vco_div_clk",
> -                                     "sleep_clk";
> +                                     "dp_phy_pll_link_clk",
> +                                     "dp_phy_pll_vco_div_clk";
>                         #clock-cells = <1>;
>                         #reset-cells = <1>;
>                         #power-domain-cells = <1>;
> --
> 2.26.1
>


-- 
With best wishes
Dmitry
