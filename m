Return-Path: <linux-arm-msm+bounces-77177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 08427BD91E0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 13:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 165554ECA2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 11:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C070D30FF23;
	Tue, 14 Oct 2025 11:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R/bVAIHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BEE3101B6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 11:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760442734; cv=none; b=AFziPLPSMcSYdicDCHRW5p2guyuplb80Sl0x2lh5xPrLy3EkRlFKlq0eiKA7SYShjoh7F60TY/mYwJLjoE2is1LtZVh2c/Ca2GJr5p27oIP9qgOU7Tm7Nin3zzWvwXO6DwPrFq1LA4uug0L4+vogn/lgz0NpuTN0KtFyD2WcXRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760442734; c=relaxed/simple;
	bh=C4Zwi47MIN47+HMZt7z5ewf90C8CD0KEwxfGhCDU9l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/4CFt69nQXvWItJhQ3krZ5+b8wg+YFYKzLZ7OXlOzOSPdcRwrnuJy5nsjvWNyz9nRc+I9c/2XSjkseRU1uYiQslU9XuNYfqRGxabP3Kpa2/qD40p4a0Uyu1YG6CEmtTdB3SUl3tSlO1YmGXLXOjJi1zmMhU+t5ZUfNhMUnBqAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R/bVAIHJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so48274465e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 04:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760442731; x=1761047531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S5kwp6ZoI0Qw9Lio9IILJuSek2MXZc7hvFxHIxIa6Qg=;
        b=R/bVAIHJfCIZYlJSwLQaunMl3C3ZTP2ijIPWD578I7cyOkYACaGLG36bcjYk5Rv1+v
         kPcUV38je4qpQC8RoUY9hEE1kHTawfOld0R9Q6cZ59CkKoQJUnafSQ250r92qaUO2A+q
         l/WPFO3iIA0y6k6IyjwEfPXrv6/jblOt1bVB3KBGahBXKIdC7Clo6CbCRI1sjsYPJ+zk
         aVqt8FLmU/Yn0DDDyHd5MMI0KtBn53a9EOvXs8ur/cSCberUx3Wjz5YE8gRsX1B3B6Gh
         MZoF+5XUcYBGFSHOScZqCmQ/mcLX6yeLlEhKU+4ef41F5whnXkmlP9f7fr7t1avBf/QB
         oAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760442731; x=1761047531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5kwp6ZoI0Qw9Lio9IILJuSek2MXZc7hvFxHIxIa6Qg=;
        b=C6ls8lNEXnXZkGS7rTSOVV9qRqZKn+JCsQwYtrmYzZ5/GYNymAHZPKx6uPCW3iaeVo
         HS0mP+RmF2Qzju8uAbXOJhjGaOb3S3en0lbH2RdyJjHOnNRaOOmaEUyVfEMYBWbYwBUK
         jP34AAW/hT8m7y3EStNJc1NicfKlNBhu4s2rerLNirjtbSiSc2FOk01PJo27L73OKiAd
         zAzrOmXQ6CpwlvkLYn+KC6r/g6xuJUHbe6U83dlDr/shZeM1F6PhjkE2s55Cpdq8yuHQ
         3rntBTaBn0j0OmAp6euVWoY58iijCj8hY8l6av0cKx9jGGFd8Ze+8iNOG4arCq4A6enf
         dtuw==
X-Forwarded-Encrypted: i=1; AJvYcCUVilaHgEw6yGPBx5mLsfcxPjwY4l3seFN+8XK+L50Ho1IJoj3+gh+tHD1HURncL9qM2m4VqTYXlklMRppY@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvpknryt/fN2SHP1gS3gRcITcDwbt96ExGFkSfM/myBulW/sXr
	G6IUBHbcRx/UIUhjGlDUcO/s25hSiQ/fFEUa+/l1MyF8dn+sXDvbf4sRX9zb/+GLrqk=
X-Gm-Gg: ASbGncsmbR8tEpePF+3L5VPtV2H6MUUDv0zPbvPDc/DbENBpUs92XkGIfRcCQQIvOMX
	xPNv01R80sUKciSeCdMWYweqdCBmlJFltWGv93uyx8G85k/LxjOTZAITnvVPdarL+wvrAtT6MKv
	RCcMpEWJWfUFKPA9WMS4wMeA1ExxW5cuAiOCKBnZgGafB3tiTKN0OCSjLiE5fJhErpwXF0O9VXj
	MT4XPwpj2X5EbZySVxfKOYBPMGjkiEidHmM6Mls+paFOtY1CdJHleBKSfeUCcXkJ4QT/VyTblWp
	JtIwOcnoFjSLLlbqa1EVy/zS83jw3ZPa8jgA0MwwI0fGnX3jp6/mm9z6xxCGn9rzefQAZ+R2pgS
	GyZmTad1lTP8Uvfb+YjysK02V59f5FWQYfvom4SSqgohh6dsqA/HG
X-Google-Smtp-Source: AGHT+IE0T5cvpE7QhDWujs9OdISYV+M+qLIfcBtU5FuqXOEPjcO1IUVOft+IiRF/W2H0Fcynpk8rfA==
X-Received: by 2002:a05:600c:3b29:b0:46e:7e22:ff6a with SMTP id 5b1f17b1804b1-46fa9aa1d79mr180603815e9.15.1760442731072;
        Tue, 14 Oct 2025 04:52:11 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489af92sm255991685e9.17.2025.10.14.04.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 04:52:09 -0700 (PDT)
Date: Tue, 14 Oct 2025 14:52:07 +0300
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
Subject: Re: [PATCH 3/6] dt-bindings: display: msm: Document the Glymur
 DiplayPort controller
Message-ID: <mugh42lzc64wfkcacwo3z3pj7o5m3gx2ksjh47q3q6gu5dwqly@vfvs2n3czy6v>
References: <20250911-glymur-display-v1-0-d391a343292e@linaro.org>
 <20250911-glymur-display-v1-3-d391a343292e@linaro.org>
 <mgbv5zoptfox664jswi3imvibrd7d2teazeuied37dw3ooiex5@lli2bsap7d3x>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mgbv5zoptfox664jswi3imvibrd7d2teazeuied37dw3ooiex5@lli2bsap7d3x>

On 25-09-11 16:01:30, Dmitry Baryshkov wrote:
> On Thu, Sep 11, 2025 at 03:28:50PM +0300, Abel Vesa wrote:
> > Document the DisplayPort controller found in the Qualcomm Glymur SoC.
> > There are 4 controllers and their base addresses and layouts differ,
> > therefore being incompatible with all previous platforms.
> 
> ... and it's a new core revision.
> 
> BTW: any additional clocks or regions for DP?

No new regions and AFAICT no new clocks.

Sorry for the late reply.

