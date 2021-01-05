Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75592EA2D1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 02:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728121AbhAEBLc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 20:11:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727647AbhAEBLb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 20:11:31 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E908C061793
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 17:10:51 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id j20so27886483otq.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 17:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=//v3nEDqI/fknyujCjSI+soM4pOu12qYcTNNDEQN8zY=;
        b=giw0pLGn4GccxW37Cg4PpxpFl1jHyDWYdmiQROH6AXIy3ArQLQonIh8fUh/BaG1L+7
         em/SOGu4t6qM5bTAlX9nbOTcfL7KXVYpYjYoqQeCPfS7/XaG1vwbs7pMVPOXl7fqOy2s
         kJkCQHgkzKVVhchki19tVzakoebGrxbpSbxvTNO3tDf9sKmbSM/AMHjuHUTBmOSkfRN0
         CwHpYqkrrfplwhMYfRKiTyYHNKr0gDZSOEgyZ3dQ/FigA2NjoxRsyeLEkkg9px1uy8O7
         a3cHNbfzGLxvw8D6zU8V0iVzW4VEgFkUnwz0E04IVONIKXJNhBAn0AXPgna1f1v65BuN
         A86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=//v3nEDqI/fknyujCjSI+soM4pOu12qYcTNNDEQN8zY=;
        b=rJzz4MLXxwp/oZvu4IzT/xVqSqRhYdLEVLmO+IluS2B/zQn59LkZjVJdRhjOYDnKiH
         gowlU7TnarUo5Oh7N+9upP6PJEN68bwC4FlSFjKiLNBvhDQELHRD2Z/qn1nyld2vvPeT
         0hHcwZcor5xndwgZULvazgNz6qlkEgtt1EOlELkloD8DLu4NoAUdwAAqkwBx79XfGmSX
         ij9So4OyLFQfCfJiPeEiid9rQbGxCu24RztIBDAg48CnHB96xwtkyrunZ67C2zMSULWk
         PBR+V8hU+Yth+wuX+nC+zL1VNE29D4Vts+G8GxrB7VlUJuMHxAhxRLMRUsBh/yDhFCVZ
         U4Lw==
X-Gm-Message-State: AOAM531+WvcHnioOedBwCna4L1Z0z515XosdPgbfb4v6Y4RDvFtDs+LN
        tfwDQCnUmC/6V8aQw6hvyVlY3Q==
X-Google-Smtp-Source: ABdhPJwUlzQRCUsYORUXzlU0YpSidv080/49H75fNG7tPQx5Bs/Vvx9zxWGzeUaO8nF3FbvuBIgI+Q==
X-Received: by 2002:a05:6830:1de8:: with SMTP id b8mr52892246otj.204.1609809050780;
        Mon, 04 Jan 2021 17:10:50 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n22sm13760778oig.32.2021.01.04.17.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 17:10:50 -0800 (PST)
Date:   Mon, 4 Jan 2021 19:10:48 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 16/16] rpmsg: replace rpmsg_chrdev_register_device use
Message-ID: <X/O8mOaSHUIJYEDw@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-17-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-17-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:

> Replace rpmsg_chrdev_register_device by the new helper
> rpmsg_ctl_register_device to probe the new IOCTL interface.
> 

This again implies that rpmsg_char was broken in SMD and GLINK during a
large part of this series. Your strategy also has the side effect of
having changed the name from /dev/rpmsg_ctrlX to /dev/rpmsg_ctlX,
breaking my userspace.

Regards,
Bjorn

> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c |  2 +-
>  drivers/rpmsg/qcom_smd.c          |  2 +-
>  drivers/rpmsg/rpmsg_internal.h    | 14 --------------
>  3 files changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index d74c338de077..6c7bb84f7da9 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -1681,7 +1681,7 @@ static int qcom_glink_create_chrdev(struct qcom_glink *glink)
>  	rpdev->dev.parent = glink->dev;
>  	rpdev->dev.release = qcom_glink_device_release;
>  
> -	return rpmsg_chrdev_register_device(rpdev);
> +	return rpmsg_ctl_register_device(rpdev);
>  }
>  
>  struct qcom_glink *qcom_glink_native_probe(struct device *dev,
> diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
> index 40853702f54f..a39457c57705 100644
> --- a/drivers/rpmsg/qcom_smd.c
> +++ b/drivers/rpmsg/qcom_smd.c
> @@ -1138,7 +1138,7 @@ static int qcom_smd_create_chrdev(struct qcom_smd_edge *edge)
>  	qsdev->rpdev.dev.parent = &edge->dev;
>  	qsdev->rpdev.dev.release = qcom_smd_release_device;
>  
> -	return rpmsg_chrdev_register_device(&qsdev->rpdev);
> +	return rpmsg_ctl_register_device(&qsdev->rpdev);
>  }
>  
>  /*
> diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
> index a76c344253bf..c81dfb374b64 100644
> --- a/drivers/rpmsg/rpmsg_internal.h
> +++ b/drivers/rpmsg/rpmsg_internal.h
> @@ -81,19 +81,5 @@ struct rpmsg_device *rpmsg_create_channel(struct rpmsg_device *rpdev,
>  					  struct rpmsg_channel_info *chinfo);
>  int rpmsg_release_channel(struct rpmsg_device *rpdev,
>  			  struct rpmsg_channel_info *chinfo);
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
> -
> -	return rpmsg_register_device(rpdev);
> -}
>  
>  #endif
> -- 
> 2.17.1
> 
