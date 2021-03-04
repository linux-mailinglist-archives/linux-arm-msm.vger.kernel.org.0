Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B531932D989
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Mar 2021 19:41:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233662AbhCDSlX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Mar 2021 13:41:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233638AbhCDSlV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Mar 2021 13:41:21 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF23AC06175F
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 10:40:40 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id 192so12568231pfv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 10:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iOyXuDvcxIJx0fWVVx3P/498/pkanhShN/F9x63Eql0=;
        b=Wuo6av27VDcEVAtYW39edz6pHWrLzKoZG4gc3DHdSiXT0pBgzFxK4Qhxja0uIrZrDf
         EKcShlOVP8HvDiKbOJCahNHqBlO4rpO17GmgaO/KB3/HJhx+MrWbBf5n/ieH8TRFxDyg
         2GC+ACuHebskaqyXCnvBUAjHpQ+hgvViHN5AJSsqeOdQK9jYWmJs/iNb2EtSXqLYRgUw
         gJGBKR7CFO06PZj9TQlD/nTCGKodGlFjJ9y4VL/S53qR+m2nI+eomG3A4NfY/+68g9HO
         2n1WEyFwGkY4srHwUxtFpVVp3Hqm36rm+rYkn5Q3EjoFyE6MWb4NSql7XTcXCicxQfVC
         ptFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iOyXuDvcxIJx0fWVVx3P/498/pkanhShN/F9x63Eql0=;
        b=SXEg7UxOW7HeXV2AbHwhE52NnIfxX6ho3zwAoNvsqeHSCZjiM3cz9WyuDbHpfLsZsY
         B461EWzDPteltAhaTboaOw3KAwROyT+5ucwZ1pJztBC08TFwQnWuD/5pqN3uT/nE9OOG
         uc/U4Ckdsm/HyoFW6VfqPg6qqFZIAjb42jqpz9hzd8B8TrCFkvO9z+B7zSOUX04b2GN5
         wtOiD98voVoN1jEZyhb+368s+qYohZOmNvEk/QXj15Cph3I59zEUXfJpbOT/3NJAOC/c
         OPgrJnSeCVajencinkrog0EaRya2B6uJsMu/qq3gkZlakzYgdqasws48rU7ndO6Te/8w
         o3Tg==
X-Gm-Message-State: AOAM530vgmqqqN+zeVLKcF/MFZNLveZx7BkJCMGnqHqsVzHCPuYprChv
        oMzwcpeGv0eLZQI50t451iOgKA==
X-Google-Smtp-Source: ABdhPJzwkhYn2cMBistrs8Pz3+urfuo6UpVT529eTD4hB8ctm0CobSvjPpPE3fffwBuYBUSQaLsr4Q==
X-Received: by 2002:a63:140b:: with SMTP id u11mr4792170pgl.436.1614883240211;
        Thu, 04 Mar 2021 10:40:40 -0800 (PST)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 25sm107673pfh.199.2021.03.04.10.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 10:40:36 -0800 (PST)
Date:   Thu, 4 Mar 2021 11:40:34 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 15/16] rpmsg: char: no dynamic endpoint management for
 the default one
Message-ID: <20210304184034.GA3854911@xps15>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
 <20210219111501.14261-16-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219111501.14261-16-arnaud.pouliquen@foss.st.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There has to be a capital letter at the start of the title:

rpmsg: char: No dynamic endpoint management for the default one

Please fix for all the patches.

On Fri, Feb 19, 2021 at 12:15:00PM +0100, Arnaud Pouliquen wrote:
> Do not dynamically manage the default endpoint. The ept address must
> not change.
> This update is needed to manage the RPMSG_CREATE_DEV_IOCTL. In this
> case a default endpoint is used and it's address must not change or
> been reused by another service.

The above is very difficult to understand.  I am not sure about introducing
RPMSG_CREATE_DEV_IOCTL in this patchset.  More on that in an upcoming comment.

> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  drivers/rpmsg/rpmsg_char.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index c98b0e69679b..8d3f9d6c20ad 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -114,14 +114,23 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  	struct rpmsg_endpoint *ept;
>  	struct rpmsg_device *rpdev = eptdev->rpdev;
>  	struct device *dev = &eptdev->dev;
> +	u32 addr = eptdev->chinfo.src;
>  
>  	get_device(dev);
>  
> -	ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> -	if (!ept) {
> -		dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
> -		put_device(dev);
> -		return -EINVAL;
> +	/*
> +	 * The RPMsg device can has been created by a ns announcement. In this
> +	 * case a default endpoint has been created. Reuse it to avoid to manage
> +	 * a new address on each open close.
> +	 */

Here too it is very difficult to understand because the comment
doesn't not describe what the code does.  The code creates an enpoint if it
has not been created, which means /dev/rpmsgX was created from the ioctl. 

> +	ept = rpdev->ept;
> +	if (!ept || addr != ept->addr) {
> +		ept = rpmsg_create_ept(rpdev, rpmsg_ept_cb, eptdev, eptdev->chinfo);
> +		if (!ept) {
> +			dev_err(dev, "failed to open %s\n", eptdev->chinfo.name);
> +			put_device(dev);
> +			return -EINVAL;
> +		}
>  	}
>  
>  	eptdev->ept = ept;
> @@ -133,12 +142,17 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
>  static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
>  {
>  	struct rpmsg_eptdev *eptdev = cdev_to_eptdev(inode->i_cdev);
> +	struct rpmsg_device *rpdev = eptdev->rpdev;
>  	struct device *dev = &eptdev->dev;
>  
> -	/* Close the endpoint, if it's not already destroyed by the parent */
> +	/*
> +	 * Close the endpoint, if it's not already destroyed by the parent and it is not the
> +	 * default one.
> +	 */
>  	mutex_lock(&eptdev->ept_lock);
>  	if (eptdev->ept) {
> -		rpmsg_destroy_ept(eptdev->ept);
> +		if (eptdev->ept != rpdev->ept)
> +			rpmsg_destroy_ept(eptdev->ept);
>  		eptdev->ept = NULL;
>  	}
>  	mutex_unlock(&eptdev->ept_lock);
> -- 
> 2.17.1
> 
