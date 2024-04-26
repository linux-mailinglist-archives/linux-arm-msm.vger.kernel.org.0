Return-Path: <linux-arm-msm+bounces-18696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CF58B3F7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 20:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E360FB21C09
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 18:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A756FB6;
	Fri, 26 Apr 2024 18:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qH4hxjX7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7822B63AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 18:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714156739; cv=none; b=hqYQ93tLdcyTlqLGLwL7P7bJ2VKhVr1dqyKo8n2PEYiQ/MnuYg+qJnhjVl0pdYH+zcj93LZvtlicqzWOHLr86UrHgmiVR2mDz7W0YAH3Y4+dIYX7YJ4/X7+VfHhORwl/oAmiYufJtzRIwHVtQMmoaDBDTMmQBv/KLiig+8gnyCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714156739; c=relaxed/simple;
	bh=FOisfRur5zgcKB27eKdkujvgE9ZnTwtO991LBci8F90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIHMkZmIldxvTI7f44cCMEIVJpnzA7n7GyDWSiEbPslf3GDY9gAgI/wybEHf4Yd7GygmQBc/CuJ1509jCpyz/FDcQ+mQX/Vc1WB8YmcAEBMT0ssSPDH3+22wFLssHd3o8kjQB76rinRJzSI/Z3I5QOABWI2J2wCRl3AIFKb8hNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qH4hxjX7; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-de46da8ced2so2797829276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Apr 2024 11:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714156735; x=1714761535; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gv1XMYqj7FlbfLTbilE5kRRG0y9JWfghI0WKM8XxsyY=;
        b=qH4hxjX7zCPXSrAV6w7OxC0WetPo5XtM+MwnzqAzm6iR7KKLpEDSJbSXEmi9zCGtfw
         hbpypuPDaFSXdQSrA+ZvRBk0LOSqrefba2xJwWecrK5GJWTT++SS4zPuByNnP1wXDtZW
         87qy1zDvC51sLkCDIJUX0nxjsJw+F6ONUm08MphshG1s0wPY3Ha4tV0pINttrMsWg3UV
         sGloAzbbNJ6kbV0TzCgU9FXY+MTqH1XU8lrZV14+ekvNkm6eXmeqd/xJ1RIT+FKPz0kp
         JAdp+I9+zuJipLhsNcMZJCpwU65c0msdCUi/fKC4EqQYxpUjH7Cn6Cjcd9DymOE3UPWz
         Qojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714156735; x=1714761535;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gv1XMYqj7FlbfLTbilE5kRRG0y9JWfghI0WKM8XxsyY=;
        b=lHlsKevGBUKenPrARxNmY6xz1209BpNTh9ykM3W06VooWIQ3ijwLQqeK4kbgZ7G0nA
         LzlRYTF6QnoJEpYnOflnx+F1RVDctLxgJCechgrg+vKdDFk9euvWrkvnxfPo5KJJTLyQ
         5e+Kn8PQRusXg9cZ2K/53tqUk/kDvqHVY5B6zKmRX2qjg6oQzbzk0r5TCKXKjLk0BEJH
         HwoK3pA5vPYq+Cl+bUdHDs3oyjFyvqlAEDd4AzffPRRuwMAFEOFdcDvBzW3oLmoOK/LU
         WpQJcRUKR19p6LfMPjw0w93P4jtlt4xttP999fy/YlBPxu8cQGPDFKkXZJdg7kP13+/a
         2Zkg==
X-Forwarded-Encrypted: i=1; AJvYcCVIGoJKHa77y6DfaA7WAEQ//9AfIoPmJM0EAEABOUDOmGvL/BJX+/Ho/GCUHr2OTwHzke/YS03N0kCWdswwhSdbxHKHOWe/u5eTVbsTow==
X-Gm-Message-State: AOJu0YzbmJ6jwvwn8i7985HobP+oe53Y/KFyTxeQQdylpywJgppgyxMG
	bMUQX18Ts2sK449i0uHJnDsdkgtMEjAqpl8iB573lRgboMoS6WMSp8vtCp70mY7tHgRnp+wjaAD
	M13085gUjucaiPu77Vv5Ok35MDMjfjebvyDaG3g==
X-Google-Smtp-Source: AGHT+IG3IsyEOycBc7qulLoEu9IiRmWCqVyqNrLDpmeg9cQ457zZD8N3srGvP0qs68zCmdPTZI0p/dKAsd7wuoQG5rc=
X-Received: by 2002:a25:83c6:0:b0:dcc:6d85:586a with SMTP id
 v6-20020a2583c6000000b00dcc6d85586amr3741728ybm.49.1714156735527; Fri, 26 Apr
 2024 11:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240426-a750-raytracing-v2-0-562ac9866d63@gmail.com> <20240426-a750-raytracing-v2-3-562ac9866d63@gmail.com>
In-Reply-To: <20240426-a750-raytracing-v2-3-562ac9866d63@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 21:38:44 +0300
Message-ID: <CAA8EJppoK4XAt1ARugvKvW2mYjuRJcuvJ-bhFh+cQMr3zmvx_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/msm: Update a6xx registers
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Apr 2024 at 21:34, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> Update to mesa commit ff155f46a33 ("freedreno/a7xx: Register updates
> from kgsl").
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 28 ++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

