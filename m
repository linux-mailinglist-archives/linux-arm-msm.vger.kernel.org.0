Return-Path: <linux-arm-msm+bounces-823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D267D7EE605
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 18:36:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87F5A1F22FCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 17:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3261C341BB;
	Thu, 16 Nov 2023 17:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qi+VGp9K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162072F858
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Nov 2023 17:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D666C433CA;
	Thu, 16 Nov 2023 17:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700156191;
	bh=f1MamAR5SJ3kDTjLLdjTFc1hoxE9qI+fWDwWO5NMT60=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qi+VGp9KMuy53sSyo9JaYaStSahW4hFHR/Suwj+5r4y4WvPvgyrZInEteXBZcAoJs
	 f/rwFVrvf5FolsF2Hu9V1sUhCzA+Rg9M6AB9UGrsH6D69tVfsgM3uYFuqrmfQD0/B7
	 SEOTQpToXnIpqKBKKAzXOvaNGp3tZR2Poy1ajpotdPx7KXa0u4hmeriCrfiFhQ55TF
	 Pttk1+KPYB56y9H219EQFJFwjDrqGPn7AVC4UzYV6tiPFWc0ytcbf5F46iehDZTyjM
	 7xV3T/EWu/UXvhkyIsc/My0BtSIuagc1/3IpxkAA1Rsj03yFJVJlhi7920zJEEG+AC
	 fb2+zqpfbVp0A==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2c5210a1515so14917731fa.0;
        Thu, 16 Nov 2023 09:36:31 -0800 (PST)
X-Gm-Message-State: AOJu0YystFm6zEjxmvJs6CRAdRfvWuYBzOUvzfQXFRLbuT5FCPnCx3/P
	j3xos+2hhZV+LN4fNSSyAjlFHrR8meygV6s7bhE=
X-Google-Smtp-Source: AGHT+IEGEYSC/DbWsT7Lwa1v58UFG92epJFXYtXet3tbtNwSzwgsxrNS1YZeQy4iAakQ8ia/3Yzb98ViUUY9IRlCU28=
X-Received: by 2002:a2e:9bd7:0:b0:2c7:4220:56fc with SMTP id
 w23-20020a2e9bd7000000b002c7422056fcmr7417802ljj.11.1700156189690; Thu, 16
 Nov 2023 09:36:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231115095830.20607-1-quic_aiquny@quicinc.com> <20231116172418.GA174808@dev-arch.thelio-3990X>
In-Reply-To: <20231116172418.GA174808@dev-arch.thelio-3990X>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 17 Nov 2023 03:36:17 +1000
X-Gmail-Original-Message-ID: <CAMj1kXE4stcFikmxBMY19CR4J0+EpaNW8J=xVyFVY3A7F7BpRQ@mail.gmail.com>
Message-ID: <CAMj1kXE4stcFikmxBMY19CR4J0+EpaNW8J=xVyFVY3A7F7BpRQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ARM: kprobes: Explicitly reserve r7 for local variables
To: Nathan Chancellor <nathan@kernel.org>
Cc: Maria Yu <quic_aiquny@quicinc.com>, linux@armlinux.org.uk, mhiramat@kernel.org, 
	kernel@quicinc.com, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_lijuang@quicinc.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Nov 2023 at 03:24, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Nov 15, 2023 at 05:58:30PM +0800, Maria Yu wrote:
> > Registers r7 is removed in clobber list, so compiler may choose r7 for
> > local variables usage, while r7 will be actually updated by the inline asm
> > code. This caused the runtime behavior wrong.
> > While those kind of reserved registers cannot be set to clobber list
> > because of error like "inline asm clobber list contains reserved
> > registers".
> > Explicitly reserve r7 by adding attribute no-omit-frame-pointer for needed
> > function, then in T32 asm code r7 is used as a frame pointer and is not
> > available for use as a general-purpose register.
> > Note that "no-omit-frame-pointer" will make the code size a little bigger
> > to store the stack frame pointer. So limited to needed functions can have
> > the less impact than the full source file.
> >
> > Fixes: dd12e97f3c72 ("ARM: kprobes: treat R7 as the frame pointer register in Thumb2 builds")
> > Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> > Cc: stable@vger.kernel.org
>
> This causes warnings with clang:
>
>   arch/arm/probes/kprobes/actions-thumb.c:441:47: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
>     441 | static unsigned long __kprobes __attribute__((optimize("no-omit-frame-pointer")))
>         |                                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/arm/probes/kprobes/actions-thumb.c:524:38: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
>     524 | static void __kprobes __attribute__((optimize("no-omit-frame-pointer")))
>         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/arm/probes/kprobes/actions-thumb.c:560:38: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
>     560 | static void __kprobes __attribute__((optimize("no-omit-frame-pointer")))
>         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   arch/arm/probes/kprobes/actions-thumb.c:579:38: warning: unknown attribute 'optimize' ignored [-Wunknown-attributes]
>     579 | static void __kprobes __attribute__((optimize("no-omit-frame-pointer")))
>         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   4 warnings generated.
>
> Furthermore, as far as I am aware, the optimize attribute has other issues so
> its use is discouraged, see commits 080b6f407635 ("bpf: Don't rely on GCC
> __attribute__((optimize)) to disable GCSE") and a7223f5bfcae ("powerpc: Avoid
> broken GCC __attribute__((optimize))").
>

Ah yes, apalogies for missing that. I did a test build with Clang but
I did not spot the errors. So

Unreviewed-by: ....

Maria, please use the Makefile based per-file CFLAGS override that I
suggested before. There is really no reason to make this per-function.

