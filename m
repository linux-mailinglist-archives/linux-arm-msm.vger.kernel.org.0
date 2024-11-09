Return-Path: <linux-arm-msm+bounces-37406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E424C9C2ECB
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 18:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 957F3280F42
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 17:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4EA13CA95;
	Sat,  9 Nov 2024 17:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQeV18nC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16F72556E
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Nov 2024 17:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731173558; cv=none; b=AIXOaGslQcLCzZL12DLP+1ZAUlsr4Fcta9X1c7aIeQW3yvK7OejtjYesPfpd2vpl0oxOwhfesKp8+RO75Dg7Yi4dYLe4dc771TQnCTB88fPtOJG1uGGqK4PuyMjkZdbCNAz0ih2xgw2i0PwjqIHFgNfvqUYpoMLl0r7dqSYAjPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731173558; c=relaxed/simple;
	bh=oZjEXKpbPtj7ttMs05EhUXZ+US9I3Z5OX+ylmkahyFk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/U13YacMxCmXVPODu8nMZ3uek8XqHvdnMlabOJVeSRERBT4zohPV1lFc/v7+AStkE4fJ6ET2kYZqTc68wN5oReHNdp9QMUVjNZXDQuGMZSl+7y6nfFiWstmUZohW4kI1c8LzOWDuJ4RcnMt0hS3R8+ce68t1DE9/iZk85p25Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQeV18nC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so29968365e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Nov 2024 09:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731173555; x=1731778355; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrd7Q+hT4RWLlTYkRiopljgomDNa2/49Dcp33gRQK8U=;
        b=cQeV18nC7uVSAi+wt2y2rgNNLVrKRwnhu0Zy8xXi/YHMbhXPvA33Dkkmfcfxj1EXKa
         WIeOYwN4YiaqaNaSmPiqW8ihUJUnBd9cZ9VgFryxOo3GyLMJ7stOb2KNixkUpA4yL/BA
         QeEve/5jjUAvJV1nuHzcZnoayoBizYPWtDsYqrJT+47lzCL8aLRCvDk30CCgs96SRYW+
         CxIxRdEQKh4NZLkxcbgkWr1JYfKLqBXOQFZpPC0ne3DuVA8ykzU4+JQPgtAtMNAwCmso
         j4XyMfdbJkbXmfbKEG+o4jy4pOHXb2ZqehZ00yVsViEZzn1RODt0d51S2hXi0o9a9WYn
         GDcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731173555; x=1731778355;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qrd7Q+hT4RWLlTYkRiopljgomDNa2/49Dcp33gRQK8U=;
        b=BRSiJcUsTosRF1++Gzfgzc7PrcjzUTikzkMQRtNVxAFgimGTfQ1XKpSakAFXpUpLo4
         2cHnns/tP0bT1xRjdZzpKIHrW7fLRLDgqQpQpYANx1I+1yqW7gSFcQUjDAHwhbbP0zOg
         D4Yjvf3KnEm1P12ihkGbjefyhd7vqOoLxX4WRdtRV5QPLvlEtOiCxjQTO2TClQqUY/fP
         i0VIDKU+9dhbfOwOnfqFXdHO88M28VSjZpJx+rXt07gWMyf/UWeXfRHRr5AmMdcW7c3Y
         bny/0NfFxG35BEmnkF6BIGMu+324MLVPPZm55nKga2Rtgmqlv5eNjwMU6ArxE2vU266B
         J77Q==
X-Forwarded-Encrypted: i=1; AJvYcCWnCNV+33YuOw0XMoh173qTQZYKAPjpuJY1ET2wp6HlU6sU3SNPaMzUDQ9FkuhWYoI5KtE7fFbjzVDwq3QZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwGpSsHzahP/As0S2iSYZ0zmXGWtADYY+TBVUDNxbgLyY8ppzNJ
	XPDnbKH6ILEt+BMOtvvxIJUm7hnSxpOody4ayeCTEE70Kctw4Gf2CtEmGCPmyCg=
X-Google-Smtp-Source: AGHT+IE1q8fwdQ3BkqSY4LENvnUv/wVEuo+qnF+jrEdQYc+Aa1DTDS756o74ILXyq3lGqKpHh72kRA==
X-Received: by 2002:a05:6000:78a:b0:37d:4ebe:164b with SMTP id ffacd0b85a97d-381f1885557mr5901995f8f.44.1731173555210;
        Sat, 09 Nov 2024 09:32:35 -0800 (PST)
Received: from [192.168.0.48] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed9707d3sm8132812f8f.19.2024.11.09.09.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 09:32:34 -0800 (PST)
Message-ID: <ab4b80fa-6321-462a-ba1d-151424d1c94f@linaro.org>
Date: Sat, 9 Nov 2024 17:32:32 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/28] media: iris: add platform driver for iris video
 device
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241105-qcom-video-iris-v5-0-a88e7c220f78@quicinc.com>
 <20241105-qcom-video-iris-v5-2-a88e7c220f78@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241105-qcom-video-iris-v5-2-a88e7c220f78@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2024 06:55, Dikshita Agarwal wrote:
> In preparation of adding H264 decode functionality, add probe and remove
> functions and platform data to initialize iris resources, which are
> clocks, interconnects, power domains, reset clocks, and clock
> frequencies used for iris hardware.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/Kconfig                |   1 +
>   drivers/media/platform/qcom/Makefile               |   1 +
>   drivers/media/platform/qcom/iris/Kconfig           |   9 +
>   drivers/media/platform/qcom/iris/Makefile          |   4 +
>   drivers/media/platform/qcom/iris/iris_core.h       |  54 +++++
>   .../platform/qcom/iris/iris_platform_common.h      |  35 +++
>   .../platform/qcom/iris/iris_platform_sm8550.c      |  37 ++++
>   drivers/media/platform/qcom/iris/iris_probe.c      | 237 +++++++++++++++++++++
>   8 files changed, 378 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/Kconfig b/drivers/media/platform/qcom/Kconfig
> index cc5799b9ea00..4f4d3a68e6e5 100644
> --- a/drivers/media/platform/qcom/Kconfig
> +++ b/drivers/media/platform/qcom/Kconfig
> @@ -3,4 +3,5 @@
>   comment "Qualcomm media platform drivers"
>   
>   source "drivers/media/platform/qcom/camss/Kconfig"
> +source "drivers/media/platform/qcom/iris/Kconfig"
>   source "drivers/media/platform/qcom/venus/Kconfig"
> diff --git a/drivers/media/platform/qcom/Makefile b/drivers/media/platform/qcom/Makefile
> index 4f055c396e04..ea2221a202c0 100644
> --- a/drivers/media/platform/qcom/Makefile
> +++ b/drivers/media/platform/qcom/Makefile
> @@ -1,3 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   obj-y += camss/
> +obj-y += iris/
>   obj-y += venus/
> diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
> new file mode 100644
> index 000000000000..34a2f81c5db3
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/Kconfig
> @@ -0,0 +1,9 @@
> +config VIDEO_QCOM_IRIS
> +        tristate "Qualcomm iris V4L2 decoder driver"
> +        depends on VIDEO_DEV
> +        depends on ARCH_QCOM || COMPILE_TEST
> +        help
> +          This is a V4L2 driver for Qualcomm iris video accelerator
> +          hardware. It accelerates decoding operations on various
> +          Qualcomm SoCs.
> +          To compile this driver as a module choose m here.
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> new file mode 100644
> index 000000000000..7e701361492e
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -0,0 +1,4 @@
> +iris-objs += iris_platform_sm8550.o \
> +             iris_probe.o \
> +
> +obj-$(CONFIG_VIDEO_QCOM_IRIS) += iris.o
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> new file mode 100644
> index 000000000000..dd0e2650641a
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _IRIS_CORE_H_
> +#define _IRIS_CORE_H_

Its more usual to do two underscores __LIKE_SO__

Once amended.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Please remember to similarly update other headers in your series.

---
bod

