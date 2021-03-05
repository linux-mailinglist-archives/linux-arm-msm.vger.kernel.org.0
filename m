Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9333632F1AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 18:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhCERqh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 12:46:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbhCERqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 12:46:30 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4B8CC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 09:46:29 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id kx1so2293091pjb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 09:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=73YWHD2Y0ZTh0Umvm3WdLacrriOSCF/8CpYHVQRYmko=;
        b=iLlUoxFDoL/cD9PK9qNNqvZQmC/Cizm6Hq7TTeLTkobiHr2NJRHiSsbcjduRXg9ajk
         IKNHk/tk88mO9o3IUsZXG/yytpltVmty5nS+zQN1Prx0s1MZ2QTpPKyks3b+fSbdPnWr
         /IoeMZBkOEGrhCpKnqNkNZ9iiidIKdkHQk8HtHzpKMMIxXbSD/4jhsS6EaFMYpnIbwWK
         Nhdc0WrykjSNiE1oQDkDVyTAlp5GAy18oNLYt7Jlr6IE0u3UhVkwQfhScbSz4dkAS5Xp
         ruCKf6CSxYSRCaNtHykLR9WnLJ2Mr8w93C3OiGhB7J0mu0RZ6gdODIJ+MNETSWjL7KTm
         d95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=73YWHD2Y0ZTh0Umvm3WdLacrriOSCF/8CpYHVQRYmko=;
        b=G6ivUp1rGnyTG0NhaIktQkyZk2O8gR6Wyt8+tVPjv8PDqUTfEW9gaRKW6tJR17+ydP
         bHEUgNnlQBs3fop6NnzKCmbbhiak6iX+uSMRb2Q2QcJY+kB2kvIgfplKYGKWgJjADSN1
         pX0k2v2Nd32a55+ogJJvQbOfw2uzZHgJ9d+H+oO0voCh2eoMq/vzel0KFjufRzA0Tne7
         gFJTGgZqi99miyZqws8GFdcgcxYwnk2n1T8T7PTKexxyJSrlH1LbDULYeWm0jcudcNt8
         iN8WIEPKW+Qjyp9coagz0KSmZSPYXkimsJJ2Eo5JkvW1+7fhFAH6sBM90wty9cL63JCy
         IMHA==
X-Gm-Message-State: AOAM530HyrSyfoi36NDNfIQWEOcTjdtm5yIchM03+YO8n02AwILscgHA
        mBqEUG2Z3KgYMxkt5dHwSKiG
X-Google-Smtp-Source: ABdhPJyAq+erWt+NKN3bOCcJee1grWMaDwuHO9Z1ixsbhQQHvHwnoVrENSqdUU13AJEIRkHFULIJuA==
X-Received: by 2002:a17:90b:3909:: with SMTP id ob9mr11733333pjb.181.1614966389244;
        Fri, 05 Mar 2021 09:46:29 -0800 (PST)
Received: from thinkpad ([2409:4072:499:950f:3acb:225f:ada0:687])
        by smtp.gmail.com with ESMTPSA id x1sm2761814pje.40.2021.03.05.09.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 09:46:28 -0800 (PST)
Date:   Fri, 5 Mar 2021 23:16:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 6/6] mhi: pci_generic: Add support for runtime PM
Message-ID: <20210305174623.GE2553@thinkpad>
References: <1614948478-2284-1-git-send-email-loic.poulain@linaro.org>
 <1614948478-2284-6-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614948478-2284-6-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 05, 2021 at 01:47:58PM +0100, Loic Poulain wrote:
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
> ---
>  v2: replace force_runtime_suspend/resume via local function to ensure
>      device is always resumed during system resume whatever its runtime
>      pm state.
> 
>  drivers/bus/mhi/pci_generic.c | 95 +++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 86 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 4ab0aa8..e36f5a9 100644
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
> @@ -306,6 +308,11 @@ static void mhi_pci_status_cb(struct mhi_controller *mhi_cntrl,
>  	case MHI_CB_FATAL_ERROR:
>  	case MHI_CB_SYS_ERROR:
>  		dev_warn(&pdev->dev, "firmware crashed (%u)\n", cb);
> +		pm_runtime_forbid(&pdev->dev);
> +		break;
> +	case MHI_CB_EE_MISSION_MODE:
> +		pm_runtime_mark_last_busy(&pdev->dev);

Do you really need to update the last_busy time here? You're already updating it
before each runtime_put() call and those will overwrite this value.

> +		pm_runtime_allow(&pdev->dev);
>  		break;
>  	default:
>  		break;
> @@ -427,13 +434,19 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,

[...]

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
> +		dev_err(&pdev->dev, "failed to suspend device: %d;\n", err);

Remove the semicolon after "%d"

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
> @@ -740,6 +786,13 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
>  	pci_set_master(pdev);
>  	pci_wake_from_d3(pdev, false);
>  
> +	/* It can be a remote wakeup (no mhi runtime_get), update access time */
> +	pm_runtime_mark_last_busy(dev);

I think this should be moved after mhi_pm_resume().

Thanks,
Mani
