Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C915844EBC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 18:07:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbhKLRKQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 12:10:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:58956 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230051AbhKLRKP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 12:10:15 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B42A36058D;
        Fri, 12 Nov 2021 17:07:22 +0000 (UTC)
Date:   Fri, 12 Nov 2021 12:07:21 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Jason Baron <jbaron@akamai.com>
Cc:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        Jim Cromie <jim.cromie@gmail.com>, gregkh@linuxfoundation.org,
        robdclark@gmail.com, sean@poorly.run, daniel.vetter@ffwll.ch,
        seanpaul@chromium.org, lyude@redhat.com,
        linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, quic_saipraka@quicinc.com,
        will@kernel.org, catalin.marinas@arm.com,
        quic_psodagud@quicinc.com, maz@kernel.org, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mingo@redhat.com
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with
 it - RFC
Message-ID: <20211112120721.3a4827ce@gandalf.local.home>
In-Reply-To: <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
        <20211111220206.121610-9-jim.cromie@gmail.com>
        <20211112114953.GA1381@axis.com>
        <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 12 Nov 2021 10:08:41 -0500
Jason Baron <jbaron@akamai.com> wrote:

> > A key difference between that patchset and this patch (besides that
> > small fact that I used +x instead of +T) was that my patchset allowed
> > the dyndbg trace to be emitted to the main buffer and did not force them
> > to be in an instance-specific buffer.  
> 
> Yes, I agree I'd prefer that we print here to the 'main' buffer - it seems to keep things simpler and easier to combine the output from different
> sources as you mentioned.

I do not want anything to print to the "main buffer" that can not be
filtered or turned off by the tracing infrastructure itself (aka tracefs
file system).

Once we allow that, then the trace file will become useless because
everything will write to the main buffer and fill it with noise.

Events that can be enabled and disabled from tracefs are fine, as they can
be limited. This is why I added that nasty warning if people leave around
trace_printk(), because it does exactly this (write to the main buffer).
It's fine for debugging a custom kernel, but should never be enabled in
something that is shipped, or part of mainline.

-- Steve
