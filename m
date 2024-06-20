Return-Path: <linux-arm-msm+bounces-23348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D6191038A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 13:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7F40B2132F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 11:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED31F17622C;
	Thu, 20 Jun 2024 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sN5b8V5z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAE7170826
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 11:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718884775; cv=none; b=EauscXkJrFtMF/QucfhMF8xmY/vNmYOGRQbRBPwY/pqFIzYJoxox3NXBuYNjQmIClG9O8KSW8F3y2v8m2yvydHd5dEa7v5f1xEI9GCVTWInF0sDvzeRFM1//GiG0DUtDX9qkcnLc00MJ5gEcFIWFxf/WQVIgYRapuwaSjFQ+DjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718884775; c=relaxed/simple;
	bh=zRx22dYDwsWOVGQ+VjfI1oxWKOAqC+DV0B2aegwDimA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wxi5HycLn+TWdViPVCGDU1WiR0ncETfpzXnKBkYFenwuTxvcNs9d3xz55L8LrxRHn5sbMGZUF/S2k/7UV9PtZgm+gdxYW2NhRW7BjflcMOxA29cl0+EX4uNXaIBdacPBMUKPn6Bhzh1+af1D6pM38z/iBa5j0+wEI5gdf9tinv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sN5b8V5z; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-63186c222eeso6801927b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 04:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718884773; x=1719489573; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hba2yhY6+cS9zRWYgJ6DWNBfIqROICVlAJkK3HOraRg=;
        b=sN5b8V5zbS8uLHrW74pBtwa3TZDdIj8s1JwzO7mP36gig90rwI61BsJYBgbtKHzuC/
         9noEuy+icXI9R5F7z59bX5BgCwrkaVWhBo+XPJOk+dS0ZIJ8FkZJtlgrbuTEaSp3aH+L
         Hv+pOnOX1VC/rt6sF/yyeleP4Jb8YzlZYHLIAtPcWFrMMowC7mPztsGk0O4crbmADXb9
         HnUE46Imt8ReB0RrfNAHNBh7AewryBmfjWhlj5ti+7FS0UAqUQh1ZTGE8iraD6m3HwFd
         Em19FHdQBTLQ+ldqJneIOyU+3oE1JEdXlgEiEg0uceOg79WXL5rO9T9ZEH1J9KCYJqRp
         esJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718884773; x=1719489573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hba2yhY6+cS9zRWYgJ6DWNBfIqROICVlAJkK3HOraRg=;
        b=bQyhOuVEhXxEzbw6TCJvmIO+7KqMmXoatna3+LsxUhEsxUabN7MNYsqRNTnXDFc7yn
         aIJ1hO38gEE/6qAs5dFTCujqvm9Npvni3bKV7YfaHnM0ufi6j1792LiThHeD4kXb1CJj
         /oE+5PtZeDpBlJW2zpYVhDW6eMLp8RHmH1RiBwRTz86ukSiae5v7zZnJs/2I0rHMW6rs
         h9eGN1PGlzW/qHYyZPu/Cb3a964m7V2AU9EDEzY6pD9xBoVdH1xLr9strd9or2/MNWLR
         eA6fJkTvvrdYxK6f1L3Cs7I2smImuaXvKNDLvodutXEuEF+R48VOhpTbSwPVKfRDJf3H
         ygrw==
X-Forwarded-Encrypted: i=1; AJvYcCWnXu4Uq6/gXPD5ZHwJhOv1wPBo607mWWcB/mYRGQXIi46/1l7usPFpkz277a9HpwzOIoVPwKBkCBOKwN3g8L84DktAoZHK6kbHhB20ug==
X-Gm-Message-State: AOJu0Ywhp0jvDtsu48d5zxuclmuxkTEui9y5qFOO4FPYf/C3MWLrhGwQ
	rVVcC9rEpqPADEo4vCPI0RRctdIpHuxOU7gPO0sm4zpWLFxOX/VTUxC6qjDILMzTXkXoUpmP3sF
	kwjThlCNyWz20tNRgQZQYYSlpJXrMEtHU/28MOg==
X-Google-Smtp-Source: AGHT+IFjjYSy37hdNHLG7AiZ0xFq8sTXhXbpeuY8x23zxt9N1eVayw54qYltw9zRhc5ZPVpb3MiaKOR9gK1e1PANkDc=
X-Received: by 2002:a0d:e694:0:b0:632:844d:5cf2 with SMTP id
 00721157ae682-63a8fbec98dmr45645717b3.51.1718884772646; Thu, 20 Jun 2024
 04:59:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240614-dpu-mode-config-width-v3-0-29ec4069c99b@linaro.org>
 <20240614-dpu-mode-config-width-v3-7-29ec4069c99b@linaro.org>
 <e191758e-3fb2-947f-09c6-71f37ab34891@quicinc.com> <f9b63458-6d85-b8d4-f9f8-5e1966323a54@quicinc.com>
 <CAA8EJppDcjf1JYi+iCheNt7XR-vfYx+JQ_QsBkXbR3wJD2egpg@mail.gmail.com> <88886ed2-d92c-ae0b-e0b6-06576e7862a2@quicinc.com>
In-Reply-To: <88886ed2-d92c-ae0b-e0b6-06576e7862a2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Jun 2024 14:59:21 +0300
Message-ID: <CAA8EJprwmF4ECxTUTsRLmgC5aCjY-1XQrE-QuxDyW+wKtxonPQ@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] drm/msm/dpu: drop _dpu_crtc_check_and_setup_lm_bounds
 from atomic_begin
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Jun 2024 at 20:10, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/18/2024 8:26 PM, Dmitry Baryshkov wrote:
> > On Wed, 19 Jun 2024 at 01:56, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >> On 6/13/2024 4:20 PM, Abhinav Kumar wrote:
> >>> On 6/13/2024 3:36 PM, Dmitry Baryshkov wrote:
> >>>> The dpu_crtc_atomic_check() already calls the function
> >>>> _dpu_crtc_check_and_setup_lm_bounds().  There is no need to call it
> >>>> again from dpu_crtc_atomic_begin().
> >>>>
> >>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
> >>>>    1 file changed, 2 deletions(-)
> >>>>
> >>>
> >>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>
> >>
> >> This change is causing a small regression on sc7280 chromebook.
> >>
> >> I have tested and concluded that this is causing the chrome boot
> >> animation to disappear.
> >>
> >> I have tested a couple of times and without this change it works fine.
> >>
> >> If this change was meant as an optimization, can we drop this one and
> >> investigate later why this is causing one? I have not spent time
> >> investigating why it happened. Rest of the series works well and I dont
> >> see any dependency as such. Let me know if that works for you. Otherwise
> >> I will have to spend a little more time on this patch and why chrome
> >> compositor does not like this for the animation screen.
> >
> > Oh, my. Thank you for the test!
> > I think I know what's happening. The cstate->num_mixers gets set only
> > in dpu_encoder_virt_atomic_mode_set(). So during
> > dpu_crtc_atomic_check() we don't have cstate->num_mixers is stale (and
> > if it is 0, the check is skipped).
> >
>
> Yes, it is a possible explanation for this.
>
> > I guess I'll have to move cstate->mixers[] and cstate->num_mixers
> > assignment to the dpu_encoder_virt_atomic_check(). And maybe we should
> > start thinking about my old idea of moving resource allocation to the
> > CRTC code.
> >
>
> I wonder if thats the right fix though because it seems correct to me
> that num_mixers is set in mode_set after the atomic_check phase.

The state should be consistent after the atomic_check(). Currently it
is not. cstate->num_mixers is not correct until mode_set().

>
> Perhaps the right way would be to breakup check_and_set() to check() and
> set() respectively and call only the check() part in atomic_check() and
> keep the set() part in atomic_begin to avoid duplication.
>
> Either way, I think we should re-visit this as this patch by itself is
> an optimization and I am totally fine if you want to merge the rest of
> this series just dropping this one for now.

The patch itself might be an optimization, but it pointed out the
actual issue with cstate->num_mixers.

-- 
With best wishes
Dmitry

