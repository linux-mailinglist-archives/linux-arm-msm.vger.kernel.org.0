Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC6635A4F4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 19:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234273AbhDIRyK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 13:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234262AbhDIRyJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 13:54:09 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C40EC061763
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 10:53:55 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id f29so4484433pgm.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=t0lA/jFVR3TTCjtnv1uyJJiTbsD33ku905quI/YeL/8=;
        b=ujzqBY4P8EW3BO2TN+Pcc1TuyrOGLeEzdi6LjPKFvGdzOrzLy+E3xdB6qDl7lnihv7
         mtR4mmom/nb94xbAaHAgP4YyETgvmhM99+46KpKkZiu7Mk73tAWdkdVgVaRqYJKW0hQI
         Bqa8PL8+fsaU9pm6TbG3aH7vLnq4jvdzsY87YLCIbLDBO8va6hggYohkPwYFX2cUKf5w
         VPXOBlEuxvHCiVhsPdUgwzjmx6BRnMTva66Bvgr+a6430LOyipUkgDPeMdxZeU1kv9Iz
         bST5+/kITQOvnzSmXiePB5EZlE9qgE6+aJ1EyCp36p4diDPPk6Ikgv+1G/OM1+JHsh4u
         Qpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=t0lA/jFVR3TTCjtnv1uyJJiTbsD33ku905quI/YeL/8=;
        b=kGmtrVawP7kXtZfn31s18X1CiyieTK62PLOWM0g45v72SwFXbzQXYj2jb2sRpTGYH+
         oftHn8Oc8qcRj1DvcN3oyieNPtdlrfEFvqcharc5/3HkHN/2BvezEstLNh/4/3ctym+m
         L+LnNZ35WTznBilAnt9thEsTgb1ArU2c7458ebABpugeSab2/gsDrn1TGeriPwgve4Wv
         n1N+4oOdMFYhcEi9Z33aQv1PNQFP97LaM3kP/ZMAnglvCzizQLPWGpAuI+NUT6EVKLJI
         Dpy7+cCz5+22NmIWS4f4g3cFI6PIdjnZdr7XW54iCmwvQdudTFyQA7nLfKDeze3QzHzv
         K1Sg==
X-Gm-Message-State: AOAM5315R7nJYLdqZbQRG8Yxp1zsoaQGTliPwer1jwqEBQMuiKd2Cglh
        shSgh3OSR4KeLTwZswQsDV8/OGrZAzfiGA==
X-Google-Smtp-Source: ABdhPJzxMzOT86u7n+dmZg6aYJAHdUkT8NqqK1u+CwJMn8VdnNGQaux3HBYp8DZNloQZe9Q//Gftyw==
X-Received: by 2002:a05:6a00:883:b029:247:562:f8f9 with SMTP id q3-20020a056a000883b02902470562f8f9mr3739481pfj.34.1617990834443;
        Fri, 09 Apr 2021 10:53:54 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n73sm3049665pfd.196.2021.04.09.10.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 10:53:53 -0700 (PDT)
Date:   Fri, 9 Apr 2021 11:53:52 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/7] rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev
 function
Message-ID: <20210409175352.GB489094@xps15>
References: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
 <20210323122737.23035-5-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323122737.23035-5-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 23, 2021 at 01:27:34PM +0100, Arnaud Pouliquen wrote:
> Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
> the rpmsg_eptdev context structure.
> 
> This patch prepares the introduction of a rpmsg channel device for the
> char device. The rpmsg device will need a reference to the context.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> ---
> update from [1]
> - propagate parent param in rpmsg_chrdev_create_eptdev,
> - fix changelog.
> 
> [1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20210219111501.14261-14-arnaud.pouliquen@foss.st.com/
> ---
>  drivers/rpmsg/rpmsg_char.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index 5d4a768002ce..7f6d46078179 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -325,7 +325,8 @@ static void rpmsg_eptdev_release_device(struct device *dev)
>  	kfree(eptdev);
>  }
>  
> -int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> +static struct rpmsg_eptdev *__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
> +							 struct device *parent,
>  			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class)

Please fix:

static struct rpmsg_eptdev *
__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
                             struct rpmsg_channel_info chinfo, struct class *rpmsg_class)

>  {
>  	struct rpmsg_eptdev *eptdev;
> @@ -334,7 +335,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  
>  	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
>  	if (!eptdev)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>  
>  	dev = &eptdev->dev;
>  	eptdev->rpdev = rpdev;
> @@ -378,7 +379,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  		put_device(dev);
>  	}
>  
> -	return ret;
> +	return eptdev;
>  
>  free_ept_ida:
>  	ida_simple_remove(&rpmsg_ept_ida, dev->id);
> @@ -388,7 +389,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
>  	put_device(dev);
>  	kfree(eptdev);
>  
> -	return ret;
> +	return ERR_PTR(ret);
> +}
> +
> +int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
> +			       struct rpmsg_channel_info chinfo,  struct class *rpmsg_class)
> +{
> +	struct rpmsg_eptdev *eptdev;
> +
> +	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, parent, chinfo, rpmsg_class);
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
