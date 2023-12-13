Return-Path: <linux-arm-msm+bounces-4620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FD6812131
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 23:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D4A3282284
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 22:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 177D37FBC8;
	Wed, 13 Dec 2023 22:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lx7cLn9N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18CD8AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 14:06:59 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-5c85e8fdd2dso72978077b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 14:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702505218; x=1703110018; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IiZLeydFv0dQoVsgTLSTJeU50o5YR4HggKIDBADvvDw=;
        b=lx7cLn9NdZt9/bqftOe4XWKSKIHu7IpyaeHvgAJ3gDzGuViTRgwVdycjSw2HtSVIj+
         ygOR15I45/tubqZmdKN0C26uPQZ/pb03iDVMN5X9Y1xsQpCZIPVY++zmQXlmnvRYbUE8
         uI8CztcZcSKSkUMTuBhmsVYQpjKjlDJfIdW5Lmlx24t8f6NAOOPWs58miXMF4YGnE8Gs
         L3+upSEGq0sYQ0dQ8bTTQN65lS2FdbBhvGbe3d1ACFC+uxkUsYBnfUOLxU8kn5dfkodg
         bWOuLVrj+gFbi8jdjMukaKmlWYsMUDJkwBmA+gmKv7zOQrkXUV5ujqT2qiIlrof3ZNOD
         kHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702505218; x=1703110018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiZLeydFv0dQoVsgTLSTJeU50o5YR4HggKIDBADvvDw=;
        b=mk6dl9qoTqn5QQVJsF8ZQDRpCvpIVHCaSMhxmJcyMaN5YyJ2jElJmZSoif0NTj4lya
         TyUwte8Avk6JXGKRhxp3PZhj04bS47m06NG7/5pd+fBIZ5+E1sPTiqiZ4kt5DGk4ofPs
         SCnw6cpHetSW0UIhPl7EQ9l+UuO5eb5DpO2TE0DAO2mcOKRMwEWPURRSIY86ujPGQ8dC
         EHzWmUXYt7c4a8FbW64MLHPzqMqpt7og0bf/AdYA2GTA/gxqrThB+OJWszSUpkd+SPOa
         +345n5bFZePJXsDAcAfiZhkaakF1l0cFA6N76lrLXVSJ5sWhECnowYgcZdP0E4TuPgg5
         KPiA==
X-Gm-Message-State: AOJu0Yx9DnNaQjlSqU7aLocQUSZhW8a8Mv16bSMVVeHv6YgdCwZ3+cSJ
	LDAFCKyjWA6XsaAt+JSnu1qPMwtahFCgCPe3F3lkHQ==
X-Google-Smtp-Source: AGHT+IEr68TyT/QvLeseprICEqjDcN/rRoj0lk5BxuC5payzc9s1YVNN9YYwQvjCujY3WsP7jPO/aXoRaDtxmbQXGKo=
X-Received: by 2002:a81:5ec2:0:b0:5d3:977b:d632 with SMTP id
 s185-20020a815ec2000000b005d3977bd632mr8471435ywb.6.1702505218315; Wed, 13
 Dec 2023 14:06:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231213-encoder-fixup-v4-0-6da6cd1bf118@quicinc.com> <20231213-encoder-fixup-v4-2-6da6cd1bf118@quicinc.com>
In-Reply-To: <20231213-encoder-fixup-v4-2-6da6cd1bf118@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 00:06:47 +0200
Message-ID: <CAA8EJprcH22ouehetL4uNwUuroRUc9q6swGZo1GjuGuCRZDv=A@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] drm/msm/dpu: Drop enable and frame_count
 parameters from dpu_hw_setup_misr()
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 Dec 2023 at 23:30, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>
> Drop the enable and frame_count parameters from dpu_hw_setup_misr() as they
> are always set to the same values.
>
> In addition, replace MISR_FRAME_COUNT_MASK with MISR_FRAME_COUNT as
> frame_count is always set to the same value.
>
> Fixes: 7b37523fb1d1 ("drm/msm/dpu: Move MISR methods to dpu_hw_util")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  6 +++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 19 +++++--------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  9 +++------
>  8 files changed, 22 insertions(+), 33 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

