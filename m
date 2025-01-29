Return-Path: <linux-arm-msm+bounces-46442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8678CA2167C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 03:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFA71188320D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 02:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93D6189B91;
	Wed, 29 Jan 2025 02:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QStWeDDp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0641B2AE7C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 02:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738117280; cv=none; b=U50fwqxie//oxIKcgCyjgKleDv5F7ObmY0J8ymOsEV2Ytpep/xgdTkBTm6wUjg//qwom6PhDhrXMW+ULXNNY1xLQLTlxSmYcDq31sGURUUIfRbtcE8eEbzQ0qCT5hsyzma2Xi+SQy7tOn/livuxLiguN+gJnH0EX7HEtftssk/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738117280; c=relaxed/simple;
	bh=w3SMyX0a0dgb8cpvXCVkuJ7QpKX+FGKyseLQKkgbXdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RznqocynyNtYVsThyGuTFPlRWm/nWkn9oKIth/oinMVN6/XyYn0LOpVRv1t3CMWjQUH5C3gdAiuaVUcCEYSqidXcLgvFUej+XzthybYWpElU06HELflMm/QHQKGFG51pWbLM6qlhHAhljI56FXYjQy+4gHSSjaM2WN74EZ/z8hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QStWeDDp; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3ce873818a3so55468175ab.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 18:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738117278; x=1738722078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtnR7A7UffQmykf4aH6iAO9KgDfrU8EA6JB2nIaAYW0=;
        b=QStWeDDp2cPDJKmS21wVxDiou0eetsmrT/0QWZen6aKA8hNMgBmqmAZGAC7el/0KfA
         m4bzjs4hrtJLlC8CqUwNIZH31Nfbr2iU8UBhG9ucsoQyVaN+HOzxw7GF6OjtE/InHNWE
         kFaYwDhSHuXN89rt0E7/D2ZzcMDXYr4QczQkKxICjD8k7xbfIkwakHQfKPM3O2s94kar
         ZYjaPg14HINzUFiSJde2A5SHP6kWZn810+LxN2FI2/MhqrNi6ScdQ4YsbuyIKSks0/JV
         r3YV5+11bTsWM9t7GZqHXPMUqz064zElRequfl3TP3XBZ6vTp0lHnAfBQFGW2GlRaPbC
         UHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738117278; x=1738722078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtnR7A7UffQmykf4aH6iAO9KgDfrU8EA6JB2nIaAYW0=;
        b=e26YIB3CIC+jJnwDTxnfuJkrZg2KG/VQh00j9fFj1Aw9TgtPOehQ5N3Nansgo8o8eY
         1R+aS4nMeurhFZXhnS2UVLd5KjTd6Mr63x0sWbg3RBNubgxwoqE1Z2K+FwtIrvZGlKsH
         jk8E0B8rJsLJ/pTWLg8eyoNcum36ueISfbFt3B2P33PWYcQKNsjcRdPTWuPFOrjd0ks5
         KaZjjpBT5pbK8olG8rlNBkIkPsJcw6zVJkcqdDcLwKdLckWtWwSbjV7CrnkmjyVpiZeC
         WQanyLLc15eaTZp8lDBDS+9vfBK1R1pDkTdeW5FVRSjovwMA0fopgGKid58nZUB14pEs
         qRLw==
X-Forwarded-Encrypted: i=1; AJvYcCUx7NKoIOdM0rELxvJgNEudT2Z+LdweVprjNIltMg0waalc6vRDdOgKsOAQmbXx9YB8alu4NKqGWtkxiEwa@vger.kernel.org
X-Gm-Message-State: AOJu0YzkmHaXve4QPWBWAm2rZYfaC01NFyE2qGN+0RNKG7EpvKWrzozm
	iXbzQhug3YK4xfyvUCY0XDzK8m7REaI+SYD3pZPDg2h1R/o40nznhWLiRMToFDXddGmn2rvgRf7
	H7Bsrg/twPSzA9BRKJXB5uN47Aio=
X-Gm-Gg: ASbGncu6syf7iFPk8f1/HNUoZl2gWRJQEjk6IxTRa8uWEOO1fJcXLr9DH3g80jiVGJK
	lYV1hVnidAD4R06Vd4PPYpFQZMHrbMpJSSJV4MrCuAtUKuPeLUmTzUdMAZJoD7WM67ctldFlcQw
	==
X-Google-Smtp-Source: AGHT+IHB6eolsV4aH/hplP2BpTqjii/IaDUSxjMDLt9An83E2DQ2Sqv+/y5nVv5os4CQTqahC3lJBJ0CAAndOUs/AC0=
X-Received: by 2002:a05:6e02:198b:b0:3cf:fcc4:eff9 with SMTP id
 e9e14a558f8ab-3cffe3e5dbemr15157515ab.8.1738117278041; Tue, 28 Jan 2025
 18:21:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122-msm-gpu-fault-fixes-next-v3-0-0afa00158521@gmail.com>
 <20250122-msm-gpu-fault-fixes-next-v3-1-0afa00158521@gmail.com>
 <Z5IjsqQ6vTdUXiGt@hu-guptap-hyd.qualcomm.com> <CACu1E7H5X2EfY9AG=xceaoZJkbumwnrsU4QvNbxd_A2wgVVOaQ@mail.gmail.com>
 <Z5KXwNPrdirVUn8Z@hu-guptap-hyd.qualcomm.com> <CACu1E7GOS+_biN=AuQwYK47ApRPFGygyD+U5X9d_4ReXKrzbfw@mail.gmail.com>
 <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com> <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
 <CACu1E7HErZAL=-GVQfKUAUK5bgK-X0qejt5os3f2UhkeZ1ptMQ@mail.gmail.com>
In-Reply-To: <CACu1E7HErZAL=-GVQfKUAUK5bgK-X0qejt5os3f2UhkeZ1ptMQ@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Jan 2025 18:21:06 -0800
X-Gm-Features: AWEUYZnLX6CXtNjm5Fg1x_aeoKRaj1zqbCfN_3LTjAFaHbtGLWrCztq9g_rdAEY
Message-ID: <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Prakash Gupta <quic_guptap@quicinc.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@quic=
inc.com> wrote:
> > >
> > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_guptap@=
quicinc.com> wrote:
> > > > >
> > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_gup=
tap@quicinc.com> wrote:
> > > > > > >
> > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote=
:
> > > > > > > The context would remain stalled till we write to CBn_RESUME.=
 Which is done
> > > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled conte=
xt further
> > > > > > > transactions are not processed and we shouldn't see further f=
aults and
> > > > > > > or fault inerrupts. Do you observe faults with stalled contex=
t?
> > > > > >
> > > > > > Yes. I've observed that on MMU-500 writing RESUME before the in=
terrupt
> > > > > > has been cleared doesn't clear SS. This happened with v2 in the=
 case
> > > > > > where there was already a devcoredump and drm/msm called
> > > > > > qcom_adreno_smmu_resume_translation() immediately from its faul=
t
> > > > > > handler, and we'd get a storm of unhandled interrupts until it =
was
> > > > > > disabled. Given that the architecture spec says we're supposed =
to
> > > > > > clear the interrupt first this may have been an attempt to "hel=
p"
> > > > > > developers.
> > > > > >
> > > > >
> > > > > Just to clarify, present sequence is:
> > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > 2. Report fault to client
> > > > > 3. resume/terminate stalled transaction
> > > > > 4. clear FSR
> > > > >
> > > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence, is =
FSR.SS
> > > > > cleared and interrupt storm is observed.
> > > >
> > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
> > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 there is=
 no
> > > > interrupt storm. From this we conclude that MMU-500 does not clear
> > > > FSR.SS unless #4 happens before #3.
> > > >
> > > Thanks Connor for clarification. I get your point now. I think it's
> > > expected interrupt storm with #2->#3->#4 sequence is expected.  With
> > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the sequenc=
e of
> > > #1->#2->#4->#3, which is spec recommended.
> > >
> > > so, common fault handler can be modified to follow the same sequence,=
 but I
> > > have concern regarding clearing FSR before reporting fault to client.
> > > qcom_adreno_smmu_get_fault_info() is an example I gave but other clie=
nt
> > > handler may have similar expecation of fault register not changed bef=
ore
> > > client fault handler is called.
> >
> > Simple solution would be to move the clearing of FSR to after the
> > fault is reported.  It doesn't really matter if it is before or after,
> > as long as it happens before the irq handler returns, AFAIU.  And
> > drm/msm will collect the fault info from the irq handler.
>
> As I said in the earlier mail: "From this we conclude that MMU-500
> does not clear FSR.SS unless #4 happens before #3." #4 is clearing FSR
> and #3 is writing RESUME. So no, unfortunately it does actually matter
> and we get a storm of unhandled IRQs if we don't clear FSR first. Your
> solution is what v2 did and it didn't work.

So, just clear FSR also in the resume path

BR,
-R

> Connor
>
> >
> > BR,
> > -R
> >
> > > > > The way CFIE disable is helping
> > > > > with current patch indicates write FSR is unstalling context and =
subsequent
> > > > > transactions are faulted.
> > > >
> > > > No, it does not indicate that. The interrupt storm happens even whe=
n
> > > > there is exactly one context fault, and when the interrupt storm
> > > > happens *only* FSR.SS is asserted. I've verified this with debug
> > > > prints. Once more, MMU-500 will assert an interrupt when only FSR.S=
S
> > > > is asserted. This has nothing to do with subsequent transactions.
> > > >
> > > > > Do you stop getting interrupt storm after write
> > > > > RESUME.
> > > >
> > > > Yes, as long as the write to RESUME happens after all other bits in
> > > > FSR are cleared.
> > > >
> > > > > If you can mention your SCTLR configuration and FSR state in test
> > > > > sequence, it would be clearer.
> > > >
> > > > SCTLR has both HUPCF and CFCFG enabled.
> > > >
> > > > >
> > > > > An aside, If reducing delay between FSR and RESUME write helps th=
en both
> > > > > can be done as part of qcom_adreno_smmu_resume_translation(). Thi=
s will
> > > > > follow spec recommendation and also make sure fault registers are=
 not
> > > > > cleared before reporting fault to client.
> > > I think this sequence should address the issue you are observing.
> > >
> > > > >
> > > > > Thanks,
> > > > > Prakash

