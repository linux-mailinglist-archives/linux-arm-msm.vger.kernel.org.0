Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82DA1625D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2019 18:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390583AbfGHQKb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 12:10:31 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42404 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730119AbfGHQKa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 12:10:30 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay6so8512728plb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2019 09:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fDCoSY5K0ITJqQYvscwo5UxJiyuZc3RyIH7jJSLU88U=;
        b=CfLjv4t9r4Kg2mSofS2nlQZMto3UY4mstJJjBcy91IFpxTd6+xOv3VwdVLcgFVUdVW
         j5PVsTuIkjKvjex7sWx70GltkB3B71Am79TnP0MeO+ihAkpGOpOQDafpfMi9i7wnEUUH
         3OHP5VEf+64cy0LL8hikc/pn1wZ/KR2jge1woKA5a6tL1EGf27T4yOG48LdVyh8xewdi
         4/+ddMjgJKskc5Ivy46J/G5z+QyT2ZWcf3TxK2wuJqimj0xykazxXmlcv65ZFjE1aIJl
         TYa/I2day1zmNig/jiZU9ScLfIp2yEcPl0pav2+YEs06oGpQ0n42my45uw5pfHQBvory
         TtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fDCoSY5K0ITJqQYvscwo5UxJiyuZc3RyIH7jJSLU88U=;
        b=JfoyBrdYFUQxs/E+CmEd0DLRhr8Wgoud1GA7Ip/da21wWLP9m6mmS9SZ/j5TP47Gw1
         MN0KbiwedFnY6sp8xsVLka/kDR0K5QMYqnYzppmqfBFAzLSaJbRlWxase3O4+ICULTTk
         uaZQ9UDFCG8uv/XduRrTPDKQT5+T30ArhXR2uBN+LIVmyRDAgMajXzf8eHC+qCbMiCb3
         yfiOwJWKMscn7ZBqV1VB9ZMwK/iTdVDU0FLLONjYzqg4P1tbKpNCDw8Ua4qRAtAyy0VW
         qy9+hby3zDrJK8RhButA0/+UJfYC101dqzEFSsO3ql9yPefv/XHyKI8/W+g9Gk1ZGIct
         iQrg==
X-Gm-Message-State: APjAAAXjmNPydpBNqtC5ndv4wKKadPB4akYWSd17TwAExgiu/2zmkmoY
        ueyaxRgAtIG7hQ6ZTu1Qrq7HGQ==
X-Google-Smtp-Source: APXvYqzD1aivQBDf69llf3avbBHNfxtRkZ9eXNatyrc78REwbz16rreOTstsv5QqjSoYFjtGpjbuhQ==
X-Received: by 2002:a17:902:4623:: with SMTP id o32mr25633974pld.112.1562602229878;
        Mon, 08 Jul 2019 09:10:29 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j20sm5476488pfr.113.2019.07.08.09.10.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jul 2019 09:10:29 -0700 (PDT)
Date:   Mon, 8 Jul 2019 09:10:26 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/mdp5: Find correct node for creating gem
 address space
Message-ID: <20190708161026.GB27383@builder>
References: <20190708151224.22555-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708151224.22555-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 08 Jul 08:12 PDT 2019, Jeffrey Hugo wrote:

> Creating the msm gem address space requires a reference to the dev where
> the iommu is located.  The driver currently assumes this is the same as
> the platform device, which breaks when the iommu is outside of the
> platform device (ie in the parent).  Default to using the platform device,
> but check to see if that has an iommu reference, and if not, use the parent
> device instead.  This should handle all the various iommu designs for
> mdp5 supported systems.
> 
> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> 
> v2: It turns out there isn't a universal way to get the iommu device, so 
> check to see if its in the current node or parent
> 
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 4a60f5fca6b0..02dc7d426cb0 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -663,6 +663,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>  	struct msm_kms *kms;
>  	struct msm_gem_address_space *aspace;
>  	int irq, i, ret;
> +	struct device *iommu_dev;
>  
>  	/* priv->kms would have been populated by the MDP5 driver */
>  	kms = priv->kms;
> @@ -702,7 +703,11 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>  	mdelay(16);
>  
>  	if (config->platform.iommu) {
> -		aspace = msm_gem_address_space_create(&pdev->dev,
> +		iommu_dev = &pdev->dev;
> +		if (!iommu_dev->iommu_fwspec)
> +			iommu_dev = iommu_dev->parent;
> +
> +		aspace = msm_gem_address_space_create(iommu_dev,
>  				config->platform.iommu, "mdp5");
>  		if (IS_ERR(aspace)) {
>  			ret = PTR_ERR(aspace);
> -- 
> 2.17.1
> 
