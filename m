Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 093307537E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2019 18:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388585AbfGYQD6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 12:03:58 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:44494 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388481AbfGYQD5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 12:03:57 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 71A6260ACE; Thu, 25 Jul 2019 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564070636;
        bh=HDXaB/rW7q3NhbJzyZnv5ZmlVlcc/d4sB5nS46rp6rM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LzlsA72Sajdv3hJvLX1E57yeXPpZh/GAH4U5d6HG4/5yeoD0FHzDaCNa582dvHi5O
         K963VEHnUm3rfQLHXayFUO+EwB9Wy5IDZ5wyc2qvDwX/M0eJm6DSol8L+7Egj6Blph
         jwtD3aLs+OPWuow27T3TNh551Ue/7pT0F00LbXvg=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0C1A06086B;
        Thu, 25 Jul 2019 16:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564070631;
        bh=HDXaB/rW7q3NhbJzyZnv5ZmlVlcc/d4sB5nS46rp6rM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=itMOi4yCXHgJR6ppYN/+r7rGmGwbxzE0GMwSUEAtFQTikMUd+WnQSVO6Mwz6aKXA2
         vehbfWwGUEhk84lCesWnxUfMKaJYEl0EjhOEgvD2XCPRBgLZ5IMK0VVLX5nDbSgdQp
         T/oTscM52dvlKNK1ypD92V7XdKgyQT6UdiegBDH8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0C1A06086B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 25 Jul 2019 10:03:47 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Yue Hu <zbestahu@gmail.com>
Cc:     airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
        sean@poorly.run, robh@kernel.org, tomeu.vizoso@collabora.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, cw00.choi@samsung.com,
        myungjoo.ham@samsung.com, huyue2@yulong.com, zhangwen@yulong.com
Subject: Re: [PATCH RESEND] drm: Switch to use DEVFREQ_GOV_SIMPLE_ONDEMAND
 constant
Message-ID: <20190725160346.GB25162@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Yue Hu <zbestahu@gmail.com>, airlied@linux.ie,
        daniel@ffwll.ch, robdclark@gmail.com, sean@poorly.run,
        robh@kernel.org, tomeu.vizoso@collabora.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, cw00.choi@samsung.com,
        myungjoo.ham@samsung.com, huyue2@yulong.com, zhangwen@yulong.com
References: <20190725035239.1192-1-zbestahu@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725035239.1192-1-zbestahu@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 25, 2019 at 11:52:39AM +0800, Yue Hu wrote:
> From: Yue Hu <huyue2@yulong.com>
> 
> Since governor name is defined by DEVFREQ framework internally, use the
> macro definition instead of using the name directly.

Acked-by: Jordan Crouse <jcrouse@codeaurora.org> for the msm part.

> Signed-off-by: Yue Hu <huyue2@yulong.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c               | 3 ++-
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 4edb874..f7308d6 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -95,7 +95,8 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
>  	 */
>  
>  	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
> -			&msm_devfreq_profile, "simple_ondemand", NULL);
> +			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
> +			NULL);
>  
>  	if (IS_ERR(gpu->devfreq.devfreq)) {
>  		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index db79853..a7c18bc 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -157,7 +157,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>  	dev_pm_opp_put(opp);
>  
>  	pfdev->devfreq.devfreq = devm_devfreq_add_device(&pfdev->pdev->dev,
> -			&panfrost_devfreq_profile, "simple_ondemand", NULL);
> +			&panfrost_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
> +			NULL);
>  	if (IS_ERR(pfdev->devfreq.devfreq)) {
>  		DRM_DEV_ERROR(&pfdev->pdev->dev, "Couldn't initialize GPU devfreq\n");
>  		ret = PTR_ERR(pfdev->devfreq.devfreq);
> -- 
> 1.9.1
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
