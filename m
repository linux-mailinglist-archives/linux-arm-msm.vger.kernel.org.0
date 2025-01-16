Return-Path: <linux-arm-msm+bounces-45219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3448BA13470
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 000EA18882C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C64819883C;
	Thu, 16 Jan 2025 07:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MSpqHp5k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737A319644B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737014124; cv=none; b=uyMpgIFjxWamMDAG7SeinUYtXi9rEC+y9XOmuE7u1iIxPWB8V5bE43RtAsoZop3779BMbaecVxO9mRy5kq+w1Micv9gEKl3DM4U7AeE3ChcHZkGA5y5/B0H0xnDWJmpCPzPPpM7ScwxxnMovSCJUXfqRKfhiSJwxCfReE2R36Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737014124; c=relaxed/simple;
	bh=SZ5My9NxczXx6hS4GbhraZTMcd2icwxVgRx2S/WTVTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5teh3u3ZUT46cZQy8CwrPUwgQZeugOsOXTswGD+zaQA22ZIj5L/xEfPevdy50M1mCb6/sF5QS/Svgx6DM/wxGkJ2U5nmKqaNLhY/O89sw8yPcIWZCjwFrgdDNxBYIAemC4sweg3rhn6tNi7/F3zEXr1Hp5b1nG59VckD/y8u+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MSpqHp5k; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30227ccf803so5819481fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737014121; x=1737618921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W9r2mShDaZUavqmU+EODFd4L0OlYF5VNWr4sQ3SuH3g=;
        b=MSpqHp5k+4Ihxq/r9cdVRXNVpdtKTC6Ww/9VEcaLkkFD0yNzHqJR3UBUMNzJJ5ZGtf
         nq+QJBLeq48+gFSS9iECDyBB7tJ+KgjLFm0hw3rtJizT8ojD5+E6dHSJk6svgCtgTlDX
         lV8Gk2cEIy9E88SOwJlKAzMX4pybJl9Io21voF6mInhbLNyuVjeD1kYwuUhTd7VM/cpN
         lmyEdcykuMFqvGbnHil6MosKT5KfZtfIbrQPKmVaeX63nuvFWkwKZ7rsoCj8rkJRhKwz
         kQ3MTM5cgiMGE4co96vV0zDP4+USsmVOBD1/7k20pG9seuKcBOt8udJWcQp8WmCui/hg
         9Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737014121; x=1737618921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W9r2mShDaZUavqmU+EODFd4L0OlYF5VNWr4sQ3SuH3g=;
        b=qqRp1sHKxi4aSa1l/ksS4lnzbnh3Of+DT+1IE/9s5ifXV4bKZmS8dr2zU0G/ivTakX
         XsWUeQ7uYV6HBZeuzNhlLPXOZHbH4nWJRHuo8498s4tB/l/1BcD34j5NxsWPEJ3eArlp
         2NjsoGe9gM+9KWFHWZ9k2kCspRVfSXbbHGbN2Jvc03UIDHXAjnl8Ddd0QX+/kJBLdUZu
         4pN7RMj0RtDF+fqO8B2z7FU+fECuF3Y2Ln7jG7ea9wSmKZBt4QX9akUPUtdr8up5eP3N
         qiVRaK9VbY1VUpzkFVVt3+s6LWbCt1sDoL3obB/yZqXmImq+qSvxUgTCBXnBJi0jWphi
         HPMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZGwoIUszzExdWgnvHsHmYPa1XllNz/onS7ebFyhS9NErEneXYVytJD7+MrjVHxICr1bCLxOFVNClcWZnl@vger.kernel.org
X-Gm-Message-State: AOJu0YzqffTzB/INW5+DdAOVSbsCJ4n3ZZngqUkeLpOQB7IoJfRCbWvn
	zrzxFBGDMJQh/cbr8QC9Ges41GdxUM1NbICXAqXp3rsgNdtbttnxoYdD+lUOpRQ=
X-Gm-Gg: ASbGncuYRYzwwLNT7dskIhqUSzQOF9aqF5oFe2tMN22KTviXLi3Le5IADM9lF0Ad+l+
	5kJ3LdcUVQ1cyAKcDl1MxNNEfQpWrx5KkM5kSoYk98E265zr8fsotCFBDQJugdGvwSbkqvDIYYc
	MuZy4u6pmYO55IpC2h6NuyIIezuafqcudmQbMlLZv8qFkNSj/r0fRQxCBF/pjVETHjcVTFjNm6/
	5szc0/KUdVVArRnm0Cm8nIm9ca/LtV9AZ+pvi8zVOVEoekqLKbmP/0xzhq4BO9VcX54JI6igQm5
	wtcoH4IwE0PC86QvaYRA4VxbcTNXVfXwCfKc
X-Google-Smtp-Source: AGHT+IHfj3JfIrhEc5djBNosWJ+fiBasPZMlyhcF4dJudhn38zLrNos988Dhlf2AaunAFR7XhZyUEA==
X-Received: by 2002:a2e:bea8:0:b0:302:1b18:2c09 with SMTP id 38308e7fff4ca-305f45ba080mr114128361fa.27.1737014120610;
        Wed, 15 Jan 2025 23:55:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0e712dsm24319121fa.51.2025.01.15.23.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:55:19 -0800 (PST)
Date: Thu, 16 Jan 2025 09:55:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 09/16] drm/msm/dpu: Add pipe as trace argument
Message-ID: <jnazuwxroizov6hysv7bhsjtqnzfrtqotjmjzar4lbhrdokf64@wzbfkkpcfch7>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-9-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-9-74749c6eba33@linaro.org>

On Thu, Jan 16, 2025 at 03:25:58PM +0800, Jun Nie wrote:
> Add pipe as trace argument in trace_dpu_crtc_setup_mixer() to ease
> converting pipe into pipe array later.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

