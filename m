Return-Path: <linux-arm-msm+bounces-46420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C562A213FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B3A03A761E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 22:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E35919C569;
	Tue, 28 Jan 2025 22:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mx//nTZ2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C7419AD86
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 22:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738102204; cv=none; b=Mm4Rv2jDv13LlGUcLOzBHsdn0KbZc/nbz0XKoisoibkjkjzLpiCWBpfQ1Ojv2/Hpj8yCRtIHOajwrvDBHhkxLLaZYGNvmeGgQos4dxFkTl8zeZCdMN+pSyE+jMtks5PzPLwwTrUCoPjv2UgvN4I+scqOpP+eU70zLOHA1LwuZG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738102204; c=relaxed/simple;
	bh=ZtXE3F6IUApmC5kFsApxHwE2KPP49jtFp/ilonMYeJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nmoIFKQmkUFLhFa0emWdA3iwVq4ZK0kIGtqqdeMRjgioYZZjJ8MsBeGJPz9yqDCRgmhzK3zchCU8aE7+GiawvnwSsCVn4/4RZntMvrNdK+Lx1CES/DJlDKfvFw17IHTDQoFjPHLFZsEpgOsyl4YzBQniXUWE1a7HTMG81jxYUus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mx//nTZ2; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-844e161a957so438404539f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 14:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738102201; x=1738707001; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyJffkBFdN8fIysYz8PGYmBGwUKqJch+7WjonIterd4=;
        b=mx//nTZ2fl0EyoOa1UXzl/8sJb+6euFaUfIsTWSMUz8y77TneoHyKIAQTTIJMxTIIO
         lsYeb1zHNt3cSKC57FptsMJqlbmC1zX0Bpr7qRCjcbILVV5SAHL+t+dN/wVq/ixjOdVD
         ONVEV+ywgyj2Y7GYVbtX/2qmymZSZjhR1FOb/1+pCgGozGhfuuq0HhUPBf96m8GyPgCv
         GMjRqUYZxRzUQtsgvhNuPvvd2u9oAcGkTey+ijani1RMluT4JenvmlNltI/OgoV7pauU
         OwM01hvcq68AoI5ilgVZBYAXnouw4Ok6mmVZnC+ekGul1moP5YLm0smqDEdtj9GFVRNn
         2P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738102201; x=1738707001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyJffkBFdN8fIysYz8PGYmBGwUKqJch+7WjonIterd4=;
        b=XIaKfa+cDGed2DXaDbwFGT4ZJzcrCtPSGjskPngfa9DfJHEvziP4ePkR/aP+TJk5Pr
         G/sD5XQqXr7Kib0NIOPgS/JEQRm3snwXQptYgILXaonI2tIIkpal/IjZJ9ficqeA8H4J
         ZYYKq0tfwAAK1ZyTBzhfjsbad0z9zGTrs25TstOrr1ci0x4nhHMNcUg54m0Kho5KumZK
         edvImP77O+RSjo704hgX54pRpUrAF7IqeNBzn7dggfPgQt+6mhpm58ZnI0tIiIFjvwhZ
         Ky8xYpGGge0snLR8VvpZBIMHBGSKEfbzRv8IxF2ozt/nHxKHKZHrYrmJyROobwkRBc8Y
         665Q==
X-Forwarded-Encrypted: i=1; AJvYcCU61LG5utItmFWRrGl56w3xMSBz78V+CObiE37wMH8YfmWts2eMiQCGJ1EEavjRWcnTsr65MHUaXUagAPIq@vger.kernel.org
X-Gm-Message-State: AOJu0YyMMdu/ieDQBg7y9wrca0rkZ4+NCj2iczgUHnzo8QsP6rEFoV9Y
	lnN6F75ZWdfmqyIqoJLhcfUKVO3nV6HtYj3PKnTkDeRh9SMJSVDoxhNHpIhf7zkEfe48Bv5/jDn
	7TZ8Muay7ddyfWRrK9loWz7zHbCE=
X-Gm-Gg: ASbGnctJ7ITGPAgOvgoZDopS7GZxNcV3hckCElevU7OxqPWlOS7nyinTwZVqSPc+f27
	E99aOlhraDcEN0QU6SZzY8r4Qe+kepHARLGy8ySbLy9843IEJWodw5WANVY2WWx/k59qsNnr/Rp
	kWIFWvAjdThBKavPOegpZ3PpOQNQ==
X-Google-Smtp-Source: AGHT+IHgfYpA0VMAacYmWKH7JphTu43Ivw7JChSTcf6n7PHDLpUdxL7L5C0eaN2l2Zyi0/kWh6WQspB+VO1SCyrGhQU=
X-Received: by 2002:a92:cda9:0:b0:3cf:bb3e:884c with SMTP id
 e9e14a558f8ab-3cffe44793amr7793705ab.16.1738102201257; Tue, 28 Jan 2025
 14:10:01 -0800 (PST)
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
 <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com>
In-Reply-To: <Z5i6GQDd5apN+a10@hu-guptap-hyd.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Jan 2025 14:09:48 -0800
X-Gm-Features: AWEUYZl2-uHarNn2psbsrw1v352rDEu3UlOhpWnD80DHoE6YTIxA3r72Hj27dzk
Message-ID: <CAF6AEGstcrAJDBpPm-uQ+zSDVEhDJ4AQhCTDT-z9_8Nq0e35WQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] iommu/arm-smmu: Fix spurious interrupts with stall-on-fault
To: Prakash Gupta <quic_guptap@quicinc.com>
Cc: Connor Abbott <cwabbott0@gmail.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@quicinc.=
com> wrote:
>
> On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_guptap@quic=
inc.com> wrote:
> > >
> > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote:
> > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic_guptap@=
quicinc.com> wrote:
> > > > >
> > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott wrote:
> > > > > The context would remain stalled till we write to CBn_RESUME. Whi=
ch is done
> > > > > in qcom_adreno_smmu_resume_translation(). For a stalled context f=
urther
> > > > > transactions are not processed and we shouldn't see further fault=
s and
> > > > > or fault inerrupts. Do you observe faults with stalled context?
> > > >
> > > > Yes. I've observed that on MMU-500 writing RESUME before the interr=
upt
> > > > has been cleared doesn't clear SS. This happened with v2 in the cas=
e
> > > > where there was already a devcoredump and drm/msm called
> > > > qcom_adreno_smmu_resume_translation() immediately from its fault
> > > > handler, and we'd get a storm of unhandled interrupts until it was
> > > > disabled. Given that the architecture spec says we're supposed to
> > > > clear the interrupt first this may have been an attempt to "help"
> > > > developers.
> > > >
> > >
> > > Just to clarify, present sequence is:
> > > 1. context fault with stall enable. FSR.SS set.
> > > 2. Report fault to client
> > > 3. resume/terminate stalled transaction
> > > 4. clear FSR
> > >
> > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence, is FSR.=
SS
> > > cleared and interrupt storm is observed.
> >
> > With #2->#3->#4 FSR.SS is *not* cleared and there is a subsequent
> > interrupt storm with only FSR.SS asserted. With #4->#2->#3 there is no
> > interrupt storm. From this we conclude that MMU-500 does not clear
> > FSR.SS unless #4 happens before #3.
> >
> Thanks Connor for clarification. I get your point now. I think it's
> expected interrupt storm with #2->#3->#4 sequence is expected.  With
> CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the sequence of
> #1->#2->#4->#3, which is spec recommended.
>
> so, common fault handler can be modified to follow the same sequence, but=
 I
> have concern regarding clearing FSR before reporting fault to client.
> qcom_adreno_smmu_get_fault_info() is an example I gave but other client
> handler may have similar expecation of fault register not changed before
> client fault handler is called.

Simple solution would be to move the clearing of FSR to after the
fault is reported.  It doesn't really matter if it is before or after,
as long as it happens before the irq handler returns, AFAIU.  And
drm/msm will collect the fault info from the irq handler.

BR,
-R

> > > The way CFIE disable is helping
> > > with current patch indicates write FSR is unstalling context and subs=
equent
> > > transactions are faulted.
> >
> > No, it does not indicate that. The interrupt storm happens even when
> > there is exactly one context fault, and when the interrupt storm
> > happens *only* FSR.SS is asserted. I've verified this with debug
> > prints. Once more, MMU-500 will assert an interrupt when only FSR.SS
> > is asserted. This has nothing to do with subsequent transactions.
> >
> > > Do you stop getting interrupt storm after write
> > > RESUME.
> >
> > Yes, as long as the write to RESUME happens after all other bits in
> > FSR are cleared.
> >
> > > If you can mention your SCTLR configuration and FSR state in test
> > > sequence, it would be clearer.
> >
> > SCTLR has both HUPCF and CFCFG enabled.
> >
> > >
> > > An aside, If reducing delay between FSR and RESUME write helps then b=
oth
> > > can be done as part of qcom_adreno_smmu_resume_translation(). This wi=
ll
> > > follow spec recommendation and also make sure fault registers are not
> > > cleared before reporting fault to client.
> I think this sequence should address the issue you are observing.
>
> > >
> > > Thanks,
> > > Prakash

