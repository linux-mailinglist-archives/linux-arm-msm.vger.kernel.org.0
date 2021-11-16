Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCCD1453C53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 23:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhKPWna (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 17:43:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:58490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229694AbhKPWn2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 17:43:28 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D24961057;
        Tue, 16 Nov 2021 22:40:29 +0000 (UTC)
Date:   Tue, 16 Nov 2021 17:40:27 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <quic_psodagud@quicinc.com>, Marc Zyngier <maz@kernel.org>,
        <gregkh@linuxfoundation.org>, <arnd@arndb.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <mingo@redhat.com>
Subject: Re: [PATCHv4 2/2] arm64/io: Add a header for mmio access
 instrumentation
Message-ID: <20211116174027.14015dff@gandalf.local.home>
In-Reply-To: <9396fbdc415a3096ab271868960372b21479e4fb.1636973694.git.quic_saipraka@quicinc.com>
References: <cover.1636973694.git.quic_saipraka@quicinc.com>
        <9396fbdc415a3096ab271868960372b21479e4fb.1636973694.git.quic_saipraka@quicinc.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 15 Nov 2021 17:03:30 +0530
Sai Prakash Ranjan <quic_saipraka@quicinc.com> wrote:

> The new generic header mmio-instrumented.h will keep arch code clean
> and separate from instrumented version which traces mmio register
> accesses. This instrumented header is generic and can be used by other
> architectures as well. Also add a generic flag (__DISABLE_TRACE_MMIO__)
> which is used to disable MMIO tracing in nVHE and if required can be
> used to disable tracing for specific drivers.
> 
> Signed-off-by: Sai Prakash Ranjan <quic_saipraka@quicinc.com>
> ---
>  arch/arm64/include/asm/io.h       | 25 ++++-------
>  arch/arm64/kvm/hyp/nvhe/Makefile  |  2 +-
>  include/linux/mmio-instrumented.h | 70 +++++++++++++++++++++++++++++++
>  3 files changed, 80 insertions(+), 17 deletions(-)
>  create mode 100644 include/linux/mmio-instrumented.h
> 
> diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
> index 7fd836bea7eb..a635aaaf81b9 100644
> --- a/arch/arm64/include/asm/io.h
> +++ b/arch/arm64/include/asm/io.h
> @@ -10,6 +10,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/pgtable.h>
> +#include <linux/mmio-instrumented.h>
>  
>  #include <asm/byteorder.h>
>  #include <asm/barrier.h>
> @@ -21,32 +22,27 @@
>  /*
>   * Generic IO read/write.  These perform native-endian accesses.
>   */
> -#define __raw_writeb __raw_writeb
> -static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
> +static inline void arch_raw_writeb(u8 val, volatile void __iomem *addr)
>  {
>  	asm volatile("strb %w0, [%1]" : : "rZ" (val), "r" (addr));
>  }
>  
> -#define __raw_writew __raw_writew
> -static inline void __raw_writew(u16 val, volatile void __iomem *addr)
> +static inline void arch_raw_writew(u16 val, volatile void __iomem *addr)
>  {
>  	asm volatile("strh %w0, [%1]" : : "rZ" (val), "r" (addr));
>  }
>  
> -#define __raw_writel __raw_writel
> -static __always_inline void __raw_writel(u32 val, volatile void __iomem *addr)
> +static __always_inline void arch_raw_writel(u32 val, volatile void __iomem *addr)
>  {
>  	asm volatile("str %w0, [%1]" : : "rZ" (val), "r" (addr));
>  }
>  
> -#define __raw_writeq __raw_writeq
> -static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
> +static inline void arch_raw_writeq(u64 val, volatile void __iomem *addr)
>  {
>  	asm volatile("str %x0, [%1]" : : "rZ" (val), "r" (addr));
>  }
>  
> -#define __raw_readb __raw_readb
> -static inline u8 __raw_readb(const volatile void __iomem *addr)
> +static inline u8 arch_raw_readb(const volatile void __iomem *addr)
>  {
>  	u8 val;
>  	asm volatile(ALTERNATIVE("ldrb %w0, [%1]",
> @@ -56,8 +52,7 @@ static inline u8 __raw_readb(const volatile void __iomem *addr)
>  	return val;
>  }
>  
> -#define __raw_readw __raw_readw
> -static inline u16 __raw_readw(const volatile void __iomem *addr)
> +static inline u16 arch_raw_readw(const volatile void __iomem *addr)
>  {
>  	u16 val;
>  
> @@ -68,8 +63,7 @@ static inline u16 __raw_readw(const volatile void __iomem *addr)
>  	return val;
>  }
>  
> -#define __raw_readl __raw_readl
> -static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
> +static __always_inline u32 arch_raw_readl(const volatile void __iomem *addr)
>  {
>  	u32 val;
>  	asm volatile(ALTERNATIVE("ldr %w0, [%1]",
> @@ -79,8 +73,7 @@ static __always_inline u32 __raw_readl(const volatile void __iomem *addr)
>  	return val;
>  }
>  
> -#define __raw_readq __raw_readq
> -static inline u64 __raw_readq(const volatile void __iomem *addr)
> +static inline u64 arch_raw_readq(const volatile void __iomem *addr)

Shouldn't the above be done as a separate patch and handle other
architectures that implement __raw_read/write*()?


>  {
>  	u64 val;
>  	asm volatile(ALTERNATIVE("ldr %0, [%1]",
> diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
> index c3c11974fa3b..ff56d2165ea9 100644
> --- a/arch/arm64/kvm/hyp/nvhe/Makefile
> +++ b/arch/arm64/kvm/hyp/nvhe/Makefile
> @@ -4,7 +4,7 @@
>  #
>  
>  asflags-y := -D__KVM_NVHE_HYPERVISOR__ -D__DISABLE_EXPORTS
> -ccflags-y := -D__KVM_NVHE_HYPERVISOR__ -D__DISABLE_EXPORTS
> +ccflags-y := -D__KVM_NVHE_HYPERVISOR__ -D__DISABLE_EXPORTS -D__DISABLE_TRACE_MMIO__
>  
>  hostprogs := gen-hyprel
>  HOST_EXTRACFLAGS += -I$(objtree)/include
> diff --git a/include/linux/mmio-instrumented.h b/include/linux/mmio-instrumented.h
> new file mode 100644
> index 000000000000..99979c025cc1
> --- /dev/null
> +++ b/include/linux/mmio-instrumented.h
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _LINUX_MMIO_INSTRUMENTED_H
> +#define _LINUX_MMIO_INSTRUMENTED_H
> +
> +#include <linux/tracepoint-defs.h>
> +
> +/*
> + * Tracepoint and MMIO logging symbols should not be visible at EL2(HYP) as
> + * there is no way to execute them and any such MMIO access from EL2 will
> + * explode instantly (Words of Marc Zyngier). So introduce a generic flag
> + * __DISABLE_TRACE_MMIO__ to disable MMIO tracing in nVHE and other drivers
> + * if required.
> + */
> +#if IS_ENABLED(CONFIG_TRACE_MMIO_ACCESS) && !(defined(__DISABLE_TRACE_MMIO__))
> +DECLARE_TRACEPOINT(rwmmio_write);
> +DECLARE_TRACEPOINT(rwmmio_read);
> +
> +void log_write_mmio(const char *width, volatile void __iomem *addr);
> +void log_read_mmio(const char *width, const volatile void __iomem *addr);
> +
> +#define __raw_write(v, a, _l)	({				\
> +	volatile void __iomem *_a = (a);			\
> +	if (tracepoint_enabled(rwmmio_write))			\
> +		log_write_mmio(__stringify(write##_l), _a);	\
> +	arch_raw_write##_l((v), _a);				\
> +	})
> +
> +#define __raw_writeb(v, a)	__raw_write((v), a, b)
> +#define __raw_writew(v, a)	__raw_write((v), a, w)
> +#define __raw_writel(v, a)	__raw_write((v), a, l)
> +#define __raw_writeq(v, a)	__raw_write((v), a, q)
> +
> +#define __raw_read(a, _l, _t)    ({				\
> +	_t __a;							\
> +	const volatile void __iomem *_a = (a);			\
> +	if (tracepoint_enabled(rwmmio_read))			\
> +		log_read_mmio(__stringify(read##_l), _a);	\
> +	__a = arch_raw_read##_l(_a);				\
> +	__a;							\
> +	})
> +
> +#define __raw_readb(a)		__raw_read((a), b, u8)
> +#define __raw_readw(a)		__raw_read((a), w, u16)
> +#define __raw_readl(a)		__raw_read((a), l, u32)
> +#define __raw_readq(a)		__raw_read((a), q, u64)
> +
> +#else
> +
> +#define __raw_writeb(v, a)	arch_raw_writeb(v, a)
> +#define __raw_writew(v, a)	arch_raw_writew(v, a)
> +#define __raw_writel(v, a)	arch_raw_writel(v, a)
> +#define __raw_writeq(v, a)	arch_raw_writeq(v, a)
> +
> +#define __raw_readb(a)		arch_raw_readb(a)
> +#define __raw_readw(a)		arch_raw_readw(a)
> +#define __raw_readl(a)		arch_raw_readl(a)
> +#define __raw_readq(a)		arch_raw_readq(a)
> +
> +static inline void log_write_mmio(const char *width,
> +				  volatile void __iomem *addr) {}
> +static inline void log_read_mmio(const char *width,
> +				 const volatile void __iomem *addr) {}

The rest from a tracing point of view looks fine, and for that part:

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve


> +
> +#endif /* CONFIG_TRACE_MMIO_ACCESS */
> +
> +#endif /* _LINUX_MMIO_INSTRUMENTED_H */

