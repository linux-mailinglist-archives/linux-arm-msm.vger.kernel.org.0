Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3613B416E7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 11:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244436AbhIXJJW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 05:09:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59894 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244418AbhIXJJW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 05:09:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632474469; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=P3RD3M7+g2Yi/4ZTx3R1aVwoD6LBprfi6LPXWTp3dew=; b=hLYSMA0GSdj2Ap4ngBhtCtO+8928NnRnwvB1OyuHdArV712gVTVBEjV5qW7WFRonf2QlADFj
 D9iaZLebgz7WDWhRz5ngZ2fkSfspa3h+jqwyd0vtgAHn1UgEESl6IuiscO01UaO0b9AN3QbQ
 oaZpyTr7dYRp14RXnl6N52yBcJI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 614d9564e0480a7d6faa6777 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 09:07:48
 GMT
Sender: kvalo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EE3F6C43617; Fri, 24 Sep 2021 09:07:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kvalo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 96D24C4360D;
        Fri, 24 Sep 2021 09:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 96D24C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Kalle Valo <kvalo@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Carl Huang <cjhuang@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        ath11k@lists.infradead.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-wireless@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [regression] mhi: ath11k resume fails on some devices
References: <871r5p0x2u.fsf@codeaurora.org>
        <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
        <20210916111218.GA12918@thinkpad>
        <CAMZdPi94607mZorp+Zmkw3seWXak6p9Jr05CQ5hhfgKQoG8n7Q@mail.gmail.com>
        <20210916163529.GA9027@thinkpad> <87k0jgxyjp.fsf@codeaurora.org>
        <20210916171927.GB9027@thinkpad>
        <b7c0906041dcafb43be215bd4f55326a@codeaurora.org>
        <20210923085926.GD6083@thinkpad>
Date:   Fri, 24 Sep 2021 12:07:41 +0300
In-Reply-To: <20210923085926.GD6083@thinkpad> (Manivannan Sadhasivam's message
        of "Thu, 23 Sep 2021 14:29:26 +0530")
Message-ID: <8735putk82.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> For aid debugging, please see the state the device is in during mhi_pm_resume().
> You can use below diff:
>
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index fb99e3727155..482d55dd209e 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -898,6 +898,9 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
>         if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
>                 return -EIO;
>  
> +       dev_info(dev, "Device state: %s\n",
> +                TO_MHI_STATE_STR(mhi_get_mhi_state(mhi_cntrl)));
> +
>         if (mhi_get_mhi_state(mhi_cntrl) != MHI_STATE_M3)
>                 return -EINVAL;

This is what I get with my NUC testbox:

[  970.488202] ACPI: EC: event unblocked
[  970.492484] hpet: Lost 1587 RTC interrupts
[  970.492749] mhi mhi0: Device state: RESET
[  970.492805] ath11k_pci 0000:06:00.0: failed to set mhi state: RESUME(6)

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
