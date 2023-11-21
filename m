Return-Path: <linux-arm-msm+bounces-1392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F5C7F33ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 17:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69FC3B2184C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 16:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFED95B1E0;
	Tue, 21 Nov 2023 16:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIuck4j4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48565B1E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Nov 2023 16:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1008C433C8;
	Tue, 21 Nov 2023 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700584712;
	bh=I9ZH/e6KtTHN2UHi0fUQgC/I219UZFtlAoAwKkrjbcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CIuck4j4FS3Th2Qg6/yfyYjczl8E2bvtKdh8PF0v8/T1n7u5A3PTNFdZmXNNkVwY5
	 3lRB+7j8NjJHp4GSIMKmhmMO6UZs+6JnKEK4YK6avhOQ7k+Th+QxH9whbGIqzgeFHS
	 NFZQwEF5iHtTXdRDw1SYU8iSsfejNVCoDA6LSHiBCBT9CL6uQNU49cmrIc2Q6KwLKn
	 /drPNzhKzZbcBz0MTX9Bh4ek04c6IA887OqF08oLR7WtSdrW4sKrzZK8gm8xMAFGNf
	 BnQVtsjMLGUnys8OpppGt7itl83rfcA5+hzKjZ5dFi3oagDSHiPwbG7UjCSmyy5ZyX
	 OX64f7FCJfZAQ==
Date: Tue, 21 Nov 2023 09:38:30 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Maria Yu <quic_aiquny@quicinc.com>, linux@armlinux.org.uk,
	mhiramat@kernel.org, kernel@quicinc.com,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_lijuang@quicinc.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v3 1/1] ARM: kprobes: Explicitly reserve r7 for local
 variables
Message-ID: <20231121163830.GA3437094@dev-arch.thelio-3990X>
References: <20231120032909.19186-1-quic_aiquny@quicinc.com>
 <CAMj1kXHLT6PhT0v6=9DWS1bXDV+QSZDwnYDo=+KvpzrCBqPNrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHLT6PhT0v6=9DWS1bXDV+QSZDwnYDo=+KvpzrCBqPNrw@mail.gmail.com>

On Tue, Nov 21, 2023 at 11:11:56AM -0500, Ard Biesheuvel wrote:
> On Sun, 19 Nov 2023 at 22:29, Maria Yu <quic_aiquny@quicinc.com> wrote:
> >
> > Registers r7 is removed in clobber list, so compiler may choose r7 for
> > local variables usage, while r7 will be actually updated by the inline asm
> > code. This caused the runtime behavior wrong.
> > While those kind of reserved registers cannot be set to clobber list
> > because of error like "inline asm clobber list contains reserved
> > registers".
> > Explicitly reserve r7 by adding attribute no-omit-frame-pointer for this
> > file, then in T32 asm code r7 is used as a frame pointer and is not
> > available for use as a general-purpose register.
> > Note that "no-omit-frame-pointer" will make the code size a little bigger
> > to store the stack frame pointer.
> >
> > Fixes: dd12e97f3c72 ("ARM: kprobes: treat R7 as the frame pointer register in Thumb2 builds")
> > Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> > Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> > Cc: stable@vger.kernel.org
> > ---
> >  arch/arm/probes/kprobes/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm/probes/kprobes/Makefile b/arch/arm/probes/kprobes/Makefile
> > index 6159010dac4a..b1f21e78950b 100644
> > --- a/arch/arm/probes/kprobes/Makefile
> > +++ b/arch/arm/probes/kprobes/Makefile
> > @@ -8,6 +8,7 @@ test-kprobes-objs               := test-core.o
> >
> >  ifdef CONFIG_THUMB2_KERNEL
> >  obj-$(CONFIG_KPROBES)          += actions-thumb.o checkers-thumb.o
> > +CFLAGS_actions-thumb.o         += -fno-omit-frame-pointer
> >  test-kprobes-objs              += test-thumb.o
> >  else
> >  obj-$(CONFIG_KPROBES)          += actions-arm.o checkers-arm.o
> >
> 
> If Nathan is happy with this, I think we can drop this into the patch tracker.

I have no qualms with this approach, there are no issues with the couple
of LLVM versions that I tested.

Cheers,
Nathan

