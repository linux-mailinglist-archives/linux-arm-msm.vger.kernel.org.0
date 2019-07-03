Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 536E65DD45
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 06:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbfGCEIr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 00:08:47 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44573 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbfGCEIr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 00:08:47 -0400
Received: by mail-pf1-f194.google.com with SMTP id t16so515283pfe.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jul 2019 21:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BOHEn0gshPaD156fAbU+LPgYeovu+KLC6H+rqvqrtq4=;
        b=thNW3ICbdgjo5v4OnrHC8HngYpGdmRrbNHaD/DbS92CXxHGPR59WaqhuwSzFyBYThW
         eeip6X5FJ/8DmwPxp53o5qXeCuYst0A/0fKVm9p/ZJJgreL8Mnl7RsLZssD700+4Lgnx
         BFm4LqDqLsjM7uO/1d7j0A/0n4CcW2Uy8o1oVQgj8vwuTyZDvN/IuUWC2a90f4NZkUIX
         5gV5QvPA6NVOeNYPJ107ElYM3bm60jG6d9vecux/YZBBMJeS9ixnOJ6J/qa4DnT9MOgK
         lWlLiZfrNmxIZZb/zvT7kyuNBfFtZqeFaXtcsCkZtrZy1wxGxLBMb2p6cPC4Y+wikg4x
         bM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BOHEn0gshPaD156fAbU+LPgYeovu+KLC6H+rqvqrtq4=;
        b=Dqp8u0dqtxXt4Xck+igMSy2bEUSDzTX0kpWuQYEY97wB22qkL5z9SveC0TlS9usADH
         milq3MG9cabtK8CdrxT4P88GSqdkyhiQRuvv/3shjQPpxApeGNX87R50tIONtiRs7iMt
         4X7gMtwK0jvyMY5yM5hj9NnoM7hEpgdBB90EKK//DnGbZjTu8wNzo9jL114dbLQmiMs0
         czeziWjSd1g8M7XbgB3aEQ07hwqBpQG72+PFNZ9GjYNSer0TBGweVFaR3lGWectLJ1yN
         ZP/LcykCe0twTARdpky2rsR9Nf4JOmLvLmQoypBekqoDBvYzAh8H1H5Zqb3BunvQjjoB
         4jGw==
X-Gm-Message-State: APjAAAXXn14XVCLyeOW6JUnTbWhgktJfRymOG4g4FTWaO+SkO/7aLhym
        VQZxmO3ukGY7kR/wzoBiUU22Ng==
X-Google-Smtp-Source: APXvYqxQq8cU5yTVEx60W1ue5LxeoHrpQ3mjFnp+R6PN/s26w0eINwgwrUDi2TCCpBgj2P6m9+w4ig==
X-Received: by 2002:a65:44c8:: with SMTP id g8mr34199417pgs.443.1562126926314;
        Tue, 02 Jul 2019 21:08:46 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f2sm563251pgs.83.2019.07.02.21.08.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 21:08:45 -0700 (PDT)
Date:   Tue, 2 Jul 2019 21:08:43 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/mdp5: Use drm_device for creating gem address
 space
Message-ID: <20190703040843.GA27383@builder>
References: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 01 Jul 10:39 PDT 2019, Jeffrey Hugo wrote:

> Creating the msm gem address space requires a reference to the dev where
> the iommu is located.  The driver currently assumes this is the same as
> the platform device, which breaks when the iommu is outside of the
> platform device.  Use the drm_device instead, which happens to always have
> a reference to the proper device.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Sorry, but on db820c this patch results in:

[   64.803263] msm_mdp 901000.mdp: [drm:mdp5_kms_init [msm]] *ERROR* failed to attach iommu: -19

Followed by 3 oopses as we're trying to fail the initialization.

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 4a60f5fca6b0..1347a5223918 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -702,7 +702,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>  	mdelay(16);
>  
>  	if (config->platform.iommu) {
> -		aspace = msm_gem_address_space_create(&pdev->dev,
> +		aspace = msm_gem_address_space_create(dev->dev,
>  				config->platform.iommu, "mdp5");
>  		if (IS_ERR(aspace)) {
>  			ret = PTR_ERR(aspace);
> -- 
> 2.17.1
> 
