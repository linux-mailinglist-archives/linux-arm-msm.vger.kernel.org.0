Return-Path: <linux-arm-msm+bounces-48947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F084A3FAFC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:23:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12A6919E3456
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEB1206F1F;
	Fri, 21 Feb 2025 16:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cfLEHZOW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58E4214A9A
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 16:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740154350; cv=none; b=cbGtLAfK7+gdmRhl6vvjNh00iPLhkCTpb7W7MEz1RJrg0U8KzTph7uEKetsBkYwO69ODGO88vZswhy73tMr9AcEHNwfqSObIBRN2+CfcXeMtMvSouncTeLvEhv2i5oeZZbgTzoZX+JTH1SAXsEEAV+NYTh9RkYWFzF+Qlb2ydH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740154350; c=relaxed/simple;
	bh=ZIIPMPvYMi+Age1OpT2vt9KqcNfrjGKwmcKq29Q5Fy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rtr9xMaO10rrpHbLcXmpXWxq473wrhBn4mB7HLdNZZGkeF8r5a+J0gOBUlbZfRt5ivVycg2+bE2GUPS5qcvLWGDkQcCx45a4Ga/CJaPFPiVYtWeu2qvU3fyr3Mt1JV3zHRQez3c8qha1BfL1soQAq08lcI5J4Q7jy4InpvNUe98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cfLEHZOW; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e5dd164f03fso2184138276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 08:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740154348; x=1740759148; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65xzch6iPMqxFMiA53gm5fHWZzrCGPb+BPyetZgHuuE=;
        b=cfLEHZOWXENC37WEe7EzvEfNDbuctKRRRObAdMDRgZ2ADHAcf+7ASEJSODIDbKknr5
         hrfJ+IjwJtbL19hPVRrgNN6zNDiBY9MVOypqkIrn51y4sku70cbBmKrHdBoKwAkjax1C
         R9DaePS+kJyx/vjkYkwUb70lUD3p0K5Q8sva/n5UztuRWYuujom6QmFBrjsEJnaYLnqH
         eNvh28NNNNFAd+HQ/NcKMQdKAmdo1AdIGNpgQufzjg8R33bQDWlCIK+lJPtQ7+wdin7G
         VYAz1nxsjyjbHC8zyvyFoxpMr/AkMyk/ZqxeNvnfLLtPfGaTHhgsO7d8wwUvH4GLsFN9
         VHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740154348; x=1740759148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65xzch6iPMqxFMiA53gm5fHWZzrCGPb+BPyetZgHuuE=;
        b=S3zMFjYhGo7y2IYi5di2sRoVc8GIrpNL2tDsWudIImETWMeupAClw4TDGEbCnL6xAJ
         8ubKJJ0LARDT9+1XGvGlkKQ365Br6EGIqoXQN9nsteYXzxh+EIYLayRb3UabDZUDwJnt
         yjOrSf2yRiKKc8O5w9p3MZqJ1O2WkaoE7pj1d3YxcXcQAUOIqTS2wjadcdiSmH61RLs/
         r0qX0bOICcsUL/bDp2G8ylIS/Wc/r2Jb4fkUY0q7bc9YpZkVCcH8SZGjkCwk95tcGHLu
         iq4Fg7wGlLZfDAveOXINJpDyQ3/bEa/vD21Su22fz2a+24HT/J22d9Ffqtny6xH66WVH
         TY7A==
X-Forwarded-Encrypted: i=1; AJvYcCUt5y7hNbXoMlMkQ5GLwaa1UtJcjS5RA2h3KCKghge3YDUIXKpToby6s4+POSvOvI4xtaK3cLL+AsJEZQcx@vger.kernel.org
X-Gm-Message-State: AOJu0YwBFwn9gE4stNM1UlgmBZy2ZNR3682TFtHqMjLTa23nGI3okaez
	DlT/NLpGJtQeoLWdWn2PVIwkhuWRv+CZDRhkg6VftZY5AJvsWQ/3W7UhDeJMuq4QAE2zZfGqCZ0
	v0vNZGG+IeGduQ/GjvndR8HUxf9XFx6eH1pUGrA==
X-Gm-Gg: ASbGncsH80n/+c4Iv0En6/bcTHLytajy5hcelJOhGGhr3iI0c1d4XZ+Ry4HjxO1Pzkc
	rXqNePH/XpJJY3qArCX535qvS0PJdbHKhY2ZLHFp9Hh9xYvjnRWmZhW/xJZ2sSGukNfFHtdNqmt
	YokS6/X4ukVVAe
X-Google-Smtp-Source: AGHT+IGhNDJlgVkhfevt2ccrr13CZOx64ah/8NXOZPmYhx9ZCe7w01Cm/DjAmVoBy2piD5CQUVdcDHmyt87znifdS/U=
X-Received: by 2002:a05:690c:3393:b0:6fb:9c08:4980 with SMTP id
 00721157ae682-6fbcc382c64mr33877327b3.27.1740154347729; Fri, 21 Feb 2025
 08:12:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-12-c11402574367@linaro.org>
 <qrwo5jtdj64vu27jn3v2wwyuxu25bjqrybj5jjfc5ifiotgzit@6vx2km46j7b3>
 <CABymUCPEYJTK=gBHcL291qn2zbotC7_8jA4z18sbSZSjRafSsg@mail.gmail.com>
 <ee7xdxyxjs46zfbotsa6hdmwpsvrkaere2hend4iavcvk6duqn@ogvght5qcx7b>
 <CABymUCNnt0Jiks+Fv8Os=V+zxzPAKMyH-wUpgDNMibWA_KNAxg@mail.gmail.com> <djq577v6e7cnvybegddxfzqgg5eat4ormqyopa4b5j7wa6spfk@jwuy4cash6ch>
In-Reply-To: <djq577v6e7cnvybegddxfzqgg5eat4ormqyopa4b5j7wa6spfk@jwuy4cash6ch>
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 22 Feb 2025 00:12:16 +0800
X-Gm-Features: AWEUYZlpK1Ks7M8EF1HJs2GjsF4cj_v_CBxkpXT6E_5dZ-ZfLiCHfDvGXKyuqKk
Message-ID: <CABymUCOHTecLL7zvsXA1uw=3hr4TAL0PZN6AEwFVGRX5G0_j9g@mail.gmail.com>
Subject: Re: [PATCH v6 12/15] drm/msm/dpu: blend pipes per mixer pairs config
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=E6=
=9C=8821=E6=97=A5=E5=91=A8=E4=BA=94 22:21=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Feb 21, 2025 at 04:07:45PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=
=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=94 00:17=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Thu, Feb 20, 2025 at 11:48:45PM +0800, Jun Nie wrote:
> > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=
=B42=E6=9C=8818=E6=97=A5=E5=91=A8=E4=BA=8C 03:57=E5=86=99=E9=81=93=EF=BC=9A
> > > > >
> > > > > On Mon, Feb 17, 2025 at 10:16:01PM +0800, Jun Nie wrote:
> > > > > > Currently, only 2 pipes are used at most for a plane. A stage s=
tructure
> > > > > > describes the configuration for a mixer pair. So only one stage=
 is needed
> > > > > > for current usage cases. The quad-pipe case will be added in fu=
ture and 2
> > > > > > stages are used in the case. So extend the stage to an array wi=
th array size
> > > > > > STAGES_PER_PLANE and blend pipes per mixer pair with configurat=
ion in the
> > > > > > stage structure.
> > > > > >
> > > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++=
++++++----------
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > > > > >  2 files changed, 30 insertions(+), 16 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > index 81474823e6799132db71c9712046d359e3535d90..50acaf25a3ffcc9=
4354faaa816fe74566784844c 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > @@ -401,7 +401,7 @@ static void _dpu_crtc_blend_setup_pipe(stru=
ct drm_crtc *crtc,
> > > > > >                                      struct dpu_hw_stage_cfg *s=
tage_cfg
> > > > > >                                     )
> > > > > >  {
> > > > > > -     uint32_t lm_idx;
> > > > > > +     uint32_t lm_idx, lm_in_pair;
> > > > > >       enum dpu_sspp sspp_idx;
> > > > > >       struct drm_plane_state *state;
> > > > > >
> > > > > > @@ -426,7 +426,8 @@ static void _dpu_crtc_blend_setup_pipe(stru=
ct drm_crtc *crtc,
> > > > > >       stage_cfg->multirect_index[stage][stage_idx] =3D pipe->mu=
ltirect_index;
> > > > > >
> > > > > >       /* blend config update */
> > > > > > -     for (lm_idx =3D 0; lm_idx < num_mixers; lm_idx++)
> > > > > > +     lm_in_pair =3D num_mixers > 1 ? 2 : 1;
> > > > > > +     for (lm_idx =3D 0; lm_idx < lm_in_pair; lm_idx++)
> > > > > >               mixer[lm_idx].lm_ctl->ops.update_pending_flush_ss=
pp(mixer[lm_idx].lm_ctl, sspp_idx);
> > > > >
> > > > > I almost missed this. Why is this necessary?
> > > >
> > > > It is protective code. In case there is only 1 LM, we should not
> > > > iterate 2 LM in a stage.
> > >
> > > That's not what the code does.
> >
> > I do not get your iea. _dpu_crtc_blend_setup_pipe() is called with
> > num_mixers set as:
> > cstate->num_mixers - (stage * PIPES_PER_STAGE).
> > So lm_in_pair will get the LM number in this stage to iterate.
>
> You have written that it is incorrect to iterate over two LMs if we have
> one. The code does a different thing: 'don't iterate over more than two
> LMs'. It would be more idiomatic to write it as:
>
> lm_in_pair =3D min(num_mixers, 2);
>
> And then it is obvious that it is not 'lm_in_pair' (note, singular), but
> something like 'lms_in_stage'. I'd really ask you to pull this up to a
> caller function and pass a correct num_mixers instead.

Thanks for the suggestion! min() is much more readable than mine version. A=
nd
stage is more proper than LM pair as a stage may only contain one LM. Will
replace the term.

For the pulling up to a caller, you mean the min(num_mixers, 2) here, right=
?

>
> > >
> > > > >
> > > > > >  }
> > > > > >
> > > > >
> > > > > [...]
> > > > >
> > > > > > @@ -535,8 +543,13 @@ static void _dpu_crtc_blend_setup(struct d=
rm_crtc *crtc)
> > > > > >                       mixer[i].mixer_op_mode,
> > > > > >                       ctl->idx - CTL_0);
> > > > > >
> > > > > > +             /*
> > > > > > +              * call dpu_hw_ctl_setup_blendstage() to blend la=
yers per stage cfg.
> > > > > > +              * There are 4 mixers at most. The first 2 are fo=
r the left half, and
> > > > > > +              * the later 2 are for the right half.
> > > > > > +              */
> > > > >
> > > > > The comment is invalid until you introduce quad pipe, currently t=
here
> > > > > are 2 mixers at most. However you can just say something like 'st=
age
> > > > > data is shared between PIPES_PER_STAGE pipes'.
> > > >
> > > > Accepted.
> > > > >
> > > > > >               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->id=
x,
> > > > > > -                     &stage_cfg);
> > > > > > +                     &stage_cfg[i / PIPES_PER_STAGE]);
> > > > > >       }
> > > > > >  }
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/driv=
ers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > > index 5f010d36672cc6440c69779908b315aab285eaf0..64e220987be5682=
f26d02074505c5474a547a814 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > > > > > @@ -34,6 +34,7 @@
> > > > > >  #define DPU_MAX_PLANES                       4
> > > > > >  #endif
> > > > > >
> > > > > > +#define STAGES_PER_PLANE             2
> > >
> > > BTW, This should be 1 for now.
> >
> > Yeah, it can be added in the last patch.
> > >
> > > > > >  #define PIPES_PER_PLANE                      2
> > > > > >  #define PIPES_PER_STAGE                      2
> > > > > >  #ifndef DPU_MAX_DE_CURVES
> > > > > >
> > > > > > --
> > > > > > 2.34.1
> > > > > >
> > > > >
> > > > > --
> > > > > With best wishes
> > > > > Dmitry
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

