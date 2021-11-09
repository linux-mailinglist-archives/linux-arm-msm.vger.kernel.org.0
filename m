Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBE4B44B8D6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 23:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346529AbhKIWqN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 17:46:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:35026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1346263AbhKIWoN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 17:44:13 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 32A4E6108C;
        Tue,  9 Nov 2021 22:28:50 +0000 (UTC)
Date:   Tue, 9 Nov 2021 17:28:48 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jason Baron <jbaron@akamai.com>
Cc:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        quic_psodagud@quicinc.com, Marc Zyngier <maz@kernel.org>,
        gregkh@linuxfoundation.org, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mingo@redhat.com,
        jim.cromie@gmail.com, seanpaul@chromium.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCHv3 3/3] dynamic_debug: Add a flag for dynamic event
 tracing
Message-ID: <20211109172848.304b1c19@gandalf.local.home>
In-Reply-To: <55a9fe7b-5573-0f80-e075-758b377a6c47@akamai.com>
References: <cover.1636452784.git.quic_saipraka@quicinc.com>
        <3706af20bc64a320ff8f3ff8950738b988f4bdf5.1636452784.git.quic_saipraka@quicinc.com>
        <20211109104941.2d50eafc@gandalf.local.home>
        <f7c665b9-dc17-5a7f-de80-9fa0605721fc@quicinc.com>
        <20211109115951.1c2b5228@gandalf.local.home>
        <264b77dd-5509-60f9-248c-a93135b01aa9@quicinc.com>
        <20211109124046.2a772bcb@gandalf.local.home>
        <c5715db5-965b-c1f5-3e99-04caec3d4f2c@quicinc.com>
        <e037f449-9784-c78e-431d-43f035a9f49f@akamai.com>
        <20211109165104.176b4cf9@gandalf.local.home>
        <55a9fe7b-5573-0f80-e075-758b377a6c47@akamai.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[ Hmm, should add Mathieu in on this discussion ]

On Tue, 9 Nov 2021 17:13:13 -0500
Jason Baron <jbaron@akamai.com> wrote:

> > What we are looking at there is to pass the dynamic debug descriptor to the
> > trace event filtering logic, where you could filter on information passed
> > to it. For example, on a specific file if a trace event is called by
> > several different files or modules.
> > 
> > -- Steve  
> 
> Ok, Could this be done at the dynamic debug level as it can already match
> on specific files and line numbers currently?

Not sure what you mean by that.

The idea was that this would only be enabled if dynamic debug is enabled
and that the DEFINE_DYNAMIC_DEBUG_METADATA() could be used at the
tracepoint function location (trace_foo()) by the tracepoint macros. And
then if one of the callbacks registered for the tracepoint had a
"dynamic_debug" flag set, it would be passed the descriptor in as a pointer.

And then, for example, the filtering logic of ftrace could then reference
the information of the event, if the user passed in something special.

 # echo 'DEBUG_FILE ~ "drivers/soc/qcom/*"' > events/rwmmio/rwmmio_write/filter
 # echo 1 > events/rwmmio/rwmmio_write/enable

And then only the rwmmio_write events that came from the qcom directory
would be printed.

We would create special event fields like "DEBUG_FILE", "DEBUG_FUNC",
"DEBUG_MOD", "DEBUG_LINE", etc, that could be used if dyndebug is enabled
in the kernel.

Of course this is going to bloat the kernel as it will create a dynamic
debug descriptor at every tracepoint location.

-- Steve
