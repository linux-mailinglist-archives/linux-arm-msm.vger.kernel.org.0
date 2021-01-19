Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 915382FBA37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 15:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391164AbhASOqQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 09:46:16 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:51334 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392176AbhASMC2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 07:02:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611057709; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=T3sxeKkhmH8yFA4smvGRqtMhL0615rN/nOGoqsVelOY=;
 b=CYckzdLwRFZu4DAPGTzmsiDBiIR0ZzIpOppnmlWPz9rt4oet6rnRDzTcX89i3R2DLXeP1jtG
 yFQr5qPc/ylBHUICqq8dvel0RiZJLrheTt3z57GIMXd6tB3ejRPm9HzpbSnhHkTIIzNwJ3j/
 sHLWjkcwniave/qadk3TnLQzC2Y=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6006c9d721210999ed939b70 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Jan 2021 12:00:23
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D6372C43469; Tue, 19 Jan 2021 12:00:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C8E8C433ED;
        Tue, 19 Jan 2021 12:00:21 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 19 Jan 2021 17:30:21 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Al Grant <Al.Grant@arm.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, leo.yan@linaro.org,
        mnissler@google.com, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] coresight: etm4x: Add config to exclude kernel mode
 tracing
In-Reply-To: <de2487eb-ddb9-589a-8093-fae31235c884@arm.com>
References: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
 <20201015160257.GA1450102@xps15>
 <dd400fd7017a5d92b55880cf28378267@codeaurora.org>
 <20210118202354.GC464579@xps15>
 <32216e9fa5c9ffb9df1123792d40eafb@codeaurora.org>
 <DB7PR08MB3355E85C72492D4766F0BEFC86A30@DB7PR08MB3355.eurprd08.prod.outlook.com>
 <03b893801841f732a25072b4e62f8e0b@codeaurora.org>
 <de2487eb-ddb9-589a-8093-fae31235c884@arm.com>
Message-ID: <58bb6cfbfc9c30246fa8e2aba0964dc6@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Suzuki,

On 2021-01-19 16:03, Suzuki K Poulose wrote:
> On 1/19/21 9:51 AM, Sai Prakash Ranjan wrote:
>> Hi Al,
>> 
>> On 2021-01-19 14:06, Al Grant wrote:
>>> Hi Sai,
>>> 
>>>> From: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
>>>> Hi Mathieu,
>>>> 
>>>> On 2021-01-19 01:53, Mathieu Poirier wrote:
>>>> > On Fri, Jan 15, 2021 at 11:16:24AM +0530, Sai Prakash Ranjan wrote:
>>>> >> Hello Mathieu, Suzuki
>>>> >>
>>>> >> On 2020-10-15 21:32, Mathieu Poirier wrote:
>>>> >> > On Thu, Oct 15, 2020 at 06:15:22PM +0530, Sai Prakash Ranjan wrote:
>>>> >> > > On production systems with ETMs enabled, it is preferred to
>>>> >> > > exclude kernel mode(NS EL1) tracing for security concerns and
>>>> >> > > support only userspace(NS EL0) tracing. So provide an option via
>>>> >> > > kconfig to exclude kernel mode tracing if it is required.
>>>> >> > > This config is disabled by default and would not affect the
>>>> >> > > current configuration which has both kernel and userspace tracing
>>>> >> > > enabled by default.
>>>> >> > >
>>>> >> >
>>>> >> > One requires root access (or be part of a special trace group) to
>>>> >> > be able to use the cs_etm PMU.  With this kind of elevated access
>>>> >> > restricting tracing at EL1 provides little in terms of security.
>>>> >> >
>>>> >>
>>>> >> Apart from the VM usecase discussed, I am told there are other
>>>> >> security concerns here regarding need to exclude kernel mode tracing
>>>> >> even for the privileged users/root. One such case being the ability
>>>> >> to analyze cryptographic code execution since ETMs can record all
>>>> >> branch instructions including timestamps in the kernel and there may
>>>> >> be other cases as well which I may not be aware of and hence have
>>>> >> added Denis and Mattias. Please let us know if you have any questions
>>>> >> further regarding this not being a security concern.
>>>> >
>>>> > Even if we were to apply this patch there are many ways to compromise
>>>> > a system or get the kernel to reveal important information using the
>>>> > perf subsystem.  I would perfer to tackle the problem at that level
>>>> > rather than concentrating on coresight.
>>>> >
>>>> 
>>>> Sorry but I did not understand your point. We are talking about the 
>>>> capabilities
>>>> of coresight etm tracing which has the instruction level tracing and 
>>>> a lot more.
>>>> Perf subsystem is just the framework used for it.
>>>> In other words, its not the perf subsystem which does instruction 
>>>> level tracing,
>>>> its the coresight etm. Why the perf subsystem should be modified to 
>>>> lockdown
>>>> kernel mode? If we were to let perf handle all the trace filtering 
>>>> for different
>>>> exception levels, then why do we need the register settings in 
>>>> coresight etm
>>>> driver to filter out NS EL* tracing? And more importantly, how do 
>>>> you suppose
>>>> we handle sysfs mode of coresight tracing with perf subsystem?
>>> 
>>> You both have good points. Mathieu is right that this is not a 
>>> CoreSight
>>> issue specifically, it is a matter of kernel security policy, and 
>>> other hardware
>>> tracing mechanisms ought to be within its scope. There should be a 
>>> general
>>> "anti kernel exfiltration" config that applies to all mechanisms 
>>> within
>>> its scope, and we'd definitely expect that to include Intel PT as 
>>> well as ETM.
>>> 
>> 
>> I agree with this part where there should be a generic config for all
>> hardware tracing families(atleast for Intel PT and ARM Coresight),
>> Suzuki suggested that as well. I am under the impression that Mathieu
>> didn't like adding such a config and wanted perf subsystem to handle
>> it since initial discussion was around whether root compromise meant
>> everything is lost already and such a kconfig would not help, but
>> Mattias already gave some good examples where that is not true.
>> 
>>> A kernel config that forced exclude_kernel on all perf events would 
>>> deal with
>>> ETM and PT in one place, but miss the sysfs interface to ETM.
>>> 
>>> On the other hand, doing it in the ETM drivers would cover the perf 
>>> and sysfs
>>> interfaces to ETM, but would miss Intel PT.
>>> 
>>> So I think what is needed is a general config option that is both 
>>> implemented
>>> in perf (excluding all kernel tracing events) and by any drivers that 
>>> provide
>>> an alternative interface to hardware tracing events.
>>> 
>> 
>> I am good with this approach, once Mathieu confirms, I can add a 
>> kernel
>> wide kconfig as Suzuki suggested earlier and make ETM{3,4}x as the
>> initial users. Someone more familiar with Intel PTs can then make use
>> of this kconfig.
> 
> Instead of adding the support for individual drivers, you could handle 
> this
> in the generic perf layer. e.g, Fail perf_event create with an 
> attribute
> which allows kernel tracing ?
> 
> if (!attr.exclude_kernel)
> 	return -EINVAL;
> 
> Or even exclude the kernel silently always.
> 
> This could also be limited to PMUs with PERF_PMU_CAP_ITRACE, if you
> want to limit this to PMUs that instruction level tracing.
> 

Ah nice, wasn't aware of such a flag for instruction level tracing.
This sounds really good to me, I will use this in generic perf layer
and will have a config EXCLUDE_KERNEL_HW_ITRACE as you suggested
earlier.

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
