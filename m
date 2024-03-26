Return-Path: <linux-arm-msm+bounces-15243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5655788CAFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 18:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5BD3B22392
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 17:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E4DD1CF8B;
	Tue, 26 Mar 2024 17:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pJd69fCR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B651F94C
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 17:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711474417; cv=none; b=QZxpsVIDXICesfhGPhKdWYtXWfmj1GpJyGTzksa7OBEJQWmridzorpn2OGtY2uSuJCDgBVc5dOV/iVReWD9EbiA+gBHI4/qjpwhAz/FVrpIYjE1mH08zTl2meln4JPRXW0G7mpzfMRkvqrIlOV7z1YfoJVGmVqffJyonzQB4RDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711474417; c=relaxed/simple;
	bh=toPGKCLdvyO+G6kSM1fO3+IGKMtdUEo5PJHkjmfdbho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hXnDXqYen1Uriezt/nFU1cxuog83+tZ/4zN4d26CdSEqCKjfoMtYsnvTagf68cGAMNQzrNPEZSL6gmgaZg7GJuLHyAoIy5FCJ+ww6JeqYJeJAIm3QXVEeMTwJ7xhcatitjqXddXZR14fPjskY1tdj5UFJjd6CcDVx1KdTC/4WvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pJd69fCR; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-60a434ea806so64129877b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 10:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711474415; x=1712079215; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XbZMB0HLDo6UlcT3wdFgHAD3bu+yuJSpDvNYyyVm5Bo=;
        b=pJd69fCRlgx566PAz5+ArreEhN9HOwXbqVZyxqp0t0GzzW0Xm+RJjQLlDhJ0YWhFpf
         MNFu5JHjVugIHqGdqGMLUFB/ckMnrmzEpzSwbbAJTRa9AAjX3vBN/KNGfAfDF/EOIsou
         kkfQHlyHFwVfrnKD2gGniASHKAsEgBAXKwxr6gzhn+1YN0qVYnKR8di83+xr6BHSU8/F
         iXMkjTi/Bmfv+8fpkpx9pF1qDglP3J8QgbZgNZOTP3UXQ0B+cq/Jt3ezRvlTA1rYiuGB
         v8fR/mTXIlGxSaw/LVtEt+8f9gfeAcEloi53k6k5KLUUxtmcDsspSgXCnfAoC1shLAbh
         cZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711474415; x=1712079215;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XbZMB0HLDo6UlcT3wdFgHAD3bu+yuJSpDvNYyyVm5Bo=;
        b=nVuvvRK2edjjW5RyO1RfJdtX5YOkRPFMYxuqcQYL9cDS/TYB1YRUJoHsBVNy6qMmxy
         anRLErWvK5wGu9KuQ65BIDs8SlUM6G1UMmxDqHXzYXwG+vsdHxMdrD0EpMnB15BhM8nB
         19XPcbdmoRLpRWE+6JI3C5zwz3sZXJC7FRB05tYecjr2ZXCLdfKuo6hJgtJFhXIlrwXB
         tBXtTDcO/WO/pQpw6bcAF22C78UM2JiQHyu7n3tFKXP11w/uiLVoogLG2dnqLpS9vn12
         63zeiCjgxDzA3ShFEZrHfsmSo1JEwlf4wsfb/Sv4pR1vEPnWDnAftdGDyaDIsvWkfss5
         BtvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+cgmGk/9zTyuj3dA57bGzrgVUudn3zTqP/EAcL9gj0e+udIv61X5LwdrIjV+mJnvow10arxlOfsIdWFO2JorrGxl6oY38HKnPFG5K/w==
X-Gm-Message-State: AOJu0Yx1YqgBtkgyw3T1mMucDGj+A+U+y0nepcn4m2oY94SlBU9aLk0J
	IWjpjCeZf1J+/A+nGMGNkfYhDXLObxsEWCbBMjKwiJoInRSXfQhiP43rrKWhQBvyrfbYCYscWYU
	ebe99H/khn5w2AflZR1ST0lM89/+H17zl5Gf2mQ==
X-Google-Smtp-Source: AGHT+IEMWwGPSGxVa+7DBZhN3tDl31SG+GYGcvvUKD2ClPTIyhd+KW7hJPpl34yQMv0yUTu8mGIcSU6SoV3jibi+RjM=
X-Received: by 2002:a81:5f55:0:b0:60a:5031:2de9 with SMTP id
 t82-20020a815f55000000b0060a50312de9mr1681149ywb.51.1711474414901; Tue, 26
 Mar 2024 10:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com> <20240326-msm-dp-cleanup-v1-5-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-5-e775556ecec0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Mar 2024 19:33:24 +0200
Message-ID: <CAA8EJpqxxuu+EK3W55EbhiZyGqnB6DGdH7jU5fP--bZpUHSx9A@mail.gmail.com>
Subject: Re: [PATCH 5/6] drm/msm/dp: Use function arguments for timing configuration
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 26 Mar 2024 at 17:06, Bjorn Andersson <andersson@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> dp_catalog_panel_timing_cfg() takes 4 arguments, which are passed from
> the calling function through members of struct dp_catalog.
>
> No state is maintained other than across this call, so switch to
> function arguments to clean up the code.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 14 ++++++--------
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  7 ++-----
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 14 +++++++++-----
>  3 files changed, 17 insertions(+), 18 deletions(-)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

