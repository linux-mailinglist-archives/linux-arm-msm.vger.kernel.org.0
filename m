Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA5DA27A6D6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 07:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgI1FRy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 01:17:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:45030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbgI1FRy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 01:17:54 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2572521548;
        Mon, 28 Sep 2020 05:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601270273;
        bh=dRyaItky7NDVsosujj6hxANM/My0xGr500c9g2v3K80=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oILbqk42mgFiC/0wm+Hq8xqNtKTVeaNHNJVlq/yEsH5vTjhMAUIQqI/9VQahtvo+v
         ZQiUNBezGR+zks7Tha4miUxcT84MSypgy/CgJ98lYqOGnKzJjrBNbNN8jwKz78NPY7
         yGYEtpkqlY6gWDHQg+yTBHHqQ0RUqR+INn+RGTO4=
Date:   Mon, 28 Sep 2020 07:17:48 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Prasad Sodagudi <psodagud@codeaurora.org>
Cc:     rostedt@goodmis.org, mingo@redhat.com, keescook@chromium.org,
        saiprakash.ranjan@codeaurora.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, anton@enomsg.org, arnd@arndb.de,
        catalin.marinas@arm.com, ccross@android.com, jbaron@akamai.com,
        jim.cromie@gmail.com, joe@perches.com, joel@joelfernandes.org
Subject: Re: [PATCH] tracing: Add register read and write tracing support
Message-ID: <20200928051748.GA767987@kroah.com>
References: <1601253290-400618-1-git-send-email-psodagud@codeaurora.org>
 <1601253290-400618-2-git-send-email-psodagud@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1601253290-400618-2-git-send-email-psodagud@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 27, 2020 at 05:34:50PM -0700, Prasad Sodagudi wrote:
> Add register read/write operations tracing support.
> ftrace events helps trace register read and write
> location details of memory mapped IO registers. Also
> add _no_log variants the writel_relaxed/readl_relaed
> APIs to avoid excessive logging for certain register
> operations.
> 
> Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
> ---
>  arch/arm64/include/asm/io.h    | 117 ++++++++++++++++++++++++++++++++++++++---
>  include/linux/iorw.h           |  20 +++++++
>  include/trace/events/rwio.h    |  51 ++++++++++++++++++
>  kernel/trace/Kconfig           |  11 ++++
>  kernel/trace/Makefile          |   1 +
>  kernel/trace/trace_readwrite.c |  30 +++++++++++
>  6 files changed, 222 insertions(+), 8 deletions(-)
>  create mode 100644 include/linux/iorw.h
>  create mode 100644 include/trace/events/rwio.h
>  create mode 100644 kernel/trace/trace_readwrite.c
> 
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index ff50dd7..db5acff 100644
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

You are just logging the address, what about the data written or read?
Why throw away half of the information here?

Oh, and sending patches that break the build is generally not a good
thing to do :)

thanks,

greg k-h
