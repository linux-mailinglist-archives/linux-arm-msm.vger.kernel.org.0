Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 554A42CA3FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 14:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730106AbgLANim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Dec 2020 08:38:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729213AbgLANil (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Dec 2020 08:38:41 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9FCC0613D4
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Dec 2020 05:37:55 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id j13so1251291pjz.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Dec 2020 05:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RY+mbu7Kl1ygpq4GVXoYJlYC5IXEp5grIuI4NfzAZkA=;
        b=yiY4G7I7VbBsdfNgm4ThdpuEh7iRMyPgHeE8cpx3b+QI4tnRg1+qzMslmFCWtaOe2n
         mgNNiTIKM7t5pl0KZWN5Mju2qP6U6sdQD0+Bkj0K/5vWF+anZbAW4tbKJEq5VbxR/2e2
         xh+yqySkoEbVCxYcn8Wi3rZAGjqsUNaoOkwdHrDG1K8reIrZU6s4wzaTkWbnLUmP2s5w
         +QfXYy37oqQLR+fFWPAwC/XEbq+OUV6qDcuTyH0Q3zpkWU2VJy2w/UitorGURWWUVZ1r
         sPjya/NlGEVDLLrxJw/ggRmlOZvUT+FqHBRsoH0pb90glwkCpqcPNG9WQveg0pMJXfIO
         hFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RY+mbu7Kl1ygpq4GVXoYJlYC5IXEp5grIuI4NfzAZkA=;
        b=FJA4plEf7crcst5JsX3nfwRUkj9kf7ETGNMD5zxZr9CGeQroIEQeTW7wU2BbJD+dOB
         AjZ8E/XdsMKvceJ1rqfI1lIOEalAvi1UCCDNHvQX1LCK5w4X+SQXJ+CnvsN+8vdDfJVB
         g1LO9JIUHAuNkhA1qikTYkSitEdu9J7eeYoIbvDBSVTpLKSRvisBvfzw0xmTMm8KyKr0
         lsaF2tZZ31zSPIn9b5dqudWG0GhmWZ2JxgaXWaDz3E88x7hiu7PPD/islKDRna3EHYcJ
         vI3rajV6YqNBuKbiM8DyqidRT152lqe1tDfvC0hrKUUNfZYBugwVgN5dlVqBVWAxS4Ex
         U5hw==
X-Gm-Message-State: AOAM532/o3T2K2rQtBfAFMylPDj8mJ5JlOS2DRfjwAm1is1AS8gS8e/6
        YdkOs2BNIjikKI6wlFnHXxrW
X-Google-Smtp-Source: ABdhPJz4OcKskL14b3zM4fgk2dwBWLoVO0nGRnJR4kzOMYJcKWHCEbt8/efyZqYdbRVT3VudMVuNNg==
X-Received: by 2002:a17:90a:9381:: with SMTP id q1mr2744492pjo.127.1606829875346;
        Tue, 01 Dec 2020 05:37:55 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id j19sm2796383pff.74.2020.12.01.05.37.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 05:37:54 -0800 (PST)
Date:   Tue, 1 Dec 2020 19:07:48 +0530
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
Message-ID: <20201201133748.GC9748@work>
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

Applied to mhi-next!

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
