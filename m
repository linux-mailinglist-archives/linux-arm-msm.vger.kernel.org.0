Return-Path: <linux-arm-msm+bounces-44554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E85A07570
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 13:15:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D3023A07F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 12:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21BD216E39;
	Thu,  9 Jan 2025 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xfsPbaT5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D033A217641
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424898; cv=none; b=ZOEUp6yHXkASs8j0cYYy7enNPUPjRrDSidMQqGitTIsBvzJYs7EKuESt7BzkDpfdDlknR7S79kl528y/t67c8Tqp1YmS9Be0j1fajHzpBzFL+OIuFXzRomkYYSmDw9eUt5YmLAas2SPJesad1nkwPTG0nAs7x+q0gkhLKpZDzfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424898; c=relaxed/simple;
	bh=p4j5IStoWyO7OVlzCOyuC2KiL7EPtJiEnWHh/dplXAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AFHRj9MulgVQmMhanBNRYeZwofNllC3iNpCIan44sdaRE8TEhH/LRGXDn9JbP0/LDeNQIU0XPTX7i20Yp9haholA+yGWMbHQNq4IzdOPdcw56fr6/kfjKZrXTj8BV2GVK7xODlqMe9GU+IHaKd4HzmzMLBPLd87EJHu3T0xTQzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xfsPbaT5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54024aa9febso797993e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 04:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736424895; x=1737029695; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Y3HY3/3raPKrBdMfi/LEIgt0D1405I14g2HDD+nyIE=;
        b=xfsPbaT5r4LHhu4Dpr3TD3d/dSfcQ6n1Ptw3RC7H3G9gh/K4Bjc+SKabf1ULgIw6pK
         pD/26hwF00enoqHxlrePYCDLfdxoPMqR1P70TKf+mHlQAcvtBqn1RAs8ndi0jrSIrC5Y
         UC+tOTpYzgR2vemPbp4djlzwJ9+/Rprd1V4a/oAGnhPpP3as/XVnQXPltL2EmC2WcYUs
         YcEb0cZII1x+e+Ksoh+1smlyBLfjUN/MdB6JmSTsZ2Mj/0u8Ybf9xuUe5O1sM3WR24y+
         pOf9ja9tG2OexqFfqiXJu7akCMpISPWwjLytJw2XpssW6fMjPkW0SGYZCcnCv4pmCl+Q
         a1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736424895; x=1737029695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Y3HY3/3raPKrBdMfi/LEIgt0D1405I14g2HDD+nyIE=;
        b=rxyvo+Y/Qno+4NBXXVnyxcUuoH6L53iJzf827qeyJteJFehFYkHFKDuYAqmD7UCTif
         FgYorFFsqydYKACDZ0i7R+trbh0awmYO3czrQmgsVzh4Cp1eaa4+jomMZUZbH98SvmNc
         TGCgsIh5WWA2V9LXq8LmAAF3Tpe6FdSkQiuWSI0l5D+f5KTiLZQ+1YmtWwHYTNx0JWLF
         xrqAJUgQovMEw6tpE1OmWJ7wAes+Ey7FTE9vaj0WwMBzzTgmD5yO0D5XGhUNpwZxrgDC
         vt7p2mFab+DT4LJDcGdaMmvnSU0FJl8oUB83zWlGnDGuFC4rj79OJYd7u1Aa76zKp7Gj
         FENw==
X-Forwarded-Encrypted: i=1; AJvYcCVFKIUhSyGRe8thx+CtmTwLfC7N+AM+nybn5UhzOF4zqckjGy0n/oli2R+Zhc3XD8++1Arer/uK5kap8cER@vger.kernel.org
X-Gm-Message-State: AOJu0YxmDKKO8koKudLbFjK30FEcG7zr5j7Kkbl3Pgqnp0WRaztvVNcG
	+LQagDfWrNM2ooE3rcOjkaqRJul7bqsAtEm5ZxF9Wp9Er5JG3r+5T7i1AbG0UnA=
X-Gm-Gg: ASbGnctdiH8B0wNgrn9ASGp6dOIsXFa/MBi2tDCacRbGJshSldE3xdmfLCLEgMaJAWP
	6bieF+VetU67pIIijqLA63R5kFI8v6PUBABR1jupSC1koUrrAOaKzJ4yfMvueCZEnLXygTg7k5N
	nQDdu85RQeqRpAIlfFYw1JXLmeqhFBberECSvcw1qucAmRRUgfHACvESegTExL1lsurw8ZGraEK
	jYOKIjDWnsGzanZLZSpmaJmjLWe0bjlqCmGh7VTrjgBGXzXoJHPLSJB+ZEVusnnayZuCZCQc/4X
	5QJHS+SvRT2OztyIPOlxA86Azh5DePe7PTAk
X-Google-Smtp-Source: AGHT+IG5w+mHeSxL6HLuB+vsJtc5xv9b0UjlOGR0qPmcZlQhgaehIdffVretPgnpXUgovXqCroBRTw==
X-Received: by 2002:a05:6512:104c:b0:53e:383c:dfa9 with SMTP id 2adb3069b0e04-542845d32f9mr2107453e87.30.1736424894890;
        Thu, 09 Jan 2025 04:14:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49a12sm180006e87.17.2025.01.09.04.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 04:14:53 -0800 (PST)
Date: Thu, 9 Jan 2025 14:14:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] drm/msm/dpu: decide right side per last bit
Message-ID: <4uzsmtbeoilcodnlbnbst2t2gfbhaucpzne2bzwavdeawmqs4q@u33sixkksfls>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>
 <yqbze4h6obiwulmvh64r62slaiih75hzescf5tjwqgtmhqy3wi@y4uedbo5jrzu>
 <95b83e6f-e455-4df0-b121-a1d900de0a56@quicinc.com>
 <CABymUCOGzvR0utNUR3-6bFDi3c3yRTUu=CcTo2-eTKBvpoU-PA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCOGzvR0utNUR3-6bFDi3c3yRTUu=CcTo2-eTKBvpoU-PA@mail.gmail.com>

On Thu, Jan 09, 2025 at 12:35:48PM +0800, Jun Nie wrote:
> Jessica Zhang <quic_jesszhan@quicinc.com> 于2025年1月9日周四 07:41写道：
> >
> >
> >
> > On 12/19/2024 2:09 PM, Dmitry Baryshkov wrote:
> > > On Thu, Dec 19, 2024 at 03:49:22PM +0800, Jun Nie wrote:
> > >> decide right side of a pair per last bit, in case of multiple
> > >> mixer pairs.
> > >
> > > Proper English sentences, please. Also describe why, not what.
> >
> > Hi Jun,
> >
> > Can we also add a note in the commit message on why the last bit check
> > works?
> 
> Sure. How about this?
> 
>     Currently we only support one pair of mixer, so counter's
>     non-zero value is enough to mark the right one. There will
>     be case with multiple mixer pairs, so let's use the last bit to
>     mark the right mixer in a mixer pair. If the last bit is set, it
>     marks the right mixer in the pair, it's left mixer otherwise.

You are not marking the right mixer, so it is not suitable.

> 
> >
> > Thanks,
> >
> > Jessica Zhang
> >
> > >
> > >>
> > >> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> ---
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
> > >>   1 file changed, 2 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > >> index 7191b1a6d41b3..41c9d3e3e3c7c 100644
> > >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > >> @@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> > >>   static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
> > >>   {
> > >>      struct dpu_crtc_state *crtc_state;
> > >> -    int lm_idx, lm_horiz_position;
> > >> +    int lm_idx;
> > >>
> > >>      crtc_state = to_dpu_crtc_state(crtc->state);
> > >>
> > >> -    lm_horiz_position = 0;
> > >>      for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
> > >>              const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
> > >>              struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
> > >> @@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
> > >>
> > >>              cfg.out_width = drm_rect_width(lm_roi);
> > >>              cfg.out_height = drm_rect_height(lm_roi);
> > >> -            cfg.right_mixer = lm_horiz_position++;
> > >> +            cfg.right_mixer = lm_idx & 0x1;
> > >>              cfg.flags = 0;
> > >>              hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
> > >>      }
> > >>
> > >> --
> > >> 2.34.1
> > >>
> > >
> > > --
> > > With best wishes
> > > Dmitry
> >

-- 
With best wishes
Dmitry

