Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03D7E2C73AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Nov 2020 23:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387770AbgK1Vtz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Nov 2020 16:49:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731863AbgK1SzZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Nov 2020 13:55:25 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D000C061A51
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 21:59:44 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id l17so5931585pgk.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2020 21:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ByVYG/oef6LX6uQky+tWRBNtmAy1lYSiPTIkzDJcDiE=;
        b=bAA/uNFj8yzzWdlvd3rQv87b4nmrSOg8hESjmNm9XdaGw8r7bvxqfSEz8iFdrOkH9F
         +lXTMsSc4EkOGcE1wupEqkNtx5GrH6eed3NTWrU6E8P7gsZu2IMHqujzeY20ic/MZWbe
         SRWzZ8zrfCi4mY6Wihsusy9VBu3YhtRVSCTWV8S9fj6KV1Ry966kgtP8vGtOEoXbSMIm
         QD8Xn7wdZQDbyEEeP/IFZf4jhfXKhqPDfwB3zKYwY/2vfDNM+Xw/GFNY9I58Gg4PfEag
         hcr2I3u3pJR/s9L9rwusnRDJ2zbIUz341a/BuV3NP+touzn/8qblvUssz1r9moQf2UFU
         YaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ByVYG/oef6LX6uQky+tWRBNtmAy1lYSiPTIkzDJcDiE=;
        b=hB+mPZYORtlctKSiXtil4TV3+rrYjFmL1kQqkBf4i5ti3VBzhUxXY1IMFaPHKveHaZ
         +lI59lg3hEpIySyHWvKbfpBXIzq9s2CQQpjLU41f0NebXkEhSd0xFK9bm6HO/xAE8OSn
         Fnkt0Rq+YRSH/4dUgTH0eKM+xmMsTzSE2B8hYerQdFKSt8vABeNO+Pikun7U3kUpFmQR
         yuk+z2PURBIFUVSiocz8w9ZaiFrKry8LxfqbzwRrxvbI/q3/nBu/V1zAHNT8v5iusFkH
         l7uuYlo8MlRbg7S708BwVAqBqeDHNYwSnIRqeuSg0EQtT68oWypD0Mdx32m2B2aZITae
         N1Dw==
X-Gm-Message-State: AOAM533rMZ13/Zo4Gk57J6jHNYtkpBBbfvdndxagf3T4vjp2CKohLQB4
        TA0OR8z8wiKA3v7bQM7x9QbD
X-Google-Smtp-Source: ABdhPJzKTFe0GbEflRwSNVfF0MMSF/hDzvdGZ4mFYvk9v6GqxzuBchXUjzgoF3tw3SEruu8aU13ObA==
X-Received: by 2002:a62:7ac2:0:b029:18b:c5bb:303d with SMTP id v185-20020a627ac20000b029018bc5bb303dmr10171909pfc.71.1606543183406;
        Fri, 27 Nov 2020 21:59:43 -0800 (PST)
Received: from thinkpad ([2409:4072:15:c612:48ab:f1cc:6b16:2820])
        by smtp.gmail.com with ESMTPSA id c6sm8863791pgl.38.2020.11.27.21.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2020 21:59:42 -0800 (PST)
Date:   Sat, 28 Nov 2020 11:29:36 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org
Subject: Re: [PATCH v3 8/9] mhi: pci_generic: Add health-check
Message-ID: <20201128055936.GF3077@thinkpad>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
 <1606404547-10737-9-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606404547-10737-9-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 26, 2020 at 04:29:06PM +0100, Loic Poulain wrote:
> If the modem crashes for any reason, we may not be able to detect
> it at MHI level (MHI registers not reachable anymore).
> 
> This patch implements a health-check mechanism to check regularly
> that device is alive (MHI layer can communicate with). If device
> is not alive (because a crash or unexpected reset), the recovery
> procedure is triggered.
> 
> Tested successfully with Telit FN980m module.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Bhaumik, Hemant, does this looks reasonable to you? Or we can do a
better job in the MHI stack. To me this is not a specific usecase for
Telit.

If you guys plan to implement it later, I can just apply this patch in
the meantime as it looks good to me.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 3ac5cd2..26c2dfa 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -14,12 +14,15 @@
>  #include <linux/mhi.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/timer.h>
>  #include <linux/workqueue.h>
>  
>  #define MHI_PCI_DEFAULT_BAR_NUM 0
>  
>  #define DEV_RESET_REG (0xB0)
>  
> +#define HEALTH_CHECK_PERIOD (HZ * 5)
> +
>  /**
>   * struct mhi_pci_dev_info - MHI PCI device specific information
>   * @config: MHI controller configuration
> @@ -190,6 +193,7 @@ struct mhi_pci_device {
>  	struct mhi_controller mhi_cntrl;
>  	struct pci_saved_state *pci_state;
>  	struct work_struct recovery_work;
> +	struct timer_list health_check_timer;
>  	unsigned long status;
>  };
>  
> @@ -332,6 +336,8 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>  
>  	dev_warn(&pdev->dev, "device recovery started\n");
>  
> +	del_timer(&mhi_pdev->health_check_timer);
> +
>  	/* Clean up MHI state */
>  	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>  		mhi_power_down(mhi_cntrl, false);
> @@ -355,6 +361,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>  		goto err_unprepare;
>  
>  	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> +	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>  	return;
>  
>  err_unprepare:
> @@ -364,6 +371,21 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>  		dev_err(&pdev->dev, "Recovery failed\n");
>  }
>  
> +static void health_check(struct timer_list *t)
> +{
> +	struct mhi_pci_device *mhi_pdev = from_timer(mhi_pdev, t, health_check_timer);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
> +	if (!mhi_pci_is_alive(mhi_cntrl)) {
> +		dev_err(mhi_cntrl->cntrl_dev, "Device died\n");
> +		queue_work(system_long_wq, &mhi_pdev->recovery_work);
> +		return;
> +	}
> +
> +	/* reschedule in two seconds */
> +	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> +}
> +
>  static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
>  	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> @@ -379,6 +401,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  		return -ENOMEM;
>  
>  	INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
> +	timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
>  
>  	mhi_cntrl_config = info->config;
>  	mhi_cntrl = &mhi_pdev->mhi_cntrl;
> @@ -431,6 +454,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  
>  	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
>  
> +	/* start health check */
> +	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> +
>  	return 0;
>  
>  err_unprepare:
> @@ -446,6 +472,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>  
> +	del_timer(&mhi_pdev->health_check_timer);
>  	cancel_work_sync(&mhi_pdev->recovery_work);
>  
>  	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> @@ -466,6 +493,8 @@ void mhi_pci_reset_prepare(struct pci_dev *pdev)
>  
>  	dev_info(&pdev->dev, "reset\n");
>  
> +	del_timer(&mhi_pdev->health_check_timer);
> +
>  	/* Clean up MHI state */
>  	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>  		mhi_power_down(mhi_cntrl, false);
> @@ -509,6 +538,7 @@ void mhi_pci_reset_done(struct pci_dev *pdev)
>  	}
>  
>  	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
> +	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>  }
>  
>  static pci_ers_result_t mhi_pci_error_detected(struct pci_dev *pdev,
> @@ -569,6 +599,7 @@ int  __maybe_unused mhi_pci_suspend(struct device *dev)
>  	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
>  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>  
> +	del_timer(&mhi_pdev->health_check_timer);
>  	cancel_work_sync(&mhi_pdev->recovery_work);
>  
>  	/* Transition to M3 state */
> @@ -604,6 +635,9 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
>  		goto err_recovery;
>  	}
>  
> +	/* Resume health check */
> +	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
> +
>  	return 0;
>  
>  err_recovery:
> -- 
> 2.7.4
> 
