Return-Path: <linux-arm-msm+bounces-34632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 833AB9A1412
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 22:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 081BE1F21A13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 20:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582FC1D2B2C;
	Wed, 16 Oct 2024 20:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3j2IMfy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2947F9C1;
	Wed, 16 Oct 2024 20:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729110814; cv=none; b=B6lmogspxL04b/xc96TSRNkAMY37LH69PPZUvL1zuO4Qu59kHBGDZnWzh78C3S3VxgMSvMMsDLt5bSBT+D8DAPDw95WmuwcdmNs5tmDjDzHMqOJPLiOjNF45NEtvkA8+KBMmLye/jXh9niNuTWKcYxWrDZXu71uVQWPSXZs8//U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729110814; c=relaxed/simple;
	bh=pMvJHzGl0nMmJW+SfscBoegX8VUlTgbV5Pj8ggl5kEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jFIAHJEuqrLWqteOy1vgkOXELybXZP4mEWXPc6d6Tr+FkI59i8uqFPezxsRVCV0seq8UeqOnlgzTYHtbm+FLAbzG8wCr3VsgHD9aP6dUgistQldVy0/leGyjMHDl+2N8E2RMoWavvuo37t/7v1Vc31+fJLJ37MpP+UIEsOqtdYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3j2IMfy; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a3b450320aso1172845ab.3;
        Wed, 16 Oct 2024 13:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729110812; x=1729715612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wP6r2on2k3XrO8K/OQAeP7D2aIemt713ceP9vvL21IA=;
        b=j3j2IMfyJYRMG80vuz9DzVrp3fkq+JMQKAvjO8RpqDcWuTqe7c8xg0tVU/sy5eMeQe
         AN//uhfh44ahFUeEeI2LzdJ7L5HXM2R08K3cSOFmV6pT0MXlJMp+KFsCPAIk8z4+mf9u
         KuLCpqzzcZMYlz2FZWglsD/9v6SHeOPnJ+2eoKBoktcJHFubxYnkALwBDadaJ0y6/zvf
         sr+6Jtn5luFXoibwW59TrmxiW2jepKdlOcwAzsYJp21azWgVuq9JbvpxUQqiRvRN0x4C
         dU9J3VS6cjQOuYQ/e+oRTLYeM7CjNPFGGEq2EdyAAjf3rfbJ/7J8ncfYFmpEE/JykcEu
         FvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729110812; x=1729715612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wP6r2on2k3XrO8K/OQAeP7D2aIemt713ceP9vvL21IA=;
        b=G2MBCB3aHQWt74mpBDm2eyDt0uBRjZkPpSjbdeqEIUb9FNU0nPKAfasFE8rPsYLlII
         D0atpQFpKhKjph3d9z6Tt9pGwbBosgKu55y/p+WWWbrrCWy40KSNyJB+PN35U3LBev5X
         QGG9+7trrYwgjGUQibb0szYKI92JD/QtPEU4LHsmfy9SLcwpUleWlnfVP39BFCTe5Szw
         RmPbv5ncyBZ2OEOevcxyacp4dCnpNRnMhxX3gEgWA6YU35UPy8cffcKCTVmEnhpvn50Y
         6EWxe5qlMwPUnEriXx5+hJ3gDtpopg6nuHwxW4XAMOMG9IN71qvX/e9f42ozGgtNb9GK
         S9rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRXYoAwbGxhgjUraJ5fmr7xvQzYlCRtjIDNpNM3SR5DiCYLT0xBYpz1iHMlf1zBa8wcBw5RQsXXAF5UXAZ@vger.kernel.org, AJvYcCWnduEyyWDq1ANK3xrCXyouPaK+BoStCywaNx3mEDPfZjgKrvBt3tYqz8T7ocmPbjd1N/HRJh9StRCY@vger.kernel.org, AJvYcCXK8pGBFjIWXmkC19SL3DjnIC1uoLe4jAzmP88GUONyDA6tZDd9jbq8B9CX+550sy54DPMJBconEa+8T208@vger.kernel.org
X-Gm-Message-State: AOJu0YxL39CcTITfK3HQSsC5NGa/Cszl15iUWZ/dd/5uCstXj4Lx3mbc
	a5olmtE0BwhpmzErQpVMmgLVhHEVfILLULLnPya296t/0eD0rBDOqdkiw+LPyLrigLES0gUos/o
	pPsLoSIvyRckOP1R06FHdjf8OJYVsNQ==
X-Google-Smtp-Source: AGHT+IH3xCk9u44gOw9v8dKsI1AMSxBA8nW1s888n3tjRKc0mXRfRjyO5wN4OTPcGiZDDRx7udSNwtsTYIBC/FapsdE=
X-Received: by 2002:a05:6e02:1a66:b0:3a3:b1c4:8198 with SMTP id
 e9e14a558f8ab-3a3dc4f5fdemr55708805ab.20.1729110811783; Wed, 16 Oct 2024
 13:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241003-preemption-a750-t-v8-9-5c6cb9f256e0@gmail.com>
 <1b9afb20-d608-464c-ae6b-c535564b7e5a@ijzerbout.nl> <eb1a0381-05c3-4ef8-b6de-96824d587a7d@gmail.com>
In-Reply-To: <eb1a0381-05c3-4ef8-b6de-96824d587a7d@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 16 Oct 2024 13:33:19 -0700
Message-ID: <CAF6AEGu0b5EXjvjDn1DTy2zCSDp7yFpGvGoAb3Kc91Y9HK+=pg@mail.gmail.com>
Subject: Re: [v8,09/12] drm/msm/a6xx: Add traces for preemption
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Kees Bakker <kees@ijzerbout.nl>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Akhil P Oommen <quic_akhilpo@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 5:13=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> On 10/8/24 11:10 PM, Kees Bakker wrote:
> > Op 03-10-2024 om 18:12 schreef Antonino Maniscalco:
> >> Add trace points corresponding to preemption being triggered and being
> >> completed for latency measurement purposes.
> >>
> >> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> Tested-by: Rob Clark <robdclark@gmail.com>
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> >> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
> >> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> >> ---
> >>   drivers/gpu/drm/msm/adreno/a6xx_preempt.c |  6 ++++++
> >>   drivers/gpu/drm/msm/msm_gpu_trace.h       | 28 +++++++++++++++++++++
> >> +++++++
> >>   2 files changed, 34 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/
> >> drm/msm/adreno/a6xx_preempt.c
> >> index
> >> 21e333cb6342d33425eb96f97bcc853e9b041b36..6803d5af60cc8fb0f2a52ee160ff=
dbf0e8ef0209 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
> >> @@ -7,6 +7,7 @@
> >>   #include "a6xx_gpu.h"
> >>   #include "a6xx_gmu.xml.h"
> >>   #include "msm_mmu.h"
> >> +#include "msm_gpu_trace.h"
> >>   /*
> >>    * Try to transition the preemption state from old to new. Return
> >> @@ -174,6 +175,8 @@ void a6xx_preempt_irq(struct msm_gpu *gpu)
> >>       set_preempt_state(a6xx_gpu, PREEMPT_NONE);
> >> +    trace_msm_gpu_preemption_irq(a6xx_gpu->cur_ring->id);
> >> +
> >>       /*
> >>        * Retrigger preemption to avoid a deadlock that might occur
> >> when preemption
> >>        * is skipped due to it being already in flight when requested.
> >> @@ -294,6 +297,9 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
> >>        */
> >>       ring->restore_wptr =3D false;
> >> +    trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
> >> +        ring ? ring->id : -1);
> >> +
> > There is no need for the ternary operator. "ring" should be non-NULL,
> > otherwise the code would have already crashed.
> > So the change can just be
> >      trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id, ring->id)=
;
>
> You are right, we had a similar cleanup but I missed this particular
> one, thanks for pointing me at it! I apologize for the late response but
> I've been at XDC and therefore unable to look at my email. I will point
> this out to Rob since this series is in msm-next to see if I need to
> send a separate patch to clean this.

Yes, please send a new commit, I don't want to re-write history on msm-next

BR,
-R

> Best regards,
> --
> Antonino Maniscalco <antomani103@gmail.com>

