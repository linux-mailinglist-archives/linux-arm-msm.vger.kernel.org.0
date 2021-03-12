Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2E5339936
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 22:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235314AbhCLVog (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 16:44:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234219AbhCLVoX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 16:44:23 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF690C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 13:44:21 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id s7so25907851qkg.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 13:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=988cISbTkrlQ00ZG9NcSPIj0eTwQKzRF624l5AjbHfc=;
        b=rwvitkM0Q4/HyZHykwXbcbIAan07Z96aVn+QKQG27eNLeGMUGAIXnLsApZn0m84dHP
         50drNZmzPml5s1JoYdtJuAH63YrbKlqoQDR2kaXz5mwtBm8dHOhbrDvexVmeLv1kgxcI
         ed8rzbvWhqgNv7uddIfbq+gl8rx3t8IKET+ATgnFfzUw82XzzpN3q5PAyWbNIlhyEurm
         02t6/n1rYBPhXuP8WvJuWqL3H5diLPz9wFFJbz1sVOdTHe0VS31uxydLIDYIRNFf22HN
         feoR+W/SEDtI6P1rqvAZvu522oePJT4q5jFvADlIgNXGVKesr4RaV+fUH9F7LQ7UAJIc
         7t+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=988cISbTkrlQ00ZG9NcSPIj0eTwQKzRF624l5AjbHfc=;
        b=CO6RkNmwtg1dv6bk8xMmuorP03ObMtbNlGJMCJTWwinIC/N9sd7L4rPgdNDv+qCiom
         qwujlvVs4exOKdpOZN6tyadmRcVohF9GqOjBBbEgu/2MCpruNMuYhEfHTOo6n8YiZFX2
         UFa/X3lHERuW3p0hDZvLuOnywEyqI4YHi7qliREOP2LoVpf+aSocpyAmdsBGzXGBaGNC
         beTGKdquZHvT2O8+QtpRCs4qQvRQ6tqufjPo6gekYmQJLeyIQ4130xo2hsvIneLkvpTE
         pkMV88jVLZXxpHCDhfbvGeCEGm69nwzLN1+yrQQqKXwkvpwP8H2JC6/RnVi3LQQvyxkB
         mg+g==
X-Gm-Message-State: AOAM532Wdb5dd8c/0yQHS+gJKW7ml1q7kqQJvFkGro1Io5CFUyY7qjIC
        ZVKHkm+9rsUDycHBbIFruBNJfkjk4Zp/aWcJ1HElTQ==
X-Google-Smtp-Source: ABdhPJw3KsgptmktbbL/n4MlHOBcw5eu5U14DZygLsJx0Rbs3Md3+DHcMn/T1r/ZsxYbUnzFm+Jj/lOj9x5sWHZjsFE=
X-Received: by 2002:a37:b6c4:: with SMTP id g187mr15199080qkf.162.1615585461010;
 Fri, 12 Mar 2021 13:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20210215162607.21360-1-jonathan@marek.ca> <20210215162607.21360-3-jonathan@marek.ca>
 <CAA8EJpqaVQ_eLrm2QLPvL+ieMabmKJdy0D9iciuC-G=1aiy1nQ@mail.gmail.com> <YElf20GgcdREgvha@builder.lan>
In-Reply-To: <YElf20GgcdREgvha@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 13 Mar 2021 00:44:10 +0300
Message-ID: <CAA8EJpoDiPJnFkS7Zh7n9Hh==bf3A5WeLMo9Z9qsvoZ_nEAbjg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8250: fix display nodes
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 11 Mar 2021 at 03:10, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 16 Feb 15:14 CST 2021, Dmitry Baryshkov wrote:
>
> > Except for the compatible value changes:
> >
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > May I suggest to split the compatibility name changes into a separate
> > series from this patch (without it the patch stands a chance of being
> > accepted into the stable tree, if I'm not mistaken).
> >
>
> Please let me know what I should do with this patch.

I suggested splitting the compatibility settings, so that the fixes
can go into the stable branch. I can carve that out, if Jonathan does
not object.

>
> Regards,
> Bjorn
>
> > On Mon, 15 Feb 2021 at 19:27, Jonathan Marek <jonathan@marek.ca> wrote:
> > >
> > > Apply these fixes to the newly added sm8250 display ndoes
> > >  - Use sm8250 compatibles instead of sdm845 compatibles
> > >  - Remove "notused" interconnect (which apparently was blindly copied from
> > >    my old patches)
> > >  - Use dispcc node example from dt-bindings, removing clocks which aren't
> > >    documented or used by the driver and fixing the region size.
> > >
> > > Fixes: 7c1dffd471b1 ("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
> > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 31 +++++++---------------------
> > >  1 file changed, 8 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > index 947e1accae3a..693ac533f9b6 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > @@ -2323,14 +2323,13 @@ usb_2_dwc3: dwc3@a800000 {
> > >                 };
> > >
> > >                 mdss: mdss@ae00000 {
> > > -                       compatible = "qcom,sdm845-mdss";
> > > +                       compatible = "qcom,sm8250-mdss";
> > >                         reg = <0 0x0ae00000 0 0x1000>;
> > >                         reg-names = "mdss";
> > >
> > > -                       interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc SLAVE_DISPLAY_CFG>,
> > > -                                       <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
> > > +                       interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
> > >                                         <&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>;
> > > -                       interconnect-names = "notused", "mdp0-mem", "mdp1-mem";
> > > +                       interconnect-names = "mdp0-mem", "mdp1-mem";
> > >
> > >                         power-domains = <&dispcc MDSS_GDSC>;
> > >
> > > @@ -2356,7 +2355,7 @@ mdss: mdss@ae00000 {
> > >                         ranges;
> > >
> > >                         mdss_mdp: mdp@ae01000 {
> > > -                               compatible = "qcom,sdm845-dpu";
> > > +                               compatible = "qcom,sm8250-dpu";
> > >                                 reg = <0 0x0ae01000 0 0x8f000>,
> > >                                       <0 0x0aeb0000 0 0x2008>;
> > >                                 reg-names = "mdp", "vbif";
> > > @@ -2580,7 +2579,7 @@ opp-358000000 {
> > >
> > >                 dispcc: clock-controller@af00000 {
> > >                         compatible = "qcom,sm8250-dispcc";
> > > -                       reg = <0 0x0af00000 0 0x20000>;
> > > +                       reg = <0 0x0af00000 0 0x10000>;
> > >                         mmcx-supply = <&mmcx_reg>;
> > >                         clocks = <&rpmhcc RPMH_CXO_CLK>,
> > >                                  <&dsi0_phy 0>,
> > > @@ -2588,28 +2587,14 @@ dispcc: clock-controller@af00000 {
> > >                                  <&dsi1_phy 0>,
> > >                                  <&dsi1_phy 1>,
> > >                                  <0>,
> > > -                                <0>,
> > > -                                <0>,
> > > -                                <0>,
> > > -                                <0>,
> > > -                                <0>,
> > > -                                <0>,
> > > -                                <0>,
> > > -                                <&sleep_clk>;
> > > +                                <0>;
> > >                         clock-names = "bi_tcxo",
> > >                                       "dsi0_phy_pll_out_byteclk",
> > >                                       "dsi0_phy_pll_out_dsiclk",
> > >                                       "dsi1_phy_pll_out_byteclk",
> > >                                       "dsi1_phy_pll_out_dsiclk",
> > > -                                     "dp_link_clk_divsel_ten",
> > > -                                     "dp_vco_divided_clk_src_mux",
> > > -                                     "dptx1_phy_pll_link_clk",
> > > -                                     "dptx1_phy_pll_vco_div_clk",
> > > -                                     "dptx2_phy_pll_link_clk",
> > > -                                     "dptx2_phy_pll_vco_div_clk",
> > > -                                     "edp_phy_pll_link_clk",
> > > -                                     "edp_phy_pll_vco_div_clk",
> > > -                                     "sleep_clk";
> > > +                                     "dp_phy_pll_link_clk",
> > > +                                     "dp_phy_pll_vco_div_clk";
> > >                         #clock-cells = <1>;
> > >                         #reset-cells = <1>;
> > >                         #power-domain-cells = <1>;
> > > --
> > > 2.26.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



-- 
With best wishes
Dmitry
