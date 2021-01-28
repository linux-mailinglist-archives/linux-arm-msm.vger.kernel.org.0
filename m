Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3985306D2F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 07:02:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbhA1GA4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 01:00:56 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:55937 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229676AbhA1GAx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 01:00:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611813635; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=RisD2+TVae4MdXPvoqbK31LEWDspmYpo9m5NuqSO0pk=; b=v43VKtRwD7e/sg03Ea8h4FepbWQpt0Ckd4ob8R5UkK3CImd1+f47Mvj35A3tlG7TPDlB/kjd
 BsShp5Md9Ret86cqO/sjNRHKajisvi8WK5usKMZAfU/NiLHrwEirSbdk3nkrVTepWsslkEjJ
 +P5zMaAAYnxUkdAwE1YTz35U+t0=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 601252e12ef52906cefc1101 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Jan 2021 06:00:01
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BC971C43462; Thu, 28 Jan 2021 06:00:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E06F0C433ED;
        Thu, 28 Jan 2021 05:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E06F0C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org, hemantk@codeaurora.org
Subject: Re: [PATCH v8 07/10] mhi: pci_generic: Add health-check
References: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
        <1609776899-30664-8-git-send-email-loic.poulain@linaro.org>
        <87sg6lmwqo.fsf@tynnyri.adurom.net>
Date:   Thu, 28 Jan 2021 07:59:55 +0200
In-Reply-To: <87sg6lmwqo.fsf@tynnyri.adurom.net> (Kalle Valo's message of
        "Thu, 28 Jan 2021 07:55:11 +0200")
Message-ID: <87k0rxmwis.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Loic Poulain <loic.poulain@linaro.org> writes:
>
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
>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
>
> [...]
>
>> +#define HEALTH_CHECK_PERIOD (HZ * 2)
>
> [...]
>
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
>
> Sorry for the late reply, I see that this is already applied. But I
> wonder how this 2s polling affects battery life? Especially I'm worried
> about increased power consumption with ath11k on laptops.

Nevermind, I didn't realise that this is for pci_generic and ath11k does
not use it. Sorry for the noise.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
