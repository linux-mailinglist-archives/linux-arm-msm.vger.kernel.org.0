Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D490F3B37DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 22:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhFXUdM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 16:33:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhFXUdL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 16:33:11 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9D3C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 13:30:51 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id k21-20020a4a2a150000b029024955603642so1966140oof.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 13:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=05VznefSr6M23njAKrglWolJQOUPJqSKsFl6u+AwYsI=;
        b=LvfKjvM/U6TziyjHs35+r0suEqtsoXa9vo5CKEskTgWzE7ZaaFVHLIBu6MjCqG17cs
         rusfmkxmbID5r6k7cybmYaa8a28IiKV5pMLFVWkr4DsU0RQXfIShPJtUmByOFddudZ4c
         SnMhk9nm0gJPf086zhs7VihmxwIu/vyzQ83GapuQejaZeaBLcD6Ykz+8m5rFstxnsgQv
         vZQycpVdWm5b6lFoyNIwbdi9lVSFzZCStUdKLjoOjPGPhwT75PL7Yyg1HozjY50IEdFK
         z0XT1ntxjstQ1BlREiUd3H3zXIiAvvDsem9WIpQdTYdx7eyIav9CzGa4hRXbr3NcGSsL
         Gjlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=05VznefSr6M23njAKrglWolJQOUPJqSKsFl6u+AwYsI=;
        b=tV2Pw+SYNk2+GKciURTgXyRMshJlBj3OCjgFefKPBvD6hg263Yo3K/ME+7FZ+W2ghY
         QM8S5O+1pSs42qCZZWjQPem9Y184DH+15BAKZyKSlt3ffh5K4me/P8G4vQY8HVEVsMXv
         DoeC5ynH4+HRoGRT/BoGb7jKp1SY1f2gpK0T5ORQhh8OhCwouYKpyjRz5kGz6ujdwLs6
         D6HAT1bGOZFdUNQdDuI+P3cBordFZYWGAsE9+Fmww6L0KpNlZbIg5vFYc1wZ/9T/Nsdh
         83di3gmL1Urn+/v/b90xa6L/2BSrX4X5hJr9/W7KcG0aRdP/s+CdO2/QSRuYla1TWzQ6
         NSgQ==
X-Gm-Message-State: AOAM533hMzVTujEAro70iSRwmSQh8aVCHYA294waqFgbqFjVZO5Yb0g6
        O+Nd20Ot2+clGn/y1EEIfK0dYA==
X-Google-Smtp-Source: ABdhPJwkS15ibmEJlPo2qSnX/Kpl+WRDv0HkRqQrYKnmreJVuOLw+g04hljLMZLR3ig5GRtqr9UhCg==
X-Received: by 2002:a4a:ea8d:: with SMTP id r13mr6004379ooh.7.1624566650953;
        Thu, 24 Jun 2021 13:30:50 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u14sm871071oie.0.2021.06.24.13.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 13:30:50 -0700 (PDT)
Date:   Thu, 24 Jun 2021 15:30:48 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     mani@kernel.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3] bus: mhi: Add inbound buffers allocation flag
Message-ID: <YNTrePQQ3scDzAhe@builder.lan>
References: <1624566520-20406-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624566520-20406-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 24 Jun 15:28 CDT 2021, Loic Poulain wrote:

> Currently, the MHI controller driver defines which channels should
> have their inbound buffers allocated and queued. But ideally, this is
> something that should be decided by the MHI device driver instead,
> which actually deals with that buffers.
> 
> Add a flag parameter to mhi_prepare_for_transfer allowing to specify
> if buffers have to be allocated and queued by the MHI stack.
> 
> Keep auto_queue flag for now, but should be removed at some point.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Tested-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Acked-by: Jakub Kicinski <kuba@kernel.org>
> Link: https://lore.kernel.org/r/1621603519-16773-1-git-send-email-loic.poulain@linaro.org
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

What's the intention with this patch? Why is Mani the last S-o-b when
you're the one sending it and why is it sent only to linux-arm-msm@?


And completely separate of the practical matters, is it true that qrtr
is the only client that use this pre-allocation feature? Would it be a
net gain to simplify the core and add buffer allocation to qrtr instead?

Regards,
Bjorn

> ---
>  v2: Update API in mhi_wwan_ctrl driver
>  v3: Do not use enum for flags
> 
>  drivers/bus/mhi/core/internal.h  | 2 +-
>  drivers/bus/mhi/core/main.c      | 9 ++++++---
>  drivers/net/mhi/net.c            | 2 +-
>  drivers/net/wwan/mhi_wwan_ctrl.c | 2 +-
>  include/linux/mhi.h              | 7 ++++++-
>  net/qrtr/mhi.c                   | 2 +-
>  6 files changed, 16 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 5b9ea66..bc239a1 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -682,7 +682,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>  		      struct image_info *img_info);
>  void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
>  int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
> -			struct mhi_chan *mhi_chan);
> +			struct mhi_chan *mhi_chan, unsigned int flags);
>  int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
>  		       struct mhi_chan *mhi_chan);
>  void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 050381d..594fe37 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1433,7 +1433,7 @@ static void mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
>  }
>  
>  int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
> -			struct mhi_chan *mhi_chan)
> +			struct mhi_chan *mhi_chan, unsigned int flags)
>  {
>  	int ret = 0;
>  	struct device *dev = &mhi_chan->mhi_dev->dev;
> @@ -1458,6 +1458,9 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
>  	if (ret)
>  		goto error_pm_state;
>  
> +	if (mhi_chan->dir == DMA_FROM_DEVICE)
> +		mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
> +
>  	/* Pre-allocate buffer for xfer ring */
>  	if (mhi_chan->pre_alloc) {
>  		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
> @@ -1613,7 +1616,7 @@ void mhi_reset_chan(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan)
>  }
>  
>  /* Move channel to start state */
> -int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
> +int mhi_prepare_for_transfer(struct mhi_device *mhi_dev, unsigned int flags)
>  {
>  	int ret, dir;
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> @@ -1624,7 +1627,7 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
>  		if (!mhi_chan)
>  			continue;
>  
> -		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan);
> +		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan, flags);
>  		if (ret)
>  			goto error_open_chan;
>  	}
> diff --git a/drivers/net/mhi/net.c b/drivers/net/mhi/net.c
> index 0d8293a..774e329 100644
> --- a/drivers/net/mhi/net.c
> +++ b/drivers/net/mhi/net.c
> @@ -327,7 +327,7 @@ static int mhi_net_probe(struct mhi_device *mhi_dev,
>  	u64_stats_init(&mhi_netdev->stats.tx_syncp);
>  
>  	/* Start MHI channels */
> -	err = mhi_prepare_for_transfer(mhi_dev);
> +	err = mhi_prepare_for_transfer(mhi_dev, 0);
>  	if (err)
>  		goto out_err;
>  
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan_ctrl.c
> index 1bc6b69..1e18420 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -110,7 +110,7 @@ static int mhi_wwan_ctrl_start(struct wwan_port *port)
>  	int ret;
>  
>  	/* Start mhi device's channel(s) */
> -	ret = mhi_prepare_for_transfer(mhiwwan->mhi_dev);
> +	ret = mhi_prepare_for_transfer(mhiwwan->mhi_dev, 0);
>  	if (ret)
>  		return ret;
>  
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 5eb626a..eed949c 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -719,8 +719,13 @@ void mhi_device_put(struct mhi_device *mhi_dev);
>   *                            host and device execution environments match and
>   *                            channels are in a DISABLED state.
>   * @mhi_dev: Device associated with the channels
> + * @flags: MHI channel flags
>   */
> -int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
> +int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
> +			     unsigned int flags);
> +
> +/* Automatically allocate and queue inbound buffers */
> +#define MHI_CH_INBOUND_ALLOC_BUFS BIT(0)
>  
>  /**
>   * mhi_unprepare_from_transfer - Reset UL and DL channels for data transfer.
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index fa61167..29b4fa3 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -79,7 +79,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
>  	int rc;
>  
>  	/* start channels */
> -	rc = mhi_prepare_for_transfer(mhi_dev);
> +	rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
>  	if (rc)
>  		return rc;
>  
> -- 
> 2.7.4
> 
