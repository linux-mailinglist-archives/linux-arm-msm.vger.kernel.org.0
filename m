Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7F5A1A6425
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 10:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728144AbgDMIZn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 04:25:43 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:54735 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727971AbgDMIZl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 04:25:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586766332; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=a6YQJ78S6nCn8YzVsbvRmz3ffyuX/j8RJJEiKzBvYyU=;
 b=erlT9JjOH7cIHp+49MEccddziaCsY0bNSNFnqhk7AcrSQNiLepqhxsbIcqbIJG7BbT9EKsAa
 L503uu4b+hA34UugkTd/u6Wf2HBzQr9dpSL1b5OrMImvowgBOXWZqkZ44oIGVaovsruEagWS
 S+zvQXWiZgXss4TMGjigIWUYaEc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9421fb.7fc8e7ca5c70-smtp-out-n03;
 Mon, 13 Apr 2020 08:25:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4AA34C432C2; Mon, 13 Apr 2020 08:25:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 93F84C433F2;
        Mon, 13 Apr 2020 08:25:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 13 Apr 2020 13:55:30 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mathieu.poirier@linaro.org, mike.leach@linaro.org,
        swboyd@chromium.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] coresight: tmc: Read TMC mode only when TMC hw is enabled
In-Reply-To: <9a792e3e-5a17-156d-4b59-4a3ec8f9993e@arm.com>
References: <20200409113538.5008-1-saiprakash.ranjan@codeaurora.org>
 <9a792e3e-5a17-156d-4b59-4a3ec8f9993e@arm.com>
Message-ID: <1751aeabd22bee18d2eef0f643883265@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 2020-04-13 04:47, Suzuki K Poulose wrote:
> Hi Sai,
> 
> On 04/09/2020 12:35 PM, Sai Prakash Ranjan wrote:
>> Reading TMC mode register in tmc_read_prepare_etb without
>> enabling the TMC hardware leads to async exceptions like
>> the one in the call trace below. This can happen if the
>> user tries to read the TMC etf data via device node without
>> setting up source and the sink first which enables the TMC
>> hardware in the path. So make sure that the TMC is enabled
>> before we try to read TMC data.
> 
> So, one can trigger the same SError by simply :
> 
> $ cat /sys/bus/coresight/device/tmc_etb0/mgmt/mode
> 

I do not see any SError when I run the above command.

localhost ~ # cat /sys/bus/coresight/devices/tmc_etf0/mgmt/mode
0x0

And this is most likely due to

commit cd9e3474bb793dc ("coresight: add PM runtime calls to 
coresight_simple_func()")

> And also :
> 
>> 
>>   Kernel panic - not syncing: Asynchronous SError Interrupt
>>   CPU: 7 PID: 2605 Comm: hexdump Tainted: G S                5.4.30 
>> #122
>>   Call trace:
>>    dump_backtrace+0x0/0x188
>>    show_stack+0x20/0x2c
>>    dump_stack+0xdc/0x144
>>    panic+0x168/0x36c
>>    panic+0x0/0x36c
>>    arm64_serror_panic+0x78/0x84
>>    do_serror+0x130/0x138
>>    el1_error+0x84/0xf8
>>    tmc_read_prepare_etb+0x88/0xb8
>>    tmc_open+0x40/0xd8
>>    misc_open+0x120/0x158
>>    chrdev_open+0xb8/0x1a4
>>    do_dentry_open+0x268/0x3a0
>>    vfs_open+0x34/0x40
>>    path_openat+0x39c/0xdf4
>>    do_filp_open+0x90/0x10c
>>    do_sys_open+0x150/0x3e8
>>    __arm64_compat_sys_openat+0x28/0x34
>>    el0_svc_common+0xa8/0x160
>>    el0_svc_compat_handler+0x2c/0x38
>>    el0_svc_compat+0x8/0x10
>> 
>> Fixes: 4525412a5046 ("coresight: tmc: making prepare/unprepare 
>> functions generic")
>> Reported-by: Stephen Boyd <swboyd@chromium.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/hwtracing/coresight/coresight-tmc.c | 5 +++++
>>   drivers/hwtracing/coresight/coresight-tmc.h | 1 +
>>   2 files changed, 6 insertions(+)
>> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc.c 
>> b/drivers/hwtracing/coresight/coresight-tmc.c
>> index 1cf82fa58289..7bae69748ab7 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc.c
>> @@ -62,11 +62,13 @@ void tmc_flush_and_stop(struct tmc_drvdata 
>> *drvdata)
>>     void tmc_enable_hw(struct tmc_drvdata *drvdata)
>>   {
>> +	drvdata->enable = true;
>>   	writel_relaxed(TMC_CTL_CAPT_EN, drvdata->base + TMC_CTL);
>>   }
>>     void tmc_disable_hw(struct tmc_drvdata *drvdata)
>>   {
>> +	drvdata->enable = false;
>>   	writel_relaxed(0x0, drvdata->base + TMC_CTL);
>>   }
>>   @@ -102,6 +104,9 @@ static int tmc_read_prepare(struct tmc_drvdata 
>> *drvdata)
>>   {
>>   	int ret = 0;
>>   +	if (!drvdata->enable)
>> +		return -EINVAL;
>> +
> 
> Does this check always guarantee that the TMC is enabled when
> we actually get to reading the MODE ? This needs to be done
> under the spinlock.
> 

Ok I will make this change.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
