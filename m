Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84C09A7996
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 06:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbfIDENu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 00:13:50 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:34144 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbfIDENu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 00:13:50 -0400
Received: by mail-pf1-f193.google.com with SMTP id r12so202490pfh.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2019 21:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TKDcz9GEkq0+jTlX4XnG4MmP4DXsoB8ism0APIW6WXQ=;
        b=yWOqH74lTdL0xzn4KduFkFnfeuA6TxebZ/0lcsCSU6TfvfB33BHb5+UZKjrmx2xZfV
         z0mXE7FbdS+QTb/+X7UZTIi+dJTTpvNrStE+qGpoEIEUf/dEB3ISiDvaUraBduJnXLyN
         b09D5OMsvfI/eJIeAJE+aKgcVJnQMRsHiwQglRNZBi28wdsnRUzCmNPN7QaKe9KLl5cI
         fUTHUJIi9n/VgDgtEEk5ESV1R0hBDldBsD0vrE+C+7o5ET0/PLDGcVMfVC1qTcMtQE/+
         efYWZIJUuS+hD9bIcAdP1/FiLg0O635PzhAKlf8wDH/sgN7065DKKRjDMr1+1WBdv7XZ
         ORvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TKDcz9GEkq0+jTlX4XnG4MmP4DXsoB8ism0APIW6WXQ=;
        b=D/QXA9cULzWZwR8BgU7nd9fj3NA/W2o8eqEtlumRZtn3Z3psdjSuGobFuwlUVA2c2W
         BVMdCHPU66F5Y4U6wSElorg3fyMQY152IF9A1MPu79X53j5bXNPy9CWJM8D4FbH35n8g
         mTscSq60kivCG34InjgLwx381rN2e7CY8alUTViWo+woocW2X9rk0GOfIxliODSTV42U
         lik4YSsrN8okIhP+D4h/DKvYwULQcIminIRx2x2bxLsu4bYTi8JkArarHXkDpLyVVbd7
         /PUiU7uwP19x1LZ3nr5/+sptOLNFd/SNX70W1ASCL/pZtOfqdr2waqIVAL7SJafqMqD5
         lMQg==
X-Gm-Message-State: APjAAAX9V6M3mziPdheinMGfR8ZfIYWg+4ZSIgGtLXJazvmpfkXUN2Fj
        CS9bURM6lRyZviuPhQ2Vq89CmQ==
X-Google-Smtp-Source: APXvYqxsqJ3hNQRFq3ixeUtG46LHLPaeaxAQsBMx89pzwZF3ApMq4oZQvbEinaPSdK7PfwqTN14bVQ==
X-Received: by 2002:a63:550e:: with SMTP id j14mr29867505pgb.302.1567570429722;
        Tue, 03 Sep 2019 21:13:49 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b126sm21458534pfb.110.2019.09.03.21.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2019 21:13:49 -0700 (PDT)
Date:   Tue, 3 Sep 2019 21:13:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Denis Efremov <efremov@linux.com>
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 02/11] drm/msm: remove unlikely() from WARN_ON()
 conditions
Message-ID: <20190904041346.GB3081@tuxbook-pro>
References: <20190829165025.15750-1-efremov@linux.com>
 <20190829165025.15750-2-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829165025.15750-2-efremov@linux.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 29 Aug 09:50 PDT 2019, Denis Efremov wrote:

> "unlikely(WARN_ON(x))" is excessive. WARN_ON() already uses unlikely()
> internally.
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Joe Perches <joe@perches.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 4 ++--
>  drivers/gpu/drm/msm/disp/mdp_format.c    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> index 4804cf40de14..030279d7b64b 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> @@ -253,7 +253,7 @@ int mdp5_ctl_set_cursor(struct mdp5_ctl *ctl, struct mdp5_pipeline *pipeline,
>  	u32 blend_cfg;
>  	struct mdp5_hw_mixer *mixer = pipeline->mixer;
>  
> -	if (unlikely(WARN_ON(!mixer))) {
> +	if (WARN_ON(!mixer)) {
>  		DRM_DEV_ERROR(ctl_mgr->dev->dev, "CTL %d cannot find LM",
>  			ctl->id);
>  		return -EINVAL;
> @@ -695,7 +695,7 @@ struct mdp5_ctl_manager *mdp5_ctlm_init(struct drm_device *dev,
>  		goto fail;
>  	}
>  
> -	if (unlikely(WARN_ON(ctl_cfg->count > MAX_CTL))) {
> +	if (WARN_ON(ctl_cfg->count > MAX_CTL)) {
>  		DRM_DEV_ERROR(dev->dev, "Increase static pool size to at least %d\n",
>  				ctl_cfg->count);
>  		ret = -ENOSPC;
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 8afb0f9c04bb..5495d8b3f5b9 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -174,7 +174,7 @@ const struct msm_format *mdp_get_format(struct msm_kms *kms, uint32_t format,
>  
>  struct csc_cfg *mdp_get_default_csc_cfg(enum csc_type type)
>  {
> -	if (unlikely(WARN_ON(type >= CSC_MAX)))
> +	if (WARN_ON(type >= CSC_MAX))
>  		return NULL;
>  
>  	return &csc_convert[type];
> -- 
> 2.21.0
> 
