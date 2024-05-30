Return-Path: <linux-arm-msm+bounces-21150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 347D18D5075
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 19:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 661521C22079
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 17:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C27543AC3;
	Thu, 30 May 2024 17:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PH7rV5EQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371403F9FB
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 17:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088700; cv=none; b=SNzPYU+ojhevVgC3o07oiCGppmHJaL9TmyN+dVXfxM98yHTALeIgfFhHjcBZq9wzSzwZWYJus18pXpHb2sp/u9NAmYzN0fJ+h3c+gnRPe1dQ+MVE+i4ydSE+DLWMnRwoVTYovKNAR4AF6BNJ0nJwMg873Dk41aNX//v7r2+q8Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088700; c=relaxed/simple;
	bh=DAtbp+Udo51/ggghY8Ta/nQKZ1Qn63T/N+XvPyQlNIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyPEG5NctsYZqhxJSlNY7kz+SbbVqNeKSS2+nPegFDQydwC+wH+EyRV7Sjv7ep9IePtNvyLFxKWXS34R0jpn0g2/e/fvqwUpwsEkYAqydOIyMjm4jUVnb9fRlKTxzwqwlW9mLKwmyD63y0khRlid7kxRYfy9RLt2ty0HC/GKiPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PH7rV5EQ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso282498e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 May 2024 10:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717088696; x=1717693496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FqM5oBlvWmtQCy/vmQxQErg1+TLSJYV7HsRivxfdSao=;
        b=PH7rV5EQX9zjEQIF0t16yyaSQ+rBaT+CWhdOjroUum1wApUpvqRIsO39B10BSNoeKy
         Zcebm/rE0VtbuHy/FYxnrsUSXUbRsqihu0N8z1h1II4TByeUhLNdffYd+syZ4KJpVds7
         pd4cM7tg1kDou0alZfwcmI5UgA31aHvmqR/XUmADZ6X9Q0ZYsStLbU3470Uu3kRpsN9O
         BlKW9cm6LZpiyrKOJLEt4K2xjY4C/sLFDxbNGHWjo17V5VVh8NH2QU0JYTgni7CSrFGg
         9GOE/uSdY6LzQJKO1gVuroc7Ar2pQvq5z+8AlK9FbvMyuyAyNDrCjlUr/hWXhbFmtYIZ
         KXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717088696; x=1717693496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqM5oBlvWmtQCy/vmQxQErg1+TLSJYV7HsRivxfdSao=;
        b=OZGdh2E3AjEdvg59oS0G+2uWA/KPrMl14t0GIE5nk72ssQfA4b/pCpgL+IcqTVNZV+
         s8kj9nw0hCnxw51eol2kjtlqAQTZVfTI4xCu40D95dBueh09KpkbUc+8pxmfFdM7uZo1
         lkoXt/wWZOmXH97MgadQm0wWSXc6S1mkcIFnIZQrqh0RnjxxUR7PDcxNJ9FlFIRcJAbn
         rX6oM0PkdY+tHXoiia9w3raUZ9Fow70w9DNkcTBZDrR1yd5udGJ5JHnMm2FrYB5OhfJt
         uFHEIAWzxSvDfL9ehCF5VfmpLTraPYASn7b7KNnrYA2jzn/l95/wnIW8FygPRtySRsg+
         a8ug==
X-Forwarded-Encrypted: i=1; AJvYcCXyn4AGaO21DmDuYf73iKorqSpejedYXrxmAbyeqVKwP0AuzzTZKnKi5SQVoEAHWSxORcdT+9zukMu0UrxgdrnwyAiHbXIg0s8l+muWBw==
X-Gm-Message-State: AOJu0YwKfXF9xNqgN7GMFY3RXGJ+fNKoNBKAyvDbHf+57aag6QBsUBBP
	VAgsBLwqRD+jpu2rE2mPFTvhcFCbxEwnBJXycu+niMmyoYKaxvuSG6MRJOCneKHg/q141uYagDa
	g
X-Google-Smtp-Source: AGHT+IE1ehckPaW3Xm4BfgQOz2B6cKjcXdpFlrcjgJ5MmxIm0U32yV97sJl9mZHeHxviYNkiJCitEQ==
X-Received: by 2002:ac2:457b:0:b0:51b:5c40:da74 with SMTP id 2adb3069b0e04-52b7d418ed1mr1803340e87.1.1717088696524;
        Thu, 30 May 2024 10:04:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3465asm19038e87.44.2024.05.30.10.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 10:04:55 -0700 (PDT)
Date: Thu, 30 May 2024 20:04:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e80100-crd: Fix USB PHYs
 regulators
Message-ID: <qn64iunks32jlaevjdr5lsdpishsk7cmygdodpekdkgwtwxt24@6oy4kfmuqgo7>
References: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-0-6eb72a546227@linaro.org>
 <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-1-6eb72a546227@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240530-x1e80100-dts-fix-usb-phy-supplies-v1-1-6eb72a546227@linaro.org>

On Thu, May 30, 2024 at 07:35:45PM +0300, Abel Vesa wrote:
> The 1.2v HS PHY shared regulator is actually LDO2 from PM8550ve id J.
> Also add the missing supplies to QMP PHYs.
> 
> Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

