Return-Path: <linux-arm-msm+bounces-27675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E59445E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:51:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64D57284438
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 07:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF97013665A;
	Thu,  1 Aug 2024 07:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fjCGDazB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD1D13D60B
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 07:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722498694; cv=none; b=IP9pUIuhleqycRNxVott7qgrHtaBptJYGlmuS3o/Ms7KzQvFK4F0+5KZ99LaO4rUObdA4/p4syYxjtffNhG/FJWT+QGXrKxPZz02QgQL5/aVVI6EBpnR63KLQ1Sm8giTwPDUJCvEybJxqzq3fyTTx9AWdeIois/Qy8fVSq1lkh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722498694; c=relaxed/simple;
	bh=PhDLQgNQUqBWO+mydssFM/K/F7iU/3Kxh3P0a2s0qpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y7bMGVB7gKACdQssPYaB2e/8LqQ+keAHGJRlNmZlkrc25u0R9y8Xahq05R2zgyVJSpqudVRTRMWanGYuj+mrniA1WjcUKj/0lc60r6+e54m27RrK3twc3F68W2k4B5DK8NRqQ/h+C23ntihsrlSkQtNjfogRAj/RhuwXK/Xr9bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fjCGDazB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428163f7635so42263765e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722498690; x=1723103490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FZEfKgAUYgQD4guqTZYcdll8kLH83l6dhKBOEKXkEV0=;
        b=fjCGDazBE9qbKWzT7s0THak2vMBUgGN4adyQOhHv8QuMSoqVw6h3Acri6RO1c/kU5z
         EbN53rw+1c6VZAamOU0qrXf7ou0KuVkLPi7zCxQWEJMdo2+jJRn1WxnX1eKKQ7PmU2P5
         ZjJpIU8iCqqcUpfvEBXix5Mn0a8Ijy9uPMDxfnSGTODBf8vAMjZSfWupMLm1kEjwOZ9X
         oP5+CUHgBQ+fWBPnOlLCiK8udi5FSH3O/3ai4wTVZ4IZ9vEhVN2HVGdN87La3lwDzY7U
         bk57oqq7ZPeBkkUQ2QHsFz4RA4BnT9bONzLQkkZRQ4PwwRt/q/3Jvm7wzcxJA4JDu/I9
         T3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722498690; x=1723103490;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FZEfKgAUYgQD4guqTZYcdll8kLH83l6dhKBOEKXkEV0=;
        b=iakkBG6aV4LWewzbabNI+3i/fQtiXe4mPQc8k1rwPxRTiEfm3KbYMNEzcXEMKw755r
         0Y1MlfpPoOvf2sLe6GUg7GPcjIyrNJeBpNXfXi9eDGL6U9IyDPVNHTe/sel1IUsyIVhl
         TC+7ciZLnhhMtuqDfzo6mVbs1zq5M1cl8UNI3R88JA04yeirAjwAPzldDIvFpsN6dTQr
         8sL1V1puMNG+O9NetdasBZ4GGfMoBQeh6hdfmrLnncYmXy0TSvRBvIvBuh/9ZPPU+eed
         pClOcwf31iutenkcQ8rPekN9i18LcusPkqwjZ57TOimlePgSJiwwtd9TrDwynandTHS5
         LiPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmFOUkkBH2Mvb3KYKwgSqjaNbhhNRZLW+1Qt3kmzdzp3GAkRru+vg4K3ioY1AtY2jKcLgXie6EeaDZzgSOJy36mnandG3nKRh9/s/oog==
X-Gm-Message-State: AOJu0YwNF1A+hJMbtHsDJ5WiDI0RIRp+qkcx5QaTRshvANKSezEjGWBe
	fH8jGoNi6bU0mSTxHYW48suehJU34MCpKiXV4MczzDfsx3HunLK3KYnD+w2YaAg=
X-Google-Smtp-Source: AGHT+IFVUiYgg7q9EZX8uWtt6E+3CIxmrat+d5VUvc7kZZlt8Ar9KLUB/uBZeH3PYHiZfb+ex/J2UQ==
X-Received: by 2002:a05:600c:4f96:b0:426:5e91:391e with SMTP id 5b1f17b1804b1-428b4ad24f3mr11215855e9.26.1722498690129;
        Thu, 01 Aug 2024 00:51:30 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb63f21sm46870285e9.29.2024.08.01.00.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 00:51:29 -0700 (PDT)
Message-ID: <bc9dc9c6-fefb-4d13-9fa4-21768add59c3@linaro.org>
Date: Thu, 1 Aug 2024 09:51:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: interconnect: qcom-bwmon: Document
 SA8775p bwmon compatibles
To: Trilok Soni <quic_tsoni@quicinc.com>,
 Tengfei Fan <quic_tengfan@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240730-add_sa8775p_bwmon-v1-0-f4f878da29ae@quicinc.com>
 <20240730-add_sa8775p_bwmon-v1-1-f4f878da29ae@quicinc.com>
 <1e78eeb9-3280-45ea-9d21-92efd939efe7@linaro.org>
 <d8807827-5ad4-e442-a072-d564a55623fb@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d8807827-5ad4-e442-a072-d564a55623fb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/07/2024 21:30, Trilok Soni wrote:
> On 7/31/2024 2:23 AM, Krzysztof Kozlowski wrote:
>> On 30/07/2024 09:16, Tengfei Fan wrote:
>>> Document the compatibles used to describe the bwmons present on the
>>> SA8775p platform.
>>>
>>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
>>> ---
>>>  Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 2 ++
>>>  1 file changed, 2 insertions(+)
>>
>> I admit I don't know what to do with all these sa8775p patches. I am
>> afraid now you say these are valid but in half a year this will change.
>> If I give Ack, I feel like I am agreeing to such approach, which I do not.
> 
> Are you referring to sa8775p moving to scmi later in the year? sa8755p will not move to scmi
> as per the latest discussions. We will have another SOC SKU to start adding
> the SCMI. 

Yeah, thanks for clarification.

Best regards,
Krzysztof


