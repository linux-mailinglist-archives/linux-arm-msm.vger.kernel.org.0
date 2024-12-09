Return-Path: <linux-arm-msm+bounces-41167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7899EA1B8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 23:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3048F166005
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 22:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493C919DF4F;
	Mon,  9 Dec 2024 22:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="keUxpGSS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523FA46B8
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733782617; cv=none; b=JhE7XVz6XpzR3KzJSgmYpijwv0p1p2dL7NrP1Rufv2TvLmYED6MUquu+QCfkISL0EzhuQSNFQZCKxTofsYr7iH1sV6w1Ub1XO2jIw2+WjSNYHZ3sBeFbLK1IcLKZ9rtYUqdNfSyijZFRUrQML0y0a0AG9utbU/OXcNwS/x4h7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733782617; c=relaxed/simple;
	bh=hdrFd76ac7pZ6E0mz3RpRFEh+/RfWGN3pQPQwuwrOeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=afweyg6L5KuhmWOr5Ooplfzn35/lL+3LuYALquWmMyaTU7Tb22b35iBv7LXlZusUWNSeMZA+yO09Cpnhf5dEAt4BQ1O48KjdHfIjsugZsuT2JJfN9gfePsGT79dwqLMNVhulCwa6am+BavSYaKyCh0M0Hhlhtx27FCjcdoVmkf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=keUxpGSS; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e2bd7d8aaf8so3702398276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 14:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733782614; x=1734387414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GjdBU58GLyG4jXaeGh1WmIo6+crxO9Fl9Blf1+csx7g=;
        b=keUxpGSSt+6KekKQ+ZoiaiClMLy64zj9n5nGfGFgagb0pZoUMkX+I2QV4uEeJ4xzZo
         jqKHgT4mb6odILMYFa6+0FY7GBKYCuA9s8egqO4qF8hS9w4hmAeydm4v10Mn7y3BljNr
         NIlRfLmKhIoOPiEZo8At0Uw2MnfQSpgQrbv+1tgNlaeGCSPMx7svOToVDrUd5Hy7akie
         p5CIAqH2BzmPFK682mqDBE/+BQCU1+hXyTJdqjLdi4pPlduJRdmwFlPVJnC39VlcY4A0
         CprsIr9vcEZM8bykplnfPRannYY6zpHwNFjwVgDAwlWrndpUDrMrzP0V16OFaio/6r1m
         g1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733782614; x=1734387414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GjdBU58GLyG4jXaeGh1WmIo6+crxO9Fl9Blf1+csx7g=;
        b=Zro+H3KfWW/4w0/Vomv6bxXF2crjZUMkZwns/7gaZWs3+XmoBd8eS46Y26RmX+TlwR
         amt/LRgEMv18c8mAYuCsVQZKtb/GtfFZbrJt5wMXvRp6ZOpJRdeZComKS3mWHkVITnXl
         ONaej8fHkrnmYg/5mkmh6Rza4XOUxIIFG1tu0ZbgtwGAb75Jz99LkqNc/WJ/vlnccHHg
         NviI3TGTgHsHP4EG5Q05QzxT/DtEHZXe9pshIExXIqQBW41t/lTQ+9TiLOlzJLytqHET
         8xHjHjUUHcjgOxtFDCVu4t1Oy535++M0G+Lddozonnbv3xCO46QYYpRPvcJVbsRRJaMj
         iFtw==
X-Forwarded-Encrypted: i=1; AJvYcCWlSje2LeN+hhP+2NyGxsi96VYPdoQ3IW33ayrZG6iMrtKf6LmXQeYHKZWi3+2W5G2HH3onXl8c0OJGh28d@vger.kernel.org
X-Gm-Message-State: AOJu0YwUFrUJHQBrSxvkxeefZKoo1NDpnwFxN7dok+ZENsvxhMXBEUf9
	fLsmrd5C03GF9jv3AFFDvOZ+Dm0VwEfek8rmc4TmM7csBKbZoWW2MK29RJePWAi7WeoVvztBUk2
	8nh+iC/F7T0GPiUwJnW5OzvIIgVcUxZodhahGlw==
X-Gm-Gg: ASbGncujxyoLyxOYzELQNsEV4zOfQaCm477b8LoZEz5sp2L2+38rJ/+ltkh4AlcbJgN
	VTAiZZsVG82AscvlpmFpunB+zjjbBKfGsRVc=
X-Google-Smtp-Source: AGHT+IE3KVx9ellET6od2Fov33jjRyilDngNFD1e4QdzTDVV+Uuh2NyO57XkBrcDlZwfvuJUuaClqS4lRUo1DxYviZw=
X-Received: by 2002:a05:6902:2886:b0:e38:bf8b:e2d0 with SMTP id
 3f1490d57ef6-e3a59d08124mr1793629276.46.1733782614229; Mon, 09 Dec 2024
 14:16:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com>
 <zae7rlojv5iiq2dx7bxhdsmmzj73o65cwk7kmryxsst36gy2of@k3vcm6omcias> <b784049f-a72c-47ff-a618-e7c85c132d28@quicinc.com>
In-Reply-To: <b784049f-a72c-47ff-a618-e7c85c132d28@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Dec 2024 00:16:43 +0200
Message-ID: <CAA8EJpojwG+_Q_9GYBFzQ_ReDbnO=+GbTPZscWgS1f=fkU0Anw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: filter out too wide modes if no 3dmux is present
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Abhinav,

On Mon, 9 Dec 2024 at 22:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/7/2024 9:29 PM, Dmitry Baryshkov wrote:
> > On Fri, Dec 06, 2024 at 12:00:53PM -0800, Abhinav Kumar wrote:
> >> On chipsets such as QCS615, there is no 3dmux present. In such
> >> a case, a layer exceeding the max_mixer_width cannot be split,
> >> hence cannot be supported.
> >>
> >> Filter out the modes which exceed the max_mixer_width when there
> >> is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
> >> to return failure for such modes.
> >>
> >> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >> ---
> >> Note: this was only compile tested, so its pending validation on QCS615
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
> >>   1 file changed, 13 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> index 9f6ffd344693ecfb633095772a31ada5613345dc..e6e5540aae83be7c20d8ae29115b8fdd42056e55 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> @@ -732,6 +732,13 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
> >>      struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> >>      int i;
> >>
> >> +    /* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
> >> +     * before even checking the width after the split
> >> +     */
> >> +    if (!dpu_kms->catalog->caps->has_3d_merge
> >> +        && adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> >> +            return -E2BIG;
> >
> > Is it the same as checking that there are LMs which support
> > DPU_MIXER_SOURCESPLIT ?
> >
>
> DPU_MIXER_SOURCESPLIT tells whether we can have more than one SSPP in
> the same blend stage.

Do we have a feature bit that corresponds to the ability to use 2 LMs?
I mean, there are other *split topologies, not necessarily the 3DMux
ones. E.g. PPSPLIT.

>
> 494     if (test_bit(DPU_MIXER_SOURCESPLIT,
> 495             &ctx->mixer_hw_caps->features))
> 496             pipes_per_stage = PIPES_PER_STAGE;
> 497     else
> 498             pipes_per_stage = 1;
>
> That is different from this one. Here we are checking if we can actually
> blend two LM outputs using the 3dmux (so its post blend).
>
> >> +
> >>      for (i = 0; i < cstate->num_mixers; i++) {
> >>              struct drm_rect *r = &cstate->lm_bounds[i];
> >>              r->x1 = crtc_split_width * i;
> >> @@ -1251,6 +1258,12 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
> >>   {
> >>      struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> >>
> >> +    /* if there is no 3d_mux block we cannot merge LMs so we cannot
> >> +     * split the large layer into 2 LMs, filter out such modes
> >> +     */
> >> +    if (!dpu_kms->catalog->caps->has_3d_merge
> >> +        && mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> >> +            return MODE_BAD;
> >
> > This can be more specific, like MODE_BAD_HVALUE.
> >
>
> Yes for sure, will fix this up.
>
> >>      /*
> >>       * max crtc width is equal to the max mixer width * 2 and max height is 4K
> >>       */
> >>
> >> ---
> >> base-commit: af2ea8ab7a546b430726183458da0a173d331272
> >> change-id: 20241206-no_3dmux-521a55ea0669
> >>
> >> Best regards,
> >> --
> >> Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>
> >



-- 
With best wishes
Dmitry

