Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91BC7159211
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 15:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728589AbgBKOiG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 09:38:06 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:45389 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728821AbgBKOiE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 09:38:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581431883; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+vv3RiTh5gPMeXyabn3BEheKnftpekx1k9kfKHh8wN4=;
 b=WzAHk+uopcKkLUwXo3K116xv0WV1c6bN3VV0MVBLoBIdd2Su2pEr2/RmMz3x4004PVGGWV8U
 hZn4ve14ao4s8p4AoHNNH0MYa+K/b81Uv44TyTen8EIJVEn/SbQuBQxB9IKccydquk45omOf
 JEnAifUYts07R10LywOzRf+4c7g=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e42bc4a.7f1e82a75b20-smtp-out-n03;
 Tue, 11 Feb 2020 14:38:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B9A39C447A3; Tue, 11 Feb 2020 14:38:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0EF61C4479D;
        Tue, 11 Feb 2020 14:38:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 11 Feb 2020 20:08:02 +0530
From:   sbhanu@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     adrian.hunter@intel.com, mka@chromium.org, robh+dt@kernel.org,
        ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, rampraka@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree-owner@vger.kernel.org
Subject: Re: [PATCH V2] mmc: sdhci-msm: Update system suspend/resume callbacks
 of sdhci-msm platform driver.
In-Reply-To: <158136367603.121156.1867941302835915258@swboyd.mtv.corp.google.com>
References: <1581081650-22228-1-git-send-email-sbhanu@codeaurora.org>
 <158136367603.121156.1867941302835915258@swboyd.mtv.corp.google.com>
Message-ID: <1328455c7256f41f3f3bd9b96fb21d8d@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-02-11 01:11, Stephen Boyd wrote:
> Quoting Shaik Sajida Bhanu (2020-02-07 05:20:50)
>> The existing suspend/resume callbacks of sdhci-msm driver are just
>> gating/un-gating the clocks. During suspend cycle more can be done
>> like disabling controller, interrupts and card detection.
>> 
>> So updating the system pm callbacks for performing these extra
>> actions besides controlling the clocks.
>> 
>> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
>> 
>> Changes since V1:
>>         Addressed review comments
> 
> Please don't write this. Instead, describe what's actually different so
> the reader doesn't have to go figure out what the review comments were.
> 

sure

>> ---
>>  drivers/mmc/host/sdhci-msm.c | 50 
>> ++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 48 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/mmc/host/sdhci-msm.c 
>> b/drivers/mmc/host/sdhci-msm.c
>> index c3a160c..e30c8a3 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -2159,9 +2159,55 @@ static __maybe_unused int 
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
>> +       int ret;
>> +
>> +       if (host->mmc->caps2 & MMC_CAP2_CQE) {
>> +               ret = cqhci_suspend(host->mmc);
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>> +       ret = sdhci_suspend_host(host);
>> +       if (ret)
>> +               return ret;
>> +       /* Disable pwr-irq since SDHC would be inactive */
>> +       disable_irq(msm_host->pwr_irq);
> 
> Why do we need to do this? If it's inactive then the irq won't be 
> raised
> by the inactive hardware. Given that we're going to suspend the device,
> the irq won't matter unless it's marked for wakeup. Please remove this
> irq enable/disable logic, or explain why it's really needed.
> 

You are right. This is not needed.
We have checked more on this and interrupt are getting disabled in 
suspend_device_irqs().
Will remove this.

>> +
>> +       return pm_runtime_force_suspend(dev);
>> +}
>> +
