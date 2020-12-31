Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3BBB2E7E8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 08:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgLaHTE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 02:19:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgLaHTD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 02:19:03 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC083C061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 23:18:23 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id b5so4970769pjk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 23:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3vnSAVjBcpVu415x/HUk4RGD/6gL25cj961KcQVbAP4=;
        b=adZHSmDDofNmYWllwKhIRF6ksRzKom2FAhSjXg8QWsVoKzphqo12HW6aYmc7lw0Yk9
         6iuKJPRXb6wTLbXuLSIEtAxPornNrb21ffYV+2fz5HrJ+Rx4gtLIXLhI2W5hIvWqy4pH
         xHO0EKK37Vm6mHEsFXXJrti/z1B7yhOlpkU/VC+VmrnFgbafeLeLtYiaq1cbmZoOBupi
         ju5ZFniqixHVNXEuWU78pUsUMw13aFEP+xTX1jrEAmHaKxY3cOM8641Zw520ueRAQjOv
         qVJDmDmGstEipH/231Si/gD3IQxZpXwIVnRWtEf0aE10n8lKAJKZwjyih8cKqvuelPsH
         O8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3vnSAVjBcpVu415x/HUk4RGD/6gL25cj961KcQVbAP4=;
        b=KOXOJzJIT3VDpml1cJhfnjWYf2mmjdrpJjVK4bLtj1o4abk5BiNYhVeWENQIQ1a5m1
         bwZKCJqJLTZD/ZLpgABXniGHRqyHXnM9yI22g7DcPDn0qF6qvLfGSn4kkJfoeDlWV2xY
         W4Ox/AAyYhkR90Ns9Xxtye9sitm+APzqkiRuqO+WIMLzLXpTI445tJMEYG6SoCFCZrlO
         nQZcztNQ2oXkLdVKk/ESQ6x0IUGxkP3cGdAvBt5ginSCaGz2J8tmxib40872lIQM4grK
         9ZpFnpzKbTp19UJ94BK/39EqcfYlyJ1wyRcU7DjS56OkHm+KphKqHlJUg9+53xEPGGHG
         072A==
X-Gm-Message-State: AOAM532VwLVXSjh9ahdaOsvwNquRlqr6i/TMKcq7cQvDg9G5m/FN+ESA
        EKYNRUNr4qE/RAIk3p+pjKe6
X-Google-Smtp-Source: ABdhPJyIp2bmH+PXrhRzaWuojOJaTkFGKPHDaB4f4BOpyLcRBsTCCW8QRf9qyVSHKC1DMc17ku4bJw==
X-Received: by 2002:a17:902:848e:b029:dc:b38:98f0 with SMTP id c14-20020a170902848eb02900dc0b3898f0mr32308341plo.82.1609399103071;
        Wed, 30 Dec 2020 23:18:23 -0800 (PST)
Received: from thinkpad ([2409:4072:6d1f:be3b:71a9:d2bf:a32d:897d])
        by smtp.gmail.com with ESMTPSA id y8sm9434796pji.55.2020.12.30.23.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 23:18:22 -0800 (PST)
Date:   Thu, 31 Dec 2020 12:48:16 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org
Subject: Re: [PATCH v6 07/10] mhi: pci_generic: Add PCI error handlers
Message-ID: <20201231071816.GB7345@thinkpad>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
 <1609231431-10048-8-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609231431-10048-8-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 29, 2020 at 09:43:48AM +0100, Loic Poulain wrote:
> In AER capable root complex, errors are reported to the host which
> can then act accordingly and perform PCI recovering procedure.
> 
> This patch enables error reporting and implements error_detected,
> slot_reset and resume callbacks.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by Hemant Kumar <hemantk@codeaurora.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 50 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 3297d95..9fe1e30 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -8,6 +8,7 @@
>   * Copyright (C) 2020 Linaro Ltd <loic.poulain@linaro.org>
>   */
>  
> +#include <linux/aer.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
>  #include <linux/mhi.h>
> @@ -405,6 +406,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	pci_save_state(pdev);
>  	mhi_pdev->pci_state = pci_store_saved_state(pdev);
>  
> +	pci_enable_pcie_error_reporting(pdev);
> +
>  	err = mhi_register_controller(mhi_cntrl, mhi_cntrl_config);
>  	if (err)
>  		return err;
> @@ -501,7 +504,54 @@ static void mhi_pci_reset_done(struct pci_dev *pdev)
>  	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
>  }
>  
> +static pci_ers_result_t mhi_pci_error_detected(struct pci_dev *pdev,
> +					       pci_channel_state_t state)
> +{
> +	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
> +	dev_err(&pdev->dev, "PCI error detected, state = %u\n", state);
> +
> +	if (state == pci_channel_io_perm_failure)
> +		return PCI_ERS_RESULT_DISCONNECT;
> +
> +	/* Clean up MHI state */
> +	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> +		mhi_power_down(mhi_cntrl, false);
> +		mhi_unprepare_after_power_down(mhi_cntrl);
> +	} else {
> +		/* Nothing to do */
> +		return PCI_ERS_RESULT_RECOVERED;
> +	}
> +
> +	pci_disable_device(pdev);
> +
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static pci_ers_result_t mhi_pci_slot_reset(struct pci_dev *pdev)
> +{
> +	if (pci_enable_device(pdev)) {
> +		dev_err(&pdev->dev, "Cannot re-enable PCI device after reset.\n");
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +

This callback will be called after PCI slot reset, so we should also be resetting
the device after enabling it.

Thanks,
Mani

> +	return PCI_ERS_RESULT_RECOVERED;
> +}
> +
> +static void mhi_pci_io_resume(struct pci_dev *pdev)
> +{
> +	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> +
> +	dev_err(&pdev->dev, "PCI slot reset done\n");
> +
> +	queue_work(system_long_wq, &mhi_pdev->recovery_work);
> +}
> +
>  static const struct pci_error_handlers mhi_pci_err_handler = {
> +	.error_detected = mhi_pci_error_detected,
> +	.slot_reset = mhi_pci_slot_reset,
> +	.resume = mhi_pci_io_resume,
>  	.reset_prepare = mhi_pci_reset_prepare,
>  	.reset_done = mhi_pci_reset_done,
>  };
> -- 
> 2.7.4
> 
