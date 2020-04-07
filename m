Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6F411A186D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 01:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgDGXAE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 19:00:04 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:58517 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726395AbgDGXAE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 19:00:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586300403; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SCZqNjd3i3AXnsdgqxjB0zBNvisnVUii4KRTbEvYcZs=;
 b=LxELnTx9MjbpwLr3jOmNET+AFOJV9+nFKuHuqwzacrC74R+yZbj2N/mJKLK/e6nvtulZAfK0
 XObcLViPVkoMVQTU/5yAvnIrukQyZf+ZJdCXfE0hHU9+U8USIlboaFt5IdBwZ0ps0i1SeWOZ
 ZmeS356TkWX8MOkVVlIYoQboP3c=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8d05f0.7f94bf1a3110-smtp-out-n03;
 Tue, 07 Apr 2020 23:00:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AD0B2C43636; Tue,  7 Apr 2020 22:59:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: rishabhb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1A0CCC433D2;
        Tue,  7 Apr 2020 22:59:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 07 Apr 2020 15:59:59 -0700
From:   rishabhb@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Siddharth Gupta <sidgup@codeaurora.org>, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, linux-remoteproc-owner@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: core: Prevent sleep when rproc crashes
In-Reply-To: <20200407222958.GL20625@builder.lan>
References: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
 <1582164713-6413-3-git-send-email-sidgup@codeaurora.org>
 <20200407222958.GL20625@builder.lan>
Message-ID: <c98b9b02c49b41c6e2493407f11c5eac@codeaurora.org>
X-Sender: rishabhb@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-04-07 15:29, Bjorn Andersson wrote:
> On Wed 19 Feb 18:11 PST 2020, Siddharth Gupta wrote:
> 
>> Remoteproc recovery should be fast and any delay will have an impact 
>> on the
>> user-experience. Use power management APIs (pm_stay_awake and 
>> pm_relax) to
>> ensure that the system does not go to sleep.
>> 
>> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
>> ---
>>  drivers/remoteproc/remoteproc_core.c | 4 ++++
>>  1 file changed, 4 insertions(+)
>> 
>> diff --git a/drivers/remoteproc/remoteproc_core.c 
>> b/drivers/remoteproc/remoteproc_core.c
>> index 5ab65a4..52e318c 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1712,6 +1712,8 @@ static void rproc_crash_handler_work(struct 
>> work_struct *work)
>> 
>>  	if (!rproc->recovery_disabled)
>>  		rproc_trigger_recovery(rproc);
>> +
>> +	pm_relax(&rproc->dev);
>>  }
>> 
>>  /**
>> @@ -2242,6 +2244,8 @@ void rproc_report_crash(struct rproc *rproc, 
>> enum rproc_crash_type type)
>>  		return;
>>  	}
>> 
>> +	pm_stay_awake(&rproc->dev);
> 
> Following Mathieu's question I was expecting you to do this on
> rproc->dev.parent.
> 
> But looking at the implementation of pm_stay_awake(), it ends up being 
> a
> nop if dev->power.wakeup isn't specified. This in turn seems to come
> from device_wakeup_enable(), which will bail if dev->power.can_wakeup 
> is
> not set. But I don't see where this would be set for either the 
> platform
> driver or the remoteproc's struct device - and neither one of them have
> a "wakeup" attribute in sysfs.
> 
> Is there some additional plumbing needed for this?
We should be able to create a standalone wakeup source using 
wakeup_source_init.
Then we can use _pm_stay_awake and _pm_relax on it.
> 
> Regards,
> Bjorn
> 
>> +
>>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>>  		rproc->name, rproc_crash_to_string(type));
>> 
>> --
>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
