Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84D672CF47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 21:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbjFLTYl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 15:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232673AbjFLTYl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 15:24:41 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [5.144.164.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5153710C2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 12:24:39 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 267CD1FA7F;
        Mon, 12 Jun 2023 21:24:37 +0200 (CEST)
Date:   Mon, 12 Jun 2023 21:24:35 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Degdag Mohamed <degdagmohamed@gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dsi: don't allow enabling 7nm VCO with
 unprogrammed rate
Message-ID: <m4qsohhaikbxr7jegtzebjtgxukgfpnzhu4zkhknzusgrt7nf3@3n64aahsiuen>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
 <20230612031616.3620134-2-dmitry.baryshkov@linaro.org>
 <g4ogg7ecraduqbvcxsost2lm26fr6rswdm4tgba5ae23b5jjvg@6mzv2u7bmw7u>
 <yyjkikzxsggwlnxcexho62zkapw5xrkogvoclsu6af7t5xcp3a@jdssfb3hz7px>
 <a8b72f2a-d5b2-723e-405a-e7c304ddeed4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8b72f2a-d5b2-723e-405a-e7c304ddeed4@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-12 21:30:05, Dmitry Baryshkov wrote:
> On 12/06/2023 12:21, Marijn Suijten wrote:
> > On 2023-06-12 11:15:53, Marijn Suijten wrote:
> >> On 2023-06-12 06:16:16, Dmitry Baryshkov wrote:
> >>> CCF can try enabling VCO before the rate has been programmed. This can
> >>> cause clock lockups and/or other boot issues. Program the VCO to the
> >>> minimal PLL rate if the read rate is 0 Hz.
> >>>
> >>> Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
> >>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>
> >> This unfortunately regresses my Xperia 5 (sofef01 panel driver that's
> >> on the lists) to now run at 30~33Hz instead of 60Hz.  I can provide
> >> debugging and clk trees later, if needed.

The clktree before and after this patch remains identical (Xperia 5):

    bi_tcxo                          11       11        0    19200000          0     0  50000         Y
       dsi0vco_clk                    1        1        0  1132181982          0     0  50000         Y
          dsi0_pll_out_div_clk        1        1        0  1132181982          0     0  50000         Y
             dsi0_pll_post_out_div_clk       0        0        0   283045495          0     0  50000         Y
             dsi0_pll_bit_clk         2        2        0  1132181982          0     0  50000         Y
                dsi0_pclk_mux         1        1        0  1132181982          0     0  50000         Y
                   dsi0_phy_pll_out_dsiclk       1        1        0   188696997          0     0  50000         Y
                      disp_cc_mdss_pclk0_clk_src       1        1        0   188696997          0     0  50000         Y
                         disp_cc_mdss_pclk0_clk       1        1        0   188696997          0     0  50000         Y
                dsi0_pll_by_2_bit_clk       0        0        0   566090991          0     0  50000         Y
                dsi0_phy_pll_out_byteclk       1        1        0   141522747          0     0  50000         Y
                   disp_cc_mdss_byte0_clk_src       2        2        0   141522747          0     0  50000         Y
                      disp_cc_mdss_byte0_div_clk_src       1        1        0    70761374          0     0  50000         Y
                         disp_cc_mdss_byte0_intf_clk       1        1        0    70761374          0     0  50000         Y
                      disp_cc_mdss_byte0_clk       1        1        0   141522747          0     0  50000         Y

But the word-diff from `debugcc -p sm8150 -b disp -a` pre and post shows
that the clocks were at first ticking exactly how Linux expects them
to (accurate on kHz it seems), but significantly lower after this patch:

    diff --git a/bahamut_pre_debugcc b/bahamut_post_debugcc
    index be8269ef34ae5..395048a9f37fe 100644
    --- a/bahamut_pre_debugcc
    +++ b/bahamut_post_debugcc
    @@ -1,6 +1,6 @@
                                  disp_cc_mdss_ahb_clk: 19.199412MHz (19199412Hz)
                                disp_cc_mdss_byte0_clk: [-141.522568MHz (141522568Hz)-]{+124.998840MHz (124998840Hz)+}
                           disp_cc_mdss_byte0_intf_clk: [-70.761796MHz (70761796Hz)-]{+62.500812MHz (62500812Hz)+}
                                disp_cc_mdss_byte1_clk: off
                           disp_cc_mdss_byte1_intf_clk: off
                              disp_cc_mdss_dp_aux1_clk: off
    @@ -19,15 +19,15 @@
                             disp_cc_mdss_edp_link_clk: off
                        disp_cc_mdss_edp_link_intf_clk: off
                            disp_cc_mdss_edp_pixel_clk: off
                                 disp_cc_mdss_esc0_clk: [-19.200000MHz (19200000Hz)-]{+19.199412MHz (19199412Hz)+}
                                 disp_cc_mdss_esc1_clk: off
                                  disp_cc_mdss_mdp_clk: [-200.000692MHz (200000692Hz)-]{+200.001280MHz (200001280Hz)+}
                              disp_cc_mdss_mdp_lut_clk: [-200.000108MHz (200000108Hz)-]{+200.001280MHz (200001280Hz)+}
                         disp_cc_mdss_non_gdsc_ahb_clk: [-19.199412MHz (19199412Hz)-]{+19.199704MHz (19199704Hz)+}
                                disp_cc_mdss_pclk0_clk: [-188.697976MHz (188697976Hz)-]{+166.668196MHz (166668196Hz)+}
                                disp_cc_mdss_pclk1_clk: off
                                  disp_cc_mdss_rot_clk: 19.200000MHz (19200000Hz)
                             disp_cc_mdss_rscc_ahb_clk: 19.200000MHz (19200000Hz)
                           disp_cc_mdss_rscc_vsync_clk:[-19.200000MHz (19200000Hz)-]
    [-                            disp_cc_mdss_vsync_clk:-] 19.199704MHz (19199704Hz)
                                {+disp_cc_mdss_vsync_clk: 19.200292MHz (19200292Hz)+}
                                        disp_cc_xo_clk: [-19.199704MHz (19199704Hz)-]{+19.200000MHz (19200000Hz)+}

> > I'll also retest the Xperia 1 with this, which has a 4k DSC panel.

On the Xperia 1 modetest also reports 30 instead of 60Hz now (4k mode,
not the 2.5k mode, if you've kept up with my panel series) but it
remains black.
(Note that this panel uses DSC, so the byte and pixel clock for this
 1644x3840 panel are ticking slower than for a 1080x2520 one :) )

Same story for the clk tree here, it is the same before and after this
patch:

    bi_tcxo                          11       11        0    19200000          0     0  50000         Y
       dsi0vco_clk                    1        1        0  1736017822          0     0  50000         Y
          dsi0_pll_out_div_clk        1        1        0   868008911          0     0  50000         Y
             dsi0_pll_post_out_div_clk       0        0        0   217002227          0     0  50000         Y
             dsi0_pll_bit_clk         2        2        0   868008911          0     0  50000         Y
                dsi0_pclk_mux         1        1        0   868008911          0     0  50000         Y
                   dsi0_phy_pll_out_dsiclk       1        1        0   144668152          0     0  50000         Y
                      disp_cc_mdss_pclk0_clk_src       1        1        0   144668152          0     0  50000         Y
                         disp_cc_mdss_pclk0_clk       1        1        0   144668152          0     0  50000         Y
                dsi0_pll_by_2_bit_clk       0        0        0   434004455          0     0  50000         Y
                dsi0_phy_pll_out_byteclk       1        1        0   108501113          0     0  50000         Y
                   disp_cc_mdss_byte0_clk_src       2        2        0   108501113          0     0  50000         Y
                      disp_cc_mdss_byte0_div_clk_src       1        1        0    54250557          0     0  50000         Y
                         disp_cc_mdss_byte0_intf_clk       1        1        0    54250557          0     0  50000         Y
                      disp_cc_mdss_byte0_clk       1        1        0   108501113          0     0  50000         Y

The measured clocks are now about half of what they're supposed to be:

    diff --git a/griffin_pre_debugcc b/griffin_post_debugcc
    index a5987e1671d3b..8c8618e60ad1c 100644
    --- a/griffin_pre_debugcc
    +++ b/griffin_post_debugcc
    @@ -1,6 +1,6 @@
                                  disp_cc_mdss_ahb_clk: [-19.200000MHz (19200000Hz)-]{+19.199704MHz (19199704Hz)+}
                                disp_cc_mdss_byte0_clk: [-108.502356MHz (108502356Hz)-]{+62.499932MHz (62499932Hz)+}
                           disp_cc_mdss_byte0_intf_clk: [-54.250372MHz (54250372Hz)-]{+31.250040MHz (31250040Hz)+}
                                disp_cc_mdss_byte1_clk: off
                           disp_cc_mdss_byte1_intf_clk: off
                              disp_cc_mdss_dp_aux1_clk: off
    @@ -21,13 +21,13 @@
                            disp_cc_mdss_edp_pixel_clk: off
                                 disp_cc_mdss_esc0_clk: 19.200000MHz (19200000Hz)
                                 disp_cc_mdss_esc1_clk: off
                                  disp_cc_mdss_mdp_clk: [-460.001848MHz (460001848Hz)-]{+460.000384MHz (460000384Hz)+}
                              disp_cc_mdss_mdp_lut_clk: [-460.001556MHz (460001556Hz)-]{+459.996280MHz (459996280Hz)+}
                         disp_cc_mdss_non_gdsc_ahb_clk: 19.200000MHz (19200000Hz)
                                disp_cc_mdss_pclk0_clk: [-144.668004MHz (144668004Hz)-]{+83.333584MHz (83333584Hz)+}
                                disp_cc_mdss_pclk1_clk: off
                                  disp_cc_mdss_rot_clk: [-19.199704MHz (19199704Hz)-]{+19.200000MHz (19200000Hz)+}
                             disp_cc_mdss_rscc_ahb_clk: [-19.200292MHz (19200292Hz)-]{+19.200000MHz (19200000Hz)+}
                           disp_cc_mdss_rscc_vsync_clk:[-19.199412MHz (19199412Hz)-]
    [-                            disp_cc_mdss_vsync_clk:-] 19.200000MHz (19200000Hz)
                                {+disp_cc_mdss_vsync_clk: 19.199412MHz (19199412Hz)+}
                                        disp_cc_xo_clk: 19.199704MHz (19199704Hz)

> > Is this intended to get rid of:
> > 
> >      msm_dsi_phy ae94400.phy: [drm:dsi_pll_7nm_vco_prepare] *ERROR* DSI PLL(0) lock failed, status=0x00000000: -110
> >      PLL(0) lock failed
> > 
> > ... at startup (and relevant rcg2 update_config failures, unbalanced
> > disables etc)?  It locks after a couple tries but it's still
> > unnecessarily spammy.
> 
> Yes.

It is still occuring twice, with the unbalanced disable/unprepare
warnings for dsi0_phy_pll_out_{bytes,dsi}clk.

- Marijn

> 
> > 
> > - Marijn
> > 
> >>
> >> - Marijn
> >>
> >>> ---
> >>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 5 +++++
> >>>   1 file changed, 5 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>> index 3b1ed02f644d..6979d35eb7c3 100644
> >>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> >>> @@ -395,11 +395,16 @@ static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
> >>>   	wmb(); /* Ensure that the reset is deasserted */
> >>>   }
> >>>   
> >>> +static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
> >>> +						  unsigned long parent_rate);
> >>>   static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
> >>>   {
> >>>   	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
> >>>   	int rc;
> >>>   
> >>> +	if (dsi_pll_7nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
> >>> +		dsi_pll_7nm_vco_set_rate(hw, pll_7nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
> >>> +
> >>>   	dsi_pll_enable_pll_bias(pll_7nm);
> >>>   	if (pll_7nm->slave)
> >>>   		dsi_pll_enable_pll_bias(pll_7nm->slave);
> >>> -- 
> >>> 2.39.2
> >>>
> 
> -- 
> With best wishes
> Dmitry
> 
