Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6149744B213
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 18:40:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239652AbhKIRnh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 12:43:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:47526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236368AbhKIRng (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 12:43:36 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C7BC61208;
        Tue,  9 Nov 2021 17:40:49 +0000 (UTC)
Date:   Tue, 9 Nov 2021 12:40:46 -0500
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
Message-ID: <20211109124046.2a772bcb@gandalf.local.home>
In-Reply-To: <264b77dd-5509-60f9-248c-a93135b01aa9@quicinc.com>
References: <cover.1636452784.git.quic_saipraka@quicinc.com>
        <3706af20bc64a320ff8f3ff8950738b988f4bdf5.1636452784.git.quic_saipraka@quicinc.com>
        <20211109104941.2d50eafc@gandalf.local.home>
        <f7c665b9-dc17-5a7f-de80-9fa0605721fc@quicinc.com>
        <20211109115951.1c2b5228@gandalf.local.home>
        <264b77dd-5509-60f9-248c-a93135b01aa9@quicinc.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 9 Nov 2021 23:00:11 +0530
Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:

> Ah that's a very good idea, descriptor does contain the module, file name.
> We can probably even pass the module name,file name as string from the 
> descriptor itself to event?
> Perhaps we can do that for all trace events and not just this trace 
> event? Just like the trace event name displayed
> with trace events, perhaps have file name,module name displayed when 
> dynamic debug is enabled? Filtering by
> filename is pretty useful since most of these usecases in debugging will 
> be with respect to some driver or subsystems.

If we add this for all events, it would require a lot of changes to all
users of tracepoints, as it would require adding a new parameter to the
callbacks.

We could add a flag in the registering that states that the callback is OK
for it, and it passes that data as well.

Let me look into this for a bit. I may not have something this week, but
we should look into this more before adding little hacks that do this one
at a time like this patch.

-- Steve
