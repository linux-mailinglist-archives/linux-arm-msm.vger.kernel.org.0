Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADCC296D0A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 12:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S462492AbgJWKtg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 06:49:36 -0400
Received: from foss.arm.com ([217.140.110.172]:49174 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S462356AbgJWKtg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 06:49:36 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 810BE113E;
        Fri, 23 Oct 2020 03:49:35 -0700 (PDT)
Received: from [10.57.13.45] (unknown [10.57.13.45])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 141CA3F66B;
        Fri, 23 Oct 2020 03:49:30 -0700 (PDT)
Subject: Re: [PATCHv2 2/4] coresight: tmc-etf: Fix NULL ptr dereference in
 tmc_enable_etf_sink_perf()
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mike Leach <mike.leach@linaro.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <cover.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <aa6e571156d6e26e54da0bb3015ba474e4a08da0.1603363729.git.saiprakash.ranjan@codeaurora.org>
 <20201022113214.GD2611@hirez.programming.kicks-ass.net>
 <e7d236f7-61c2-731d-571b-839e0e545563@arm.com>
 <20201022150609.GI2611@hirez.programming.kicks-ass.net>
 <788706f2-0670-b7b6-a153-3ec6f16e0f2e@arm.com>
 <20201022212033.GA646497@xps15>
 <20201023073905.GM2611@hirez.programming.kicks-ass.net>
 <174e6461-4d46-cb65-c094-c06ee3b21568@arm.com>
 <20201023092337.GQ2611@hirez.programming.kicks-ass.net>
From:   Suzuki Poulose <suzuki.poulose@arm.com>
Message-ID: <060def4c-ced9-74c5-8e73-d8aedfdbc107@arm.com>
Date:   Fri, 23 Oct 2020 11:49:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201023092337.GQ2611@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/23/20 10:23 AM, Peter Zijlstra wrote:
> On Fri, Oct 23, 2020 at 09:49:53AM +0100, Suzuki Poulose wrote:
>> On 10/23/20 8:39 AM, Peter Zijlstra wrote:
> 
>>> So then I don't understand the !->owner issue, that only happens when
>>> the task dies, which cannot be concurrent with event creation. Are you
>>
>> Part of the patch from Sai, fixes this by avoiding the dereferencing
>> after event creation (by caching it). But the kernel events needs
>> fixing.
>>
>> One follow up question on the !->owner issue. Given the ->owner is
>> dying, does it prevent events from being scheduled ? Or is there a delay
>> between that and eventually stopping the events. In this case, we hit
>> the issue when :
>>
>> A					  A or B ?
>>
>> event_start()
>>    ...					event->owner = NULL
>>
>>   READ_ONCE(event->owner);
>>
>> Is this expected ?
> 
> Yeah, teardown is a bit of an effort. Also, you can pass an fd over a
> unix socket to another process, so this isn't something you can rely on
> in any case.
> 
> The perf tool doesn't do it, but the kernel infra should be able to deal
> with someone doing a perf-deamon of sorts, where you can request a perf
> event and recieve a fd from it.
> 
> Imagine the fun ;-)
> 
>>> As for the kernel events.. why do you care about the actual task_struct
>>> * in there? I see you're using it to grab the task-pid, but how is that
>>> useful?
>>
>> Correct, kernel events are something that the driver didn't account for.
>> May be we could handle this case with a "special pid" and simply
>> disallow sharing (which is fine I believe, given there are not grouping
>> for the kernel created events).
> 
> Why do you need a pid in the first place? Can't you use the "task_struct
> *" as a value?

We could. But, without a refcount on the task pointer, that could be
tricky, even though we don't dereference it. In the same situation,
if the tsk owner dies and is freed and is reallocated to a new perf 
session task but with different PID, we could be mixing things up again
?

Special pid here could be -1.
