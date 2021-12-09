Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7927346F5A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 22:11:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbhLIVPK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 16:15:10 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:33079 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232400AbhLIVPK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 16:15:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1639084296; x=1670620296;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ubKhQltU3EOL705uAA+X99brHvcDyRh8UTEU2CYjTt8=;
  b=gOSMq+D1+FAS9AKP4vgjlTcH9nlaq05ST4W3tFwb5MjWnQyWew+SuzSi
   35z/ZuwRzpgjREIrFp+JpXsWu7FdZJ5RfeQHWMXWlA2dCAx1+afegDg1C
   mCHpBBW9MBnZ3GBTUnISgtmEqHemPMPrKaVC1DgjTRBMOnSZ4k4OUgJxQ
   M=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 09 Dec 2021 13:11:36 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2021 13:11:35 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 9 Dec 2021 13:11:35 -0800
Received: from [10.111.171.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Thu, 9 Dec 2021
 13:11:32 -0800
Message-ID: <dcb95f64-8572-6c63-c7e2-0a2ea3917f98@quicinc.com>
Date:   Thu, 9 Dec 2021 13:11:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v1 5/8] drm/msm/dpu: stop manually removing debugfs files
 for the DPU plane
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
CC:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        "Daniel Vetter" <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20211201222633.2476780-1-dmitry.baryshkov@linaro.org>
 <20211201222633.2476780-6-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211201222633.2476780-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12/1/2021 2:26 PM, Dmitry Baryshkov wrote:
> DRM code handles removing all debugfs recursively. Drop plane-specific
> code to perform that.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 28 ++++++++---------------
>   1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index f80ee3ba9a8a..d3176f58708e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -110,7 +110,6 @@ struct dpu_plane {
>   	struct dpu_mdss_cfg *catalog;
>   
>   	/* debugfs related stuff */
> -	struct dentry *debugfs_root;
>   	struct dpu_debugfs_regset32 debugfs_src;
>   	struct dpu_debugfs_regset32 debugfs_scaler;
>   	struct dpu_debugfs_regset32 debugfs_csc;
> @@ -1368,15 +1367,16 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
>   	struct dpu_kms *kms = _dpu_plane_get_kms(plane);
>   	const struct dpu_sspp_cfg *cfg = pdpu->pipe_hw->cap;
>   	const struct dpu_sspp_sub_blks *sblk = cfg->sblk;
> +	struct dentry *debugfs_root;
>   
>   	/* create overall sub-directory for the pipe */
> -	pdpu->debugfs_root =
> +	debugfs_root =
>   		debugfs_create_dir(plane->name,
>   				plane->dev->primary->debugfs_root);
>   
>   	/* don't error check these */
>   	debugfs_create_xul("features", 0600,
> -			pdpu->debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
> +			debugfs_root, (unsigned long *)&pdpu->pipe_hw->cap->features);
>   
>   	/* add register dump support */
>   	dpu_debugfs_setup_regset32(&pdpu->debugfs_src,
> @@ -1384,7 +1384,7 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
>   			sblk->src_blk.len,
>   			kms);
>   	dpu_debugfs_create_regset32("src_blk", 0400,
> -			pdpu->debugfs_root, &pdpu->debugfs_src);
> +			debugfs_root, &pdpu->debugfs_src);
>   
>   	if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
>   			cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> @@ -1395,7 +1395,7 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
>   				sblk->scaler_blk.len,
>   				kms);
>   		dpu_debugfs_create_regset32("scaler_blk", 0400,
> -				pdpu->debugfs_root,
> +				debugfs_root,
>   				&pdpu->debugfs_scaler);
>   	}
>   
> @@ -1406,24 +1406,24 @@ static int _dpu_plane_init_debugfs(struct drm_plane *plane)
>   				sblk->csc_blk.len,
>   				kms);
>   		dpu_debugfs_create_regset32("csc_blk", 0400,
> -				pdpu->debugfs_root, &pdpu->debugfs_csc);
> +				debugfs_root, &pdpu->debugfs_csc);
>   	}
>   
>   	debugfs_create_u32("xin_id",
>   			0400,
> -			pdpu->debugfs_root,
> +			debugfs_root,
>   			(u32 *) &cfg->xin_id);
>   	debugfs_create_u32("clk_ctrl",
>   			0400,
> -			pdpu->debugfs_root,
> +			debugfs_root,
>   			(u32 *) &cfg->clk_ctrl);
>   	debugfs_create_x32("creq_vblank",
>   			0600,
> -			pdpu->debugfs_root,
> +			debugfs_root,
>   			(u32 *) &sblk->creq_vblank);
>   	debugfs_create_x32("danger_vblank",
>   			0600,
> -			pdpu->debugfs_root,
> +			debugfs_root,
>   			(u32 *) &sblk->danger_vblank);
>   
>   	return 0;
> @@ -1440,13 +1440,6 @@ static int dpu_plane_late_register(struct drm_plane *plane)
>   	return _dpu_plane_init_debugfs(plane);
>   }
>   
> -static void dpu_plane_early_unregister(struct drm_plane *plane)
> -{
> -	struct dpu_plane *pdpu = to_dpu_plane(plane);
> -
> -	debugfs_remove_recursive(pdpu->debugfs_root);
> -}
> -
>   static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
>   		uint32_t format, uint64_t modifier)
>   {
> @@ -1472,7 +1465,6 @@ static const struct drm_plane_funcs dpu_plane_funcs = {
>   		.atomic_duplicate_state = dpu_plane_duplicate_state,
>   		.atomic_destroy_state = dpu_plane_destroy_state,
>   		.late_register = dpu_plane_late_register,
> -		.early_unregister = dpu_plane_early_unregister,
>   		.format_mod_supported = dpu_plane_format_mod_supported,
>   };
>   
> 
