Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69BB151795A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 23:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387724AbiEBVqJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 17:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351705AbiEBVqI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 17:46:08 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8524F69
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 14:42:38 -0700 (PDT)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 766C23F353;
        Mon,  2 May 2022 23:42:36 +0200 (CEST)
Date:   Mon, 2 May 2022 23:42:35 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dsi: pll_7nm: remove unsupported dividers for
 DSI pixel clock
Message-ID: <20220502214235.s5plebunh4ttjhge@SoMainline.org>
References: <20220501195620.4135080-1-dmitry.baryshkov@linaro.org>
 <CAE-0n51uV-BpuPSrTFiN2wvzh3+==WMU85j8kdi-td0X4xs8kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n51uV-BpuPSrTFiN2wvzh3+==WMU85j8kdi-td0X4xs8kg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-05-02 13:47:51, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-05-01 12:56:20)
> > Remove dividers that are not recommended for DSI DPHY mode when setting
> 
> Is "DPHY" intentional or just "PHY" should be here?
> 
> > up the clock tree for the DSI pixel clock.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > index 6e506feb111f..66ed1919a1db 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> > @@ -687,15 +687,13 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
> >                 snprintf(clk_name, 32, "dsi%d_pclk_mux", pll_7nm->phy->id);
> >                 snprintf(parent, 32, "dsi%d_pll_bit_clk", pll_7nm->phy->id);
> >                 snprintf(parent2, 32, "dsi%d_pll_by_2_bit_clk", pll_7nm->phy->id);
> > -               snprintf(parent3, 32, "dsi%d_pll_out_div_clk", pll_7nm->phy->id);
> > -               snprintf(parent4, 32, "dsi%d_pll_post_out_div_clk", pll_7nm->phy->id);
> >
> >                 hw = devm_clk_hw_register_mux(dev, clk_name,
> >                                         ((const char *[]){
> > -                                       parent, parent2, parent3, parent4
> > -                                       }), 4, 0, pll_7nm->phy->base +
> > +                                       parent, parent2,
> > +                                       }), 2, 0, pll_7nm->phy->base +
> >                                         REG_DSI_7nm_PHY_CMN_CLK_CFG1,
> > -                                       0, 2, 0, NULL);
> > +                                       0, 1, 0, NULL);
> 
> Can you followup with a patch to move to clk_parent_data instead of
> strings?

Dmitry and I discussed this a while ago, and I actually have patches in
progress converting this.  Dmitry, if you haven't started on the
conversion yet, perhaps it's efficient if I respin my efforts and submit
them soon?

- Marijn
