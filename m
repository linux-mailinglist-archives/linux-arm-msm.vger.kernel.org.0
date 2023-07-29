Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34B6C7680F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jul 2023 20:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbjG2S2P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 14:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjG2S2O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 14:28:14 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1C112D
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 11:28:11 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 5668E3F1FA;
        Sat, 29 Jul 2023 20:28:08 +0200 (CEST)
Date:   Sat, 29 Jul 2023 20:28:06 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/7] drm/msm/dpu: inline _setup_intf_ops()
Message-ID: <kszqijb63rplnqczrw6xuzs5mci33w2qgn6c2ujxeag4x7ych3@7etvtti7ah4x>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-4-dmitry.baryshkov@linaro.org>
 <wv556zme7i33pczp7aqln5xcljz4xuygmqkmcrw2jayrmu4tsh@ohrbffyirknb>
 <e421a9b0-5943-faff-ebde-dc94cce43e69@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e421a9b0-5943-faff-ebde-dc94cce43e69@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-07-29 02:45:43, Dmitry Baryshkov wrote:
> On 27/07/2023 23:10, Marijn Suijten wrote:
> > On 2023-07-27 19:21:00, Dmitry Baryshkov wrote:
> >> Inline the _setup_intf_ops() function, it makes it easier to handle
> >> different conditions involving INTF configuration.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> > 
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 47 +++++++++------------
> >>   1 file changed, 21 insertions(+), 26 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> index 8ec6505d9e78..7ca772791a73 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> >> @@ -524,31 +524,6 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
> >>   	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
> >>   }
> >>   
> >> -static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
> >> -		unsigned long cap, const struct dpu_mdss_version *mdss_rev)
> >> -{
> >> -	ops->setup_timing_gen = dpu_hw_intf_setup_timing_engine;
> >> -	ops->setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
> >> -	ops->get_status = dpu_hw_intf_get_status;
> >> -	ops->enable_timing = dpu_hw_intf_enable_timing_engine;
> >> -	ops->get_line_count = dpu_hw_intf_get_line_count;
> >> -	if (cap & BIT(DPU_INTF_INPUT_CTRL))
> >> -		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
> >> -	ops->setup_misr = dpu_hw_intf_setup_misr;
> >> -	ops->collect_misr = dpu_hw_intf_collect_misr;
> >> -
> >> -	if (cap & BIT(DPU_INTF_TE)) {
> >> -		ops->enable_tearcheck = dpu_hw_intf_enable_te;
> >> -		ops->disable_tearcheck = dpu_hw_intf_disable_te;
> >> -		ops->connect_external_te = dpu_hw_intf_connect_external_te;
> >> -		ops->vsync_sel = dpu_hw_intf_vsync_sel;
> >> -		ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
> >> -	}
> >> -
> >> -	if (mdss_rev->core_major_ver >= 7)
> >> -		ops->program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
> >> -}
> >> -
> >>   struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
> >>   		void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
> >>   {
> >> @@ -571,7 +546,27 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
> >>   	 */
> >>   	c->idx = cfg->id;
> >>   	c->cap = cfg;
> >> -	_setup_intf_ops(&c->ops, c->cap->features, mdss_rev);
> >> +
> >> +	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
> >> +	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
> >> +	c->ops.get_status = dpu_hw_intf_get_status;
> >> +	c->ops.enable_timing = dpu_hw_intf_enable_timing_engine;
> >> +	c->ops.get_line_count = dpu_hw_intf_get_line_count;
> >> +	if (cfg->features & BIT(DPU_INTF_INPUT_CTRL))
> >> +		c->ops.bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
> > 
> > While at it, could we sort these down with the other conditional
> > callbacks?
> 
> What kind of sorting do you have in mind?

Moving this conditional ( if (...) ) down with the other conditional
assignment below, instead of being right in the middle of get_line_count
and setup_misr, both which are not conditional and make it harder to
read, especially considering the lack of newlines and/or curly braces.

> >> +	c->ops.setup_misr = dpu_hw_intf_setup_misr;
> >> +	c->ops.collect_misr = dpu_hw_intf_collect_misr;
> >> +
> >> +	if (cfg->features & BIT(DPU_INTF_TE)) {
> > 
> > Any clue why we're not using test_bit()?  Feels a bit inconsistent.
> 
> Yes, some files use test_bit(), others just check the bit directly. 
> Maybe after moving some/most of conditionals to core_major_ver we can 
> clean that too.

Sounds good.

- Marijn

> >> +		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
> >> +		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
> >> +		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
> >> +		c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
> >> +		c->ops.disable_autorefresh = dpu_hw_intf_disable_autorefresh;
> >> +	}
> >> +
> >> +	if (mdss_rev->core_major_ver >= 7)
> >> +		c->ops.program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
> >>   
> >>   	return c;
> >>   }
> >> -- 
> >> 2.39.2
> >>
> 
> -- 
> With best wishes
> Dmitry
> 
