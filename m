Return-Path: <linux-arm-msm+bounces-22631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F14BF907A54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 19:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 006A21C22DFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 17:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 524F114A623;
	Thu, 13 Jun 2024 17:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qxc0cYl3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8786F14A4F1
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 17:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718301323; cv=none; b=GCckcaIF0u3vG/kqPWBraLjUtnCrR2EclRznY2x33jkpSqZ+Tg73Y+xK4tqG9RUZ6dzTVm9FQCpROK9lis4G7vB/q0nTiDfCHKvIJ+TMAesWqICyytQtd61GikgCu2vounDK0RwufWKU7IKsBZg9a8/b1hwtvwJK1V2ErC+J6AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718301323; c=relaxed/simple;
	bh=MUCMdGKQ6KpvuwZkpqZcJz3thesROSDBWWwwZ9I5diA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nf4r65zFGI/gLwwE6+xIZX7jo+bdJFma91rCdRlJlVCnfRITaMtNX0xTVPsMEkzPNtiD6vgDZJqq2fmJXVN/MYp3+sVqe3lLlBSKI2DCe4RBhf9t5aF4sOngneGBGhFmCmwSx10b/sJVZYM9LBG7FWr6OvNw+3FIt9pV+HuJ7kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qxc0cYl3; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dfa71ded97bso1086406276.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2024 10:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718301320; x=1718906120; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Egm3XUTXXMactRvvK1SHa1gZTWtD5TN12FoLc8NaGlk=;
        b=Qxc0cYl3fjWjAk6vNt+VDp+jNJqZgujhyiGRl7NJ5uuvsUV9p/REUWutEM3hJVCDQM
         4wD+K1xsJiFMU9oFV77I0bCI6bjp33/RbUhANTAa14QhyslRBNYueXBu9UDsw37ZvZd6
         E/tuU87PYYhHtLdn+bsZq0EZJy6rjSemICdmBe3FLvwG2YZK/o8tqMpwpQSkE4l6Su7f
         F0i4xqU52ez6jvj+CVioF9prqifNtbdj19fzvnnjx77HagEtSGPsvx+93dwYJTZsnWy2
         2YkJejw5/ZcR37ujweu6odxKmGjqTQmlXtI4oKbg4n5DE9cysvBXHqI4AJpBkdaBOUmu
         5Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718301320; x=1718906120;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Egm3XUTXXMactRvvK1SHa1gZTWtD5TN12FoLc8NaGlk=;
        b=gkMGoDVnAcsIkDm4Y1SG1+2Q66B0ndGe1yJKLDKt0SplCixWT8TXwl3R2BP/7kGn4k
         WQVgLtwaEM2wP1xeKF2AcNs/rYCODnZSsUib0zYKiAAGAAg89U2CVInE5aYajYBeDcsk
         +cl1q4JsgrS+i8fIiar1fcsIW2IVNWys8lk+oAtqmgH53hnifHmlECBgrq4FqnT94ZYv
         opfMYo+iD7tNptTLDkiRrhUio8VcZ3mi1zVPs//UuqtwqHLAjc6Du7mAaa0r0ooNAXwg
         F3+oisT5EHcIrCc6rDbGSQDBtqvD+E1MtVDTgnPqDvWIwf7cp5Lj604tIHYl17MVvfke
         C3mg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Du0oz6u3DwVs694iC6ZNDO9osGRBZTXEnSFTrX0Qb9IxbRZkz7vp4xJFVEO2MDs2glbUAP9GITRckiKSizi0uAe7yvf3BZNABw2eIw==
X-Gm-Message-State: AOJu0YwbS1Hq8SZoIKJ6yM6hUibWL4A+ByCVOgV1s0KmaiDVOS7d5FMM
	xXAaQhzG1RwSr1jXVsRZ9M18q+rJYjniabc/zhD9hnvcW8IcH0Ao871ueGjiPpB+wgxIJ8o0FmJ
	V8W1yIKhzdk5Xwvf/v1ZiJmnAKTP2aJl2Ltk+MQ==
X-Google-Smtp-Source: AGHT+IF76nlQfftP79Eh69ExQvNjCEbwUkZM8145hBHocV2VPUCI+0i3mln+vSFpa/yE2GkSIhSsluLedfBw764rtXM=
X-Received: by 2002:a25:9384:0:b0:dfe:6bc4:9eda with SMTP id
 3f1490d57ef6-dfefec06946mr2090425276.13.1718301320427; Thu, 13 Jun 2024
 10:55:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613-msm-pass-addfb25-bad-modifier-v1-1-23c556e96c8a@linaro.org>
 <8aa99c1d-ca6a-a26b-96b5-82fc35cea0fa@quicinc.com>
In-Reply-To: <8aa99c1d-ca6a-a26b-96b5-82fc35cea0fa@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 20:55:08 +0300
Message-ID: <CAA8EJpr5r=5MP8DqGPV7Ndz0zKy4Ar3u+RiqocLyt6eZWuifnw@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: mark kms_addfb_basic@addfb25-bad-modifier as
 passing on msm
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Helen Koike <helen.koike@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Jun 2024 at 20:49, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/13/2024 9:33 AM, Dmitry Baryshkov wrote:
> > The commit b228501ff183 ("drm/msm: merge dpu format database to MDP
> > formats") made get_format take modifiers into account. This makes
> > kms_addfb_basic@addfb25-bad-modifier pass on MDP4 and MDP5 platforms.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt | 1 -
> >   drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt | 1 -
> >   2 files changed, 2 deletions(-)
> >
>
> Would be good to also give a link to the CI for the CI maintainers.
>
> But otherwise, LGTM
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Yes, good idea: https://gitlab.freedesktop.org/drm/msm/-/merge_requests/119

>
>
> > diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> > index 3dfbabdf905e..6e7fd1ccd1e3 100644
> > --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> > @@ -4,7 +4,6 @@ device_reset@unbind-cold-reset-rebind,Fail
> >   device_reset@unbind-reset-rebind,Fail
> >   dumb_buffer@invalid-bpp,Fail
> >   kms_3d,Fail
> > -kms_addfb_basic@addfb25-bad-modifier,Fail
> >   kms_cursor_legacy@forked-move,Fail
> >   kms_cursor_legacy@single-bo,Fail
> >   kms_cursor_legacy@torture-bo,Fail
> > diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> > index 23a5f6f9097f..46ca69ce2ffe 100644
> > --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> > +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-fails.txt
> > @@ -4,6 +4,5 @@ device_reset@unbind-cold-reset-rebind,Fail
> >   device_reset@unbind-reset-rebind,Fail
> >   dumb_buffer@invalid-bpp,Fail
> >   kms_3d,Fail
> > -kms_addfb_basic@addfb25-bad-modifier,Fail
> >   kms_lease@lease-uevent,Fail
> >   tools_test@tools_test,Fail
> >
> > ---
> > base-commit: 6b4468b0c6ba37a16795da567b58dc80bc7fb439
> > change-id: 20240613-msm-pass-addfb25-bad-modifier-c461fd9c02bb
> >
> > Best regards,



-- 
With best wishes
Dmitry

