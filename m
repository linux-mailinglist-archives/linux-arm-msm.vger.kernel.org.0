Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074F832D9C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 19:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235491AbhCDS4U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 13:56:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235440AbhCDS4H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 13:56:07 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFC96C061765
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 10:55:26 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id a188so2178246pfb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 10:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X7AZqrsRrcth+0vhIoZwJc17+iOSIdFnS/9ezQsHyQQ=;
        b=xSTFsW+hrccBHxvVPtlkcY8CGpQI2Nq2GgtdkOJdhbhCXFFqCWd8vx/b6SteK+K3sx
         O7CpZtlT2qht9yecYV3E1H+KjKow7dwfq5RgjuBtTWPpfSX7vsQH5QW3qJdEzbt7B1+P
         KwJx7UgNgcKunhOVZ/7ZbrxXjSlXrfiVKuZUCJ3m3l3F/Yqhi/Qt/FgRxDzAz5Gv96C7
         O8SRmEUPbIA4WXIvdZSqk9GPZywHWI9acmID8dKrMIIA9363DOP0/BRQXWSwTLM/p+KL
         +3s08yEl/5vuEBH97+Owc2XBgbVs2r1yggCYLaaF0MuoTddjrfNNTXW8GaAWQYtg4lNS
         3VYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X7AZqrsRrcth+0vhIoZwJc17+iOSIdFnS/9ezQsHyQQ=;
        b=VEfqKrLiwjMNu7/RTAEd9R2C4WIyytcYJYB7o4D/PqYNCYMWTgA7ySmONJXcdu5Xv3
         iaopTfrKMWPS1GTjr6T9Kg9rdm7gvw36Y+rSptDPHrK6pGTIMf9659WLdw3A8p05tUtW
         IpjvUb8QoTMurYsZCdYQVge/Qt/Km8pVIHK6cNIldNgojjE3aqHU1PyaAODShboTMYOE
         AczDxKmydkP/wV2hOdNKKy9y37/E8sQZgXicRUySu235vHEJvmyp/MV5t+jMtrmYBLKM
         DFgDv+KaAHQfqsdMupoybqx5CSFRV06iVYXj9J1j3Lwv4ggHe+mIBv1+GBBK3Nm77sNI
         Q2Fg==
X-Gm-Message-State: AOAM532n7qxKREKo1i7p3YXToeswGE9m5fTvN4H0z4I63WMgHogjDRH9
        w3x3Viwx8CG0g9fjr4DMRSPGsGvDq5iG1w==
X-Google-Smtp-Source: ABdhPJzszkC/1+6RyebxySsHQ7RkcPuJ6V9QsqjSOJNVdr6UKz2Z+8c3UoA2uw2WhPBEvSd3uoTFnQ==
X-Received: by 2002:a05:6a00:138f:b029:1b8:b9d5:3a2c with SMTP id t15-20020a056a00138fb02901b8b9d53a2cmr5230356pfg.10.1614884126417;
        Thu, 04 Mar 2021 10:55:26 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id o1sm165048pgq.1.2021.03.04.10.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 10:55:22 -0800 (PST)
Date:   Thu, 4 Mar 2021 11:55:20 -0700
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
Message-ID: <20210304185520.GC3854911@xps15>
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
> This patch prepares the introduction of a RPMsg device for the
> char device. the RPMsg device will need a reference to the context.
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

Shouldn't the second argument to __rpmsg_chrdev_create_eptdev() be @parent?

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
