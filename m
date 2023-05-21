Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B388E70AF74
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 20:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjEUS2k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 14:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbjEUSVA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 14:21:00 -0400
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156D699
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 11:12:02 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 0EEBB3F336;
        Sun, 21 May 2023 20:11:59 +0200 (CEST)
Date:   Sun, 21 May 2023 20:11:58 +0200
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
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
Message-ID: <fihs3di7da5rnvx63n4ums65rer62nps2ber77rojrtwacrgih@3r3aeedfvdr2>
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-21 20:21:46, Dmitry Baryshkov wrote:
> Drop SSPP-specifig debugfs register dumps in favour of using
> debugfs/dri/0/kms or devcoredump.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 25 ---------------------
>  1 file changed, 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index bfd82c2921af..6c5ebee2f7cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -727,31 +727,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
>  	debugfs_create_xul("features", 0600,
>  			debugfs_root, (unsigned long *)&hw_pipe->cap->features);
>  
> -	/* add register dump support */
> -	dpu_debugfs_create_regset32("src_blk", 0400,
> -			debugfs_root,
> -			sblk->src_blk.base + cfg->base,
> -			sblk->src_blk.len,
> -			kms);
> -
> -	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
> -			cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
> -		dpu_debugfs_create_regset32("scaler_blk", 0400,
> -				debugfs_root,
> -				sblk->scaler_blk.base + cfg->base,
> -				sblk->scaler_blk.len,
> -				kms);
> -
> -	if (cfg->features & BIT(DPU_SSPP_CSC) ||
> -			cfg->features & BIT(DPU_SSPP_CSC_10BIT))
> -		dpu_debugfs_create_regset32("csc_blk", 0400,
> -				debugfs_root,
> -				sblk->csc_blk.base + cfg->base,
> -				sblk->csc_blk.len,
> -				kms);
> -
>  	debugfs_create_u32("xin_id",
>  			0400,
>  			debugfs_root,
> -- 
> 2.39.2
> 
