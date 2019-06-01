Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EABEE319C8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Jun 2019 07:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbfFAFrZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Jun 2019 01:47:25 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40502 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfFAFrZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Jun 2019 01:47:25 -0400
Received: by mail-pg1-f196.google.com with SMTP id d30so5195833pgm.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2019 22:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=N4NYqP5qcFsuKou3hOU2QoLbHi9KXa2wwTKFEejFE9g=;
        b=YHiEJLdlNslOmqVxxCDPqKHWKNoy3U8FqNRl6OXkForegge1wL/cfA5vNcL0vXHSkE
         16X7UP9rxWjnITY62EyvrbyaV9fp6E7FCjytDj5vKX2kTN95rG2hjUnaqnAH4yXXzCc0
         iGd8IlCwyGAgw2dju6uBwMUTJoXf/3lU/8lFQLTwgTIJS1mYyGwf2R2IDjUov/x4Yu7m
         x0+DDkFJx5erlLm/0DbDsR9oWSayJnjv9k4S6sq5ymhUsbEZ/IX0I7MTHDZAmJeulx7B
         0HAxSc1JPDvaZvDg8sRaywaoUAh4n9RMy994KN5JDNQ0TMXoV3g8bzmvrfvUb5pvmGWg
         2IGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=N4NYqP5qcFsuKou3hOU2QoLbHi9KXa2wwTKFEejFE9g=;
        b=BDp2EJZzxnosQoWslMLtYwm0D8F5E1aakE3sZlDw8YejFVLKXhxJxWIFl8ipLYSakT
         FLjoOWFxz+tKD05fhbh9lF9A/4ThSfyqcKsK5of1vWG4WRP2R5nOXcDhvNhz5Hn8NXO4
         LXxFrYORpyR/R+L8gMJLyDudScPEAZwObpaaPANqnTP4Vnw9NCARRbJTLhKpxr0A4VBz
         sCvpIul1Pq3wqAhUERU2w7ulPTWny+c7eRZsF1IUZrZL5jKQUfbqpGCXmLw/gSqmoOMc
         AM2q9KGtDnfz1SOPs0DGeL5CmTFPGDs/KLT+FpQWqvVE1a5aScVfisAi8Z8SADb8PNR2
         cbzw==
X-Gm-Message-State: APjAAAXyksA6XKzL1rtpT8DnLqq/S7Ieiywm0PCkmPWjhERfKShV4qfw
        sIj+QBR4hbZQ7GNSGxnuPBexqA==
X-Google-Smtp-Source: APXvYqyWwgqCn57/81AHKxNxBjxPxel3NYyFS7mKcCvinFDQWA3aWLt0spiLAHLYe9RqMBaXDnB0zw==
X-Received: by 2002:a05:6a00:46:: with SMTP id i6mr1498503pfk.173.1559368044910;
        Fri, 31 May 2019 22:47:24 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n21sm7833707pff.92.2019.05.31.22.47.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2019 22:47:24 -0700 (PDT)
Date:   Fri, 31 May 2019 22:48:04 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Kees Cook <keescook@chromium.org>,
        linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Jonathan Marek <jonathan@marek.ca>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/msm/adreno: Ensure that the zap shader region is big
 enough
Message-ID: <20190601054804.GF22737@tuxbook-pro>
References: <1559340578-11482-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559340578-11482-1-git-send-email-jcrouse@codeaurora.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 31 May 15:09 PDT 2019, Jordan Crouse wrote:

> Before loading the zap shader we should ensure that the reserved memory
> region is big enough to hold the loaded file.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 6f7f411..3db8e49 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -67,7 +67,6 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  		return ret;
>  
>  	mem_phys = r.start;
> -	mem_size = resource_size(&r);
>  
>  	/* Request the MDT file for the firmware */
>  	fw = adreno_request_fw(to_adreno_gpu(gpu), fwname);
> @@ -83,6 +82,13 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  		goto out;
>  	}
>  
> +	if (mem_size > resource_size(&r)) {
> +		DRM_DEV_ERROR(dev,
> +			"memory region is too small to load the MDT\n");
> +		ret = -E2BIG;
> +		goto out;
> +	}
> +
>  	/* Allocate memory for the firmware image */
>  	mem_region = memremap(mem_phys, mem_size,  MEMREMAP_WC);
>  	if (!mem_region) {
> -- 
> 2.7.4
> 
