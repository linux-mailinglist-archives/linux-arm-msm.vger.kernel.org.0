Return-Path: <linux-arm-msm+bounces-45259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC96A13894
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 12:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70EE13A1139
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 11:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E05211DD525;
	Thu, 16 Jan 2025 11:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l9WfDli3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2306A1DC185
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 11:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737025792; cv=none; b=cZF0wWR1RJmWumZ3mvVvntrZBX98FDrAvnmMOq1EOGrUPIyHoD4p4/evnrRv3DZr45ZNZgUTdG1FsWik2ysrDy2dj+ShIUwQdRvL+aliDlsyRQj34beYaa4Qi949DCvqpjeFaBrimelIiGjDywySNXG5u+ibKE7sKT1uqdJzmFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737025792; c=relaxed/simple;
	bh=PWTvlMSGN+tn/RRhCnmbMeP2gmZloBV5ycwROSo+d88=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CkHt10xWTkXIk7OfTv5ITXwciuYm9ZVLdUEPffr0aMTNc1PlWOgHC/Qm//BGCpdPnXPjzLhuvIcSTGw8wNERaodM15hZQLp2C8u/5LJO/od4li11LDTJSC+u3qyUoe3nTaMiJkJGGG9pF0RwF3CCoz2C6XIJbmPOF7F/6GgEETg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l9WfDli3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso4848675e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 03:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737025789; x=1737630589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PWTvlMSGN+tn/RRhCnmbMeP2gmZloBV5ycwROSo+d88=;
        b=l9WfDli3mhpI6OqadlpC3f8coy11puihbLPLZQgAaZysZVRh5zcIZrwSBCp+iSQ2o1
         ZlLkj4UpBQyTNIhlAVQKUQLTZ93k57vP+EqdwQzW3GHXGnug6WwEKqv6IbFLIukmeBYf
         SVNzd1KDmbIQaljH+xiWklL6HSsZ3f1kl/8I2Jvdc+m4eogTBz7SZcbVf03D0B5mjMti
         pE38P1FPpahhbGcvVwHWLzwIFZvshmMvKgEJobpgM0K8KXoFuGfvlZHMWbp9QwA6uuhi
         LNkB6ofT+hkHLOvFDUdKrKIb+Kxk0i+BLAWhUEAWsgMiK/jp6ewMuuBJBJYVIO0UFoHQ
         0D3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737025789; x=1737630589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PWTvlMSGN+tn/RRhCnmbMeP2gmZloBV5ycwROSo+d88=;
        b=I70g9N3JVNpMK2MXtgzc4iuXUJsH66DtEIF0s2SHjZinzWM7RMeMZ14DERQsF9r+Y/
         TYMsejmFquOUsptwgBvALskO+vm6A0NvQQQc3nW/N6qtpVWCUyFcZbSdQr7fXeMm+9Hj
         dR5Lk/uTlwr4AS2+ywe1kGMbUjFb9aMs9cziSPm50hrOxE5blXyEa8fPdKywq/KjaAqk
         fOpzdhH98A3Xm6JNHJV6k+heXR0LHhj1BzvCU89NfFScK/BJJlzM1unIwH2l87M/aOJu
         dOkUbRgy0R4Uszn9u8dN8/LrXGLYFdLlCZ2LK2xVo/Ng13dbXy5u+VLgrTwUslquP3Io
         aRhw==
X-Forwarded-Encrypted: i=1; AJvYcCUf9Gzqb9QM2OHl9rQEQQDI4RJdRRFYu4dbxLweS1thdfhawcyBK/GvyYUNv6vHm0km1HOqXJJJkT7zHRbp@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2BLtahO1lpE/yp2oU3xPLFocINlIqmS6fsDf6skE9vtSBVn3q
	3QRPCB2jhIfNwbKZYVN/M+IvYsEKZFx4HGr2KGuTnsK61HqTIAtCM1EsVtw9hkw=
X-Gm-Gg: ASbGnct3pIx+Lgv+zQMorvKOLUHJTvgX33/oCDIMNVXD0tp9475ewvdrioxp/M7q9gW
	+f9k+oeKfXY5KiCHvECMpz23++hgzqEc9JbbwLCGalG+DZEP+COSEIpkzUDl51+cuxElLry+9s3
	28BPqcuFXeW8oezwVnYOYedZzXYCHnWMdTh4rmot9O1k+JUfxBVb30Pd5PA/GtCU6gyOkSqi/iI
	uSopAjM1j7jF8tD/95Uvl7TgvZka46lZSVbTItB0fMyTd/83kTW4fvVizyT64kZewIrfw==
X-Google-Smtp-Source: AGHT+IFHEVWxpg42EjnurnTXAdjBPZhREYawLpQ/q0Wat1yERpKDavbubs0/fy+YZiCEyrkQRfHjMQ==
X-Received: by 2002:a05:600c:46c4:b0:436:1b86:f05 with SMTP id 5b1f17b1804b1-437c6b26ec6mr57469445e9.11.1737025789510;
        Thu, 16 Jan 2025 03:09:49 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74e59ecsm56346295e9.35.2025.01.16.03.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jan 2025 03:09:49 -0800 (PST)
Message-ID: <d5553358-3426-4d94-9279-033ac46efa73@linaro.org>
Date: Thu, 16 Jan 2025 11:09:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v10 27/28] media: iris: enable video driver probe of
 SM8250 SoC
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, quic_vgarodia@quicinc.com,
 quic_abhinavk@quicinc.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, p.zabel@pengutronix.de
Cc: hverkuil@xs4all.nl, sebastian.fricke@collabora.com,
 dmitry.baryshkov@linaro.org, neil.armstrong@linaro.org,
 nicolas@ndufresne.ca, u.kleine-koenig@baylibre.com,
 stefan.schmidt@linaro.org, lujianhua000@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, johan@kernel.org
References: <20250116070234.4027116-1-quic_dikshita@quicinc.com>
 <6e35ca51-f224-42d1-a49f-67c6a7015542@linaro.org>
 <bb6dd053-0e8f-8c7c-eb76-9e9322769c72@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <bb6dd053-0e8f-8c7c-eb76-9e9322769c72@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/01/2025 09:51, Dikshita Agarwal wrote:
>> A patch directly before/after this patch in the series for venus including
>> video_drv_should_bind().
>>
> The modilfied API "iris_should_not_bind "is already added in venus_probe
> of venus driver with above code, anything missing?

No, I didn't see that, LGTM now.

I look forward to the whole series so I can test it.

---
bod

