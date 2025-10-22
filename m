Return-Path: <linux-arm-msm+bounces-78312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D29F7BFB79D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 12:53:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 60E47545636
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 10:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4DA5326D55;
	Wed, 22 Oct 2025 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z3A5pfvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C098350A0F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 10:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761130318; cv=none; b=eUgnyLtD1x4xw2QJpYFY/ABQ0je347SajTwrUTM9z/a/mHncfNbOT5SmgyYHg3DxUwtvIV0kNRjBFdrdOllImhmbwc5CBhYvLjmJedBrZDlXsjIriGlJLU4ezBTreT0vIvVmsFuAHMvgS1x6xazG9MQM6zUQWuQIhQcEvBder6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761130318; c=relaxed/simple;
	bh=0emIbIHta2KZrdaQPWJL6o23SZSpJgnhglkKqaRrkZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKlDcuj7UiT+RXs7gX6POfxA6I97SbKMSLg5kxOO++UqpjLxQ+j3jAxfVyJ7OCt//QN+HBMWpIars3wUSnHzokY9Q1ZsyAEmW0hW3fcJBNZYgxurDJ6GwRsnnYVoSsjqN4p7gNz9SSnIqRrtqWMDm18oZLqMPVR+4jLE6S8+V6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z3A5pfvH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47117f92e32so44801355e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 03:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761130314; x=1761735114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wj0NZFWJVRGALI2+fvxHBDNu33Sev5bvshrkRXRWHmY=;
        b=z3A5pfvHkk8n7wHYf6hZGe3uhD2CtjlY/40Zt9gH8422sKNt3c00rULicZ7Ay7QEXW
         q+iQKrDqYlPbLnVEpk6cuW9idbQ4AoWC/f/r6BvtRgFpwpuIodK8+LXuDJ8Az6ukeCJO
         U9z5AL8qT0ukpV+0GVkHtgkJkzvFfq3pX4kF1yd+8mo8KhAl3ruXfm241uKyEqMR1H6F
         sNuv4JUhwOvyBGcmJhBi8Re77yMLsiCxOUoGJUPrveKm/aBNwJaeUIsJDyZvdtzfaEKK
         dSm4sBG9HNn4ofHVlk6cmnX+woZTHuqgS6Z/w3mPsw0tQGX2eakfdIfe5o7sJ6xkpRiw
         tMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761130314; x=1761735114;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wj0NZFWJVRGALI2+fvxHBDNu33Sev5bvshrkRXRWHmY=;
        b=oAob9dLCSgHOwELFYxb4g3Pm89Fblg/wzh+UNXOKWoTnJC8MzDg07YznVQ17z0IVV0
         q7pOHvDaQvMluJRK65LhlRqGyGwwSxQpZZ8+RQc8roVhpDytgK7m4dAtn5qEsXGE4+7L
         G9jV9rnD0oPGNYpFVPEd2ApCecYCWcPJMNqpnU20+Rv9sfswvyl9+SDyBWYzk7KOZ/dX
         GgjgRf36RBivOZEZsCcda0yciDouCYk5zD7HG6GnndBP1RYTEA+5JeptP/R8G6EpNTHZ
         PP6OGjJh546x73dLMeO1Bf9YSUnGpNiz+IjhEXKEBCFsJGP1w18Ngb2ZkP+qo2g7nD2a
         +CSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Ileft6vbv9gaOsw/fMZ5cy9Pay18lNFBDvNo5JZPHXkZbhDusmwh6ym+f0GC8SJXc0XDntZC/0dHs621@vger.kernel.org
X-Gm-Message-State: AOJu0YxzUhVIoADcW/ws1SGOcKwUhx6+B1i/EfoPIZMO54pfus9HHaom
	UpFBRC88MDAZ8WLEjLQCXSqW8CDEnZ8eo/WNeXZ9mWOP+8d552UmDWFqBlxkTI/NkTA=
X-Gm-Gg: ASbGncslFfU2Wk+cPH1GI5P/AZPaTfYw2dLDkC5sfEJY712YA3TfJhgzIVvVBsJl6l9
	T6//+8PaOrM8CJ3mJUo0eafDGpfwCnIHbxcvFJG9JJcbxz+VxuCMPgcEa9aXmA7wR1alFrGQ5Rm
	/rRHW43Gd9lG1d1sxDp6OJkhv1y0hqssoWWrcUgzzyoEhnHsf5kbJyMBZY/Y6DlIxBSfLvWArcR
	3ScxI2cu2zJaOnwaan8ftpJCzfLTCOKjHa/j/TwhPJy7WnzOZvTKCA4CrivVkoJADVea1rtqvQx
	Yw6almuBfOfllAWxBiMC//JmhaccYF+CLPBVc+9STe2TFbpRFQMzEkOwctMGZ/btQcWOGA5hhg5
	8O1fAP9tObu+Phvn/i225XTUMsa2hA8acNt80XAnvt0NnDdPjaZvoTHTD7xxw0yD8ubAuN5MK
X-Google-Smtp-Source: AGHT+IFqoTQ2HPqFhE+xoTH5Tzl+i0vK7I5FUuawS0A8siSroPNadoWtujMORQ1HXcf2sw7QAqJLcA==
X-Received: by 2002:a05:600c:548a:b0:46f:b42e:edce with SMTP id 5b1f17b1804b1-47117925db7mr136759365e9.39.1761130313599;
        Wed, 22 Oct 2025 03:51:53 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c4342373sm43403635e9.12.2025.10.22.03.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 03:51:52 -0700 (PDT)
Date: Wed, 22 Oct 2025 13:51:50 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/7] drm/msm: Add display support for Glymur platform
Message-ID: <d6ivp57mh77gxybjvvwpmqoc5fsy52yydtvs23bepwdxgkxhzj@ahryeick6yaw>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251020-astonishing-zebra-of-respect-1c2eca@kuoka>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-astonishing-zebra-of-respect-1c2eca@kuoka>

On 25-10-20 12:40:24, Krzysztof Kozlowski wrote:
> On Tue, Oct 14, 2025 at 03:38:25PM +0300, Abel Vesa wrote:
> > The Glymur MDSS is based on the one found in SM8750, with 2 minor number
> > version bump. Differences are mostly in the DPU IP blocks numbers.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> > Changes in v2:
> >  - Picked-up Krzysztof's and Dmitry's R-b tags.
> >  - Fixed the bindings check reported by Rob.
> >  - Fixed indentation reported by Krzysztof.
> >  - Re-worded the commits to better explain the incompatibility
> >    with previous platforms.
> >  - Add the UBWC config patch, as suggested by Dmitry.
> 
> Where are lore links? b4 provides them automatically.
> 

This patchset was enrolled with b4 due to logistical reasons
which lead to losing initial kernel tree.

I thought the b4 prep -e should be the one to use in this case,
but now I realized that has a different purpose. My bad.

Will make sure links are there in the next version.

Thanks for reviewing.

