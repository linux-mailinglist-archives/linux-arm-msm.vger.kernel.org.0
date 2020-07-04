Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E972146C9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2020 17:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbgGDPI2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Jul 2020 11:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgGDPI1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Jul 2020 11:08:27 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE08C061794
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2020 08:08:27 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b16so15107737pfi.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2020 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1wb73vYv/CqphlWd96x1H+DWcYa52t0ykdauU1Ecrr0=;
        b=W0EBfx8Pf5lO9/EW1AxErbvpgFNAoHuht9cBcRaFY75qO5qtPAmN3H24wz6X2l270h
         1YIh96uz9fR1lmFiMcCkxMo3BPIZ7es01PnvfWIYxB3ekvoRuEFPA0ah4xvNwZB8i0ff
         cVjMkJzY8mfpAkexCVMmQlYorYV7eshdyWdWANOvw658wjwe0wtlwOytbJY/zxJP8X6t
         58m+l51fPEhxRaSnt5RQ+tojLHTnKE15XkJmKk0Q3DkRtdUs9i+U81OLLaPy8EfTlbff
         6cmNcIZxaGhGEtpXck61oOv1ktqmgWuy1eGw70Zhp6YX1l2FIKcqta6dBtHvi3GIsjOr
         cX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1wb73vYv/CqphlWd96x1H+DWcYa52t0ykdauU1Ecrr0=;
        b=n865gt7KBbldRcCnCzMnDbV/K/eUrK8W2pEZUnfjTS5fRLivVQEJWFK2rDA37Tb2rz
         vumCLAIKbutJCCmh3BvAoHGY/0TqXAjCbuNdQ6qZl/jMIo5KMUY6HvCA2wof67v/9N21
         L/g2xGbVoeXtbCH9IACpybs7VJ5xI88Ey3ON8sMBd5TZiBrzCTmvcqzcl1RmKKxRm9Wb
         TQdZCCGzHkofgbgsNdfLy49NyUs+pgAJbm6uwJlzJZrPHunyPGDg0WWGDtNF6Ic8+8XM
         iX3krPn0wx8DxTI4TTzX3YjfUurq8cTM8ItOWJ7AfYqcZ/oHWepB6RaThvoOJN2sTtWT
         SwRQ==
X-Gm-Message-State: AOAM530wWObLachSRC0xpVtuaeHiy7/AOA5eKBpxbwmWLwlama/DjSDa
        6X9Ece7iHZdaz3hgonnE+FJL
X-Google-Smtp-Source: ABdhPJwZVxRXEJvGRJ15RlNDFVLXEgu6S6r9GrChiBuiSnATzIxb/C3p+JnlyHroyIF52wWoXRZo2w==
X-Received: by 2002:a63:b74f:: with SMTP id w15mr34637057pgt.314.1593875306877;
        Sat, 04 Jul 2020 08:08:26 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:680:29c6:d74:dc5c:e13f:c458])
        by smtp.gmail.com with ESMTPSA id x7sm14946484pfq.197.2020.07.04.08.08.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:08:26 -0700 (PDT)
Date:   Sat, 4 Jul 2020 20:38:19 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/9] bus: mhi: core: Use generic name field for an MHI
 device
Message-ID: <20200704150819.GE3066@Mani-XPS-13-9360>
References: <1593448782-8385-1-git-send-email-bbhatt@codeaurora.org>
 <1593448782-8385-6-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593448782-8385-6-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 29, 2020 at 09:39:38AM -0700, Bhaumik Bhatt wrote:
> An MHI device is not necessarily associated with only channels as we can
> have one associated with the controller itself. Hence, the chan_name
> field within the mhi_device structure should instead be replaced with a
> generic name to accurately reflect any type of MHI device.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 5 +++--
>  drivers/bus/mhi/core/main.c | 6 +++---
>  include/linux/mhi.h         | 8 ++++----
>  3 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index e43a190..e2011ec 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -904,6 +904,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	mhi_dev->dev_type = MHI_DEVICE_CONTROLLER;
>  	mhi_dev->mhi_cntrl = mhi_cntrl;
>  	dev_set_name(&mhi_dev->dev, "%s", dev_name(mhi_cntrl->cntrl_dev));
> +	mhi_dev->name = dev_name(mhi_cntrl->cntrl_dev);
>  
>  	/* Init wakeup source */
>  	device_init_wakeup(&mhi_dev->dev, true);
> @@ -1249,7 +1250,7 @@ static int mhi_uevent(struct device *dev, struct kobj_uevent_env *env)
>  	struct mhi_device *mhi_dev = to_mhi_device(dev);
>  
>  	return add_uevent_var(env, "MODALIAS=" MHI_DEVICE_MODALIAS_FMT,
> -					mhi_dev->chan_name);
> +					mhi_dev->name);
>  }
>  
>  static int mhi_match(struct device *dev, struct device_driver *drv)
> @@ -1266,7 +1267,7 @@ static int mhi_match(struct device *dev, struct device_driver *drv)
>  		return 0;
>  
>  	for (id = mhi_drv->id_table; id->chan[0]; id++)
> -		if (!strcmp(mhi_dev->chan_name, id->chan)) {
> +		if (!strcmp(mhi_dev->name, id->chan)) {
>  			mhi_dev->id = id;
>  			return 1;
>  		}
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 8d6ec34..3af0ce6 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -249,7 +249,7 @@ int mhi_destroy_device(struct device *dev, void *data)
>  		put_device(&mhi_dev->dl_chan->mhi_dev->dev);
>  
>  	dev_dbg(&mhi_cntrl->mhi_dev->dev, "destroy device for chan:%s\n",
> -		 mhi_dev->chan_name);
> +		 mhi_dev->name);
>  
>  	/* Notify the client and remove the device from MHI bus */
>  	device_del(dev);
> @@ -327,10 +327,10 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
>  		}
>  
>  		/* Channel name is same for both UL and DL */
> -		mhi_dev->chan_name = mhi_chan->name;
> +		mhi_dev->name = mhi_chan->name;
>  		dev_set_name(&mhi_dev->dev, "%s_%s",
>  			     dev_name(mhi_cntrl->cntrl_dev),
> -			     mhi_dev->chan_name);
> +			     mhi_dev->name);
>  
>  		/* Init wakeup source if available */
>  		if (mhi_dev->dl_chan && mhi_dev->dl_chan->wake_capable)
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index b008914..7ed785e 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -436,10 +436,10 @@ struct mhi_controller {
>  };
>  
>  /**
> - * struct mhi_device - Structure representing a MHI device which binds
> - *                     to channels
> + * struct mhi_device - Structure representing an MHI device which binds
> + *                     to channels or is associated with controllers
>   * @id: Pointer to MHI device ID struct
> - * @chan_name: Name of the channel to which the device binds
> + * @name: Name of the associated MHI device
>   * @mhi_cntrl: Controller the device belongs to
>   * @ul_chan: UL channel for the device
>   * @dl_chan: DL channel for the device
> @@ -451,7 +451,7 @@ struct mhi_controller {
>   */
>  struct mhi_device {
>  	const struct mhi_device_id *id;
> -	const char *chan_name;
> +	const char *name;
>  	struct mhi_controller *mhi_cntrl;
>  	struct mhi_chan *ul_chan;
>  	struct mhi_chan *dl_chan;
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
