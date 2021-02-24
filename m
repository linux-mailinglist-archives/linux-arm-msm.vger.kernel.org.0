Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A324B324060
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 16:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232398AbhBXO42 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 09:56:28 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:12641 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232861AbhBXOxm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 09:53:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614178335; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=N87ndl58aewVgXGRdbRDKc1drOnXWcAqVB0ytpXHJME=;
 b=oWwGOk3+a9KeSkH+RB0O7ygsh4sW3KMOlPoRdMG8TYLs070Utc62IlW07SobtWtQvDfOSjME
 3E1VAU1XC2dc3LAb9Q7dmUsrerX6ipz+DPuAjJYAt43PyTMRcWTXKreNZIGQ3BVbe/HZxERv
 WncqCiHrr/XAgmPFNO6rInphZQg=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60366802e9080d5ff7c09a80 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 14:51:46
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A28B0C43463; Wed, 24 Feb 2021 14:51:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 579E7C433CA;
        Wed, 24 Feb 2021 14:51:44 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Feb 2021 20:21:44 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Leo Yan <leo.yan@linaro.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        Mattias Nissler <mnissler@chromium.org>,
        Al Grant <al.grant@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 3/4] coresight: etm4x: Add support to exclude kernel mode
 tracing
In-Reply-To: <CAD=FV=WUxPrFYGWbTAUYMC1nuPSHT3fk=fcE-fGVveHpr1KPhQ@mail.gmail.com>
References: <cover.1611909025.git.saiprakash.ranjan@codeaurora.org>
 <5d063d6035ff079b10e34cee110a26b856957ebe.1611909025.git.saiprakash.ranjan@codeaurora.org>
 <CAD=FV=WUxPrFYGWbTAUYMC1nuPSHT3fk=fcE-fGVveHpr1KPhQ@mail.gmail.com>
Message-ID: <a07cdbce55668405e8bc9471834e9237@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

Thanks for taking a look, comments inline.

On 2021-02-23 01:44, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jan 29, 2021 at 11:08 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> @@ -1202,6 +1207,13 @@ void etm4_config_trace_mode(struct etmv4_config 
>> *config)
>>         /* excluding kernel AND user space doesn't make sense */
>>         WARN_ON_ONCE(mode == (ETM_MODE_EXCL_KERN | 
>> ETM_MODE_EXCL_USER));
>> 
>> +       if (!(mode & ETM_MODE_EXCL_KERN) && 
>> IS_ENABLED(CONFIG_EXCLUDE_KERNEL_HW_ITRACE)) {
>> +               dev_err(&drvdata->csdev->dev,
>> +                       "Kernel mode tracing is not allowed, check 
>> your kernel config\n");
>> +               config->mode |= ETM_MODE_EXCL_KERN;
>> +               return;
> 
> So I'm not an expert on this code, but the above looks suspicious to
> me.  Specifically you are still modifying "config->mode" even though
> printing an "error" (dev_err, not dev_warn) and then skipping the rest
> of this function.  Since you're skipping the rest of this function
> you're not applying the access, right?  Naively I'd have expected one
> of these:
> 
> 1. Maybe the "dev_err" should be a "dev_warn" and then you shouldn't
> "return".  In this case you're just implicitly adding
> "ETM_MODE_EXCL_KERN" (and shouting) but then making things work.  Of
> course, then what happens if the user already specified
> "ETM_MODE_EXCL_USER" too?  As per the comment above that "doesn't make
> sense".  ...so maybe the code wouldn't behave properly...
> 
> 2. Maybe you should be modifying this function to return an error code.
> 

mode_store() which is the caller of this function sets the config->mode
based on the value passed in the sysfs, so if the user passes the mode
which doesn't exclude the kernel even though the kernel config is 
enabled
and the code just sets it, then that is an error and the user should be
warned about, so I used dev_err, but I can change it to dev_warn if that
is preferred. And to make sysfs mode show the original mode after 
failure,
I set the mode in etm4_config_trace_mode().

But you are right, I am skipping to set the config for other mode bits
and returning which is wrong, will fix it as you suggest below.

> 3. Maybe you should just be updating the one caller of this function
> to error check this right at the beginning of the function and then
> fail the sysfs write if the user did the wrong thing.  Then in
> etm4_config_trace_mode you could just have a WARN_ON_ONCE if the
> kernel wasn't excluded...
> 

Right, will do this.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
