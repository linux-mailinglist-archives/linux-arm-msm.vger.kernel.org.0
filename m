Return-Path: <linux-arm-msm+bounces-73135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8434CB53350
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 15:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75BEA1CC0935
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91DD324B32;
	Thu, 11 Sep 2025 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cXyEsJH6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19404322C60
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757596257; cv=none; b=eZOIj5rWIt5t3sr+Dhh93lgxpQ/c1t4t709mZiXqBsZbJKQ2NikB1DVBVvUKRwI1Gh3GviD47I1wJCa7W8mK8EHMTH6wGc7eT1KOra8CXprtYfcuIGIrFC32F83NiI5VOzu4jqL+DSCpfTO1TAEY5cyteAa8nW8yb9luwdSFybE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757596257; c=relaxed/simple;
	bh=y11RZU91qqT+9OqY84wNPfLsXkcQjITVyypPfQ+m9DQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UI2amBE0KEDCAUqWK2BlWvW8AP5ok4Uv8Q/BdupdDJU3XZYDBN/vppx3mqikVZhAABrBFJsrlNLKphEBasQVcnoFvy1kHTEm8ml2ErG2EfbUDNf/LrBV/IB78udk0Mqlia1e+zoxra1uFQu3eVKcgjwU5PPXiRqhii0/R3cD8Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cXyEsJH6; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b046f6fb230so139015166b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757596253; x=1758201053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fICK12mWNRBHNb8epgyR7UU//hrM63BrRhLGMx3EInI=;
        b=cXyEsJH6eOo+DwJcAdCVR3iNKEDybDke2yNhMqHc/SYkvd5i17dTpI1QLiRO8ELn+I
         gRzniKjTHPXk6iIHDrSfOXVAzVRSIrfD5PsriMAgEQhu8rr/SzVW+AEQnOWSOit4aEhN
         CFAH+RJhC/BKA+evUapFmdi00piVXMrbolOO0wDCSrzrD44V77kmE2Nk0tXedFrqdNRZ
         bOghWiURj7cATmIGFVUfMk7Qe+yQH1f848nWlx0p+NFNv7GHuvaRHT5nbHBJi0RjGKNh
         ZHT3c9hpyIfDu9JOl+YCvAwenM8IQmAsl3Z/qqEih5hAPrrZXrupDuvY0/Q4rZHmdfk6
         NLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757596253; x=1758201053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fICK12mWNRBHNb8epgyR7UU//hrM63BrRhLGMx3EInI=;
        b=ViJTpqQHtZ7Tw4qEKsZmND0YwAYs8ou6VzQSPp8aWpo/PzehTasZ67SpxfTva6Nshu
         U4tedws6hRKv9W0AP49ug2w02FTWPonavJBNhgkiKG1dhY80U4onFDEy8acO7CJOQJmV
         5BYCVKsbpH097zj0hu3KtsaV10w/NfpdTeNjQLMhvKRjnik4U4+fhUoJUKmCIMIa64tA
         cTFQo/gpKg0/j2YXoAngrhY8Wyb1KCJYUOXsBWZ90F5rU78TeXCUw2uKAc4DFkzBshq9
         dn0gTUPCKHI/P3iv4GPaqiBhvEmKxT9KqqbeRODYIqex5lZ27Wm8CC+eiSuXCaXK+07n
         FfdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLHCSDj01DnOVm1yKUsUt3sJGg+youxtJbToOj1DuSl4VXUVlD4hY1VMQYSZJfHqXBJWcYfNn6a0enZP1A@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2iJ4daVTGjH0TKVHn4FPh8IkgBTdVT+3hHyEPmMLnD4XNp/00
	cJGfS/hGQyQLeFn7avr1rJh5UXI/iOnx7zzDmaLVi2Xr9VWx3mAZFQ0Qb6oSVEwvFe8=
X-Gm-Gg: ASbGncvor8YCRLKymYz0V6frQF+KRucFJmOBNV9vILeZnnpNFnC5mglYbKzHl+CLdKG
	DkPdW28AXfn6xGHuWJg7q1rMkQRz05B2QXT4doweC1yAWknQakJvYtm7vqclj8/IhxsyB/HULSK
	wQuRt+xLrLb4LRRaS3Q7gr0++R207V3Rh+YTpuYF00EYf3qeA8O3BWQq2MjErguR1S2FgPEpYL2
	T/wDYguxiN5YPWZGmS+F/bLtrKj1E+7n3cFEKy2DcPdUE0Ys/pOJVBboMWEp9pQfCICxlsiIkYQ
	l/EcmZ0SitPhggLFoQw3raMTZvndnCVOCbo1ES/gV1BWD4DqNO0iXfe2XADc54pvihFf8GQrCkp
	3e2dflEAosSY12lSNonXWVw==
X-Google-Smtp-Source: AGHT+IH66fznEUgFxllILMqdvheHS0RsLBD6Wse+F7QEzo8HkwTr8xnUsQ0CB7hpJuztOUV/n+dF7g==
X-Received: by 2002:a17:907:7205:b0:b04:3e43:eca2 with SMTP id a640c23a62f3a-b07a633d68emr423207366b.13.1757596252775;
        Thu, 11 Sep 2025 06:10:52 -0700 (PDT)
Received: from linaro.org ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b30da250sm132121066b.9.2025.09.11.06.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:10:52 -0700 (PDT)
Date: Thu, 11 Sep 2025 16:10:50 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] drm/msm: Add display support for Glymur platform
Message-ID: <kasmte3rxr3ukz2eqbwlzbpeam2qq2qimzdqta5dl5xsthnokc@smvts77lhirb>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <xjtg6emrb7svloz2fkaotfbj4m2wzmddxdsdnjk5wkbmocqzmd@l656suk46pkd>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xjtg6emrb7svloz2fkaotfbj4m2wzmddxdsdnjk5wkbmocqzmd@l656suk46pkd>

On 25-09-11 16:02:40, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 03:28:47PM +0300, Abel Vesa wrote:
> > The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> > version bump. Differences are mostly in the DPU IP blocks numbers and
> > their base offsets.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Abel Vesa (6):
> >       dt-bindings: display: msm: Document the Glymur Mobile Display SubSystem
> >       dt-bindings: display: msm: Document the Glymur Display Processing Unit
> >       dt-bindings: display: msm: Document the Glymur DiplayPort controller
> >       drm/msm/mdss: Add Glymur device configuration
> >       drm/msm/dpu: Add support for Glymur
> >       drm/msm/dp: Add support for Glymur
> > 
> 
> This will not work without the UBWC config for this paltform. Please
> include it into the next submission.

Ofcourse it won't work, but wouldn't the UBWC be merged though a different tree?
I thought I should send it separately because of that.

I'll add it to this patchset in the next version.

Thanks.

