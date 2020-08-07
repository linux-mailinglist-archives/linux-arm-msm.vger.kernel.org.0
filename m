Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFD5323E6FC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Aug 2020 07:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgHGFPs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Aug 2020 01:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgHGFPp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Aug 2020 01:15:45 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF66CC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2020 22:15:45 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ha11so343655pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2020 22:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MBiQY6LTeMAyrNDctZTGpI85Qrwm/lT3KljbOVSIsIU=;
        b=Ci362HhGecTknDyD27bYk4NYh2QVzDcBfO5JQOtXkzSJOH1PsDnNYNdS10gyCsxzW3
         O2vhmsHj9bEZmccLTmftVbo7hou0KQZbD5F62V9aze/T99c8Pz4rIDbZ16gco/NaNnV9
         2gFnxGn+VlYt1WQmNrIPkPzzlcdP81j+I9ccqNRBi1qWCgs6KlaaB7Kn70nb8v3hBOkR
         emD26LjP48leji/aZd60gL0SZ8jY6Ghxx4HSXefXQncpDmKEFhFfIAgms+hYWTcbApsq
         ARWz9fGTdBnBQS1ZgxG+WVvNwmKKKbKe0RTTFkztJjTGQTZ1be62Mn8S9/NJWpZkW2Mp
         scvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=MBiQY6LTeMAyrNDctZTGpI85Qrwm/lT3KljbOVSIsIU=;
        b=XUPOO0vy4tpSv3Hi+IccynFp4GN25a/vPVkG5XMeb4R7ImR8q4LRVuaV07/DztkG2G
         IcRw1mCiVvcPi+odD7a4SpEQSnr9m91PaWNpNWsbVteLNvDqad0ZQH227WBQ4CrAuL0I
         5iOPtkUb8l0zRThnSgTiEV5/VPgAhXV67+Kq66IDM8QBPHpRA6rthYUy6OiXyzGkMrjw
         UBeVwq1quGyO0Fa3Formd0tZSos2PGtermf3BWv3tGqC3FK64y+Myh5t5fm/H3e28OuZ
         qtkPsSkQV8G8vqKSa8PAfrTc/ufBF7Eg6eLalWsvgSTCbUttXL4VaHyA9sYFxVdSwxBR
         8KVg==
X-Gm-Message-State: AOAM530ue9BldmfbIhgT0boTa/HObGb/G9Gs7xPOWWVk/iPqMs7k67Fn
        d3yY/z+ZOLpL/vraWjZiCjfSjyOUng==
X-Google-Smtp-Source: ABdhPJzG9ys4l85i7KE9prlVjbCU4+da2W4YntUlOve0TVyv78oxfwb4fCiY74JgzuE5lkX2gZs0hg==
X-Received: by 2002:a17:902:b20d:: with SMTP id t13mr11008275plr.312.1596777344811;
        Thu, 06 Aug 2020 22:15:44 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d15:d4c4:a84b:5551:d33e:ccd2])
        by smtp.gmail.com with ESMTPSA id s61sm9630018pjb.57.2020.08.06.22.15.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 22:15:44 -0700 (PDT)
Date:   Fri, 7 Aug 2020 10:45:38 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/11] bus: mhi: core: Introduce APIs to allocate and
 free the MHI controller
Message-ID: <20200807051538.GC3230@Mani-XPS-13-9360>
References: <1595901740-27379-1-git-send-email-bbhatt@codeaurora.org>
 <1595901740-27379-11-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595901740-27379-11-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 27, 2020 at 07:02:19PM -0700, Bhaumik Bhatt wrote:
> Client devices should use the APIs provided to allocate and free
> the MHI controller structure. This will help ensure that the
> structure is zero-initialized and there are no false positives
> with respect to reading any values such as the serial number or
> the OEM PK hash.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Can you please also add the Suggested-by tag?

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 16 ++++++++++++++++
>  include/linux/mhi.h         | 12 ++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index d2c0f6e..972dbf0 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -959,6 +959,22 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_unregister_controller);
>  
> +struct mhi_controller *mhi_alloc_controller(void)
> +{
> +	struct mhi_controller *mhi_cntrl;
> +
> +	mhi_cntrl = kzalloc(sizeof(*mhi_cntrl), GFP_KERNEL);
> +
> +	return mhi_cntrl;
> +}
> +EXPORT_SYMBOL_GPL(mhi_alloc_controller);
> +
> +void mhi_free_controller(struct mhi_controller *mhi_cntrl)
> +{
> +	kfree(mhi_cntrl);
> +}
> +EXPORT_SYMBOL_GPL(mhi_free_controller);
> +
>  int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  {
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index d15e9ce..a35d876 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -530,6 +530,18 @@ struct mhi_driver {
>  #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
>  
>  /**
> + * mhi_alloc_controller - Allocate the MHI Controller structure
> + * Allocate the mhi_controller structure using zero initialized memory
> + */
> +struct mhi_controller *mhi_alloc_controller(void);
> +
> +/**
> + * mhi_free_controller - Free the MHI Controller structure
> + * Free the mhi_controller structure which was previously allocated
> + */
> +void mhi_free_controller(struct mhi_controller *mhi_cntrl);
> +
> +/**
>   * mhi_register_controller - Register MHI controller
>   * @mhi_cntrl: MHI controller to register
>   * @config: Configuration to use for the controller
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
