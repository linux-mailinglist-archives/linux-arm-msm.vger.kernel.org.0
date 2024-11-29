Return-Path: <linux-arm-msm+bounces-39575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9B89DC2F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 12:41:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDDC9B211FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 11:41:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEDE199FDC;
	Fri, 29 Nov 2024 11:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UT0n/lxz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224A2199949
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732880499; cv=none; b=SXG71PGDtVtFBMTTvak9v+FCr2ahvX7wR5LKMQuIly51PKga3GKqwgtxsGopnX6qfLt8TnfvUfsDNE17zFBuVeqPI9IsKzJwo2ISgT9IR7ZWPDH5GB/F7RHwoSItVPgRFQ76N6QNJhe6TmqCaHynon/ZCjS7sG0RLwh9TnwrPeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732880499; c=relaxed/simple;
	bh=QOYcGKD6GkoOWI2THd9QW/QAO9FbQ/mMjfRQ927Bf6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k5LAeccjymmTp7N9aTKBdx+Edsn1TAyYwM+cgPfViXibMc/M1/iCi8eqnEB1+SpgzsCY2O9RpjdYbS7yquyDWz3ZQ9Cj5ReytJPCFeVIPFLz6EaSDOGjHWHtG9rIMA1KJ7Yc60FzF+qURpaIn37BYy6L+lWuFKrZy9jixVMBrQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UT0n/lxz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-434a742481aso16087195e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Nov 2024 03:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732880496; x=1733485296; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3sMy5emdErSKL+MyeTW7qsU/fxRK/CVygOjCkn7jTE=;
        b=UT0n/lxzLylHtKILENkkGWQQbVbpjsHeDav6FntpOUMYGwhmraqKHosRzXfprevPPU
         HHXLRWChR2zwCwFXZBnNrgSyeIMOA4eAmTPA3iNVThzpHHIqa5nmULD5f68Nwx9eZzgK
         HjKd/WoAELshJB+X3/LMdeNPceq7hoJXRM8uaTZHqBzlth3Tn+/9crdfTQ/Ja1POoapO
         EphCG5CaLoICHzBgjfRhGnuob+WTpJ+69K/N6atuuLvd+aRvZXZsHNjOFyzzOxNzBszj
         Nkkk7RlBk0yepxoG8DfGnGVT/VDn6jkS0lj1G0/3hSyyaKbBQ7hES7WkDZ3KDRTlcX+e
         oN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732880496; x=1733485296;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3sMy5emdErSKL+MyeTW7qsU/fxRK/CVygOjCkn7jTE=;
        b=CrLDtt8tq3UffE2KZzFuY+z0UA9CMLdsK4FQSbj3F4FpMQUAw393WwjY10N4ofOXHI
         qznzultyCa7+DAeE7Ygp3rmQ2BLMsxWhgBWDtGUjWCc63un9f33fKgG5zkoqukGyUq3V
         9rTP4mqGOwBwI9EboqcbvdBOIzsyMch/R7K8uJIdQuxUhb/JaUW2uf+viQ+uhJE6l0eq
         Y+bWmSoHWYdQ+LrRbgiVet/xiN3WhsFvdza4F5Q6uU82IVEpMPcfaQkqS5w3o/zR5miG
         g6JKBmW0mSdeNFyUfbEGaqQzgNL1Ma6eTAGWnfJmgLeDs0ZLMueNiTyrKzT6cuwJVEBW
         jmPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLEFMxJ+3lLHqAH3Stn3vo/21s3FbxShENADHRreHYUfobxVKwDpR0WE7o3SrjtXd6MdYeGkPNzLjQ659+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8bIeNJqIeKEiTwh0nJUdAc+bqKw7EtVfO2GA9q8K/NumJNzJt
	BvYl4YeWOPwS5HTFHm0nK53yLtbzGt5sP9bKzYQt59tXGVFQStgJpXvIR418pBg=
X-Gm-Gg: ASbGnctj2QOIb4LTBpErdlLGQR0fUfyKD6dHhC73GNV5gM0UwElVXpGvaK1KsEglXJj
	/iMtf0UnHaUnmTEQYHNtL3pv3a9TkdlZ1bLwIKorC/MRXCzCLsddfYjk38xHkldR1YSp8jZNZyI
	OT+8fjEfGwBk/aAmuNXxyW3dpTZjhbCtQTfVt/qm7jkBtsdSDqgcWKQPaF1M/GtVxosONnTFaiI
	AWIxCGTMsBc0hvKI9eBSXjbD9kXLtIK9vbugpWPldYP4Dxto7/w7r9NUwK9Z+g=
X-Google-Smtp-Source: AGHT+IEbk/N6DuDN+SePwKbHpNWgQVLPGKHhlT6DQsr1Hm/lrxlr4iXWaEC1n8sXgOSEQjeYKa4T9A==
X-Received: by 2002:a05:600c:314a:b0:434:a902:415b with SMTP id 5b1f17b1804b1-434a9dc3c69mr122172135e9.10.1732880496450;
        Fri, 29 Nov 2024 03:41:36 -0800 (PST)
Received: from [192.168.0.31] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa74f05asm81159195e9.1.2024.11.29.03.41.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 03:41:36 -0800 (PST)
Message-ID: <4c5acbd2-efb1-4d7a-b948-91d800c1c113@linaro.org>
Date: Fri, 29 Nov 2024 11:41:34 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: venus: Add support for static video
 encoder/decoder declarations
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 quic_dikshita@quicinc.com, konradybcio@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, devicetree@vger.kernel.org
References: <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-0-99c16f266b46@linaro.org>
 <20241127-media-staging-24-11-25-rb3-hw-compat-string-v1-1-99c16f266b46@linaro.org>
 <7d344377-f1cf-400e-a9c4-442123dcf4ab@oss.qualcomm.com>
 <95ec73c9-da38-4888-9e00-4458b5a7661c@linaro.org>
 <f88dbe6d-ceac-4fb3-83ad-f202a4703003@linaro.org>
 <6d3ed1e8-7294-4927-9aac-daffe6ffef37@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6d3ed1e8-7294-4927-9aac-daffe6ffef37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/11/2024 11:23, Konrad Dybcio wrote:
> We can just keep a small function to grab these and assign as if they
> were specified under the root node (check if video-encoder/video-decoder
> both exist, grab the clocks for respective cores and continue normally).

Can do .. IMO this solution is simpler, less code and less risk of 
introducing upstream bugs.

I'll leave it up to Vikash and Stan what solution they want.

---
bod

