Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1882A8FA9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 07:49:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbgKFGtd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 01:49:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:39364 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726226AbgKFGtd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 01:49:33 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE0A720825;
        Fri,  6 Nov 2020 06:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604645372;
        bh=AsfhP1wqbywLFtoKXHYhKEJsKLATCe3IIPSMytcVEZQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jIwjpKJO/e61STmYXG3CRf2xvsYa6uG8rbpadudCSw2M9OlXvUeFxkLlwBT1C/OBP
         hWc+mQsM/K9DlMaBzVKC9L2K4WbqqW449SUrz1fyjLwyhmuAsLKyimLktDfbcjwPPp
         5f1de08YM+mCpH2SEj/b5CzupK7RMMpLNhqSfinE=
Date:   Fri, 6 Nov 2020 07:49:29 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Prasad Sodagudi <psodagud@codeaurora.org>
Cc:     rostedt@goodmis.org, mingo@redhat.com, keescook@chromium.org,
        catalin.marinas@arm.com, saiprakash.ranjan@codeaurora.org,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        anton@enomsg.org, arnd@arndb.de, ccross@android.com,
        jbaron@akamai.com, jim.cromie@gmail.com, joe@perches.com,
        joel@joelfernandes.org
Subject: Re: [PATCH v2] tracing: Add register read and write tracing support
Message-ID: <20201106064929.GC697514@kroah.com>
References: <1604631386-178312-1-git-send-email-psodagud@codeaurora.org>
 <1604631386-178312-2-git-send-email-psodagud@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604631386-178312-2-git-send-email-psodagud@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 05, 2020 at 06:56:26PM -0800, Prasad Sodagudi wrote:
> Add register read/write operations tracing support.
> ftrace events helps to trace register read and write
> location details of memory mapped IO registers.

This sentance does not parse for me, can you please rework it?

> These trace logs helps to debug un clocked access
> of peripherals.

"un clocked"?  What does that mean?

And you do have 72 columns to fill, please use it :)

> 
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> ---
>  arch/arm64/include/asm/io.h    |  9 ++++++++
>  arch/arm64/kernel/image-vars.h |  8 +++++++

You are only adding it for arm64, why not add the generic support first,
and then add it for all "major" arches afterwards?


>  include/linux/iorw.h           | 38 +++++++++++++++++++++++++++++++
>  include/trace/events/rwio.h    | 51 ++++++++++++++++++++++++++++++++++++++++++
>  kernel/trace/Kconfig           | 11 +++++++++
>  kernel/trace/Makefile          |  1 +
>  kernel/trace/trace_readwrite.c | 31 +++++++++++++++++++++++++
>  7 files changed, 149 insertions(+)
>  create mode 100644 include/linux/iorw.h
>  create mode 100644 include/trace/events/rwio.h
>  create mode 100644 kernel/trace/trace_readwrite.c
> 
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index fd172c4..bcfc65c 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -9,6 +9,7 @@
>  #define __ASM_IO_H
>  
>  #include <linux/types.h>
> +#include <linux/iorw.h>
>  #include <linux/pgtable.h>
>  
>  #include <asm/byteorder.h>
> @@ -24,24 +25,28 @@
>  #define __raw_writeb __raw_writeb
>  static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
>  {
> +	log_write_io(addr);
>  	asm volatile("strb %w0, [%1]" : : "rZ" (val), "r" (addr));

Why are you not logging the value here, and everywhere else?  You need
to document why that is somewhere, as it's the most obvious question you
will get.

thanks,

greg k-h
