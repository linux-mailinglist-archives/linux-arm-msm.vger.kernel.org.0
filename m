Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2601CBDF0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2020 07:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728863AbgEIFuv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 May 2020 01:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbgEIFuu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 May 2020 01:50:50 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE6A7C061A0C
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2020 22:50:50 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id y6so5265438pjc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2020 22:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mXjA0nvURjy8PRGkk87+AxvIoUVbdSXQcxu6xPodlzo=;
        b=fONoQbPXjYw8KBK+TSQXOs7370DHN6pOCSf6rkWLOGCqvix/OwIkrWu5FNYG9MSNcI
         1R2/ABoRhMZmu9SWuyCFbagzDjXNoTQ6P5vAwkhfxvf038dR6tsf5e16UzLmWgFu6gIP
         6YvLxH5tR4vl0WBYKOxAL4c5g4Tr8+qiI1s1NqnjpcqmFgmwUJdkW3AcFdJZrogcEAfL
         FhLrb1WSzX2odfVRjDzS1f9VZjktBg6neGmg+c4zzu1kXCVR3DvB0Gzphi1JO1U6VP/5
         c1Xhfdwwcim4pAMNcc4OyJVU1mhfHHni9n9USSIwTiDmVjjFmOQc0U/2Hm2HNzCTaNrX
         9ROg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mXjA0nvURjy8PRGkk87+AxvIoUVbdSXQcxu6xPodlzo=;
        b=VWczu5l4Ken/DCVw2hTN6Wqt6eCKUoRRfJ659dmpa8Xum8Jdw27GLKtMQFLbHLQcqo
         JF7eibELJSbTpjGf+hGeTu00OodNwZ30WPdgMsHV3gC8GH5MmRBEkfNujE56gpi/ujr6
         tNJjnDvILyKR6SN10zgN8dybwTkSUA/FmyjA2lUrzgUBc5HBxKTVJItXVZsuwy8AmOfG
         Uipfbu9+/frtdFuI8C+TyjAIKPUerg6+hLAw4okGOxHlQFCCJU3HX3+Qe755bCkYz4Dt
         TkVJtGO2ZJbeq/K333zysrBTL6MPF+TJjnhTR30+izP2bHzxqG4BPUcCTafvq1tyIvcJ
         Kf0Q==
X-Gm-Message-State: AGi0Puaq2b/KUmU8HVLAbktIpyZ0SFXvYRuP5tktNjdRn67CSxWsjZSb
        uvpl+4ryUOnXf6S3cpc9fivf
X-Google-Smtp-Source: APiQypLrvYfdntso+IhuvO5moRh1EiueSkMW2u2QMmP8NqvGG8v3e/kOdObLGnxqDIH1rkA6d2VjWQ==
X-Received: by 2002:a17:90b:3598:: with SMTP id mm24mr8912558pjb.132.1589003450259;
        Fri, 08 May 2020 22:50:50 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e0c:55d2:2cb4:da01:ad1e:6ad9])
        by smtp.gmail.com with ESMTPSA id nu10sm4149407pjb.9.2020.05.08.22.50.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 May 2020 22:50:49 -0700 (PDT)
Date:   Sat, 9 May 2020 11:20:43 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org
Subject: Re: [PATCH v7 7/8] bus: mhi: core: Improve debug logs for loading
 firmware
Message-ID: <20200509055043.GG5845@Mani-XPS-13-9360>
References: <1588991208-26928-1-git-send-email-bbhatt@codeaurora.org>
 <1588991208-26928-8-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588991208-26928-8-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 08, 2020 at 07:26:47PM -0700, Bhaumik Bhatt wrote:
> Add log messages to track boot flow errors and timeouts in SBL or AMSS
> firmware loading to aid in debug.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/boot.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index cf6dc5a..80e4d76 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -121,7 +121,8 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
>  		ee = mhi_get_exec_env(mhi_cntrl);
>  	}
>  
> -	dev_dbg(dev, "Waiting for image download completion, current EE: %s\n",
> +	dev_dbg(dev,
> +		"Waiting for RDDM image download via BHIe, current EE:%s\n",
>  		TO_MHI_EXEC_STR(ee));
>  
>  	while (retry--) {
> @@ -152,11 +153,14 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
>  int mhi_download_rddm_img(struct mhi_controller *mhi_cntrl, bool in_panic)
>  {
>  	void __iomem *base = mhi_cntrl->bhie;
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	u32 rx_status;
>  
>  	if (in_panic)
>  		return __mhi_download_rddm_in_panic(mhi_cntrl);
>  
> +	dev_dbg(dev, "Waiting for RDDM image download via BHIe\n");
> +
>  	/* Wait for the image download to complete */
>  	wait_event_timeout(mhi_cntrl->state_event,
>  			   mhi_read_reg_field(mhi_cntrl, base,
> @@ -174,6 +178,7 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
>  			    const struct mhi_buf *mhi_buf)
>  {
>  	void __iomem *base = mhi_cntrl->bhie;
> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
>  	u32 tx_status, sequence_id;
>  	int ret;
> @@ -184,6 +189,7 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
>  		return -EIO;
>  	}
>  
> +	dev_dbg(dev, "Starting AMSS download via BHIe\n");
>  	mhi_write_reg(mhi_cntrl, base, BHIE_TXVECADDR_HIGH_OFFS,
>  		      upper_32_bits(mhi_buf->dma_addr));
>  
> @@ -435,7 +441,12 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  		release_firmware(firmware);
>  
>  	/* Error or in EDL mode, we're done */
> -	if (ret || mhi_cntrl->ee == MHI_EE_EDL)
> +	if (ret) {
> +		dev_err(dev, "MHI did not load SBL, ret:%d\n", ret);
> +		return;
> +	}
> +
> +	if (mhi_cntrl->ee == MHI_EE_EDL)
>  		return;
>  
>  	write_lock_irq(&mhi_cntrl->pm_lock);
> @@ -463,8 +474,10 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	if (!mhi_cntrl->fbc_download)
>  		return;
>  
> -	if (ret)
> +	if (ret) {
> +		dev_err(dev, "MHI did not enter READY state\n");
>  		goto error_read;
> +	}
>  
>  	/* Wait for the SBL event */
>  	ret = wait_event_timeout(mhi_cntrl->state_event,
> @@ -482,6 +495,8 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	ret = mhi_fw_load_amss(mhi_cntrl,
>  			       /* Vector table is the last entry */
>  			       &image_info->mhi_buf[image_info->entries - 1]);
> +	if (ret)
> +		dev_err(dev, "MHI did not load AMSS, ret:%d\n", ret);
>  
>  	release_firmware(firmware);
>  
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
