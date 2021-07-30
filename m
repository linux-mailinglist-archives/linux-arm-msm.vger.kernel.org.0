Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499E53DC133
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jul 2021 00:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232672AbhG3Wlc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 18:41:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:32818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231189AbhG3Wlb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 18:41:31 -0400
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 527EA60524;
        Fri, 30 Jul 2021 22:41:25 +0000 (UTC)
Date:   Fri, 30 Jul 2021 18:41:18 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Kamal Agrawal <kamaagra@codeaurora.org>
Cc:     mingo@redhat.com, linux-kernel@vger.kernel.org,
        mhiramat@kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] tracing: Fix NULL pointer dereference in start_creating
Message-ID: <20210730184118.0ea8ef20@oasis.local.home>
In-Reply-To: <1627651386-21315-1-git-send-email-kamaagra@codeaurora.org>
References: <1627651386-21315-1-git-send-email-kamaagra@codeaurora.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 30 Jul 2021 18:53:06 +0530
Kamal Agrawal <kamaagra@codeaurora.org> wrote:

> The event_trace_add_tracer() can fail. In this case, it leads to a crash
> in start_creating with below call stack. Handle the error scenario
> properly in trace_array_create_dir.
> 
> Call trace:
> down_write+0x7c/0x204
> start_creating.25017+0x6c/0x194
> tracefs_create_file+0xc4/0x2b4
> init_tracer_tracefs+0x5c/0x940
> trace_array_create_dir+0x58/0xb4
> trace_array_create+0x1bc/0x2b8
> trace_array_get_by_name+0xdc/0x18c
> 
> Fixes: 4114fbfd

Thanks, I'll queue this up.

-- Steve

> Signed-off-by: Kamal Agrawal <kamaagra@codeaurora.org>
> ---
>  kernel/trace/trace.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index c59dd35..33899a7 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -9135,8 +9135,10 @@ static int trace_array_create_dir(struct trace_array *tr)
>  		return -EINVAL;
>  
>  	ret = event_trace_add_tracer(tr->dir, tr);
> -	if (ret)
> +	if (ret) {
>  		tracefs_remove(tr->dir);
> +		return ret;
> +	}
>  
>  	init_tracer_tracefs(tr, tr->dir);
>  	__update_tracer_options(tr);

