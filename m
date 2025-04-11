Return-Path: <linux-arm-msm+bounces-54025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3084EA85DC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 644A93A885E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42A7221FAF;
	Fri, 11 Apr 2025 12:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kX+bB0R+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA4B221FA7
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 12:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375663; cv=none; b=sLgwZWWtQ9RgCgZaIoHl+Z0sYgTj2iOyBUTe3cvAIL2naOPhaaT4K7AiuSjz4KaOSlf54+C5XJi8bnCXiNwziU4HjXXl5bUrvql/QJfQmKrzM/RHKzlVthAcHTItIcX2n/oqeD6QHuf8YG3cKzpKjAjp3ILxaGrNKjCJebUiRyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375663; c=relaxed/simple;
	bh=/9exeZYC0ln75OqXryQRe+XV1cck5q9ppQ2F9YveTOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NC7WLVhAJ5NpyVIKVCLAH6k3gvm/fLVcVQaOZ3bmG7kcNednzQKxCmzCLx6nOIAxhJZQCdDULham690WO2s7ZySuWm0bcqOEUVZ4oj7uks+5VXh2pe5bPrImrlTIRtTTydbjsyj1r+N0p8nEjzh/AsviGYaOEu/njCHym4zCVLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kX+bB0R+; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c14016868so1657925f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 05:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744375660; x=1744980460; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/2nnzdriq0ONqeToErv6soefY0Ll+iz/nW/gayWNpY4=;
        b=kX+bB0R+snfXBgtf6Zt/6qE+IbIniXskm1Swsk9vgNXOaoBq54T6M6JON9iULN1V9x
         rZwzuP3GtRYPFR8OGvoevGsK1jLy03zepPxfInaofowkZ1LQ3HRQ2CGVWDTUG4vXzRfN
         Y14+D3C9L5a9wKszkEFmZwefmu1dUbgun87XkJmz8iNWiBNbldhJFylHl0nB0Sdfbhaw
         utOOTRybSw1FkiaiAMLiFJtnxWMbfTrVhDUeV/11NSZN+WIAsLFPWPOPjvar7Znx6ujo
         TITsqybx3EXV/mphJDMGLlBNbYNtc3ruj9i4SoYekHJGl2zSN7+4JT7ATTNGLI8N+VsP
         pabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375660; x=1744980460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2nnzdriq0ONqeToErv6soefY0Ll+iz/nW/gayWNpY4=;
        b=UdfB2f5fsRoz/CK1Z0yCWJUmiEnYdRDHqiD4Q65YmRU7tLarqwTeei4bPJnoWrpgbz
         mCRVnozh8NWkbl09liqJBkujxtXP2z+dR1piEvhnHR8UAwiYe0n35FF94r6uJ37GRtMx
         3YdqnAaqJMlXy9EjcfitPyO1Scm89TLrGaCtS4iDjrIN4Bf4QJl7uv7ZsRPNN0nWWd/V
         U5GamsC7Wiq2NG4cNcqOF9SvP4T1zC9f3+wgb4tLt2BgytJ/19Fs2GdDESajuBqjCbHd
         uQetn78FoI5pLAs/uxZbZHAnWTo1bZ/DIybcJLA+qyfX0n8xyHxbPXkl5svvIpTsy6Mq
         iplg==
X-Forwarded-Encrypted: i=1; AJvYcCWCASUOQz8vZDogmpPW7V3j3iSTKy4Fj6kfK3UAyFFEKe0ll93fw9LTjbtU25ir5ulSlmE476UuwEAoGCLO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7hYc9OPqruePeh2jZF2ybT1DnCiE/efh4bQuWfCpHgLFxjeQa
	mZO/M1Kq6t7Hm0OP+V2Yme4izQztkiO53iwfcLj/oEDvHNcc3vrKBWZ+jRFNmdw=
X-Gm-Gg: ASbGncva1F5cTBQz2HMDC5wLcrwwGNUTrWNyhEtKO82vb0YXmus6EyQ/eTr0ib4fL+e
	0QzQbM0dtXeC62w1sr33slwridEHH88L7Xb8NB4s85cp+tduQ67OkdX8nQV2/4uRa1LVhyliEiG
	yldNK+EYneB1kXNMP0Q6NsmBERTzfdOsPMCtBhdN8mI92+uYR+7PmC/tf4rebKoz5Ce/Dt3A8kb
	v/ch2ARFaRkd+zp7JXAOltPQYZEql4efnmBBO0DwLjNsF0M40QFAQikpYbds7mOgcjVOVq28ZKa
	rFASuRbgvnU/aX2jXEvWbJZMRFhWdXECG/MqCY+qSuFeKns4evBy9C2doJlEGlDLNLycl7rklNf
	okPQILA==
X-Google-Smtp-Source: AGHT+IGUsechKPxsJWJXcfLxTXrYk8Q3dS5jwa5ESYt5puLqb643rMkJ3V+3UBY2DLpDKknF5+jlAw==
X-Received: by 2002:a05:6000:2483:b0:391:4977:5060 with SMTP id ffacd0b85a97d-39eaaedcb75mr1817205f8f.53.1744375660089;
        Fri, 11 Apr 2025 05:47:40 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572d43sm80924125e9.31.2025.04.11.05.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 05:47:39 -0700 (PDT)
Message-ID: <159f1df0-6c7e-40a5-9c62-ef6ebcb189ba@linaro.org>
Date: Fri, 11 Apr 2025 13:47:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/20] media: iris: Avoid updating frame size to firmware
 during reconfig
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250408-iris-dec-hevc-vp9-v1-0-acd258778bd6@quicinc.com>
 <20250408-iris-dec-hevc-vp9-v1-4-acd258778bd6@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250408-iris-dec-hevc-vp9-v1-4-acd258778bd6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 16:54, Dikshita Agarwal wrote:
> During reconfig, the firmware sends the resolution aligned to 8 bytes.
> If the driver sends the same resolution back to the firmware the resolution
> will be aligned to 16 bytes not 8.
> 
> The alignment mismatch would then subsequently cause the firmware to
> send another redundant sequence change.
> 
> Fix this by not setting the resolution property during reconfig.
The log implies to me a missing Fixes: tag

---
bod

