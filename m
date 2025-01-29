Return-Path: <linux-arm-msm+bounces-46462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CECA5A216F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 04:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D1DF1884F11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 03:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00773188A3B;
	Wed, 29 Jan 2025 03:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wyw0KVaV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585101552FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 03:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738121694; cv=none; b=olV+DSly3ueekCl52pR4UI5HLGYVQEuriIN178bizProOWa8kaV2pbptmqlwsPH5oYz7bWy/JT5jGenELQOc5B5HQ2floZs+f2kiSeenYQZBWzelo+ONTf/wYbw4poLOge8xBCX4AETn6BcAZsrIUqc8xQK56fRdtZ7RRup7Q+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738121694; c=relaxed/simple;
	bh=v1L3PsKkt4rhGqLinyD6qhl7MiZRF1IP+NBCLPEbCkY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lov9zcysHVnbBH09NXKQr//U0OOGhp6UoVXM2rgm9TMJx3IGdZL96r32Pa8bKC6WxR1p/AKLRojOZAzHbEm8HH2xwGL2rrCC4egiPA0p9YUnA+V8h4oTv6mnaMp3vaV4CdCd4zy2bN9tOwtyWq6yCZPOw5t/iAALzSc53TQq4YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wyw0KVaV; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216325f516fso13275125ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 19:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738121692; x=1738726492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSEMixmPIS7Z8ruVPkos6z93kW0au3BNEj38QU0bOXo=;
        b=Wyw0KVaVvzWhyVfJYAGq6L73mRAK0SL/pfTIiLsN7uNot+iQHUZ5+nY9hlB0kt8dFS
         XTVaYypB92Y9h5g0jXJJxUFL25A00sdg8uKdwgsJekByykOm72eHNd2RWIlNB5gnrRPy
         l9hLyfa7UtyNZuMhnyqbsi/KKuc/9eH9hHiXvg7oELnVRtRlFl2MP9aFBkRxZinKSb+v
         pTCrTZDotEOLEAkiqW8BfY39mSLmCMocSaSy+6GsDtxe9SukyERq8SAtI7WU/+D5alhU
         RkzxkzFUYnEzk44yg0I460GTrbpfdboycq8MUSlZ8eVJb1Rkc1167C0GXPMbzG9sE1Pv
         xdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738121692; x=1738726492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSEMixmPIS7Z8ruVPkos6z93kW0au3BNEj38QU0bOXo=;
        b=xQUC5n+AkvShDNawvYD/6ia49beme0HjquLN9rFcNsHoG2LyFOM36HBuUPY1FyZ/kh
         T4ROylvJLkTi++PavXW//GiPKTWr10I8JoLQ+w0g86Yv9kGlB1IW95nFXJTRC1EDpTZP
         puc9hhBPeDRt7l+Kx9yNMrdpx77T8DL6SQ0x+srw6KIA/8Qf0ffAr3FfrlR5hzBMJKOs
         5NDhlfLE82M9lgKf22r5nneAcEWXR9OqR/fjMYf52GznkN249o7RAXZedcSegpUu7cmL
         X9N0PGSTbLAGqd2hQJ4Sv1VBo1ok6HrJtlDPnTFSDIrur31R/slokDSH+v84lF87DjD2
         4i0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXabjuNx+GmSjTuf//1TksJ5qTTeFzSIuRT5BJbU0CvGv4B1d2Z57ZeceOy0917jovXdh/H37wam+0cS9Wu@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrfw+dewF3nOVMTC8z8/kcoQDMsBY2PR3Xqq9/OG3qMimdI95+
	cyOaydghni1VfAhWKqwRCtC+cwHbSAUqhaHBCb7oIacDEb/VTTKJygHAvLc6lxb1CduM9J7REmR
	tUIcNOHmXIAeCJaV5CSx5ZFxHDGw=
X-Gm-Gg: ASbGncsSHdt6L8nYlRRORt5ZtDdTKKi55ycf6WSc0WJ6uQQyCFFe5/izdEqmD/pHEGa
	uvqhXCg8QFweq94GP51kmiGv8WjmqHtLJA8LnGhuczStzrgkGfMsTRWqnxUqoVOD0KLXEGFf1
X-Google-Smtp-Source: AGHT+IFbFQSYTvKU6Tn/jYbbxgPrehvkrB0XAVXsOwTCtBnwvAVfgVvZVo8IQ1hdLTPS9gNaQI/uOQ9lmAgGhGlB37U=
X-Received: by 2002:a05:6a21:329c:b0:1e5:d3cc:4632 with SMTP id
 adf61e73a8af0-1ed7a5c5535mr1035370637.1.1738121692412; Tue, 28 Jan 2025
 19:34:52 -0800 (PST)
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
 <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com>
 <CACu1E7FyHwJ2mp5u3rDganYj80eDq3QJzLRFzxD9E9O7hEDiag@mail.gmail.com> <CAF6AEGugDxYjH63+Up_T_pt+jQ2D0m=x1tSg3fGPteu3XgR2qA@mail.gmail.com>
In-Reply-To: <CAF6AEGugDxYjH63+Up_T_pt+jQ2D0m=x1tSg3fGPteu3XgR2qA@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 28 Jan 2025 22:34:41 -0500
X-Gm-Features: AWEUYZnSb6QYpR0Fp9PLawYr9P-QPjVvmIEP1Nm8egoDpm1trM7-ebAtlM8-HK8
Message-ID: <CACu1E7F0UTTapsLEUuKVFN0MF=kwhbSJqN2MU305Ab3cg+u_Lg@mail.gmail.com>
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

On Tue, Jan 28, 2025 at 10:25=E2=80=AFPM Rob Clark <robdclark@gmail.com> wr=
ote:
>
> On Tue, Jan 28, 2025 at 6:31=E2=80=AFPM Connor Abbott <cwabbott0@gmail.co=
m> wrote:
> >
> > On Tue, Jan 28, 2025 at 9:21=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> > >
> > > On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gmai=
l.com> wrote:
> > > >
> > > > On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.=
com> wrote:
> > > > >
> > > > > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_gupta=
p@quicinc.com> wrote:
> > > > > >
> > > > > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > > > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_g=
uptap@quicinc.com> wrote:
> > > > > > > >
> > > > > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wro=
te:
> > > > > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <qu=
ic_guptap@quicinc.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott=
 wrote:
> > > > > > > > > > The context would remain stalled till we write to CBn_R=
ESUME. Which is done
> > > > > > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled=
 context further
> > > > > > > > > > transactions are not processed and we shouldn't see fur=
ther faults and
> > > > > > > > > > or fault inerrupts. Do you observe faults with stalled =
context?
> > > > > > > > >
> > > > > > > > > Yes. I've observed that on MMU-500 writing RESUME before =
the interrupt
> > > > > > > > > has been cleared doesn't clear SS. This happened with v2 =
in the case
> > > > > > > > > where there was already a devcoredump and drm/msm called
> > > > > > > > > qcom_adreno_smmu_resume_translation() immediately from it=
s fault
> > > > > > > > > handler, and we'd get a storm of unhandled interrupts unt=
il it was
> > > > > > > > > disabled. Given that the architecture spec says we're sup=
posed to
> > > > > > > > > clear the interrupt first this may have been an attempt t=
o "help"
> > > > > > > > > developers.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Just to clarify, present sequence is:
> > > > > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > > > > 2. Report fault to client
> > > > > > > > 3. resume/terminate stalled transaction
> > > > > > > > 4. clear FSR
> > > > > > > >
> > > > > > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequenc=
e, is FSR.SS
> > > > > > > > cleared and interrupt storm is observed.
> > > > > > >
> > > > > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subseq=
uent
> > > > > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 th=
ere is no
> > > > > > > interrupt storm. From this we conclude that MMU-500 does not =
clear
> > > > > > > FSR.SS unless #4 happens before #3.
> > > > > > >
> > > > > > Thanks Connor for clarification. I get your point now. I think =
it's
> > > > > > expected interrupt storm with #2->#3->#4 sequence is expected. =
 With
> > > > > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the s=
equence of
> > > > > > #1->#2->#4->#3, which is spec recommended.
> > > > > >
> > > > > > so, common fault handler can be modified to follow the same seq=
uence, but I
> > > > > > have concern regarding clearing FSR before reporting fault to c=
lient.
> > > > > > qcom_adreno_smmu_get_fault_info() is an example I gave but othe=
r client
> > > > > > handler may have similar expecation of fault register not chang=
ed before
> > > > > > client fault handler is called.
> > > > >
> > > > > Simple solution would be to move the clearing of FSR to after the
> > > > > fault is reported.  It doesn't really matter if it is before or a=
fter,
> > > > > as long as it happens before the irq handler returns, AFAIU.  And
> > > > > drm/msm will collect the fault info from the irq handler.
> > > >
> > > > As I said in the earlier mail: "From this we conclude that MMU-500
> > > > does not clear FSR.SS unless #4 happens before #3." #4 is clearing =
FSR
> > > > and #3 is writing RESUME. So no, unfortunately it does actually mat=
ter
> > > > and we get a storm of unhandled IRQs if we don't clear FSR first. Y=
our
> > > > solution is what v2 did and it didn't work.
> > >
> > > So, just clear FSR also in the resume path
> >
> > Then we'd run the risk of incorrectly accepting a second fault if it
> > happens immediately after we resume. Not terrible for our use-case
> > where we only really need the first fault to be accurate and we
> > disable stall-on-fault afterwards, but if you ever leave it on then it
> > would result in another interrupt storm.
> >
>
> Howso? We'd still be ensuring that #4 happens before #3?  If needed we
> can add a param to resume_translation() so drm can tell it to only
> clear FSR if it calls resume_translation from the interrupt handler,
> or something like that.  But I don't want to lose capturing the FSR,
> and I don't think we need to.
>
> BR,
> -R

Because we could clear FSR in the resume handler (ok), then resume,
then fault again, then clear FSR again in arm_smmu_context_fault() and
unintentionally acknowledge the fault without a corresponding resume.
Again, it's not possible with drm/msm after this series since we
disable stall-on-fault before resuming but still this means it's very
fragile.

To be clear, FSR should already be frozen until we resume, if the
SMMUv2 architecture pseudocode is to be believed. So any fault that's
recorded in the devcoredump will still be accurate with this patch,
just subsequent faults might not be accurate.

Connor

