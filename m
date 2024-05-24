Return-Path: <linux-arm-msm+bounces-20427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1028CEAD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 22:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C380E1F22050
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 20:25:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76C55336D;
	Fri, 24 May 2024 20:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UiDLK/AI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1807174420
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 20:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716582298; cv=none; b=ofbLeRaGFp1zmuZGjYxQV0F2pq1AwzBB3N87WtwECj1mBIL/Qfm5+3ucbPlXaN51iSKzkN1avngYgFRrl8iPXn/97sXT/LOyEYIqSZk5DsB5MW+4ekI+InmedSLeU9EjvePcimFrJsNd6+SKUzUczVrMubWpOH2epARGFueZ+8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716582298; c=relaxed/simple;
	bh=bOT4qVF1SJEWv6FUprt7enkoG7QA/jivzUHHvH7p3x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eEhK9Iir1JFtgATvYbpe35lACOFWYszYZVIKYiJD748mUVGDFf1DOAUUTYYy2UtyeYRyOugdakG0KdjInyIW1JWaQC1ItJiqsNkgweH4+efdJ9XSb04kJ5oGh92WWVz57brq1PXTcpH9WgM1dcqJBpByqYqGBGGxRteGS4MHiwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UiDLK/AI; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e6f51f9de4so108090471fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2024 13:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716582295; x=1717187095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LNe1VPOg2pnJsgOYog+ugBuIIMZ34HnriJcb78FTPH4=;
        b=UiDLK/AIjSqHhYFlDYOnFKNBkXaXWZnXP0VprLwg/PiFckDomM07nauHFSJYFXYahn
         A+Vv4Ph4+TRDiGEZuqqU9cvLMiqmAqBbksKjPO3PLP3YiGtBPa5LElXmC/Kq/TwDZEVE
         YwT5mpnCEiBr6zxGs8GZInb953Il4EBKx+rHVTKh1CETSXu9v/d4of0XA/mrG/UdH7hf
         ADqT4Agjn3y1RiGmUTuvjZ+f/LjXl8xSkfXS1v1wwzW42dHOP0abeCvOVVG5lP5qLOwP
         2e6xQ3SMrtNLNSmckTWcuYg5eK7Ys6yNu1MgU6QPr6RfUZteO1uUJQh/7IN7/7fVP4uc
         fY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716582295; x=1717187095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNe1VPOg2pnJsgOYog+ugBuIIMZ34HnriJcb78FTPH4=;
        b=F5gdFrDWaDd5cJsdf8V+YCF5Iz9Wfm8t+vrdhqlihGG1EBr2o9bAO6LIGcKPPssHww
         GKzbhCLuCLRb/Mz8wKfKiB8Gn0PHm3Jc4WRkgHvAipAmI/ymTMuqiteY/tNLfgNvXokh
         BglnmO6FluR4F/6gUi+VRZSuNjKb90Gxhk790hEhxOshB9yG3ZhU/Fv51MT/CTmeGGiR
         YFaFygkX06B8425V7frvOXt6YkcdQuCia39HU+BerfkJIknDerNYvum+VTewQhDC0zGa
         k8Gut9QecFmhS9jaso32InHD5i65HUwPeOUzYppoYv/Qz3/6OZ+yu9h0ZgHpRXUwLint
         43LA==
X-Forwarded-Encrypted: i=1; AJvYcCXuGzbwJzK6lhRa+sWIO7zksVI0JF8Hx+tOuXWijLT33nPDPSSszlU7X99GrIZ0CoT5a1EjIs3OY2xUi0UIlr/7ZRo4HFbvtrUyVIXOaw==
X-Gm-Message-State: AOJu0Yx9ReyBlb2+AKDEtI+b/VdjmWHe3QA5QXckNWLyRUnwgbmmFT/A
	fFd7VtwyiPdcYWgBdUzbdCMAZzwKHYzKPIkwGucK4CtkEX/Kw7it5SPjE6jClPM=
X-Google-Smtp-Source: AGHT+IFK/UOYNobb+19kRiunV46R/7UuZjv6dAHZA5c3clRnKdAoy+V1nARP9j6yvSU+9aLn9b3byg==
X-Received: by 2002:ac2:5386:0:b0:51f:488d:274b with SMTP id 2adb3069b0e04-5296529058dmr2700640e87.9.1716582295186;
        Fri, 24 May 2024 13:24:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296e87ea0esm239354e87.1.2024.05.24.13.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 13:24:54 -0700 (PDT)
Date: Fri, 24 May 2024 23:24:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Junhao Xie <bigfoot@classfun.cn>, Rob Clark <robdclark@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Ryan McCann <quic_rmccann@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jonathan Marek <jonathan@marek.ca>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: drop duplicate drm formats from wb2_formats
 arrays
Message-ID: <h7ezuquewatnuyuzkzcpw7wbx4jbpfmxzjvshvyjjy65kz6vsz@bmiqpykq46v5>
References: <20240524150128.1878297-2-bigfoot@classfun.cn>
 <5db69319-4d61-7637-8bde-5d786e5faea4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5db69319-4d61-7637-8bde-5d786e5faea4@quicinc.com>

On Fri, May 24, 2024 at 11:19:41AM -0700, Abhinav Kumar wrote:
> 
> 
> On 5/24/2024 8:01 AM, Junhao Xie wrote:
> > There are duplicate items in wb2_formats_rgb and wb2_formats_rgb_yuv,
> > which cause weston assertions failed.
> > 
> > weston: libweston/drm-formats.c:131: weston_drm_format_array_add_format:
> > Assertion `!weston_drm_format_array_find_format(formats, format)' failed.
> > 
> > Signed-off-by: Junhao Xie <bigfoot@classfun.cn>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 ------
> >   1 file changed, 6 deletions(-)
> > 
> 
> I think we need two fixes tag here, one for the RGB array and the other one
> for the RGB+YUV array.
> 
> Fixes: 8c16b988ba2d ("drm/msm/dpu: introduce separate wb2_format arrays for
> rgb and yuv")
> 
> Fixes: 53324b99bd7b ("drm/msm/dpu: add writeback blocks to the sm8250 DPU
> catalog")
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> (pls ignore the line breaks in the fixes line, I will fix it while applying)

With the Fixes tags in place:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

