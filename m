Return-Path: <linux-arm-msm+bounces-76128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED6BBBFCAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 01:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 67C8F4E4672
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 23:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5047E175D53;
	Mon,  6 Oct 2025 23:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKvFIIZo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4386F06B
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 23:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759794383; cv=none; b=N4xG2AvfT2Ne2bacVJ+EV1jG4wlFVinPg77bbopcYxjg7zLpA5H4JgYxPWcJ7hq677bUsN6pIRvgh/vsYgI5fBsC82PoMJ8bXGaWJwvHhlM7VaAhtEOOQXBS8tow7G51oxc5llWUnzxMe3140S4pN2EvY9ucYdvYXwNox8s83uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759794383; c=relaxed/simple;
	bh=DI5307X01YY+aSgpiw1sHT8lbRJrsLbNU3nv0IkXloE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HEJXYAIM2bed7yv8wEL5aM+7me3f6cw9QCSGZ8TILhK1QGojhtKnusa+0IlyXfrKg//x1IV+buvruCEQEkSmgarhpKyPKVvoChQ4KIYWcHgfwYrlW04VfXrcekpt60q0oSPAn6GTmkPlN6PsWTP7zPy1+D3XO5aVAacDWTEbfWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKvFIIZo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72FCC116B1
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 23:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759794382;
	bh=DI5307X01YY+aSgpiw1sHT8lbRJrsLbNU3nv0IkXloE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OKvFIIZoRi0LpBPdTV8Kx1P18NQQA+SjQev3uvKjk18HPjfFOMqKin3dR7bQ0hmkk
	 BeUW1/eCdJod9iHOXmxf5MSNOmIQWkji0g/u+AhlY0rdcs6u3BOsEjdf7aGtz+7Wgl
	 o0UsD22nzrgaDhRKAtEwVuC4FnTxoVDQmtlJc8QF+yEFQoF/PMOh/jaqC0J55cCPHi
	 4r8HfZ/LLDvSupLXMPJx4w/WMQdDvzCQd2BcJanO1XiLZtcn4VuzCNP4p/YCXz2EJJ
	 mNfm1L0cvcSIIWjHPBQrTRzX/3vUFH4VjefoB9oVHNi8AO1/orapA84T0MDTlfnEy3
	 X4TXI5NmFzwew==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-373a5376d0bso56450251fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 16:46:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXoxTLMzGOWfrzZlCX1c2iuHfzHHAThlKkaYQXrov0DBVAk5cbhc8Gtmjp+MtzGCp0Gf1Qa7cDBZm19x7Bg@vger.kernel.org
X-Gm-Message-State: AOJu0YxY66NvPvI5wAKAvu3w9ZHCHiTHj1ofQ6TBKdiSqj79Tndutzd1
	9ILf/rGlNfIqXpXTp6xioqIuxbZjUVLRfklADpHYym5IpcJlAVJgbaMSTDbj+SnaxVnEODVJ+KU
	fZIEL7vYYyAEaTpfdTAuE5ScKOeWLfto=
X-Google-Smtp-Source: AGHT+IHyvFvoeGr40G3kZ7whYFBDihuxtMO4/vgOVFvYBnjqmXXCXOzZUwFZ12WiEap229737Koq6XBMGJvl3PK5iDo=
X-Received: by 2002:a05:651c:544:b0:360:99c:e44a with SMTP id
 38308e7fff4ca-374c371c08bmr43001041fa.11.1759794381063; Mon, 06 Oct 2025
 16:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251006-arm64-text-offset-v1-1-bf0e8a27383b@oss.qualcomm.com> <aOPLv_-f5sNGtG4e@willie-the-truck>
In-Reply-To: <aOPLv_-f5sNGtG4e@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 7 Oct 2025 01:46:08 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHhetfN_bY5AAqqfC4=N9yQCO5R_n7H0BMXZ2VXudv5pQ@mail.gmail.com>
X-Gm-Features: AS18NWCf2njkvOwODgn8kpQQmCSEMJuBMgh3f5ZuQwXggeLdvTDI9CwNbJxtZGw
Message-ID: <CAMj1kXHhetfN_bY5AAqqfC4=N9yQCO5R_n7H0BMXZ2VXudv5pQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: head: set TEXT_OFFSET to the historical value
To: Will Deacon <will@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, David Heidelberg <david@ixit.cz>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 Oct 2025 at 16:01, Will Deacon <will@kernel.org> wrote:
>
> [+Ard and Mark]
>
> On Mon, Oct 06, 2025 at 01:21:04AM +0300, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > Historically arm64 kernel contained (almost fixed) value of 0x8000 at
>
> 0x8000 or 0x80000?
>
> > the TEXT_OFFSET. The commit cfa7ede20f13 ("arm64: set TEXT_OFFSET to 0x0
> > in preparation for removing it entirely") and then commit 120dc60d0bdb
> > ("arm64: get rid of TEXT_OFFSET") replaced this field with 0.
>
> Given that we made the initial change over five years ago, I'm struggling
> to see why we should start caring about old broken bootloaders _now_.
>
> In fact, I'm far more concerned about changing this to a non-zero value
> and having more recent bootloaders misbehave.
>
> > This caused no problems so far, because nobody seemed to be playing with
> > the extremely picky Qualcomm bootloader as used on some of Google Pixel
> > phones. Current attempting to boot the Linux kernel on those devices
> > will fail to load on those phones with the following message:
> >
> > KernelDecompress failed: Invalid Parameter Kernel TextOffset does not match
> > Error calling BootPrepareAsync Invalid Parameter
> >
> > Since the kernel ignores the field, set it to the expected value of
> > 0x8000, unbreaking boot of upstream kernels on Qualcomm devices.
>
> (same typo)
>

Just setting the header field and not updating the base address also
means that the boot breaks without CONFIG_RELOCATABLE, and you will
get a warning in the kernel log about the load address not being
aligned to 2 MiB.

So I don't think this is the right solution.

If this is really something that needs to be fixed upstream, we should
just bring back TEXT_OFFSET in its entirety, but I'm not convinced
that this is really justified here. As a workaround, you could just
add 2 MiB - 0x80000 bytes of padding at the start of the image, and
add your own header (as Will alludes to as well)

