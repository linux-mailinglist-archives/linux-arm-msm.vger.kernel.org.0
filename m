Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6F42EA180
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 01:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbhAEAfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 19:35:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726711AbhAEAfc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 19:35:32 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C754AC061794
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 16:34:47 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id w124so34249639oia.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 16:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Lm30zzN+zfEmo5YiP+02azRM0I3XkGy30yP4G479Huk=;
        b=GKQp7BdGhz/wRnmAIBNjOXOdJxMjLqhnaxGixIqw9zlvjKeU2yKKqcrEe4hyhayfwO
         Wlyzbvfecq8qXp0qejXO6mfs4gamhlP8rQeJ3dunVe4l4rsB/9lnCMRYeNABlqZ785CZ
         oa5MkWLOB3rQe0gW/q4PWdCTzxKzUj5akzmBjFmGk9TQumj4BRIql0b/DmHSLqnQ15R+
         4KAN+47ztZcqnJ4d6ynQgPpcTHHqMk01n4VTRrp4QwZeTzIWDYczXEXekguAB5Vsh8tw
         ZohuMpc2SX8S+vCybNV2GV8dsr5GkajHjVkMCt/LD++DlzawwfyV/NVAPj/eYDfIqwh6
         cajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Lm30zzN+zfEmo5YiP+02azRM0I3XkGy30yP4G479Huk=;
        b=c1JyyX23QsO6xqsqXkNZW+ELY87p9nF3O9bVjmmL6VGu+EVEcEAGhJulkUvMuPUic0
         7bufkmG2q/9/+Rp2+h08mzF+Uu5pgVDRWfYU1FdX1SV2+KLdAC7m7B12SPuPsfqDK+K+
         GMv7UyGR/+JnSLlFkoGKCHKso259OsfwIX+Ogu0akSQgByZkkcOZ1JmsKe6me0JW42xN
         TCMiHIWH+TaVABAUNqPq7FFqTUiPN0KXoFlj3j1xzxuivluVWRQXAtUV1Zkh28H9Kqi4
         mLlm3jMjc8zOiLgOl2mGymlSDLAj1LxAykdmCLcPRl+JntV3eOb7ud4nzq5s9pUWlPlT
         Xh8g==
X-Gm-Message-State: AOAM531JIGgP4DqXwNPrD4ymp3uqnAHpxidjSjN+2n/qvSAQieXyTlpp
        xPjraxbH685q9F5yxrG/MpI6WQ==
X-Google-Smtp-Source: ABdhPJz+uDjVqovane6GkP75e+U3hvOcgymZKFw7gDNlFLGEmPaIh6TQ6roWabMgsJ5zYZaMzPPN+Q==
X-Received: by 2002:aca:f382:: with SMTP id r124mr1013783oih.175.1609806887146;
        Mon, 04 Jan 2021 16:34:47 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p4sm13917745oib.24.2021.01.04.16.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 16:34:46 -0800 (PST)
Date:   Mon, 4 Jan 2021 18:34:44 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 02/16] rpmsg: add RPMsg control API to register service
Message-ID: <X/O0JC9z2s9MNRWa@builder.lan>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
 <20201222105726.16906-3-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222105726.16906-3-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 22 Dec 04:57 CST 2020, Arnaud Pouliquen wrote:

> Add API to register a RPMsg service to the control device.
> The rpmsg_drv_ctrl_info structure links a service to its driver.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_ctrl.c | 57 ++++++++++++++++++++++++++++++++++++++
>  include/linux/rpmsg.h      | 31 +++++++++++++++++++++
>  include/uapi/linux/rpmsg.h | 14 ++++++++++
>  3 files changed, 102 insertions(+)
> 
> diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
> index 425c3e32ada4..065e2e304019 100644
> --- a/drivers/rpmsg/rpmsg_ctrl.c
> +++ b/drivers/rpmsg/rpmsg_ctrl.c
> @@ -27,6 +27,20 @@ struct rpmsg_ctrl_dev {
>  	struct device dev;
>  };
>  
> +/**
> + * struct rpmsg_ctl_info - control info list node
> + * @ctrl:	control driver info
> + * @node:	list node
> + *
> + * This structure is used by rpmsg_ctl to list the registered drivers services
> + */
> +struct rpmsg_ctl_info {
> +	const struct rpmsg_drv_ctrl_info *ctrl;
> +	struct list_head node;
> +};
> +
> +static LIST_HEAD(rpmsg_drv_list);
> +
>  static DEFINE_IDA(rpmsg_ctrl_ida);
>  static DEFINE_IDA(rpmsg_minor_ida);
>  
> @@ -175,6 +189,49 @@ static struct rpmsg_driver rpmsg_ctrl_driver = {
>  	.remove = rpmsg_ctrl_remove,
>  };
>  
> +/**
> + * rpmsg_ctrl_register_ctl() -register control for the associated service
> + * @ctrl: rpmsg driver information
> + *
> + * This function is called by the rpmsg driver to register a service that will
> + * be exposed to be instantiate by the application.
> + */
> +int  rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
> +{
> +	struct rpmsg_ctl_info *drv_info;
> +
> +	drv_info =  kzalloc(sizeof(*drv_info), GFP_KERNEL);
> +	if (!drv_info)
> +		return -ENOMEM;
> +
> +	drv_info->ctrl = ctrl;
> +
> +	list_add_tail(&drv_info->node, &rpmsg_drv_list);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(rpmsg_ctrl_register_ctl);
> +
> +/**
> + * rpmsg_ctrl_unregister_ctl() -unregister control for the associated service
> + * @ctrl: the rpmsg control information
> + *
> + * This function is called by the rpmsg driver to unregister the associated
> + * service.
> + */
> +void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
> +{
> +	struct rpmsg_ctl_info *drv_info, *tmp;
> +
> +	list_for_each_entry_safe(drv_info, tmp, &rpmsg_drv_list, node) {
> +		if (drv_info->ctrl == ctrl) {
> +			list_del(&drv_info->node);
> +			kfree(drv_info);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(rpmsg_ctrl_unregister_ctl);
> +
>  static int rpmsg_ctrl_init(void)
>  {
>  	int ret;
> diff --git a/include/linux/rpmsg.h b/include/linux/rpmsg.h
> index a5db828b2420..5d64704c2346 100644
> --- a/include/linux/rpmsg.h
> +++ b/include/linux/rpmsg.h
> @@ -26,6 +26,19 @@ struct rpmsg_endpoint;
>  struct rpmsg_device_ops;
>  struct rpmsg_endpoint_ops;
>  
> +/**
> + * struct rpmsg_drv_ctrl_info - rpmsg ctrl structure
> + * @drv_name:	name of the associated driver
> + * @service:	the associated rpmsg service listed in @rpmsg_services
> + *
> + * This structure is used by rpmsg_ctl to link the endpoint creation to the
> + * service rpmsg driver.
> + */
> +struct rpmsg_drv_ctrl_info {
> +	const char *drv_name;
> +	u32  service;
> +};
> +
>  /**
>   * struct rpmsg_channel_info - channel info representation
>   * @name: name of service
> @@ -315,4 +328,22 @@ static inline __poll_t rpmsg_poll(struct rpmsg_endpoint *ept,
>  	module_driver(__rpmsg_driver, register_rpmsg_driver, \
>  			unregister_rpmsg_driver)
>  
> +#if IS_ENABLED(CONFIG_RPMSG_CTRL)
> +
> +int  rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl);
> +void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl);
> +
> +#else
> +
> +static inline int rpmsg_ctrl_register_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
> +{
> +	return 0;
> +}
> +
> +static inline void rpmsg_ctrl_unregister_ctl(const struct rpmsg_drv_ctrl_info *ctrl)
> +{
> +}
> +
> +#endif /* IS_ENABLED(CONFIG_RPMSG_CTRL) */
> +
>  #endif /* _LINUX_RPMSG_H */
> diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
> index e14c6dab4223..0b0cb028e0b3 100644
> --- a/include/uapi/linux/rpmsg.h
> +++ b/include/uapi/linux/rpmsg.h
> @@ -9,6 +9,20 @@
>  #include <linux/ioctl.h>
>  #include <linux/types.h>
>  
> +/**
> + * enum rpmsg_services - list of supported RPMsg services
> + *
> + * @RPMSG_RAW_SERVICE: char device RPMSG service
> + * @RPMSG_START_PRIVATE_SERVICES: private services have to be declared after.
> + */
> +enum rpmsg_services {
> +	/* Reserved services */
> +	RPMSG_RAW_SERVICE =  0,
> +

What kind of things do you envision this list to contain in a year from
now?

Regards,
Bjorn

> +	/* Private services */
> +	RPMSG_START_PRIVATE_SERVICES =  1024,
> +};
> +
>  /**
>   * struct rpmsg_endpoint_info - endpoint info representation
>   * @name: name of service
> -- 
> 2.17.1
> 
