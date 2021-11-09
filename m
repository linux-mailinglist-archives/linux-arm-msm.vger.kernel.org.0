Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB4D044B1A0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 17:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235480AbhKIRCk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 12:02:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:37442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234305AbhKIRCk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 12:02:40 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E90E0611AF;
        Tue,  9 Nov 2021 16:59:52 +0000 (UTC)
Date:   Tue, 9 Nov 2021 11:59:51 -0500
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
Message-ID: <20211109115951.1c2b5228@gandalf.local.home>
In-Reply-To: <f7c665b9-dc17-5a7f-de80-9fa0605721fc@quicinc.com>
References: <cover.1636452784.git.quic_saipraka@quicinc.com>
        <3706af20bc64a320ff8f3ff8950738b988f4bdf5.1636452784.git.quic_saipraka@quicinc.com>
        <20211109104941.2d50eafc@gandalf.local.home>
        <f7c665b9-dc17-5a7f-de80-9fa0605721fc@quicinc.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 9 Nov 2021 21:52:26 +0530
Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:

> >>      rwmmio_read: rpmh_rsc_probe+0x35c/0x410 readl addr=0xffff80001071000c
> >>      rwmmio_read: rpmh_rsc_probe+0x3d0/0x410 readl addr=0xffff800010710004
> >>      rwmmio_write: rpmh_rsc_probe+0x3b0/0x410 writel addr=0xffff800010710d00 val=0x3
> >>      rwmmio_write: write_tcs_cmd+0x6c/0x78 writel addr=0xffff800010710d30 val=0x10108  
> > I'd much rather have a module name or something attached to the event that
> > ca be filtered on via the trace event filters, than having it determined by
> > some side effect done in another directory.  
> 
> I presume we don't have CALLER_MODULENAME0,1,2.. like CALLER_ADDR0,1,2 
> without which we
> cannot insert the module name to this trace event since MMIO accessors 
> are defined in low level
> arch headers and we won't get any useful module information from where 
> these accessors are
> called. The function name and the offset is good enough to identify the 
> exact line and module after
> post-processing with tools like GDB, objdump, so I feel we can keep the 
> trace event fields limited?

I'm thinking we can pass the descriptor to the event and not have it record
it. We could add a new field type for defining the event. Something like:

	__filter_field()

that has size zero in the event itself, but is available to the filtering
logic. Than perhaps we could pass that descriptor to the filter that has
all the information needed.

	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, width);
	log_read_mmio(width, addr, descriptor);

Where descriptor is NULL when dynamic debug in disabled.

Have a way to pass that descriptor to the filtering logic (I'll have to
take a look into it) and then be able to use the normal filtering.

This way you could also create multiple instances, where one instance
records the events coming from one file, and the other records events from
another file, and not have just one big switch that disables all calls to
log_read_mmio().

-- Steve
