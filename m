Return-Path: <linux-arm-msm+bounces-46518-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB6CA21F9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 15:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8ACE7A04A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 14:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCF9191F95;
	Wed, 29 Jan 2025 14:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBeWAfYP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01EC9DDCD
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738162201; cv=none; b=WGMu8WeWuLZVbm5OsleWIA+OvnFERGkViYYoINM28UltP3ZyOKGhlbpaCtcXyPVEcbnnb3AytKwJImKYbaoipy0sDS647l/dKf3i12EjYcZfAgyx5YSjDZhJBrdPw5OjmZFa57HvZvg0R4JAxWm5KRr9ijSJqyi13Ma29G/6hT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738162201; c=relaxed/simple;
	bh=lLLcH3XazQrtZsg1ZCyMplitTfwlmomyxcM2IHoUijs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bauuOPbMlXhYr4gvCZpOzLmtVBMQqeBVlf5c87kqknUY8OVg9WzSJheGtor0S55G9Qsz8li9cVKvRgqVVgk1jKxX+0PASBEVaiKXRu+y/o01DDyAdfVhzHTMllFnte8kF/t/UMLsogkEEqvISffwgKXm0ydeO2GcAwOcCx6YGdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBeWAfYP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43616c12d72so10626165e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 06:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738162198; x=1738766998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V/n482OJOD7YjQStqqcw/7H8YB/93aB4xiCe5kU4AIA=;
        b=IBeWAfYPDCnbTHkONQrQZNxqzvQCNZRd1DuyifX1ZNLukhxU3EhF55g/860LT5a8WS
         yjd/Qe6OUVHq9vxj87EpLY85ddb/+gAGO0vkh4ZBUmGXbrji+fRQtPH3LpipxQu3DDgB
         xhzOFUozJIQdVdkgrjByyvWyhnBpv7KwOvs+d5b7MZgt+PZJLHEgI+pyDebIJUdP1d1P
         DdXHyhlVfPZjWF/O/Yt2Moe9P1CywCZ3IU+IusWuNh4ksruXDPYv3xk+GHOeZHyJfawp
         I/IBll/VIRU5Jufgtp/bL+5evr6wumZRKGUSHFu49ZAM+RvYgPZanGWyircc9PHkAJyV
         AFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162198; x=1738766998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/n482OJOD7YjQStqqcw/7H8YB/93aB4xiCe5kU4AIA=;
        b=maZNyKyr73vwJL+4MN1lRs2j/eT3OFM1K9STkOEnjbN4LzGXCs8yVevLSWaVdz+nLG
         HQ7S+xI+gtx05tKU4u+OCb9sxI2afDRQx+W6Umpk9syORpC89vod91zKYjX86/h6psJV
         MY2KimzT/6JVsKmTGSDDNaRAUcYDU7K+D2EEq2Pd1kebuQ/Qn0/i0M9EwRepK4Z6inJ2
         LvZ8sy/L1iGp9GfR1JQN3XLCcAIzVKc4DVFvzty2vo+NWUgzzIEFjD2MnqFcbCEcKkTa
         R6yvaYqpqpaOu4nh/UZRCEtTVFIIdrV4Z7RQUlBhiyeFtyZu6s258BTjIC82r4wbdtPs
         oSEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzBu9GYzcgPwp7IzwjondKg/DYM299xZ6NPUpVcTDqoAhFF6V1+aQbOMIaLFNPxk/Cv2m771rf/TvyZfuF@vger.kernel.org
X-Gm-Message-State: AOJu0YzMksy1YsddSH4cceP4hJAn0eVqB+uWPT0jr6UMIB42Jk9Iv1RL
	4OtXXBpEC7ubAs4WUoEMy8MCAwsU/fuisa/a6Kg6jx9nCXJAVNLii8MPkPYioYo=
X-Gm-Gg: ASbGncu+9zp0BHHrZyb8mWZ0X3J0H+Hn+p2h1JDLgSIXKY4zZ7faLzIpbUBJPrwDUrz
	FcDIvoTq4XSUx8zyLKGHlSgfU28DzGopt8HRaf7zgOUW/FCVpzgTPQTT+bu/0YbWYb0gh89XTD8
	n0RJyiyKKJTzWFSO7c0qNg+XMCrUBtvRU8paPPlehbxJfuTgDcnpSyWzK/CsT9KvqIDCWkydBK9
	K8ZbHGXFAsUHmJ1cMhX9GmI1/2yCmrQW8EPUvGUxEcQoMw1XprA1Xgx0cGXA/e3yiyM45TRFxoB
	BGZoK/KXVBCb5ROHxX6owe9AAUewsvcBOw==
X-Google-Smtp-Source: AGHT+IHDci9L/6AsBEeiuG6BZgyEOBnEPboPoD7HxDCRuBXGZTBAXC+3TfunwokyNjk3QSqkQJSPhg==
X-Received: by 2002:a05:600c:19d2:b0:42c:bfd6:9d2f with SMTP id 5b1f17b1804b1-438dc3a3ea6mr10969925e9.1.1738162198082;
        Wed, 29 Jan 2025 06:49:58 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb0c9sm17494486f8f.78.2025.01.29.06.49.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:49:57 -0800 (PST)
Message-ID: <4a27c3f2-6b36-42bf-b323-2cfb0014ca58@linaro.org>
Date: Wed, 29 Jan 2025 15:49:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] drm/msm/dsi/phy: Program clock inverters in correct
 register
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250129115504.40080-1-krzysztof.kozlowski@linaro.org>
 <kdnbhw2ng2kuhm2ynlmtxz4bnq6j243ktqwfvr4mgrr6w5uy7d@4j6cictf4tpu>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <kdnbhw2ng2kuhm2ynlmtxz4bnq6j243ktqwfvr4mgrr6w5uy7d@4j6cictf4tpu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/01/2025 15:31, Dmitry Baryshkov wrote:
> On Wed, Jan 29, 2025 at 12:55:04PM +0100, Krzysztof Kozlowski wrote:
>> Since SM8250 all downstream sources program clock inverters in
>> PLL_CLOCK_INVERTERS_1 register and leave the PLL_CLOCK_INVERTERS as
>> reset value (0x0).  The most recent Hardware Programming Guide for 3 nm,
>> 4 nm, 5 nm and 7 nm PHYs also mention PLL_CLOCK_INVERTERS_1.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Not tested except my work-in-progress oon SM8750. Not sure what is the
>> impact, so also no Fixes tag.
> 
> I'd say,
> 
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I didn't fully test this, but according to msm-4.14, msm-4.19 and
> display drivers techpack this change is required on all 7nm- PHYs
> (including the SM8150).

Thanks.

This was suggested to me in non-public talks so let's add original
credits as well:

Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Best regards,
Krzysztof

