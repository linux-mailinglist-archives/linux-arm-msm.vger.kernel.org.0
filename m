Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D04DA32DA04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 20:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236543AbhCDTG7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 14:06:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236755AbhCDTGj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 14:06:39 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA0FC061756
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 11:05:59 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id w18so19624076pfu.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 11:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rbbyP4f7puqulTra1fDP6OcDsptLygIaw3JP1xb77tM=;
        b=fadB5UiTzffTtxrnqdd8PhIkKLTzeY5XXE5bdX4vJi9wo5p/1BA58D1ACxEGMuIXJo
         uRdV+JdUT+4TivRh1Y40BT7tBt05iF3Tz+jLltT8q+VcbuFdOFg+2BbGlOhl2nPI5mQN
         4lwwe1QpLvzBeIwu2bP1lHAPbZMo0UurQ8Q2ArljOCzw8/qTlcmYslAtXIPic2EMbECj
         cdZCaoCA3q4OIWue/ZYMje4G8wQSt2UGacFpsykcWPznbxJR2tF86woEKSo30D3ge1IK
         TvQkapUM9mbMHGPF+Jmp2IgSipfBrZoPAOUpOpk9yVHDrrFEj5JMOGn1W1Dtcak7NGNR
         2P5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rbbyP4f7puqulTra1fDP6OcDsptLygIaw3JP1xb77tM=;
        b=kEqTJeSfn2/HiRmqO29EOMIMB3T0/Uy+u/Vey0sAXdpYMonG9zPN84H9AEjUqCQONa
         G9XncaWc/RKJpwfZvfadmaynlNR23B1C5/BDdd3bA+LivmVvaey1zP5wkqpqlVnW2u3f
         NdintmeuB35EniEFMc3Ah0McyymIl6BIobKGX9ZSLA7oWs+X53kBqXalJWtp6Eq/bcOP
         ovxOkQ/tB+6TMUP9/3wfMAwM2lKWJMuXC6ff4m7SQKi+3T3Le+JV1KzLnEwAbS2O9Fnm
         dciM5dyD20BP+wizE6GFdvPxejtK8qE+alFvA9PluBC4hPs3MEIBCaZp19kf398wOEbZ
         Iygg==
X-Gm-Message-State: AOAM532qLIrZUQfM1B825Vb2oeAMsLCYLIWENVL14OQWvBwcRl26ll2o
        Qmo6I9fEnOJdmsV74/gwqEWN3A==
X-Google-Smtp-Source: ABdhPJzM5524ccpy7qBq9OHI+RD9DcNp/2ZQOTkWThKPhkwH8zqKQJ3k0rww2CocJYdIxOK9EbiFlA==
X-Received: by 2002:a63:4241:: with SMTP id p62mr4758259pga.453.1614884759096;
        Thu, 04 Mar 2021 11:05:59 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 188sm146234pfz.119.2021.03.04.11.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 11:05:55 -0800 (PST)
Date:   Thu, 4 Mar 2021 12:05:53 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 13/16] rpmsg: char: introduce
 __rpmsg_chrdev_create_eptdev function
Message-ID: <20210304190553.GD3854911@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-14-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-14-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 19, 2021 at 12:14:58PM +0100, Arnaud Pouliquen wrote:
> Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
> the rpmsg_eptdev context structure.

Add newlines between paragraphs.

> This patch prepares the introduction of a RPMsg device for the
> char device. the RPMsg device will need a reference to the context.

s/the/The

s/RPMsg/RPMSG - throughout the patchset.

As a general note please be mindful of patch changelogs.  I often find myself
having to decipher the ideas being conveyed.

I am done reviewing this set.  There are things I will want to come back to but
the general goals behind the patchset are being achieved.

Thanks,
Mathieu

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 09ae1304837c..66dcb8845d6c 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -328,8 +328,9 @@ int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_eptdev_destroy);
>  
> -int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> -			       struct rpmsg_channel_info chinfo)
> +static struct rpmsg_eptdev *__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
> +							 struct device *parent,
> +							 struct rpmsg_channel_info chinfo)
>  {
>  	struct rpmsg_eptdev *eptdev;
>  	struct device *dev;
> @@ -337,7 +338,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  
>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>  	if (!eptdev)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	dev = &eptdev->dev;
>  	eptdev->rpdev = rpdev;
> @@ -381,7 +382,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  		put_device(dev);
>  	}
>  
> -	return ret;
> +	return eptdev;
>  
>  free_ept_ida:
>  	ida_simple_remove(&rpmsg_ept_ida, dev->id);
> @@ -391,7 +392,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  	put_device(dev);
>  	kfree(eptdev);
>  
> -	return ret;
> +	return ERR_PTR(ret);
> +}
> +
> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> +			       struct rpmsg_channel_info chinfo)
> +{
> +	struct rpmsg_eptdev *eptdev;
> +
> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, &rpdev->dev, chinfo);
> +	if (IS_ERR(eptdev))
> +		return PTR_ERR(eptdev);
> +
> +	return 0;
>  }
>  EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
>  
> -- 
> 2.17.1
> 
