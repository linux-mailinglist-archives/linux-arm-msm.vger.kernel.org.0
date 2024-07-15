Return-Path: <linux-arm-msm+bounces-26237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6C7931B3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 21:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E60421C212CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 19:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A5C56446;
	Mon, 15 Jul 2024 19:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGPkYzcX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23A4F510;
	Mon, 15 Jul 2024 19:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721073125; cv=none; b=B+QMFNPV+XUuGfl1SNrOJ6e5IZGp6XfpCc+SQxQva1ImlUKF5ykm5KB9wGvlbK0IUkaTl3ku93Ikw22GJFJhse26nJ13F6rxUFncPTrwU1WZCdrMqKMzCoUjkXU3t4yvdw72UAHqQTgGjFYEdCCTYQzJF+7ONoNFE/7BEFHjdgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721073125; c=relaxed/simple;
	bh=PvL8uiREd2OBVqzOHxXqntDBPrAPZKWtsWKe2DXw7xo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g2xi5v2v1uj/blutg2iodN1N5x/oR8qqkwPR4Dx/VAUEN35NrMHepDCOGOWhj2oTT3xAWtjldnWatEnPqeidwgbdqr2ZsL/ZrF8PeXB1lPtG3XehRk2CaCPWTJIisJfjTSlwoPtkfEhAWZ2scDcyuyQRzRTv4TkP7iAE7khQ0sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGPkYzcX; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-58b3fee65d8so5557317a12.3;
        Mon, 15 Jul 2024 12:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721073122; x=1721677922; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vm5SMyl1SajlZ+kyo3ZiymVtffYgMWMYgUsmBEem/So=;
        b=mGPkYzcXCe9G3/i/ji7oMEG1Y0heBQ940xsCozC6O3UDnNAEjF+t/Amj5QABs0/STn
         H6kjkTE2tnW449zjPUlJ1x5vs9FWeotdkOgBkQBEQUNZVh29G6mE10Zud/4zVs1aQ38N
         5lXfMvrAiU0utsrcBhllT3Nage90RpqZi864quUOdwSXFCrB2HJu40mQrGslmdq0XFch
         BeKix8XrvIuscOek5FzDVaSAEMyPevX2NBFSeX8q3HbwZCxgy+/87yBsLamHZBGLaG5C
         e4l3vTGBjWwp97s9Zfs1u0jzJsbOL/odHQp8GmB622LVCgT4ennIHZFklqFJ4a3OVo5s
         CIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721073122; x=1721677922;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vm5SMyl1SajlZ+kyo3ZiymVtffYgMWMYgUsmBEem/So=;
        b=cVUUeqZEU6d/OVnQLzXB69PtJp+m3owwRiLaveBtDxUBvac7IC9gzAp0j8eqj9fz5l
         VELtPbileb2zCFMx8AJfuEx6r8Af8luJEr3ysjSoD4nCnbWtg9T16imQBWPE9hyYltx2
         x6QONvNMKviwdUV/sidXZiPBV9o/rnrDWqA63XP/GispfiF9MAHRsAijvPPMmon/mr5S
         HWVxliNMWfHgTuKHm6sk7OZkHNSbDNfp6+gkosvwRJY5Ybb+9vykGrvSP669mrc+QyKF
         gyYX/muo2gfNROR2drp3jKHi6jDbpnVylD9TwW6Pp8bb0nrrjub9PNl1PPz5lcWJYOcq
         r7bg==
X-Forwarded-Encrypted: i=1; AJvYcCVOzYaS2kvreWZyKQ4Jqf5JEGe+oLkHUDb1t7UlU7MzhN8LOs4f06jYSblM7GUaK3f+SbX6NMSsMn1uaRuwobTQbY5IP3AITDnf2vNEHAhWN7eCl5k9OAyhfN3OGJDdCCkzrg1DbZJ0cuxBLw==
X-Gm-Message-State: AOJu0YzYh6XDBlNwu8J+nd1Pdb7M4ykxq7Us0UKbED9eOgpS1uQn6Kh/
	kkp8joXRIcgT39rPtcV41yLjTIHEs6Sy8O6JkpGDrujilrahfWuhYTiFPxSW8pnXR96G/oOHlLe
	4znwQWfOrcwy7ZAuCkjQ6gFS6/ko=
X-Google-Smtp-Source: AGHT+IF/wXFWqnVfUWfZvf1E7JQMZRd12LmsqUnmo38aQqZPVblyaMEQ+uYoZHTft5Q5Qh1vTA62+iMgkTrH6dnOCqA=
X-Received: by 2002:a05:6402:3546:b0:599:4e93:33c9 with SMTP id
 4fb4d7f45d1cf-59e9724b8admr666193a12.12.1721073121975; Mon, 15 Jul 2024
 12:52:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-6-quic_abhinavk@quicinc.com> <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
In-Reply-To: <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 15 Jul 2024 12:51:49 -0700
Message-ID: <CAF6AEGtVBarvEUqgt7SHzYwXUsjY_rVQS6aMsN00G91Dr1aWAQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/dpu: rate limit snapshot capture for mmu faults
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 12:43=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, Jun 28, 2024 at 02:48:47PM GMT, Abhinav Kumar wrote:
> > There is no recovery mechanism in place yet to recover from mmu
> > faults for DPU. We can only prevent the faults by making sure there
> > is no misconfiguration.
> >
> > Rate-limit the snapshot capture for mmu faults to once per
> > msm_kms_init_aspace() as that should be sufficient to capture
> > the snapshot for debugging otherwise there will be a lot of
> > dpu snapshots getting captured for the same fault which is
> > redundant and also might affect capturing even one snapshot
> > accurately.
>
> Please squash this into the first patch. There is no need to add code
> with a known defficiency.
>
> Also, is there a reason why you haven't used <linux/ratelimit.h> ?

So, in some ways devcoredump is ratelimited by userspace needing to
clear an existing devcore..

What I'd suggest would be more useful is to limit the devcores to once
per atomic update, ie. if display state hasn't changed, maybe an
additional devcore isn't useful

BR,
-R

>
> >
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/msm_kms.c | 6 +++++-
> >  drivers/gpu/drm/msm/msm_kms.h | 3 +++
> >  2 files changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_km=
s.c
> > index d5d3117259cf..90a333920c01 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.c
> > +++ b/drivers/gpu/drm/msm/msm_kms.c
> > @@ -168,7 +168,10 @@ static int msm_kms_fault_handler(void *arg, unsign=
ed long iova, int flags, void
> >  {
> >       struct msm_kms *kms =3D arg;
> >
> > -     msm_disp_snapshot_state(kms->dev);
> > +     if (!kms->fault_snapshot_capture) {
> > +             msm_disp_snapshot_state(kms->dev);
> > +             kms->fault_snapshot_capture++;
>
> When is it decremented?
>
> > +     }
> >
> >       return -ENOSYS;
> >  }
> > @@ -208,6 +211,7 @@ struct msm_gem_address_space *msm_kms_init_aspace(s=
truct drm_device *dev)
> >               mmu->funcs->destroy(mmu);
> >       }
> >
> > +     kms->fault_snapshot_capture =3D 0;
> >       msm_mmu_set_fault_handler(aspace->mmu, kms, msm_kms_fault_handler=
);
> >
> >       return aspace;
> > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_km=
s.h
> > index 1e0c54de3716..240b39e60828 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.h
> > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > @@ -134,6 +134,9 @@ struct msm_kms {
> >       int irq;
> >       bool irq_requested;
> >
> > +     /* rate limit the snapshot capture to once per attach */
> > +     int fault_snapshot_capture;
> > +
> >       /* mapper-id used to request GEM buffer mapped for scanout: */
> >       struct msm_gem_address_space *aspace;
> >
> > --
> > 2.44.0
> >
>
> --
> With best wishes
> Dmitry

