Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D112E7E94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 08:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgLaHYw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 02:24:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgLaHYv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 02:24:51 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4ED2C061575
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 23:24:11 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id n10so12675919pgl.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 23:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=59Y9lLu7gKLA6PBo+Rc/MQHtWZJv/8/MoV+hD4xt+3U=;
        b=atsO3HYk9RIzqk8lrfu3fkNFFnAf7WDnApVjEQXtzGeV5l09/FU1arRk8JsJgMWPJ2
         n3sUerQzGu2/R0yY6mssYhacZRfSCQ0X7tRSaRBiMzfnuE5mYY/6Oe/MbXUjHbygu1Bw
         4P8m5l/Jy8hdli+4kRHqf0hlV8wQ3DNOi/2W1XmYK5JuImxyy/uvcaQDHevU+kKB1GEl
         6iZV2bukZOjI/FreHO/8kWRGT4/BmrVI1QPgmfBNRkoR7T/VvBcordQ3OW4myXaquSRW
         0Jcr16pqEfosYZpdN3l3DLmqmcpLfKeZODLFdXbgDEazp3D/ARlv1zmerp1FCpj8BSF+
         doSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=59Y9lLu7gKLA6PBo+Rc/MQHtWZJv/8/MoV+hD4xt+3U=;
        b=DKdjWyWmPAcojkLwBq8ZHE8sU/PsPIFsKtlamZMxMdYvuNSgVuqzmLvZbvV6zjeNFn
         xirmW5Uac/dRnUiIiONg84kfK8eaTN7vZVxSl6smujs6csMMRD5i9wTEmzTlCGhjqJ5i
         OWkUi03vzPsd90SvLRdwlG884LfQkxGrRm1PJtUYy62mxZ2QsjrmsnaBSju6f1cWf1s3
         drtYSqqtjTPyM46sGLp9N9Rco46YXF6CraPQOfJXQhSX9B2HvVGN9pF/oHVgqPeTu54F
         K1lSamn0E4FPfISA636FUZkkInK4xR99cQnUNg20kwAAzoXFzUHMcRaw0mhYGQiJ1F+N
         xGNQ==
X-Gm-Message-State: AOAM531pPnEID1KjK4UbdjBi+kbWb5QYb001Dq+DPcvqBvSG3cD6IaSO
        fPCL1n7klRaXu3gxaOrTamW0
X-Google-Smtp-Source: ABdhPJzPh9/5Dzj2H8zgXe2mVdWGiMZgpYGXX/bIf3qnJ7fMOTe1H8yA0aiAvu4907EpfBEwso5LIg==
X-Received: by 2002:a63:eb0c:: with SMTP id t12mr771240pgh.7.1609399451132;
        Wed, 30 Dec 2020 23:24:11 -0800 (PST)
Received: from thinkpad ([2409:4072:6d1f:be3b:71a9:d2bf:a32d:897d])
        by smtp.gmail.com with ESMTPSA id cq15sm9274573pjb.27.2020.12.30.23.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 23:24:10 -0800 (PST)
Date:   Thu, 31 Dec 2020 12:54:04 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Carl Huang <cjhuang@codeaurora.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2] mhi: use irq_flags if client driver configures it
Message-ID: <20201231072404.GE7345@thinkpad>
References: <20201229070551.3129-1-cjhuang@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201229070551.3129-1-cjhuang@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 29, 2020 at 02:05:51AM -0500, Carl Huang wrote:
> If client driver has specified the irq_flags, mhi uses this specified
> irq_flags. Otherwise, mhi uses default irq_flags.
> 
> The purpose of this change is to support one MSI vector for QCA6390.
> MHI will use one same MSI vector too in this scenario.
> 
> In case of one MSI vector, IRQ_NO_BALANCING is needed when irq handler
> is requested. The reason is if irq migration happens, the msi_data may
> change too. However, the msi_data is already programmed to QCA6390
> hardware during initialization phase. This msi_data inconsistence will
> result in crash in kernel.
> 
> Another issue is in case of one MSI vector, IRQF_NO_SUSPEND will trigger
> WARNINGS because QCA6390 wants to disable the IRQ during the suspend.
> 
> To avoid above two issues, QCA6390 driver specifies the irq_flags in case
> of one MSI vector when mhi_register_controller is called.
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>

Small nitpick below, with that addressed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
> v2:
> - document irq_flags added to mhi_controller
> 
>  drivers/bus/mhi/core/init.c | 9 +++++++--
>  include/linux/mhi.h         | 2 ++
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 0ffdebd..5f74e1e 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -148,12 +148,17 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>  {
>  	struct mhi_event *mhi_event = mhi_cntrl->mhi_event;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	unsigned long irq_flags = IRQF_SHARED | IRQF_NO_SUSPEND;
>  	int i, ret;
>  
> +	/* if client driver has set irq_flags, use it */

s/client driver/controller driver

Thanks,
Mani

> +	if (mhi_cntrl->irq_flags)
> +		irq_flags = mhi_cntrl->irq_flags;
> +
>  	/* Setup BHI_INTVEC IRQ */
>  	ret = request_threaded_irq(mhi_cntrl->irq[0], mhi_intvec_handler,
>  				   mhi_intvec_threaded_handler,
> -				   IRQF_SHARED | IRQF_NO_SUSPEND,
> +				   irq_flags,
>  				   "bhi", mhi_cntrl);
>  	if (ret)
>  		return ret;
> @@ -171,7 +176,7 @@ int mhi_init_irq_setup(struct mhi_controller *mhi_cntrl)
>  
>  		ret = request_irq(mhi_cntrl->irq[mhi_event->irq],
>  				  mhi_irq_handler,
> -				  IRQF_SHARED | IRQF_NO_SUSPEND,
> +				  irq_flags,
>  				  "mhi", mhi_event);
>  		if (ret) {
>  			dev_err(dev, "Error requesting irq:%d for ev:%d\n",
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index d4841e5..918cf6a 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -353,6 +353,7 @@ struct mhi_controller_config {
>   * @fbc_download: MHI host needs to do complete image transfer (optional)
>   * @pre_init: MHI host needs to do pre-initialization before power up
>   * @wake_set: Device wakeup set flag
> + * @irq_flags: irq flags passed to request_irq (optional)
>   *
>   * Fields marked as (required) need to be populated by the controller driver
>   * before calling mhi_register_controller(). For the fields marked as (optional)
> @@ -442,6 +443,7 @@ struct mhi_controller {
>  	bool fbc_download;
>  	bool pre_init;
>  	bool wake_set;
> +	unsigned long irq_flags;
>  };
>  
>  /**
> -- 
> 2.7.4
> 
