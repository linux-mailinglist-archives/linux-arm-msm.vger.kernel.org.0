Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A482CA3F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 14:36:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbgLANgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 08:36:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgLANgN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 08:36:13 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1320C0613D4
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Dec 2020 05:35:33 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id q10so1141535pfn.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Dec 2020 05:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=BBMglAuoeC9LB7N8iSMjJ/7Ujai9U1R0eTjZYwHsXFI=;
        b=qJuUYgWcDxFJl1k4awHDYPJ4WgIiWWsfMUuyGIjHvDpZabtzuowOpVxlGelJnRu+s/
         ilUmn5XEdYeWwcdS7SpI8FgQTxAlSDXgw77GNhL/TlK+xsfAdEFm/Pl0Xyb9MtYD2GK8
         Dupv4aV/k5Hi8Q0BGH0wF5bFx+eBJakdizWwzJTDbztMMefsTM+FAWiw8prGvL+FvUdK
         /fPKuF9lBGOxb61JyTsWft40UiXvMO9s2ntykwx/QS4XHdrFP5vUbiAyxuHRVuQBe0fQ
         4rQbQauibPk4+pQ/3IzgYYndAllcE0OwNTXTMRF0bgx9IWyIZzliv36uxzVs0Wtf8JKF
         heYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BBMglAuoeC9LB7N8iSMjJ/7Ujai9U1R0eTjZYwHsXFI=;
        b=UQSRx8GrT4lauJnDFJ4LzZn2M6mrpGHzsDXCI7xjl2dUUBQAMvqqtQ1Fqz4KfHphCQ
         Xq5OngGRbLG5OYwApqffYzDymwrY3PAWlo0i4h0mazY/2eG05c2Bq8vZd4E8v4EnMXH9
         pbReMNrZcJYe9gNrXadSd4c86J2J8LpuoITewnD3P3+U8BpzVLhmh9KLR9yEbQC0QB5y
         OJ3JxrmiwwN6Fwk5YjaOJ//3pOvDxsuFzGln/fD30/dVtIrsq5Gff8rRDn1yHGMuBtUn
         U1pQ+onx326YqV4L3nM0XVQiulyoEPkQ7eK6PuooxYYsXZVivb+5xE5JxNNy3y/0hH25
         5iEg==
X-Gm-Message-State: AOAM532XUkMUZbKchLmZfTBl8P3NKO6HeIvyKtYM4BmJ6LqNBZq6lpnx
        FCs2THmy97AC9uTbctX+H6dp
X-Google-Smtp-Source: ABdhPJy8KvKJrW64WsIXNHTRE0Wv0WKyujXpHkb/2ARFJmgzi91jhYm7tb2OYHu9qPk2PmXirDvlnQ==
X-Received: by 2002:aa7:9e90:0:b029:18b:a94:3498 with SMTP id p16-20020aa79e900000b029018b0a943498mr2562143pfq.54.1606829733170;
        Tue, 01 Dec 2020 05:35:33 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id x16sm2703229pjh.39.2020.12.01.05.35.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 05:35:32 -0800 (PST)
Date:   Tue, 1 Dec 2020 19:05:25 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: Fix error handling in
 mhi_register_controller()
Message-ID: <20201201133525.GB9748@work>
References: <X8XqbtkPpEKSfFi2@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8XqbtkPpEKSfFi2@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 01, 2020 at 10:02:54AM +0300, Dan Carpenter wrote:
> There are a few problems with the error handling in this function.  They
> mostly center around the alloc_ordered_workqueue() allocation.
> 1) If that allocation fails or if the kcalloc() prior to it fails then
> it leads to a NULL dereference when we call
> destroy_workqueue(mhi_cntrl->hiprio_wq).
> 2) The error code is not set.
> 3) The "mhi_cntrl->mhi_cmd" allocation is not freed.
> 
> The error handling was slightly confusing and I re-ordered it to be in
> the exact mirror/reverse order of how things were allocated.  I changed
> the label names to say what the goto does instead of describing where
> the goto comes from.
> 
> Fixes: 8f7039787687 ("bus: mhi: core: Move to using high priority workqueue")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good find... Thanks for the patch, Dan!

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 29 ++++++++++++++---------------
>  1 file changed, 14 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 96cde9c0034c..f0697f433c2f 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -871,7 +871,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  				     sizeof(*mhi_cntrl->mhi_cmd), GFP_KERNEL);
>  	if (!mhi_cntrl->mhi_cmd) {
>  		ret = -ENOMEM;
> -		goto error_alloc_cmd;
> +		goto err_free_event;
>  	}
>  
>  	INIT_LIST_HEAD(&mhi_cntrl->transition_list);
> @@ -886,7 +886,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  				("mhi_hiprio_wq", WQ_MEM_RECLAIM | WQ_HIGHPRI);
>  	if (!mhi_cntrl->hiprio_wq) {
>  		dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate workqueue\n");
> -		goto error_alloc_cmd;
> +		ret = -ENOMEM;
> +		goto err_free_cmd;
>  	}
>  
>  	mhi_cmd = mhi_cntrl->mhi_cmd;
> @@ -932,7 +933,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs,
>  			   SOC_HW_VERSION_OFFS, &soc_info);
>  	if (ret)
> -		goto error_alloc_dev;
> +		goto err_destroy_wq;
>  
>  	mhi_cntrl->family_number = (soc_info & SOC_HW_VERSION_FAM_NUM_BMSK) >>
>  					SOC_HW_VERSION_FAM_NUM_SHFT;
> @@ -946,7 +947,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	mhi_cntrl->index = ida_alloc(&mhi_controller_ida, GFP_KERNEL);
>  	if (mhi_cntrl->index < 0) {
>  		ret = mhi_cntrl->index;
> -		goto error_ida_alloc;
> +		goto err_destroy_wq;
>  	}
>  
>  	/* Register controller with MHI bus */
> @@ -954,7 +955,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  	if (IS_ERR(mhi_dev)) {
>  		dev_err(mhi_cntrl->cntrl_dev, "Failed to allocate MHI device\n");
>  		ret = PTR_ERR(mhi_dev);
> -		goto error_alloc_dev;
> +		goto err_ida_free;
>  	}
>  
>  	mhi_dev->dev_type = MHI_DEVICE_CONTROLLER;
> @@ -967,7 +968,7 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  
>  	ret = device_add(&mhi_dev->dev);
>  	if (ret)
> -		goto error_add_dev;
> +		goto err_release_dev;
>  
>  	mhi_cntrl->mhi_dev = mhi_dev;
>  
> @@ -975,19 +976,17 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>  
>  	return 0;
>  
> -error_add_dev:
> +err_release_dev:
>  	put_device(&mhi_dev->dev);
> -
> -error_alloc_dev:
> +err_ida_free:
>  	ida_free(&mhi_controller_ida, mhi_cntrl->index);
> -
> -error_ida_alloc:
> +err_destroy_wq:
> +	destroy_workqueue(mhi_cntrl->hiprio_wq);
> +err_free_cmd:
>  	kfree(mhi_cntrl->mhi_cmd);
> -
> -error_alloc_cmd:
> -	vfree(mhi_cntrl->mhi_chan);
> +err_free_event:
>  	kfree(mhi_cntrl->mhi_event);
> -	destroy_workqueue(mhi_cntrl->hiprio_wq);
> +	vfree(mhi_cntrl->mhi_chan);
>  
>  	return ret;
>  }
> -- 
> 2.29.2
> 
