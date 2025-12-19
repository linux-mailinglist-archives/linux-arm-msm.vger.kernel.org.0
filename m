Return-Path: <linux-arm-msm+bounces-85974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD846CD1A27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 20:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C9E23020C53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 19:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054E434028F;
	Fri, 19 Dec 2025 19:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgqvxHys"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D811033D6FB
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766172427; cv=none; b=QVzf3rbpUNDX2mrZ1o1dMiG7+l/MXXHI9w7PbQLv1F/WJOS3Bdtkhg35BTwizWUjzy/Qin6DMu10DYQGk25kraKSt92reGj9lUAvJp2C0eeeCWaEeoSjOHO8ni7mAOk8cWBmv4ljO25auYYTQm9NT/ecygTHBgWvJXElhVDgz+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766172427; c=relaxed/simple;
	bh=k8mZy/7yVU2Ufqg1SNQ09M+d2/3IpCiWvdHzzLcqN/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A+NxROo+J1EHwt0k/GxNeU4DMbU6Fjj7uj/06pTz4DAz8LhbgBHAAP/Kqw0JEsVc7Adqb1AKkk49aF5ajnsFxTIT1m+Y5OwzAWgrZOL4OkoKmjqj3JbU2DHiBMRg6kkBTzCi11UU7uxHXlbxFvUV9WKqwPtvRiiBxtikO/a8+FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgqvxHys; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477563e28a3so13981195e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766172424; x=1766777224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kxkkJnPi9GBxxRfQSUamkMaS41d/etdoL+kweUhQKE=;
        b=dgqvxHyscE8x5odAA7E78z5K7MNsroQg+/L9I/uZ9yWC24/bjxq70etDClDf4FCLk0
         qqmhy6JyjnLKZIijjALs5CzjUtBa+pLkMJQMsYNfThiW62tD5qNoA5Teikg+IJxRPqbC
         jnrKPFHjSq5LC/ybxe2LpyzD5y0RCfyN4I5OimlmV1CI8SGKDjW9qCf3yMjbngP1mQPV
         DeAt3Lr0DPx0FVjBkFX33r38fLqrVCAqyTzKXp9TN5bs/Pg84iKaqrvJ3yY7oi5vBbZL
         tHX9lXv9XBFe+ycMNpP4oBPbjRB/cW7pqxKnFRyunBYAcGcNZnL5W1FocrqVwvbkdfd7
         uHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766172424; x=1766777224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kxkkJnPi9GBxxRfQSUamkMaS41d/etdoL+kweUhQKE=;
        b=bN2ypF37SzaHbON77SGSKMogxHCbD9xKzPQJUWZF5wf2pgIOx4wirs9/8eHoKpzYI1
         GvvccQdGNCsQ6hTc/zpcGD/K8dgz0c3EFKc1bVuWx5D/dkWWImGAlgA1i6c5CjA1dBXN
         QUdCjIxQPs2UthosKuCUAMRCPoWpWLMaHAAMkYCsdqqJyOdn0DSc2u8STYEWryjnO1Oi
         hojN1XjO7OudMQhONimh5Ayfm6SpcWC3jaBZl/ITOQs05LcLvLzirQe8GzwrgbNDdAgh
         bnoWem+AG6FIGNfaMWys2S3REqzCIurTk6ZfA56agQptxNmBw7HYmGovxzyVsc3mvbND
         9glQ==
X-Gm-Message-State: AOJu0YzAJytzVFxmD/Duq1ortaFLG7Ovm4IZf11ro1HboEZQ3y1KXljL
	p0AFeYIVDK5Q60TcbrzbYdlmjSUjYrGMeq6kcuQZdVdMu2fz1zSdFFOU
X-Gm-Gg: AY/fxX6eJ067qUYPLBBhwZrMJfn7PRXqyeKKMJJ9lyYHjpqnHK5w4o/tYffZHNi2cnO
	y9M4suvGykFzOx33RQWtdxGRL8f09TdgqywoRq57U55Jxk3QeUbrn4O40FPdaDun5iZTh0khaQ2
	jODxg6iHhVTFoEs8cWIvo3WWBkgxSIUhBvIbiprg/3GAPIy1yJUhUakBnL8H6RU2QzTxo1AIl4K
	mRiu7knDzABM0/v+2dT9WYyzFibpWew7AlkpuQS82/Dws6ecMbL+C4yeTAeFqjh4+kQd3USFHVQ
	+KUW3ORVQKrKXSw3UvieIwLvB4EQyyXOM0gqRZhcGvNNIDRqaeHVhCQPi7f2SOZK5/SQAWFyjcm
	E/yd0ppYWr4ijSmqRLTodnfLXMTfqYo+KlMKahdj5ScCjrrZmVDHL8cn3t0NkL1zKvE2LHv6FRp
	BXJmrnI9Xm5dvhOQycy47fVcOwElLaNeZDSFH5TJtQEFj2DLP/sToZHRGBNXvDLFB1jD7fRn3Km
	D6kD40l
X-Google-Smtp-Source: AGHT+IHqqrUl2vSl0/wNfOnsIYZIIhJ1dpHJbH2MQVzIZ0EaTbpy5rMArQU7ewGjw++aIHXKYVdtyg==
X-Received: by 2002:a05:600c:4f08:b0:475:d9de:952e with SMTP id 5b1f17b1804b1-47d18b83218mr39401345e9.1.1766172423809;
        Fri, 19 Dec 2025 11:27:03 -0800 (PST)
Received: from [192.168.1.10] (92.40.201.212.threembb.co.uk. [92.40.201.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193e329asm57197755e9.15.2025.12.19.11.27.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 11:27:03 -0800 (PST)
Message-ID: <d4a87f75-92a3-4c09-9f9c-e906f0b7ae70@gmail.com>
Date: Fri, 19 Dec 2025 19:27:01 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: Add support for Surface Pro 11
To: Krzysztof Kozlowski <krzk@kernel.org>, jerome.debretagne@gmail.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251218-surface-sp11-for-next-v4-0-7bcf83c1504a@gmail.com>
 <20251218-surface-sp11-for-next-v4-5-7bcf83c1504a@gmail.com>
 <de00f21e-7fc7-4caa-93ec-afbcc5d9e12d@kernel.org>
Content-Language: en-GB
From: Dale Whinham <daleyo@gmail.com>
In-Reply-To: <de00f21e-7fc7-4caa-93ec-afbcc5d9e12d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/12/2025 17:47, Krzysztof Kozlowski wrote:
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> 
> How exactly is this copyrighted by Qualcomm? I don't think Qualcomm ever
> prepared DTS for this, so can you point us to the original work?

As mentioned in the commit message, this device is very similar to 
Microsoft Romulus (Surface Laptop 7).

Its associated device tree (x1e80100-microsoft-romulus.dtsi) was used as 
a starting point for SP11, and so I felt it would be courteous to keep 
the original copyright notice there.

If this isn't appropriate, then that's fair enough and we can remove it.

-- 
Best regards,
Dale

