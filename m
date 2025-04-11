Return-Path: <linux-arm-msm+bounces-54039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33992A86205
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 17:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC0A89C2E7D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 15:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D6E2367B3;
	Fri, 11 Apr 2025 15:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ELid6Wuq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3523420E00B
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 15:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744385756; cv=none; b=lQFFpugGHal+F8N9zuM03uficnq6y4+bnO3f/Mu3GOyCvhSGv0aDVMROcFV3pSQR2GhHnzsCi0x1XkIY4ZF+tvUDgWTRGLnxDdlOOT98oUjlBz5c6HH741p9X183DO0oFKFlD/t7G1xQL+mvkyDz0Aqg9mrkrYd72hGBs4sholk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744385756; c=relaxed/simple;
	bh=6LB6UCvlvFB88/s52rhCdovokxut7cMvdT7ZY8sl8No=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hgSo+QXWXdEtoDWcijNkPg4wUg4mtibnwXJ+7tT7QDiKDQaLDgZaBfZ4DfqCbRH6cHe8iyzb6sFo1qwdx53yA3ad4nyzvwvnKMVO8yGOCD3vV9yFdhsBUT1XUqTz/D6AvJYkamdyvXcZJDLazai+UMZ2HEdQbQpyThfi43HG8JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ELid6Wuq; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d0782d787so14599045e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744385752; x=1744990552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lKaim36rDlvvtzFLUyngfIkva1VGFiay+NKjck/e1UY=;
        b=ELid6WuqVpzoSmdTe8TeCuUfLCwqeyaPVjOGUrqXrtuMISuJ3gVcmeVVpZf6CVEwRX
         PdS75Y6cfGDgsbm4KUPG/AIlvsekxZx34vvziUJLItkVZNoHEWyszbx4mGWaWq1n9cKx
         hh5TeFytuitcrlkTgTIOv084nX1w63EOhkuhGU2i9c2kZ7ZR4RL5sZ/2BxHmztWcZAGA
         PJAmWEpaH6fdjX2TZ3k42hMAnf5lRcUIZKNuJhrFQgpXmRa1QYizSkVWddp92++dDmSu
         lZjwmnkIx5YxxYFyxDBObemY+kAiyCiX0j/av3zeAbIxy3Y1Q3GuEyAb7QgNJD0Y9LaK
         Th5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744385752; x=1744990552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lKaim36rDlvvtzFLUyngfIkva1VGFiay+NKjck/e1UY=;
        b=syKFmrFemaPBn6pT96Bknf4vScfzweWF4Jwz52w4d/QROZdJ00Z2kWFILFlTquWUcW
         UOn1FJQ1NGi6rCL59GMWZqJHgUUYHXqOPJlx08xCKSO5kY+qrJUoRnbB1ZLLl2MI05VA
         Y37uSCuStO8MAS202VnO3WR0cLmXNtb+LWqdH/aBDlWUIbVyyacdsCJHbX8DAt1BJzkm
         Bz6u83dMllfMC8j+LRqMGpqRUbGT/YDkz7V2kvVJ3rFZA46bM1jtv0hE7udYzyc0GQvO
         +68PdsdStyInxVvlrQIFg4oUvaebE6Mq1agCIqdCP+sYmaTEiD3N1Cm5OzyrfMX99ZvR
         MlCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI5pxoQX5P+QqIe2xSVW9NMsbR2GrL4ORJkFTA994pp1YuohUoCEqRdUVovY82ebZxUIeRYfF1Lyp0325w@vger.kernel.org
X-Gm-Message-State: AOJu0YzixIVZydQ+OvDbKg+Z5DtWVr9SZwwD4WvsOt66yVsWTc+Us0/1
	KpoAL+lttaNUhmTjU7M68lGy/Px8C8Z/Q40UvUJAgW3KZzdY5j7kN58DBaSfIrY=
X-Gm-Gg: ASbGncvx0JJInLo5BGX+6bHgMI44YDe0i7Sa9e5XWWY0YyOcwNru8aG1iUbd1nDgTqu
	it5Je5+jgPyfXWMWNOexm0EzC9+tcTVud2oNR8piHy/GYqh1POTC8X91w/H5kaRWJhvdNjlvtyy
	oont+qDLwP8IVuLN/MBvHL8zP77Wq/l2a+caZ7bexus9tqkuSM6bLyUIZpjs+pvQr34bGQG7ugN
	vnWYnyvEkr8X9Os8D/1+RJIxICdGIjAOArrE26x2kKucOlcIvFH5RHR0cbhgOl3vilEKX+Dcb4D
	9gBX5yqJYtL4wGIoOlgPGcsdcvpWcTfLfFFTQIoitd9/T234O5SKGsaAxvqMEUA2CGSvkKTedAM
	4KVCwqQ==
X-Google-Smtp-Source: AGHT+IHmLcfEt77kvPXMcWI46glOKuB81jeyuxsGo88GhaNrmPMx+9rHhUkY2slNl4+xQtTbU1h8iQ==
X-Received: by 2002:a05:600c:83c6:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-43f3a7db13dmr34023905e9.0.1744385752462;
        Fri, 11 Apr 2025 08:35:52 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2338d757sm87044235e9.5.2025.04.11.08.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 08:35:52 -0700 (PDT)
Message-ID: <c1be38a9-1e3b-4e26-be4b-f4fde93468c5@linaro.org>
Date: Fri, 11 Apr 2025 16:35:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v5 0/8] media: qcom: iris: re-organize catalog & add
 support for SM8650
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <sSGjuqPKGTjE9al-J0RHMuA3Rk7hIh9x9RMWNefg93pJOOacQodM38LE11xl4vmO1I0OgSZFYR2sblISUxkPeg==@protonmail.internalid>
 <20250410-topic-sm8x50-upstream-iris-catalog-v5-0-44a431574c25@linaro.org>
 <X6Bg8c3Qrw5uxgOgENJL1NcyPhC6JJ-KaiGVeEk_iuzjE0TFgp4ZREnObm2n9DVQGANSurRREkp0AiqERQgU4g==@protonmail.internalid>
 <fa6ab24d-80ea-42f0-b764-b8596e6b724d@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <fa6ab24d-80ea-42f0-b764-b8596e6b724d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/04/2025 12:55, Bryan O'Donoghue wrote:
> On 10/04/2025 17:29, Neil Armstrong wrote:
>> Re-organize the platform support core into a gen1 catalog C file
>> declaring common platform structure and include platform headers
>> containing platform specific entries and iris_platform_data
>> structure.
>>
>> The goal is to share most of the structure while having
>> clear and separate per-SoC catalog files.
>>
>> The organization is based on the curent drm/msm dpu1 catalog
>> entries.
>>
>> Add support for the IRIS accelerator for the SM8650
>> platform, which uses the iris33 hardware.
>>
>> The vpu33 requires a different reset & poweroff sequence
>> in order to properly get out of runtime suspend.
>>
>> Follow-up of [1]:
>> https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org/
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> Changes in v4:
>> - Reorganized into catalog, rebased sm8650 support on top
>> - Link to v4: https://lore.kernel.org/all/20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org
>>
>> Changes in v4:
>> - collected tags
>> - un-split power_off in vpu3x
>> - removed useless function defines
>> - added back vpu3x disappeared rename commit
>> - Link to v3: https://lore.kernel.org/r/20250407-topic-sm8x50-iris-v10-v3-0-63569f6d04aa@linaro.org
>>
>> Changes in v3:
>> - Collected review tags
>> - Removed bulky reset_controller ops
>> - Removed iris_vpu_power_off_controller split
>> - Link to v2: https://lore.kernel.org/r/20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org
>>
>> Changes in v2:
>> - Collected bindings review
>> - Reworked rest handling by adding a secondary optional table to be used by controller poweroff
>> - Reworked power_off_controller to be reused and extended by vpu33 support
>> - Removed useless and unneeded vpu33 init
>> - Moved vpu33 into vpu3x files to reuse code from vpu3
>> - Moved sm8650 data table into sm8550
>> - Link to v1: https://lore.kernel.org/r/20250225-topic-sm8x50-iris-v10-v1-0-128ef05d9665@linaro.org
>>
>> ---
>> Neil Armstrong (8):
>>         media: qcom: iris: move sm8250 to gen1 catalog
>>         media: qcom: iris: move sm8550 to gen2 catalog
>>         dt-bindings: media: qcom,sm8550-iris: document SM8650 IRIS accelerator
>>         media: platform: qcom/iris: add power_off_controller to vpu_ops
>>         media: platform: qcom/iris: introduce optional controller_rst_tbl
>>         media: platform: qcom/iris: rename iris_vpu3 to iris_vpu3x
>>         media: platform: qcom/iris: add support for vpu33
>>         media: platform: qcom/iris: add sm8650 support
>>
>>    .../bindings/media/qcom,sm8550-iris.yaml           |  33 ++-
>>    drivers/media/platform/qcom/iris/Makefile          |   6 +-
>>    .../media/platform/qcom/iris/iris_catalog_gen1.c   |  83 +++++++
>>    ...{iris_platform_sm8550.c => iris_catalog_gen2.c} |  85 +------
>>    ...ris_platform_sm8250.c => iris_catalog_sm8250.h} |  80 +-----
>>    .../media/platform/qcom/iris/iris_catalog_sm8550.h |  91 +++++++
>>    .../media/platform/qcom/iris/iris_catalog_sm8650.h |  68 +++++
>>    drivers/media/platform/qcom/iris/iris_core.h       |   1 +
>>    .../platform/qcom/iris/iris_platform_common.h      |   3 +
>>    drivers/media/platform/qcom/iris/iris_probe.c      |  43 +++-
>>    drivers/media/platform/qcom/iris/iris_vpu2.c       |   1 +
>>    drivers/media/platform/qcom/iris/iris_vpu3.c       | 122 ---------
>>    drivers/media/platform/qcom/iris/iris_vpu3x.c      | 275 +++++++++++++++++++++
>>    drivers/media/platform/qcom/iris/iris_vpu_common.c |   4 +-
>>    drivers/media/platform/qcom/iris/iris_vpu_common.h |   3 +
>>    15 files changed, 598 insertions(+), 300 deletions(-)
>> ---
>> base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
>> change-id: 20250410-topic-sm8x50-upstream-iris-catalog-3e2e4a033d6f
>>
>> Best regards,
>> --
>> Neil Armstrong <neil.armstrong@linaro.org>
>>
>>
> 
> Please fixup this
> 
> 0007-media-platform-qcom-iris-add-support-for-vpu33.patch has no obvious
> style problems and is ready for submission.
> 0007-media-platform-qcom-iris-add-support-for-vpu33.patch:7: slighly ==>
> slightly
> 
> also accounting for my comments in patches #1 and #2 you can add for the
> series
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 

There's an update to the yaml you need to account for now.

https://gitlab.freedesktop.org/linux-media/users/bodonoghue/-/blob/next/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml?ref_type=heads#L25

---
bod

