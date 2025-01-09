Return-Path: <linux-arm-msm+bounces-44508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F271A06D1C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 05:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5232B1889CFA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 04:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEAEE2144B4;
	Thu,  9 Jan 2025 04:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pCWJ9xS8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496E1214239
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 04:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736397361; cv=none; b=rL57L9e+F6h1s3NyckXJep1fsGfIfHf4S28Vy1lM4GlKfZ9mrnCw8UFJ5gTEZT77mrC0JY8L7QMZ8PKjFsS+1dJjDWPWTIGs9vSgIC7PVdHaVa5Y1jhzRHMq/RrXNG3tjHCX1C+25+ZyFS7anO+Bwqny7Ua4pLmKgBU61xk37dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736397361; c=relaxed/simple;
	bh=meJIMkzuEn0JkmP/aVyAb1oJXfJnUKvUus7lCCxD1hc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WJE0x1hOz9nwy6cLiiNSvAXYMUSWSb08jeNgA+j9FFytJbZZbap6qJbsCbDtYn38tdtZO22NpWscpvRV2wHzj7bJxWwrdgmnwHQk9XzN0jzzIG7+73HDDorHGhp0tu1CO0bWv30xZqMVaVEJhEgSvgEfTo86I64ekgG0JBfC80Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pCWJ9xS8; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3c9ec344efso692798276.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 20:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736397359; x=1737002159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2lA5obqQucU5/GDB3hY6NFMYJYRA6Azxw0umsmePTs=;
        b=pCWJ9xS8zjupkhDKzfOhrlIONHjyH0gvcTDdz7DhCb2Jx8vWPqpTxhvNRas6wh66Z5
         fLEKLbaor7MMi0i6YJff/wOkQ2wPWLVEnsEL1zUGLQKHzAFi+nUMxqluoV82TRRc67hI
         ybJ/jBSbALU480ly0ZKQAenwyJdDNvkj+hAo/XZoFvHRzztlwkxtnTkv6LZhUpwKgCwu
         wcOeI0FeAB7Am+Da7OYL8uZFtwbNICLq+jtbMU28MMrsB89COPJpLDl0+b2LFyc/ukCU
         Wmb41WocEY5Fobs9TCoQaEWWxn9Vf5BOz/eFj1G5ash2byabmnJviJwpv2I38q2mmg43
         lrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736397359; x=1737002159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W2lA5obqQucU5/GDB3hY6NFMYJYRA6Azxw0umsmePTs=;
        b=mypIqcjQRBq+vG83qeADePmZ5CGtwz6Ae4i3AUAacvMcXMfGuCUUbBp/9bemKwZHWQ
         ZRYFf2C/z9AJWpfA8oZKt6Tp6xC8APdPzBqRZcjfU8y/Y7PFRl4SxV6kwx/KTf05AHjt
         uRSlJGYWrKjoOGCbmPjU95UaBkvUs+VRBMmxJ/nd9/ySZi16flqkxoOMzDwtfLhbdA2m
         bRBLHj+SCNdmJ37q6LoxUTl5BkmUkMaROozS3dgRmQFbIKQQNjVsgCmo7ZRZI60MVanb
         cIcjMzxCv6/dkP+UBUkVKyDSLF6/GABuGj48ThvQlqK6zudclmsdo9h+FqnsRoN1BsdN
         8amQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlXn+IpYWrBdnhMWILiwXGEDT6zowp+8BymvNrsQkqatHcZmOHf/euhKlSTpQl89oanqX3rUd4C+0OAqyq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz6sRcq/m/aUUas/bBQ6TQbJNTCjOeRR4yPwDuUomQm4zuXfvN
	6vGQf5035Xlx/ODAz4yr/g3yrrsf6paMFt2aCLAqhtCec2X9Jd1u5xTTzvXaI//s22rEDrhSDsw
	F/e3kawAlloJOrL006ysxEgiOkf1gQiUBmzZVCA==
X-Gm-Gg: ASbGncuPHdAjcjaw+d3sdU7Z/TWWuMW6+3HkKmybsH3rIUcXq/hcCtHVNIzyIMuCIuK
	pYifL9o2283eVzei5/D7oMX33NMbYrgMIGUHbnT8=
X-Google-Smtp-Source: AGHT+IGOg8iJXEfcZC1yEBLxBYLM51wSN33t6xFZdQKxKOAnmTXYvgx2qkkbhrdSEQ3TJ0Z/Bd3vEe/bnLexkgMJAI4=
X-Received: by 2002:a05:690c:6711:b0:6ef:60db:5e8d with SMTP id
 00721157ae682-6f531223024mr41819237b3.4.1736397359247; Wed, 08 Jan 2025
 20:35:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>
 <yqbze4h6obiwulmvh64r62slaiih75hzescf5tjwqgtmhqy3wi@y4uedbo5jrzu> <95b83e6f-e455-4df0-b121-a1d900de0a56@quicinc.com>
In-Reply-To: <95b83e6f-e455-4df0-b121-a1d900de0a56@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 9 Jan 2025 12:35:48 +0800
X-Gm-Features: AbW1kvYMXvUWTaBYKAZC_PvZ4Q-vNHu92otZcT1Tqs-rCkGo9VRaKARW_Jgj4_g
Message-ID: <CABymUCOGzvR0utNUR3-6bFDi3c3yRTUu=CcTo2-eTKBvpoU-PA@mail.gmail.com>
Subject: Re: [PATCH v3 04/15] drm/msm/dpu: decide right side per last bit
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jessica Zhang <quic_jesszhan@quicinc.com> =E4=BA=8E2025=E5=B9=B41=E6=9C=889=
=E6=97=A5=E5=91=A8=E5=9B=9B 07:41=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 12/19/2024 2:09 PM, Dmitry Baryshkov wrote:
> > On Thu, Dec 19, 2024 at 03:49:22PM +0800, Jun Nie wrote:
> >> decide right side of a pair per last bit, in case of multiple
> >> mixer pairs.
> >
> > Proper English sentences, please. Also describe why, not what.
>
> Hi Jun,
>
> Can we also add a note in the commit message on why the last bit check
> works?

Sure. How about this?

    Currently we only support one pair of mixer, so counter's
    non-zero value is enough to mark the right one. There will
    be case with multiple mixer pairs, so let's use the last bit to
    mark the right mixer in a mixer pair. If the last bit is set, it
    marks the right mixer in the pair, it's left mixer otherwise.

>
> Thanks,
>
> Jessica Zhang
>
> >
> >>
> >> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
> >>   1 file changed, 2 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_crtc.c
> >> index 7191b1a6d41b3..41c9d3e3e3c7c 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >> @@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu=
_crtc_mixer *mixer,
> >>   static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
> >>   {
> >>      struct dpu_crtc_state *crtc_state;
> >> -    int lm_idx, lm_horiz_position;
> >> +    int lm_idx;
> >>
> >>      crtc_state =3D to_dpu_crtc_state(crtc->state);
> >>
> >> -    lm_horiz_position =3D 0;
> >>      for (lm_idx =3D 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
> >>              const struct drm_rect *lm_roi =3D &crtc_state->lm_bounds[=
lm_idx];
> >>              struct dpu_hw_mixer *hw_lm =3D crtc_state->mixers[lm_idx]=
.hw_lm;
> >> @@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct=
 drm_crtc *crtc)
> >>
> >>              cfg.out_width =3D drm_rect_width(lm_roi);
> >>              cfg.out_height =3D drm_rect_height(lm_roi);
> >> -            cfg.right_mixer =3D lm_horiz_position++;
> >> +            cfg.right_mixer =3D lm_idx & 0x1;
> >>              cfg.flags =3D 0;
> >>              hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
> >>      }
> >>
> >> --
> >> 2.34.1
> >>
> >
> > --
> > With best wishes
> > Dmitry
>

