Return-Path: <linux-arm-msm+bounces-46421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D6CA21409
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16A751675FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 22:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134DF19ADA2;
	Tue, 28 Jan 2025 22:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jLmIcycC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617F11E200E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 22:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738102556; cv=none; b=S4ZcRwUcuL5TKZ9dSyjvBCEB2iNNEGeHIpRUzydtF8gt5cHqb4ppo9LwCZUrOzKSyk8O24CAITwR9LFykkyiI80BunGRx4wZyzKfh6GXdIozOlrxCyd2tWBQAyjM0V2DZD3HLKNQSPpadRM7HxjUvp/eQXPeUMNX/Bv3bvctsiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738102556; c=relaxed/simple;
	bh=3VAnZ89saz7CB6pbJjcSjU9U6f1eSUHTOJ8AIdT9Ccw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNOKkBjUjhmRPo3JYxl+hWA2VVck021GIaMy/zTm7KmyRksJvivnoMAIi/TAlaWFmqBKeTsOFr7FtinVKiS5lZdQTv9ghoZ7Xc+kUDa3kAG1k26lBDC4CZUDce7TS3FtVC9TdpyrbXRCZQ+4aE6IwK93n0+yRFgQnV2x+8BVFsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jLmIcycC; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-216325f516fso12947865ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738102553; x=1738707353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCB4v+WXq4lF4QrBSoQLeECXyKf0oYWAfbCsOcRv7h8=;
        b=jLmIcycCDdd1EtYJeXTHCuDPQvWNGFiVK1wEqE+64rEqv33mT2e4tV3aWR2Ic8NDjr
         0ljNoJDCXlWBrwdwbyzkQti2OLMENJI6tz9REf4i4TgPgfuuYi0uURpNKX/MImbxSrcL
         +FeqaoiRA/Wcsb2EuKo5KE6mOk5jUgVxJYporTTTGJyYYWLGW/q/K2H0A6KVuyz3YuZi
         o16TGQOfJvvgJfunM6vPfZGJBlvUbiMg+7yRLiLcD9bIRA642vM76OXrN+/ohBTrryD1
         gPDIiaeDy9sRpB9DK3NNZbX+w44tfrhvJoZn5yAsoof6zd828UexY7P8wmXsOiguHEq8
         FQ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738102553; x=1738707353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCB4v+WXq4lF4QrBSoQLeECXyKf0oYWAfbCsOcRv7h8=;
        b=c24oC7UPl55dd84s9/X0s4ugq1ttxzp4yy3ipzVTUWjpUWBD6bYfe/gqmwQCjeqb9J
         GZyuBVR7s3TDxXwXGvLNEoppEAIyecVeGc9QRtdPvoaxqLTE3+62y1Qvnbr2a+ovPePa
         h9nkfGqDPaLcI8/BN5ISic4/juiMQysChj99/6oSl1E5oZlTeISO+qXhdam1iYoD8NUi
         ZRqHlZPbnNkjD9pWrmNMgt2n0xn+Aq/RzXGCGp1yygn+F1lT/wd1HW3WM30Gh0jyqyQ8
         XazsQCEKz/nJiMSL5bIEAQJ+RIfo7pqaRjv9wmJ4ANdIGqgyINpi6flmtO3H88GGG0Wy
         vnOQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8IwsIWt1H6LgM4rWKO3jGhYbsqEAkD4v0iQ9HmxgJKl/fklLAfCCtcxISWkRQGUEq5ajBEq3WZ+7zJz17@vger.kernel.org
X-Gm-Message-State: AOJu0YxQLeEeDRzwMC6tSF0XAKJs+6LzKsY8xton6f066B3nb0CwrUPG
	kiNh7lKsXCKrd0PStamZCZpPNS0zMG/yCY+A7tDkvk8Gq2rq33O3RfzmCWWfNvnHg8YkGLc7FGt
	lt1Ofb8usKXxpcgqM8vCiTJUHQpQ=
X-Gm-Gg: ASbGncv5dKRGablQZGgZWIEFsiQkrld5BC0H3kZOiLMxUBtVOIOtxMqThwTFiDXlB9W
	gemWXXeD8p5YpXJ6TgCKbef6i6XcHv8vU0/b2L9KPcuIbzsIrdPydVL2WsVlio7XUu/IfFr9/
X-Google-Smtp-Source: AGHT+IG/JmcUEYW3G4Bmqx5GSmXS6y3U6GnDUzXK7OMM0PqZHUQojy9s8Ihml9PYOSpGiLYloAZZ2FBD4HwsETOp5ok=
X-Received: by 2002:a05:6a21:1013:b0:1cf:2be2:5e5a with SMTP id
 adf61e73a8af0-1ed7a7105ddmr592759637.10.1738102553534; Tue, 28 Jan 2025
 14:15:53 -0800 (PST)
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
In-Reply-To: <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 28 Jan 2025 17:15:42 -0500
X-Gm-Features: AWEUYZnR6X8QNZSt4NrL1WtbRcFAaPRCRbEEvulRWjwJr5nBO0UJqRrYtEh2Opo
Message-ID: <CACu1E7HErZAL=-GVQfKUAUK5bgK-X0qejt5os3f2UhkeZ1ptMQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Rob Clark <robdclark@gmail.com>
Cc: Prakash Gupta <quic_guptap@quicinc.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@quicin=
c.com> wrote:
> >
> > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_guptap@qu=
icinc.com> wrote:
> > > >
> > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_gupta=
p@quicinc.com> wrote:
> > > > > >
> > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
> > > > > > The context would remain stalled till we write to CBn_RESUME. W=
hich is done
> > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled context=
 further
> > > > > > transactions are not processed and we shouldn't see further fau=
lts and
> > > > > > or fault inerrupts. Do you observe faults with stalled context?
> > > > >
> > > > > Yes. I've observed that on MMU-500 writing RESUME before the inte=
rrupt
> > > > > has been cleared doesn't clear SS. This happened with v2 in the c=
ase
> > > > > where there was already a devcoredump and drm/msm called
> > > > > qcom_adreno_smmu_resume_translation() immediately from its fault
> > > > > handler, and we'd get a storm of unhandled interrupts until it wa=
s
> > > > > disabled. Given that the architecture spec says we're supposed to
> > > > > clear the interrupt first this may have been an attempt to "help"
> > > > > developers.
> > > > >
> > > >
> > > > Just to clarify, present sequence is:
> > > > 1. context fault with stall enable. FSR.SS set.
> > > > 2. Report fault to client
> > > > 3. resume/terminate stalled transaction
> > > > 4. clear FSR
> > > >
> > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence, is FS=
R.SS
> > > > cleared and interrupt storm is observed.
> > >
> > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
> > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 there is n=
o
> > > interrupt storm. From this we conclude that MMU-500 does not clear
> > > FSR.SS unless #4 happens before #3.
> > >
> > Thanks Connor for clarification. I get your point now. I think it's
> > expected interrupt storm with #2->#3->#4 sequence is expected.  With
> > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the sequence =
of
> > #1->#2->#4->#3, which is spec recommended.
> >
> > so, common fault handler can be modified to follow the same sequence, b=
ut I
> > have concern regarding clearing FSR before reporting fault to client.
> > qcom_adreno_smmu_get_fault_info() is an example I gave but other client
> > handler may have similar expecation of fault register not changed befor=
e
> > client fault handler is called.
>
> Simple solution would be to move the clearing of FSR to after the
> fault is reported.  It doesn't really matter if it is before or after,
> as long as it happens before the irq handler returns, AFAIU.  And
> drm/msm will collect the fault info from the irq handler.

As I said in the earlier mail: "From this we conclude that MMU-500
does not clear FSR.SS unless #4 happens before #3." #4 is clearing FSR
and #3 is writing RESUME. So no, unfortunately it does actually matter
and we get a storm of unhandled IRQs if we don't clear FSR first. Your
solution is what v2 did and it didn't work.

Connor

>
> BR,
> -R
>
> > > > The way CFIE disable is helping
> > > > with current patch indicates write FSR is unstalling context and su=
bsequent
> > > > transactions are faulted.
> > >
> > > No, it does not indicate that. The interrupt storm happens even when
> > > there is exactly one context fault, and when the interrupt storm
> > > happens *only* FSR.SS is asserted. I've verified this with debug
> > > prints. Once more, MMU-500 will assert an interrupt when only FSR.SS
> > > is asserted. This has nothing to do with subsequent transactions.
> > >
> > > > Do you stop getting interrupt storm after write
> > > > RESUME.
> > >
> > > Yes, as long as the write to RESUME happens after all other bits in
> > > FSR are cleared.
> > >
> > > > If you can mention your SCTLR configuration and FSR state in test
> > > > sequence, it would be clearer.
> > >
> > > SCTLR has both HUPCF and CFCFG enabled.
> > >
> > > >
> > > > An aside, If reducing delay between FSR and RESUME write helps then=
 both
> > > > can be done as part of qcom_adreno_smmu_resume_translation(). This =
will
> > > > follow spec recommendation and also make sure fault registers are n=
ot
> > > > cleared before reporting fault to client.
> > I think this sequence should address the issue you are observing.
> >
> > > >
> > > > Thanks,
> > > > Prakash

