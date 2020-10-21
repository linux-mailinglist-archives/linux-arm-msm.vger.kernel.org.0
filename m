Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9347929461A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 02:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439760AbgJUAtt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Oct 2020 20:49:49 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:51096 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439722AbgJUAtt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Oct 2020 20:49:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603241389; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3XFNLBbM72ThQINa/MBg5gJYLpGf8UCxBG+6itIFgOM=;
 b=O8R8bp+AwB3fU8APblrP89urt8VuptceHWbVPQGNbW51JNZK30KheAA1K264QN4X9nIndHnY
 iEnWksDtBjy1lm7FtDMXgBs8fm1gmfDrwbhNdPNMdg9a3MH+GVRzaoxCv0qJTrQfU7a42TfR
 G7qy5yEscj0p++fIxprbk4nAJq0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f8f855b588858a3047e8bd7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Oct 2020 00:48:27
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8AD8FC433F1; Wed, 21 Oct 2020 00:48:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 69F87C433C9;
        Wed, 21 Oct 2020 00:48:24 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 20 Oct 2020 17:48:24 -0700
From:   abhinavk@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH] drm/msm/atomic: Drop per-CRTC locks in
 reverse order
In-Reply-To: <20201020222600.264876-1-robdclark@gmail.com>
References: <20201020222600.264876-1-robdclark@gmail.com>
Message-ID: <185473dc6ac6abc9a343db07a1031170@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-20 15:26, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> lockdep dislikes seeing locks unwound in a non-nested fashion.
> 
> Fixes: 37c2016e3608 ("drm/msm: Fix race condition in msm driver with
> async layer updates")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c |  2 +-
>  drivers/gpu/drm/msm/msm_kms.h    |  4 ++++
>  include/drm/drm_crtc.h           | 10 ++++++++++
>  3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c 
> b/drivers/gpu/drm/msm/msm_atomic.c
> index b03d6ab6b19b..6a326761dc4a 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -67,7 +67,7 @@ static void unlock_crtcs(struct msm_kms *kms,
> unsigned int crtc_mask)
>  {
>  	struct drm_crtc *crtc;
> 
> -	for_each_crtc_mask(kms->dev, crtc, crtc_mask)
> +	for_each_crtc_mask_reverse(kms->dev, crtc, crtc_mask)
>  		mutex_unlock(&kms->commit_lock[drm_crtc_index(crtc)]);
>  }
> 
> diff --git a/drivers/gpu/drm/msm/msm_kms.h 
> b/drivers/gpu/drm/msm/msm_kms.h
> index 8d3e626c9fee..d8151a89e163 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -211,4 +211,8 @@ int dpu_mdss_init(struct drm_device *dev);
>  	drm_for_each_crtc(crtc, dev) \
>  		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
> 
> +#define for_each_crtc_mask_reverse(dev, crtc, crtc_mask) \
> +	drm_for_each_crtc_reverse(crtc, dev) \
> +		for_each_if (drm_crtc_mask(crtc) & (crtc_mask))
> +
>  #endif /* __MSM_KMS_H__ */
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index dfdb04619b0d..25f5958f2882 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -1274,4 +1274,14 @@ static inline struct drm_crtc
> *drm_crtc_find(struct drm_device *dev,
>  #define drm_for_each_crtc(crtc, dev) \
>  	list_for_each_entry(crtc, &(dev)->mode_config.crtc_list, head)
> 
> +/**
> + * drm_for_each_crtc_reverse - iterate over all CRTCs in reverse order
> + * @crtc: a &struct drm_crtc as the loop cursor
> + * @dev: the &struct drm_device
> + *
> + * Iterate over all CRTCs of @dev.
> + */
> +#define drm_for_each_crtc_reverse(crtc, dev) \
> +	list_for_each_entry_reverse(crtc, &(dev)->mode_config.crtc_list, 
> head)
> +
>  #endif /* __DRM_CRTC_H__ */
