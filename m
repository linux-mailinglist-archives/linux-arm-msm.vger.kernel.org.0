Return-Path: <linux-arm-msm+bounces-18014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 709808AB890
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 03:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FE941F21151
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Apr 2024 01:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C763A40;
	Sat, 20 Apr 2024 01:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BlnD4l2h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FB7A32
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Apr 2024 01:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713578200; cv=none; b=ra7x7agRPCN5kWtABSjsehsxUpZw24BJD+1TgTWbl59ztrVXsRZuqHid0L468ry3SF/f0UcR++vosMzQ9He0GDG/CPpeKq0YVKGI7lQnCS01ef/jrQzVLZT+jZIfO7O5te5jJfSTMtq7dn145GeQzFQ5vWMtcpKxIn1JmEVNheQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713578200; c=relaxed/simple;
	bh=tiKWrPByuMV8zMZnv/US2q92x28Z9HJjZ9TZBMrQ0cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k/kn8rJWdH3tleBKU2CDfiq8xn7BeJm0C8wYnEkLueI6pw4g8bA7rJexoMHLeMHW2wa83KFfQNLUKA7xS2bFni2zUKsoMgGBHylaQliOITaanWR3b/GrKnYUV7YrGj05L9jYOVlIEA1LkuLOQ6Ixz71JRlYXzWZk6IukgqX9SNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BlnD4l2h; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516db2214e6so3484033e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 18:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713578197; x=1714182997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sndLC/Sigbquk9j+pRCsPCc5+gdDBnQ4XzPelw3qRPA=;
        b=BlnD4l2hyAP6SCNNS4+I+U8WZFWJ/h0xl0SNxXKw0e6n7VfbFf8oAEbbe9ZNgn17jG
         tkhsHF4WkIxPjFQ9qn6B5T1qS5vUDTDdM9qnwKlK3SyMFIKd3PlrOCBKz6+K+sBw299J
         6g+WnbXCXJWPzns+D+B15+HJM2r3ZdeAm0hMK2X5HujB8tQg1o8D5ZgewgxLYdf6SDhk
         wvBy60Cj6ycAIUfHVrCZQWuDMh9TaDOjWIENsRsB9QfPrNRb0A5it2m4hrpbEhfGSPjz
         2auTfrWPDTaDvPgbScZbJ8AqclnnAFqFf89vJ4kDcED4YUgFc2SWN8px70qO+Kxy6XEU
         vu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713578197; x=1714182997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sndLC/Sigbquk9j+pRCsPCc5+gdDBnQ4XzPelw3qRPA=;
        b=VOnUFBhQiDkJhEZtJgPr8FJl9Way0UQY9p8Wp/u452wAPIx6OwoOK0EcTWjOmD1/mc
         Vsz7RwmbxoBuHrWpr5VwZJDO6gveuoWxdiK56zdOjsa8RruW501zRWggXkxiIBAxCX/1
         vSSLBs/18LujrD3Mn3U27jJ54T2KsPOg6zQUJ37lcO8yS9/kmD5Y+oXJlt3GIyCzPve0
         bOlXcPfY26C2pOKI5FsA3caz39+CpqFS+DigwpPkMWf/7/BukNQ+YxYH6x5BUtQRTvKd
         sVOk2Iw3rCMjh4kREFPHs6wI2MDjHJQRPdUOTbTVZtTFug9iMF5PTHYgYMolxsXMjsX3
         uzOg==
X-Forwarded-Encrypted: i=1; AJvYcCUR+DhhF304vRiKxfAzWyDujFhEO3SzQGCVTaSiEq48VoDhYEQ9ZmwduGQQkHgYxO71tKCoOmyV+1xVIp8qqhiRobZDQ7Um2f+m+XQd/Q==
X-Gm-Message-State: AOJu0YxS3Tnl+MKj6j8rFFuCG39HI+28M02YXtPh4T5rRrAisRd5ospr
	cds/8jlJNeKAVP/YjxbRwtti1oFdwM6PtImSlzqzkhNkSoWEoLw+sDiNYIZSOx8=
X-Google-Smtp-Source: AGHT+IFlZmxspJ5s1nabisNjV/ZZTzXeDcowEwmiUMeJtNyoFgFtLKIE73ZiAOnm+X1BtLnMp2cPyg==
X-Received: by 2002:a19:ae10:0:b0:513:cf73:d8d2 with SMTP id f16-20020a19ae10000000b00513cf73d8d2mr2155905lfc.54.1713578196738;
        Fri, 19 Apr 2024 18:56:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
        by smtp.gmail.com with ESMTPSA id fb4-20020a056512124400b00516b069b27esm957979lfb.37.2024.04.19.18.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 18:56:36 -0700 (PDT)
Date: Sat, 20 Apr 2024 04:56:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 5/9] drm/msm/dpu: check for the plane pitch overflow
Message-ID: <z6q5jkvtrjsutxps66idrxs7qldvz5rt7az7fn5meum62pybst@fmn7rxpuho6m>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-5-d0fe6bf81bf1@linaro.org>
 <2d0e922f-8d68-aa5b-ebbf-b1bde3e9e2af@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d0e922f-8d68-aa5b-ebbf-b1bde3e9e2af@quicinc.com>

On Fri, Apr 19, 2024 at 05:16:30PM -0700, Abhinav Kumar wrote:
> 
> 
> On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> > Check that the plane pitch doesn't overflow the maximum pitch size
> > allowed by the hardware.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 6 +++++-
> >   2 files changed, 7 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > index b7dc52312c39..86b1defa5d21 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > @@ -12,6 +12,8 @@
> >   struct dpu_hw_sspp;
> > +#define DPU_SSPP_MAX_PITCH_SIZE		0xffff
> > +
> 
> You obtained this value from below code right?

Yes. And also from DPU_MAX_IMG_WIDTH / MAX_IMG_WIDTH.

> 
> 	if (pipe->multirect_index == DPU_SSPP_RECT_0) {
> 487 			ystride0 = (ystride0 & 0xFFFF0000) |
> 488 				(layout->plane_pitch[0] & 0x0000FFFF);
> 489 			ystride1 = (ystride1 & 0xFFFF0000)|
> 490 				(layout->plane_pitch[2] & 0x0000FFFF);
> 491 		} else {
> 492 			ystride0 = (ystride0 & 0x0000FFFF) |
> 493 				((layout->plane_pitch[0] << 16) &
> 494 				 0xFFFF0000);
> 495 			ystride1 = (ystride1 & 0x0000FFFF) |
> 496 				((layout->plane_pitch[2] << 16) &
> 497 				 0xFFFF0000);
> 498 		}
> 
> Seems correct, but was just curious
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry

