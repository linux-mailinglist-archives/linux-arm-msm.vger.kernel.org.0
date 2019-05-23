Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2574B28BEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 May 2019 22:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387652AbfEWUxI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 May 2019 16:53:08 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49966 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387533AbfEWUxI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 May 2019 16:53:08 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id D0FA86030E; Thu, 23 May 2019 20:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558644786;
        bh=9qZl9OmGjA14Kf6qbl/XVL++RbwClhXEXkUPbXo5f48=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RKLNQMhWrK+r23vbNlByhIYBYFO7vgpRapIPeuwuC/dG9b3QYUeviUJXiFr9ZInU+
         ShEhJWn3fDD12IFKgWn3Itp9SdfOpatjwOcEsjwMmsOyMY4DqWi74N5lKWWul4J2UF
         jY9OrlabbB8RpbR+LuA+u9Hy0Y3mDEabw3VHU6IQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6C57D6030E;
        Thu, 23 May 2019 20:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1558644786;
        bh=9qZl9OmGjA14Kf6qbl/XVL++RbwClhXEXkUPbXo5f48=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RKLNQMhWrK+r23vbNlByhIYBYFO7vgpRapIPeuwuC/dG9b3QYUeviUJXiFr9ZInU+
         ShEhJWn3fDD12IFKgWn3Itp9SdfOpatjwOcEsjwMmsOyMY4DqWi74N5lKWWul4J2UF
         jY9OrlabbB8RpbR+LuA+u9Hy0Y3mDEabw3VHU6IQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6C57D6030E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 23 May 2019 14:53:03 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 6/6] drm/msm/a6xx: Rename a6xx_gmu_probe to
 a6xx_gmu_init
Message-ID: <20190523205303.GG18360@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        linux-arm-msm@vger.kernel.org
References: <20190523171653.138678-1-sean@poorly.run>
 <20190523171653.138678-6-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523171653.138678-6-sean@poorly.run>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 23, 2019 at 01:16:45PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> This rename makes it more clear that everything initialized in the _init
> function must be cleaned up in a6xx_gmu_remove. This will hopefully
> dissuade people from using device managed resources (for reasons laid
> out in the previous patch).
> 
> Changes in v2:
> - None
> 
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index e2b839b5d3bd..5ab69dcd5479 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1259,7 +1259,7 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>  	gmu->initialized = false;
>  }
>  
> -int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
> +int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  {
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	struct platform_device *pdev = of_find_device_by_node(node);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index e74dce474250..1f9f4b0a9656 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -854,7 +854,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	/* FIXME: How do we gracefully handle this? */
>  	BUG_ON(!node);
>  
> -	ret = a6xx_gmu_probe(a6xx_gpu, node);
> +	ret = a6xx_gmu_init(a6xx_gpu, node);
>  	if (ret) {
>  		a6xx_destroy(&(a6xx_gpu->base.base));
>  		return ERR_PTR(ret);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index b46279eb18c5..64399554f2dd 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -53,7 +53,7 @@ bool a6xx_gmu_isidle(struct a6xx_gmu *gmu);
>  int a6xx_gmu_set_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>  void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>  
> -int a6xx_gmu_probe(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
> +int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
>  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
>  
>  void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq);
> -- 
> Sean Paul, Software Engineer, Google / Chromium OS
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
