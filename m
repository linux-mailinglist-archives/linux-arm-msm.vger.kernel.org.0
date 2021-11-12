Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D1544E5BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 12:49:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhKLLwr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 06:52:47 -0500
Received: from smtp2.axis.com ([195.60.68.18]:44679 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234656AbhKLLwr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 06:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636717797;
  x=1668253797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pKNzvHA+abG5/SB0rgSIMnr0AelDwIA74K7UU91Gfho=;
  b=lyokw6DG7Ot0MohX4IPxCAMCXzH1jPvqJvIndKT8WSI0FccbqM2acMbX
   eqAUqg4ho0FSj6qdvjhPJ1D+iZowR4m0mm3JwMhSQvOdx9lRT/SHCGBdL
   RItvbEUegMBN0GA88mbxJ2pHXRNWQB8WCciK5iPGGu3DACvsjuAN0A6Or
   S6UuHUAgN1NqBMiQ2eNHx1yOMj9dfTRac5UR0SUa6ekZG+GwPNYoCUSHI
   0IVsKcaD9AISm9oBFaDCkk+TyLqQr7SpBWgi5OZxZRIpoDoaqRKpfBh/7
   wYx10DHvO+rkleW86eTR0CXYT7EVBGkjZ115YObRFprqudunCXKRSjUC3
   w==;
Date:   Fri, 12 Nov 2021 12:49:54 +0100
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     Jim Cromie <jim.cromie@gmail.com>
CC:     <jbaron@akamai.com>, <gregkh@linuxfoundation.org>,
        <robdclark@gmail.com>, <sean@poorly.run>, <daniel.vetter@ffwll.ch>,
        <seanpaul@chromium.org>, <lyude@redhat.com>,
        <linux-kernel@vger.kernel.org>, <rostedt@goodmis.org>,
        <mathieu.desnoyers@efficios.com>,
        <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
        <intel-gvt-dev@lists.freedesktop.org>,
        <intel-gfx@lists.freedesktop.org>, <quic_saipraka@quicinc.com>,
        <will@kernel.org>, <catalin.marinas@arm.com>,
        <quic_psodagud@quicinc.com>, <maz@kernel.org>, <arnd@arndb.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <mingo@redhat.com>
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with it
 - RFC
Message-ID: <20211112114953.GA1381@axis.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
 <20211111220206.121610-9-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211111220206.121610-9-jim.cromie@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 11, 2021 at 03:02:04PM -0700, Jim Cromie wrote:
> Sean Paul proposed, in:
> https://patchwork.freedesktop.org/series/78133/
> drm/trace: Mirror DRM debug logs to tracefs
> 
> His patchset's objective is to be able to independently steer some of
> the drm.debug stream to an alternate tracing destination, by splitting
> drm_debug_enabled() into syslog & trace flavors, and enabling them
> separately.  2 advantages were identified:
> 
> 1- syslog is heavyweight, tracefs is much lighter
> 2- separate selection of enabled categories means less traffic
> 
> Dynamic-Debug can do 2nd exceedingly well:
> 
> A- all work is behind jump-label's NOOP, zero off cost.
> B- exact site selectivity, precisely the useful traffic.
>    can tailor enabled set interactively, at shell.
> 
> Since the tracefs interface is effective for drm (the threads suggest
> so), adding that interface to dynamic-debug has real potential for
> everyone including drm.
> 
> if CONFIG_TRACING:
> 
> Grab Sean's trace_init/cleanup code, use it to provide tracefs
> available by default to all pr_debugs.  This will likely need some
> further per-module treatment; perhaps something reflecting hierarchy
> of module,file,function,line, maybe with a tuned flattening.
> 
> endif CONFIG_TRACING
> 
> Add a new +T flag to enable tracing, independent of +p, and add and
> use 3 macros: dyndbg_site_is_enabled/logging/tracing(), to encapsulate
> the flag checks.  Existing code treats T like other flags.

I posted a patchset a while ago to do something very similar, but that
got stalled for some reason and I unfortunately didn't follow it up:

 https://lore.kernel.org/lkml/20200825153338.17061-1-vincent.whitchurch@axis.com/

A key difference between that patchset and this patch (besides that
small fact that I used +x instead of +T) was that my patchset allowed
the dyndbg trace to be emitted to the main buffer and did not force them
to be in an instance-specific buffer.

That feature is quite important at least for my use case since I often
use dyndbg combined with function tracing, and the latter doesn't work
on non-main instances according to Documentation/trace/ftrace.rst.

For example, here's a random example of a bootargs from one of my recent
debugging sessions:

 trace_event=printk:* ftrace_filter=_mmc*,mmc*,sd*,dw_mci*,mci*
 ftrace=function trace_buf_size=20M dyndbg="file drivers/mmc/* +x"

