Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46CF36F3A62
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 00:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232592AbjEAWXJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 18:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjEAWXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 18:23:08 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 546D31FDF
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 15:23:07 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A040540E5E;
        Tue,  2 May 2023 00:23:05 +0200 (CEST)
Date:   Tue, 2 May 2023 00:23:04 +0200
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
Subject: Re: [PATCH 4/4] drm/msm/dpu: move PINGPONG_NONE check to
 dpu_lm_init()
Message-ID: <ncdyjjt72to7mop6kgd46kmhvcqdzqyftdklm37dn3j5ycufx4@uvg74dm2x2zp>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
 <20230430203556.3184252-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430203556.3184252-5-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-04-30 23:35:56, Dmitry Baryshkov wrote:
> Move the check for lm->pingpong being not NONE from dpu_rm_init() to
> dpu_lm_init(), following the change to dpu_hw_intf_init().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

In some way I also suggested this change in [1], but did not receive a
(N)ACK.

[1]: https://lore.kernel.org/linux-arm-msm/ecopixnagol7yd5znvmjanknqbv7vi4ayy36vchaeyyhuavu4w@rkdfllrd4uzb/

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 5 +++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c    | 5 -----
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> index 214f207ddf8a..d1c3bd8379ea 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
> @@ -161,6 +161,11 @@ struct dpu_hw_mixer *dpu_hw_lm_init(const struct dpu_lm_cfg *cfg,
>  {
>  	struct dpu_hw_mixer *c;
>  
> +	if (cfg->pingpong == PINGPONG_NONE) {
> +		DPU_DEBUG("skip mixer %d without pingpong\n", cfg->id);
> +		return NULL;
> +	}
> +
>  	c = kzalloc(sizeof(*c), GFP_KERNEL);
>  	if (!c)
>  		return ERR_PTR(-ENOMEM);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index bf7b8e7c45b1..2ca3c666e22f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -117,11 +117,6 @@ int dpu_rm_init(struct dpu_rm *rm,
>  		struct dpu_hw_mixer *hw;
>  		const struct dpu_lm_cfg *lm = &cat->mixer[i];
>  
> -		if (lm->pingpong == PINGPONG_NONE) {
> -			DPU_DEBUG("skip mixer %d without pingpong\n", lm->id);
> -			continue;
> -		}
> -
>  		hw = dpu_hw_lm_init(lm, mmio);
>  		if (IS_ERR(hw)) {
>  			rc = PTR_ERR(hw);
> -- 
> 2.39.2
> 
