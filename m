Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB4DE18020B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 16:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgCJPjG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 11:39:06 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:54453 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727154AbgCJPjD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 11:39:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583854743; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gUmzy0ip2pBA4D+C/B3z0+zgPFLhXRY4x38ZdJYS4bI=; b=XDlxLPGaj9UQQ4tWF9YeEEIp08Uq2+iWjtbqfl701p/XRdgR6EcXZkz0SrOq5eXny8vheVcr
 xfhG66Snqoy/2oLZhJ/OwVb6L1JfGFtBW+I5T/5IXzpJufkAhv50HbHFJZr3SnKss4mk+SSz
 cZHVdtWZ3kYUUgl+mTzxOMcQ5Os=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e67b487.7f36ed5cd1b8-smtp-out-n01;
 Tue, 10 Mar 2020 15:38:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A75E3C433CB; Tue, 10 Mar 2020 15:38:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.2] (unknown [183.83.137.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C51FEC433D2;
        Tue, 10 Mar 2020 15:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C51FEC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v3 2/4] soc: qcom: Add SoC sleep stats driver
To:     Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     mka@chromium.org, evgreen@chromium.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>
References: <1583479412-18320-1-git-send-email-mkshah@codeaurora.org>
 <1583479412-18320-3-git-send-email-mkshah@codeaurora.org>
 <20200307064231.GF1094083@builder>
 <e1133bcd-b1fe-98b3-3a28-c12d07ff8ebc@codeaurora.org>
 <158377799320.66766.16447517220100414599@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <ad874421-f197-174f-3d30-2037c7fb57a0@codeaurora.org>
Date:   Tue, 10 Mar 2020 21:08:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158377799320.66766.16447517220100414599@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/9/2020 11:49 PM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-03-09 03:58:27)
>> On 3/7/2020 12:12 PM, Bjorn Andersson wrote:
>>> On Thu 05 Mar 23:23 PST 2020, Maulik Shah wrote:
>>>> diff --git a/drivers/soc/qcom/soc_sleep_stats.c b/drivers/soc/qcom/soc_sleep_stats.c
>>>> new file mode 100644
>>>> index 00000000..79a14d2
>>>> --- /dev/null
>>>> +++ b/drivers/soc/qcom/soc_sleep_stats.c
>>>> @@ -0,0 +1,248 @@
> [...]
>>>> +    u32 pid;
>>>> +};
>>>> +
>>>> +static struct subsystem_data subsystems[] = {
>>>> +    { "modem", MODEM_ITEM_ID, PID_MODEM },
>>>> +    { "adsp", ADSP_ITEM_ID, PID_ADSP },
>>>> +    { "cdsp", CDSP_ITEM_ID, PID_CDSP },
>>>> +    { "slpi", SLPI_ITEM_ID, PID_SLPI },
>>>> +    { "gpu", GPU_ITEM_ID, PID_APSS },
>>>> +    { "display", DISPLAY_ITEM_ID, PID_APSS },
>>>> +};
>>>> +
>>>> +struct stats_config {
>>>> +    unsigned int offset_addr;
>>>> +    unsigned int num_records;
>>>> +    bool appended_stats_avail;
>>>> +};
>>>> +
>>>> +static const struct stats_config *config;
>>> Add this to soc_sleep_stats_data and pass that as s->private instead of
>>> just the reg, to avoid the global variable.
>> No, this is required to keep global. we are not passing just reg as s->private,
>> we are passing "reg + offset" which differs for each stat.
> Can you please stop sending these review comment replies and then
> immediately turning around and sending the next revision of the patch
> series. I doubt that the changes take less than an hour to write and it
> would be helpful for everyone involved to have constructive discussions
> about the code if there's ever a response besides "done" or "ok".
Sure, i be careful to wait for at least few days before spinning new one,
atleast wait till all discussion finish on current version.

Also will try to reply in more details for comments as much as possible.
>
> In this case it should be possible to get rid of the global 'config'.
> Make a new container struct to hold the config and offset or figure out
> what actually needs to be passed into the functions instead and do that
> when the files are created.

i will address this to get rid of global config.

Thanks,
Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
