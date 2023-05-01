Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6D2A6F3A53
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 00:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbjEAWOD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 18:14:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjEAWOD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 18:14:03 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3ABE199B
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 15:14:01 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D671640E50;
        Tue,  2 May 2023 00:13:59 +0200 (CEST)
Date:   Tue, 2 May 2023 00:13:58 +0200
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
Subject: Re: [PATCH 2/4] drm/msm/dpu: remove futile checks from dpu_rm_init()
Message-ID: <vciwnimlyzezirun3pnyqtyro3x7n5gb46egisyzbouejjas7b@ssbgx2oabw7o>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
 <20230430203556.3184252-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430203556.3184252-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-04-30 23:35:54, Dmitry Baryshkov wrote:
> dpu_rm_init() contains checks for block->id values. These were logical
> in the vendor driver, when one can not be sure which values were passed
> from DT. In the upstream driver this is not necessary: the catalog is a
> part of the driver, we control specified IDs.
> 
> Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I was going to send this on top of [1] to prevent conflicts, but it
seems you beat me to it and also based it on top of that series, though
without mentioning the dependency in the cover letter.

[1]: https://lore.kernel.org/linux-arm-msm/20230418-dpu-drop-useless-for-lookup-v3-3-e8d869eea455@somainline.org/

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 34 --------------------------
>  1 file changed, 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index dffd3dd0a877..d5a06628885e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -122,10 +122,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  			continue;
>  		}
>  
> -		if (lm->id < LM_0 || lm->id >= LM_MAX) {
> -			DPU_ERROR("skip mixer %d with invalid id\n", lm->id);
> -			continue;
> -		}
>  		hw = dpu_hw_lm_init(lm, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -139,10 +135,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_merge_3d *hw;
>  		const struct dpu_merge_3d_cfg *merge_3d = &cat->merge_3d[i];
>  
> -		if (merge_3d->id < MERGE_3D_0 || merge_3d->id >= MERGE_3D_MAX) {
> -			DPU_ERROR("skip merge_3d %d with invalid id\n", merge_3d->id);
> -			continue;
> -		}
>  		hw = dpu_hw_merge_3d_init(merge_3d, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -157,10 +149,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_pingpong *hw;
>  		const struct dpu_pingpong_cfg *pp = &cat->pingpong[i];
>  
> -		if (pp->id < PINGPONG_0 || pp->id >= PINGPONG_MAX) {
> -			DPU_ERROR("skip pingpong %d with invalid id\n", pp->id);
> -			continue;
> -		}
>  		hw = dpu_hw_pingpong_init(pp, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -177,10 +165,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_intf *hw;
>  		const struct dpu_intf_cfg *intf = &cat->intf[i];
>  
> -		if (intf->id < INTF_0 || intf->id >= INTF_MAX) {
> -			DPU_ERROR("skip intf %d with invalid id\n", intf->id);
> -			continue;
> -		}
>  		hw = dpu_hw_intf_init(intf, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -194,11 +178,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_wb *hw;
>  		const struct dpu_wb_cfg *wb = &cat->wb[i];
>  
> -		if (wb->id < WB_0 || wb->id >= WB_MAX) {
> -			DPU_ERROR("skip intf %d with invalid id\n", wb->id);
> -			continue;
> -		}
> -
>  		hw = dpu_hw_wb_init(wb, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -212,10 +191,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_ctl *hw;
>  		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
>  
> -		if (ctl->id < CTL_0 || ctl->id >= CTL_MAX) {
> -			DPU_ERROR("skip ctl %d with invalid id\n", ctl->id);
> -			continue;
> -		}
>  		hw = dpu_hw_ctl_init(ctl, mmio, cat->mixer_count, cat->mixer);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -229,10 +204,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_dspp *hw;
>  		const struct dpu_dspp_cfg *dspp = &cat->dspp[i];
>  
> -		if (dspp->id < DSPP_0 || dspp->id >= DSPP_MAX) {
> -			DPU_ERROR("skip dspp %d with invalid id\n", dspp->id);
> -			continue;
> -		}
>  		hw = dpu_hw_dspp_init(dspp, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> @@ -259,11 +230,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_sspp *hw;
>  		const struct dpu_sspp_cfg *sspp = &cat->sspp[i];
>  
> -		if (sspp->id < SSPP_NONE || sspp->id >= SSPP_MAX) {
> -			DPU_ERROR("skip intf %d with invalid id\n", sspp->id);
> -			continue;
> -		}
> -
>  		hw = dpu_hw_sspp_init(sspp, mmio, cat->ubwc);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> -- 
> 2.39.2
> 
