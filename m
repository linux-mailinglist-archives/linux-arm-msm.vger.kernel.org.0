Return-Path: <linux-arm-msm+bounces-38893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3569D6734
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 03:41:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9951416168E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 02:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4ED2D057;
	Sat, 23 Nov 2024 02:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TB57FEN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A74817;
	Sat, 23 Nov 2024 02:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732329713; cv=none; b=bphQZh+aN7FdSrQ24cR8wFGNCm/i/+PVD2EHobwLHN6jzy34kz5sAXJlceTi3r4s6wTo1eJ3FEOctYT7E7hQV55TiGrgz8suXtK81/uq3GEJ7eaSKutHDOrHD4r5DI6I/np/Cxt1y8IK28ZVVEuEdaAxUIWrFN9TGZDiP33wzoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732329713; c=relaxed/simple;
	bh=LNavqxR7RibpcEYKL0qPKrLUMz33vsxDPgSWZhdxd0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qti8aIv89MlQRY9Ew9pZrJOCFC1tWJ8TEorbcGpW8kMLYnSXzawptFuQ8ns4Q/nAe3/xDtfAy2G6nFEE/x+NlAdp3rrPpgwrnXne3G/3DVgPWSXE0eZlL3GKruVk7w7W6uu1fXpUTRs3SzHHrQ84cBYmuL30fDK4xYf8p6KlZ/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TB57FEN6; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-83e5dd0e5faso114790739f.1;
        Fri, 22 Nov 2024 18:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732329711; x=1732934511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70gmuVqd5ZnoO1vvK5nWrsFGGQmS9boqrWJIu2Mw/JQ=;
        b=TB57FEN6RGVpS08YfkrvVrovvoUvped3cvXF+p6BmoJ8dyGqaNaHxTZwJy94ROY6Nd
         HolHkYFlhSJEVFuJoZOz7y56hftlimd8tDxoHoWvs71j56z9Owm4lrkz9wLKGhnDaGVS
         2b9b68pYm+lGND6IA5Tr85vhIC5BwYoA6+JllLTGZZYI5Gslrl2CseQaI8Q7di0zp6sd
         0QP+SIqYA7M3agACtLe9oVHtulGmbFOeLHa3JbtMZiW1phQYXXtYe1YfZ53tNZJKiP0w
         LsEpzmLy4tZKlKDv6cC+YkWHVX+Ge0JhJ+mgaobxq+P9ppnMAbgR4qf2ibDEx/ZS5RfI
         Dw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732329711; x=1732934511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70gmuVqd5ZnoO1vvK5nWrsFGGQmS9boqrWJIu2Mw/JQ=;
        b=IEUwXKGQiHLAGOR9P0iY3GhD4YhkW/gL+nvJrUKxJEj7assZxbTMr9z2+ydOQcaLHb
         lLqnxALbxw1DzVmHsRdta04meFFmG7LP6otCav+I1NY0JDep8ltXHDbGpzW2f7a3YUyB
         h47nTR2f6jLwTZhJWTAo3bSuOK0NUNN/AwexfWbVVZaX96sXENtSV9CmCJBDALrW/RqF
         nTcd7OhEBOVwODN1luVIzgXzk8lbo7pEBYRROLQ4ETGmIThx2Cjdy1a4ZrByJx+x3Sf7
         kqVkjLB2t0sJRkI5ZnEo8XQ53Pfz9j8RqY2/noZFHfSQlCkVCiqaYog3KauFPh1TyYIW
         9v8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVN5/Hhtfm6XV2oriFlcNoGodmx5IMHJvPx0SIhMixMHIFsyYqWCI7+BpLZeH4T9Lu96t6U72B5I8K2I310@vger.kernel.org, AJvYcCWxxHKjtNQ7McUZK65GTBdlr4+1hMbXDz58/3EKEArNWtW3foiJtUNesln2h7WSCb2hrZHJnDTU8XhmsaHq@vger.kernel.org
X-Gm-Message-State: AOJu0YzWQmyrEmhqb0LZpValUWQywLRTcPwrTx55KyviEIiGrz5uG+B1
	b4yG9sYM4KQPikAX6JhjC7ccnITTfZNGvnj0I+Qh2YmkNxjPujCOBHzKmEVDYQ6H/GmgR+lltIV
	4u7i28sFuDBoWjomhh2Xp2ODm68A=
X-Gm-Gg: ASbGnctHH6NHSPFstc6Ag3h5S8F2oS30dwGeniCagUp2ZBFKVpaCwpe2R7gwxoY+Il6
	BimJJrp8O7uHPyXK/j9VxW7Ywto/h5rU=
X-Google-Smtp-Source: AGHT+IHCuNiL+FpVrEqzvuP5atIKEy/3nfa6jAXX2Bz235hjzWk72EjraJCcQQQADNxbedTXxFJysZnkRKitQUoDPeM=
X-Received: by 2002:a05:6602:1491:b0:83a:a7ec:cc0e with SMTP id
 ca18e2360f4ac-83ecce46417mr403776539f.0.1732329710689; Fri, 22 Nov 2024
 18:41:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121164858.457921-1-robdclark@gmail.com> <54601d79-4156-41f4-b1b7-250c5c970641@oss.qualcomm.com>
 <CAF6AEGtafQM7-mYy163Krry3OHgPNH3e9A=9VEhBpiQTADtULQ@mail.gmail.com> <5ff5d720-ccf7-42ee-9a4b-90cc168a4b7b@oss.qualcomm.com>
In-Reply-To: <5ff5d720-ccf7-42ee-9a4b-90cc168a4b7b@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 22 Nov 2024 18:41:39 -0800
Message-ID: <CAF6AEGuwjpizRy+S-xCmGdZV9MX+CDACwQp-NNKc2eBroCt1CQ@mail.gmail.com>
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

On Fri, Nov 22, 2024 at 4:19=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 22.11.2024 4:51 PM, Rob Clark wrote:
> > On Fri, Nov 22, 2024 at 4:21=E2=80=AFAM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 21.11.2024 5:48 PM, Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> Debugging incorrect UAPI usage tends to be a bit painful, so add a
> >>> helper macro to make it easier to add debug logging which can be enab=
led
> >>> at runtime via drm.debug.
> >>>
> >>> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >>> ---
> >>
> >> [...]
> >>
> >>> +/* Helper for returning a UABI error with optional logging which can=
 make
> >>> + * it easier for userspace to understand what it is doing wrong.
> >>> + */
> >>> +#define UERR(err, drm, fmt, ...) \
> >>> +     ({ DRM_DEV_DEBUG_DRIVER((drm)->dev, fmt, ##__VA_ARGS__); -(err)=
; })
> >>> +
> >>>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
> >>>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS_=
_)
> >>
> >> I'm generally not a fan of adding driver-specific debug prints..
> >>
> >> Maybe that's something that could be pushed to the drm-common layer
> >> or even deeper down the stack?
> >
> > Even if we had something like DRM_DBG_UABI_ERROR() I'd probably still
> > just #define UERR() to be a wrapper for it, since line length/wrapping
> > tends to be a bit of a challenge.  And I have a fairly substantial
> > patch stack on top of this adding sparse/vm_bind support.  (Debugging
> > that was actually the motivation for this patch.)
>
> Alright, let's not get in the way then
>
> > I noticed that xe has something similar, but slightly different shape,
> > in the form of XE_IOCTL_DBG().. but that kinda just moves the line
> > length problem into the if() conditional.  (And doesn't provide the
> > benefit of being able to display the incorrect param.)
>
> Maybe rust comes one day and the lines will start growing vertically ;)

Rust for the userspace facing rendernode side of the driver, in
particular, would be interesting for me, tbh.  Especially if handle
related rust<->c layers are designed properly.  I've lost track of how
many handle lifetime race condition UAF's I've seen ;-)

Re-writing entire drivers is a big lift, especially when there is so
much hw+features to enable.  KMS is limited to drm master (generally a
somewhat privileged process), so less of a concern from a security
standpoint.  Much of the GPU side of things is "boring" power related
stuff (suspend/resume/devfreq).  But the rendernode ioctls are open to
any process that can use the GPU in a typical setup.

BR,
-R

