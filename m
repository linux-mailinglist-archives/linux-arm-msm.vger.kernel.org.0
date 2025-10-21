Return-Path: <linux-arm-msm+bounces-78189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2171BBF702D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 16:17:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 45A71505BF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 14:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BD333375D;
	Tue, 21 Oct 2025 14:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="swMALA0N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72554260580
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761056213; cv=none; b=ZIHav8pMa6To0IGAbsh78kEYULDydFbiM8vygHIV0ZDM81QtLbRYEZvOq8dYt/mzi7Z9aKoO5/K0N961WesXtB5U6SM1zdFzVaZM8X/mIdYFL/gsT+GvkKxlCeaOfUnpkFyjDD0b4qiX+XyiRvYnBHOne0w1Sd1ChEquisb8C7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761056213; c=relaxed/simple;
	bh=IXEiCfbFjHb0RagvMealrW5WYbDtUPRtCtvcvlM/5gI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DH4sRGI6cd7p4NtAqD/SJyaJpb6MYQzDkh21WrORKgp2OAxvmVGy3bdCGAKJ7wfe3lu7doN5fvbF+CdyVJRat6r9oBrDNzc60hF0jci4w/woV+3hEQg1OYh8utkx3LtHV7Ny7DVU7RGk1iZo+UmNj95Hfz7cDy2qVO+kVLbagTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=swMALA0N; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-471191ac79dso47695295e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761056210; x=1761661010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GH+Au8Z65JXGAtAPh2UGeuug8ILOECULe8PKQvQu4p0=;
        b=swMALA0Nc5IAGifCsrRdM8Nz4I01OyKEM5Q2not0A7YbgdErVuM2masPp49SU3fEAB
         aMK6tLB3YgpEUYvKZKRQZyRLaRn01+2pPZXxN0tCFCSHZYFT2+K7o+YbPI5ebmwaePyV
         xs/sxb5xvFD4hJ1n36JCfxD2pWBHRow6y2hIvr7Nxm78fYHLG7s0sr/MSIof1hnGzmfq
         FM3qe/ovwqqJ3o4xrr0FYevBJBS53ZeD1pqrhby6bDLcIdg+T4VzaWrqgHFLU/FA3uzq
         9nJbN5cISXts2mAcx977yriB+IYNSj/4BxMQyku5mLMarviGBD0/oWBJJtce5f0FBpjB
         g5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761056210; x=1761661010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GH+Au8Z65JXGAtAPh2UGeuug8ILOECULe8PKQvQu4p0=;
        b=RjWleR/0EQa6VePe1of0OXmKQDZxrmPHtw39m3zpMuxKvB4VjyRaUsST0P2PTQQZWq
         ezRWte+ywu88e6SNXy+xdTddxpxlyd2aqgWy/oYn7okB5LHWFJ1GrpvyAncIO2XHlHV5
         EyMnVP4rRXlE9NCx6bV8KxyeZmtDneeBHbSHlqAbIADIIRTXSXTwiC5fGzSHFKReGYex
         TAk6G7aaO5dMWi70MAsgHqFVhsYjrLfeaqba0YEsezHxudNAW6QUDiFJ7v4mYP3HLBQT
         iU08MdO0fKNfo63Qkjuc5yNQtJTK5rVuDYizXm6OMr0/9DjeFv6mrpyt+DAP8axd5Kwz
         GQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNNJSMpKregaFcvnZqp0tXVBvVzjrtb81mrRUhYAHNnoWVCmQ0OhOhHQNAeXXMXPcDlRaJZu72vipiQQmy@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2YHdnWMUXDRM1IOJCbW8GprSykHOHE7w79SwQnmyio7rY/3li
	U6bA00CNWZ+QMgzJ6AEzIvU6ndQ45lXVNyI/va3KXHCvBD9ZwYlvNSjgGiPxiQKEWzY=
X-Gm-Gg: ASbGncuyP3Si+5Rz3m4gF+08GjqO+GwEEtp0C4g0x03fKgtCawt55VGd6ROAZSc8UtP
	3R8Q2gsR32NQrU9k8igIkYBcJECw6Js3PMbh7a+EoCLW2gEeSvYNpj7RCoSLyySRmWE3uvyus68
	jN17o9pqIACNjhGtxty3wk8PgJ8VzN2qzxzuZu1VO8j/fIqnNBX0TNaYKVL32O8MIuL7/nNgz5l
	8C/QLgKdvqI/slFc2EmSf+AIAqfAmNpmw5bZ1fOjSXFY1mmmTKqUqOHXgqrq8iFn7TGbDw0xrYf
	b6izHqW+HWXCoRnJU0NXAhQDYilWmRHqeyN6ZeVJg6d4P8S1f7dSf+LfCPhJBGEh1ut51DshTU/
	8a5Gy5Wf1iA3NKtiLdUee49Id66IQGINJQGuSZipj9tvVOGgy5oLevziRCfCfuubXRI0KA9kL
X-Google-Smtp-Source: AGHT+IGlCzAGBWO2jDwO8KOdW9RPFbusOV38zy/UqpC4nz4HnuMn3sNj6s9XMr9He0B2eairZT1Tyw==
X-Received: by 2002:a05:600c:818d:b0:46e:394b:49b7 with SMTP id 5b1f17b1804b1-4711791fed6mr135325295e9.37.1761056209687;
        Tue, 21 Oct 2025 07:16:49 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a9a9sm21138244f8f.29.2025.10.21.07.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 07:16:48 -0700 (PDT)
Date: Tue, 21 Oct 2025 17:16:46 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback
 over DisplayPort
Message-ID: <honsqyec45rg4yrh3rwjlqlhcqyatbbsvnhamhjdin3tgaggzc@5yrxw5mwhkni>
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
 <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>

On 25-10-21 13:10:52, Krzysztof Kozlowski wrote:
> Add necessary DAI links and DAI name prefixes to enable audio playback
> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
> should carry respective DAI name prefix regardless.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

