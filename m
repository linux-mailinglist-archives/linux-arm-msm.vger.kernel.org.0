Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1A372BC4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234174AbjFLJ2K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234514AbjFLJ1R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:27:17 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333802D46
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:21:53 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id AA6033F35C;
        Mon, 12 Jun 2023 11:21:50 +0200 (CEST)
Date:   Mon, 12 Jun 2023 11:21:49 +0200
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
Message-ID: <yyjkikzxsggwlnxcexho62zkapw5xrkogvoclsu6af7t5xcp3a@jdssfb3hz7px>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
 <20230612031616.3620134-2-dmitry.baryshkov@linaro.org>
 <g4ogg7ecraduqbvcxsost2lm26fr6rswdm4tgba5ae23b5jjvg@6mzv2u7bmw7u>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g4ogg7ecraduqbvcxsost2lm26fr6rswdm4tgba5ae23b5jjvg@6mzv2u7bmw7u>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-06-12 11:15:53, Marijn Suijten wrote:
> On 2023-06-12 06:16:16, Dmitry Baryshkov wrote:
> > CCF can try enabling VCO before the rate has been programmed. This can
> > cause clock lockups and/or other boot issues. Program the VCO to the
> > minimal PLL rate if the read rate is 0 Hz.
> > 
> > Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
> > Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> This unfortunately regresses my Xperia 5 (sofef01 panel driver that's
> on the lists) to now run at 30~33Hz instead of 60Hz.  I can provide
> debugging and clk trees later, if needed.

I'll also retest the Xperia 1 with this, which has a 4k DSC panel.

Is this intended to get rid of:

    msm_dsi_phy ae94400.phy: [drm:dsi_pll_7nm_vco_prepare] *ERROR* DSI PLL(0) lock failed, status=0x00000000: -110
    PLL(0) lock failed

... at startup (and relevant rcg2 update_config failures, unbalanced
disables etc)?  It locks after a couple tries but it's still
unnecessarily spammy.

- Marijn

> 
> - Marijn
> 
> > ---
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > index 3b1ed02f644d..6979d35eb7c3 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > @@ -395,11 +395,16 @@ static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm *pll)
> >  	wmb(); /* Ensure that the reset is deasserted */
> >  }
> >  
> > +static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
> > +						  unsigned long parent_rate);
> >  static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
> >  {
> >  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
> >  	int rc;
> >  
> > +	if (dsi_pll_7nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
> > +		dsi_pll_7nm_vco_set_rate(hw, pll_7nm->phy->cfg->min_pll_rate, VCO_REF_CLK_RATE);
> > +
> >  	dsi_pll_enable_pll_bias(pll_7nm);
> >  	if (pll_7nm->slave)
> >  		dsi_pll_enable_pll_bias(pll_7nm->slave);
> > -- 
> > 2.39.2
> > 
