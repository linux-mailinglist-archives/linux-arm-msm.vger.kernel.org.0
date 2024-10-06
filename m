Return-Path: <linux-arm-msm+bounces-33287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AE199215B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 22:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCD1A281B69
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C0A818B486;
	Sun,  6 Oct 2024 20:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PLHYNCf0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF00D74C08
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 20:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728247626; cv=none; b=nNasRuQ0qS5EgKtzDRTuHAaKmDWOPhSbhb8GrHglLf1dTn8Q99rPpYXcPi476i+PMPBYKyyojpGjTLWbPq4FxFfZCmlVgoAui2oXbDyWUJJDcneekHP5QNNguBc6rWxSvbeoqKOSRQnuePW1uVUD1XnkYQpdUmdRnm8GJ6Us4Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728247626; c=relaxed/simple;
	bh=qOCnT/Ya1jNomZvlIwFzbJ6tPZQxzq8D0fUT+rIip18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlH+0eTHC5AmkL6G1fv2Vpr8QWpWYl3jodvo6V0L8jhuoLJ0rk6LoI+U96N67mGkl6Jd/1EpTwbTM9CmSIWLsn+DtaRvVUHvzvYlp32j855bNezih0U5yX3VVcUwKP8Sqe9+9FWQin5JNYG92amQQfk5L7+57VSf/lwmdw6aXko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PLHYNCf0; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fac9eaeafcso38579571fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 13:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728247622; x=1728852422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ELm2L1HPpE5ypl6LlzrRt90wm4RKfaebBSz09tts3O8=;
        b=PLHYNCf0PsEU2fUgC5jpxb5+oZb+H7GrQtjilicQGI3vL8fPkQ7H+x86s40aJC5XGC
         QNiOtqjrV4FgLQJ9KLGNK7bEQPDkQsGti9o1An3+ONqWwbN5Bk7As6+OkgN59p613sN7
         habYUQWs13lfLlEGR+t4Hvhz25icWsnZq+S1yMC1c+NOfS9bdtsDjY7fvx4OWNBH/ciR
         ZJE36m4cVd2LA1SaEnrQufQ0o8etbK7yYQcK9VymifXFsXafwCWNaBFrbU5nPStiM7mb
         Psue89cud5NdpmDJu7XfhI8miZL8nkPiorYW3QvCDLuoE17/zTYbJnkqMfrTkWATmL63
         9pzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728247622; x=1728852422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELm2L1HPpE5ypl6LlzrRt90wm4RKfaebBSz09tts3O8=;
        b=AGHIOVnZRYfW+qms7rQHABGnK5Y4WTBe8OTg2JOztE7oj9fgfAUECzrY98MKTzJLcE
         ZMUglpRX0B+h9Scg/s3VlY5xVuZ/aUQs+xeavoGIfCTB6RkJ29sTTWptDoUNVThODEr3
         /PXMZiwtBGbpPjYBPWTzy2R7x35sSOUE3/7fK0jJmW9c41gJMp0oPTX2H6jn+B9lbhiQ
         4wC/trQyJX7KGkv0CM/M8yA2s2f5kvTZ+uzSngX1d4HaWLd7VMQioHDNHV+1k38OCOxF
         5SJmUFe6M+vEaLiZg9UKcKYjIKq9EMce0zeTm9z7tZd84uFLmpQw0mJk77jXf6RP60A8
         YK8g==
X-Forwarded-Encrypted: i=1; AJvYcCUioMxnnTjydBo7I2eCYyIpcSxPOX0b0uanKISpulf5vOnYI5DHJt9h8igqnG8nbBUAiZf2jxvdeKHhodbo@vger.kernel.org
X-Gm-Message-State: AOJu0YzQfq8CcdGzwqsFLBtoOKVkjtCr4iB4rJMsf/HtxPt4TpNRe+EQ
	qj6f5wZAHHU6TstdDFQyNrGfqotpMpyr2MxtkZM0W5ZTKx6dovUGljhycw/urcA=
X-Google-Smtp-Source: AGHT+IFizL0+yw3wWnoLC/qC2QKl4scr8PrjAX1mGGjyOahajrbJr2qi2cByCq3VzO0DrQt7mwAcDg==
X-Received: by 2002:a05:651c:2119:b0:2fa:cc12:67de with SMTP id 38308e7fff4ca-2faf3d7084amr37219431fa.32.1728247622006;
        Sun, 06 Oct 2024 13:47:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2faf9ab12e2sm6570341fa.8.2024.10.06.13.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 13:47:00 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:46:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_mahap@quicinc.com
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Kalyan Thota <quic_kalyant@quicinc.com>, Jayaprakash Madisetty <quic_jmadiset@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: sa8775p: add display dt nodes
 for MDSS0 and DPU
Message-ID: <bwqrqamudbonslvmhmgdkb33e7464zywff7bvvklbcecdlxpxc@ir3r4mkb6srl>
References: <20241001-patchv3_1-v3-0-d23284f45977@quicinc.com>
 <20241001-patchv3_1-v3-5-d23284f45977@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001-patchv3_1-v3-5-d23284f45977@quicinc.com>

On Tue, Oct 01, 2024 at 12:11:40PM GMT, Mahadevan via B4 Relay wrote:
> From: Mahadevan <quic_mahap@quicinc.com>
> 
> Add devicetree changes to enable MDSS0 display-subsystem its
> display-controller(DPU) for Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 89 +++++++++++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

