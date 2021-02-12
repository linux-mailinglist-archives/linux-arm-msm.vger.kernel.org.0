Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356C3319807
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 02:42:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbhBLBmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 20:42:12 -0500
Received: from so15.mailgun.net ([198.61.254.15]:16396 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229469AbhBLBmM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 20:42:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613094114; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=20+RKKCF4DeXLj+WHzzy4Jh3DV97x7W4t8v7lxLZWOs=;
 b=MdEIq1YY2Bn8JKhMY12Bbznh/ElF2ZjDxMxf0FwtvieqXPtDfagIdUYYnRSoYIE4BFyl7MED
 KGKPLDBYy9gCBFlzEjsaf0l10cOuDU7ZCsgI1ckP4M8yA8GTMZDiQ3L8DH8ZDrf8HQKNgO80
 UidqqzNN+t8+4fSBzVjJGiWuvTc=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6025dcb84bd23a05ae032b31 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Feb 2021 01:41:12
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EDD46C433CA; Fri, 12 Feb 2021 01:41:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 24566C433C6;
        Fri, 12 Feb 2021 01:41:11 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 11 Feb 2021 17:41:11 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org
Subject: Re: [PATCH v3] mhi: pci_generic: Ensure device readiness before
 starting MHI
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1613071507-31489-1-git-send-email-loic.poulain@linaro.org>
References: <1613071507-31489-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <fc43871e37761808e5c1e00406daef5e@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 2021-02-11 11:25 AM, Loic Poulain wrote:
> The PCI device may have not been bound from cold boot and be in
> undefined state, or simply not yet ready for MHI operations. This
> change ensures that the MHI layer is reset to initial state and
> ready for MHI initialization and power up.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: reset only if necessary
>  v3: do not wait for MHI readiness in PBL context
> 
>  drivers/bus/mhi/pci_generic.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c 
> b/drivers/bus/mhi/pci_generic.c
> index c20f59e..87abd7c 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -17,6 +17,8 @@
>  #include <linux/timer.h>
>  #include <linux/workqueue.h>
> 
> +#include "core/internal.h"
> +
>  #define MHI_PCI_DEFAULT_BAR_NUM 0
> 
>  #define MHI_POST_RESET_DELAY_MS 500
> @@ -256,6 +258,7 @@ static int mhi_pci_claim(struct mhi_controller 
> *mhi_cntrl,
>  		return err;
>  	}
>  	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
> +	mhi_cntrl->bhi = mhi_cntrl->regs + readl(mhi_cntrl->regs + BHIOFF);
> 
>  	err = pci_set_dma_mask(pdev, dma_mask);
>  	if (err) {
> @@ -391,6 +394,31 @@ static void health_check(struct timer_list *t)
>  	mod_timer(&mhi_pdev->health_check_timer, jiffies + 
> HEALTH_CHECK_PERIOD);
>  }
> 
> +static void __mhi_sw_reset(struct mhi_controller *mhi_cntrl)
> +{
> +	unsigned int max_wait_ready = 100;
> +
> +	if (MHI_IN_PBL(mhi_get_exec_env(mhi_cntrl))) {
> +		/* nothing to do, ready for BHI */
> +		return;
> +	}
> +
> +	if (mhi_get_mhi_state(mhi_cntrl) >= MHI_STATE_M0) {
> +		dev_warn(mhi_cntrl->cntrl_dev, "Need reset\n");
> +		writel(MHICTRL_RESET_MASK, mhi_cntrl->regs + MHICTRL);
> +		msleep(10);
> +	}
> +
> +	while (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_READY) {
> +		if (!max_wait_ready--) {
> +			dev_warn(mhi_cntrl->cntrl_dev, "Not ready (state %u)\n",
> +				 mhi_get_mhi_state(mhi_cntrl));
> +			break;
> +		}
> +		msleep(50);
> +	}
> +}
> +
>  static int mhi_pci_probe(struct pci_dev *pdev, const struct 
> pci_device_id *id)
>  {
>  	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *)
> id->driver_data;
> @@ -451,6 +479,9 @@ static int mhi_pci_probe(struct pci_dev *pdev,
> const struct pci_device_id *id)
>  		goto err_unregister;
>  	}
> 
> +	/* Before starting MHI, ensure device is in good initial state */
> +	__mhi_sw_reset(mhi_cntrl);
> +
>  	err = mhi_sync_power_up(mhi_cntrl);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to power up MHI controller\n");
> @@ -532,6 +563,8 @@ static void mhi_pci_reset_done(struct pci_dev 
> *pdev)
>  		return;
>  	}
> 
> +	__mhi_sw_reset(mhi_cntrl);
> +
>  	err = mhi_sync_power_up(mhi_cntrl);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to power up MHI controller\n");

Can you share logs of what you're seeing as it is not clear why you 
would need
this patch.

We have a mechanism in place that Jeff added a while back [1], to check 
if device
is in SYS_ERROR state and do the same: issue reset and later, wait for 
ready from
within mhi_sync_power_up() API.

Note that the MHI_IN_PBL() macro includes EDL and Pass Through modes as 
well and
we do expect an MHI READY state move after Pass Through.

Thanks,
Bhaumik

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/bus/mhi/core?h=v5.11-rc7&id=e18d4e9fa79bb27de6447c0c172bb1c428a52bb2
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
