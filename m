Return-Path: <linux-arm-msm+bounces-42082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B32359F1183
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 16:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B2B91884144
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 15:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B8C1E1C26;
	Fri, 13 Dec 2024 15:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/R4tKU1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8AD15383D;
	Fri, 13 Dec 2024 15:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734105315; cv=none; b=RCy9XLXSwFVbJ6y/k/rUjFZnDvLQ3mQ4au9bwU356BtGqWci9f0zeyWCUTGCLGpYwTgT2Irbm2ujiiElI8XclEzNjKdXw4//giZaODM3ZkJmcIESaANEdToT0Rx0EnAsn2KNFU9WSJm2JAW2ZYdU6G+AqsVsEC2qkJ/sqdECSqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734105315; c=relaxed/simple;
	bh=Wgq0hE+HSIpemJUbmq9+Pqar2vhydyYR+9dXt8aCHyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YNSDRv81zUpPtoOE9jjzpaIs5zhq1mHe8fkTLtw2oe5TQ3AFIg1A1Ffy+h0qwqMAym+S6PiJx5kfmjYqO0FwyhB3GeuUjB+WyugZwD479wTYgiO1/MvrVvOGEDDcAkNa4Lv9D7mNnU1lYuWpIbNQhy9azjjKPv4Ow02ZZdL6Ey8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/R4tKU1; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a9cee9d741so15124755ab.3;
        Fri, 13 Dec 2024 07:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734105312; x=1734710112; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6VmOCA+V9XQez6fdrDoIQI1Lpi009QCYLL4t5PPetk=;
        b=c/R4tKU1EXTqWW1jezk8gAKkwG800AlWJs+gndqtsa7M06L5Kg7T9EUeVezSxxJFHy
         ijrnwF0gZDaDpkpctNhJFUhOhZXihJRl7fn7VL9w/40qKv4+qU4DYRKNkqYUwTUo9XHi
         nf+B67QGJjpiwPIlzM5JX48EeigbCWY2jA/AlCFDiHO5QiLgKZtN7Re2bmwdlZEmCZvz
         4P7cD30gEecL/boJ9urHY6AaNwvUrupJONKYwGGJCQ+qrK5wR5yJyOOOksKqA9I1TvWr
         NeDNqrJQsk4iJ+Cs8PwRIOSO4sAQ654i/NnBQu13TZ0+RquKC8RkSeqWY5qbuLo4zJjI
         kOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734105312; x=1734710112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6VmOCA+V9XQez6fdrDoIQI1Lpi009QCYLL4t5PPetk=;
        b=jkEX+3P/Eq/D8ZkrGvYFt7eOICZc/cOUDnLzxu1xUj6gJi8fBwSyB9/T58LB4USKV+
         TjkqfALjaF2TCSXH+SG39RVcMtjZFzkBJWt0oDXVxMg2M6f9iWybwd97K60YiFQYCZBI
         MUDa0igj8SfgIdfv97G9E+KQBNsRKqXLGqW78J1CCpquCBCafD92nKwt8NYF3LHfP9kE
         2/yiwi6Bkb/ywZm5sgen5s6KB5wlOKvUZmFRw2XGvQsunw4zg1t2XNoZPM7R2Ye/FHRL
         vpUw/sh3Z5cKBwCwyFjWE392LutcNHVDybVthab0C3/6u/tgiYLL99hVxpMpbgCppu6b
         HxKw==
X-Forwarded-Encrypted: i=1; AJvYcCVRCvdh/GH86TKYOHmXBL1AYTTWuV/gSxM14ZF8gFpT11EoVapvX2N8H4m9xdgfI2EOA+1QBGwb46iN4Hj/@vger.kernel.org, AJvYcCWp68WUV3Y1uSGdKksGpyWSGCrkkmF5AgInylsQ2I5uh10O6eoNkCHsM7Z8B/zBm7bTtyEkpM2bELkaUpM7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9d0XIBBY8G4ZMlRNfuftpMiPymHFr7WVYqn5+lRPIsDVhbzCB
	08rwYSFWprHIf01UBG5inIbkj8Hcy03KQ3Fw7vSu2SOFt+nJaopu+KW5keIt1yuEmN7/xui248f
	UOFISNl+WH68k075bth8ywIn+NXs=
X-Gm-Gg: ASbGncuzssSHtB6g1zQzEVsTidTbzD00TypvHTSzmeBgzBmO3QJMimGPqnLTliohikk
	1Fr2VKudZ8Gr3BlQbWqtBxVXkUbsgbl7hseQTLvH5J4CNhUc4gAiand5h1DpvUHnxM1WA
X-Google-Smtp-Source: AGHT+IFMG/lnqgLL0G12YQjpdrm4/5MG+SSmjuiAuSfeDBfTY9t2xf5FtjXDqhT4YvP0OFt9oWrlNzgxsZZaqLPfv5c=
X-Received: by 2002:a05:6e02:1c03:b0:3a7:e0c0:5f27 with SMTP id
 e9e14a558f8ab-3afeda2f96emr30053715ab.2.1734105312417; Fri, 13 Dec 2024
 07:55:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121164858.457921-1-robdclark@gmail.com> <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
 <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com>
 <5ff5d720-ccf7-42ee-9a4b-90cc168a4b7b@oss.qualcomm.com> <CAF6AEGuwjpizRy+S-xCmGdZV9MX+CDACwQp-NNKc2eBroCt1CQ@mail.gmail.com>
 <b792f88b-71c3-4430-b194-0a627de2f05c@oss.qualcomm.com>
In-Reply-To: <b792f88b-71c3-4430-b194-0a627de2f05c@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 13 Dec 2024 07:55:00 -0800
Message-ID: <CAF6AEGtbSwF2NVAurJxHwb-D7=SutGtMZ-UQbFAPr0ohDsK1OA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: UAPI error reporting
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 5:11=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 23.11.2024 3:41 AM, Rob Clark wrote:
> > On Fri, Nov 22, 2024 at 4:19=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 22.11.2024 4:51 PM, Rob Clark wrote:
> >>> On Fri, Nov 22, 2024 at 4:21=E2=80=AFAM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 21.11.2024 5:48 PM, Rob Clark wrote:
> >>>>> From: Rob Clark <robdclark@chromium.org>
> >>>>>
> >>>>> Debugging incorrect UAPI usage tends to be a bit painful, so add a
> >>>>> helper macro to make it easier to add debug logging which can be en=
abled
> >>>>> at runtime via drm.debug.
> >>>>>
> >>>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +/* Helper for returning a UABI error with optional logging which c=
an make
> >>>>> + * it easier for userspace to understand what it is doing wrong.
> >>>>> + */
> >>>>> +#define UERR(err, drm, fmt, ...) \
> >>>>> +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(er=
r); })
> >>>>> +
> >>>>>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
> >>>>>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARG=
S__)
> >>>>
> >>>> I'm generally not a fan of adding driver-specific debug prints..
> >>>>
> >>>> Maybe that's something that could be pushed to the drm-common layer
> >>>> or even deeper down the stack?
> >>>
> >>> Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
> >>> just #define UERR() to be a wrapper for it, since line length/wrappin=
g
> >>> tends to be a bit of a challenge.  And I have a fairly substantial
> >>> patch stack on top of this adding sparse/vm_bind support.  (Debugging
> >>> that was actually the motivation for this patch.)
> >>
> >> Alright, let's not get in the way then
> >>
> >>> I noticed that xe has something similar, but slightly different shape=
,
> >>> in the form of XE_IOCTL_DBG().. but that kinda just moves the line
> >>> length problem into the if() conditional.  (And doesn't provide the
> >>> benefit of being able to display the incorrect param.)
> >>
> >> Maybe rust comes one day and the lines will start growing vertically ;=
)
> >
> > Rust for the userspace facing rendernode side of the driver, in
> > particular, would be interesting for me, tbh.  Especially if handle
> > related rust<->c layers are designed properly.  I've lost track of how
> > many handle lifetime race condition UAF's I've seen ;-)
> >
> > Re-writing entire drivers is a big lift, especially when there is so
> > much hw+features to enable.  KMS is limited to drm master (generally a
> > somewhat privileged process), so less of a concern from a security
> > standpoint.  Much of the GPU side of things is "boring" power related
> > stuff (suspend/resume/devfreq).  But the rendernode ioctls are open to
> > any process that can use the GPU in a typical setup.
>
> The boring part would benefit greatly from automatic scope exit
> cleanup.. We've had lots of issues in the past with that (that are
> hopefully? sorted out now, or should I say, for now)

Maybe some of the cleanup.h stuff would be useful?

BR,
-R

