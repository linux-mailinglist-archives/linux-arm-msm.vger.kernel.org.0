Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B90932C230
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 01:04:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389720AbhCCVqe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Mar 2021 16:46:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241179AbhCCRDn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Mar 2021 12:03:43 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C886C0613DD
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Mar 2021 09:01:34 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id t26so16846198pgv.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Mar 2021 09:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NS5lTDaGXttSrOQ5MHO4aoL/JPMPWoX9kViqNvHNTVw=;
        b=VsTPW062qCBbmWlJ6C89JwMPfX2rDXIXP6PJpEDWU5cAcLYJV//2F9SQV7xbWGyQ6t
         N/Rrr+z55FyTSfysrWPPFGBI9GzuwfbuCLjvmLihq1RUVnJaIoexXJkZqixLZeCccfIt
         qgu8mRlb9Glv1h6/OEu5+c6Xh/SwIKfMpq2/E0JcnV1pqjbdfki1j1vR/5H3xQ2moPQI
         v0WAlKnK9Y3T6+iwkwiLboG/ZK2GiXhnegwLcW4zGDaCuqubIh953KIf0nquF0PWc+0T
         br0mTrp+RzZOS3Gp9zTRIYGKyfqgWoc9vCbsN2yl3IhVr3pdWDrUGArTIAcV8rFiyJD8
         yGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NS5lTDaGXttSrOQ5MHO4aoL/JPMPWoX9kViqNvHNTVw=;
        b=moPU+GFre8vTUWjuI0w53oBfy0ToKsQ7s3yBjeKbUWa7cGfOsDGCZsbPE2pi4QMrLw
         0ddEPMRS8bb98KuBU7qtyV30iGyBC2Gsx5oPPVQbgc0JFfCDiK3MXuzzmOI78NwCbMnQ
         caakI739d665FOXp+ZdbHkgGZ3M4lCtOw/convXVgu5f5NIY1CYN1alhSLRYgxuXKaBS
         vY0W1Rgw2ngWlr4mdD9UAIsDKNUK4RfhP+mBg/16oJJhW5T29jG5Pj4V+JaGrxrnR0vG
         YJUJr8TbEq0r8lrcTBIGeyPYYX+J94OnM0AD0CclJoIHFAKfqmXtuIwTMIfATr045bxw
         DewA==
X-Gm-Message-State: AOAM533b1kumqaxK7LuVY9X00zG3zees0Y++5yPDxPOOMTzCyifxFzzg
        lw6GbRV9ge7bK/vMQ8mRDWeBhQ==
X-Google-Smtp-Source: ABdhPJwnSJtlw+7CYzN3TJ1B9S6jcmKYC9LYLbDS05Ed7kcO8bdthFTmHZaaIeoVlr9rJGVEnmxWAQ==
X-Received: by 2002:a63:4a44:: with SMTP id j4mr23741977pgl.199.1614790893689;
        Wed, 03 Mar 2021 09:01:33 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 132sm3438070pfu.158.2021.03.03.09.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 09:01:31 -0800 (PST)
Date:   Wed, 3 Mar 2021 10:01:30 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 07/16] rpmsg: update rpmsg_chrdev_register_device
 function
Message-ID: <20210303170130.GC3817330@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-8-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-8-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 19, 2021 at 12:14:52PM +0100, Arnaud Pouliquen wrote:
> As driver is now the rpmsg_ioctl, rename the function.
> In addition, initialize the rpdev addresses to RPMSG_ADDR_ANY as not
> defined.

This patch works but the changelog needs a rework.  The title reflects the
essence of changes but the text of the changelog doesn't.

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c |  2 +-
>  drivers/rpmsg/qcom_smd.c          |  2 +-
>  drivers/rpmsg/rpmsg_ctrl.c        |  2 +-
>  drivers/rpmsg/rpmsg_internal.h    | 10 ++++++----
>  4 files changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 27a05167c18c..d4e4dd482614 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1625,7 +1625,7 @@ static int qcom_glink_create_chrdev(struct qcom_glink *glink)
>  	rpdev->dev.parent = glink->dev;
>  	rpdev->dev.release = qcom_glink_device_release;
>  
> -	return rpmsg_chrdev_register_device(rpdev);
> +	return rpmsg_ctrl_register_device(rpdev);
>  }
>  
>  struct qcom_glink *qcom_glink_native_probe(struct device *dev,
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 19903de6268d..40a1c415c775 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1097,7 +1097,7 @@ static int qcom_smd_create_chrdev(struct qcom_smd_edge *edge)
>  	qsdev->rpdev.dev.parent = &edge->dev;
>  	qsdev->rpdev.dev.release = qcom_smd_release_device;
>  
> -	return rpmsg_chrdev_register_device(&qsdev->rpdev);
> +	return rpmsg_ctrl_register_device(&qsdev->rpdev);
>  }
>  
>  /*
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index fa05b67d24da..2e43b4096aa8 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -180,7 +180,7 @@ static struct rpmsg_driver rpmsg_ctrl_driver = {
>  	.probe = rpmsg_ctrl_probe,
>  	.remove = rpmsg_ctrl_remove,
>  	.drv = {
> -		.name = "rpmsg_chrdev",
> +		.name = KBUILD_MODNAME,
>  	},
>  };
>  
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344253bf..7428f4465d17 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -82,16 +82,18 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
>  int rpmsg_release_channel(struct rpmsg_device *rpdev,
>  			  struct rpmsg_channel_info *chinfo);
>  /**
> - * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
> + * rpmsg_ctrl_register_device() - register a char device for control based on rpdev
>   * @rpdev:	prepared rpdev to be used for creating endpoints
>   *
>   * This function wraps rpmsg_register_device() preparing the rpdev for use as
>   * basis for the rpmsg chrdev.
>   */
> -static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
> +static inline int rpmsg_ctrl_register_device(struct rpmsg_device *rpdev)
>  {
> -	strcpy(rpdev->id.name, "rpmsg_chrdev");
> -	rpdev->driver_override = "rpmsg_chrdev";
> +	strcpy(rpdev->id.name, "rpmsg_ctrl");
> +	rpdev->driver_override = "rpmsg_ctrl";
> +	rpdev->src = RPMSG_ADDR_ANY;
> +	rpdev->dst = RPMSG_ADDR_ANY;
>  
>  	return rpmsg_register_device(rpdev);
>  }
> -- 
> 2.17.1
> 
