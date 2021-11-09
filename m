Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B1A344B4E9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 22:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243999AbhKIVxy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 16:53:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:58626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241983AbhKIVxy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 16:53:54 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7C5B361178;
        Tue,  9 Nov 2021 21:51:06 +0000 (UTC)
Date:   Tue, 9 Nov 2021 16:51:04 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jason Baron <jbaron@akamai.com>
Cc:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        quic_psodagud@quicinc.com, Marc Zyngier <maz@kernel.org>,
        gregkh@linuxfoundation.org, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mingo@redhat.com,
        jim.cromie@gmail.com, seanpaul@chromium.org
Subject: Re: [PATCHv3 3/3] dynamic_debug: Add a flag for dynamic event
 tracing
Message-ID: <20211109165104.176b4cf9@gandalf.local.home>
In-Reply-To: <e037f449-9784-c78e-431d-43f035a9f49f@akamai.com>
References: <cover.1636452784.git.quic_saipraka@quicinc.com>
        <3706af20bc64a320ff8f3ff8950738b988f4bdf5.1636452784.git.quic_saipraka@quicinc.com>
        <20211109104941.2d50eafc@gandalf.local.home>
        <f7c665b9-dc17-5a7f-de80-9fa0605721fc@quicinc.com>
        <20211109115951.1c2b5228@gandalf.local.home>
        <264b77dd-5509-60f9-248c-a93135b01aa9@quicinc.com>
        <20211109124046.2a772bcb@gandalf.local.home>
        <c5715db5-965b-c1f5-3e99-04caec3d4f2c@quicinc.com>
        <e037f449-9784-c78e-431d-43f035a9f49f@akamai.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 9 Nov 2021 16:42:48 -0500
Jason Baron <jbaron@akamai.com> wrote:

> Yeah there is a 'parallel' thread about adding the tracing ring buffer as
> a 'back end' to the dynamic debug stuff over here:
> https://lore.kernel.org/lkml/20211105192637.2370737-9-jim.cromie@gmail.com/

As the maintainer of tracefs, why am I not Cc'd on that thread :-(

I'll have to look at that thread later (no time now).

> 
> The attempt there is more generic but I realize now that it is adding the
> tracing to an 'instance' which is specific to dynamic debug which is
> being created via: trace_array_get_by_name(). I would prefer to just have
> it print to the 'main' trace buffer such that it's easier to read,
> although I guess they could still be consolidated via timestamps.
> Hmmm...I think there was a previous proposal to just add a single
> tracepoint (that takes a string) to the dynamic debug layer that could be
> called if a dynamic debug site is enabled for trace buffer output. Would
> that satisfy the ftrace level filtering requirements that you are looking
> for?

What we are looking at there is to pass the dynamic debug descriptor to the
trace event filtering logic, where you could filter on information passed
to it. For example, on a specific file if a trace event is called by
several different files or modules.

-- Steve
