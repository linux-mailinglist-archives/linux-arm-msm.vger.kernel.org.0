Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6219875FF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 09:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfGZHgf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 03:36:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53716 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbfGZHgf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 03:36:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: tomeu)
        with ESMTPSA id D762F28BE84
Subject: Re: [PATCH RESEND] drm: Switch to use DEVFREQ_GOV_SIMPLE_ONDEMAND
 constant
To:     Yue Hu <zbestahu@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
        robdclark@gmail.com, sean@poorly.run, robh@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, cw00.choi@samsung.com,
        myungjoo.ham@samsung.com, huyue2@yulong.com, zhangwen@yulong.com
References: <20190725035239.1192-1-zbestahu@gmail.com>
From:   Tomeu Vizoso <tomeu.vizoso@collabora.com>
Message-ID: <261610bd-a3b2-89dc-8269-dcdeaf450d3c@collabora.com>
Date:   Fri, 26 Jul 2019 09:36:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190725035239.1192-1-zbestahu@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/25/19 5:52 AM, Yue Hu wrote:
> From: Yue Hu <huyue2@yulong.com>
> 
> Since governor name is defined by DEVFREQ framework internally, use the
> macro definition instead of using the name directly.
> 
> Signed-off-by: Yue Hu <huyue2@yulong.com>

Acked-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>

> ---
>   drivers/gpu/drm/msm/msm_gpu.c               | 3 ++-
>   drivers/gpu/drm/panfrost/panfrost_devfreq.c | 3 ++-
>   2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 4edb874..f7308d6 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -95,7 +95,8 @@ static void msm_devfreq_init(struct msm_gpu *gpu)
>   	 */
>   
>   	gpu->devfreq.devfreq = devm_devfreq_add_device(&gpu->pdev->dev,
> -			&msm_devfreq_profile, "simple_ondemand", NULL);
> +			&msm_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
> +			NULL);
>   
>   	if (IS_ERR(gpu->devfreq.devfreq)) {
>   		DRM_DEV_ERROR(&gpu->pdev->dev, "Couldn't initialize GPU devfreq\n");
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index db79853..a7c18bc 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -157,7 +157,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>   	dev_pm_opp_put(opp);
>   
>   	pfdev->devfreq.devfreq = devm_devfreq_add_device(&pfdev->pdev->dev,
> -			&panfrost_devfreq_profile, "simple_ondemand", NULL);
> +			&panfrost_devfreq_profile, DEVFREQ_GOV_SIMPLE_ONDEMAND,
> +			NULL);
>   	if (IS_ERR(pfdev->devfreq.devfreq)) {
>   		DRM_DEV_ERROR(&pfdev->pdev->dev, "Couldn't initialize GPU devfreq\n");
>   		ret = PTR_ERR(pfdev->devfreq.devfreq);
> 
