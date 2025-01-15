Return-Path: <linux-arm-msm+bounces-45119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7C8A12226
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 12:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6549F1887CC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 11:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0DB1E98EE;
	Wed, 15 Jan 2025 11:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A9pfID1u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF291E7C30
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 11:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939517; cv=none; b=Up8SYNmiT5UoDQxMDPMCV441sf/sBUQCDmbFVY+xD2RN8HPHB0522lYPpKyS0WRW8O8yEhds0oWdIccTvqZW5qf3GjEuItpF+bY5ZXgU1UnpHKELzn8V/s8wCwORrAx6/ZEv9mSUQx2abbIIMvJ/Q+ouTzK9NcQ20h5w8gWpbnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939517; c=relaxed/simple;
	bh=m5VRlSaXJUvW5kMd6i5YWCt9/Ng0Zfz0GE3f+WyrrVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKg41fZlHZtpdHLZBi4gY5gkYx2rsdp7kqtkMHKJkAi6GjisJrhHK7Fle38c2ruuzYtSOn+3ZclsscA5qC9qWtNDDpvduY1U9kgaTHa7bQ1vXBF8IVjlNudq6JLBnS2DjswFyvzZMGFyzYPcSjFvQC+6QKNQyklpdndntzS9pdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A9pfID1u; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so810166e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 03:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736939513; x=1737544313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0R6rCNecZsxYuG3mKwLdbaB7qjo1ppTRtlAgGE34AeQ=;
        b=A9pfID1uz+FJm6DRnRBPY9MTNgooHvN9A07uaXs9U6XmgznLXy4Zm8QWlKZcuJnV9p
         l3ogNaIMlD9DqWN/7p6NpMziyF2qzT8zRMAP5qk5H7EP2aAnJhn+SQaWmXkYYiT67kRa
         Fo0FDVF0HSnDLHKRT+szIdZnX6DQnYe8+O3RCnFWJ5p610nnsI2f1e98CTNhzfLvfIrl
         1tifxEqlyBMkhw7Zo8thXIXs3i1rhEk9ciq8phbz/QIfMI+5KBkk624Rd5S28UV4GZ2M
         2yg+ZsntsDJE8xudYapMeFVxjqMqmZj2JgcEwahOm9o52btGtnnmZ0i1TAzQ9n+XsOji
         O8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736939513; x=1737544313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0R6rCNecZsxYuG3mKwLdbaB7qjo1ppTRtlAgGE34AeQ=;
        b=R1TtCdLBSxNiHZ4KH2m3UeGyBCD6oroyMTjd0/I97xH3rZN8Sff+BkOah+YjL3TdwB
         2bPNhobDTN4f2yXK0/YbqYk5JGL5g+NpQrPt7xTd04YMJOrYAqQdFV8E3RNjFKU79oSr
         DvQuI3tD/HGx/qtLXI692opIuoXfcvpmg1rzADQ8esxasheTMpyPpoufKIs++RlSNSh7
         LqnIbxJ2Hs5vQJJ1I08PjMxJNxjKl4i58WzOT2jwZqbWSoLb9Z8lWhUcl779iDklQAT5
         3DbIovap6HyVMZ+r51UDy+0Ew3ApdlPud2R8F5FCR4Nm3efist3/tINtf49vft7BDokb
         rRvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvhweVlrIkDYwIz1cITa2WDOPncGWWchwzhh99q68JeOo6IWSPv3Fnk/efp44Yx27RFgzVlCC2mniCKZSp@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+HdDL4CueGD1XMkpMT+itdXmCv4Kj9mXdQxMgZn+nDa2uwE+7
	8DyyXaWvJvt8YoIbU4cJ7VjvV6Tqvgyp3BFPz3ja1ulMWMgiVaG3OO+1hlXtkGE=
X-Gm-Gg: ASbGnctMRuTvKRI5HkVntjo/DKGzlVTPSCTD3+UKhMN1s6TfrXplI/yUPTTZSalDuNY
	DduDlxHGQHoCttHC4dHaoulDmUvyo8qE5g78z7P6/8xUqM6+J+s2lM5lda/mWRuvKOpNDEjhiqe
	4Nza55kfZokvpAcotSZm4L3hLBvGbntfdfY3uZj02GUCTsSMOYR33kfOP5uDZOy0o0JYS0IXZkX
	Xe1ofuktDzXOV3Ne7nM5wpwPnwXo4ls2wilTQC8tdgvQrjWyOUwOaDxAX+d2dsFit+ZIeipkCha
	bPVNXzdzVPO+vPt8ww/ywMv6zDwWqpEOjNol
X-Google-Smtp-Source: AGHT+IH2Z4JqRWKHahQJaGyVVjrUTIt7sz2P35oxqJH02yE5Kej3wh7zM7Y48DAO/YneqXvtV3OHWg==
X-Received: by 2002:a05:6512:3192:b0:542:2e05:313b with SMTP id 2adb3069b0e04-542abfd1f73mr734423e87.21.1736939513323;
        Wed, 15 Jan 2025 03:11:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec073esm1996352e87.194.2025.01.15.03.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 03:11:52 -0800 (PST)
Date: Wed, 15 Jan 2025 13:11:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, 'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] ARM: implement cacheinfo support
Message-ID: <ojog62udu3nx6s2557m56ykp7d4drxud7j6f6wivysfyalx6lj@7lbkx7jtsubd>
References: <20241014-armv7-cacheinfo-v2-0-38ab76d2b7fa@linaro.org>
 <20241014-armv7-cacheinfo-v2-2-38ab76d2b7fa@linaro.org>
 <CGME20250115101159eucas1p1261a8b3e78b83c4fec63e3ac00e4d59a@eucas1p1.samsung.com>
 <01515ea0-c6f0-479f-9da5-764d9ee79ed6@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01515ea0-c6f0-479f-9da5-764d9ee79ed6@samsung.com>

On Wed, Jan 15, 2025 at 11:11:57AM +0100, Marek Szyprowski wrote:
> On 14.10.2024 15:55, Dmitry Baryshkov wrote:
> > On ARMv7 / v7m machines read CTR and CLIDR registers to provide
> > information regarding the cache topology. Earlier machines should
> > describe full cache topology in the device tree.
> >
> > Note, this follows the ARM64 cacheinfo support and provides only minimal
> > support required to bootstrap cache info. All useful properties should
> > be decribed in Device Tree.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   arch/arm/Kconfig             |   1 +
> >   arch/arm/include/asm/cache.h |   6 ++
> >   arch/arm/kernel/Makefile     |   1 +
> >   arch/arm/kernel/cacheinfo.c  | 173 +++++++++++++++++++++++++++++++++++++++++++
> >   include/linux/cacheinfo.h    |   2 +-
> >   5 files changed, 182 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 749179a1d162..e790543c3eaf 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -5,6 +5,7 @@ config ARM
> >   	select ARCH_32BIT_OFF_T
> >   	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE if HAVE_KRETPROBES && FRAME_POINTER && !ARM_UNWIND
> >   	select ARCH_HAS_BINFMT_FLAT
> > +	select ARCH_HAS_CACHE_LINE_SIZE if OF
> >   	select ARCH_HAS_CPU_CACHE_ALIASING
> >   	select ARCH_HAS_CPU_FINALIZE_INIT if MMU
> >   	select ARCH_HAS_CURRENT_STACK_POINTER
> > diff --git a/arch/arm/include/asm/cache.h b/arch/arm/include/asm/cache.h
> > index e3ea34558ada..ecbc100d22a5 100644
> > --- a/arch/arm/include/asm/cache.h
> > +++ b/arch/arm/include/asm/cache.h
> > @@ -26,4 +26,10 @@
> >   
> >   #define __read_mostly __section(".data..read_mostly")
> >   
> > +#ifndef __ASSEMBLY__
> > +#ifdef CONFIG_ARCH_HAS_CACHE_LINE_SIZE
> > +int cache_line_size(void);
> > +#endif
> > +#endif
> > +
> >   #endif
> > diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
> > index aaae31b8c4a5..b3333d070390 100644
> > --- a/arch/arm/kernel/Makefile
> > +++ b/arch/arm/kernel/Makefile
> > @@ -40,6 +40,7 @@ obj-y		+= entry-armv.o
> >   endif
> >   
> >   obj-$(CONFIG_MMU)		+= bugs.o
> > +obj-$(CONFIG_OF)		+= cacheinfo.o
> >   obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
> >   obj-$(CONFIG_ISA_DMA_API)	+= dma.o
> >   obj-$(CONFIG_FIQ)		+= fiq.o fiqasm.o
> > diff --git a/arch/arm/kernel/cacheinfo.c b/arch/arm/kernel/cacheinfo.c
> > new file mode 100644
> > index 000000000000..a8eabcaa18d8
> > --- /dev/null
> > +++ b/arch/arm/kernel/cacheinfo.c
> > @@ -0,0 +1,173 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + *  ARM cacheinfo support
> > + *
> > + *  Copyright (C) 2023 Linaro Ltd.
> > + *  Copyright (C) 2015 ARM Ltd.
> > + *  All Rights Reserved
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/cacheinfo.h>
> > +#include <linux/of.h>
> > +
> > +#include <asm/cachetype.h>
> > +#include <asm/cputype.h>
> > +#include <asm/system_info.h>
> > +
> > +/* Ctypen, bits[3(n - 1) + 2 : 3(n - 1)], for n = 1 to 7 */
> > +#define CLIDR_CTYPE_SHIFT(level)	(3 * (level - 1))
> > +#define CLIDR_CTYPE_MASK(level)		(7 << CLIDR_CTYPE_SHIFT(level))
> > +#define CLIDR_CTYPE(clidr, level)	\
> > +	(((clidr) & CLIDR_CTYPE_MASK(level)) >> CLIDR_CTYPE_SHIFT(level))
> > +
> > +#define MAX_CACHE_LEVEL			7	/* Max 7 level supported */
> > +
> > +#define CTR_FORMAT_MASK	GENMASK(27, 24)
> > +#define CTR_FORMAT_ARMV6 0
> > +#define CTR_FORMAT_ARMV7 4
> > +#define CTR_CWG_MASK	GENMASK(27, 24)
> > +#define CTR_DSIZE_LEN_MASK GENMASK(13, 12)
> > +#define CTR_ISIZE_LEN_MASK GENMASK(1, 0)
> > +
> > +/* Also valid for v7m */
> > +static inline int cache_line_size_cp15(void)
> > +{
> > +	u32 ctr = read_cpuid_cachetype();
> > +	u32 format = FIELD_GET(CTR_FORMAT_MASK, ctr);
> > +
> 
> On Samsung Exynos421x (CortexA9 based) format is read as 0x3, which 
> causes a warning later in the code. How such value should be handled to 
> avoid warning?

I should be more carefull when doing c&p. I've posted the fix at
https://lore.kernel.org/r/20250115-arm-cacheinfo-fix-v1-1-5f30eeb4e463@linaro.org

> 
> > +	if (format == CTR_FORMAT_ARMV7) {
> > +		u32 cwg = FIELD_GET(CTR_CWG_MASK, ctr);
> > +
> > +		return cwg ? 4 << cwg : ARCH_DMA_MINALIGN;
> > +	} else if (WARN_ON_ONCE(format != CTR_FORMAT_ARMV6)) {
> > +		return ARCH_DMA_MINALIGN;
> > +	}
> > +
> > +	return 8 << max(FIELD_GET(CTR_ISIZE_LEN_MASK, ctr),
> > +			FIELD_GET(CTR_DSIZE_LEN_MASK, ctr));
> > +}
> > +
> 
> > >...
> 
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 

-- 
With best wishes
Dmitry

