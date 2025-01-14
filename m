Return-Path: <linux-arm-msm+bounces-44947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E16DEA0FE3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 02:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A27CE3A7681
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 01:43:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 749932135AF;
	Tue, 14 Jan 2025 01:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JRiAycj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C87A3232
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 01:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736819040; cv=none; b=i62PWPurg3YBqF2/BSzgqlIT7UeqRuM/faXAuZAKslew4thN3pCn9Tq3AZuQkqDoZGfzLoVQluf52XOTfp8QsrSc/HJR4dRursCGLpG2L+7sdQSk+XOv0gdPuUu7T56w+PXesATLr3ftXZki0wX1lm/2zsJpmoO8k1J4Ky8bIUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736819040; c=relaxed/simple;
	bh=tBtqAUGlnJ911iFCLxJalEW5BTOHuxFvE2EnASQc3t0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jXH9VlgOsmHvmDbhs6Acg7nOXEfVQcfp0TSXe9SgrmFatSRh7UjPe3X4GwLgOqmKHL+1I5RYjszQBqX6cU9Z7ux+4hMxL44A4EP8iFHPKsyfocF892KQezwxY99CXMHAG5ODGq3oP3pI/upfqjuWxk8o38EDcgso3UhQo29NeMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JRiAycj5; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e53aa843a24so8591520276.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 17:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736819037; x=1737423837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htgTFIaFwiArnc5q09+1so1au1sTRILiasQC2A0e6a0=;
        b=JRiAycj5/JwNHs2460Q8/z4VW7U8BYy3jwbOmPV+fjqyK/lqibSG+bQSBpY+BOBOsk
         HYt3eTzlJG5JbD4Y8KGZAN/eyVC0q02Oj+q9Z4uyxmz5EXIIqWn8+WGor6izsE6rBAg/
         4g4zD77ppxWHQbibyZXsjGiBXor40/+AuUqRTRXD856kGQsEFBB+0TmQxOkDskFewZ5w
         3F4TRBN1Weh9Mt4qnl5qI5N8ewpq8On5Y1LTyphDX+baijC+cggBqJB628kNdjI9eW0w
         wVImD3U7Yf1jWJKWc9W/GyJvatKJDqkMyob1bUR8TnUfFEj0cimB2pV3JPTyOHsMPFIV
         1Ncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736819037; x=1737423837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htgTFIaFwiArnc5q09+1so1au1sTRILiasQC2A0e6a0=;
        b=lcFfMyGZGzolRgjYKWKVh+ljRTxlk4eeEWXoAjTVf5N5ebYm/lAVV/fs0CGt2rKMgt
         HQ6RKnf72iCbQaDGAjGOIgx95KEFzo69HRe4UAY9NWGgHHlM91Fah7PWJKPdPqfAyi7t
         bnKcxSEbXJE1J+dtfEAUqRyjUm79Fu73/c3j0fJGtlhW/YXCSz62TJcpRe1dXVKXLZcQ
         Kg2NihpUaXTBg9+15MNcoE7Uy18glW+zn9L7bFppdJjuoQMS78PI0mLFuTIK5ZZG9Wem
         3ydONLDyR01UiHfLDEgdmvLxgcy8AKVv66tkQfdHOxKTYdMwYODLvqhKZslO9fpeaw2f
         qVlg==
X-Forwarded-Encrypted: i=1; AJvYcCVGwxHMsKUx4GVTjVk0ASUV/Bpa8W6tKh4x/l42jsCHBLZFJLe/MxbWDVnixG588B5637SUJmbMucEXMYxx@vger.kernel.org
X-Gm-Message-State: AOJu0YwXtmd0OpnDJN8xR2XAOylK7379550WD8FUukERmHCEz7l1+ex9
	rt2MvGf7mZ/E2bqDhGdtZToSztynmd6+ns3yzhGyEp6i8ax8vr/qOeEC/rdfaN4ZMGwMewYCry1
	wVrcF23yxZiMXaLoman2kLVpmcXOjAk8UPbVN7w==
X-Gm-Gg: ASbGncvhiymSIM287oRiPN9HWaFFsuUB3Z5mv6/BoEMsOC2LHJrUR6GsSUjtSYd5sXc
	nmLHRzd/3v+rBaDSKnbT/BWJ6r0ffNOXyBY4Y4gqkJ0ATIF4/2xLK8tUgkaR1ka5xrW/CDQ==
X-Google-Smtp-Source: AGHT+IHpgRwQwBboEQ9PjLu/qgJ6amLTybGzvApvLaw73OSKQimY/kP8OVbkT4jb34R/TN7el1N2PJkLDyHes2owXN0=
X-Received: by 2002:a25:b116:0:b0:e48:c570:301f with SMTP id
 3f1490d57ef6-e55013913d0mr15064289276.4.1736819037055; Mon, 13 Jan 2025
 17:43:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250106-dpu-perf-rework-v4-0-00b248349476@linaro.org>
 <20250106-dpu-perf-rework-v4-4-00b248349476@linaro.org> <35a22251-c348-4bb7-905c-e24032100a00@quicinc.com>
 <sklr3ryu35xmoejkmbu35d3jxsg2clk3whmzslxtzcbcb3gjy4@bmcivlzkxqa3>
 <a17204c1-6eb5-4ce4-a302-c5f582055037@quicinc.com> <0B5D10CF-35CE-4CF5-9105-5ACCC04EB94B@linaro.org>
 <21bf3612-7b93-44ee-82b0-462a02d8e3ce@quicinc.com>
In-Reply-To: <21bf3612-7b93-44ee-82b0-462a02d8e3ce@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Jan 2025 03:43:47 +0200
X-Gm-Features: AbW1kvad6lKhpK2tZ6HHSVq70g3dwPhGSQw6wEQMhInSeg_0ncekc-pqlWLXa18
Message-ID: <CAA8EJpoqO7EMdYzU9uqWdTRmto9qb6N=XhM4EzdAijPmoQA9uw@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] drm/msm/dpu: make fix_core_ab_vote consistent with fix_core_ib_vote
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Stephen Boyd <swboyd@chromium.org>, Simona Vetter <simona.vetter@ffwll.ch>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Jan 2025 at 03:31, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
>
>
>
> On 1/11/2025 5:08 AM, Dmitry Baryshkov wrote:
> > On 11 January 2025 01:49:23 EET, Abhinav Kumar <quic_abhinavk@quicinc.c=
om> wrote:
> >>
> >>
> >> On 1/9/2025 6:02 PM, Dmitry Baryshkov wrote:
> >>> On Thu, Jan 09, 2025 at 05:40:23PM -0800, Abhinav Kumar wrote:
> >>>>
> >>>>
> >>>> On 1/5/2025 7:07 PM, Dmitry Baryshkov wrote:
> >>>>> The fix_core_ab_vote is an average bandwidth value, used for bandwi=
dth
> >>>>> overrides in several cases. However there is an internal inconsiste=
ncy:
> >>>>> fix_core_ib_vote is defined in KBps, while fix_core_ab_vote is defi=
ned
> >>>>> in Bps.
> >>>>>
> >>>>> Fix that by changing the type of the variable to u32 and using * 10=
00ULL
> >>>>> multiplier when setting up the dpu_core_perf_params::bw_ctl value.
> >>>>>
> >>>>
> >>>> Actually after looking at this, I have another question.
> >>>>
> >>>> How did you conclude that fix_core_ib_vote is in KBps?
> >>>>
> >>>> min_dram_ib is in KBps in the catalog but how is fix_core_ib_vote?
> >>>>
> >>>> It depends on the interpretation perhaps. If the debugfs was suppose=
d to
> >>>> operate under the expectation that the provided value will be pre-mu=
ltiplied
> >>>> by 1000 and given then that explains why it was not multiplied again=
.
> >>>>
> >>>> And I cross-checked some of the internal usages of the debugfs, the =
values
> >>>> provided to it were in Bps and not KBps.
> >>>
> >>> Well... As you wrote min_dram_ib is in KBps. So, by comparing the nex=
t
> >>> two lines, fix_core_ib_vote should also be in kBps, as there is no
> >>> premultiplier:
> >>>
> >>>                   perf->max_per_pipe_ib =3D core_perf->fix_core_ib_vo=
te;
> >>> [...]
> >>>                   perf->max_per_pipe_ib =3D perf_cfg->min_dram_ib;
> >>>
> >>> And then, as a proof, perf->max_per_pipe_ib is passed to icc_set_bw()
> >>> without any modifications:
> >>>
> >>>                   icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_=
ib);
> >>>
> >>
> >> Understood max_per_pipe_ib. But then by the same logic, fix_core_ab_vo=
te is always in Bps and not in KBps because bw_ctl is in Bps.
> >>
> >> Is it really a discrepancy that fix_core_ib_vote is defined in KBps, w=
hile fix_core_ab_vote is defined in Bps because they are just following the=
 units in which bw_ctl and max_per_pipe_ib were defined in resp.
> >
> > Yes. They come in pair, as a part of the user interface. If one is in B=
ps and another one in KBps, it is very easy to forget that and misinterpret=
 them or to make a mistake while programming them. Not to mention that the =
threshold files, which are related to AB, are in KBps.
> >
>
> In that case, the documentation for both needs to be updated as well as
> it still says both are in bps not kbps.

Ack, I missed it.

>
>   * @fix_core_ib_vote: fixed core ib vote in bps used in mode 2
>   * @fix_core_ab_vote: fixed core ab vote in bps used in mode 2
>   */
> struct dpu_core_perf {
>          const struct dpu_perf_cfg *perf_cfg;
>          u64 core_clk_rate;
>          u64 max_core_clk_rate;
>          struct dpu_core_perf_tune perf_tune;
>          u32 enable_bw_release;
>          u64 fix_core_clk_rate;
>          u64 fix_core_ib_vote;
>          u64 fix_core_ab_vote;
> };
>
> >>
> >>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>> ---
> >>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
> >>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 2 +-
> >>>>>     2 files changed, 3 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/driver=
s/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>>>> index 7263ab63a692554cd51a7fd91bd6250330179240..7cabc8f26908cfd2dbb=
ffebd7c70fc37d9159733 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> >>>>> @@ -125,7 +125,7 @@ static void _dpu_core_perf_calc_crtc(const stru=
ct dpu_core_perf *core_perf,
> >>>>>                   perf->max_per_pipe_ib =3D 0;
> >>>>>                   perf->core_clk_rate =3D 0;
> >>>>>           } else if (core_perf->perf_tune.mode =3D=3D DPU_PERF_MODE=
_FIXED) {
> >>>>> -         perf->bw_ctl =3D core_perf->fix_core_ab_vote;
> >>>>> +         perf->bw_ctl =3D core_perf->fix_core_ab_vote * 1000ULL;
> >>>>>                   perf->max_per_pipe_ib =3D core_perf->fix_core_ib_=
vote;
> >>>>>                   perf->core_clk_rate =3D core_perf->fix_core_clk_r=
ate;
> >>>>>           } else {
> >>>>> @@ -479,7 +479,7 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *=
dpu_kms, struct dentry *parent)
> >>>>>                           &perf->fix_core_clk_rate);
> >>>>>           debugfs_create_u32("fix_core_ib_vote", 0600, entry,
> >>>>>                           &perf->fix_core_ib_vote);
> >>>>> - debugfs_create_u64("fix_core_ab_vote", 0600, entry,
> >>>>> + debugfs_create_u32("fix_core_ab_vote", 0600, entry,
> >>>>>                           &perf->fix_core_ab_vote);
> >>>>>           return 0;
> >>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/driver=
s/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >>>>> index ca4595b4ec217697849af02446b23ed0857a0295..5e07119c14c6a9ed341=
3d0eaddbd93df5cc3f79d 100644
> >>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> >>>>> @@ -51,7 +51,7 @@ struct dpu_core_perf {
> >>>>>           u32 enable_bw_release;
> >>>>>           u64 fix_core_clk_rate;
> >>>>>           u32 fix_core_ib_vote;
> >>>>> - u64 fix_core_ab_vote;
> >>>>> + u32 fix_core_ab_vote;
> >>>>>     };
> >>>>>     int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
> >>>>>
> >>>
> >



--=20
With best wishes
Dmitry

