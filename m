Return-Path: <linux-arm-msm+bounces-46526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F77FA22115
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 16:58:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD4313A16BB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 15:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A7E1DE4F8;
	Wed, 29 Jan 2025 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mL8V2FJY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765FE1A8F68
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738166327; cv=none; b=ECki5afsPlfBrymd444yMvmRerXWtkRgkdoBa4pC2WHW8AkaHzt8jJl3/az4Ss1C5N7oFVWWAuHy7LKDitzDmGaWaXBn1lEeEBnGG0vJ7zDEMMpE8fdecOidLlCcAndlE0JMe1i8A4t6RTrYBM2U/9Y75AhO9z03Csy0Au5NLks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738166327; c=relaxed/simple;
	bh=c1Jihq/Gyq3OU3s4XJT+DK8Q8KInGyeizpQFC50A6uo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hCUz8i/CWQnNslPqKp8sQ+Fik6dgaieU4EVn/WlZtGG9OIfCGMDBvEDGmMHF6DaOr1GbdJIrb/FcJnDgxTWsLM74ppfW9PD2AlIbWo8+qKUOtkyOPIlRol1Yjb9UdBKYf0nAFlnySbGYEq0SUD4Vq6q4xDt0hNcP+ZQYc1HWLdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mL8V2FJY; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3cfc1ff581dso15846945ab.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 07:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738166324; x=1738771124; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yyx2HnrHkqjaWL4grDrBJMJLyZTpqWFcrU3zWDmIiLc=;
        b=mL8V2FJY22bkHa7aqRQ7oMtB+mKPTInQmn34tkrPZs94HDXdX73fE5uG4rh13R8jZt
         zV5ZR/ybC6vN+gsBbZLRJNe9rr6Xxqiw9juX0xCX6T3In0ln4CR6pZmksnIkUUNoHKH8
         OndHcvtLUPtSdUezbev05Yifetye5do7/4dFLQCdZR4SOw/lQQB3PIQxKDB87wX6rsdL
         BsVScntbZa4Q+E+5xw+PIqsfeFrLeK/pt4WXKPp0SLK83Sn1JWbzoZSzlgnFbGkMdf7b
         mzdaz3PjUXp5Q9JvDpJFSCYn1kijf2ta0tWWH9xQB4lFc2EOGWH052nNBuNK5EVE5gA1
         r+Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738166324; x=1738771124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yyx2HnrHkqjaWL4grDrBJMJLyZTpqWFcrU3zWDmIiLc=;
        b=aRzqvUAGWtKwEN9nHTP+ZBybbKF2PhOQctlwn4qnf9UXIuFLZEcLdsD02R468gPRjD
         m6XTdWDKOw6QtA5oQw/1PEYy6lPUI5RZe+lSSicGzk6cuA2asWWjbIELxHUMhcCqrGsW
         2nFe8k/g0qobIafm6/w+8/BADv+kgzOzspNKgcgajRottF7+gaoDHnUITpTVCMJGqRIr
         rUsc3NhfDgCr9pN3Qunq2HmDxXcnA29NDgkkaOOU774XcreJ09PhxT+Eux7KTgeXTOfo
         elYLtVrK1M7yTl0zOeJjuWvWuSXAVtDVkFjCHZb4gNCjF/7IKzOVBfAhJc2b73qnc23E
         bfEQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6SQug3S5Pg5Em+YqAJ2X5nthBPMCGo7IX3WOukHFOgc51nUpKLNLZwicrYEd4H+LPFGQzOH2Zs20SDq6u@vger.kernel.org
X-Gm-Message-State: AOJu0YyR90llG1oobepsbKfT1zEY1fLePuanKnwmor7tJQQuW27mZWPV
	8R31sMruRXW1s0ESz1AK+TpWjbbCN03dslPQ+KNewtiKch6kIk7X2jvjnqdyJuZcdC4QUfiZz5r
	w46ZLRNlZ/t2pUtnSQVTTyx0fyw4=
X-Gm-Gg: ASbGnctyjgVRoAyStqNCjuHiYJM1Fi4pDUAYWIiBJ29q7LhdwMZulexfdLLwsmUQhLo
	S/8qEmb+E7N90wzDdxGM2UZ/OtE1A5JxWZREsDvJGl3k+XVGfJKfwo2HTVA4AwpYMoLUAbtE/yp
	KHrcyyuDgNwGHZDhl8trRpn/rNE6k8HA==
X-Google-Smtp-Source: AGHT+IHnCFTfSAmMVBm2YjmSTGYFPFdPTEgRxK+qIu+I/T+Z+PCgdh1bWdqnU7KHBa1TMZ2xZtF0vpMUCLb2CtJzpM0=
X-Received: by 2002:a92:cda7:0:b0:3ce:8b1b:2f with SMTP id e9e14a558f8ab-3cffe4b2c16mr28938375ab.17.1738166324333;
 Wed, 29 Jan 2025 07:58:44 -0800 (PST)
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
 <CACu1E7FyHwJ2mp5u3rDganYj80eDq3QJzLRFzxD9E9O7hEDiag@mail.gmail.com>
 <CAF6AEGugDxYjH63+Up_T_pt+jQ2D0m=x1tSg3fGPteu3XgR2qA@mail.gmail.com> <CACu1E7F0UTTapsLEUuKVFN0MF=kwhbSJqN2MU305Ab3cg+u_Lg@mail.gmail.com>
In-Reply-To: <CACu1E7F0UTTapsLEUuKVFN0MF=kwhbSJqN2MU305Ab3cg+u_Lg@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 29 Jan 2025 07:58:32 -0800
X-Gm-Features: AWEUYZkqyL0XupB4dML0yNwAmFsGfqHPxcVGzGZq55r_jJ2AS-o5CA3GcwcpY1k
Message-ID: <CAF6AEGv0-_Xh6adws+1WFTgX1vRSA4wLoDDZ7+RKgxpKgN-P0w@mail.gmail.com>
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

On Tue, Jan 28, 2025 at 7:34=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Tue, Jan 28, 2025 at 10:25=E2=80=AFPM Rob Clark <robdclark@gmail.com> =
wrote:
> >
> > On Tue, Jan 28, 2025 at 6:31=E2=80=AFPM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> > >
> > > On Tue, Jan 28, 2025 at 9:21=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gm=
ail.com> wrote:
> > > > >
> > > > > On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmai=
l.com> wrote:
> > > > > >
> > > > > > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_gup=
tap@quicinc.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote=
:
> > > > > > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic=
_guptap@quicinc.com> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott w=
rote:
> > > > > > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <=
quic_guptap@quicinc.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbo=
tt wrote:
> > > > > > > > > > > The context would remain stalled till we write to CBn=
_RESUME. Which is done
> > > > > > > > > > > in qcom_adreno_smmu_resume_translation(). For a stall=
ed context further
> > > > > > > > > > > transactions are not processed and we shouldn't see f=
urther faults and
> > > > > > > > > > > or fault inerrupts. Do you observe faults with stalle=
d context?
> > > > > > > > > >
> > > > > > > > > > Yes. I've observed that on MMU-500 writing RESUME befor=
e the interrupt
> > > > > > > > > > has been cleared doesn't clear SS. This happened with v=
2 in the case
> > > > > > > > > > where there was already a devcoredump and drm/msm calle=
d
> > > > > > > > > > qcom_adreno_smmu_resume_translation() immediately from =
its fault
> > > > > > > > > > handler, and we'd get a storm of unhandled interrupts u=
ntil it was
> > > > > > > > > > disabled. Given that the architecture spec says we're s=
upposed to
> > > > > > > > > > clear the interrupt first this may have been an attempt=
 to "help"
> > > > > > > > > > developers.
> > > > > > > > > >
> > > > > > > > >
> > > > > > > > > Just to clarify, present sequence is:
> > > > > > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > > > > > 2. Report fault to client
> > > > > > > > > 3. resume/terminate stalled transaction
> > > > > > > > > 4. clear FSR
> > > > > > > > >
> > > > > > > > > At what point when you try #2->#3->#4 or #4->#2->#3 seque=
nce, is FSR.SS
> > > > > > > > > cleared and interrupt storm is observed.
> > > > > > > >
> > > > > > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subs=
equent
> > > > > > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 =
there is no
> > > > > > > > interrupt storm. From this we conclude that MMU-500 does no=
t clear
> > > > > > > > FSR.SS unless #4 happens before #3.
> > > > > > > >
> > > > > > > Thanks Connor for clarification. I get your point now. I thin=
k it's
> > > > > > > expected interrupt storm with #2->#3->#4 sequence is expected=
.  With
> > > > > > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the=
 sequence of
> > > > > > > #1->#2->#4->#3, which is spec recommended.
> > > > > > >
> > > > > > > so, common fault handler can be modified to follow the same s=
equence, but I
> > > > > > > have concern regarding clearing FSR before reporting fault to=
 client.
> > > > > > > qcom_adreno_smmu_get_fault_info() is an example I gave but ot=
her client
> > > > > > > handler may have similar expecation of fault register not cha=
nged before
> > > > > > > client fault handler is called.
> > > > > >
> > > > > > Simple solution would be to move the clearing of FSR to after t=
he
> > > > > > fault is reported.  It doesn't really matter if it is before or=
 after,
> > > > > > as long as it happens before the irq handler returns, AFAIU.  A=
nd
> > > > > > drm/msm will collect the fault info from the irq handler.
> > > > >
> > > > > As I said in the earlier mail: "From this we conclude that MMU-50=
0
> > > > > does not clear FSR.SS unless #4 happens before #3." #4 is clearin=
g FSR
> > > > > and #3 is writing RESUME. So no, unfortunately it does actually m=
atter
> > > > > and we get a storm of unhandled IRQs if we don't clear FSR first.=
 Your
> > > > > solution is what v2 did and it didn't work.
> > > >
> > > > So, just clear FSR also in the resume path
> > >
> > > Then we'd run the risk of incorrectly accepting a second fault if it
> > > happens immediately after we resume. Not terrible for our use-case
> > > where we only really need the first fault to be accurate and we
> > > disable stall-on-fault afterwards, but if you ever leave it on then i=
t
> > > would result in another interrupt storm.
> > >
> >
> > Howso? We'd still be ensuring that #4 happens before #3?  If needed we
> > can add a param to resume_translation() so drm can tell it to only
> > clear FSR if it calls resume_translation from the interrupt handler,
> > or something like that.  But I don't want to lose capturing the FSR,
> > and I don't think we need to.
> >
> > BR,
> > -R
>
> Because we could clear FSR in the resume handler (ok), then resume,
> then fault again, then clear FSR again in arm_smmu_context_fault() and
> unintentionally acknowledge the fault without a corresponding resume.
> Again, it's not possible with drm/msm after this series since we
> disable stall-on-fault before resuming but still this means it's very
> fragile.

Alternatively we could use the return code from the fault handler
(maybe, -EFAULT) to indicate that arm-smmu irq handler should
terminate+resume immediately, rather than calling resume_translation()
in the case that drm doesn't schedule fault_handler.  We can change
both sides of the adreno_smmu_priv interface if needed to come up with
something sensible.

> To be clear, FSR should already be frozen until we resume, if the
> SMMUv2 architecture pseudocode is to be believed. So any fault that's
> recorded in the devcoredump will still be accurate with this patch,
> just subsequent faults might not be accurate.

I guess by default I'd be inclined to "trust but verify" that (and
also on qcom,smmu-v2).

BR,
-R

