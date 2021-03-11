Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579E4336869
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 01:10:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbhCKAKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 19:10:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbhCKAKG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 19:10:06 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEFE2C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 16:10:06 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id d20so21194597oiw.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 16:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5oYluSsE5PgMAKZ6OcpTYiQImPVjA/JRZBOqfxdZrMk=;
        b=pqi2kCbDuS85FYifp5gs9DTNbdngCBmFP3e89PGjWiEK7oabYVmuRgqrnN15PPRJ0X
         zBkRQF0wHqqVGJWrxzdL0FV9TMwzCBe1UHGVPSsPQA0F4/MGQC0ewpiPZcPN0XWVURGT
         cS00sU/nRfPBUm2uXXzBD53OJwNgSfG7j2SlBgO5/kUYnA1xevXv/SuFhW+AwMNMfhQS
         AiRkgh9mqD+AGBTuKFCGxMka06k0N3mxlBa+8WeJg5aEHQ2OD7L9RWaZDAWAeuxLpjN8
         ywq3iDnBuDnjZlmwzN83QPmLAINi1qRJCd/pzPmGnvYd4a0Th+KXf2T/5I91vO1rhWL5
         XcGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5oYluSsE5PgMAKZ6OcpTYiQImPVjA/JRZBOqfxdZrMk=;
        b=cdBMMOm0MgRwwdx0zOFgeyCgNJr5Dus/pSBMp7qnxP/xwF0le9UG3XY00u6HiXVvsj
         inSIrbMkHX/wKTWWGBBOMyYWIEk4MG8L4HPE+cAWhLAk4O9Ji+pKm7lP9ZAAtAufsTUj
         5nvrmKo7lWQ3C7kOp1CTCaQ2gvLiiCJF5yfLbtPj7tY6mB3/QsxXGo0Zp07st5/j4s9W
         d63UGrZdWjV6PLftjGrGvI4jOYtfggNxj9J4anY6eWZi1EZiVhoTuYmCBYs+UMGhrZ2X
         NtTnnVbVTL/oRIr1ykO+1qXJxEWwNH7v1uaOqYrOGx9fSzc4B3e5XegQQ2kErftuZb/6
         Et7w==
X-Gm-Message-State: AOAM530YJC1CjJ8hWBr9kKMMs1WFisTwl8hPcd6NKEc91W7NaXNEPQ2M
        f+vizV4Vhh0nebRdkHA7ElOJiw==
X-Google-Smtp-Source: ABdhPJzBye2+8MGYrslJiA1IxeynpPjkr+OCDSlyqqFocWcvHwDX9tjEqB1+bEx4u7Fji3vQ3w3cfA==
X-Received: by 2002:aca:f13:: with SMTP id 19mr4169811oip.56.1615421405962;
        Wed, 10 Mar 2021 16:10:05 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n12sm275665otq.42.2021.03.10.16.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 16:10:05 -0800 (PST)
Date:   Wed, 10 Mar 2021 18:10:03 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sm8250: fix display nodes
Message-ID: <YElf20GgcdREgvha@builder.lan>
References: <20210215162607.21360-1-jonathan@marek.ca>
 <20210215162607.21360-3-jonathan@marek.ca>
 <CAA8EJpqaVQ_eLrm2QLPvL+ieMabmKJdy0D9iciuC-G=1aiy1nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpqaVQ_eLrm2QLPvL+ieMabmKJdy0D9iciuC-G=1aiy1nQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 16 Feb 15:14 CST 2021, Dmitry Baryshkov wrote:

> Except for the compatible value changes:
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> May I suggest to split the compatibility name changes into a separate
> series from this patch (without it the patch stands a chance of being
> accepted into the stable tree, if I'm not mistaken).
> 

Please let me know what I should do with this patch.

Regards,
Bjorn

> On Mon, 15 Feb 2021 at 19:27, Jonathan Marek <jonathan@marek.ca> wrote:
> >
> > Apply these fixes to the newly added sm8250 display ndoes
> >  - Use sm8250 compatibles instead of sdm845 compatibles
> >  - Remove "notused" interconnect (which apparently was blindly copied from
> >    my old patches)
> >  - Use dispcc node example from dt-bindings, removing clocks which aren't
> >    documented or used by the driver and fixing the region size.
> >
> > Fixes: 7c1dffd471b1 ("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
> > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi | 31 +++++++---------------------
> >  1 file changed, 8 insertions(+), 23 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > index 947e1accae3a..693ac533f9b6 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > @@ -2323,14 +2323,13 @@ usb_2_dwc3: dwc3@a800000 {
> >                 };
> >
> >                 mdss: mdss@ae00000 {
> > -                       compatible = "qcom,sdm845-mdss";
> > +                       compatible = "qcom,sm8250-mdss";
> >                         reg = <0 0x0ae00000 0 0x1000>;
> >                         reg-names = "mdss";
> >
> > -                       interconnects = <&gem_noc MASTER_AMPSS_M0 &config_noc SLAVE_DISPLAY_CFG>,
> > -                                       <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
> > +                       interconnects = <&mmss_noc MASTER_MDP_PORT0 &mc_virt SLAVE_EBI_CH0>,
> >                                         <&mmss_noc MASTER_MDP_PORT1 &mc_virt SLAVE_EBI_CH0>;
> > -                       interconnect-names = "notused", "mdp0-mem", "mdp1-mem";
> > +                       interconnect-names = "mdp0-mem", "mdp1-mem";
> >
> >                         power-domains = <&dispcc MDSS_GDSC>;
> >
> > @@ -2356,7 +2355,7 @@ mdss: mdss@ae00000 {
> >                         ranges;
> >
> >                         mdss_mdp: mdp@ae01000 {
> > -                               compatible = "qcom,sdm845-dpu";
> > +                               compatible = "qcom,sm8250-dpu";
> >                                 reg = <0 0x0ae01000 0 0x8f000>,
> >                                       <0 0x0aeb0000 0 0x2008>;
> >                                 reg-names = "mdp", "vbif";
> > @@ -2580,7 +2579,7 @@ opp-358000000 {
> >
> >                 dispcc: clock-controller@af00000 {
> >                         compatible = "qcom,sm8250-dispcc";
> > -                       reg = <0 0x0af00000 0 0x20000>;
> > +                       reg = <0 0x0af00000 0 0x10000>;
> >                         mmcx-supply = <&mmcx_reg>;
> >                         clocks = <&rpmhcc RPMH_CXO_CLK>,
> >                                  <&dsi0_phy 0>,
> > @@ -2588,28 +2587,14 @@ dispcc: clock-controller@af00000 {
> >                                  <&dsi1_phy 0>,
> >                                  <&dsi1_phy 1>,
> >                                  <0>,
> > -                                <0>,
> > -                                <0>,
> > -                                <0>,
> > -                                <0>,
> > -                                <0>,
> > -                                <0>,
> > -                                <0>,
> > -                                <&sleep_clk>;
> > +                                <0>;
> >                         clock-names = "bi_tcxo",
> >                                       "dsi0_phy_pll_out_byteclk",
> >                                       "dsi0_phy_pll_out_dsiclk",
> >                                       "dsi1_phy_pll_out_byteclk",
> >                                       "dsi1_phy_pll_out_dsiclk",
> > -                                     "dp_link_clk_divsel_ten",
> > -                                     "dp_vco_divided_clk_src_mux",
> > -                                     "dptx1_phy_pll_link_clk",
> > -                                     "dptx1_phy_pll_vco_div_clk",
> > -                                     "dptx2_phy_pll_link_clk",
> > -                                     "dptx2_phy_pll_vco_div_clk",
> > -                                     "edp_phy_pll_link_clk",
> > -                                     "edp_phy_pll_vco_div_clk",
> > -                                     "sleep_clk";
> > +                                     "dp_phy_pll_link_clk",
> > +                                     "dp_phy_pll_vco_div_clk";
> >                         #clock-cells = <1>;
> >                         #reset-cells = <1>;
> >                         #power-domain-cells = <1>;
> > --
> > 2.26.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry
