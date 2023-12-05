Return-Path: <linux-arm-msm+bounces-3377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3FD804309
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 01:02:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FEDC1F21320
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 00:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A3617D4;
	Tue,  5 Dec 2023 00:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JXutLiZz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3178A111
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 16:02:19 -0800 (PST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5d3644ca426so48597257b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 16:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701734538; x=1702339338; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3xI9L7eTJe/QWXc9juI1mud1Z9AYoG2UULweun2XvpI=;
        b=JXutLiZzGpJHZ3F8qBXVq0h7XLc5RCnTZok+LTJ8Rh/xDLqyjMbKfp48XXsVryah8V
         dt8rFYCgB2Q9foVt1Xu+ERzwcFHOlnkWBJn3MMcch5xueWufQtuXOpI1XAWQwAhiS8LF
         Sqv3iJNOXX8AyZrAzoAbesEKlsiNQrhQr6En6oSajh5dtvThWMF8MhCi0BHNAVO7YdTs
         xcn57hbLgR7n5a46Cfd0CtOWsRtrNV7T3ossEjCl/TEaSN9J+rUNu6Gg9GlppL/NkWx5
         n9J8zMxkOy6R0BDCbDTPJZQcgbPybkUTQg3shMmHrjH8rQ9MxHFAAjqJU3oVEMZZN7r2
         438g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701734538; x=1702339338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xI9L7eTJe/QWXc9juI1mud1Z9AYoG2UULweun2XvpI=;
        b=ShGGFq1sHx9pjYclB+TBRXRG0YZMl15lE3+woPekM5BN+5Z6DWRZYeXxN76uYuV2eu
         tbTT1tq2UeuQ51nZMwmAmmmiGCBYvxZ3AVKuxdhlJAh4VNJoaDpOecipsA4Q4RRnOVgG
         qI67it9t2Oa4HcN2FjkXGbiQ47Upp7B2yHqNWCoKpuL3VcLtnqYTyoiU+DoY9NBi0poZ
         xYfKWuDeIGyHiAThZixoexlEbNCnEVqliVV+toQ6VxBWEofXHZvDwvOS24YEjYqGWdLN
         k0+UIbmxvAoXF6cU6b1dreAfp78TUmC2LYtJwA+ik7mAwmJ4TJjJb7o/LxBHti9/aa8i
         M/yg==
X-Gm-Message-State: AOJu0Yw5QWprlXOoISDgaGGyw8DhgS9RFthKcX22rfNvdH5fjBHEDLD3
	eqqhbMDufoxqgV0RN2uOlMjLZ+s8MmBHhBYIsXHHbg==
X-Google-Smtp-Source: AGHT+IEOxPFF2KkSzJwDCbpCS7ZMeUuG+qV9rs6KCCZ8WFQySImhbc9P6KBg4Cq+5fa2Ay84+VlcJgXdf0LG8qDHprE=
X-Received: by 2002:a81:4328:0:b0:5d7:1941:355c with SMTP id
 q40-20020a814328000000b005d71941355cmr3549292ywa.67.1701734538332; Mon, 04
 Dec 2023 16:02:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
 <20231203115315.1306124-4-dmitry.baryshkov@linaro.org> <8b556eac-a874-a3cb-60bb-33e5142afdc7@quicinc.com>
In-Reply-To: <8b556eac-a874-a3cb-60bb-33e5142afdc7@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 5 Dec 2023 02:02:07 +0200
Message-ID: <CAA8EJpp3NS605Sv65KH4WD_44sn8KG52depnAYDRjg2nT0NChQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 3/3] drm/msm/dpu: move encoder status to
 standard encoder debugfs dir
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Dec 2023 at 01:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/3/2023 3:53 AM, Dmitry Baryshkov wrote:
> > Now as we have standard per-encoder debugfs directory, move DPU encoder
> > status file to that directory.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 +++------------------
> >   1 file changed, 6 insertions(+), 39 deletions(-)
> >
>
> For this change,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> Looking more closely at other drivers, most of them (atleast what I
> checked) were doing the same functionality in drm_encoder's
> late_register / early_unregister as DPU.
>
> This can be a wider cleanup across the tree if needed or we can stop here.

Yes, that's why I thought that this is a good idea. I think I'll let
other driver maintainers rework their drivers.

-- 
With best wishes
Dmitry

