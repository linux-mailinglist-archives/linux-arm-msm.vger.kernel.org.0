Return-Path: <linux-arm-msm+bounces-78346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B5730BFCB2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 16:54:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B9624FB662
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 14:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1D234C136;
	Wed, 22 Oct 2025 14:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nJwrqEJF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9B934BA2F
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 14:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144703; cv=none; b=g2hpuQm/XLJcxMSgvTK0//TGWG6ByvkmlB4JIRn0vcy92mGsi0WgRjScjDOygDJ+88piiPAAZKvgJbYt1nCad3/uVJmFBiV6Aa+rM/M8RYZozLOhvfyuEBSrtBpi48HVcHAG3l1S1wUO4g7E3eSipO6GggvIN30M4jhfvUNKm6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144703; c=relaxed/simple;
	bh=+lNmP55ZvOzuboNbO6AIVCl9ja7et+pSFN7b3PWR5y8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PusSAS++E2gjKSJnd+GaJqrw0OzbVJRmIY4mqOIw1Mf1SVl+65UKuzo91Ma1em5XQbKx3siaHZq1VunwxCiBZgsteXSNSMKPKq+aalpwPIuro+RLsnAeClkc/UQqAMldApuoQlKJhHl67fC0faxSmlDACqNoeMqWbVYLq0cK3Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nJwrqEJF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47109187c32so32692665e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761144700; x=1761749500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E9yHRG4JI34JOJGAAS4v922SyM9JvWMCsMtr/NEHzv4=;
        b=nJwrqEJFfgmVd1xfG3+yEqcERLAYqQqP7g+emT+JGXxxT0JsxR4pjYAb/5FeuBoycz
         3tE4G4T5IqH1tV5ExrhfjZZhI83G8R6LDsGm8hjvMXKHjO8m2qV4r01SCkVwUvgCNka1
         WI6rhCeYbucijaGAYMrWo32Ub6ZYMkDEnbfL6wqQtDRpiXuG0t99EQigE+q6+yl6XuqT
         M6nVb1z6i3mDqELqkBNRJIonBSVYvRCgTSbV2tMIIUwMMPd+zizVmIxbnnDZICCepPb7
         yu3c4dpgEzCf9b/C7Z06K2RwGPY0tkGOc9O+mWWOx1Yf+Fvd9Wf/ueabd4IcxWsO3DxB
         UFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761144700; x=1761749500;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E9yHRG4JI34JOJGAAS4v922SyM9JvWMCsMtr/NEHzv4=;
        b=TYj5b+h9bQ3BvKLd0IgY1XxQLcG5/33VzoTx+spvXfjFYAV/FIff39Dg65H3mmI4s9
         PbJXGMwJeEaNCB9ZdS28DPnuGZIVVJo5EJ7Vy1RmggNcJyRs+FYnCvl/nTQ5nSBd6tUY
         QhJuOfwfRD9j+/wNfQD9UKigyJvXjuG0Wm2gHNazEuY5tY15DVAwiYRjNmmYo+g2kDb2
         NAq0R/iF8wRbe2JUbEAwLZ8wS9DXNODFCNUZMqk1TELI5kHcPXvpV/Ghlxqwmcdr1NW7
         CLmDbiVkU6FwVYnH2a+XJg9z1qvIwDEqBGRB81VDPkqx6dA6vrdFq+BIMTGzyIjyC5/i
         yXXw==
X-Forwarded-Encrypted: i=1; AJvYcCXd0h4+h2SKq8yRwygHUU9ah1maME4l2gFURTVhB0puEExW6l78X0rVxXkKqNHKUXhsrFK6OeWfnOggxx3w@vger.kernel.org
X-Gm-Message-State: AOJu0YxlaJUo2MSQQ2gqk7I1pa5+bXfAGnz1e819SE3Z0OIUR7qH8bWR
	ukMFCs37c1I8aw4Z7aQrmIukrcqa2Zi5XEwqUB+U9EHyNayT9MV6lxniT2jrd7dRsLY2WuYEemv
	qgfFf
X-Gm-Gg: ASbGncsjOcZf/vohorvWIbF7u2WMnegU/N4TiGPAyNHW1FdxAVqQu8+tQqBI46sPW8F
	Do/Z8O1k3bqNVN9qClt8KYx0eHmGRQI3Ca4w+TSMHg/p+yxMa2IPLmw2zDiZSEcGD+GK9Qn+y3n
	HxG93GtLh96QaFnkkkQgymrCgAMbmrYlW9ex3tKm1pFrlaA2ryyEbCjR26ZKeYMswQeN7trDnye
	iLe4QqzruHnGMrBz2hqdhytvg+uPVhvN8eqR9ZEKPu37GfXEMjD0d60pAHjjomU9391Y4XsowSk
	f/0FfKsrDgEy9QgFIjGacA0rVuczH78e1YbEeJossa2ftsXZqvN7NCTTws5xl08KV5GhW/+CeJZ
	15FY+kTJJprouA2AS1mEtH4/yh7KRfnAtp+k+UoPdgroPdGtSKR8lVgnrn04oy2LRaMosgDI2q7
	vapfogtVOb0nvZ9VvNjR0S+iGbSfpPASpwYqHLtF3Bx06+Bsz/9Hl2
X-Google-Smtp-Source: AGHT+IFN6BO2X6wxeB5Z3DkFGrzuZyz4TUKDb57huKKbsjsVDAwxVSn99GksYUGwPErkTVppl8SPxw==
X-Received: by 2002:a05:600c:3b8d:b0:45d:f81d:eae7 with SMTP id 5b1f17b1804b1-471179176b9mr179678425e9.28.1761144699894;
        Wed, 22 Oct 2025 07:51:39 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42d828asm48802225e9.17.2025.10.22.07.51.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 07:51:39 -0700 (PDT)
Message-ID: <bf23808a-4f49-47b6-ba13-1200d4b4c0dc@linaro.org>
Date: Wed, 22 Oct 2025 15:51:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <20251017-knp_video-v2-1-f568ce1a4be3@oss.qualcomm.com>
 <c9d8f76a-513f-4a09-bba4-cb8f0df1d2fe@kernel.org>
 <034bf6f4-0a49-4973-8536-28526b3409d1@oss.qualcomm.com>
 <d19b1279-3031-43b9-ac73-7e5f990802ed@kernel.org>
 <e1bfadd4-2d53-1953-beef-1350594c5010@oss.qualcomm.com>
 <miU0eB2Bl_rKVzJMoTPUR2-GweFHwQntP9c8-zLL57CgPPMD3ZEZm3_X61Q9Oao6tZMS4ypn2FsCfdAuauKuhA==@protonmail.internalid>
 <mtlwpa3m46qwrfjcpa7wapjjnllxopoip4mpnomw2ngteb6btf@2z4hrjr74bts>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <mtlwpa3m46qwrfjcpa7wapjjnllxopoip4mpnomw2ngteb6btf@2z4hrjr74bts>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/10/2025 10:37, Dmitry Baryshkov wrote:
>> EL2 DTS for kaanapali is not yet posted to handle secure SIDs. While it is in
>> development, describing the secure stream-ids would ensure to cover all the
>> hardware generated IDs.
> EL2 is a slightly different topic, it most likely requires additional
> changes, etc. I'd suggest focusing on a normal usecase first and getting
> the EL2 sorted out separately.

Is the conversion to EL2 only for compute then, Kanaapali is a gunyah 
system - Linux running @ EL1 here ?

---
bod

