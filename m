Return-Path: <linux-arm-msm+bounces-10598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE920851144
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 11:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33F301F21F8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Feb 2024 10:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB9A20DDB;
	Mon, 12 Feb 2024 10:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yO+Sw2nG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27C5179B7
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707734574; cv=none; b=rqvlD6nGHW1LPsOhYEvz2ETqiWNCokBm1bN3G7ej4zMTzHVah6Roj4TjD90PYw8VfOFm2x4qhcU/xcbSLZ1UxaOEYfxofEz5sfHd8BYPzdDDtBtqHiwh+Sxz0ZF+YbimdHpsAWHTpHzzr86t5TBZ6ZQTysK7LM1rDA8J5ju+ujs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707734574; c=relaxed/simple;
	bh=Jygs9Q6J8uxw8Ho/Er8Ipal7NjHuxFkoUvaGLn9kKs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmQr71zBXkDQzRH3F6U1eNr2ZjHCWkboYt7xwk3QjAsV1OcghDD4WiRg5WPGVUb8Bfz1HwmMgAIOJvd0aCo1HsUIc3MIC0OHK6Zr15WhPM5WE0BGQnyOz3P9r6LLv+cqlAQS1b8QqnvbzsV5wGMmnhhiGi0AK0Wh/h7FrDMwReA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yO+Sw2nG; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d0e521de4eso20668091fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Feb 2024 02:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707734571; x=1708339371; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=a1oPdZBnKqKSBzao8ZSP9DjSYpKnjrU7QOhn8hTFi48=;
        b=yO+Sw2nGDyhEFBVW9u7bMxzJpXXLv5mOh5XrJHC60hAOQ0doz6P0t0SmzpASL7VNvN
         BlbS/PJCbufkRwY0xJKOhH3Ej4wRBkOrEVPWmDCf0aJwa1ny3/k0ixRfwzbg64urOuv2
         b2wA5f29qkps9FK0xpfSv//CJfSmlsBIg7up284LEZTIb/Ucniv+9XjhzjQ7YVKNDZfO
         QtSunhRuKKcZkLgPheKvsh1YTGEB3kIu81e/Q10BqQQ1Egr2m7xX43f5Q005qJ6kFPP3
         x06mpuhbBVkPLdM9cMNvHJ6aFQNABzlEYtSROc3fHhHV83D+yuN4Ha1sWhqNvCVP4jTR
         aLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707734571; x=1708339371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a1oPdZBnKqKSBzao8ZSP9DjSYpKnjrU7QOhn8hTFi48=;
        b=hBL6IeyAABF+Thi/nAIAZDZsP8Fj8scwtfWfh54z5PjczlDfcZp4dCb9ImeldI4KAy
         UyevK7I5DTwwhPgocK+VOGWbo8gjCTJ8HbKUlIvhrupc2HEbz0rgFQOv2ajLoqolX8rO
         adJR4fmFlqEA3vSZ81W/1LDKaa1R77VnBg4dyIz3Ov5Dx7phyDzBChSnaIfQmjlzpRaI
         2qpuyrfFoMrbm9RSIJOQkhJAIvRFp+8AhnQgVC/MNRfEhl+IVoIyHeCO+ThIvQ3ibxkP
         B+4TPZMqrUKq3PxZ0NANetZjn/tLyB+R6JUzKEE0H/N01wRBM8yGOF/lMtV2neJq+i3I
         Qh7Q==
X-Gm-Message-State: AOJu0YxesnJdJSh9yLYnbwv6k7RMnIf7c58+chLZaIMYY7OWboTxC97b
	xwUwVn28L+1R9EaIetu82w1lfweMFmmDXfoon0NjA5Th3xLPw9xKGB84ntlui38=
X-Google-Smtp-Source: AGHT+IHYHCImbdKOmN4+PmM5r2d3rzw3UZ7jC5CqA3YWWONjsgNMoSk+hmdjz6ntq1RBbyQC/rD/kA==
X-Received: by 2002:a2e:3c19:0:b0:2cf:1977:d098 with SMTP id j25-20020a2e3c19000000b002cf1977d098mr4537778lja.40.1707734570881;
        Mon, 12 Feb 2024 02:42:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUBTv0gERFkitI3tSXtHCI3bqTrIcksSSsOz+rZ1yN2EcT/pwdBkHbrjeYcKgsmPMUMRFANtARb8/Jxs9pyyEt6QNVGNIPbeWf+yCtoH8z9UgBjit9MyaiYhzflbVNSqyk86qMbbiDB36D3R5r67wdCM+QNFUbZ2FujOR7+KS8oWt65idTmzxuOGT0AZsk3o89/OegmKXg+dX8o6cG0TY4l9kI90i2zJ3r69mx/w/vTkHhX7qVR4y7Sg+B5Vjxu+TZHLiHQJJ3r1zSN3kWnhRwZEpLhQ+VDpmsCuAIGH8j+s/IF2OAVz+YSYlr1bc0f5Cun1cy1z0Nl4iQeCByTP7+SnliaPyf3ctctnNSr1VYAr8f0389XCUcL9uQSWfQpUpZ5NAcQvD5RHWC/SQnYwDTTlO0H/at1fBjdw4Oo/WWDuIt0h2QZUddJLDEgx9sbOg35WAP08HKt1heOA88Jip8oRTMNI+npASiH5f6QBkjAT1PsEzbaShSVvMIIL+Q1GhYdMTebdEaKSlWnU5ycAtI0NdNU4TPP8h4JNpIChi4p6dUMBTLhS18xYSow7jCSsHec+vcfE+5+9RWV4SA2b0zbWqfBfsofTT9EHFZkMSlNCN7wX7ufaTzomdk/2rF5hOrHmaRmcNj2rcUz2dUDNBnWYS8ktGAaG2x/NIRuulWajhYwShWHsPvJOYm0gbCB50yGrVcwY2fVcPIXF3Hx5hJy8EX+QCWL0FZfP7zUzLkpEepDhZjF4sR9ecFJ+/kY6zF8LIUhzVKm1HIBwmoxlZujxgQ22csDqF/JZVLZQaOq0WmOdolfd1LKEBge
Received: from [192.168.192.135] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id i25-20020a170906a29900b00a3600d7c2fbsm70567ejz.176.2024.02.12.02.42.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 02:42:50 -0800 (PST)
Message-ID: <1a7d7283-1437-46f5-8983-bd551f5a9801@linaro.org>
Date: Mon, 12 Feb 2024 11:42:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display/msm/gmu: Document Adreno 750 GMU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev
References: <20240212-topic-sm8650-gpu-v1-0-708a40b747b5@linaro.org>
 <20240212-topic-sm8650-gpu-v1-1-708a40b747b5@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240212-topic-sm8650-gpu-v1-1-708a40b747b5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2024 11:37, Neil Armstrong wrote:
> Document the Adreno 750 GMU found on the SM8650 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

