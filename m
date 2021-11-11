Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FE6744D729
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Nov 2021 14:24:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232997AbhKKN10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 08:27:26 -0500
Received: from mail.efficios.com ([167.114.26.124]:37520 "EHLO
        mail.efficios.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231380AbhKKN1Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 08:27:25 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id C098839676E;
        Thu, 11 Nov 2021 08:24:35 -0500 (EST)
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id YYeI4G3aTRmn; Thu, 11 Nov 2021 08:24:35 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
        by mail.efficios.com (Postfix) with ESMTP id 20DA93968C7;
        Thu, 11 Nov 2021 08:24:35 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 20DA93968C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
        s=default; t=1636637075;
        bh=pmN1tZi2Ga/dogjwxPcnzqahDJ8goX5On/iHqGwpSbE=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=Ep8aNNCfY7m5K1FBeU42+IxLJnYEeIucA9LeFe7FtX6rgfdqjKKAIxiSxtzpYBpMw
         JwhI8VJ5GoYdFQAthOyyF7sBoN2oCZN7726uMOg2cJ4tutjs/Lg6RNzqjAEKOechyX
         O1eWLaSXwfJ0o6BBu4oA9U6KhWoftzN0ViFg0zH7LPd30Q94HCSjjWZzaq3v174fHE
         FLCEZ99WL+hSAXD+oYI3a6fsDYKNTo5J3HtjM4yOGNxguccT1jeUKjvf6LxyDtvl4w
         GChlGiWSB/IR0QXL1JOJh0eKN2LLk5tRRa1xFxvu/RLRY3BNilhWUXD/db3b1MP1tM
         Q56Cr0aCyRIxw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
        by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id zsyUYC97eWzG; Thu, 11 Nov 2021 08:24:35 -0500 (EST)
Received: from mail03.efficios.com (mail03.efficios.com [167.114.26.124])
        by mail.efficios.com (Postfix) with ESMTP id 083E1396B00;
        Thu, 11 Nov 2021 08:24:35 -0500 (EST)
Date:   Thu, 11 Nov 2021 08:24:34 -0500 (EST)
From:   Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To:     rostedt <rostedt@goodmis.org>
Cc:     jbaron <jbaron@akamai.com>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        quic psodagud <quic_psodagud@quicinc.com>,
        maz <maz@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        jim cromie <jim.cromie@gmail.com>, seanpaul@chromium.org
Message-ID: <1665247433.56.1636637074878.JavaMail.zimbra@efficios.com>
In-Reply-To: <20211109172848.304b1c19@gandalf.local.home>
References: <cover.1636452784.git.quic_saipraka@quicinc.com> <264b77dd-5509-60f9-248c-a93135b01aa9@quicinc.com> <20211109124046.2a772bcb@gandalf.local.home> <c5715db5-965b-c1f5-3e99-04caec3d4f2c@quicinc.com> <e037f449-9784-c78e-431d-43f035a9f49f@akamai.com> <20211109165104.176b4cf9@gandalf.local.home> <55a9fe7b-5573-0f80-e075-758b377a6c47@akamai.com> <20211109172848.304b1c19@gandalf.local.home>
Subject: Re: [PATCHv3 3/3] dynamic_debug: Add a flag for dynamic event
 tracing
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [167.114.26.124]
X-Mailer: Zimbra 8.8.15_GA_4156 (ZimbraWebClient - FF94 (Linux)/8.8.15_GA_4156)
Thread-Topic: dynamic_debug: Add a flag for dynamic event tracing
Thread-Index: ETB17VPNXK5+4Gp8n5NYuqqK7RA4yg==
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

----- On Nov 9, 2021, at 5:28 PM, rostedt rostedt@goodmis.org wrote:

> [ Hmm, should add Mathieu in on this discussion ]
> 
> On Tue, 9 Nov 2021 17:13:13 -0500
> Jason Baron <jbaron@akamai.com> wrote:
> 
>> > What we are looking at there is to pass the dynamic debug descriptor to the
>> > trace event filtering logic, where you could filter on information passed
>> > to it. For example, on a specific file if a trace event is called by
>> > several different files or modules.
>> > 
>> > -- Steve
>> 
>> Ok, Could this be done at the dynamic debug level as it can already match
>> on specific files and line numbers currently?
> 
> Not sure what you mean by that.
> 
> The idea was that this would only be enabled if dynamic debug is enabled
> and that the DEFINE_DYNAMIC_DEBUG_METADATA() could be used at the
> tracepoint function location (trace_foo()) by the tracepoint macros. And
> then if one of the callbacks registered for the tracepoint had a
> "dynamic_debug" flag set, it would be passed the descriptor in as a pointer.
> 
> And then, for example, the filtering logic of ftrace could then reference
> the information of the event, if the user passed in something special.
> 
> # echo 'DEBUG_FILE ~ "drivers/soc/qcom/*"' > events/rwmmio/rwmmio_write/filter
> # echo 1 > events/rwmmio/rwmmio_write/enable
> 
> And then only the rwmmio_write events that came from the qcom directory
> would be printed.
> 
> We would create special event fields like "DEBUG_FILE", "DEBUG_FUNC",
> "DEBUG_MOD", "DEBUG_LINE", etc, that could be used if dyndebug is enabled
> in the kernel.
> 
> Of course this is going to bloat the kernel as it will create a dynamic
> debug descriptor at every tracepoint location.

I think there is indeed value in doing this. Where I'm not sure is regarding
how we allow this to be enabled/configured.

The way I see it, it might be sufficient and simpler to do just something along
those lines:

- Introduce a new struct tracepoint_caller_info, which would contain information
  about file, line number and module name where each trace_*() statement is located.
- Add a new CONFIG_TRACEPOINT_CALLER_INFO which generates this new structure at
  build time for kernel and modules. This would indeed bloat the kernel, but it's
  a build-time configurable trade-off.
- Change the prototype for the tracepoint callbacks to add an additional argument
  "struct tracepoint_caller_info *caller_info". When CONFIG_TRACEPOINT_CALLER_INFO
  is disabled, simply have this pointer be NULL. When CONFIG_TRACEPOINT_CALLER_INFO
  is enabled, pass the tracepoint's caller_info structure as parameter.

It should be straightforward to adapt the tracepoint callback prototypes within each
user within the Linux kernel tree. And for out-of-tree users, they have to adapt to
that kind of change already anyway.

Thoughts ?

Thanks,

Mathieu

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
