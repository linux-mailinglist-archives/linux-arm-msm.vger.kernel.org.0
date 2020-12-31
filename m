Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114DA2E7E87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 08:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgLaHGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 02:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgLaHGl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 02:06:41 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC0EC061575
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 23:06:01 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 30so7958440pgr.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 23:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E1O1kD+Pb9knat08sKUrM4PzTbqqUfSWDoIYDq52y4k=;
        b=uK5NKfsbnmWd72Dl/M3eMWGtTWVj4sVlUTtylvjSyN5aPlwfhVC7Oim6nyozJxEMTG
         9+rTWVUV+dY7CRX62cZpyH1Fxi1kB2HLNqiPnBdgY7Fh74U/ZaUQPfj8GaUmpThJI9Fl
         MnZSoi65N7Wfj9sz2dRP+IUFPxdklGl08YKXpNDuo62Em6lY9AWa78s3hyn/pb9s2oge
         2UD5KSYH+68oxyObcOUC7GAf4GSKfVkrsZSo10kHQ90SBtcWm0eoTIsj9t0ARCHOGj0C
         xBpraWkkwtTKBJmZLe5UKJCF1VC+zg5JszLNm0Acp0W2YHXZDVC6xjJeuY6+2aoyT9OC
         asww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E1O1kD+Pb9knat08sKUrM4PzTbqqUfSWDoIYDq52y4k=;
        b=W7rMhJrbP4LEO0taLjiKtZNNqZQ9zBvhPRmN1P8lEDianTcMbXM+p9X80kmVdieOA9
         GhvNJZnrD20sFsf41tZB1LPBULx45LknEtfsflLK+Tq548LN8HFpkim/+HUmZnmqe3Y0
         /dWxN9t7Z0UnK6CukBA7vGe2x2e8OytWiw830X92oeAVvShac2+gFz8X8EAoBuyZ2C9P
         roxPB28WQ1i35boglht+R4DwDL8KOCt7FRV/n/qNTWA0bbnhaudTm+HA1MjdyFcguYTa
         oqL3yu7tiZOGfY6EKg1jEUTIm9TE0umRCqtfGI9jhl0+0OEeJjD0eGxRRwGfM7qeGr3u
         Pc/g==
X-Gm-Message-State: AOAM531ZXL+EpvkXDK2Zi+WLGQB1DrQ4wiLS+VM7LGogQfrredJ0Fpya
        bqHLrmA2BQMmAmfkM0qEDMLZCT5ZI2FS
X-Google-Smtp-Source: ABdhPJzRhzTIKhIz0t6zWqmTffCNw6Tjm0UqEeAdgJLQjAi771j50xUWRUW22M/9dDJRLAkS+yCniQ==
X-Received: by 2002:a63:e442:: with SMTP id i2mr43067556pgk.12.1609398360827;
        Wed, 30 Dec 2020 23:06:00 -0800 (PST)
Received: from thinkpad ([2409:4072:6d1f:be3b:71a9:d2bf:a32d:897d])
        by smtp.gmail.com with ESMTPSA id z3sm4210921pfb.157.2020.12.30.23.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 23:05:59 -0800 (PST)
Date:   Thu, 31 Dec 2020 12:35:53 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org
Subject: Re: [PATCH v6 06/10] mhi: pci_generic: Add suspend/resume/recovery
 procedure
Message-ID: <20201231070553.GA7345@thinkpad>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
 <1609231431-10048-7-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609231431-10048-7-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 29, 2020 at 09:43:47AM +0100, Loic Poulain wrote:
> Add support for system wide suspend/resume. During suspend, MHI
> device controller must be put in M3 state and PCI bus in D3 state.
> 
> Add a recovery procedure allowing to reinitialize the device in case
> of error during resume steps, which can happen if device loses power
> (and so its context) while system suspend.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 105 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 105 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 2521cd4..3297d95 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -13,6 +13,7 @@
>  #include <linux/mhi.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/workqueue.h>
>  
>  #define MHI_PCI_DEFAULT_BAR_NUM 0
>  
> @@ -186,6 +187,7 @@ enum mhi_pci_device_status {
>  struct mhi_pci_device {
>  	struct mhi_controller mhi_cntrl;
>  	struct pci_saved_state *pci_state;
> +	struct work_struct recovery_work;
>  	unsigned long status;
>  };
>  
> @@ -313,6 +315,50 @@ static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
>  	/* no PM for now */
>  }
>  
> +static void mhi_pci_recovery_work(struct work_struct *work)
> +{
> +	struct mhi_pci_device *mhi_pdev = container_of(work, struct mhi_pci_device,
> +						       recovery_work);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
> +	int err;
> +
> +	dev_warn(&pdev->dev, "device recovery started\n");
> +
> +	/* Clean up MHI state */
> +	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> +		mhi_power_down(mhi_cntrl, false);
> +		mhi_unprepare_after_power_down(mhi_cntrl);
> +	}
> +
> +	/* Check if we can recover without full reset */
> +	pci_set_power_state(pdev, PCI_D0);
> +	pci_load_saved_state(pdev, mhi_pdev->pci_state);
> +	pci_restore_state(pdev);
> +
> +	if (!mhi_pci_is_alive(mhi_cntrl))
> +		goto err_try_reset;
> +
> +	err = mhi_prepare_for_power_up(mhi_cntrl);
> +	if (err)
> +		goto err_try_reset;
> +
> +	err = mhi_sync_power_up(mhi_cntrl);
> +	if (err)
> +		goto err_unprepare;
> +
> +	dev_dbg(&pdev->dev, "Recovery completed\n");
> +
> +	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> +	return;
> +
> +err_unprepare:
> +	mhi_unprepare_after_power_down(mhi_cntrl);
> +err_try_reset:
> +	if (pci_reset_function(pdev))
> +		dev_err(&pdev->dev, "Recovery failed\n");
> +}
> +
>  static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
>  	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> @@ -327,6 +373,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	if (!mhi_pdev)
>  		return -ENOMEM;
>  
> +	INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
> +
>  	mhi_cntrl_config = info->config;
>  	mhi_cntrl = &mhi_pdev->mhi_cntrl;
>  
> @@ -391,6 +439,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>  
> +	cancel_work_sync(&mhi_pdev->recovery_work);
> +
>  	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>  		mhi_power_down(mhi_cntrl, true);
>  		mhi_unprepare_after_power_down(mhi_cntrl);
> @@ -456,12 +506,67 @@ static const struct pci_error_handlers mhi_pci_err_handler = {
>  	.reset_done = mhi_pci_reset_done,
>  };
>  
> +static int  __maybe_unused mhi_pci_suspend(struct device *dev)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
> +	cancel_work_sync(&mhi_pdev->recovery_work);
> +
> +	/* Transition to M3 state */
> +	mhi_pm_suspend(mhi_cntrl);
> +
> +	pci_save_state(pdev);
> +	pci_disable_device(pdev);
> +	pci_wake_from_d3(pdev, true);
> +	pci_set_power_state(pdev, PCI_D3hot);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mhi_pci_resume(struct device *dev)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +	int err;
> +
> +	pci_set_power_state(pdev, PCI_D0);
> +	pci_restore_state(pdev);
> +	pci_set_master(pdev);
> +
> +	err = pci_enable_device(pdev);
> +	if (err)
> +		goto err_recovery;
> +
> +	/* Exit M3, transition to M0 state */
> +	err = mhi_pm_resume(mhi_cntrl);
> +	if (err) {
> +		dev_err(&pdev->dev, "failed to resume device: %d\n", err);
> +		goto err_recovery;
> +	}
> +
> +	return 0;
> +
> +err_recovery:
> +	/* The device may have loose power or crashed, try recovering it */
> +	queue_work(system_long_wq, &mhi_pdev->recovery_work);
> +
> +	return err;
> +}
> +
> +static const struct dev_pm_ops mhi_pci_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(mhi_pci_suspend, mhi_pci_resume)
> +};
> +
>  static struct pci_driver mhi_pci_driver = {
>  	.name		= "mhi-pci-generic",
>  	.id_table	= mhi_pci_id_table,
>  	.probe		= mhi_pci_probe,
>  	.remove		= mhi_pci_remove,
>  	.err_handler	= &mhi_pci_err_handler,
> +	.driver.pm	= &mhi_pci_pm_ops
>  };
>  module_pci_driver(mhi_pci_driver);
>  
> -- 
> 2.7.4
> 
