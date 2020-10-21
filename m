Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80BCB294FF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Oct 2020 17:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502432AbgJUP1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Oct 2020 11:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502395AbgJUP1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Oct 2020 11:27:24 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE0BC0613CF
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 08:27:24 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id b23so1681754pgb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2020 08:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=L0DyEDqEHeJR1moGuOVmLacKQmOwrn/cXuF3+kACtMg=;
        b=m0wGNSiwupmw9UwVvZ+0B+ayFCqGEyq1r4XCx9hzNoBOf+6ZIMl9GdfVITZtXe5+FY
         brYY2u6xK6d5fc7Psk/dfJoYwKEzi1z8SWg1qWeyHViOjti9AE7BZFQP89fGYJvRaSJ+
         rZCiiBe9mqWn4RXOvZ1bjOs41GDTNTYM+nPFPlxflXdXnVxRoU6BVUUUGumhj1CrGVR7
         lKDk3BSaqMCaUJNkpp9UH72R7LAqIMrCibR+UNgx79qjsj5iiaIHc/bEBDvVxbQJokMl
         8JsiWAFI4PTl5HBzL07EJi2FnqBL/dGyKKYjBcBgtedEp8MrH8CbM729AzTHk/f0U7Ct
         UuGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=L0DyEDqEHeJR1moGuOVmLacKQmOwrn/cXuF3+kACtMg=;
        b=dXb8FacSEZli0BiYLMw9ZU5J+iYA/UWM+GwsBEHMUdia4AbHQTiaYigKckj1TW8Cn2
         RJGznZE1C1N6pqBWUMJInfWyGjv669pu0qvCOIRjac4BqT3W3cOWl3o2kTchUG4+JaAp
         qlEa0M6OZDWc1Jk08TjPUZpY6aoD83mayMWHB+7kdbTSM91Svxt1ysgMZcdcPk+0SqDh
         K6dpdRlXatDXY1mT7QZ0FI/FkP1gjI19SCVj/kWpL6wn7VgbDerUcVzpyYV7FD2wvruy
         oJ5l4VrAxssAh4MeUjyK7UsZpNRkQOPS83u4tvh671FR7/TRT2Vgic4oPGTSgMWD+FpB
         gpow==
X-Gm-Message-State: AOAM5322sESU6vN+ezJg8JC5C2ObR8MJOtSzarcjf1PI+z5gQVJ3CnGO
        NSzgJwrcHW2l24DM9VZX7wDc
X-Google-Smtp-Source: ABdhPJwsQnmOXwRt8AFibJECYq7E1vSXfA76igMIGe3bl5LxN3HOlUN3z5+vhpEa7F/zNDoO5fC9eg==
X-Received: by 2002:a62:7a0a:0:b029:152:192d:9231 with SMTP id v10-20020a627a0a0000b0290152192d9231mr4087432pfc.61.1603294043706;
        Wed, 21 Oct 2020 08:27:23 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:70e:2a27:314a:6d22:ec47:a603])
        by smtp.gmail.com with ESMTPSA id v24sm1092088pgi.91.2020.10.21.08.27.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 08:27:22 -0700 (PDT)
Date:   Wed, 21 Oct 2020 20:57:14 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, loic.poulain@linaro.org
Subject: Re: [PATCH v7 1/4] bus: mhi: core: Add helper API to return number
 of free TREs
Message-ID: <20201021152714.GD3334@Mani-XPS-13-9360>
References: <1602907457-13680-1-git-send-email-hemantk@codeaurora.org>
 <1602907457-13680-2-git-send-email-hemantk@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602907457-13680-2-git-send-email-hemantk@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 16, 2020 at 09:04:14PM -0700, Hemant Kumar wrote:
> Introduce mhi_get_free_desc_count() API to return number
> of TREs available to queue buffer. MHI clients can use this
> API to know before hand if ring is full without calling queue
> API.
> 
> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 12 ++++++++++++
>  include/linux/mhi.h         |  9 +++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 2cff5dd..3950792 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -258,6 +258,18 @@ int mhi_destroy_device(struct device *dev, void *data)
>  	return 0;
>  }
>  
> +int mhi_get_free_desc_count(struct mhi_device *mhi_dev,
> +				enum dma_data_direction dir)
> +{
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ?
> +		mhi_dev->ul_chan : mhi_dev->dl_chan;
> +	struct mhi_ring *tre_ring = &mhi_chan->tre_ring;
> +
> +	return get_nr_avail_ring_elements(mhi_cntrl, tre_ring);
> +}
> +EXPORT_SYMBOL_GPL(mhi_get_free_desc_count);
> +
>  void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason)
>  {
>  	struct mhi_driver *mhi_drv;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index d4841e5..7829b1d 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -597,6 +597,15 @@ void mhi_set_mhi_state(struct mhi_controller *mhi_cntrl,
>  void mhi_notify(struct mhi_device *mhi_dev, enum mhi_callback cb_reason);
>  
>  /**
> + * mhi_get_free_desc_count - Get transfer ring length
> + * Get # of TD available to queue buffers
> + * @mhi_dev: Device associated with the channels
> + * @dir: Direction of the channel
> + */
> +int mhi_get_free_desc_count(struct mhi_device *mhi_dev,
> +				enum dma_data_direction dir);
> +
> +/**
>   * mhi_prepare_for_power_up - Do pre-initialization before power up.
>   *                            This is optional, call this before power up if
>   *                            the controller does not want bus framework to
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
