Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8138F46CF44
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 09:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbhLHIqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 03:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbhLHIqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 03:46:31 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE734C061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 00:42:59 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id s137so1472391pgs.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 00:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1y+dXBcCkVtTTqUS06lctFWwk/nUClDqIvvgzBUxsEM=;
        b=LIedwnSB3H0UrB/1qhz5cKbBUvN7EOy72wHx8PQexHUvdmsILOBfeb3SxU6Kaimmsz
         jplvEmfbojzRNT4Sq80gQv4Zn2oyWSyTcZjzaeUQncC9HjgByiIRong73YIJheMSxxoS
         tzooCnNJKnPYlAhExrGaXKx3xfO5vspUWhFNymWwEwc5vIn5TsQPgCfQ68+ZEbMC9B/n
         vQArdxTvfz70L7OelzyVs2McCtanh+kT3D6VjB25Hq0nTIjWiMm2p7oXDTTaA2Bn9g1P
         0zwf03s5im3OVFobT2S1QrQxxoU5ovok2A8YxGNLhPD1bzlbVgJELuWyQX3FeR1gM80b
         zC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1y+dXBcCkVtTTqUS06lctFWwk/nUClDqIvvgzBUxsEM=;
        b=Qr5SWbmWzq1tff2qekKX2VxkKmN7Yk9tVWSD7Wk2piutuyE/4c7BZ42W6huUhj5wWa
         a5YA7fIaZya242rGiLeAcHSKQ6OXXs0th0sc/ZDcnzIkwc5g0x1actC20+VU6is1FhuT
         7UFj/bz15xMO9lwuHeaxuzMkeel+omeA/Ih2MY95SsEGQHKpazR2vtmABWaXSXxfFoJ6
         hBPUdlwROBlK/WK20wChE1fM+OsMj4nf7GqfHg4NNJ8FSgibY0Jhy5Ol8g+QXPaEzoXd
         5O8VykX5ZZRFD0YsFU4eJWrjPga4UinwJesgIqH2CpWp40HqbkHTBR1hSRl5+PJwBGXy
         BmPw==
X-Gm-Message-State: AOAM530Ma4f00szX80rS56w38no2qDtUR0McVF/5g2pWqhFgxsr7jNbq
        LwH4oSFqAgSu1iIslk6hNATc
X-Google-Smtp-Source: ABdhPJw5E9rmnvj1IAYXO+PiR22Gni2EGztw+NGY2q4aCvVaQbJ4K2NDCeDI38pJOz69bF/QTJOnEQ==
X-Received: by 2002:a63:5954:: with SMTP id j20mr27822286pgm.365.1638952979151;
        Wed, 08 Dec 2021 00:42:59 -0800 (PST)
Received: from thinkpad ([117.202.189.59])
        by smtp.gmail.com with ESMTPSA id lp12sm2002937pjb.24.2021.12.08.00.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 00:42:58 -0800 (PST)
Date:   Wed, 8 Dec 2021 14:12:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, kvalo@codeaurora.org,
        stable@vger.kernel.org, Pengyu Ma <mapengyu@gmail.com>
Subject: Re: [PATCH] bus: mhi: core: Add support for forced PM resume
Message-ID: <20211208084253.GE70121@thinkpad>
References: <20211206161059.107007-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206161059.107007-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 06, 2021 at 09:40:59PM +0530, Manivannan Sadhasivam wrote:
> From: Loic Poulain <loic.poulain@linaro.org>
> 
> For whatever reason, some devices like QCA6390, WCN6855 using ath11k
> are not in M3 state during PM resume, but still functional. The
> mhi_pm_resume should then not fail in those cases, and let the higher
> level device specific stack continue resuming process.
> 
> Add a new parameter to mhi_pm_resume, to force resuming, whatever the
> current MHI state is. This fixes a regression with non functional
> ath11k WiFi after suspend/resume cycle on some machines.
> 
> Bug report: https://bugzilla.kernel.org/show_bug.cgi?id=214179
> 
> Cc: stable@vger.kernel.org #5.13
> Fixes: 020d3b26c07a ("bus: mhi: Early MHI resume failure in non M3 state")
> Reported-by: Kalle Valo <kvalo@codeaurora.org>
> Reported-by: Pengyu Ma <mapengyu@gmail.com>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> [mani: Added comment, bug report, added reported-by tags and CCed stable]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-fixes! Will be submitted for v5.16-rcX.

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/pm.c             | 10 +++++++---
>  drivers/bus/mhi/pci_generic.c         |  2 +-
>  drivers/net/wireless/ath/ath11k/mhi.c |  6 +++++-
>  include/linux/mhi.h                   |  3 ++-
>  4 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index 7464f5d09973..4ddd266e042e 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -881,7 +881,7 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl)
>  }
>  EXPORT_SYMBOL_GPL(mhi_pm_suspend);
>  
> -int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
> +int mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force)
>  {
>  	struct mhi_chan *itr, *tmp;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> @@ -898,8 +898,12 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
>  	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
>  		return -EIO;
>  
> -	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
> -		return -EINVAL;
> +	if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3) {
> +		dev_warn(dev, "Resuming from non M3 state (%s)\n",
> +			 TO_MHI_STATE_STR(mhi_get_mhi_state(mhi_cntrl)));
> +		if (!force)
> +			return -EINVAL;
> +	}
>  
>  	/* Notify clients about exiting LPM */
>  	list_for_each_entry_safe(itr, tmp, &mhi_cntrl->lpm_chans, node) {
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 9ef41354237c..efd1da66fdf9 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -959,7 +959,7 @@ static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
>  		return 0; /* Nothing to do at MHI level */
>  
>  	/* Exit M3, transition to M0 state */
> -	err = mhi_pm_resume(mhi_cntrl);
> +	err = mhi_pm_resume(mhi_cntrl, false);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to resume device: %d\n", err);
>  		goto err_recovery;
> diff --git a/drivers/net/wireless/ath/ath11k/mhi.c b/drivers/net/wireless/ath/ath11k/mhi.c
> index 26c7ae242db6..f1f2fa2d690d 100644
> --- a/drivers/net/wireless/ath/ath11k/mhi.c
> +++ b/drivers/net/wireless/ath/ath11k/mhi.c
> @@ -533,7 +533,11 @@ static int ath11k_mhi_set_state(struct ath11k_pci *ab_pci,
>  		ret = mhi_pm_suspend(ab_pci->mhi_ctrl);
>  		break;
>  	case ATH11K_MHI_RESUME:
> -		ret = mhi_pm_resume(ab_pci->mhi_ctrl);
> +		/* Do force MHI resume as some devices like QCA6390, WCN6855
> +		 * are not in M3 state but they are functional. So just ignore
> +		 * the MHI state while resuming.
> +		 */
> +		ret = mhi_pm_resume(ab_pci->mhi_ctrl, true);
>  		break;
>  	case ATH11K_MHI_TRIGGER_RDDM:
>  		ret = mhi_force_rddm_mode(ab_pci->mhi_ctrl);
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 723985879035..102303288cee 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -660,8 +660,9 @@ int mhi_pm_suspend(struct mhi_controller *mhi_cntrl);
>  /**
>   * mhi_pm_resume - Resume MHI from suspended state
>   * @mhi_cntrl: MHI controller
> + * @force: Force resuming to M0 irrespective of the device MHI state
>   */
> -int mhi_pm_resume(struct mhi_controller *mhi_cntrl);
> +int mhi_pm_resume(struct mhi_controller *mhi_cntrl, bool force);
>  
>  /**
>   * mhi_download_rddm_image - Download ramdump image from device for
> -- 
> 2.25.1
> 
