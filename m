Return-Path: <linux-arm-msm+bounces-33580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 293A899527E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:54:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C2CC1C25688
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 14:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAF8B1E048F;
	Tue,  8 Oct 2024 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gcxsip6F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA041E0485
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728399256; cv=none; b=R17bcHuwGPlKo/M6qrozBjmCj8YrPJ4dMgcdYEmE7rgYvWiT3bCyb/L/gLqV05JrhNkiKuwNAwuc8KMjFURjjw8QGbQd0pfaX3yEDNOPwEQeNEGIyNqjkF5GaDWc4+JLDzDsoeBrMskLrli+r36+mjiz+Pkdxk/xhWjYn4fJMms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728399256; c=relaxed/simple;
	bh=47vEb3Hdq9xPPCEmmUkYg2VZzzZT9NReLtByAZ6PrQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=umAkeTsaexnJVZpn/kkhKCyLiXJQtfKsuFXFtALCbSq91MbfTdOj8veLpnp3NMLV47cT+0c1m5H+T30ead03iPRgWVF753yqlXaLaa6SdifkicrebHrHY5uyv8KQ8pO9C54LDacTs4P6O/vTuOL9jIA+EJZBiVGXX/r/OsxJLFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gcxsip6F; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so4267657b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728399254; x=1729004054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQ4LVhvFHLa0eWBgE9k6FrixkUFYtnCP97x2+SmMe3Y=;
        b=gcxsip6FWP1N2f/nY9BjEhzzetImpW5UbfgfGo4GdeSIp200vDtM7qG6dUK9+7L8Xy
         B/j0OZ6ae50eAgswObIxV+Lw1SuuIendnnC/b6l0IJoLC+9FekJnNFGOj4Ds2vcrw1Ar
         1yCR56SniaorW5Apyp/1hXszRxXtexLdV0cKg4M3cxqKnu4FtminQ5XW4agScQpkUmRO
         5MY/8LDYUH1x1OuO4pPbtQ/tG0l6HcF/gGc1oNCTV/VvP3sw/ZfkLYeR2o2IzzWPSt9J
         Ks8fl6EEQNfv+LerWC/nGIh6igE0gHiRVOb3H7Nf9dmDSdUa9eAYIfKki5sBPQPiOUpN
         DifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728399254; x=1729004054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQ4LVhvFHLa0eWBgE9k6FrixkUFYtnCP97x2+SmMe3Y=;
        b=BqHl2lT7rLFsahd9t143Jwb13NDBxsU9jeCvWzQkmKCkvMvuOrz+5aoTv+g8PRpUJy
         ZT6UPEkP02rkALit7WFTjbQiGHqJZp76mZm/KIY16Lstv8y8SDrn4wPdOhih0B2JgpZh
         1GIrfn5b7cJas7eogVfHjxvNec/g1sj30AwscIJiC/NI6IbgMrQMCSkJg6mojXtGgBnp
         uGQbJHP6JC6OQJ0wLIt+qshZWQlOowvRoxbEbU1IbY85rKO9oOakqgN/QlhqkO+Uh86D
         u7ZX3TNuMfezCiis8X0PRngMmoTu7iHjEHupYq/6gWKaeO44JzKBF6+lcShq3D7mHdJ9
         NASQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS+ldn1gtV3KokHcWHjPVGkOKKK15egyFXTGEbrzBQIVriJ9VDBgRpLrLmi3jvt8PoPC1odStKik94P+50@vger.kernel.org
X-Gm-Message-State: AOJu0YypB/ngDUCQyhTyfVVLhr9FWZxenk55L8bD08h4RkVo+vP3T54s
	D+Y341iqwBaJmlPpqge6BdSFtEn/+k0Fq010DTXWeAIvNaTA5oF/C399pldYkAk=
X-Google-Smtp-Source: AGHT+IEE7e5dtXU6pMg21/0OJnrotv0zSN5hz6Qh4qER1MpIu7AV7t7dgpJ2YGuT0VFYFJ+iVS/TPg==
X-Received: by 2002:a05:6a21:4581:b0:1d2:eaea:39d7 with SMTP id adf61e73a8af0-1d8a193d1c4mr595970637.9.1728399253860;
        Tue, 08 Oct 2024 07:54:13 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cd5006sm6207044b3a.77.2024.10.08.07.54.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 07:54:13 -0700 (PDT)
Message-ID: <5fe42a14-5070-43f7-8333-ed37c29c947f@linaro.org>
Date: Tue, 8 Oct 2024 07:54:10 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/14] alpha: Align prototypes of IO memcpy/memset
To: Julian Vetter <jvetter@kalrayinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Niklas Schnelle
 <schnelle@linux.ibm.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-sound@vger.kernel.org,
 Yann Sionneau <ysionneau@kalrayinc.com>
References: <20241008075023.3052370-1-jvetter@kalrayinc.com>
 <20241008075023.3052370-7-jvetter@kalrayinc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241008075023.3052370-7-jvetter@kalrayinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/24 00:50, Julian Vetter wrote:
> Align the prototypes of the memcpy_{from,to}io and memset_io functions
> with the new ones from iomap_copy.c and remove function declarations,
> because they are now declared in asm-generic/io.h.
> 
> Reviewed-by: Yann Sionneau <ysionneau@kalrayinc.com>
> Signed-off-by: Julian Vetter <jvetter@kalrayinc.com>
> ---
> Changes for v8:
> - Mask the argument with 0xff because now it's an int and not a u8
>    anymore


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
> ---
>   arch/alpha/include/asm/io.h | 6 ++----
>   arch/alpha/kernel/io.c      | 4 ++--
>   2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/alpha/include/asm/io.h b/arch/alpha/include/asm/io.h
> index b191d87f89c4..e7d52c8159b0 100644
> --- a/arch/alpha/include/asm/io.h
> +++ b/arch/alpha/include/asm/io.h
> @@ -591,13 +591,11 @@ extern inline u64 readq_relaxed(const volatile void __iomem *addr)
>   /*
>    * String version of IO memory access ops:
>    */
> -extern void memcpy_fromio(void *, const volatile void __iomem *, long);
> -extern void memcpy_toio(volatile void __iomem *, const void *, long);
>   extern void _memset_c_io(volatile void __iomem *, unsigned long, long);
>   
> -static inline void memset_io(volatile void __iomem *addr, u8 c, long len)
> +static inline void memset_io(volatile void __iomem *dst, int c, size_t count)
>   {
> -	_memset_c_io(addr, 0x0101010101010101UL * c, len);
> +	_memset_c_io(dst, 0x0101010101010101UL * (c & 0xff), count);
>   }
>   
>   #define __HAVE_ARCH_MEMSETW_IO
> diff --git a/arch/alpha/kernel/io.c b/arch/alpha/kernel/io.c
> index c28035d6d1e6..69c06f1b158d 100644
> --- a/arch/alpha/kernel/io.c
> +++ b/arch/alpha/kernel/io.c
> @@ -481,7 +481,7 @@ EXPORT_SYMBOL(outsl);
>    * Copy data from IO memory space to "real" memory space.
>    * This needs to be optimized.
>    */
> -void memcpy_fromio(void *to, const volatile void __iomem *from, long count)
> +void memcpy_fromio(void *to, const volatile void __iomem *from, size_t count)
>   {
>   	/* Optimize co-aligned transfers.  Everything else gets handled
>   	   a byte at a time. */
> @@ -535,7 +535,7 @@ EXPORT_SYMBOL(memcpy_fromio);
>    * Copy data from "real" memory space to IO memory space.
>    * This needs to be optimized.
>    */
> -void memcpy_toio(volatile void __iomem *to, const void *from, long count)
> +void memcpy_toio(volatile void __iomem *to, const void *from, size_t count)
>   {
>   	/* Optimize co-aligned transfers.  Everything else gets handled
>   	   a byte at a time. */


