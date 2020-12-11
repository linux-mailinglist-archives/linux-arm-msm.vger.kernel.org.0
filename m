Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CF22D7FEC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Dec 2020 21:24:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404117AbgLKUYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 15:24:16 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:21028 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388109AbgLKUYA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 15:24:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1607718216; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=TtDM/Jx0hiF1fch4Y0emxyouhcaWhCiI3ntEwBQTXN0=; b=hRiImgNi5gBDAd7ScCgNXR6HBm32V96KP9OtOs8zZrlPfOOhpKZr776XcNmOZawhH+0IGzCz
 dP+z8si/MXts02TUChdxk44T/P0jJIUtAf6179G5mV8/P/o46tC0CGrq9CznbyBjLHKFw+8J
 dvwMz6TI/nAJtj1afn2RYaFm0FI=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fd3d520f81e894c5511249c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 11 Dec 2020 20:22:56
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2FEA3C43461; Fri, 11 Dec 2020 20:22:56 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CE57C433CA;
        Fri, 11 Dec 2020 20:22:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0CE57C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v4 06/10] mhi: pci_generic: Add suspend/resume/recovery
 procedure
To:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
 <1607594575-31590-7-git-send-email-loic.poulain@linaro.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <3fd3f60c-777c-2710-92ae-1c89cda1aa38@codeaurora.org>
Date:   Fri, 11 Dec 2020 12:22:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1607594575-31590-7-git-send-email-loic.poulain@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 12/10/20 2:02 AM, Loic Poulain wrote:
> Add support for system wide suspend/resume. During suspend, MHI
> device controller must be put in M3 state and PCI bus in D3 state.
> 
> Add a recovery procedure allowing to reinitialize the device in case
> of error during resume steps, which can happen if device loses power
> (and so its context) while system suspend.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>[..]
> +int  __maybe_unused mhi_pci_suspend(struct device *dev)
suspend API is not static but resume is. Any reason for that ?
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
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mhi_pci_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(mhi_pci_suspend, mhi_pci_resume)
> +};
> +
>   static struct pci_driver mhi_pci_driver = {
>   	.name		= "mhi-pci-generic",
>   	.id_table	= mhi_pci_id_table,
>   	.probe		= mhi_pci_probe,
>   	.remove		= mhi_pci_remove,
>   	.err_handler	= &mhi_pci_err_handler,
> +	.driver.pm	= &mhi_pci_pm_ops
>   };
>   module_pci_driver(mhi_pci_driver);
>   
> 

Overall change looks good from my side. Once you address or answer my 
query you can add my

Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
