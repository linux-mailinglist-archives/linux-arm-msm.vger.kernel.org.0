Return-Path: <linux-arm-msm+bounces-9219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DA3843C88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 11:28:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CECF288BB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 10:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F2B69D14;
	Wed, 31 Jan 2024 10:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TEtMRyj2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE9D6997C
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706696819; cv=none; b=NIGP712/gF8CmN4ShNmTu1rGkbTZCSdLol1kTSc8ZXmgksf8STwBxlWoVKsl2AI//LfpWqb6l+X8Em7HIbZNjpGceRg5pJekd8IDP1g7ArvpDLUrnQudM9O2jaGTDzhl3+goI9duoJNtyessJmnwBPgHhGdRy+HjoDwnU1EYs68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706696819; c=relaxed/simple;
	bh=tyqDI+3ZnJjTHgP7GW/Pe4PTo3RiUCrtkEdyWTbtEyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lx57JgmHbq2QsGi35ImSCeMBJrjkvi70yv+z73Tza7hygS74gDvrQIZ+IaFk6rj62TZb+WEAYowyjR6OEpkuQVfRD6TU1lpQZRwc8oHajQkhjzv9sWeej5J08ifyRbg4frQo+n0RrOoItrM+4UOAYLdt7Ao3Glz58f3+Wc3dUpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TEtMRyj2; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc6b69f0973so774342276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 02:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706696816; x=1707301616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWIGLVURJo4ZNOv6LbG+L2EJurKR+kNUUVg3etTCY74=;
        b=TEtMRyj2lIuJtg9br8rZ9SSBrKJZoj5zczP69CCt64onCrs6wDNJZeNqdhMkrWK0Eh
         Lpa80FiY4gdfA65WKfCRs3SN220Gx+at9Pvk3Ln7rEUMLhQx1u215ITe6KMqD4UPeHOS
         ZvssoM5aMtMHjMsnyhbpIOL5M0LXpNLhBqOVUt1GkVpgbWfwD4lnaYvJh0mRAG3EBlUI
         qRicv8oJZQDf7xE2lPHuyd60lYj8mrazkqw8kNUzlFKxBnNBn1N+HmJZmqMhqj9ZtGiV
         WIPzQpOD//PkMAW4VmgBmBkDh48jSWzc6JVPcyd8gDibVQjjQUINSqFKOug6wBpEUmxD
         YJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706696816; x=1707301616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWIGLVURJo4ZNOv6LbG+L2EJurKR+kNUUVg3etTCY74=;
        b=VSPqt7KFKKy2drXSdpEr4HdUCUetsUrccOXUc9yEZavg21kVp8eA0vAJqMTGPmIF1x
         kF+bFDxB8TyrFEEg4WQvfKWuLQ+QI+PY7vgbDx4k4S5BPc2w9I9pMlM319O4dfXTzzOf
         n0XeeB26S9EyW2a2eZzWvc+iLhpOoEtn+AaSyNiCS2AeE3LgO3jD1NlhDlhJIki3Dizn
         6D0lPiaJVZ2wQBM58I04KFGZzhxqqYvfKQk6siHxWjYiQyjqAVnmLjsO9+bY8aKYcn1g
         11zCi4XywtRQAtmXQqexKlqORjNItxKvgtNBY/SFo+hKm0HvRc5rOKyzMrfgzErtIb6I
         TRoQ==
X-Gm-Message-State: AOJu0YxhWQAax0eWQV78yTXYbXbwh9RZ2Y8pTz3mJjRYCZF6zb1rqVie
	72kgWG/ZNzDQRS3hAul/ftvpJKyG2ihvDgTFPjYK/5FVU3PpnEPmXRPZxtJptzlZ0B+5RR2y6hh
	kxcNwiscDqnorQi5bV11H0qDO+v8IkFqmxMT7fA==
X-Google-Smtp-Source: AGHT+IEqJVgu4nIRdtbsrRTsERmdIoAZnatopWJ6POWGE249ajHq/UFYIvx+LLtNTS6kTpwKklekHqS/zpNcV+La09M=
X-Received: by 2002:a25:2fc2:0:b0:dc6:c669:9914 with SMTP id
 v185-20020a252fc2000000b00dc6c6699914mr444876ybv.15.1706696816245; Wed, 31
 Jan 2024 02:26:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat> <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
 <ZbKlsTEvGPiGtzS3@phenom.ffwll.local> <1349365de499bae53a8c868738c7270fc16813d5.camel@mediatek.com>
 <ZboOp7JOp5teV1Cs@phenom.ffwll.local>
In-Reply-To: <ZboOp7JOp5teV1Cs@phenom.ffwll.local>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 12:26:45 +0200
Message-ID: <CAA8EJpqAU=RvqJUPmPO2LCJ+6KMOT8Pi2WrkPq8YHzhyRVxHeg@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"michel@daenzer.net" <michel@daenzer.net>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>, 
	"mikita.lipski@amd.com" <mikita.lipski@amd.com>, 
	"dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"maxime@cerno.tech" <maxime@cerno.tech>, "daniel.vetter@intel.com" <daniel.vetter@intel.com>, 
	"nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	"manasi.d.navare@intel.com" <manasi.d.navare@intel.com>, 
	"lucas.demarchi@intel.com" <lucas.demarchi@intel.com>, "sean@poorly.run" <sean@poorly.run>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>, "fshao@chromium.org" <fshao@chromium.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"jani.nikula@intel.com" <jani.nikula@intel.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Cc: "daniel@ffwll.ch" <daniel@ffwll.ch>, "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 31 Jan 2024 at 11:11, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Jan 31, 2024 at 05:17:08AM +0000, Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5) wrote:
> > On Thu, 2024-01-25 at 19:17 +0100, Daniel Vetter wrote:
> > >
> > > External email : Please do not click links or open attachments until
> > > you have verified the sender or the content.
> > >  On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (=E6=9E=97=E7=
=9D=BF=E7=A5=A5) wrote:
> > > > Hi Maxime, Daniel,
> > > >
> > > > We encountered similar issue with mediatek SoCs.
> > > >
> > > > We have found that in drm_atomic_helper_commit_rpm(), when
> > > disabling
> > > > the cursor plane, the old_state->legacy_cursor_update in
> > > > drm_atomic_wait_for_vblank() is set to true.
> > > > As the result, we are not actually waiting for a vlbank to wait for
> > > our
> > > > hardware to close the cursor plane. Subsequently, the execution
> > > > proceeds to drm_atomic_helper_cleanup_planes() to  free the cursor
> > > > buffer. This can lead to use-after-free issues with our hardware.
> > > >
> > > > Could you please apply this patch to fix our problem?
> > > > Or are there any considerations for not applying this patch?
> > >
> > > Mostly it needs someone to collect a pile of acks/tested-by and then
> > > land
> > > it.
> > >
> >
> > Got it. I would add tested-by tag for mediatek SoC.
> >
> > > I'd be _very_ happy if someone else can take care of that ...
> > >
> > > There's also the potential issue that it might slow down some of the
> > > legacy X11 use-cases that really needed a non-blocking cursor, but I
> > > think
> > > all the drivers where this matters have switched over to the async
> > > plane
> > > update stuff meanwhile. So hopefully that's good.
> > >
> >
> > I think all the drivers should have switched to async plane update.
> >
> > Can we add the checking condition to see if atomic_async_update/check
> > function are implemented?
>
> Pretty sure not all have done that, so really it boils down to whether we
> break a real user's use-case. Which pretty much can only be checked by
> merging the patch (hence the requirement to get as many acks as possible
> from display drivers) and then being willing to handle any fallout that's
> reported as regressions for a specific driver.
>
> It's a pile of work, at least when it goes south, that's why I'm looking
> for volunteers.

I can check this on all sensible msm generations, including mdp4, but
it will be next week, after the FOSDEM.

BTW, for technical reasons one of the msm platforms still has the
legacy cursor implementation might it be related?

>
> Note that handling the fallout doesn't mean you have to fix that specific
> driver, the only realistic option might be to reinstate the legacy cursor
> behaviour, but as an explicit opt-in that only that specific driver
> enables.
>
> So maybe for next round of that patch it might be good to have a 2nd patc=
h
> which implements this fallback plan in the shared atomic modeset code?
>
> Cheers, Sima


--=20
With best wishes
Dmitry

