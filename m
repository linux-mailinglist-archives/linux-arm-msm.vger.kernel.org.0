Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7843C44B0AA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 16:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236659AbhKIPwb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 10:52:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:45092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236482AbhKIPwa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 10:52:30 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6EFA961186;
        Tue,  9 Nov 2021 15:49:43 +0000 (UTC)
Date:   Tue, 9 Nov 2021 10:49:41 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <quic_psodagud@quicinc.com>, Marc Zyngier <maz@kernel.org>,
        <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mingo@redhat.com>, <jbaron@akamai.com>, <jim.cromie@gmail.com>
Subject: Re: [PATCHv3 3/3] dynamic_debug: Add a flag for dynamic event
 tracing
Message-ID: <20211109104941.2d50eafc@gandalf.local.home>
In-Reply-To: <3706af20bc64a320ff8f3ff8950738b988f4bdf5.1636452784.git.quic_saipraka@quicinc.com>
References: <cover.1636452784.git.quic_saipraka@quicinc.com>
        <3706af20bc64a320ff8f3ff8950738b988f4bdf5.1636452784.git.quic_saipraka@quicinc.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 9 Nov 2021 17:38:21 +0530
Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:

> Debugging a specific driver or subsystem can be a lot easier if we can
> trace events specific to that driver or subsystem. This type of
> filtering can be achieved using existing dynamic debug library which
> provides a way to filter based on files, functions and modules.
> 
> Using this, provide an additional flag 'e' to filter event tracing to
> specified input.
> 
> For example, tracing all MMIO read/write can be overwhelming and of no
> use when debugging a specific driver or a subsystem. So switch to
> dynamic event tracing for register accesses.
> 
> Example: Tracing register accesses for all drivers in drivers/soc/qcom/*
> and the trace output is given below:
> 
>   # dyndbg="file drivers/soc/qcom/* +e" trace_event=rwmmio
>     or
>   # echo "file drivers/soc/qcom/* +e" > /sys/kernel/debug/dynamic_debug/control
>   # cat /sys/kernel/debug/tracing/trace

FYI, it's best to use /sys/kernel/tracing, as the debug/tracing is only
there for backward compatibility.

>     rwmmio_read: rpmh_rsc_probe+0x35c/0x410 readl addr=0xffff80001071000c
>     rwmmio_read: rpmh_rsc_probe+0x3d0/0x410 readl addr=0xffff800010710004
>     rwmmio_write: rpmh_rsc_probe+0x3b0/0x410 writel addr=0xffff800010710d00 val=0x3
>     rwmmio_write: write_tcs_cmd+0x6c/0x78 writel addr=0xffff800010710d30 val=0x10108

I'd much rather have a module name or something attached to the event that
ca be filtered on via the trace event filters, than having it determined by
some side effect done in another directory.

-- Steve
