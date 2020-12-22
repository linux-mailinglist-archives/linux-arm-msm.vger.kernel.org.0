Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3B1E2E0DA0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 18:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgLVRGT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 12:06:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbgLVRGT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 12:06:19 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA49C0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 09:05:39 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id n10so8739095pgl.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 09:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8pFekqjmibuPZQ82WkNN+HSZ4eim1yhq5NwK1xmzpEs=;
        b=RfsWm+Pv4GbBwAj4JvxYbPL7V7m3t55b0DfouMnNW2og2QCqDMnTMPDe7fvCGQtBgj
         XYJ+DNZKzNU2Vn8a91N2wGlvlYih8upf1t6OfC9j8PG5kN3Dn1DFAmjmTFm/K9jHYvaN
         NZnBdGs/Cohk+lakuY/QvJUkpwPJOsbBIC/Dii5+ZJVG2Vw3IO+SLRuZJLCH4oc6uHDg
         opWnvKAgos8jd7tzMpMVXtgxfn7keqVvQrTlVpwsoeu1zhTOt8FVyCskkbp+ZWp4GtQq
         1u7djHGwlOLRMpyvGk7fUrSKl95nzou/ApGEBSgSaOCZrYJ1RRg46QZAREaJKKGUz+7Y
         fYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8pFekqjmibuPZQ82WkNN+HSZ4eim1yhq5NwK1xmzpEs=;
        b=Z/eJTkK2kCDetpKX1HJVtjqXXyVFmNqqNwkZFiWVmnlQpDEl8SEXdW1pSkemeiGriQ
         wWr7oDOYboWC15a1qVCcDD8z69EGgjVuf9/JgJLceYN8c6KovGIVIKqL17jkurm9LJgG
         kDghnK72qvYzbayUEa8Oefy5Km3LRtMHXD9FFKzb1+ni9pfUXPqbHuoFcdZKPCs6CjpZ
         Vd+1SSyKatZ4CL4E7fi1bVEiXHOG9qaiv+9XcWUvZ02L3U2voU4zmkOvmERRXaQrZRgi
         65FIoMyTNtM+So6GTRfruxM6rYNVCuO4okdnGu/aF64HJQsZiwLsMYBYeYsdVdug91v9
         mclg==
X-Gm-Message-State: AOAM532bmKYMAkN4ACvLxjk3g3YfWG5Y3U8HVN317kcUOT3lwsi7+5eK
        JMXnA9iI/3udpldpLt2XlRcQ
X-Google-Smtp-Source: ABdhPJw4EbWOVUY5yYVcTvHpCxJ4cqpKN99R3dgKVqJxOuuSUXOJxspbxV3tqoN0M4bRXdAHCOuNhQ==
X-Received: by 2002:aa7:9357:0:b029:1a5:43da:b90d with SMTP id 23-20020aa793570000b02901a543dab90dmr20330058pfn.54.1608656738328;
        Tue, 22 Dec 2020 09:05:38 -0800 (PST)
Received: from work ([103.77.37.184])
        by smtp.gmail.com with ESMTPSA id 21sm21150405pfx.84.2020.12.22.09.05.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Dec 2020 09:05:37 -0800 (PST)
Date:   Tue, 22 Dec 2020 22:35:34 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v5 06/10] mhi: pci_generic: Add suspend/resume/recovery
 procedure
Message-ID: <20201222170534.GA18587@work>
References: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
 <1607955937-26951-7-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1607955937-26951-7-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 14, 2020 at 03:25:33PM +0100, Loic Poulain wrote:
> Add support for system wide suspend/resume. During suspend, MHI
> device controller must be put in M3 state and PCI bus in D3 state.
> 
> Add a recovery procedure allowing to reinitialize the device in case
> of error during resume steps, which can happen if device loses power
> (and so its context) while system suspend.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by Hemant Kumar <hemantk@codeaurora.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 102 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 2521cd4..0936701 100644
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
> @@ -313,6 +315,48 @@ static void mhi_pci_runtime_put(struct mhi_controller *mhi_cntrl)
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

These pci state settings seems redundant with resume().

In this function you should first check if MHI is alive, if yes then do
power up. Else you should just exit.

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

Add a debug log for recovery success.

> +
> +	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> +	return;
> +
> +err_unprepare:
> +	mhi_unprepare_after_power_down(mhi_cntrl);
> +err_try_reset:
> +	if (pci_reset_function(pdev))

So if the device recovers, who will make sure reinitializing the MHI
controller? That's why I think we should convey the recovery result to
PM core. I don't think using workqueue here is a good idea.

> +		dev_err(&pdev->dev, "Recovery failed\n");
> +}
> +
>  static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
>  	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> @@ -327,6 +371,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	if (!mhi_pdev)
>  		return -ENOMEM;
>  
> +	INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
> +
>  	mhi_cntrl_config = info->config;
>  	mhi_cntrl = &mhi_pdev->mhi_cntrl;
>  
> @@ -391,6 +437,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>  
> +	cancel_work_sync(&mhi_pdev->recovery_work);
> +
>  	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>  		mhi_power_down(mhi_cntrl, true);
>  		mhi_unprepare_after_power_down(mhi_cntrl);
> @@ -456,12 +504,66 @@ static const struct pci_error_handlers mhi_pci_err_handler = {
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

Did you actually hit this scenario? In the case of power loss or crash, can we
access the MHI register space?

Thanks,
Mani

> +	queue_work(system_long_wq, &mhi_pdev->recovery_work);
> +	return 0;
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
