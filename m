Return-Path: <linux-arm-msm+bounces-41169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DFB2E9EA22C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 23:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0A17164543
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 22:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4335819DF47;
	Mon,  9 Dec 2024 22:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rgeXeJw0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D402C9A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 22:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733784965; cv=none; b=Kppdv3GSpnuMxcrDF9eG9kszBVAUTGbZ3oK6D7aJ4AHqamIGAc2KCFFA7AQP6Si8GtlnZDyyVm2WBQR+hgh5l2rnQRf2aFZCIOL91qFc0OqPQpF+U+bBl32VGIyIjCWPAxKtbIQwD/deo/4OKMhTKYffvxII5fskNxLaHuKMNps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733784965; c=relaxed/simple;
	bh=12hQphzsjjUkW1d9H8mxTIKNWUmFq/0NOxwXiPmnEYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N42/3kCVy9Ee0U5z6URwzNA6L3f8Fcd/LSljaB8G7Eh6J8acPhAENer2U+IZcf+EoipMhQusW6sfqZE1dZcaPflycw1/Cz9gNXswDmpr3FTEBtSP1RYzJUMz6xJ0n+nMdc3QTAitsfFHeX+f7oHdUAYazVjDWAldVcYrLcEG4zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rgeXeJw0; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ef7f8acc33so40936887b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 14:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733784961; x=1734389761; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zg360WQmWUIYP8x3ZHAPjL5tUINcGUKvmQ6oZ/CIGO4=;
        b=rgeXeJw0eEcq29aZERXFxoa/dt8qQ6JFh4c7p9zjHZ4+AhNt1b+lyHTDFj8r+1f4F8
         IhAl3vGiXLZVBfrAtnnqdhpWu0CSnfm7FGtkPU9OYmJjBeC56UssKf/B3APvE06pq6BV
         o3/cMLjzxe9NoGzac/VgUSPfKx7huZbzg2U0RQuKGTtEvGCPMo588Myrwb1wEHIcpv7U
         lOiiqqBcPYMoSy58XmqAdmVLW+JHnGcMrONhrE1Z8xkuO4vhVGa8sa1Pktbwdmo/vAI9
         dBnFOsy1jRqVP3vzfgdHsbwjO3tzw1WhT1BSpxeh2i3IUYMX7DT4l/TULZCVfW+Nue5p
         Jujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733784961; x=1734389761;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zg360WQmWUIYP8x3ZHAPjL5tUINcGUKvmQ6oZ/CIGO4=;
        b=GEQ5RpMS3o1rJIkHYgFFOs+v+O5HLDyaoVt85ceTKdGYDKSXxcFrhLjLDd9IVhd83L
         9BANBMm4BSR8MYUfgz1o/Or7kB8E3o+Xnjyb5AcKuoBIOoCyyjKelnmEYeZbYr63tcxG
         x8pDG2SloLdQHp1UmM+aOrLZeYPyDJBrhP3eTySw8XKPd4ZWDGcUl/Twqfx2ciKaUbe3
         +nPEj6cJIaSMsKw2zGJQLvG4GCh8aa6JWDAA3bDBU30WxDmX2Xv71dXZPn1K7aQAlJDe
         BmwjuyBh87e1uMw8/xWlFsg6I/lIN3cB8ESmIa2FMKPBRzn7anH8MrDCeMFj1Bg7W7gK
         rRWw==
X-Forwarded-Encrypted: i=1; AJvYcCWpdN1WwY5m42i0tN5q4JwKtaqU+rC4SZWgrkHmMwEYusOql1Sw+rCZ5ysvKOUb51vL7X8dID8Z+0Hd+YFN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8/C2tgPoRz6T9/vYssg+QVN1uNV9q5Ti2TcrUcZeu+9HsdFiC
	Lfkj+ogolnxZjCn66CXyq9XEHUlzjEIVBgzntXpCaBlnT8YOLStAqcDp/+GtYp7m6miDN7HTac6
	cCGvgzGoRm/iiUQ37xvTnUBc4xPoe285MY0kNHw==
X-Gm-Gg: ASbGnctrMJTX4RJBIFrI9znJ5Zwyd0avhqUq1CKEdLK/HxuTZkPn6Ubou2CtIcIM5my
	EO/kU06glD13qR2xYjdqkJZyQDT+LEVUwf1g=
X-Google-Smtp-Source: AGHT+IGBS529CP3nkBRL/hSBck7KZQ3bTAxMxZelGrotzUE4fm9stmMtccbFjnXYDNdhGC2bqHRBAtW7fsN53rpNuQ8=
X-Received: by 2002:a05:6902:288f:b0:e39:7b55:ff7d with SMTP id
 3f1490d57ef6-e3a59bde21fmr2097243276.49.1733784961163; Mon, 09 Dec 2024
 14:56:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com>
 <zae7rlojv5iiq2dx7bxhdsmmzj73o65cwk7kmryxsst36gy2of@k3vcm6omcias>
 <b784049f-a72c-47ff-a618-e7c85c132d28@quicinc.com> <CAA8EJpojwG+_Q_9GYBFzQ_ReDbnO=+GbTPZscWgS1f=fkU0Anw@mail.gmail.com>
 <ab8a9d0e-e786-47ea-833d-59d2f2988898@quicinc.com>
In-Reply-To: <ab8a9d0e-e786-47ea-833d-59d2f2988898@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Dec 2024 00:55:50 +0200
Message-ID: <CAA8EJpoNSJ64+JWsmrdFVce-ADtjDhZzEjC2ZcJbqvfQ47F-_A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: filter out too wide modes if no 3dmux is present
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Abhinav,

On Tue, 10 Dec 2024 at 00:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Dmitry
>
> On 12/9/2024 2:16 PM, Dmitry Baryshkov wrote:
> > Hi Abhinav,
> >
> > On Mon, 9 Dec 2024 at 22:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/7/2024 9:29 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Dec 06, 2024 at 12:00:53PM -0800, Abhinav Kumar wrote:
> >>>> On chipsets such as QCS615, there is no 3dmux present. In such
> >>>> a case, a layer exceeding the max_mixer_width cannot be split,
> >>>> hence cannot be supported.
> >>>>
> >>>> Filter out the modes which exceed the max_mixer_width when there
> >>>> is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
> >>>> to return failure for such modes.
> >>>>
> >>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>> ---
> >>>> Note: this was only compile tested, so its pending validation on QCS615
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
> >>>>    1 file changed, 13 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>>> index 9f6ffd344693ecfb633095772a31ada5613345dc..e6e5540aae83be7c20d8ae29115b8fdd42056e55 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>>> @@ -732,6 +732,13 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
> >>>>       struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> >>>>       int i;
> >>>>
> >>>> +    /* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
> >>>> +     * before even checking the width after the split
> >>>> +     */
> >>>> +    if (!dpu_kms->catalog->caps->has_3d_merge
> >>>> +        && adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> >>>> +            return -E2BIG;
> >>>
> >>> Is it the same as checking that there are LMs which support
> >>> DPU_MIXER_SOURCESPLIT ?
> >>>
> >>
> >> DPU_MIXER_SOURCESPLIT tells whether we can have more than one SSPP in
> >> the same blend stage.
> >
> > Do we have a feature bit that corresponds to the ability to use 2 LMs?
> > I mean, there are other *split topologies, not necessarily the 3DMux
> > ones. E.g. PPSPLIT.
> >
>
> A layer can always be split across LMs. There is not really any feature
> bit for this as it can always be done in pretty much all DPU chipsets.
>
> Here the issue is we are not able to merge because there are no 3d mux
> blocks and hence we cannot split.
>
> We need to merge because, the same display is requiring multiple LMs.
>
> PP split will be a single LM going to two PPs and that going to two INTFs.
>
> Hence the way to look at this patch would be we are avoiding split
> because we cannot merge and not that we cannot split.

Ack, thanks a lot for the explanation!

>
> >>
> >> 494     if (test_bit(DPU_MIXER_SOURCESPLIT,
> >> 495             &ctx->mixer_hw_caps->features))
> >> 496             pipes_per_stage = PIPES_PER_STAGE;
> >> 497     else
> >> 498             pipes_per_stage = 1;
> >>
> >> That is different from this one. Here we are checking if we can actually
> >> blend two LM outputs using the 3dmux (so its post blend).
> >>
> >>>> +
> >>>>       for (i = 0; i < cstate->num_mixers; i++) {
> >>>>               struct drm_rect *r = &cstate->lm_bounds[i];
> >>>>               r->x1 = crtc_split_width * i;
> >>>> @@ -1251,6 +1258,12 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
> >>>>    {
> >>>>       struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> >>>>
> >>>> +    /* if there is no 3d_mux block we cannot merge LMs so we cannot
> >>>> +     * split the large layer into 2 LMs, filter out such modes
> >>>> +     */
> >>>> +    if (!dpu_kms->catalog->caps->has_3d_merge
> >>>> +        && mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> >>>> +            return MODE_BAD;
> >>>
> >>> This can be more specific, like MODE_BAD_HVALUE.
> >>>
> >>
> >> Yes for sure, will fix this up.
> >>
> >>>>       /*
> >>>>        * max crtc width is equal to the max mixer width * 2 and max height is 4K
> >>>>        */
> >>>>
> >>>> ---
> >>>> base-commit: af2ea8ab7a546b430726183458da0a173d331272
> >>>> change-id: 20241206-no_3dmux-521a55ea0669
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry

