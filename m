Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 924A230A2C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Feb 2021 08:42:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbhBAHl7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Feb 2021 02:41:59 -0500
Received: from so15.mailgun.net ([198.61.254.15]:56413 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230106AbhBAHlw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Feb 2021 02:41:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612165291; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=yMW31ExALK4q/x1FLxCfyASyzcs5rJIetxEO2UORNxE=;
 b=MfSpdQG7zkgpWJIMxeM99YxwDB5BWlCumkUwrIAD+FjhqzZ/mq6BlixvPwvdxkBfXd8A9SLG
 Sis0oCrYoL2h0F1epVQLu6Hzi1Djf28BzE4vgPWTvQYCNogXmt6pod2a0PDv8Lcie5L70Vv6
 NLT0DgezyxnjH4shHbdlyntKTJU=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6017b092f71e8b9934501493 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Feb 2021 07:41:06
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9F596C43464; Mon,  1 Feb 2021 07:41:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AB698C433CA;
        Mon,  1 Feb 2021 07:41:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 01 Feb 2021 13:11:04 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
        Al Grant <al.grant@arm.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] perf/core: Add support to exclude kernel mode
 instruction tracing
In-Reply-To: <20210129193040.GJ8912@worktop.programming.kicks-ass.net>
References: <cover.1611909025.git.saiprakash.ranjan@codeaurora.org>
 <89c7ff59d887a0360434e607bd625393ec3190e5.1611909025.git.saiprakash.ranjan@codeaurora.org>
 <20210129193040.GJ8912@worktop.programming.kicks-ass.net>
Message-ID: <3c96026b544c2244e57b46119427b8a0@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Peter,

On 2021-01-30 01:00, Peter Zijlstra wrote:
> On Sat, Jan 30, 2021 at 12:35:10AM +0530, Sai Prakash Ranjan wrote:
> 
>> Here the idea is to protect such important information from all users
>> including root users since root privileges does not have to mean full
>> control over the kernel [1] and root compromise does not have to be
>> the end of the world.
> 
> And yet, your thing lacks:
> 

I guess you mean this lacks an explanation as to why this only applies
to ITRACE and not others? See below.

>> +config EXCLUDE_KERNEL_HW_ITRACE
>> +	bool "Exclude kernel mode hardware assisted instruction tracing"
>> +	depends on PERF_EVENTS
> 	depends on SECURITY_LOCKDOWN
> 
> or whatever the appropriate symbol is.
> 

Ok I suppose you mean CONFIG_SECURITY_LOCKDOWN_LSM? But I don't see
how this new config has to depend on that? This can work independently
whether complete lockdown is enforced or not since it applies to only
hardware instruction tracing. Ideally this depends on several hardware
tracing configs such as ETMs and others but we don't need them because
we are already exposing PERF_PMU_CAP_ITRACE check in the events core.

>> +	help
>> +	  Exclude kernel mode instruction tracing by hardware tracing
>> +	  family such as ARM Coresight ETM, Intel PT and so on.
>> +
>> +	  This option allows to disable kernel mode instruction tracing
>> +	  offered by hardware assisted tracing for all users(including root)
>> +	  especially for production systems where only userspace tracing 
>> might
>> +	  be preferred for security reasons.
> 
> Also, colour me unconvinced, pretty much all kernel level PMU usage
> can be employed to side-channel / infer crypto keys, why focus on
> ITRACE over others?

Here ITRACE is not just instruction trace, it is meant for hardware 
assisted
instruction trace such as Intel PT, Intel BTS, ARM coresight etc. These 
provide
much more capabilities than normal instruction tracing whether its 
kernel level
or userspace. More specifically, these provide more accurate branch 
trace like
Intel PT LBR (Last Branch Record), Intel BTS(Branch Trace Store) which 
can be
used to decode the program flow more accurately with timestamps in real 
time
than other PMUs. Also there is cycle accurate tracing which can 
theoretically
be used for some speculative execution based attacks. Which other kernel 
level
PMUs can be used to get a full branch trace that is not locked down? If 
there
is one, then this should probably be applied to it as well.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
