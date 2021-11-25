Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F43745DBB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 14:53:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349619AbhKYN4e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 08:56:34 -0500
Received: from smtp1.axis.com ([195.60.68.17]:61038 "EHLO smtp1.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355299AbhKYNye (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 08:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1637848283;
  x=1669384283;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IZMfh96pc1eATKuBd9LQI2ag0STcz/D7Jqsa3v1w6EA=;
  b=h6XUS44P03hv5Yq4q5MR+cKyhGt8qGuJWglOJNQ3Diprb3VZAJDmhaGx
   2fOdyVNUAQMuUyYLMtHyzBUSSRqDy3msfYwRKc76UHGmHj++LBDiujHs3
   3xw+/okM+5JNQFVBfhiN+LWhyno9HNtFxPMVM9c+OH3jnMirXv6U4+2f6
   WZtZXrwzWyXChzmHsfM9eDQNlB0kfCXJE4zxLx1zwne5QUrtwdEzsqvM8
   dSYRzOj0p6UDhdggEFMxsCTGIarczkazUIC/S9AHEbSJU+HuTaER1IIVq
   UnyppeWmksgOuc7F9eVsXL1VvD6QKA+wK8Oq8x6kNRgG1R6NwLH8Bdwsx
   Q==;
Date:   Thu, 25 Nov 2021 14:51:19 +0100
From:   Vincent Whitchurch <vincent.whitchurch@axis.com>
To:     "jim.cromie@gmail.com" <jim.cromie@gmail.com>
CC:     Jason Baron <jbaron@akamai.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
        "quic_saipraka@quicinc.com" <quic_saipraka@quicinc.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Will Deacon <will@kernel.org>,
        "maz@kernel.org" <maz@kernel.org>,
        amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
        Ingo Molnar <mingo@redhat.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "intel-gvt-dev@lists.freedesktop.org" 
        <intel-gvt-dev@lists.freedesktop.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "quic_psodagud@quicinc.com" <quic_psodagud@quicinc.com>,
        "mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH v10 08/10] dyndbg: add print-to-tracefs, selftest with it
 - RFC
Message-ID: <20211125135119.GA7625@axis.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
 <20211111220206.121610-9-jim.cromie@gmail.com>
 <20211112114953.GA1381@axis.com>
 <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
 <20211116104631.195cbd0b@eldfell>
 <f87b7076-47e6-89b1-aaf9-b67aa6713e01@akamai.com>
 <20211118172401.0b4d722e@eldfell>
 <41ea83b2-a707-cb6f-521e-070bb12502de@akamai.com>
 <CAJfuBxyvDtALAHM53RdnWT4ke6Cjrc3OWTAqNKe_n-o_LhtpYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAJfuBxyvDtALAHM53RdnWT4ke6Cjrc3OWTAqNKe_n-o_LhtpYg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 19, 2021 at 11:46:31PM +0100, jim.cromie@gmail.com wrote:
> Vincent's code has the macro magic to define that event, which IIUC
> is what  makes it controllable by ftrace, and therefore acceptable in
> principle to Steve.
> Would there be any reason to expand his set of 2 events into dev_dbg,
> pr_debug etc varieties ?
> (ie any value to separating dev, !dev ?, maybe so
> 
> Sean's code uses trace_array_printk primarily, which is EXPORTed,
> which is a virtue.
> 
> Vincents code does
> +/*
> + * This code is heavily based on __ftrace_trace_stack().
> + *
> + * Allow 4 levels of nesting: normal, softirq, irq, NMI.
> + */
> 
> to implement
> 
> +static void dynamic_trace(const char *fmt, va_list args)
> 
> Has this __ftrace_trace_stack() code been bundled into or hidden under
> a supported interface ?
> 
> would it look anything like trace_array_printk() ?
> 
> what problem is that code solving inside dynamic-debug.c ?

I'm not sure I fully understand all of your questions, but perhaps this
thread with Steven's reply to the first version of my patchset will
answer some of them:

 https://lore.kernel.org/lkml/20200723112644.7759f82f@oasis.local.home/
