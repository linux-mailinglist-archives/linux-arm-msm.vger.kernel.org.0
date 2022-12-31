Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9764565A746
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 22:53:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbiLaVw7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Dec 2022 16:52:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229597AbiLaVw6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Dec 2022 16:52:58 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E2F64D4
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 13:52:57 -0800 (PST)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 58B023EBAF;
        Sat, 31 Dec 2022 22:52:55 +0100 (CET)
Date:   Sat, 31 Dec 2022 22:52:54 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Kalyan Thota <quic_kalyant@quicinc.com>
Subject: Re: [RFC PATCH 3/7] drm/msm/dpu: Disable MDP vsync source selection
 on DPU 5.0.0 and above
Message-ID: <20221231215254.pqaegrmldufi7ugo@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Kalyan Thota <quic_kalyant@quicinc.com>
References: <20221231215006.211860-1-marijn.suijten@somainline.org>
 <20221231215006.211860-4-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221231215006.211860-4-marijn.suijten@somainline.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-12-31 22:50:02, Marijn Suijten wrote:
> Since hardware revision 5.0.0 the TE configuration moved out of the
> PINGPONG block into the INTF block, including vsync source selection
> that was previously part of MDP top.  Writing to the MDP_VSYNC_SEL
> register has no effect anymore and is omitted downstream via the
> DPU/SDE_MDP_VSYNC_SEL feature flag.  This flag is only added to INTF
> blocks used by hardware prior to 5.0.0.
> 
> The code that writes to these registers in the INTF block will follow in
> subsequent patches.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 33 ++++++++++--
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    | 52 +++++++++++++------
>  3 files changed, 66 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 39d4b293710c..1cfe94494135 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -407,7 +407,7 @@ static const struct dpu_mdp_cfg msm8998_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
>  	.base = 0x0, .len = 0x458,
> -	.features = 0,
> +	.features = BIT(DPU_MDP_VSYNC_SEL),
>  	.highest_bank_bit = 0x2,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>  			.reg_off = 0x2AC, .bit_off = 0},
> @@ -436,7 +436,7 @@ static const struct dpu_mdp_cfg sdm845_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
>  	.base = 0x0, .len = 0x45C,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT),
> +	.features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
>  	.highest_bank_bit = 0x2,
>  	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
>  			.reg_off = 0x2AC, .bit_off = 0},
> @@ -512,6 +512,31 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
>  	},
>  };
>  
> +static const struct dpu_mdp_cfg sdm8150_mdp[] = {

Sometimes it is only possible to spot such things _after_ sending,
probably the thing that makes us human :)

sm8150_mdp*, not sdm.

- Marijn

> +	{
> +	.name = "top_0", .id = MDP_TOP,
> +	.base = 0x0, .len = 0x45C,
> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
> +	.highest_bank_bit = 0x2,
> +	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
> +			.reg_off = 0x2AC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
> +			.reg_off = 0x2B4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG2] = {
> +			.reg_off = 0x2BC, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_VIG3] = {
> +			.reg_off = 0x2C4, .bit_off = 0},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
> +			.reg_off = 0x2AC, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_DMA1] = {
> +			.reg_off = 0x2B4, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR0] = {
> +			.reg_off = 0x2BC, .bit_off = 8},
> +	.clk_ctrls[DPU_CLK_CTRL_CURSOR1] = {
> +			.reg_off = 0x2C4, .bit_off = 8},
> +	},
> +};
> +
>  static const struct dpu_mdp_cfg sm8250_mdp[] = {
>  	{
>  	.name = "top_0", .id = MDP_TOP,
> @@ -1901,8 +1926,8 @@ static const struct dpu_mdss_cfg sm6115_dpu_cfg = {
>  
>  static const struct dpu_mdss_cfg sm8150_dpu_cfg = {
>  	.caps = &sm8150_dpu_caps,
> -	.mdp_count = ARRAY_SIZE(sdm845_mdp),
> -	.mdp = sdm845_mdp,
> +	.mdp_count = ARRAY_SIZE(sdm8150_mdp),
> +	.mdp = sdm8150_mdp,
>  	.ctl_count = ARRAY_SIZE(sm8150_ctl),
>  	.ctl = sm8150_ctl,
>  	.sspp_count = ARRAY_SIZE(sdm845_sspp),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 3b645d5aa9aa..e0e153889ab7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -93,6 +93,7 @@ enum {
>  	DPU_MDP_UBWC_1_0,
>  	DPU_MDP_UBWC_1_5,
>  	DPU_MDP_AUDIO_SELECT,
> +	DPU_MDP_VSYNC_SEL,
>  	DPU_MDP_MAX
>  };
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index c3110a25a30d..2e699c9ad13c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -151,28 +151,16 @@ static void dpu_hw_get_danger_status(struct dpu_hw_mdp *mdp,
>  	status->sspp[SSPP_CURSOR1] = (value >> 26) & 0x3;
>  }
>  
> -static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
> +static void dpu_hw_setup_vsync_source_v1(struct dpu_hw_mdp *mdp,
>  		struct dpu_vsync_source_cfg *cfg)
>  {
>  	struct dpu_hw_blk_reg_map *c;
> -	u32 reg, wd_load_value, wd_ctl, wd_ctl2, i;
> -	static const u32 pp_offset[PINGPONG_MAX] = {0xC, 0x8, 0x4, 0x13, 0x18};
> +	u32 reg, wd_load_value, wd_ctl, wd_ctl2;
>  
> -	if (!mdp || !cfg || (cfg->pp_count > ARRAY_SIZE(cfg->ppnumber)))
> +	if (!mdp || !cfg)
>  		return;
>  
>  	c = &mdp->hw;
> -	reg = DPU_REG_READ(c, MDP_VSYNC_SEL);
> -	for (i = 0; i < cfg->pp_count; i++) {
> -		int pp_idx = cfg->ppnumber[i] - PINGPONG_0;
> -
> -		if (pp_idx >= ARRAY_SIZE(pp_offset))
> -			continue;
> -
> -		reg &= ~(0xf << pp_offset[pp_idx]);
> -		reg |= (cfg->vsync_source & 0xf) << pp_offset[pp_idx];
> -	}
> -	DPU_REG_WRITE(c, MDP_VSYNC_SEL, reg);
>  
>  	if (cfg->vsync_source >= DPU_VSYNC_SOURCE_WD_TIMER_4 &&
>  			cfg->vsync_source <= DPU_VSYNC_SOURCE_WD_TIMER_0) {
> @@ -219,6 +207,33 @@ static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
>  	}
>  }
>  
> +static void dpu_hw_setup_vsync_source(struct dpu_hw_mdp *mdp,
> +		struct dpu_vsync_source_cfg *cfg)
> +{
> +	struct dpu_hw_blk_reg_map *c;
> +	u32 reg, i;
> +	static const u32 pp_offset[PINGPONG_MAX] = {0xC, 0x8, 0x4, 0x13, 0x18};
> +
> +	if (!mdp || !cfg || (cfg->pp_count > ARRAY_SIZE(cfg->ppnumber)))
> +		return;
> +
> +	c = &mdp->hw;
> +
> +	reg = DPU_REG_READ(c, MDP_VSYNC_SEL);
> +	for (i = 0; i < cfg->pp_count; i++) {
> +		int pp_idx = cfg->ppnumber[i] - PINGPONG_0;
> +
> +		if (pp_idx >= ARRAY_SIZE(pp_offset))
> +			continue;
> +
> +		reg &= ~(0xf << pp_offset[pp_idx]);
> +		reg |= (cfg->vsync_source & 0xf) << pp_offset[pp_idx];
> +	}
> +	DPU_REG_WRITE(c, MDP_VSYNC_SEL, reg);
> +
> +	dpu_hw_setup_vsync_source_v1(mdp, cfg);
> +}
> +
>  static void dpu_hw_get_safe_status(struct dpu_hw_mdp *mdp,
>  		struct dpu_danger_safe_status *status)
>  {
> @@ -266,7 +281,12 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>  	ops->setup_split_pipe = dpu_hw_setup_split_pipe;
>  	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
>  	ops->get_danger_status = dpu_hw_get_danger_status;
> -	ops->setup_vsync_source = dpu_hw_setup_vsync_source;
> +
> +	if (cap & BIT(DPU_MDP_VSYNC_SEL))
> +		ops->setup_vsync_source = dpu_hw_setup_vsync_source;
> +	else
> +		ops->setup_vsync_source = dpu_hw_setup_vsync_source_v1;
> +
>  	ops->get_safe_status = dpu_hw_get_safe_status;
>  
>  	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
> -- 
> 2.39.0
> 
