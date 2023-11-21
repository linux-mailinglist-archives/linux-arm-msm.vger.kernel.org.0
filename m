Return-Path: <linux-arm-msm+bounces-1390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C41967F3355
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 17:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E69028194A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 16:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016815917F;
	Tue, 21 Nov 2023 16:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fa9CfV8w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF8F54F92
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 16:12:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48D16C433CB;
	Tue, 21 Nov 2023 16:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700583129;
	bh=A0Y7+6CPTDVIv38TNvsOqsS9EpEwKcUF5pOzGVfc3jY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Fa9CfV8wI+kl+tVZgpFokGfpPaGMDFVHruwnzBKEDVlGUXC6jrfRuh5l2MNbxya+F
	 kycnxByNfNaLEAfKkT1iKPbfjt1SjKFPwVuxEjBedYQ0J3VqTYzzqgTu8/UnXJna7Q
	 Dxd3X50XtiI5y9x8AB8jCPW6MdfXzgaJzQ0hWuTdFC654Sn89nS3cFobdrdzLcO07Q
	 l0oYjz2awBViFn/v8P2pcs2YyWhIG+v29qfnQ59UQgVjIwg6lNVuaNEPDqhE/5dv6z
	 DFajlOR8U8O6juoudANe+0cRIksgPmTlHomRLocj5Csk2AfpYqppGslXuhBmrlqI5b
	 xcS3c6SjVEA1A==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c6b30acacdso72188971fa.2;
        Tue, 21 Nov 2023 08:12:09 -0800 (PST)
X-Gm-Message-State: AOJu0Yy1fV8QLHCIrI2fHHU4sU5VPlox2rfw/6ss76AcbAPBrsNnoz61
	uNRg8ANOCKhkajoKMWx6sAL6LKs/1hRBWXqDXKI=
X-Google-Smtp-Source: AGHT+IHiQZZyJ0JEju3dwx3W8FW85wAb61lZhwIa62BXcsiq75SSa9eWsjD1CKFKER69C/l5DB2H8MhUSiVYdg4Mnc0=
X-Received: by 2002:a2e:a4a8:0:b0:2c5:1b82:a533 with SMTP id
 g8-20020a2ea4a8000000b002c51b82a533mr6940656ljm.15.1700583127437; Tue, 21 Nov
 2023 08:12:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231120032909.19186-1-quic_aiquny@quicinc.com>
In-Reply-To: <20231120032909.19186-1-quic_aiquny@quicinc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 21 Nov 2023 11:11:56 -0500
X-Gmail-Original-Message-ID: <CAMj1kXHLT6PhT0v6=9DWS1bXDV+QSZDwnYDo=+KvpzrCBqPNrw@mail.gmail.com>
Message-ID: <CAMj1kXHLT6PhT0v6=9DWS1bXDV+QSZDwnYDo=+KvpzrCBqPNrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] ARM: kprobes: Explicitly reserve r7 for local variables
To: Maria Yu <quic_aiquny@quicinc.com>
Cc: Nathan Chancellor <nathan@kernel.org>, linux@armlinux.org.uk, mhiramat@kernel.org, 
	kernel@quicinc.com, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_lijuang@quicinc.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 19 Nov 2023 at 22:29, Maria Yu <quic_aiquny@quicinc.com> wrote:
>
> Registers r7 is removed in clobber list, so compiler may choose r7 for
> local variables usage, while r7 will be actually updated by the inline asm
> code. This caused the runtime behavior wrong.
> While those kind of reserved registers cannot be set to clobber list
> because of error like "inline asm clobber list contains reserved
> registers".
> Explicitly reserve r7 by adding attribute no-omit-frame-pointer for this
> file, then in T32 asm code r7 is used as a frame pointer and is not
> available for use as a general-purpose register.
> Note that "no-omit-frame-pointer" will make the code size a little bigger
> to store the stack frame pointer.
>
> Fixes: dd12e97f3c72 ("ARM: kprobes: treat R7 as the frame pointer register in Thumb2 builds")
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> Cc: stable@vger.kernel.org
> ---
>  arch/arm/probes/kprobes/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/probes/kprobes/Makefile b/arch/arm/probes/kprobes/Makefile
> index 6159010dac4a..b1f21e78950b 100644
> --- a/arch/arm/probes/kprobes/Makefile
> +++ b/arch/arm/probes/kprobes/Makefile
> @@ -8,6 +8,7 @@ test-kprobes-objs               := test-core.o
>
>  ifdef CONFIG_THUMB2_KERNEL
>  obj-$(CONFIG_KPROBES)          += actions-thumb.o checkers-thumb.o
> +CFLAGS_actions-thumb.o         += -fno-omit-frame-pointer
>  test-kprobes-objs              += test-thumb.o
>  else
>  obj-$(CONFIG_KPROBES)          += actions-arm.o checkers-arm.o
>

If Nathan is happy with this, I think we can drop this into the patch tracker.

