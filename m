Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 543BE14BDEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 17:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726007AbgA1QlL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 11:41:11 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:39026 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgA1QlL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 11:41:11 -0500
Received: by mail-oi1-f196.google.com with SMTP id z2so10923811oih.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2020 08:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eZVtOBWzUTGUnixBKq8VG1mtg7KIRKYQrWYx+EU4+ew=;
        b=IzbxpbA6dwqrLY7ZW6n4Vjb1sLDeNpe5BpAn80OZwkzG1+1eJREceM74zOiZSpIEhJ
         zAkkpLPv/hfn0jas0xsYcMpdYnNILfhtyIRpbFP2Rh0POHMyQrKTNuBij5LU0W17rvpk
         +GwvReBnReCdFeRIxTfY35JduXcozp/JyS2lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eZVtOBWzUTGUnixBKq8VG1mtg7KIRKYQrWYx+EU4+ew=;
        b=kHerUQ4y8mqg5I5dOxFd2kSNoOV7/gTbXlgy23WTYydzbZmwsqxSD8eWi6ouKf/oN/
         2Ei+2uRQEmWzIf3Dt6QmfPmFnHBNsTfmLIRQHkT+9A1KFuMI4EMrQqLVD6iScK4O+/a5
         oWdWXDSp7LUfiigup2IC9eE9QJueNrooR20M3dltdeYVuMfIQ5VLBqf5RrkUPzs35QJ1
         PZGK1pTpCPww8owOS4cC7Kyavk8jLpMX9JwnqRNNsxWtJaMe8oTcnorBctgbo/87v0Mw
         pP1gjeuyohf0pIjMKYzWWFUozQvdG+6w0pmjkh0KqSAVLlDoJS7MHCo1A71BXefgTBdA
         rR5Q==
X-Gm-Message-State: APjAAAWRkdwsZ5YO7ZLt/PtqrKPV5kAqeKKfB4B8gXvodv4tPTVEjiJM
        avQ99T82+PL0nXkFKzoKqFFNelyF+B8=
X-Google-Smtp-Source: APXvYqyde44DFep9bIpzeL9Jh9AvdGymCY1CypztUb9j1EIXYRo3uJtH1qXF13XKmQ8zM5fGFM2Mxg==
X-Received: by 2002:aca:55cc:: with SMTP id j195mr3545887oib.22.1580229669392;
        Tue, 28 Jan 2020 08:41:09 -0800 (PST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id b49sm4686961otc.6.2020.01.28.08.41.09
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2020 08:41:09 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id g64so12581659otb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2020 08:41:09 -0800 (PST)
X-Received: by 2002:ab0:30c2:: with SMTP id c2mr13571036uam.8.1580229231280;
 Tue, 28 Jan 2020 08:33:51 -0800 (PST)
MIME-Version: 1.0
References: <20200124224225.22547-1-dianders@chromium.org> <20200124144154.v2.5.If590c468722d2985cea63adf60c0d2b3098f37d9@changeid>
 <149394fe-b726-15da-1c6f-a223d57a009f@codeaurora.org>
In-Reply-To: <149394fe-b726-15da-1c6f-a223d57a009f@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 28 Jan 2020 08:33:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XFFCPj8S7-WPjPLFe=iygpkYiyMqbneY0DMXsMz+j73w@mail.gmail.com>
Message-ID: <CAD=FV=XFFCPj8S7-WPjPLFe=iygpkYiyMqbneY0DMXsMz+j73w@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] clk: qcom: Fix sc7180 dispcc parent data
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jan 27, 2020 at 9:53 PM Taniya Das <tdas@codeaurora.org> wrote:
>
> Hi Doug,
>
> Thanks for the patch.
>
> On 1/25/2020 4:12 AM, Douglas Anderson wrote:
> > The bindings file (qcom,dispcc.yaml) says that the two clocks that
> > dispcc is a client of are named "xo" and "gpll0".  That means we have
> > to refer to them by those names.  We weren't referring to "xo"
> > properly in the driver.
> >
> > Then, in the patch ("dt-bindings: clock: Fix qcom,dispcc bindings for
> > sdm845/sc7180") we clarify the names for all of the clocks that we are
> > a client of.  Fix all those too, also getting rid of the "fallback"
> > names for them.  Since sc7180 is still in infancy there is no reason
> > to specify a fallback name.  People should just get the device tree
> > right.
> >
> > Since we didn't add the "test" clock to the bindings (apparently it's
> > never used), kill it from the driver.  If someone has a use for it we
> > should add it to the bindings and bring it back.
> >
> > Instead of updating all of the sizes of the arrays now that the test
> > clock is gone, switch to using the less error-prone ARRAY_SIZE.  Not
> > sure why it didn't always use that.
> >
> > Fixes: dd3d06622138 ("clk: qcom: Add display clock controller driver for SC7180")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v2:
> > - Patch ("clk: qcom: Fix sc7180 dispcc parent data") new for v2.
> >
> >   drivers/clk/qcom/dispcc-sc7180.c | 63 ++++++++++++--------------------
> >   1 file changed, 24 insertions(+), 39 deletions(-)
> >
> > diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
> > index 30c1e25d3edb..380eca3f847d 100644
> > --- a/drivers/clk/qcom/dispcc-sc7180.c
> > +++ b/drivers/clk/qcom/dispcc-sc7180.c
> > @@ -43,7 +43,7 @@ static struct clk_alpha_pll disp_cc_pll0 = {
> >               .hw.init = &(struct clk_init_data){
> >                       .name = "disp_cc_pll0",
> >                       .parent_data = &(const struct clk_parent_data){
> > -                             .fw_name = "bi_tcxo",
> > +                             .fw_name = "xo",
>
> These clock names are as per our HW design and we would not like to
> update them as they require lot of hand-coding. These codes are all
> auto-generated.

The names in your HW design are global names.  These are local names.
That means that these names are only used in the context of this one
clock driver.  As I understand it the way moving forward is that all
clocks that are inputs to this clock driver should be specified via
local names and that these local names should be somewhat stable
between different SoCs.  They should also, ideally, be more human
readable.

The mapping between local names and global names happens in the device
tree.  Specifically in the 10th patch in this series [1].

You can see that the clock "xo" (which is a local name) maps to
<&rpmhcc RPMH_CXO_CLK>.

It is OK that the global name for this clock in Linux is "bi_tcxo".
The string "xo" is _only_ used to look in the device tree to find the
clock this refers to.


A) If you are saying that the local clock name should have been
referred to as "bi_tcxo", then we need to go and change the bindings.
The bindings already say that the input clock is called "xo" and this
is true even without my series.  If we wanted to change this we'd also
need to go change some existing device tree files.  I don't think this
is the right way to go.

B) If you are saying that you don't like the idea of local names and
you'd rather use the old way of matching (relying on a global lookup
of a clock named "bi_tcxo"), I don't personally think that's right.
...but if the common clock maintainers say that's the way to jump then
I will.


Summary: I'm pretty sure it should be "xo" and you will have to update
your auto-generation code to handle the concept of local names.


> >                       },
> >                       .num_parents = 1,
> >                       .ops = &clk_alpha_pll_fabia_ops,
> > @@ -76,40 +76,32 @@ static struct clk_alpha_pll_postdiv disp_cc_pll0_out_even = {
> >
> >   static const struct parent_map disp_cc_parent_map_0[] = {
> >       { P_BI_TCXO, 0 },
> > -     { P_CORE_BI_PLL_TEST_SE, 7 },
> >   };
> >
> >   static const struct clk_parent_data disp_cc_parent_data_0[] = {
> > -     { .fw_name = "bi_tcxo" },
> > -     { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> > +     { .fw_name = "xo" },
> >   };
> >
> >   static const struct parent_map disp_cc_parent_map_1[] = {
> >       { P_BI_TCXO, 0 },
> >       { P_DP_PHY_PLL_LINK_CLK, 1 },
> >       { P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
> > -     { P_CORE_BI_PLL_TEST_SE, 7 },
> >   };
> >
> >   static const struct clk_parent_data disp_cc_parent_data_1[] = {
> > -     { .fw_name = "bi_tcxo" },
> > -     { .fw_name = "dp_phy_pll_link_clk", .name = "dp_phy_pll_link_clk" },
> > -     { .fw_name = "dp_phy_pll_vco_div_clk",
> > -                             .name = "dp_phy_pll_vco_div_clk"},
> > -     { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> > +     { .fw_name = "xo" },
> > +     { .fw_name = "dp_phy_pll_link" },
> > +     { .fw_name = "dp_phy_pll_vco_div" },
>
> similar comments for these too. They would conflict with our HW design
> clock names.

By using ".fw_name" you are asserting that these are _local names_ for
the clocks.  Yet, they are missing from the binding.  As per above
argument, the right answer is _not_ to move back to the old global
name matching, so we definitely need to addthis to the binding.  When
thinking about adding the clocks to the binding, I think can hear
Rob's voice whispering into my ear that if I'm adding the name of a
clock to the binding I don't need the name to end with "_clk".  Again,
I think you need to update your auto-generation tools.


Summary: I think my change is correct here.


> >   };
> >
> >   static const struct parent_map disp_cc_parent_map_2[] = {
> >       { P_BI_TCXO, 0 },
> >       { P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
> > -     { P_CORE_BI_PLL_TEST_SE, 7 },
> >   };
> >
> >   static const struct clk_parent_data disp_cc_parent_data_2[] = {
> > -     { .fw_name = "bi_tcxo" },
> > -     { .fw_name = "dsi0_phy_pll_out_byteclk",
> > -                             .name = "dsi0_phy_pll_out_byteclk" },
> > -     { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> > +     { .fw_name = "xo" },
> > +     { .fw_name = "dsi_phy_pll_byte" },
> >   };
> >
> >   static const struct parent_map disp_cc_parent_map_3[] = {
> > @@ -117,40 +109,33 @@ static const struct parent_map disp_cc_parent_map_3[] = {
> >       { P_DISP_CC_PLL0_OUT_MAIN, 1 },
> >       { P_GPLL0_OUT_MAIN, 4 },
> >       { P_DISP_CC_PLL0_OUT_EVEN, 5 },
> > -     { P_CORE_BI_PLL_TEST_SE, 7 },
> >   };
> >
> >   static const struct clk_parent_data disp_cc_parent_data_3[] = {
> > -     { .fw_name = "bi_tcxo" },
> > +     { .fw_name = "xo" },
> >       { .hw = &disp_cc_pll0.clkr.hw },
> > -     { .fw_name = "gcc_disp_gpll0_clk_src" },
> > +     { .fw_name = "gpll0" },
>
> This is not the correct clock, we have a child/branch clock which
> requires to be turned ON "gcc_disp_gpll0_clk_src" when we switch to this
> source.

Whether or not it is the right clock depends on patch #10.  In patch
10 you can see that I specify that "gpll0" is:

<&gcc GCC_DISP_GPLL0_CLK_SRC>,

...which means that we end up with the same clock as before.  So I
think it is the correct clock.

Then we can have a debate about whether the binding should have called
this local clock something different.  I will say that the bindings
already describe an input clock that is called "gpll0".  Should this
have been called something else in the bindings?


Summary: I think my change is correct unless we want to change the
existing bindings to call this something other than "gpll0".


> >       { .hw = &disp_cc_pll0_out_even.clkr.hw },
> > -     { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> >   };
> >
> >   static const struct parent_map disp_cc_parent_map_4[] = {
> >       { P_BI_TCXO, 0 },
> >       { P_GPLL0_OUT_MAIN, 4 },
> > -     { P_CORE_BI_PLL_TEST_SE, 7 },
> >   };
> >
> >   static const struct clk_parent_data disp_cc_parent_data_4[] = {
> > -     { .fw_name = "bi_tcxo" },
> > -     { .fw_name = "gcc_disp_gpll0_clk_src" },
> > -     { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> > +     { .fw_name = "xo" },
> > +     { .fw_name = "gpll0" },
>
> same comment as above.
>
> >   };
> >
> >   static const struct parent_map disp_cc_parent_map_5[] = {
> >       { P_BI_TCXO, 0 },
> >       { P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
> > -     { P_CORE_BI_PLL_TEST_SE, 7 },
> >   };
> >
> >   static const struct clk_parent_data disp_cc_parent_data_5[] = {
> > -     { .fw_name = "bi_tcxo" },
> > -     { .fw_name = "dsi0_phy_pll_out_dsiclk",
> > -                             .name = "dsi0_phy_pll_out_dsiclk" },
> > -     { .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
> > +     { .fw_name = "xo" },
> > +     { .fw_name = "dsi_phy_pll_pixel" },
> >   };
> >
> >   static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
> > @@ -169,7 +154,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
> >       .clkr.hw.init = &(struct clk_init_data){
> >               .name = "disp_cc_mdss_ahb_clk_src",
> >               .parent_data = disp_cc_parent_data_4,
> > -             .num_parents = 3,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
> >               .flags = CLK_SET_RATE_PARENT,
> >               .ops = &clk_rcg2_shared_ops,
> >       },
> > @@ -183,7 +168,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
> >       .clkr.hw.init = &(struct clk_init_data){
> >               .name = "disp_cc_mdss_byte0_clk_src",
> >               .parent_data = disp_cc_parent_data_2,
> > -             .num_parents = 3,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
> >               .flags = CLK_SET_RATE_PARENT,
> >               .ops = &clk_byte2_ops,
> >       },
> > @@ -203,7 +188,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
> >       .clkr.hw.init = &(struct clk_init_data){
> >               .name = "disp_cc_mdss_dp_aux_clk_src",
> >               .parent_data = disp_cc_parent_data_0,
> > -             .num_parents = 2,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
> >               .ops = &clk_rcg2_ops,
> >       },
> >   };
> > @@ -216,7 +201,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
> >       .clkr.hw.init = &(struct clk_init_data){
> >               .name = "disp_cc_mdss_dp_crypto_clk_src",
> >               .parent_data = disp_cc_parent_data_1,
> > -             .num_parents = 4,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> >               .flags = CLK_SET_RATE_PARENT,
> >               .ops = &clk_byte2_ops,
> >       },
> > @@ -230,7 +215,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
> >       .clkr.hw.init = &(struct clk_init_data){
> >               .name = "disp_cc_mdss_dp_link_clk_src",
> >               .parent_data = disp_cc_parent_data_1,
> > -             .num_parents = 4,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> >               .flags = CLK_SET_RATE_PARENT,
> >               .ops = &clk_byte2_ops,
> >       },
> > @@ -244,7 +229,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
> >       .clkr.hw.init = &(struct clk_init_data){
> >               .name = "disp_cc_mdss_dp_pixel_clk_src",
> >               .parent_data = disp_cc_parent_data_1,
> > -             .num_parents = 4,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
> >               .flags = CLK_SET_RATE_PARENT,
> >               .ops = &clk_dp_ops,
> >       },
> > @@ -259,7 +244,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
> >       .clkr.hw.init = &(struct clk_init_data){
> >               .name = "disp_cc_mdss_esc0_clk_src",
> >               .parent_data = disp_cc_parent_data_2,
> > -             .num_parents = 3,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
> >               .ops = &clk_rcg2_ops,
> >       },
> >   };
> > @@ -282,7 +267,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
> >       .clkr.hw.init = &(struct clk_init_data){
> >               .name = "disp_cc_mdss_mdp_clk_src",
> >               .parent_data = disp_cc_parent_data_3,
> > -             .num_parents = 5,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
> >               .ops = &clk_rcg2_shared_ops,
> >       },
> >   };
> > @@ -295,7 +280,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
> >       .clkr.hw.init = &(struct clk_init_data){
> >               .name = "disp_cc_mdss_pclk0_clk_src",
> >               .parent_data = disp_cc_parent_data_5,
> > -             .num_parents = 3,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
> >               .flags = CLK_SET_RATE_PARENT,
> >               .ops = &clk_pixel_ops,
> >       },
> > @@ -310,7 +295,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
> >       .clkr.hw.init = &(struct clk_init_data){
> >               .name = "disp_cc_mdss_rot_clk_src",
> >               .parent_data = disp_cc_parent_data_3,
> > -             .num_parents = 5,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
> >               .ops = &clk_rcg2_shared_ops,
> >       },
> >   };
> > @@ -324,7 +309,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
> >       .clkr.hw.init = &(struct clk_init_data){
> >               .name = "disp_cc_mdss_vsync_clk_src",
> >               .parent_data = disp_cc_parent_data_0,
> > -             .num_parents = 2,
> > +             .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
> >               .ops = &clk_rcg2_shared_ops,
> >       },
> >   };
> >
>
> All the above code are auto-generated and we really do not want to
> hand-code.

This is about ARRAY_SIZE()?  Maybe you can update your auto-generation
script.  I think it's cleaner / more readable and it would have
prevented a previous problem I would have had to debug.  See commit
74c31ff9c84a ("clk: qcom: gpu_cc_gmu_clk_src has 5 parents, not 6").

...or is this about the removal of the test clock?  I removed the test
clock at Stephen's request.  Once I have done that then I will not
match your auto-generated code anyway, so you probably need to update
them.  If you can convince Stephen that we should add the test clock
back in then I have no objections, though we'd need to add it as an
optional clock to the bindings (or accept that fact that it uses a
global name lookup to match).


Summary: I think my change is correct, but if you and Stephen come to
some different agreement about the test clock I can change.


[1] https://lore.kernel.org/r/20200124144154.v2.10.I1a4b93fb005791e29a9dcf288fc8bd459a555a59@changeid

-Doug
