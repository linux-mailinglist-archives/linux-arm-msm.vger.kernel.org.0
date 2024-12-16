Return-Path: <linux-arm-msm+bounces-42358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E739F348B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 16:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0779F161423
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 15:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AAEF136349;
	Mon, 16 Dec 2024 15:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="doms7ZV9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F31653363;
	Mon, 16 Dec 2024 15:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734363129; cv=none; b=ADLucMXHGj1liZwhxbUKtSFstNxaTmiCfILccF9GY7jxtNd+gTx3NYQ9VcL9KhakaMz7U+XeLTjsVaeEHNFfrztSqjULc19YzzqPvFXcz8lIQGZY0MVkMER/8W+VQmADIaUThpuj9801zvsAMLNHkTMnnY7kSP8pwflEFSDsN6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734363129; c=relaxed/simple;
	bh=fV9w8fGa9cuEdy5MK/qZMfruA0M0qcTY3n+ALO1L3DI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y5mIu/9EpyD6k05qVwtrp39LfWgPwGjwLvWuGwUDASDO0dIu8LExyZeyr/DLfQL0e4bz5VkIseB+CNVcrjdoPQXtKAdse+SmJln1ww+Z8F1z46JTRGY1RD4Dym3E0o7YU5g6HK47tk6wx6nXQPILBtOalx6rxMJuzyos72bgzQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=doms7ZV9; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7eab7600800so261313a12.1;
        Mon, 16 Dec 2024 07:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734363127; x=1734967927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQGjErUtlCZJ7iTbPpf8bUnIM6UfUxr0a27J9i+kbd4=;
        b=doms7ZV99HGK9eeZIZvtOdY5RZudcwAN98GwyLkKDEQeqkMeDC8+MKLYjuysnnFjzk
         vc8i/GGoak11PFt8o7tc7gyt8KgcpWNhbJGeAndb8W/4YDhR9PDTdk58YASopj7ZWR8q
         RhKrykVcw5TeXgnT4Hnawy8U/RkpnhWLva5uZ+WD8Xm7MeU3HJTzZYRUgKw0xioFDfD0
         14vBi0+7PAXb23j0YtIIabVk4nSeWZetgoL+vK7KsEVXfztji4GQKDz3Tw8ire387YDK
         BCJZ9Bk+bA8RUzu0rC+Uxg5qDLIN+t8YkgqQZT1ReuVabrAJetMryYKJGqV2kssugbjo
         p+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734363127; x=1734967927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQGjErUtlCZJ7iTbPpf8bUnIM6UfUxr0a27J9i+kbd4=;
        b=ByKt3cu8Cx1wKki7vwpimAA5y8EB6IueqD2gaUYUpwWjnFnTEswblKQRo8hzvLh4Xg
         vq44VHrbgJt11g9iQRh1rrqAbMV86azasR73XVZ0WrYtm4wQLMLlltPms6AQOq7M9Zmn
         UNlkSrz9+pNH4ffRpjn3IwKzFxVJM2/W+wfHiQPKYbm+1NGcKVFg6W4atA6dz+LJ9gb5
         xHT36GLFgQR8cnZ2jhmLFbS+wShsLs6LcCs1LU32wdVSGN51KTfZoOMqSRvwkz41app5
         7ZuFEd0zUYmrIAYFzbRdoDVH+6K5w20pVY+BssneBKlYj1JqFtAaimn6mcuijr/61Ppa
         eIpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY9rdCRUc9ZBdvbxUr/QNBimgcxchHDqi5tT4DtO0LiYl0GMPpWbxCp6BZJx9IwvDCo3qdzov5eq5dh33I@vger.kernel.org, AJvYcCXUa83Aj8laLC4YAGbI8vn2h8p/KGKa3kYRuxud1c8cO2u5z5MKejb/gVWA09jhaNV5As/hy4/iYpqRAwMg@vger.kernel.org, AJvYcCXrl50uZsoV+nEVAtOPzB2fWAQQ8gGmaKr4sEZNSQaAdZ/wnQ60R3JChuckWqiXvYqi/g46Rp+DS/bXHhaFgiydhe8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8IgFXFWmrXwEBipBPY93fBDTPVNsrBj2JQzFPmHfISiAkgrZD
	eR8A18JU4/Ypzz9B1oqnFYGPRD2l0w96h9VJ220trZFZaqm4ZFg2+g+9PTEaGIvkeZ1tMLlAFZV
	vGrQ4ROPkjSRsIkGtNc+1PlaXCVk=
X-Gm-Gg: ASbGncsVDomBCU1gXA8BPvxlbA2HSpfyWigWpivQzMhSM+NjAhMPIFtQeTAaGgfi2Bo
	EWoitgZq53yZb5kJkYcWhebozhdmKzOgFoTfi6Q==
X-Google-Smtp-Source: AGHT+IENFuEqCpmJ+fh0Mtq+tiJji0QPe43tbh0IyC96vkUIWO6e+Z85h0KDNnVCSDCt9fLi9Qb2WTPgncrCMq+hdNM=
X-Received: by 2002:a17:90b:5444:b0:2ef:93:154e with SMTP id
 98e67ed59e1d1-2f2901b2b70mr7145457a91.5.1734363126741; Mon, 16 Dec 2024
 07:32:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
 <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>
 <pgi7p3aemxm3db2k27vi5euh6q6ppayrw6y7tcfeq4g5z23hzr@xousag2qhobp>
 <fc8e80dd-bcea-4515-b446-158649719569@amd.com> <CAA8EJpoR8HYq9ATDfmR5ksSnttBzj=DY+BKp5=OuVNF1WDJ-fg@mail.gmail.com>
In-Reply-To: <CAA8EJpoR8HYq9ATDfmR5ksSnttBzj=DY+BKp5=OuVNF1WDJ-fg@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Dec 2024 10:31:55 -0500
Message-ID: <CADnq5_M8jC2w=XWB4BG+id60zfGFMMkSegmeg-y=VpSHC+FvFQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] drm/amd/display: use eld_mutex to protect access
 to connector->eld
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Harry Wentland <harry.wentland@amd.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 10:12=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 16 Dec 2024 at 16:53, Harry Wentland <harry.wentland@amd.com> wro=
te:
> >
> >
> >
> > On 2024-12-10 16:20, Dmitry Baryshkov wrote:
> > > On Fri, Dec 06, 2024 at 11:43:07AM +0200, Dmitry Baryshkov wrote:
> > >> Reading access to connector->eld can happen at the same time the
> > >> drm_edid_to_eld() updates the data. Take the newly added eld_mutex i=
n
> > >> order to protect connector->eld from concurrent access.
> > >>
> > >> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> > >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> ---
> > >>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >
> > > Harry, Leo, Rodrigo, Alex, Christian, Xinhui, any response to this on=
e
> > > and to the radeon patches? I'd like to be able to pick the series for
> > > drm-misc and these two are not reviewed by you.
> > >
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/dri=
vers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > >> index 19a58630e774029767bf2a27eb4ddf17e3c21129..04c68c320252b5ce9647=
f0606fb86fe57f347639 100644
> > >> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > >> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > >> @@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_eld(=
struct device *kdev, int port,
> > >>                      continue;
> > >>
> > >>              *enabled =3D true;
> > >> +            mutex_lock(&connector->eld_mutex);
> > >>              ret =3D drm_eld_size(connector->eld);
> > >>              memcpy(buf, connector->eld, min(max_bytes, ret));
> > >> +            mutex_unlock(&connector->eld_mutex);
> >
> > All of this is wrapped by the adev->dm.audio_lock mutex. It might
> > be safer to modify the audio_lock mutex so it only guards the
> > aconnector->audio_inst access.
> >
> > But I don't see any way these mutexes would otherwise interact,
> > so this change should be good as-is.
> >
> > Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Would you ack it to merge it through drm-misc? Or would you prefer to
> pick up those two patches after merging drm-misc-next once the rest of
> the series lands?

Merging through drm-misc is fine with me.

Thanks,

Alex

>
> >
> > Harry
> >
> > >>
> > >>              break;
> > >>      }
> > >>
> > >> --
> > >> 2.39.5
> > >>
> > >
> >
>
>
> --
> With best wishes
> Dmitry

