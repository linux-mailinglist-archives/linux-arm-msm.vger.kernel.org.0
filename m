Return-Path: <linux-arm-msm+bounces-47736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22148A323B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 11:43:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43D9916147B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 10:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA24B209F49;
	Wed, 12 Feb 2025 10:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UvMRwah7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC15D209F55
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 10:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739356954; cv=none; b=pT93mmnm9hdoQGy7LPYK++Skr2pnpiJMhBYxH4jslVFQTBmJgLCKW6yKMU7RwSuZnGs/SUqNbQvhPWDUfN6MFXau245eK7TorH1VECWoJN/sdy20S5dIgTUFyjJynYKA3hxB12DN9LJ7nB6YTaDCOp/eAzCpTGslQ7AfLNuespE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739356954; c=relaxed/simple;
	bh=zKemnO3M4vvKr/b+LEy5t/9tGLoJbtiRSG+p5f9+Kws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTBhz5Z4So3FwBihPuCK7W3its577P0fXFHi6PlCldgLTXIsq/RGWsIETCz5GmrJ3ADBK9u+SD4X1bLCMlLq68xHWqoPoIqwRxdBhe87foaiTn2prD9AVBGmZoSh6URiT/4ryCIG/6gnLC+R5RyTrelEFejpSR6MyDhJRB+LW/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UvMRwah7; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3078fb1fa28so61076651fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 02:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739356951; x=1739961751; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ld1TfC5Cdjw/PoVC0iP097r1SbIYfGgfFoLiWX4Zz3g=;
        b=UvMRwah7YSQfTrvxsptY1ehUFhktfrovYmj0W1SWPW95ehDdJPtGEmZsPk6zj04XCV
         smPSGuigSJlCGwwM8YDg2dvDdSipSMD1yAA3+4obCI1cAeR82bWcvTRHjE4jNns2OOBm
         D+DCSO56POEUuVhoQrlAxricsU1YQtfBJFhR/VsYvzbKmwZ+vEx34CqiqNwCZhBGfFBj
         6KTDOwcn0q8qDaJKQuywUl4nkzLvkG6Qy1nFyE8iRFnO5jEv9FjE5/ChbnmDwanVCL6R
         xi9TOGN9sHj7SidZbm4zsi3bootmzuTB/PYUxVBa79yDVVkLlx9tSLSOE6uKfww1koqJ
         Jd4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739356951; x=1739961751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ld1TfC5Cdjw/PoVC0iP097r1SbIYfGgfFoLiWX4Zz3g=;
        b=X53Ixm8s7UY2kFVyo5/GpcHqvLpqJ/pXlmqUbVfdS/Y9ZOTor8aAzK4NAuoxrjVfe8
         giOIRAc9kjwnFBRriv+PfHNmKKMtbLuP2l+fTliKP1gvq9XVosm0tx2ZmYDYmTGaLKqX
         LyEa2JtaM2Q9QEBgHua5Gtg0yEfGjCNp40d9FaxGkADPGH9HbN5rG+mwXfVe/nZYNUxL
         a/BGbT2hVstuqJouiqGwiSadYSAcwNztbUiaN5WUSHqtv0jyybhG2omVLGpsHnV5OOaG
         o2LihlqGL/cFc6uUeIYgG4AyWe8KCTEyXoEHmniwFG1ncfbIYM6iU1uWDIMi4Fs/AwyS
         s78A==
X-Forwarded-Encrypted: i=1; AJvYcCUn386TKWD7eAyLsLBj1tNpFB6bWl0DPbM+Kgh+pltEe3pMn36WJqUYDdyG7tlOVzlwqeaMmcf/HNLmSRHd@vger.kernel.org
X-Gm-Message-State: AOJu0YxJi3f5Yl3G1TwiWDqtnxxPOeeDqcYISubTjN6OXgJfCh3ZHwW+
	2x8keEhUx07gSMDvmQp5oNEqslYEG4JxmzuCtO+9k+NmThEFrh/574V3ri2rZnI=
X-Gm-Gg: ASbGncugXRKpyX7XMSxO64alakXAOJTi5v09PgzSfwo6S5L0+nWShzXIRxx9W23i14O
	ckerbEG4H7YXMTplWMrw91A8QQV7yHBlOvHzeQpfMevNxoys8ohUzC6twYajDfmFLJTEwpTxodZ
	PdfpogfI9BCcoQxLofEY3PuEge1+cS5bgiNFAH9u9ILQhc2tJH99OLUMQq7LVFD89YEZYf123HX
	zsrkdAALb57gRlAmoL/4Zs6MvE8G8JNSHENnMVSLlVnPoP6/5rzlF21rKieHKChmYwiOipnEGWh
	j/9x89jktfqE4kawmFesr5vXTTr2jLw7BLYw8YUQTLoH/zUmAz+9LebuEfclaA396ovsJtg=
X-Google-Smtp-Source: AGHT+IF+1GUoRD9HhqBh1RL9sJOAG4t7Xk0SYLrZn9lbwf1SpooHUxeWe02/GIT06t3TK4EotARjyA==
X-Received: by 2002:a05:6512:39cf:b0:545:17d:f96b with SMTP id 2adb3069b0e04-545180eb5f9mr737259e87.14.1739356950858;
        Wed, 12 Feb 2025 02:42:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54504e344a7sm1328754e87.5.2025.02.12.02.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 02:42:30 -0800 (PST)
Date: Wed, 12 Feb 2025 12:42:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Redocument the
 dp-controller for QCS8300
Message-ID: <brm43v5kzsum6hc6ahs3lqzgww55kczjzwzxsmx5a6alw3xxvh@3mdqqjvo2b5k>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>

On Wed, Feb 12, 2025 at 03:12:24PM +0800, Yongxing Mou wrote:
> We need to enable mst for qcs8300, dp0 controller will support 2 streams
> output. So not reuse sm8650 dp controller driver and will add a new driver
> patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
> to compatible with the qcs8300-dp.

Forgot to mention that in the quick response: please fix usage of
capital or lowercase letters in the commit message. If you are unusure,
'git log' will help you.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry

