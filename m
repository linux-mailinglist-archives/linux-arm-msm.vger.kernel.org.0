Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87EC92A0740
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 15:00:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgJ3OAT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 10:00:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJ3OAT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 10:00:19 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0382C0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 07:00:18 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 133so5350807pfx.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2020 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hZYsW1bJY3X+xz9ifCfhfkIEGPwxYuq1A6fq7tc3HCY=;
        b=f8TdQ3ju+kxBb8WN2HDG66Eey+Hlhvmq+fLbzcslusmfUeMmCAcZJg9UxwQbxiPmSC
         6LZ/yZmfIcfTZwrCjlPWaaAlJmr6oVvIsZLolV2ia43paOber4T+QIBcGn9cuNIYOAMY
         qCtSHJ5Gp6uyDypR6wZ96GmpffVKqISk0gQNl9WtLRFkVMOcXtfCpjhz0V7Kq8AxUzp/
         Y2AKH/fRghyixGT0pL22zm5Zzu6wGJp/6K2xzsd7MioqtDOePbVCarrVOTf1q4fo1GHq
         vtBYrFWWkAug9aIIy2bjkyjz86QJLRmIryzQfA7sFyZ0Tk0Lsw53MicOsRj+rjMx8SWl
         hbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hZYsW1bJY3X+xz9ifCfhfkIEGPwxYuq1A6fq7tc3HCY=;
        b=NlkqcbU01ejtjsKpLqsaNJyIP+LcbLtA33CmKAJPVAo7TBDpD1WWNyEnpBGBJL483+
         fYbDDHNIj7BMkmD+JMLBUJWDryWAIMf65p8gYBzclwZaD6EDkTScl58pd4LgyOpe83MF
         vhTu3SMQUhW9VUJY72a8sR3PSpxBjhiuwG03JWNeJAEGktg5tnBnWuwRhCC3N7n7DAvh
         BAn4cCvdZRsIZF37IrbuztbGKMV3gUjJ0nODXJ2VezvQ7cs58ib6bt4ClbC8AvKjw4I8
         XKfCK1dHzYnpJZYdOHMTRCIaWMJ+FQrL22T3FCHGE/6YDy1+7ElEiLarDeSmQTJkp8LP
         3Lxg==
X-Gm-Message-State: AOAM5337ZK5Y1S1BYepy6G1IHJ/iDBwwL9FTC06iVaC7+9PP3EorBwVK
        vPYutx/HzLnmy8x/XPnqb+8K4l+rtIsp
X-Google-Smtp-Source: ABdhPJzmDn9mM/mfSiHCIoxBH6VSbqN90ya0AbeE00EplxdVSVXQsL8bjx2ly+F3kLqNe/0zxCQ0hQ==
X-Received: by 2002:a63:d442:: with SMTP id i2mr2253123pgj.181.1604066418230;
        Fri, 30 Oct 2020 07:00:18 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:918:28fe:10d5:aaf5:e319:ec72])
        by smtp.gmail.com with ESMTPSA id kx6sm2712093pjb.46.2020.10.30.07.00.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 07:00:17 -0700 (PDT)
Date:   Fri, 30 Oct 2020 19:30:11 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/12] bus: mhi: core: Move to an error state on any
 firmware load failure
Message-ID: <20201030140010.GI3818@Mani-XPS-13-9360>
References: <1604031057-32820-1-git-send-email-bbhatt@codeaurora.org>
 <1604031057-32820-7-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604031057-32820-7-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 29, 2020 at 09:10:51PM -0700, Bhaumik Bhatt wrote:
> Move MHI to a firmware download error state for a failure to find
> the firmware files or to load SBL or EBL image using BHI/BHIe. This
> helps detect an error state sooner and shortens the wait for a
> synchronous power up timeout.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/boot.c | 35 ++++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index 7d6b3a7..cec5010 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -425,13 +425,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  						     !mhi_cntrl->seg_len))) {
>  		dev_err(dev,
>  			"No firmware image defined or !sbl_size || !seg_len\n");
> -		return;
> +		goto error_fw_load;
>  	}
>  
>  	ret = request_firmware(&firmware, fw_name, dev);
>  	if (ret) {
>  		dev_err(dev, "Error loading firmware: %d\n", ret);
> -		return;
> +		goto error_fw_load;
>  	}
>  
>  	size = (mhi_cntrl->fbc_download) ? mhi_cntrl->sbl_size : firmware->size;
> @@ -443,7 +443,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	buf = mhi_alloc_coherent(mhi_cntrl, size, &dma_addr, GFP_KERNEL);
>  	if (!buf) {
>  		release_firmware(firmware);
> -		return;
> +		goto error_fw_load;
>  	}
>  
>  	/* Download image using BHI */
> @@ -451,17 +451,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	ret = mhi_fw_load_bhi(mhi_cntrl, dma_addr, size);
>  	mhi_free_coherent(mhi_cntrl, size, buf, dma_addr);
>  
> -	if (!mhi_cntrl->fbc_download || ret || mhi_cntrl->ee == MHI_EE_EDL)
> -		release_firmware(firmware);
> -
>  	/* Error or in EDL mode, we're done */
>  	if (ret) {
>  		dev_err(dev, "MHI did not load image over BHI, ret: %d\n", ret);
> -		return;
> +		release_firmware(firmware);
> +		goto error_fw_load;
>  	}
>  
> -	if (mhi_cntrl->ee == MHI_EE_EDL)
> +	if (mhi_cntrl->ee == MHI_EE_EDL) {
> +		release_firmware(firmware);
>  		return;
> +	}
>  
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	mhi_cntrl->dev_state = MHI_STATE_RESET;
> @@ -474,13 +474,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	if (mhi_cntrl->fbc_download) {
>  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image,
>  					   firmware->size);
> -		if (ret)
> -			goto error_alloc_fw_table;
> +		if (ret) {
> +			release_firmware(firmware);
> +			goto error_fw_load;
> +		}
>  
>  		/* Load the firmware into BHIE vec table */
>  		mhi_firmware_copy(mhi_cntrl, firmware, mhi_cntrl->fbc_image);
>  	}
>  
> +	release_firmware(firmware);
> +
>  fw_load_ee_pthru:
>  	/* Transitioning into MHI RESET->READY state */
>  	ret = mhi_ready_state_transition(mhi_cntrl);
> @@ -509,11 +513,11 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	ret = mhi_fw_load_bhie(mhi_cntrl,
>  			       /* Vector table is the last entry */
>  			       &image_info->mhi_buf[image_info->entries - 1]);
> -	if (ret)
> +	if (ret) {
>  		dev_err(dev, "MHI did not load image over BHIe, ret: %d\n",
>  			ret);
> -
> -	release_firmware(firmware);
> +		goto error_fw_load;
> +	}
>  
>  	return;
>  
> @@ -521,6 +525,7 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
>  	mhi_cntrl->fbc_image = NULL;
>  
> -error_alloc_fw_table:
> -	release_firmware(firmware);
> +error_fw_load:
> +	mhi_cntrl->pm_state = MHI_PM_FW_DL_ERR;
> +	wake_up_all(&mhi_cntrl->state_event);
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
