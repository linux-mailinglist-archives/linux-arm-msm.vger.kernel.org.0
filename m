Return-Path: <linux-arm-msm+bounces-81897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F58C5E3D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 17:31:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4E1973C3618
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 15:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC403330B37;
	Fri, 14 Nov 2025 15:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AGKyBLEX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7540330B14
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 15:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135251; cv=none; b=P+prSq8DPETLSFeuqfzDtgTiiE+viWMVRNqfP1uJWqj6cwcQPvpY+801hRajfN0Mp6nwhsjIEqVXNMBvcEjwGBkdG4hW3r1g+tCmu2M6X1uLJVwHXHwdpJKOs3B8n3b0Vvm5WYTiyM0lCnxBCpwneK4jC4fPaTvdYh/6eACQgxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135251; c=relaxed/simple;
	bh=HYPwYAIQdgdyDW1orXQ9X7fxlH8UCdDY5uK1l36WSH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q7idS5AOhbyN8vX7u+NP9XJlNEFt1KkAw1GwitlSus0oR09nJBnlYxmJM1RClxObr1CcT5yqC65W4fe7C9KjbcFnwdhpgx9htbeUPqk6NxRW22t4spG3AI9KvR8W24Y000Rt7epwUgng4E7zDy29P+/142DQH6VBCrrh7f0CzBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AGKyBLEX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76AB1C2BCB4
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 15:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763135251;
	bh=HYPwYAIQdgdyDW1orXQ9X7fxlH8UCdDY5uK1l36WSH0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AGKyBLEXtgqYOVxx92sdZmlP9wInrDR7IGNQNm4lZh3okkzjsqi+ctNtvT1Z356BT
	 EnRKkH08kJt6lDsayrLcZyIhsjLIsAUh9WqniwINYxaNXV7n+Pj6EElvTVKirkf0x8
	 kpjRfIeLCCa3BcNpSuGN3JLLsG9h3nC/KFULyePEt9qhW4G+EXT91BEHeC/QjWYrR3
	 /1IfzicZ9blS30hFm61x6udISub275pHWDe5DRMhuSbCt9IWQzlIQBFnKV8Qs2kwO+
	 Z13Aehn4Wsy8tgm955X4SErSwriYkd1fCw4LSixnKOiBxrNt3Q/qoSYlAhf60ogD/O
	 l+1N9Q9oDWtzg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-591c9934e0cso2911332e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 07:47:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUeNvt3chKsNrgX67ItAuRjHYNPMkx/v1JBfKxyHi0iStSV1cJiT3r3G9o5AloW8UbKJN747OUbdaOshG0A@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl93uVgNPGV/C7lzX/N1oyIivKS1G+tkVYi+qk5VKlwjceZaXv
	8BOEPeGhz+3MMxZhlnbiw6i95kkWzMa+KTe79Sgi8D9iguKDKSf4h4dtKuALsaEj+dEg6N7NVIz
	Xj+ixhrTa6N8FGYBWdk56nIUaRe7ncjA=
X-Google-Smtp-Source: AGHT+IG2Fkv/IgclsD0YlHWH+j/0FfrRHwioIdacdg5DCe0XUW6hYHcrIV116X3ZHz8YfJIjxlRfH/dH6PHawF8Lzw8=
X-Received: by 2002:a05:6512:3b9c:b0:578:f613:ed9c with SMTP id
 2adb3069b0e04-59584201168mr1295463e87.43.1763135249734; Fri, 14 Nov 2025
 07:47:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251114085058.2195900-1-sumit.garg@kernel.org>
 <20251114085058.2195900-3-sumit.garg@kernel.org> <CAMj1kXE4Fo3i9f3npB0MBSOZP0x7HgF4A0KX_aUSBEBmar=NpA@mail.gmail.com>
 <aRb2_OmkRTD46vnx@sumit-X1> <CAMj1kXFpi1fMuAhuaBbMSd57F79E7Z0u4okzkKL+_6eKfGUKXA@mail.gmail.com>
 <CAMj1kXE60LrWi8Au6qQ4EMQDFxQCJt5h6hBLuQHCz3HEp=2o3w@mail.gmail.com> <aRcdiwgM9h_S7rP-@sumit-X1>
In-Reply-To: <aRcdiwgM9h_S7rP-@sumit-X1>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 14 Nov 2025 16:47:18 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGN=LFL0Cfp6DonAxTLMK7E4Pb0ocYRtQGBr52EHiRmrw@mail.gmail.com>
X-Gm-Features: AWmQ_bkirZe4HuEHGum2WhjPW6jhtzALR2NZIjjMF5uSrVSzEoGWnqkRI8nCmQQ
Message-ID: <CAMj1kXGN=LFL0Cfp6DonAxTLMK7E4Pb0ocYRtQGBr52EHiRmrw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: efi: Pass reboot cmd parameter to efi_reboot()
To: Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, andersson@kernel.org, konradybcio@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, shivendra.pratap@oss.qualcomm.com, 
	leif.lindholm@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 14 Nov 2025 at 13:16, Sumit Garg <sumit.garg@kernel.org> wrote:
>
> On Fri, Nov 14, 2025 at 10:35:33AM +0100, Ard Biesheuvel wrote:
> > On Fri, 14 Nov 2025 at 10:33, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > On Fri, 14 Nov 2025 at 10:31, Sumit Garg <sumit.garg@kernel.org> wrote:
> > > >
> > > > On Fri, Nov 14, 2025 at 10:26:03AM +0100, Ard Biesheuvel wrote:
> > > > > On Fri, 14 Nov 2025 at 09:51, Sumit Garg <sumit.garg@kernel.org> wrote:
> > > > > >
> > > > > > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > >
> > > > > > EFI ResetSystem runtime service allows for platform specific reset type
> > > > > > allowing the OS to pass reset data for the UEFI implementation to take
> > > > > > corresponding action. So lets pass the reboot cmd parameter for the EFI
> > > > > > driver to determine whether it's a platform specific reset requested or
> > > > > > not.
> > > > > >
> > > > > > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > > > > > ---
> > > > > >  arch/arm64/kernel/process.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
> > > > > > index fba7ca102a8c..51784986c568 100644
> > > > > > --- a/arch/arm64/kernel/process.c
> > > > > > +++ b/arch/arm64/kernel/process.c
> > > > > > @@ -136,7 +136,7 @@ void machine_restart(char *cmd)
> > > > > >          * ResetSystem().
> > > > > >          */
> > > > > >         if (efi_enabled(EFI_RUNTIME_SERVICES))
> > > > > > -               efi_reboot(reboot_mode, NULL);
> > > > > > +               efi_reboot(reboot_mode, cmd);
> > > > > >
> > > > >
> > > > > I agree with the general principle. However, there are already
> > > > > existing callers of kernel_restart() that would end up passing a
> > > > > random string to efi_reboot(), resulting in platform specific reset
> > > > > with undefined result.
> > > >
> > > > Yeah true but the UEFI spec says:
> > > >
> > > > "If the platform does not recognize the EFI_GUID in ResetData the platform
> > > > must pick a supported reset type to perform. The platform may optionally
> > > > log the parameters from any non-normal reset that occurs."
> > > >
> > > > So, in these cases the UEFI implementation can fallback to normal reset
> > > > optionally logging the reset data being passed. Does that sounds
> > > > reasonable to you?
> > > >
> > >
> > > What the UEFI spec says might deviate from how real platforms in the
> > > field will behave when being passed a reset type that nobody ever
> > > tried passing before.
>
> I suppose from OS point of view, we need to follow the UEFI
> specification. However, there will be scope for quirks later if the real
> world problems occur. Currently, in case of EFI reboot we are just
> ignoring the reboot cmd parameter.
>
> If you have in mind any sanity checks we should do here then feel free
> to propose and I can try to implement them.
>
> >
> > Also, the GUID is expected to follow an unbounded NULL terminated
> > UTF-16 string in memory, so we could easily cause a crash by doing
> > this if \0\0 doesn't appear in the memory following the string.
>
> Okay I see, would following change on top of this patchset address this
> concern?
>
> --- a/drivers/firmware/efi/reboot.c
> +++ b/drivers/firmware/efi/reboot.c
> @@ -5,6 +5,7 @@
>   */
>  #include <linux/efi.h>
>  #include <linux/reboot.h>
> +#include <linux/ucs2_string.h>
>
>  static struct sys_off_handler *efi_sys_off_handler;
>
> @@ -14,11 +15,18 @@ void efi_reboot(enum reboot_mode reboot_mode, const char *data)
>  {
>         const char *str[] = { "cold", "warm", "shutdown", "platform" };
>         int efi_mode, cap_reset_mode;
> +       unsigned long reset_data_sz = 0;
> +       efi_char16_t *reset_data = NULL;
>
>         if (!efi_rt_services_supported(EFI_RT_SUPPORTED_RESET_SYSTEM))
>                 return;
>
>         if (data) {
> +               reset_data_sz = ucs2_strlen(data) * sizeof(efi_char16_t);

You can't just run ucs2_strlen() on an arbitrary buffer.

> +               reset_data = kzalloc(reset_data_sz + 2, GFP_KERNEL);
> +               memcpy(reset_data, data, reset_data_sz);
> +               reset_data_sz += 2;
> +

What happened to the GUID? It comes after the UTF-16 string, no?

>                 efi_mode = EFI_RESET_PLATFORM_SPECIFIC;
>         } else {
>                 switch (reboot_mode) {
> @@ -47,8 +55,7 @@ void efi_reboot(enum reboot_mode reboot_mode, const char *data)
>                 efi_mode = cap_reset_mode;
>         }
>
> -       efi.reset_system(efi_mode, EFI_SUCCESS, sizeof(data),
> -                        (efi_char16_t *)data);
> +       efi.reset_system(efi_mode, EFI_SUCCESS, reset_data_sz, reset_data);
>  }
>

I think the main issue here is tying machine_restart(), which takes a
u8[] argument, to efi_reboot(), which takes a (u16[]) + L"\0" + GUID
buffer. So the change to efi_reboot() looks fine to me, we just cannot
call it directly from machine_restart() as you are suggesting.

