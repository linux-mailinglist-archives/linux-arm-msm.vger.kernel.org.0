Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 588C344EC43
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 18:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235122AbhKLR5q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Nov 2021 12:57:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:51452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231919AbhKLR5q (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Nov 2021 12:57:46 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6771D60EBD;
        Fri, 12 Nov 2021 17:54:53 +0000 (UTC)
Date:   Fri, 12 Nov 2021 12:54:51 -0500
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
Message-ID: <20211112125451.76b00818@gandalf.local.home>
In-Reply-To: <cfbc074c-73a5-b6be-580b-dae398d95d6b@akamai.com>
References: <20211111220206.121610-1-jim.cromie@gmail.com>
        <20211111220206.121610-9-jim.cromie@gmail.com>
        <20211112114953.GA1381@axis.com>
        <f3914fa9-8b22-d54e-3f77-d998e74094b9@akamai.com>
        <20211112120721.3a4827ce@gandalf.local.home>
        <cfbc074c-73a5-b6be-580b-dae398d95d6b@akamai.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 12 Nov 2021 12:32:23 -0500
Jason Baron <jbaron@akamai.com> wrote:

> Ok, it looks like Vincent's patch defines a dyndbg event and then uses
> 'trace_dyndbg()' to output to the 'main' log. So all dynamic output to
> the 'main' ftrace buffer goes through that event if I understand it
> correctly. Here's a pointer to it for reference:
> 
> https://lore.kernel.org/lkml/20200825153338.17061-3-vincent.whitchurch@axis.com/
> 
> Would you be ok with that approach?

Yes that approach is fine, because it doesn't actually go to the main log
unless you enable the dyndbg trace event in the main buffer. You could
also enable that event in an instance and have it go there.

-- Steve
