Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D3739CFC2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jun 2021 17:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhFFP2Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Jun 2021 11:28:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:46994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230091AbhFFP2Z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Jun 2021 11:28:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F4AF61246;
        Sun,  6 Jun 2021 15:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622993195;
        bh=g1xwNeUcRSN/h2p4QDiCxoMCRgDBICmh0r3vsguggqA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L+HoOXDHI7jyCBVuw8l6NRXWO8+0RFfDOPqJ7gg56QYN4rt4SpLuxwMCf2VtdwXrd
         DbIB+TAxc1XJ2G2luq6jPWSqM9Y2PqnCFoCaK6gi6kVfrazrsPSxYApqu/SjcY7+XP
         skEI3gkj8iOq/Q7X0TknLLHgVgWphmnVVqrzyHApjaxLNywmBmBbud8VOnyt3MRFJm
         OMKb5ttCbtLa7lCO8M0KeB5M02hY6Y+Cgv2JHV8rmtMAA/ukO8ciSoAqEQdlN8dr8C
         tLkvcIHPt3/HDAajzJs4dk9bj/b42WdnUC26MHrg8AVUTami2GFmVv160wn71bkLRm
         WN119cfntFPow==
Date:   Sun, 6 Jun 2021 20:56:29 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: pci-generic: Fix hibernation
Message-ID: <20210606152629.GB15232@thinkpad>
References: <1622571445-4505-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1622571445-4505-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 01, 2021 at 08:17:25PM +0200, Loic Poulain wrote:
> This patch fixes crash after resuming from hibernation. The issue
> occurs when mhi stack is builtin and so part of the 'restore-kernel',
> causing the device to be resumed from 'restored kernel' with a no
> more valid context (memory mappings etc...) and leading to spurious
> crashes.
> 
> This patch fixes the issue by implementing proper freeze/restore
> callbacks.
> 
> Reported-by: Shujun Wang <wsj20369@163.com>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Applied to mhi-fixes!

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index aa8f8d5..afa8763 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -888,9 +888,43 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
>  	return ret;
>  }
>  
> +static int __maybe_unused mhi_pci_freeze(struct device *dev)
> +{
> +	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
> +	/* We want to stop all operations, hibernation does not guarantee that
> +	 * device will be in the same state as before freezing, especially if
> +	 * the intermediate restore kernel reinitializes MHI device with new
> +	 * context.
> +	 */
> +	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> +		mhi_power_down(mhi_cntrl, false);
> +		mhi_unprepare_after_power_down(mhi_cntrl);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused mhi_pci_restore(struct device *dev)
> +{
> +	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
> +
> +	/* Reinitialize the device */
> +	queue_work(system_long_wq, &mhi_pdev->recovery_work);
> +
> +	return 0;
> +}
> +
>  static const struct dev_pm_ops mhi_pci_pm_ops = {
>  	SET_RUNTIME_PM_OPS(mhi_pci_runtime_suspend, mhi_pci_runtime_resume, NULL)
> -	SET_SYSTEM_SLEEP_PM_OPS(mhi_pci_suspend, mhi_pci_resume)
> +#ifdef CONFIG_PM_SLEEP
> +	.suspend = mhi_pci_suspend,
> +	.resume = mhi_pci_resume,
> +	.freeze = mhi_pci_freeze,
> +	.thaw = mhi_pci_restore,
> +	.restore = mhi_pci_restore,
> +#endif
>  };
>  
>  static struct pci_driver mhi_pci_driver = {
> -- 
> 2.7.4
> 
