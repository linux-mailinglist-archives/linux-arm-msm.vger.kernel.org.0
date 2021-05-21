Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E82238C677
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 14:26:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbhEUM2L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 08:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbhEUM2L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 08:28:11 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47365C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 05:26:47 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id lx17-20020a17090b4b11b029015f3b32b8dbso5473401pjb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 05:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Csk8hKUMa+5Et5itcBQWoNQLI4gYvZEIrXXafl4TqGg=;
        b=Bgj183kE2DBn5BKBao7eYaJMKbLyCq6um30CO1F3WrXrjBEsKnqbiBQ1EUMzT6qi85
         jyOQ5WazKAf/Ym5NAkQRuJaBPWqVO2PBeXOa661xuVvX32YiaD4x5f38rzNXZAdLjX71
         ezbp8L7SHeW8+eLdRgH1Kz2momUpT9FhogDYRq5YeNQImHbXqwiQrAyALnpc9gtAv2u9
         JMULwn1hm+lypdgpfJLpTxYgaDSzht8uNJ5ZD1F2m5FlCZCTZsgivARD+/SSauzvp6HB
         mq4b4gv7qYaBSFOB6OL75qSDPuyR6aEGASlSxKuxmTCjMYwhogyL5p17EUP/h7CsILNe
         6G9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Csk8hKUMa+5Et5itcBQWoNQLI4gYvZEIrXXafl4TqGg=;
        b=MyeUVWcq5BR3pSXEU1ItEhWLPJRm2jQJZfnOtTuNGpWqUFU2uB0lKO2ElAefeWX5xn
         DfJq1QrBw5gb23ppvGAWUT4TkfMgAyaXlM5wQ72Jf5mlK8YQA9xLxfRpZ95lgjFxoooH
         895PV70105ItNftslbXebQAwh3nbOkhD2VyaOVkdY2ZGziEqUe3qbtyVsM8+lomRnWPX
         xvVYAxq+lclRpb/HnZ3uffGPy9J9luo34KxBc0aKERXZqjQ/JxmTlvz7r0QE9g77asw6
         wnQa3h5yEIU96GVIV+pvgad8QDV4YO/cSB35uId5ZkgybW+5KKc44HaUMBmfdwmkOvSM
         hnPQ==
X-Gm-Message-State: AOAM531cSsun3CL9mJ7G0Kr7vgjSAYKFRbf6WktSpf3o0TNYQNJFIsVu
        Oazlxs3sa0QFbO+JWJGrO/Lg
X-Google-Smtp-Source: ABdhPJy+Ay+FkSi56uavpCuBxN3f6XBffdlZ6SewkwaFjPMKaVYMd591ufFG7K59ugZVzsCUMFwlcQ==
X-Received: by 2002:a17:902:dcce:b029:ef:339:fa6a with SMTP id t14-20020a170902dcceb02900ef0339fa6amr11814248pll.24.1621600006635;
        Fri, 21 May 2021 05:26:46 -0700 (PDT)
Received: from thinkpad ([2409:4072:6c82:5c6a:750f:c379:b616:3e44])
        by smtp.gmail.com with ESMTPSA id n30sm4592889pgd.8.2021.05.21.05.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 05:26:45 -0700 (PDT)
Date:   Fri, 21 May 2021 17:56:41 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RESEND PATCH] bus: mhi: Add inbound buffers allocation flag
Message-ID: <20210521122641.GD70095@thinkpad>
References: <1617814235-25634-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617814235-25634-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 07, 2021 at 06:50:35PM +0200, Loic Poulain wrote:
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

You need to modify the API in WWAN driver as well. With that,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/internal.h |  2 +-
>  drivers/bus/mhi/core/main.c     | 11 ++++++++---
>  drivers/net/mhi/net.c           |  2 +-
>  include/linux/mhi.h             | 12 +++++++++++-
>  net/qrtr/mhi.c                  |  2 +-
>  5 files changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
> index 5b9ea66..672052f 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -682,7 +682,7 @@ void mhi_rddm_prepare(struct mhi_controller *mhi_cntrl,
>  		      struct image_info *img_info);
>  void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
>  int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
> -			struct mhi_chan *mhi_chan);
> +			struct mhi_chan *mhi_chan, enum mhi_chan_flags flags);
>  int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
>  		       struct mhi_chan *mhi_chan);
>  void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 0f1febf..432b53b 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1384,7 +1384,8 @@ static void mhi_unprepare_channel(struct mhi_controller *mhi_cntrl,
>  }
>  
>  int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
> -			struct mhi_chan *mhi_chan)
> +			struct mhi_chan *mhi_chan,
> +			enum mhi_chan_flags flags)
>  {
>  	int ret = 0;
>  	struct device *dev = &mhi_chan->mhi_dev->dev;
> @@ -1409,6 +1410,9 @@ int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
>  	if (ret)
>  		goto error_pm_state;
>  
> +	if (mhi_chan->dir == DMA_FROM_DEVICE)
> +		mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
> +
>  	/* Pre-allocate buffer for xfer ring */
>  	if (mhi_chan->pre_alloc) {
>  		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
> @@ -1555,7 +1559,8 @@ void mhi_reset_chan(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan)
>  }
>  
>  /* Move channel to start state */
> -int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
> +int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
> +			     enum mhi_chan_flags flags)
>  {
>  	int ret, dir;
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> @@ -1566,7 +1571,7 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
>  		if (!mhi_chan)
>  			continue;
>  
> -		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan);
> +		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan, flags);
>  		if (ret)
>  			goto error_open_chan;
>  	}
> diff --git a/drivers/net/mhi/net.c b/drivers/net/mhi/net.c
> index 5ec7a29..06e1455 100644
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
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index d095fba..9372acf 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -60,6 +60,14 @@ enum mhi_flags {
>  };
>  
>  /**
> + * enum mhi_chan_flags - MHI channel flags
> + * @MHI_CH_INBOUND_ALLOC_BUFS: Automatically allocate and queue inbound buffers
> + */
> +enum mhi_chan_flags {
> +	MHI_CH_INBOUND_ALLOC_BUFS = BIT(0),
> +};
> +
> +/**
>   * enum mhi_device_type - Device types
>   * @MHI_DEVICE_XFER: Handles data transfer
>   * @MHI_DEVICE_CONTROLLER: Control device
> @@ -719,8 +727,10 @@ void mhi_device_put(struct mhi_device *mhi_dev);
>   *                            host and device execution environments match and
>   *                            channels are in a DISABLED state.
>   * @mhi_dev: Device associated with the channels
> + * @flags: MHI channel flags
>   */
> -int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
> +int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
> +			     enum mhi_chan_flags flags);
>  
>  /**
>   * mhi_unprepare_from_transfer - Reset UL and DL channels for data transfer.
> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
> index 2bf2b19..47afded 100644
> --- a/net/qrtr/mhi.c
> +++ b/net/qrtr/mhi.c
> @@ -77,7 +77,7 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
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
