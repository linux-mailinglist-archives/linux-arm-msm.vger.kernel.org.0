Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C20E38CC5F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 19:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238235AbhEURjd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 13:39:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:49810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235715AbhEURjb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 13:39:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27E87611AB;
        Fri, 21 May 2021 17:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621618687;
        bh=6KqEfYkDcoTb6Jwh7h3ZcahKjT4Yfi70EmtRbuy7RLo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EViyEUm/3szNNeeSikyCz5/891e36M5WtDqih5VPwrBtKo+VgPm/DOiZvkt9T59yX
         NFC//5BjgxPWCizubfiH0ZsNMsKrrYeafmNKglzqVXx/NsLXCwRiHxeRA3VXxaVzun
         mOEHeiYC0Pw784ga/uClmNAhA1RV3ZwjklsuVOGE2yGCQhX3s/6IjXgL6ck9uuNh49
         d7H0Pmyq69Z8Tcvd5bSAU6a0npy7oib78V4h9d5MViZcy5RH20YXM+pNqb/mnibKTG
         aKG0cdwTie/kS8qYR6BjLIiXmZ9rGis46yknZBQVw1KpUlDV05uc7DaVddB0UUDkhE
         kfILHZJ8RBEzw==
Date:   Fri, 21 May 2021 23:07:59 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Hulk Robot <hulkci@huawei.com>
Subject: Re: [PATCH -next] bus: mhi: pci_generic: Fix possible use-after-free
 in mhi_pci_remove()
Message-ID: <20210521173759.GR70095@thinkpad>
References: <20210413160318.2003699-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413160318.2003699-1-weiyongjun1@huawei.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 13, 2021 at 04:03:18PM +0000, Wei Yongjun wrote:
> This driver's remove path calls del_timer(). However, that function
> does not wait until the timer handler finishes. This means that the
> timer handler may still be running after the driver's remove function
> has finished, which would result in a use-after-free.
> 
> Fix by calling del_timer_sync(), which makes sure the timer handler
> has finished, and unable to re-schedule itself.
> 
> Fixes: 8562d4fe34a3 ("mhi: pci_generic: Add health-check")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied to mhi-fixes!

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 7c810f02a2ef..5b19e877d17a 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -708,7 +708,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>  
> -	del_timer(&mhi_pdev->health_check_timer);
> +	del_timer_sync(&mhi_pdev->health_check_timer);
>  	cancel_work_sync(&mhi_pdev->recovery_work);
>  
>  	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
> 
