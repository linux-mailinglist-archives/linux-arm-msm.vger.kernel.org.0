Return-Path: <linux-arm-msm+bounces-46460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACBFA216E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 04:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1433A7A040D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 03:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FE4117E019;
	Wed, 29 Jan 2025 03:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcU0/+aY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750B9171CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 03:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738121140; cv=none; b=dGzqBqpXVidsuupUwEkdCmTUyrQ+dswXd1+zWA7YVGsgQw/+j79yfWS4QCan9y24MFYhYn1EqhnKNP/pEKDw0p7Fpn0jhtqNcvibxbfWW5qC9y/XaUQcvrN+5N8vQ/lq3VT71PuoUghf7YpDcBpoLqh4k7wxtXp851eLghFVpBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738121140; c=relaxed/simple;
	bh=xWYAyVS9oE6n0w2ZslKjPYlUvgS6FfOZt749QsPmxow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7JhMJYJ3GWcJ5V8HGA+fct5AEpo1vAFywj9ujdXEJP3sHeloxaIEP5U4UfKGwrcwVb3reIHA5MXAJT1FjNRmtVAfJf3V5ud5X6JX4bLuCoWbjXt6qKuyNmx/SUU23AGhehHljkPhqqxnGzpvviimImV/fJR7fIWF91fBQqVbXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcU0/+aY; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a9cdcec53fso45647745ab.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 19:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738121137; x=1738725937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dDIqA4VDST4yPwcwWTbRUjv9OaOCjso0egT8E2lAps=;
        b=QcU0/+aYrLY8ZD7tTEbkSdgp9I/bbew7JdeuDhlcl8D1g0qn9i1AARj7F4+mAowDhz
         wYNhEmVURtsxCkjaVdgANBsIBGj8IVjEOqHytHrCWeD7o+pVqbSG/gXYZwZAA3dMRbNR
         2VXE7OyU9joEWfhKN4qo7s2a2ctCSH866zvFVn+/5sPyAQz7ahspGKhfXI7Ell4/DaKx
         /EHCYQR4oLfzYlBGO6dO5/KJ6p5mS+S8GprOsJLsYc/uxxlCs40ZzQM3XmQR1ixAUi9A
         ujBlqPAYZM1wizWuOX24WUBOwT5NeX9mNcxxEWYAMPSVSRYWkQzsy37ze0vG08sFB1Lm
         vgzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738121137; x=1738725937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dDIqA4VDST4yPwcwWTbRUjv9OaOCjso0egT8E2lAps=;
        b=lFz0y4yEra+vR07wCXRbuCPWOqcway6VYtuLBFWZQbiLC6yZIakM75spXVe6D9fbDy
         XLmvNDc9kkVO/1LNfw8/qj5mr0CxKSqupzTxgLzxT51qf8vOPFQ7gK47zAbbdkrs1Ol2
         VeFyOQYQlXJ3FGAeNaXw1y9EbIr5hSt8Z7Z5vpQli6Fn0QuRj5BlF+OOr/faMpmfA5VI
         R0xhe5lzUVwNr1NmzdLqnSRqZSqQwQZ3RqaQFjYR8CcFzfOSkJOo0D0HPFaNpd4wxG+X
         8/Txw1u7oxCzAYXrJa/bImfLQB1/mG3liL3ORKozEIKuc8ca62gxAfWodYMQi/1E23wp
         odQA==
X-Forwarded-Encrypted: i=1; AJvYcCU3P/SzwrTO6/D+7DoOZen+15efqRxUmqEOg/x5U82CIqgqxPi4O/TXuOHaHCQcHyGq4o7f0Rbe/Rt/GSKx@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/pkFwjo4TPJcKI+JNmwzYyrp1ZQlt/R/66I/01raRD+guCdJ7
	r68ZpArYHePm4nOllo1gRMdhfTVoEIUC5iXseqpPYebQohTgUtwQpwmdCytzAltw9chAnO5H6RY
	2uI8ZF3ajZPE8iD6aZEt6EiaUq4I=
X-Gm-Gg: ASbGnctHFMbKQDf+JjeSgvdj9/blN4SQsfAGlvDh7yG23EFs9MCofW/mQPpr5v3SbGF
	7eRAAKfTkFTtHeYjhLY+vOpViyyPCJ71WZ6qqZUHtIrdlL90XVJkfgeCScCMV4dPcEALbXQR37A
	==
X-Google-Smtp-Source: AGHT+IGpMyCuuvxRf9JKn/IGg4EgOQrCoMhpqUUmXymP6ydEXopJZ7pGxrRwB8qnqi6LFxZVbq4bt2PZZlGgSUMT9/8=
X-Received: by 2002:a05:6e02:138c:b0:3cf:ba60:e2fd with SMTP id
 e9e14a558f8ab-3cffe3e5d81mr18188015ab.12.1738121137443; Tue, 28 Jan 2025
 19:25:37 -0800 (PST)
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
 <CAF6AEGsUjp+fp1_cN7SGYTh5WSQrU2mm92QsqA5rcSY1OtA8VQ@mail.gmail.com> <CACu1E7FyHwJ2mp5u3rDganYj80eDq3QJzLRFzxD9E9O7hEDiag@mail.gmail.com>
In-Reply-To: <CACu1E7FyHwJ2mp5u3rDganYj80eDq3QJzLRFzxD9E9O7hEDiag@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Jan 2025 19:25:25 -0800
X-Gm-Features: AWEUYZkXMQul2iCS8g_lBAK6cifDDx4C71uDvFmo8QxPAIsqMGize_ZuktCSrPU
Message-ID: <CAF6AEGugDxYjH63+Up_T_pt+jQ2D0m=x1tSg3fGPteu3XgR2qA@mail.gmail.com>
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

On Tue, Jan 28, 2025 at 6:31=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Tue, Jan 28, 2025 at 9:21=E2=80=AFPM Rob Clark <robdclark@gmail.com> w=
rote:
> >
> > On Tue, Jan 28, 2025 at 2:15=E2=80=AFPM Connor Abbott <cwabbott0@gmail.=
com> wrote:
> > >
> > > On Tue, Jan 28, 2025 at 5:10=E2=80=AFPM Rob Clark <robdclark@gmail.co=
m> wrote:
> > > >
> > > > On Tue, Jan 28, 2025 at 3:08=E2=80=AFAM Prakash Gupta <quic_guptap@=
quicinc.com> wrote:
> > > > >
> > > > > On Thu, Jan 23, 2025 at 03:14:16PM -0500, Connor Abbott wrote:
> > > > > > On Thu, Jan 23, 2025 at 2:26=E2=80=AFPM Prakash Gupta <quic_gup=
tap@quicinc.com> wrote:
> > > > > > >
> > > > > > > On Thu, Jan 23, 2025 at 09:00:17AM -0500, Connor Abbott wrote=
:
> > > > > > > > On Thu, Jan 23, 2025 at 6:10=E2=80=AFAM Prakash Gupta <quic=
_guptap@quicinc.com> wrote:
> > > > > > > > >
> > > > > > > > > On Wed, Jan 22, 2025 at 03:00:58PM -0500, Connor Abbott w=
rote:
> > > > > > > > > The context would remain stalled till we write to CBn_RES=
UME. Which is done
> > > > > > > > > in qcom_adreno_smmu_resume_translation(). For a stalled c=
ontext further
> > > > > > > > > transactions are not processed and we shouldn't see furth=
er faults and
> > > > > > > > > or fault inerrupts. Do you observe faults with stalled co=
ntext?
> > > > > > > >
> > > > > > > > Yes. I've observed that on MMU-500 writing RESUME before th=
e interrupt
> > > > > > > > has been cleared doesn't clear SS. This happened with v2 in=
 the case
> > > > > > > > where there was already a devcoredump and drm/msm called
> > > > > > > > qcom_adreno_smmu_resume_translation() immediately from its =
fault
> > > > > > > > handler, and we'd get a storm of unhandled interrupts until=
 it was
> > > > > > > > disabled. Given that the architecture spec says we're suppo=
sed to
> > > > > > > > clear the interrupt first this may have been an attempt to =
"help"
> > > > > > > > developers.
> > > > > > > >
> > > > > > >
> > > > > > > Just to clarify, present sequence is:
> > > > > > > 1. context fault with stall enable. FSR.SS set.
> > > > > > > 2. Report fault to client
> > > > > > > 3. resume/terminate stalled transaction
> > > > > > > 4. clear FSR
> > > > > > >
> > > > > > > At what point when you try #2->#3->#4 or #4->#2->#3 sequence,=
 is FSR.SS
> > > > > > > cleared and interrupt storm is observed.
> > > > > >
> > > > > > With #2->#3->#4 FSR.SS is *not* cleared and there is a subseque=
nt
> > > > > > interrupt storm with only FSR.SS asserted. With #4->#2->#3 ther=
e is no
> > > > > > interrupt storm. From this we conclude that MMU-500 does not cl=
ear
> > > > > > FSR.SS unless #4 happens before #3.
> > > > > >
> > > > > Thanks Connor for clarification. I get your point now. I think it=
's
> > > > > expected interrupt storm with #2->#3->#4 sequence is expected.  W=
ith
> > > > > CONFIG_ARM_SMMU_QCOM_DEBUG enabled, context fault follows the seq=
uence of
> > > > > #1->#2->#4->#3, which is spec recommended.
> > > > >
> > > > > so, common fault handler can be modified to follow the same seque=
nce, but I
> > > > > have concern regarding clearing FSR before reporting fault to cli=
ent.
> > > > > qcom_adreno_smmu_get_fault_info() is an example I gave but other =
client
> > > > > handler may have similar expecation of fault register not changed=
 before
> > > > > client fault handler is called.
> > > >
> > > > Simple solution would be to move the clearing of FSR to after the
> > > > fault is reported.  It doesn't really matter if it is before or aft=
er,
> > > > as long as it happens before the irq handler returns, AFAIU.  And
> > > > drm/msm will collect the fault info from the irq handler.
> > >
> > > As I said in the earlier mail: "From this we conclude that MMU-500
> > > does not clear FSR.SS unless #4 happens before #3." #4 is clearing FS=
R
> > > and #3 is writing RESUME. So no, unfortunately it does actually matte=
r
> > > and we get a storm of unhandled IRQs if we don't clear FSR first. You=
r
> > > solution is what v2 did and it didn't work.
> >
> > So, just clear FSR also in the resume path
>
> Then we'd run the risk of incorrectly accepting a second fault if it
> happens immediately after we resume. Not terrible for our use-case
> where we only really need the first fault to be accurate and we
> disable stall-on-fault afterwards, but if you ever leave it on then it
> would result in another interrupt storm.
>

Howso? We'd still be ensuring that #4 happens before #3?  If needed we
can add a param to resume_translation() so drm can tell it to only
clear FSR if it calls resume_translation from the interrupt handler,
or something like that.  But I don't want to lose capturing the FSR,
and I don't think we need to.

BR,
-R

