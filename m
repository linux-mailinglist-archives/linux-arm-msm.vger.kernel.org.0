Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD4C2B8A0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 03:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727340AbgKSCVz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Nov 2020 21:21:55 -0500
Received: from z5.mailgun.us ([104.130.96.5]:46700 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727145AbgKSCVz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Nov 2020 21:21:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605752514; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=7e0uRl/6G1aTjtsOAgwAb8tXMcpselgmucL9td3cJvw=; b=Gtut6nZ3jQ+Ga6tWO/SUxrfrYfBRDfh1aHWSE5u6bL0XBotsncKfMPdhZBSXMOqF+OHWRlAe
 X9d52ofxfaCmpuN7B6JGDwKEDeD28omcNIXgeHGfF4OPqfhg5odhN9WpJOhSSasxhLcqLSGH
 FinMPRNNaL1Y7E6Z3Gggr5Ajcg0=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fb5d6bbd64ea0b703934891 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Nov 2020 02:21:47
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C9F00C43460; Thu, 19 Nov 2020 02:21:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0F0ACC433ED;
        Thu, 19 Nov 2020 02:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0F0ACC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH 5/8] mhi: pci_generic: Add suspend/resume/recovery
 procedure
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org
References: <1605279602-18749-1-git-send-email-loic.poulain@linaro.org>
 <1605279602-18749-6-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <5702d42a-d1ec-0489-b7be-e40a8178e808@codeaurora.org>
Date:   Wed, 18 Nov 2020 18:21:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1605279602-18749-6-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 11/13/20 6:59 AM, Loic Poulain wrote:
> Add support for system wide suspend/resume. During suspend, MHI
> device controller must be put in M3 state and PCI bus in D3 state.
> 
> Add a recovery procedure allowing to reinitialize the device in case
> of error during resume steps, which can happen if device loses power
> (and so its context) while system suspend.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
[..]
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
>   static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   {
>   	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
> @@ -333,6 +377,8 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	if (!mhi_pdev)
>   		return -ENOMEM;
>   
> +	INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
> +
>   	mhi_cntrl_config = info->config;
>   	mhi_cntrl = &mhi_pdev->mhi_cntrl;
>   	mhi_cntrl->cntrl_dev = &pdev->dev;
> @@ -395,6 +441,8 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>   	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>   	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>   
> +	cancel_work_sync(&mhi_pdev->recovery_work);
> +
>   	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>   		mhi_power_down(mhi_cntrl, true);
>   		mhi_unprepare_after_power_down(mhi_cntrl);
> @@ -463,12 +511,64 @@ static const struct pci_error_handlers mhi_pci_err_handler = {
>   	.reset_done = mhi_pci_reset_done,
>   };
>   
> +int  __maybe_unused mhi_pci_suspend(struct device *dev)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
is it possible we come here and work still did not get a chance to run ? 
If so we can flush it before going through suspend.
> +	/* Transition to M3 state */
> +	mhi_pm_suspend(mhi_cntrl);
> +
> +	pci_save_state(pdev);
> +	pci_disable_device(pdev);
> +	pci_wake_from_d3(pdev, true);
> +	pci_set_power_state(pdev, PCI_D3hot);
are you planning to park the device in D3hot all the time ?
Is there a plan to move to D3Cold in your use case ?
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
> +	return 0;
> +}
> +
[..]

Thanks,
Hemant

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
