Return-Path: <linux-arm-msm+bounces-31944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B9897B692
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 03:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B05401F252DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 01:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6DB6FC5;
	Wed, 18 Sep 2024 01:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WgB3+jiO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A94723B0;
	Wed, 18 Sep 2024 01:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726623041; cv=none; b=TSVNf4tTmCZmJ6N2WlTinEEge1kZSeFX94pXvj7d/6qQYDehd+yH9OJhOpP7bKd1cbCpUVnTpbOHIGjfcg0hxRTwEZzHcwgT8q8RbIbDRivH5kIvNPiHPwXalC7XjSVwKbZmuBToHudI2rwZUua3IpwsuIaSUgn78Tj3VUmIRxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726623041; c=relaxed/simple;
	bh=6sLG32ZEqRTa06GTyFt9bywhw1ZzJ1zgq3wy8VSnph8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s56Ey43VU0Az5Mmv9Wgo23lMeCtRtzUAF6vugVMZdxYAw12j1l0m/iCx+PGfIosOgbOtI4pFkyaAUPCmTsEZ7+wo+towj0tEDfl1Iy0bPRGORfosKazh3qzskVOYn419QV7PqGfEXV3f3ONbbUnhfPB2pFODCd+s/1Q+SK4lVYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WgB3+jiO; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-82aa8c36eefso294956339f.3;
        Tue, 17 Sep 2024 18:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726623039; x=1727227839; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsmNn5dg++oFHFAezsus4TU+AssoseH+2pzEpTsEOgA=;
        b=WgB3+jiOxU8/yWJj9mVERETzJtn6wF3hChBsts5PKFZQvg5IYNTG9HsF6vc+LNpMW6
         Nz7UkCatxF3XJ+znSPz+S4qi/OVRpuyVLWc3QLgj9r5ch4ZnlskoLNPYtkcXyjHApxWh
         kVoIkAZljv9l0TqJtiAoa43l9TuEjbXnQwdyeP665VuAoTPgEvOXCv8j+ePsbvcasBHG
         mw2kXlxlCRLH9eL8qQ0GQmkBihGw9gn3kAU6S3AxrG+uZz1YAPzZOe9adg6bShrr+yA1
         icfYDNmPpEcQ6/o8t9/ic58rw0Ea1Iic/uEAlOu7rzjQwdXzryaPbSPsj6b0dga3+Y12
         +Wng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726623039; x=1727227839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CsmNn5dg++oFHFAezsus4TU+AssoseH+2pzEpTsEOgA=;
        b=mi8gCr3YPIEH6WwhnPAkiam2SZNsRwCBifU/JTjWhZq6devaqnfWX0kmkUXIbheHon
         Bjr47qw9p0Mm//CPqNukVskLdqEOl367IP+IlNtyAaXsNwZEkPWHXGN3QA80pSk+juNF
         1mJzqg40v83FKgxAIhscf5Hbjk9H0/nLUkVb06PYefTU/2gw9ECii5fOeLRB5cqiG8qj
         aGQTbSaMibjPCJvAHyT14draAIP5glN6iAUqwKqIlj3iWIrTeEHiVwc+w/HAi4tuIB2m
         DnwzUizf0UfkMcO2gYF1zS0K09mdAa3Zu42ENcbGSb4SiBlJnRX/4T9Jf+V3Lrcl/1r4
         nKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVybBLnWBVtCT99ItWsRgyn+nE0L+vUrPA6ZnGvIn9jKPT0Erjanj9bAfu6BMul9vZ2iD3cZtGdg5G5IwJ8@vger.kernel.org, AJvYcCWFhHS2VUHD1XWyXMgB1lEo1pd99pLmRX1JnNfCFw1+BgxyOao2rO+tq6/2c1hqodbwowfXAptRMncr70wM@vger.kernel.org
X-Gm-Message-State: AOJu0YxHylGGSz28Np7jAvGt7TVBQPZ5VHRD0kL0OwZlvy69rC74OdQI
	+lWMHLyZ3PnDIpTW+BBV9Wo9GA7o2lIj9fAmAbIBEawtRmeelF20oCMRCxivy7eOKGzSBbhqKK6
	DfZBfi3CjmZv5xjU265gC/v4Bq2k=
X-Google-Smtp-Source: AGHT+IH+arwrYMMUiRQ7iDz1p8MmtCk5NY5GioMSJMKylZrwRZMJBVsiVdg6t3RHmGzslQrpXww0oOTa8SFimw7P4Zw=
X-Received: by 2002:a05:6e02:b2c:b0:3a0:978b:e6b with SMTP id
 e9e14a558f8ab-3a0978b112bmr104763985ab.21.1726623039436; Tue, 17 Sep 2024
 18:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240913195132.8282-1-robdclark@gmail.com> <e6991910-5058-4ef0-bfdf-6d33953535dd@kernel.org>
 <CAF6AEGvgS-DD0+qGX_Mud75aES4AQQjmWx2j2gyz7uakTpnp0w@mail.gmail.com> <59974e61-13f8-4080-850a-55e599c41cb5@kernel.org>
In-Reply-To: <59974e61-13f8-4080-850a-55e599c41cb5@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 17 Sep 2024 18:30:27 -0700
Message-ID: <CAF6AEGsVaq33wJzfnuvLWSPbmecx-j8a8FoCenKkBLMuqBTwdg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx+: Insert a fence wait before SMMU table update
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Connor Abbott <cwabbott0@gmail.com>, Rob Clark <robdclark@chromium.org>, 
	Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 4:37=E2=80=AFPM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> On 17.09.2024 5:30 PM, Rob Clark wrote:
> > On Tue, Sep 17, 2024 at 6:47=E2=80=AFAM Konrad Dybcio <konradybcio@kern=
el.org> wrote:
> >>
> >> On 13.09.2024 9:51 PM, Rob Clark wrote:
> >>> From: Rob Clark <robdclark@chromium.org>
> >>>
> >>> The CP_SMMU_TABLE_UPDATE _should_ be waiting for idle, but on some
> >>> devices (x1-85, possibly others), it seems to pass that barrier while
> >>> there are still things in the event completion FIFO waiting to be
> >>> written back to memory.
> >>
> >> Can we try to force-fault around here on other GPUs and perhaps
> >> limit this workaround?
> >
> > not sure what you mean by "force-fault"...
>
> I suppose 'reproduce' is what I meant

I haven't _noticed_ it yet.. if you want to try on devices you have,
glmark2 seems to be good at reproducing..

I think the reason is combo of high fps (on x1-85 most scenes are
north of 8k fps) so you get a lot of context switches btwn compositor
and glmark2.  Most scenes are just a clear plus single draw, and I
guess the compositor is just doing a single draw/blit.  A6xx can be
two draws/blits deep in it's pipeline, a7xx can be four, which maybe
exacerbates this.

> > we could probably limit
> > this to certain GPUs, the only reason I didn't is (a) it should be
> > harmless when it is not needed,
>
> Do we have any realistic perf hits here?

I don't think so, we can't switch ttbr0 while the gpu is still busy so
what the sqe does for CP_SMMU_TABLE_UPDATE _should_ be equivalent.
Maybe it amounts to some extra CP cycles and memory read, but I think
that should be negligible given that the expensive thing is that we
are stalling the gpu until it is idle.

> > and (b) I have no real good way to get
> > an exhaustive list of where it is needed.  Maybe/hopefully it is only
> > x1-85, but idk.
> >
> > It does bring up an interesting question about preemption, though
>
> Yeah..

The KMD does setup an xAMBLE to clear the perfcntrs on context switch.
We could maybe piggy back on that, but I guess we'd have to patch in
the fence value to wait for?

> Do we know what windows does here?

not sure, maybe akhil has some way to check.  Whether a similar
scenario comes up with windows probably depends on how the winsys
works.  If it dropped frames when rendering >vblank rate, you'd get
fewer context switches.

BR,
-R

> Konrad

