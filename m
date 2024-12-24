Return-Path: <linux-arm-msm+bounces-43206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBC59FBADF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 10:02:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FFB8188580C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 09:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A7621ADFE3;
	Tue, 24 Dec 2024 09:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KYnEAfAZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA2618FDD5
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735030945; cv=none; b=Q2Mzt3JuBDw7mlcmg6k6pty2IZaSPWI5Rg2dEDL8ns2/D/2frviI5cJTDY/w7Cs+ufzbVxxPg4puX1gMlQm+ppcyg82IVelDKENcfl6kQCuQFwZnHhqoo2x5VaMzZ/MHbW3D82qDwW/1h+YBMT17LdzfNHxKbTWspdNc10JzhHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735030945; c=relaxed/simple;
	bh=gSoT9CVaoJwBZDjeIeye2Xw8oj02DWXFADqKpE40gdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LnhYA3LPk4YaTscRqjjWmaneceIu/k6N0WLRgbhWe5kUxR4plOuqPZdPNY0JOYPXe1HA+JpQO0KpdqWtS6yx8Y/CMeK6ZgagUnUXF4jY5tVsPiSx37yML2KmC9nc48gYPaIu/Hd2nkd39cr1XSqlq/+B5kkoVvWNA4UHYi0NzUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KYnEAfAZ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa551d5dd72so95800666b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 01:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735030942; x=1735635742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rqjl308OuNRMbWugA4jzjOfqs1qN28qDlrGRi1lmlOA=;
        b=KYnEAfAZeE6vOaSAR4hONbF9DgolWRVjaAY44iz0+jIXaWHear7Udb5jrD5sLcDAAR
         9JsocFJr8zJgbGlrHajUkp1fpktwMN8WiPamNiS8+SiQouJKV1TR2Pq0LTSN0SeLnTde
         4z8LbNLkS9+X9L50+mXsZsypuWQkaKRwrWnGap4NSZAtcsalkJln764zcA3u/bu1mbmN
         V8LAXZD/FSyN3GVgO6Qzu7K3ftPtT9NICjpa014DgdPLysoOeEMTi2iuZRRPas+Wxh14
         3m3PoZpdMqzqTcuosA7kAZLfOBaF6aER3WNjn5nkZ9dD4+CAZoRcBQYp2xVybCHNyZ3P
         /4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735030942; x=1735635742;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqjl308OuNRMbWugA4jzjOfqs1qN28qDlrGRi1lmlOA=;
        b=TdTWpyabmTEEFNU7q3dqC+aOpjqcGhoKA7jKZdRr3Ht+yrawmU6in3Q2niC0wC3G9D
         zhI9oTQnh6bxYrJoAxl5e/Irl4OhZT8AW7lQGGioIXrqKzt5l/11kwbafnvIlR8NtKdQ
         6U+6et4Uxkkm5j19bpQ1YoClhP2/nSLJVpiIG99KswWUaxu0VC0HC+oA0s4+PsRI6tXk
         f463y1v6/M6S3RZf/50enJ2EPApU5ezJtqQkmIyaJvrnHwAVjD7djGiFKKEdNR8d8em6
         onzRdkPca+WBLS1HArQZwqhoPjIvvYLhuAAk3pyjYxw0a7r2/p3D5syXKbC6+A7KNYr6
         JzVA==
X-Forwarded-Encrypted: i=1; AJvYcCXwKs02glVGtuR4wq7S17U0d79jPzC6cEnoPs2wbbAEJdigXtZZ0G7iTXnebbUHJ1l2KlLXnx3UJClDYRkQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/qd0J9dXaXMRuyRtHZsJD4iEhJuo0XOL82HocQz1g6KEZxKce
	nqamQxfsnynkQeTfxwEBArBIuYdFVK78AJtoMDzR91WrI+Ixf4Nkm7FIeCnUCwg=
X-Gm-Gg: ASbGncvYW4lgYbUvoMeb1CJPBe4wjUowqawOBDJtd/0NtjYjzZkzM6tVrZaPmxR/Z6i
	nwi5xuX9iCKa4K4BzDdl0Bk6g+eMJ2aKqaS/mkzIX6cbLwxXOWEIy2AB4ys6sssnzcRXd6lZD23
	MYTfBPwforwvlT4zvRZubdSKVo2ecevWMseqNb24lKQtpheXxYQ87RUAt3q5BRJRCZVzP+cHhU+
	YDt52PLph0shVoaqzowccoFax1unAHLllMkrF1PlGJu4LELJkQfY+Ull74QVYOIY5vn60NKNheu
	I4PiRYhaxJkj3cj7omnr/XHllgrf47TDOr0=
X-Google-Smtp-Source: AGHT+IGykTi7JHcE7u3RIbhw9nHMoGJBAN6VL/xBiSZ3UlC0+Pn4XzS4kF3dFtZfJ0nP0IfLmC2iOA==
X-Received: by 2002:a17:907:2683:b0:a9a:8216:2f4d with SMTP id a640c23a62f3a-aac2714a5ecmr510447666b.3.1735030941539;
        Tue, 24 Dec 2024 01:02:21 -0800 (PST)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4b6bsm630137966b.93.2024.12.24.01.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2024 01:02:19 -0800 (PST)
Message-ID: <7813f2b0-e76a-463c-91f9-c0bd50da1f0a@linaro.org>
Date: Tue, 24 Dec 2024 10:02:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: net: qcom,ethqos: Drop fallback
 compatible for qcom,qcs615-ethqos
To: Yijie Yang <quic_yijiyang@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20241224-schema-v2-0-000ea9044c49@quicinc.com>
 <20241224-schema-v2-1-000ea9044c49@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241224-schema-v2-1-000ea9044c49@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/12/2024 04:07, Yijie Yang wrote:
> The core version of EMAC on qcs615 has minor differences compared to that
> on sm8150. During the bring-up routine, the loopback bit needs to be set,
> and the Power-On Reset (POR) status of the registers isn't entirely
> consistent with sm8150 either.
> Therefore, it should be treated as a separate entity rather than a
> fallback option.

... and explanation of ABI impact? You were asked about this last time,
so this is supposed to end up here.

> 
> Fixes: 32535b9410b8 ("dt-bindings: net: qcom,ethqos: add description for qcs615")
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
Best regards,
Krzysztof

