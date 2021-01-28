Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79F9306D21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 06:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbhA1F4W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 00:56:22 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:15934 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229462AbhA1F4V (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 00:56:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611813357; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=7bdb4pnbBwJtBwLz+cq4Boy6SL7VKKiyB/GpZ3MhC+U=; b=RY1iXMdDdXpw0Gx34ehzUlrpkWwMsP0KqZyvb93ilq9Q0AcTdgBBISI9WqyPmgyerFnn11zH
 Le6+WhmzQktmsZqIKrwmuM3Yq39O1pL2yuFgILNJ4V86uK7D95y2oT8Qc0SutfrTcbDTm62r
 mpGO8pSO0ja+XPTbKx/EQ3E4J5o=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 601251c5d6d8863d3862a831 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Jan 2021 05:55:17
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 46A3AC43462; Thu, 28 Jan 2021 05:55:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 66AB4C433C6;
        Thu, 28 Jan 2021 05:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 66AB4C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kvalo@codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        bbhatt@codeaurora.org, hemantk@codeaurora.org
Subject: Re: [PATCH v8 07/10] mhi: pci_generic: Add health-check
References: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
        <1609776899-30664-8-git-send-email-loic.poulain@linaro.org>
Date:   Thu, 28 Jan 2021 07:55:11 +0200
In-Reply-To: <1609776899-30664-8-git-send-email-loic.poulain@linaro.org> (Loic
        Poulain's message of "Mon, 4 Jan 2021 17:14:56 +0100")
Message-ID: <87sg6lmwqo.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Loic Poulain <loic.poulain@linaro.org> writes:

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
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

[...]

> +#define HEALTH_CHECK_PERIOD (HZ * 2)

[...]

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

Sorry for the late reply, I see that this is already applied. But I
wonder how this 2s polling affects battery life? Especially I'm worried
about increased power consumption with ath11k on laptops.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
