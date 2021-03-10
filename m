Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5461E333F6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 14:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbhCJNih (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 08:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbhCJNiW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 08:38:22 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBBE9C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:38:22 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id l7so12105773pfd.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 05:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bNXn0djQjCeguEVQqS7GnSNZ17LVGwXum0wTCOLGY0g=;
        b=Sa+ktQS3B4mIF2YYbsqlTqrvEoiBQzyjLbDTtUmjVD6vHu1e3Znrs2sL6KlcPw0R2a
         i/Yq513xfNDsuwe/hq5dVkrUlKxOsDAFT4GJBaQp5Nzp3+E9EZibhJjBIOb+Rl4tlfXC
         aZcIMnSJGObT5aHKLfMJWv9Ej2MvevCv6wpnGGZvEUMMcc2MUSZVzS2G6fDpPu3BYTL7
         wiLYdz3PoA2LKIHqykkcYIo5lgOzOLiG7ZScy2JSsN28OOW342Z7mr6HJlk3A6XtRpso
         BJLtq1a9EdSOjakgGgU3F8hnWrKHwAzIf31pYo9hT8+bGit+Ti7DJhtzcmXNcoTrZohg
         /UtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bNXn0djQjCeguEVQqS7GnSNZ17LVGwXum0wTCOLGY0g=;
        b=KB25FRGshOZW4G3Zm8TIX6OvoiEUz1o0GX4MPRUPIdcB5XL9BIMFhUODaXwQjctEow
         STKBJt2pil1vWBOtoOwYnTokm4C4Gz8yOjsz6/cWEMBPKbZzpputTZ3SyDiVbIOrnN7j
         M8qG+L5gkfr3HH9b1FnbEylsF56i47PXn8EhD5PhG/box0uleLX1X4rkqaJzz3j9LXqj
         5oxVyIB56Qzmj1h39DGRcEMwJ/kxcdlOgke1QgdAFawftLHKIFCrWRYQZGY9UTmYf/bp
         0jHgvF07/pgq3ChrNXWsl7bK2jG0a5UNHUHFYA1gQ0zRyzwZfmMVIfQjMXBpSendiQSs
         J/Mw==
X-Gm-Message-State: AOAM531vvFQrAup1qhnTRI3Uho9TEgKc5XWDhLl3masUu4q7H24jvWYG
        lWpyFTg4/Jz0VwerA29HEDgf
X-Google-Smtp-Source: ABdhPJxhFOEVT1lxS6XUEfzKqGOpd753OImFSyW/fIUwGiC79ctXzofSQX0Bi7cDSGcWHQtiLKl0tg==
X-Received: by 2002:a63:4462:: with SMTP id t34mr2776606pgk.389.1615383502202;
        Wed, 10 Mar 2021 05:38:22 -0800 (PST)
Received: from thinkpad ([103.66.79.59])
        by smtp.gmail.com with ESMTPSA id 132sm16488053pfu.158.2021.03.10.05.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 05:38:21 -0800 (PST)
Date:   Wed, 10 Mar 2021 19:08:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] mhi: pci_generic: Add support for runtime PM
Message-ID: <20210310133818.GH30275@thinkpad>
References: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
 <1614971808-22156-6-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614971808-22156-6-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 08:16:48PM +0100, Loic Poulain wrote:
> When the device is idle it is possible to move it into the lowest MHI
> PM state (M3). In that mode, all MHI operations are suspended and the
> PCI device can be safely put into PCI D3 state.
> 
> The device is then resumed from D3/M3 either because of host initiated
> MHI operation (e.g. buffer TX) or because the device (modem) has
> triggered wake-up via PME feature (e.g. on incoming data).
> 
> Same procedures can be used for system wide or runtime suspend/resume.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>   v2: replace force_runtime_suspend/resume via local function to ensure
>      device is always resumed during system resume whatever its runtime
>      pm state.
>   v3: - remove extra mark_last_busy
>       - move mark_last_busy after mhi_pm_suspend
>       - remove terminal semicolon from print
> 
>  drivers/bus/mhi/pci_generic.c | 95 +++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 86 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 4ab0aa8..92ab9bb 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -14,6 +14,7 @@
>  #include <linux/mhi.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/timer.h>
>  #include <linux/workqueue.h>
>  
> @@ -274,6 +275,7 @@ MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
>  
>  enum mhi_pci_device_status {
>  	MHI_PCI_DEV_STARTED,
> +	MHI_PCI_DEV_SUSPENDED,
>  };
>  
>  struct mhi_pci_device {
> @@ -306,6 +308,10 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>  	case MHI_CB_FATAL_ERROR:
>  	case MHI_CB_SYS_ERROR:
>  		dev_warn(&pdev->dev, "firmware crashed (%u)\n", cb);
> +		pm_runtime_forbid(&pdev->dev);
> +		break;
> +	case MHI_CB_EE_MISSION_MODE:
> +		pm_runtime_allow(&pdev->dev);
>  		break;
>  	default:
>  		break;
> @@ -427,13 +433,19 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
>  
>  static int mhi_pci_runtime_get(struct mhi_controller *mhi_cntrl)
>  {
> -	/* no PM for now */
> -	return 0;
> +	/* The runtime_get() MHI callback means:
> +	 *    Do whatever is requested to leave M3.
> +	 */
> +	return pm_runtime_get(mhi_cntrl->cntrl_dev);
>  }
>  
>  static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
>  {
> -	/* no PM for now */
> +	/* The runtime_put() MHI callback means:
> +	 *    Device can be moved in M3 state.
> +	 */
> +	pm_runtime_mark_last_busy(mhi_cntrl->cntrl_dev);
> +	pm_runtime_put(mhi_cntrl->cntrl_dev);
>  }
>  
>  static void mhi_pci_recovery_work(struct work_struct *work)
> @@ -447,6 +459,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>  	dev_warn(&pdev->dev, "device recovery started\n");
>  
>  	del_timer(&mhi_pdev->health_check_timer);
> +	pm_runtime_forbid(&pdev->dev);
>  
>  	/* Clean up MHI state */
>  	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> @@ -454,7 +467,6 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>  		mhi_unprepare_after_power_down(mhi_cntrl);
>  	}
>  
> -	/* Check if we can recover without full reset */
>  	pci_set_power_state(pdev, PCI_D0);
>  	pci_load_saved_state(pdev, mhi_pdev->pci_state);
>  	pci_restore_state(pdev);
> @@ -488,6 +500,10 @@ static void health_check(struct timer_list *t)
>  	struct mhi_pci_device *mhi_pdev = from_timer(mhi_pdev, t, health_check_timer);
>  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>  
> +	if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
> +			test_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
> +		return;
> +
>  	if (!mhi_pci_is_alive(mhi_cntrl)) {
>  		dev_err(mhi_cntrl->cntrl_dev, "Device died\n");
>  		queue_work(system_long_wq, &mhi_pdev->recovery_work);
> @@ -575,6 +591,14 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	/* start health check */
>  	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>  
> +	/* Only allow runtime-suspend if PME capable (for wakeup) */
> +	if (pci_pme_capable(pdev, PCI_D3hot)) {
> +		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
> +		pm_runtime_use_autosuspend(&pdev->dev);
> +		pm_runtime_mark_last_busy(&pdev->dev);
> +		pm_runtime_put_noidle(&pdev->dev);
> +	}
> +
>  	return 0;
>  
>  err_unprepare:
> @@ -598,6 +622,10 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  		mhi_unprepare_after_power_down(mhi_cntrl);
>  	}
>  
> +	/* balancing probe put_noidle */
> +	if (pci_pme_capable(pdev, PCI_D3hot))
> +		pm_runtime_get_noresume(&pdev->dev);
> +
>  	mhi_unregister_controller(mhi_cntrl);
>  }
>  
> @@ -708,31 +736,48 @@ static const struct pci_error_handlers mhi_pci_err_handler = {
>  	.reset_done = mhi_pci_reset_done,
>  };
>  
> -static int  __maybe_unused mhi_pci_suspend(struct device *dev)
> +static int  __maybe_unused mhi_pci_runtime_suspend(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
>  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +	int err;
> +
> +	if (test_and_set_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
> +		return 0;
>  
>  	del_timer(&mhi_pdev->health_check_timer);
>  	cancel_work_sync(&mhi_pdev->recovery_work);
>  
> +	if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
> +			mhi_cntrl->ee != MHI_EE_AMSS)
> +		goto pci_suspend; /* Nothing to do at MHI level */
> +
>  	/* Transition to M3 state */
> -	mhi_pm_suspend(mhi_cntrl);
> +	err = mhi_pm_suspend(mhi_cntrl);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to suspend device: %d\n", err);
> +		clear_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status);
> +		return -EBUSY;
> +	}
>  
> +pci_suspend:
>  	pci_disable_device(pdev);
>  	pci_wake_from_d3(pdev, true);
>  
>  	return 0;
>  }
>  
> -static int __maybe_unused mhi_pci_resume(struct device *dev)
> +static int __maybe_unused mhi_pci_runtime_resume(struct device *dev)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev);
>  	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
>  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>  	int err;
>  
> +	if (!test_and_clear_bit(MHI_PCI_DEV_SUSPENDED, &mhi_pdev->status))
> +		return 0;
> +
>  	err = pci_enable_device(pdev);
>  	if (err)
>  		goto err_recovery;
> @@ -740,6 +785,10 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
>  	pci_set_master(pdev);
>  	pci_wake_from_d3(pdev, false);
>  
> +	if (!test_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status) ||
> +			mhi_cntrl->ee != MHI_EE_AMSS)
> +		return 0; /* Nothing to do at MHI level */
> +
>  	/* Exit M3, transition to M0 state */
>  	err = mhi_pm_resume(mhi_cntrl);
>  	if (err) {
> @@ -750,16 +799,44 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
>  	/* Resume health check */
>  	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>  
> +	/* It can be a remote wakeup (no mhi runtime_get), update access time */
> +	pm_runtime_mark_last_busy(dev);
> +
>  	return 0;
>  
>  err_recovery:
> -	/* The device may have loose power or crashed, try recovering it */
> +	/* Do not fail to not mess up our PCI device state, the device likely
> +	 * lost power (d3cold) and we simply need to reset it from the recovery
> +	 * procedure, trigger the recovery asynchronously to prevent system
> +	 * suspend exit delaying.
> +	 */
>  	queue_work(system_long_wq, &mhi_pdev->recovery_work);
> +	pm_runtime_mark_last_busy(dev);
>  
> -	return err;
> +	return 0;
> +}
> +
> +static int  __maybe_unused mhi_pci_suspend(struct device *dev)
> +{
> +	pm_runtime_disable(dev);
> +	return mhi_pci_runtime_suspend(dev);
> +}
> +
> +static int __maybe_unused mhi_pci_resume(struct device *dev)
> +{
> +	int ret;
> +
> +	/* Depending the platform, device may have lost power (d3cold), we need
> +	 * to resume it now to check its state and recover when necessary.
> +	 */
> +	ret = mhi_pci_runtime_resume(dev);
> +	pm_runtime_enable(dev);
> +
> +	return ret;
>  }
>  
>  static const struct dev_pm_ops mhi_pci_pm_ops = {
> +	SET_RUNTIME_PM_OPS(mhi_pci_runtime_suspend, mhi_pci_runtime_resume, NULL)
>  	SET_SYSTEM_SLEEP_PM_OPS(mhi_pci_suspend, mhi_pci_resume)
>  };
>  
> -- 
> 2.7.4
> 
