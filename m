Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83FF61C0368
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 19:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbgD3RBj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 13:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726401AbgD3RBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 13:01:38 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03521C035494
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 10:01:37 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id mq3so946667pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 10:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=73/Na4zw08KsY+pRVinIDwhHiipHKgToaX0JUujsqIw=;
        b=C5wC0ueIOCJLT+QaH9PltDE/Hbqq/US5/Y/uEyPtPRqofR4R6+Dq7dNOagxIXS56Q8
         48sO37Gi/7JYogTul2vAd9qYer575p4UWNs60eWTXtimFd664pS6yHIVObfQapzMJFO9
         tzzpZSBwr234chEFWO89CTTda9OpvUnB1zYJU4swB1RpWBaDaGIVTML9596F13j8I4qN
         lce5sCoT8SgQtO9qIPdT0RH0WRmyFtMF3x6OeKyrHsKhsa2rMflV+BtSXV9xdV6Avzwy
         iyti8w0XRzRuHOo8iiKQCg4xmWgWGaisyOZ3jcX5Z4Ke89w9Im/vYIqGzC7Mwdu4WCMa
         gCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=73/Na4zw08KsY+pRVinIDwhHiipHKgToaX0JUujsqIw=;
        b=gBmexnmQkUtdxh4VtQQz0JtbY/6VvmBtfF/YCncUZ0EcFnzgIzt9Ad+P9n+7kUEOqs
         b3Y3gYHeqZ99+NigPU9l8zE6nABNt9xkMYuh78nhPeRkI452Yf1sEsphKUucAzRxfPHq
         KLbbsUbmixLecsHOsEEN4/5uWdt5XmKXVqpFzCbTYIg8ZMDpJvamVX0WPPRA3E73yXsc
         c12L9MFvbX/Pzg1Wn6iMwk+dblfTLAB7MJT55nHmp47jtXu8LQJPiRNTs4OxRxwDzbY7
         s7Ehnv39RQjBKchQCF3d+odoqrj6qqQR3/7vnGWcoQHvs/fAYTCIYzbFtrbz3eZrkS6W
         iUQw==
X-Gm-Message-State: AGi0PubUns1bROvmF+FK/u2QNq7sj3DMAvivl8n6F5jC34M1SM1RrDgb
        EEnWM+kSK7BEp/A8hx+1Sqcd
X-Google-Smtp-Source: APiQypILSdCBvoyT7pJQkXiK6lgcOwNpnQqVbFRwfQdL5nZo5SLzHEUu+UcbEaxOn8YUJPMOLRFsEw==
X-Received: by 2002:a17:90a:2004:: with SMTP id n4mr4122916pjc.190.1588266096054;
        Thu, 30 Apr 2020 10:01:36 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6081:946c:419e:a71:7237:1613])
        by smtp.gmail.com with ESMTPSA id 28sm296741pjh.43.2020.04.30.10.01.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 10:01:35 -0700 (PDT)
Date:   Thu, 30 Apr 2020 22:31:30 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] bus: mhi: core: Fix channel device name conflict
Message-ID: <20200430170130.GH9449@Mani-XPS-13-9360>
References: <1588003153-13139-1-git-send-email-jhugo@codeaurora.org>
 <1588003153-13139-7-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588003153-13139-7-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 27, 2020 at 09:59:13AM -0600, Jeffrey Hugo wrote:
> When multiple instances of the same MHI product are present in a system,
> we can see a splat from mhi_create_devices() - "sysfs: cannot create
> duplicate filename".
> 
> This is because the device names assigned to the MHI channel devices are
> non-unique.  They consist of the channel's name, and the channel's pipe
> id.  For identical products, each instance is going to have the same
> set of channel (both in name and pipe id).
> 
> To fix this, we prepend the device name of the parent device that the
> MHI channels belong to.  Since different instances of the same product
> should have unique device names, this makes the MHI channel devices for
> each product also unique.
> 
> Additionally, remove the pipe id from the MHI channel device name.  This
> is an internal detail to the MHI product that provides little value, and
> imposes too much device specific internal details to userspace.  It is
> expected that channel with a specific name (ie "SAHARA") has a specific
> client, and it does not matter what pipe id that channel is enumerated on.
> The pipe id is an internal detail between the MHI bus, and the hardware.
> The client is not expected to make decisions based on the pipe id, and to
> do so would require the client to have intimate knowledge of the hardware,
> which is inappropiate as it may violate the layering provided by the MHI
> bus.  The limitation of doing this is that each product may only have one
> instance of a channel by a unique name.  This limitation is appropriate
> given the usecases of MHI channels.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 580d72b..0ac0643 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -327,7 +327,8 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
>  
>  		/* Channel name is same for both UL and DL */
>  		mhi_dev->chan_name = mhi_chan->name;
> -		dev_set_name(&mhi_dev->dev, "%04x_%s", mhi_chan->chan,
> +		dev_set_name(&mhi_dev->dev, "%s_%s",
> +			     dev_name(mhi_cntrl->cntrl_dev),
>  			     mhi_dev->chan_name);
>  
>  		/* Init wakeup source if available */
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
