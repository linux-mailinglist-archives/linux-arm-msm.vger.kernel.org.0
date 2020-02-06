Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9939F154857
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 16:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727138AbgBFPoy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 10:44:54 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:49328 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727060AbgBFPoy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 10:44:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581003893; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=rjIfp9CIJV4qI5ceKS2vEoRv4raumlqwad4wEBtgCvk=;
 b=KR50NQNhxDJYVHvlYCdZxzdZKa4HzmcNWjR9QZcI+lk3/7Qp3f0iCa0/XkJX01oCVrTJpLIL
 OhAS+ZGz7vlnGsLHoViO6iiRhgHQOnAGVEeuTwwfNvOWnUzCw9IANw8pv6tLRe+FWkafLXWd
 Rz7ZcXyV4xFN57G7Ip0475clmaw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3c346f.7f12d29c7340-smtp-out-n01;
 Thu, 06 Feb 2020 15:44:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B0441C4479C; Thu,  6 Feb 2020 15:44:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC373C43383;
        Thu,  6 Feb 2020 15:44:46 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 06 Feb 2020 21:14:46 +0530
From:   sbhanu@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, rampraka@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH V1] mmc: sdhci-msm: Add system suspend/resume callbacks
In-Reply-To: <5e287ef8.1c69fb81.cacd.4c1b@mx.google.com>
References: <1579617022-13031-1-git-send-email-sbhanu@codeaurora.org>
 <5e287ef8.1c69fb81.cacd.4c1b@mx.google.com>
Message-ID: <a468dd52bdeaa0b34645c1578b6eadc1@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-01-22 22:27, Stephen Boyd wrote:
> Quoting Shaik Sajida Bhanu (2020-01-21 06:30:22)
>> Add system suspend/resume callbacks to sdhci-msm platform driver.
> 
> Yes, but why? There are already suspend/resume callbacks so this is
> replacing them too.
> 

Sure. Will update the commit text.

The present suspend/resume callbacks are only disabling the clocks.

Since eMMC/SDcard would be powered off during system suspend, we can do 
little more like

resetting controller, disabling interrupts. So updating the existing 
callbacks.

>> 
>> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
>> ---
>>  drivers/mmc/host/sdhci-msm.c | 47 
>> ++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 45 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/mmc/host/sdhci-msm.c 
>> b/drivers/mmc/host/sdhci-msm.c
>> index 71f29ba..4984857 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -2028,9 +2028,52 @@ static __maybe_unused int 
>> sdhci_msm_runtime_resume(struct device *dev)
>>         return 0;
>>  }
>> 
>> +static int sdhci_msm_suspend(struct device *dev)
>> +{
>> +       struct sdhci_host *host = dev_get_drvdata(dev);
>> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +       struct sdhci_msm_host *msm_host = 
>> sdhci_pltfm_priv(pltfm_host);
>> +       int ret = 0;
>> +
>> +       if (host->mmc->caps2 & MMC_CAP2_CQE) {
> 
> It would be nice if this if check was rolled into cqhci_suspend so that
> all the callers wouldn't have to check it.
> 
>> +               ret = cqhci_suspend(host->mmc);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>> +       disable_irq(msm_host->pwr_irq);
> 
> Why is the irq disabled? Please add a comment.
> 

Will add a comment.

During system suspend all SDHC interrupts can be disabled since device 
would be

in power down state.

>> +       ret = sdhci_suspend_host(host);
>> +       if (ret)
>> +               return ret;
>> +
>> +       return sdhci_msm_runtime_suspend(dev);
> 
> pm_runtime_force_suspend() does different things than just call the
> runtime suspend function for the driver. For example, it disables
> runtime PM on the device. Can you explain in the commit text how this 
> is
> a correct conversion?
> 

Will invoke pm_runtime_force_suspend() here instead of 
sdhci_msm_runtime_suspend()

>> +}
>> +
>> +static int sdhci_msm_resume(struct device *dev)
>> +{
>> +       struct sdhci_host *host = dev_get_drvdata(dev);
>> +       struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>> +       struct sdhci_msm_host *msm_host = 
>> sdhci_pltfm_priv(pltfm_host);
>> +       int ret = 0;
>> +
>> +       ret = sdhci_msm_runtime_resume(dev);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = sdhci_resume_host(host);
>> +       if (ret < 0)
>> +               return ret;
>> +       enable_irq(msm_host->pwr_irq);
> 
> Same question here about irq. Deserves a comment.
> 
>> +
>> +       if (host->mmc->caps2 & MMC_CAP2_CQE)
>> +               ret = cqhci_resume(host->mmc);
>> +
>> +       return ret;
>> +}
>> +
>>  static const struct dev_pm_ops sdhci_msm_pm_ops = {
>> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> -                               pm_runtime_force_resume)
>> +       SET_SYSTEM_SLEEP_PM_OPS(sdhci_msm_suspend,
>> +                               sdhci_msm_resume)
>>         SET_RUNTIME_PM_OPS(sdhci_msm_runtime_suspend,
>>                            sdhci_msm_runtime_resume,
>>                            NULL)
