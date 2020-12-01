Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337252C9464
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 02:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727861AbgLABAq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 20:00:46 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:19196 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726684AbgLABAq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 20:00:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606784422; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=G315b4cPivykMMjMgkGzQulB8qCDvrYj+OYY746vDHE=; b=rIvqG3y+/Cf22L9eBlYuUltDB4EEOkdp1KnAetM/6goQSS/EoC4HD8vNzVRYoQutSD6Xz2EC
 +XxZkkX4nrN76PCljJBg2m5oL5SHnrr8QXMEu+Y7KsRi9aIT/ycGAs9HE17+lSfRdvRyD26L
 nSrHcIcgJ8q3khsvWBZEt2TWlO0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fc595892ef3e1355f018130 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Dec 2020 00:59:53
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A01D8C433C6; Tue,  1 Dec 2020 00:59:53 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 52296C433ED;
        Tue,  1 Dec 2020 00:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 52296C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 8/9] mhi: pci_generic: Add health-check
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
 <1606404547-10737-9-git-send-email-loic.poulain@linaro.org>
 <20201128055936.GF3077@thinkpad>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <221eeccf-0a12-5237-ad3a-2c16467624fa@codeaurora.org>
Date:   Mon, 30 Nov 2020 16:59:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201128055936.GF3077@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 11/27/20 9:59 PM, Manivannan Sadhasivam wrote:
> On Thu, Nov 26, 2020 at 04:29:06PM +0100, Loic Poulain wrote:
>> If the modem crashes for any reason, we may not be able to detect
>> it at MHI level (MHI registers not reachable anymore).
>>
>> This patch implements a health-check mechanism to check regularly
>> that device is alive (MHI layer can communicate with). If device
>> is not alive (because a crash or unexpected reset), the recovery
>> procedure is triggered.
>>
>> Tested successfully with Telit FN980m module.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> 
> Bhaumik, Hemant, does this looks reasonable to you? Or we can do a
> better job in the MHI stack. To me this is not a specific usecase for
> Telit.

As far as i understood the change, MHI is unaware of this because this 
check is for underlying transport e.g. pci. This change looks good to 
me. Please apply this patch.

Thanks,
Hemant
> 
> If you guys plan to implement it later, I can just apply this patch in
> the meantime as it looks good to me.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks,
> Mani
> 
>> ---
>>   drivers/bus/mhi/pci_generic.c | 34 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
>> index 3ac5cd2..26c2dfa 100644
>> --- a/drivers/bus/mhi/pci_generic.c
>> +++ b/drivers/bus/mhi/pci_generic.c
>> @@ -14,12 +14,15 @@
>>   #include <linux/mhi.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>> +#include <linux/timer.h>
>>   #include <linux/workqueue.h>
>>   
>>   #define MHI_PCI_DEFAULT_BAR_NUM 0
>>   
>>   #define DEV_RESET_REG (0xB0)
>>   
>> +#define HEALTH_CHECK_PERIOD (HZ * 5)
>> +
>>   /**
>>    * struct mhi_pci_dev_info - MHI PCI device specific information
>>    * @config: MHI controller configuration
>> @@ -190,6 +193,7 @@ struct mhi_pci_device {
>>   	struct mhi_controller mhi_cntrl;
>>   	struct pci_saved_state *pci_state;
>>   	struct work_struct recovery_work;
>> +	struct timer_list health_check_timer;
>>   	unsigned long status;
>>   };
>>   
>> @@ -332,6 +336,8 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>>   
>>   	dev_warn(&pdev->dev, "device recovery started\n");
>>   
>> +	del_timer(&mhi_pdev->health_check_timer);
>> +
>>   	/* Clean up MHI state */
>>   	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>>   		mhi_power_down(mhi_cntrl, false);
>> @@ -355,6 +361,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>>   		goto err_unprepare;
>>   
>>   	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
>> +	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>>   	return;
>>   
>>   err_unprepare:
>> @@ -364,6 +371,21 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>>   		dev_err(&pdev->dev, "Recovery failed\n");
>>   }
>>   
>> +static void health_check(struct timer_list *t)
>> +{
>> +	struct mhi_pci_device *mhi_pdev = from_timer(mhi_pdev, t, health_check_timer);
>> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>> +
>> +	if (!mhi_pci_is_alive(mhi_cntrl)) {
>> +		dev_err(mhi_cntrl->cntrl_dev, "Device died\n");
>> +		queue_work(system_long_wq, &mhi_pdev->recovery_work);
>> +		return;
>> +	}
>> +
>> +	/* reschedule in two seconds */
>> +	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>> +}
>> +
>>   static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   {
>>   	const struct mhi_pci_dev_info *info = (struct mhi_pci_dev_info *) id->driver_data;
>> @@ -379,6 +401,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   		return -ENOMEM;
>>   
>>   	INIT_WORK(&mhi_pdev->recovery_work, mhi_pci_recovery_work);
>> +	timer_setup(&mhi_pdev->health_check_timer, health_check, 0);
>>   
>>   	mhi_cntrl_config = info->config;
>>   	mhi_cntrl = &mhi_pdev->mhi_cntrl;
>> @@ -431,6 +454,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>   
>>   	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
>>   
>> +	/* start health check */
>> +	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>> +
>>   	return 0;
>>   
>>   err_unprepare:
>> @@ -446,6 +472,7 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>>   	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>>   	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>>   
>> +	del_timer(&mhi_pdev->health_check_timer);
>>   	cancel_work_sync(&mhi_pdev->recovery_work);
>>   
>>   	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>> @@ -466,6 +493,8 @@ void mhi_pci_reset_prepare(struct pci_dev *pdev)
>>   
>>   	dev_info(&pdev->dev, "reset\n");
>>   
>> +	del_timer(&mhi_pdev->health_check_timer);
>> +
>>   	/* Clean up MHI state */
>>   	if (test_and_clear_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status)) {
>>   		mhi_power_down(mhi_cntrl, false);
>> @@ -509,6 +538,7 @@ void mhi_pci_reset_done(struct pci_dev *pdev)
>>   	}
>>   
>>   	set_bit(MHI_PCI_DEV_STARTED, &mhi_pdev->status);
>> +	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>>   }
>>   
>>   static pci_ers_result_t mhi_pci_error_detected(struct pci_dev *pdev,
>> @@ -569,6 +599,7 @@ int  __maybe_unused mhi_pci_suspend(struct device *dev)
>>   	struct mhi_pci_device *mhi_pdev = dev_get_drvdata(dev);
>>   	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
>>   
>> +	del_timer(&mhi_pdev->health_check_timer);
>>   	cancel_work_sync(&mhi_pdev->recovery_work);
>>   
>>   	/* Transition to M3 state */
>> @@ -604,6 +635,9 @@ static int __maybe_unused mhi_pci_resume(struct device *dev)
>>   		goto err_recovery;
>>   	}
>>   
>> +	/* Resume health check */
>> +	mod_timer(&mhi_pdev->health_check_timer, jiffies + HEALTH_CHECK_PERIOD);
>> +
>>   	return 0;
>>   
>>   err_recovery:
>> -- 
>> 2.7.4
>>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
