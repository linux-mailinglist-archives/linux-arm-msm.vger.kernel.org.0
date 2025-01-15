Return-Path: <linux-arm-msm+bounces-45096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACAAA11EFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 11:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A039A7A440F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 10:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C9E1E7C15;
	Wed, 15 Jan 2025 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="XUhmSOcy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980751DB132
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 10:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736935930; cv=none; b=V62kQhK+pg082YupMDcFQq15kQulf33T3u30HY/Sp8OMBsFTxBf7xbRxs3VopY/w4/4yo4XhMFfIKkj+VGOo0QxDur9kv6h6rBO3G13qYvaUoTY+g/09TjzlK1rYCjMjYTzmhmh2QxBKGAD4ErpcB56+/yaQ5GOur5nINpZjAis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736935930; c=relaxed/simple;
	bh=T9YjIpq5ZfXh0SuqBjke7KyDXEeJPu57S85q04EGegI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=msJQOGdEFjEKbds8dJM0yUvNJ+gujp0WSocKHkgx1XjsuRlpjAOSyfg+jjbNzYeay9DtXRl2d3Ex9iq9RZN4TUQYYWl65jw9vnUHng/ss/ewomPj912dRaogXhWWyzcT5sLDA+9/rnX7qIRBG7yuu+V8jywXkLd6K9iEm0r5Vfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=XUhmSOcy; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250115101200euoutp015162ea7989eb21d21de234f86de9b56e~a1gRPYcMS1683716837euoutp01K
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 10:12:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250115101200euoutp015162ea7989eb21d21de234f86de9b56e~a1gRPYcMS1683716837euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1736935920;
	bh=a3f/WlowN54d9MMq+HK776E7FHhHlmdpQCtT88EoZsw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=XUhmSOcytkfFPTDiu2skiKO5WRzgRGhJsrGhM3AuoKqdbFLmj9+HxEgdkXEX4fVqf
	 TK0jAfy9djaFpEvFMTvsS+XIRClyIU383+XiQfOR5rKuBeOJ+zSdBOTC2dGs79SnmG
	 /mCN1+2EiK9/kK7KMk9AsZlJDut4CYPZ+lqhrZl0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250115101159eucas1p10a1c27976c5ca40fee0fc8a3c47f1008~a1gQwzywK0717307173eucas1p1C;
	Wed, 15 Jan 2025 10:11:59 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges1new.samsung.com (EUCPMTA) with SMTP id A7.5B.20821.FE987876; Wed, 15
	Jan 2025 10:11:59 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250115101159eucas1p1261a8b3e78b83c4fec63e3ac00e4d59a~a1gQb45Wp0945009450eucas1p1x;
	Wed, 15 Jan 2025 10:11:59 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250115101159eusmtrp10e17eaa4b601066615ea8aa528053ee9~a1gQbUVXk1014710147eusmtrp1o;
	Wed, 15 Jan 2025 10:11:59 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-b8-678789ef2d82
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id F8.32.19920.FE987876; Wed, 15
	Jan 2025 10:11:59 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250115101158eusmtip102a81f1da0858257a3a3360a7e31d84b~a1gPY1sPl2461024610eusmtip1U;
	Wed, 15 Jan 2025 10:11:58 +0000 (GMT)
Message-ID: <01515ea0-c6f0-479f-9da5-764d9ee79ed6@samsung.com>
Date: Wed, 15 Jan 2025 11:11:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: implement cacheinfo support
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sudeep Holla
	<sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Russell King
	<linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Konrad
	Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Linux
	Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20241014-armv7-cacheinfo-v2-2-38ab76d2b7fa@linaro.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRmVeSWpSXmKPExsWy7djP87rvO9vTDTp36lps67Cx+PnlPaPF
	30nH2C0mnv/JZrFg/zQWi02Pr7FaTNx/lt3i8q45bBYzzu9jsjg0dS+jxfJTO1gcuD3WzFvD
	6HH52kVmj9+/JjF6bFrVyeZx59oeNo/NS+o9Pm+SC2CP4rJJSc3JLEst0rdL4MqYvWUBY8Ed
	hYoPDzYxNjAel+pi5OSQEDCRuD7tG3MXIxeHkMAKRontc18yQThfGCU+nT/MCuF8ZpQ4v3wq
	C0zLyb+L2CESyxklNj15zwLhfGSU+L77B1sXIwcHr4CdxN3WIpAGFgFViXWPV4I18woISpyc
	+QTMFhWQl7h/awY7iC0sYCNxZ94hsDkiAosZJT43fgY7illgMpPEyT9rmECqmAXEJW49mQ9m
	swkYSnS97WIDsTkFXCSO7H/JCFEjL7H97RxmiFMnc0qcOBMLYbtIdMzaCxUXlnh1fAs7hC0j
	cXpyD9hmCYF2RokFv+8zQTgTGCUant9ihKiylrhz7hfYa8wCmhLrd+lDhB0lDj77xQQSlhDg
	k7jxVhDiBj6JSdumM0OEeSU62oQgqtUkZh1fB7f24IVLzBMYlWYhhcssJF/OQvLNLIS9CxhZ
	VjGKp5YW56anFhvmpZbrFSfmFpfmpesl5+duYgSmr9P/jn/awTj31Ue9Q4xMHIyHGCU4mJVE
	eJewtaYL8aYkVlalFuXHF5XmpBYfYpTmYFES5120HyglkJ5YkpqdmlqQWgSTZeLglGpgUldb
	mng65XW23drSTLNohx16R+cvNlpW8r2xROHy73m1qye8KmzMcJ3BdOXDQZcnDcHh9d+0Ap02
	LGF8yrooSWBmiJ99ncPND3mCC6+tvSzYNdN2+VdbVnO9kqOK61e0LPuasj5C8/7x6Om/1Fms
	BebZHbA9znrIsFP3GK9JiILfRS5/DYu3nFpWZVndJxWlQna9+5WbLX5OT8koUlJv22mTZXrM
	65yyFI8LL6udcPLVv+QNW/2qXZsWl79/bxtlJFdz5OrqIs8HWza8WJpgxa018cv+6U+elk/e
	tH7Pxiu7DsyM4WqtK3+nOtH8mMbR5VeYZip5Hvy0wI2vLLEzen+q31/NvCQVqfXGsVZcSizF
	GYmGWsxFxYkAX7gY3M4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRmVeSWpSXmKPExsVy+t/xu7rvO9vTDdYsFLPY1mFj8fPLe0aL
	v5OOsVtMPP+TzWLB/mksFpseX2O1mLj/LLvF5V1z2CxmnN/HZHFo6l5Gi+WndrA4cHusmbeG
	0ePytYvMHr9/TWL02LSqk83jzrU9bB6bl9R7fN4kF8AepWdTlF9akqqQkV9cYqsUbWhhpGdo
	aaFnZGKpZ2hsHmtlZKqkb2eTkpqTWZZapG+XoJcxe8sCxoI7ChUfHmxibGA8LtXFyMkhIWAi
	cfLvIvYuRi4OIYGljBI7Z19khEjISJyc1sAKYQtL/LnWxQZR9J5RYumTj8xdjBwcvAJ2Endb
	i0BqWARUJdY9XskCYvMKCEqcnPkEzBYVkJe4f2sGO4gtLGAjcWfeIRaQOSICixklzkxawwji
	MAtMZpK4s2YCE0iVkECtxJ0z08CuYBYQl7j1ZD5YnE3AUKLrLcgVnBycAi4SR/a/hKoxk+ja
	2gVly0tsfzuHeQKj0Cwkh8xCMmoWkpZZSFoWMLKsYhRJLS3OTc8tNtQrTswtLs1L10vOz93E
	CIzXbcd+bt7BOO/VR71DjEwcjIcYJTiYlUR4l7C1pgvxpiRWVqUW5ccXleakFh9iNAWGxkRm
	KdHkfGDCyCuJNzQzMDU0MbM0MLU0M1YS53W7fD5NSCA9sSQ1OzW1ILUIpo+Jg1OqgSm669Om
	s3eqDq2/kTTp7rWKXTNNG4v2hont0Dh1If7TLMl7eyeyzX54V/wsZ53q96d3r0THN/u6HNRs
	t5+00LwjyOHD1/OrH2wVquN+l+Uxaes0g58cuywbuHk1zh1Py367W857ze2Sq7f32Pgzt3hO
	2LBoTsii1TNiN6bwNt10/lxl8lkj2Xfeb+YZoXNmqnKZGT5z0LZsblrkvNW/6/23WUaKtb02
	375/a9snqMKvKOvklNhjFFmQ/Wv55ErVyLgLoU6HlZ7lpHJw8s1RPGo7LdRymVe4RsXSHq35
	l2SKIkrunXqyaMsT5nPz7iobd4e8n7f+oFmIdP6KNdX9Sg4/3y7NfvD1QoB5/r3A93OVWIoz
	Eg21mIuKEwHr2w7LYAMAAA==
X-CMS-MailID: 20250115101159eucas1p1261a8b3e78b83c4fec63e3ac00e4d59a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250115101159eucas1p1261a8b3e78b83c4fec63e3ac00e4d59a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250115101159eucas1p1261a8b3e78b83c4fec63e3ac00e4d59a
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
	<20241014-armv7-cacheinfo-v2-2-38ab76d2b7fa@linaro.org>
	<CGME20250115101159eucas1p1261a8b3e78b83c4fec63e3ac00e4d59a@eucas1p1.samsung.com>

On 14.10.2024 15:55, Dmitry Baryshkov wrote:
> On ARMv7 / v7m machines read CTR and CLIDR registers to provide
> information regarding the cache topology. Earlier machines should
> describe full cache topology in the device tree.
>
> Note, this follows the ARM64 cacheinfo support and provides only minimal
> support required to bootstrap cache info. All useful properties should
> be decribed in Device Tree.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/Kconfig             |   1 +
>   arch/arm/include/asm/cache.h |   6 ++
>   arch/arm/kernel/Makefile     |   1 +
>   arch/arm/kernel/cacheinfo.c  | 173 +++++++++++++++++++++++++++++++++++++++++++
>   include/linux/cacheinfo.h    |   2 +-
>   5 files changed, 182 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 749179a1d162..e790543c3eaf 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -5,6 +5,7 @@ config ARM
>   	select ARCH_32BIT_OFF_T
>   	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE if HAVE_KRETPROBES && FRAME_POINTER && !ARM_UNWIND
>   	select ARCH_HAS_BINFMT_FLAT
> +	select ARCH_HAS_CACHE_LINE_SIZE if OF
>   	select ARCH_HAS_CPU_CACHE_ALIASING
>   	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
>   	select ARCH_HAS_CURRENT_STACK_POINTER
> diff --git a/arch/arm/include/asm/cache.h b/arch/arm/include/asm/cache.h
> index e3ea34558ada..ecbc100d22a5 100644
> --- a/arch/arm/include/asm/cache.h
> +++ b/arch/arm/include/asm/cache.h
> @@ -26,4 +26,10 @@
>   
>   #define __read_mostly __section(".data..read_mostly")
>   
> +#ifndef __ASSEMBLY__
> +#ifdef CONFIG_ARCH_HAS_CACHE_LINE_SIZE
> +int cache_line_size(void);
> +#endif
> +#endif
> +
>   #endif
> diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
> index aaae31b8c4a5..b3333d070390 100644
> --- a/arch/arm/kernel/Makefile
> +++ b/arch/arm/kernel/Makefile
> @@ -40,6 +40,7 @@ obj-y		+= entry-armv.o
>   endif
>   
>   obj-$(CONFIG_MMU)		+= bugs.o
> +obj-$(CONFIG_OF)		+= cacheinfo.o
>   obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
>   obj-$(CONFIG_ISA_DMA_API)	+= dma.o
>   obj-$(CONFIG_FIQ)		+= fiq.o fiqasm.o
> diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
> new file mode 100644
> index 000000000000..a8eabcaa18d8
> --- /dev/null
> +++ b/arch/arm/kernel/cacheinfo.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *  ARM cacheinfo support
> + *
> + *  Copyright (C) 2023 Linaro Ltd.
> + *  Copyright (C) 2015 ARM Ltd.
> + *  All Rights Reserved
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cacheinfo.h>
> +#include <linux/of.h>
> +
> +#include <asm/cachetype.h>
> +#include <asm/cputype.h>
> +#include <asm/system_info.h>
> +
> +/* Ctypen, bits[3(n - 1) + 2 : 3(n - 1)], for n = 1 to 7 */
> +#define CLIDR_CTYPE_SHIFT(level)	(3 * (level - 1))
> +#define CLIDR_CTYPE_MASK(level)		(7 << CLIDR_CTYPE_SHIFT(level))
> +#define CLIDR_CTYPE(clidr, level)	\
> +	(((clidr) & CLIDR_CTYPE_MASK(level)) >> CLIDR_CTYPE_SHIFT(level))
> +
> +#define MAX_CACHE_LEVEL			7	/* Max 7 level supported */
> +
> +#define CTR_FORMAT_MASK	GENMASK(27, 24)
> +#define CTR_FORMAT_ARMV6 0
> +#define CTR_FORMAT_ARMV7 4
> +#define CTR_CWG_MASK	GENMASK(27, 24)
> +#define CTR_DSIZE_LEN_MASK GENMASK(13, 12)
> +#define CTR_ISIZE_LEN_MASK GENMASK(1, 0)
> +
> +/* Also valid for v7m */
> +static inline int cache_line_size_cp15(void)
> +{
> +	u32 ctr = read_cpuid_cachetype();
> +	u32 format = FIELD_GET(CTR_FORMAT_MASK, ctr);
> +

On Samsung Exynos421x (CortexA9 based) format is read as 0x3, which 
causes a warning later in the code. How such value should be handled to 
avoid warning?

> +	if (format == CTR_FORMAT_ARMV7) {
> +		u32 cwg = FIELD_GET(CTR_CWG_MASK, ctr);
> +
> +		return cwg ? 4 << cwg : ARCH_DMA_MINALIGN;
> +	} else if (WARN_ON_ONCE(format != CTR_FORMAT_ARMV6)) {
> +		return ARCH_DMA_MINALIGN;
> +	}
> +
> +	return 8 << max(FIELD_GET(CTR_ISIZE_LEN_MASK, ctr),
> +			FIELD_GET(CTR_DSIZE_LEN_MASK, ctr));
> +}
> +

> >...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


