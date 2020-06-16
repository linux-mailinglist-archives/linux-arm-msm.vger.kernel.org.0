Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0E581FBC73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 19:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728861AbgFPRKP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 13:10:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729965AbgFPRKO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 13:10:14 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98CCC061755
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 10:10:14 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d8so8657130plo.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2020 10:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7lURMaUe5jYtdKF0zOSuNKzOTK40y+fdChsIGC4i+C8=;
        b=KLfrT4xlbC42G1UvczEXZXkAdwiOIRXjPtQ9jnYbnZOB6WnVRtkxJX9zyYP8OOSgya
         yJ+wsxPA/XBz5RaoReBWYfgzA8tyhOBHxb/c+wfp0QbxIS8WF60iOsoVdRGWG2+yn+sG
         rD8SQSOZY9HUWtRFKWPiRF4hYOdyMwFFMJR8RcLpTspe5FnnNVWqb1ih1iQJbkPp9XyD
         3VamWAAVJLFnZBp0cdu2t5kZcGly0SMvJSKgxMaA46NpyqqbyMgLrAU104dntPhHqXzc
         m+zhLkBLOJdP1VdUOcMC9Myr3p6nQh6oyiSgCVm7G07dWIrNs4DLtvJABTsplHs3CBF8
         XLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7lURMaUe5jYtdKF0zOSuNKzOTK40y+fdChsIGC4i+C8=;
        b=SpQLRklPBGUv7NmyHwDAtB6CShwOuFvxbeHLhdXhOIe0bj+nd49jeXsptFRQhU+dyl
         Y4e1eAVoVb2csAeOfre22DccO1JoOX5n+4c6zjU0Hsa8oTrpI3iZ2OAWCIX3BrDs56KV
         UzWq/DrEonij5yUTkDLCe9hfZdsP0CyEqAECWfFxjQ0uMSc6QVoU0qi9Tm+kf0pNzw1x
         mVcS5EDpNzIOEwIZkaPDZPABJv8qWM3UoETuti949Qb5avIRoHO346NuxwVVKb2Yc2be
         omVUULbuT1Qyc2EIlNLzHOhxJUe7FSUxaBXYHVC54bjoZSqpdiSBUUWkQg67uLPmkxHv
         cDuQ==
X-Gm-Message-State: AOAM533AGiRid+X2EopqxsS/5xdF3LxxlUV60BdqdzyCWWBX4uWnsRin
        hsOzA/trGjebowWPNHWyREKGFQ==
X-Google-Smtp-Source: ABdhPJz3u3jH3TpaZSgNIjBZMdMgl3+Txnzm4SvNAA3KD2MTPvR2l1vbyCP+2GtRdaoILj9UWY1Gxg==
X-Received: by 2002:a17:902:b493:: with SMTP id y19mr2845887plr.186.1592327414149;
        Tue, 16 Jun 2020 10:10:14 -0700 (PDT)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m7sm18131736pfb.1.2020.06.16.10.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 10:10:13 -0700 (PDT)
Date:   Tue, 16 Jun 2020 11:10:11 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Clement Leger <cleger@kalray.eu>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rpmsg: fix driver_override memory leak
Message-ID: <20200616171011.GA461427@xps15>
References: <20200611185012.23815-1-cleger@kalray.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200611185012.23815-1-cleger@kalray.eu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Clément,

On Thu, Jun 11, 2020 at 08:50:12PM +0200, Clement Leger wrote:
> rpmsg_core allows to override driver using driver_override sysfs
> attribute. When used, the sysfs store function will duplicate the user
> provided string using kstrndup. However, when the rpdev is released,
> the driver_override attribute is not freed. In order to have a
> consistent allocation and release, use kstrdup in
> rpmsg_chrdev_register_device and move it in rpmsg_core.c to avoid
> header dependencies. Moreover, add a rpmsg_release_device function to
> be called in device release. Drivers using rpmsg have been modified to
> use this function and ensure there will be no more memory leak when
> releasing rpmsg devices.
> This was found with kmemleak while using remoteproc and virtio.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>
> ---
>  drivers/rpmsg/qcom_glink_native.c |  1 +
>  drivers/rpmsg/qcom_smd.c          |  1 +
>  drivers/rpmsg/rpmsg_core.c        | 22 ++++++++++++++++++++++
>  drivers/rpmsg/rpmsg_internal.h    | 15 ++-------------
>  drivers/rpmsg/virtio_rpmsg_bus.c  |  1 +
>  5 files changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 1995f5b3ea67..076997afc638 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1373,6 +1373,7 @@ static void qcom_glink_rpdev_release(struct device *dev)
>  	struct glink_channel *channel = to_glink_channel(rpdev->ept);
>  
>  	channel->rpdev = NULL;
> +	rpmsg_release_device(rpdev);
>  	kfree(rpdev);
>  }
>  
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 4abbeea782fa..f01174d0d4d9 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1047,6 +1047,7 @@ static void qcom_smd_release_device(struct device *dev)
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>  	struct qcom_smd_device *qsdev = to_smd_device(rpdev);
>  
> +	rpmsg_release_device(rpdev);
>  	kfree(qsdev);
>  }
>  
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index a6361cad608b..31de89c81b27 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -554,6 +554,28 @@ int rpmsg_unregister_device(struct device *parent,
>  }
>  EXPORT_SYMBOL(rpmsg_unregister_device);
>  
> +void rpmsg_release_device(struct rpmsg_device *rpdev)
> +{
> +	kfree(rpdev->driver_override);
> +}
> +EXPORT_SYMBOL(rpmsg_release_device);
> +
> +/**
> + * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
> + * @rpdev:	prepared rpdev to be used for creating endpoints
> + *
> + * This function wraps rpmsg_register_device() preparing the rpdev for use as
> + * basis for the rpmsg chrdev.
> + */
> +int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
> +{
> +	strcpy(rpdev->id.name, "rpmsg_chrdev");
> +	rpdev->driver_override = kstrdup("rpmsg_chrdev", GFP_KERNEL);

Have you considered using devm_kstrdup() instead?  Since the same rpdev is
available here and in field##_store(), proceeding that way would prevent the
need to add a new rpmsg_release_device() function.  Depending on header
dependencies rpmsg_chrdev_register_device() may also be able to remain in
rpmsg_internal.h.

Thanks,
Mathieu 

> +
> +	return rpmsg_register_device(rpdev);
> +}
> +EXPORT_SYMBOL(rpmsg_chrdev_register_device);
> +
>  /**
>   * __register_rpmsg_driver() - register an rpmsg driver with the rpmsg bus
>   * @rpdrv: pointer to a struct rpmsg_driver
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index 3fc83cd50e98..043b28f912fd 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -75,19 +75,8 @@ int rpmsg_unregister_device(struct device *parent,
>  struct device *rpmsg_find_device(struct device *parent,
>  				 struct rpmsg_channel_info *chinfo);
>  
> -/**
> - * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
> - * @rpdev:	prepared rpdev to be used for creating endpoints
> - *
> - * This function wraps rpmsg_register_device() preparing the rpdev for use as
> - * basis for the rpmsg chrdev.
> - */
> -static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
> -{
> -	strcpy(rpdev->id.name, "rpmsg_chrdev");
> -	rpdev->driver_override = "rpmsg_chrdev";
> +int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev);
>  
> -	return rpmsg_register_device(rpdev);
> -}
> +void rpmsg_release_device(struct rpmsg_device *rpdev);
>  
>  #endif
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 07d4f3374098..af4ea6170f89 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -381,6 +381,7 @@ static void virtio_rpmsg_release_device(struct device *dev)
>  	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
>  	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
>  
> +	rpmsg_release_device(rpdev);
>  	kfree(vch);
>  }
>  
> -- 
> 2.17.1
> 
