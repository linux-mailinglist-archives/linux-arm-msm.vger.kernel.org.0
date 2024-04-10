Return-Path: <linux-arm-msm+bounces-17050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2EB89F3DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 15:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 955AB28E011
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 13:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A64215EFAA;
	Wed, 10 Apr 2024 13:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="og5GYbOI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1778115CD7C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 13:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712755075; cv=none; b=byF0cMRHmlRS7f9F433RVJmVJ9AfFSPYgpWjY0aFJZKDUchwjJZq5qMgFU7Ui+WfaaSjkbfknn3NOKgaf25EvT2RauQ+bfAvyy0XgEDiVTb+QnGmrE/ttBipsSgrRQJiwn9R8pPxMp7qKEqY52ybpDO+gmB6Dun/9IQxtQZduxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712755075; c=relaxed/simple;
	bh=1QDD3y3qM7HlBKSXJCRxQMLwFvl5giujRZkYMfTxqO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HTkta+HOskSme0lQ99Wr/EEunaO60GOT5MfZpfg7w2UovkQc7Jfp1PsmuN8p97R5S8T455/6pdMoxD9VF3TDsID16qgBZExWD349FxqN3g3FxisGalBd/+AbmvdAhCbu2pOJKmdTniC+iJ5mqB1JjemyASsbXCgeBIHyNZox5ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=og5GYbOI; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-618509f818eso3412917b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 06:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712755071; x=1713359871; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aaut2pBnJQwsZ84leifBiD3Jd/zh/CW3q55Aw0Cq/FM=;
        b=og5GYbOIbXh6aNiBj5nSUonq+00pedMYqiVKpfMvDDvTrVykmaRZScxNh+AsiC+QWm
         +u62HkSXBJG2GzRzBpp3dYbHrpFM85KjbLJrzJOqjYMrheZAyzLqk2KAJGrx5x/EChoO
         ZAsfvIT82I2fushCahd+yAJ5LAjbdlK0uXnZ29k+h8HJ3xChwQgf2SSf0ViVqt6U7byL
         IqsltI2O7/kmykWsuZ6W2xY1a/tzjGrUXmvVzYUn/Vo4iIPcdADk7bZWW52ldzpIddk8
         5bG5Z4OUm2hxFs1aiU3RzCS76pJR/xHVmSgOa1sAFxwNPQYDEWP/PkTzx1c34Y1h9JE2
         fsQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755071; x=1713359871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaut2pBnJQwsZ84leifBiD3Jd/zh/CW3q55Aw0Cq/FM=;
        b=ZxVnFt61FCxNOHirTVK2U59C1MlaSO1O3n1bHLD8o60DFE8FNNonbmt0dVEZm0Agtt
         cqnWz9TvS57z5/zr4zlZ6B47da2X4Ahx/hMmoVD6MzHQhHESPYQeNtAutNdV0sq9HLk0
         VEAU64xIx9XmjBkEAGJj4IwpN8Anl1jqifxkYwYB+QPWpcAgtW8L5d2IqJ2SWeZA1TOx
         BAfu6g4eYdbXYlbilnyUxMudXcYCy87Ot31PCClczt58zJJdnqZceFHmLIWU6vr3CAPJ
         IsxWcTqbRTG8uztU+kU5BOK6Sfv3xr00xV6Fijv0TUWvDbXep6STRNDeaGb8MmFZuNTv
         FI+A==
X-Forwarded-Encrypted: i=1; AJvYcCXkauPMPOaH7NCKLvfJsoS8oCrrMLZcfSyW8YkPozvWwfFHu5mN2n4qa24kXjpDay/q7T6951c9euswBOySE4CDRI3lZ5jEoZTucaMXFA==
X-Gm-Message-State: AOJu0YxTOtJfBo8WB6ooEe4qqiamhkWy0qnGHK8uKnir/LF7B9SFGTY/
	r9P+Pbf+6LbYXSwLAJGa0VloeabukY8WXcMeadlseNtJIpxJvwExzvX4swJiUGOdHuD9HqbWusc
	DNWK7X7qjmOe2aEtY//gVTaiB6fGi2aMuz1w9og==
X-Google-Smtp-Source: AGHT+IFmS5w8AhK8kbcytc2bVAvW9AcSbo4jeQurDEFNC0cSxmV8ZNFN2AK5/kDoM6WitX7Tu3IUL/kE2njb2JKBLgs=
X-Received: by 2002:a25:8b08:0:b0:dcc:623e:1b5d with SMTP id
 i8-20020a258b08000000b00dcc623e1b5dmr1525941ybl.31.1712755070932; Wed, 10 Apr
 2024 06:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240408085523.12231-1-amishin@t-argos.ru> <CAA8EJppTM4tpsFaZKupPe=0Oc9qDp7dBqHyHGP4E5bTHKT=hSw@mail.gmail.com>
 <2b06e6b2-6fa0-48fa-800b-7aad6735daa6@t-argos.ru>
In-Reply-To: <2b06e6b2-6fa0-48fa-800b-7aad6735daa6@t-argos.ru>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 10 Apr 2024 16:17:39 +0300
Message-ID: <CAA8EJpq2=wFEY6GnKBHqnXPdrMs-g-iNuT=DaJddKbFCyBb=Sg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Add callback function pointer check before
 its call
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Apr 2024 at 14:53, Aleksandr Mishin <amishin@t-argos.ru> wrote:
> On 08.04.2024 12:03, Dmitry Baryshkov wrote:
> > On Mon, 8 Apr 2024 at 11:57, Aleksandr Mishin <amishin@t-argos.ru> wrote:
> >>
> >> In dpu_core_irq_callback_handler() callback function pointer is compared to NULL,
> >> but then callback function is unconditionally called by this pointer.
> >> Fix this bug by adding conditional return.
> >>
> >> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> >
> > This should be converted to a proper Reported-by: trailer.
> >
>
> It is an established practice for our project, you can find 700+ applied
> patches with similar line:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=grep&q=linuxtesting.org

Is there any reason why your project doesn't follow established
guidelines? Compare this to other robots.

Anyway:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> >>
> >> Fixes: c929ac60b3ed ("drm/msm/dpu: allow just single IRQ callback")
> >> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> >> ---
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 +++-
> >>   1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> >> index 946dd0135dff..03a16fbd4c99 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> >> @@ -223,9 +223,11 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, unsigned int
> >>
> >>          VERB("IRQ=[%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> >>
> >> -       if (!irq_entry->cb)
> >> +       if (!irq_entry->cb) {
> >>                  DRM_ERROR("no registered cb, IRQ=[%d, %d]\n",
> >>                            DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> >> +               return;
> >> +       }
> >>
> >>          atomic_inc(&irq_entry->count);
> >>
> >> --
> >> 2.30.2
> >>
> >>
> >
> >
>
> --
> Kind regards
> Aleksandr



-- 
With best wishes
Dmitry

