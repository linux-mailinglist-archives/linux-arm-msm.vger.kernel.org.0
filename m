Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB4E2E9878
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 16:28:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727270AbhADP12 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 10:27:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727098AbhADP12 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 10:27:28 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE7DC061794
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 07:26:47 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id 30so14553056pgr.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 07:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+N4sEC1CIVl/u5T3HoO0e+fWt5MgQzWfDd3WDdfztbg=;
        b=szfJOos41ZNKNBCdsQC0vLV94sCpqZcBe9ZrGcJy4GmLGAL1kdQd7teuDsPJTAqC6F
         nWOhpdpyibggJrt0Gtmg3YqwaGlhp0iwFg84232r+qZIcvo3WNVzETBD1XUjeDHhMLPk
         pY5WZnz2iETmWCBwlwsV2HeusZXPCJRlNAp9uYK0db7KpBhiY2fByMZXK844I95pej5F
         m84aFAoi7HVxj9aBnDFi2iyAKInhgZdFdWhlA2ap0/fYjCqLzJ6BVOhNl++l5tiL4gjt
         +4md6yXjkRZcFV52q/FW6haG+VNV37rW5672lE9ctS3bHjciRpYRuKsxgjGBZb3SCT82
         YD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+N4sEC1CIVl/u5T3HoO0e+fWt5MgQzWfDd3WDdfztbg=;
        b=TE3FHG41ZTEeoXaTLxi5k+Nu80E7qD3O59XrHfTKkQ+ggoJEXLkqK/KXh7y8LTNi+E
         oGKokMy4fjeFM0QMQBl0mlLR4CshsmNvUTJshyPHbwk1W3DxufxKxpqx/oVWlAixv8GI
         PHKfUd6sQLxhiBm/tsiHS/k12q+1iHYztNBUjVulUfuLakxrcbbbDQFCCMy72yQusKKo
         zLKHh9iRWlRswwGKIyHKxn0zlXAnSPToAyosKc+ihgZbp5CYbCla0KqsjB6bVcGlDVQL
         1LoKp+dQMRK3c0eSxxVIFEEJKr67Okvidm/5VHCGj4kGCwYxK2uLdocfvLejIl56RQET
         trSA==
X-Gm-Message-State: AOAM530lPkAhEdR5e8m8rgniHde6Z/LKmUeKAm1CNrT8R5Ftz1g/rVJ9
        n+HkKl2bd4MkvSUQ1P2a+/dX
X-Google-Smtp-Source: ABdhPJwyRKt4RA6PBYZXDoPqigdw06y9SoYrUGjBDC/ERmCDzI7M1Q6V7YEQqy79flGj8cpOyJC9QA==
X-Received: by 2002:a05:6a00:848:b029:197:e659:e236 with SMTP id q8-20020a056a000848b0290197e659e236mr65863637pfk.74.1609774007018;
        Mon, 04 Jan 2021 07:26:47 -0800 (PST)
Received: from work ([103.77.37.129])
        by smtp.gmail.com with ESMTPSA id h16sm63674430pgd.62.2021.01.04.07.26.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jan 2021 07:26:46 -0800 (PST)
Date:   Mon, 4 Jan 2021 20:56:43 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org
Subject: Re: [PATCH v7 06/10] mhi: pci_generic: Add PCI error handlers
Message-ID: <20210104152643.GC2256@work>
References: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
 <1609768179-10132-7-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609768179-10132-7-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 04, 2021 at 02:49:35PM +0100, Loic Poulain wrote:
> In AER capable root complex, errors are reported to the host which
> can then act accordingly and perform PCI recovering procedure.
> 
> This patch enables error reporting and implements error_detected,
> slot_reset and resume callbacks.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 50 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 3d459f3..0c12027 100644
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
