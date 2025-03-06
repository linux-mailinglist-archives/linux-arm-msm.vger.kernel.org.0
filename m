Return-Path: <linux-arm-msm+bounces-50526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E67EA54CB5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 14:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A534F18985E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613951311AC;
	Thu,  6 Mar 2025 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HRxndDxA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5370B13A41F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 13:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741269425; cv=none; b=HWEE4u23OSIUddCLq7mGbRu4+SI9mDydJPcMrtI4fD7K//cV39UZ+ddSr8kMxIZCxuMKoNGAENIg6f59/z5UwNBQF47t67QPCNJ/rUhsn8w2dUH46Vuo1CEgenNhrlc+f6DhdeyF41t+F8+uPMoca6IxRcSfkoGCR75Pulan3HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741269425; c=relaxed/simple;
	bh=7RTnsZun/Ct1eIi+a3nDzPQbKuuYOXoumaGAJVgDgxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5v4fxBOgBh3ua5vMkaNraRNSzRYmNEvjvoIiUV8sja0eESdFvKfGFBgrZew7sNG9Ia3MqU82olb0lL1Ys2EGKykhIbla23egLTZA7YPiZxNhDJHEpnpG8UNxfBYqKoBDuaGW2IGy+r1kpDt1GM+wNSXippDDFtQNs712WbG/R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HRxndDxA; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bdc57deb2so385495e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 05:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741269421; x=1741874221; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JMSmI6UnnPMHCGXloj5KDBe8CQV2f15FtgYMVwLTLoA=;
        b=HRxndDxA9LAQLeGFFmbwtUWfnuI9S+2OS+knSLct7C2RYI+RTQugjZGRnRLgxQBOs+
         LZ6OqmSWh6UMITMptghz+5wyokcKZ6kqsOukFxTJc1yy0w5ioFNisaTEi3+0wlr0/okm
         URGfE4LRpOMarpxoCw9w1+QOgaZ2cVINe5Lfbdq4B1MrMOobhMh4jhviyV1S8z6zy0RM
         h+u8aTNHLzy24r9k1gNVgAH89gie9mGCElaOJltc2fYO0XDRIUB9lb5haG2lJGVwdQl/
         KYBjqvkyuKhLbPzbNSpbTdK8LMdOhTITWzYbfTWOQnEpvgsYbruz4JLI34TdR4VVeMOb
         3ywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741269421; x=1741874221;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMSmI6UnnPMHCGXloj5KDBe8CQV2f15FtgYMVwLTLoA=;
        b=uLD755N6xAp9YIJ6wPYoZps/j4Hy/YIPlUwhHOMIsXwVFmtETndghHfRG2GljnYMOI
         je9xKpxrDNsdDH6iwkaJOWv/xmHEmle07jUEc7UOE3wYGsH4rUoVQREpKp5JBv7gH615
         H8j30rmAcviYO8P8WETxHTRubtof3yCXjhH+zoYf+5xHGnEsRJbQADJ/FoYZlNb+Ickv
         Y8XYY7x8T0YE8KTuNeSnurBbMo6eoMAxeGrLhF/3ZKAxg6o/dhghMoNwwoqehW3RKQ2n
         KqJelSZg4Y96x6e5vWYhu8ZLftHIIazx5ip7M64UQuK10lLIwyMvUYVu0aWmFU0192z+
         tVoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUetyG7Mh7tvU51kdfT7VxdsOMFuB62zTEdGqi+hTESxuaI9XjiA0KqYrSEHCGxzEb7HB7M+hTyD1WnKcz6@vger.kernel.org
X-Gm-Message-State: AOJu0YzlUbh0nRJUNB/3PdDz6/Te42Xi0WYTl5BivCRMWPAUzH51CoH6
	ZrytIkl/TfsndJLDWHnoZ6gtgU4pgulwgWfd1/Zu8HxNpTXNwskRNYET50XKaJioMtNv2Lig0XA
	CkVU=
X-Gm-Gg: ASbGncv3IVXUBlnqgZxrLrxd+X7jWkysQYADaK+b+SX/nxFRWkql3JhKQv/g0QpgE8v
	XhX0HAd3NkWPB8g+bNhB2yb6+Ql3D3li8cMTG8yZEPWNdbO6X+wXBaMkCGPqIzWmbHtYKWAeAPA
	pJNlZEfbFKe7FUDzbL52fJCLdeN89/y1cdRp91HoTIBo8j7GIK8KAL8Ll4CnnISIyGq68KvlCg6
	/9e4BPs1NDStEiCfflshBtWKFUSgmBnTosOlAMV9ENAGGr5VDGQTkhFEvYEeSahnnn81whKTyYa
	WNKbirKWYopUTnegCLEBNzr+87l0/Ll7KDlLH2BPQ5lm4pty3QRI3rQUNV8mJG/y
X-Google-Smtp-Source: AGHT+IGKoIWERmRZLpXPe3ACW8OFb4dKT5FNFud4DpgTslSuPl/lMilNfu3dw1ADEPZxCq7k4yM0UQ==
X-Received: by 2002:a5d:5f4d:0:b0:38f:27d3:1b44 with SMTP id ffacd0b85a97d-3911f72682bmr2278419f8f.2.1741269421609;
        Thu, 06 Mar 2025 05:57:01 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912c103f57sm2132800f8f.91.2025.03.06.05.56.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 05:57:00 -0800 (PST)
Message-ID: <602b8bcf-f120-4cb3-871b-adf852a24963@linaro.org>
Date: Thu, 6 Mar 2025 14:56:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] ASoC: q6apm: fix under runs and fragment sizes
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, johan+linaro@kernel.org
References: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250304105723.10579-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/03/2025 11:57, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> On Qualcomm Audioreach setup, some of the audio artifacts are seen in
> both recording and playback. These patches fix issues by
> 1. Adjusting the fragment size that dsp can service.
> 2. schedule available playback buffers in time for dsp to not hit under runs 
> 3. remove some of the manual calculations done to get hardware pointer.
> 
> With these patches, am able to see Audio quality improvements.
> 
> Any testing would be appreciated.

Worked well for my pipewire setup on T14s and X1E8100 CRD.

Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

