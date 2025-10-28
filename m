Return-Path: <linux-arm-msm+bounces-79185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B892AC148BB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 13:11:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DCB7423D9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 12:08:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA82E32AAD8;
	Tue, 28 Oct 2025 12:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2i9Sqhv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1117832862B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653296; cv=none; b=N27CPj1YAWggeoiGWgF25wQyBXiWw2gQ8DlS5S5EqW2vZxOALP3a1Zn69v/eHxH2n8+4pfiS5YebLEiGmcAeKipLgyTKZRgglu5gBeWSlN9WuXhhdxRU+46y2B3GvojZE0xFRxi8uCM1N022BvZdckl3JULJx57EBIhAXPcFSuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653296; c=relaxed/simple;
	bh=FFZIhW7dPQduoS7KNYpmAufTpW86vs1zECIWDOcIxOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3lC//4VDySnxFKM1jdNc7tN8qf4H4TVYHsrFjolJmlk0q+K6H9gqG9uu8Gjviyt6nsl1P+dg+L+og/8lPAH7ExaqzaZoTpY7OPL6YA2J+RoyMEHgya9ysY8fx4sCObl2PRVdKmqm80X6yjzbrD2oW7Q/vVYt7hXmn6BwWXfGpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K2i9Sqhv; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4710683a644so49490915e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 05:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761653291; x=1762258091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjjiZbIUuyLAf493CLwJMzPeawzS5Hi7KDfcQ8XqHPU=;
        b=K2i9SqhvhcTFN5t8WVdPFenAzKDJnwsKubl9rZC8x3Htax5UES0T2I6SAZjZy2k4yo
         O4G9ltAZ3OB/iV92UmlooAkR14Fj3hmqb87CAR05EO2Wb3SmOh38eHCy7rqE3YpIzany
         H+sGzx7SITrsa+PpzgXqFnSwb0g+7YYkQhtqDKvWrBdvRbl9FTt23CcdxOxpWuEZWrIl
         ySzV/OzpKWLiaEjkklTX0TIhV9U6CNVK81+yvhMxxSJCKKt3T3QlcgHuPjUjwPjiWM+B
         P0sLoRg39JShhSg0CcnljL4qtJOXUZnVpOV+Fu8vWKOUvTYfdnbGkK5lS3TuZI1aA0Jn
         7anQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761653291; x=1762258091;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjjiZbIUuyLAf493CLwJMzPeawzS5Hi7KDfcQ8XqHPU=;
        b=EiKsM8qGPvsR6bgRjrwB0+s6sBLU4SX9OIzSgr8tTRm6xL6g2uKPQcLaVBcFEp7QbD
         uSQs/Q63mXQTfqh1kBtoP5iPCu3xs/NL7uQyjLGmaSJ8qN+tUr8etn/CaYRKX1spYpbN
         EgKIg5o5+uwlvu7vOzuLMPu4lllX8MBk7GqUqrdggPbDgZ20PAJO+To3SLvizEFbwZTb
         GwSiAwdyoiuR+r1rapkeemA6RpJyAHVJiJgY6eI47BIUwD5S1vyNuaOEVLfivY72hN81
         AgrHdiCFjzhS4rn3tPbZp1rijZA28EC2cIMbv9cPFL/TWWOPID0Sd8vmEoE+0VJbeEVc
         /LBg==
X-Forwarded-Encrypted: i=1; AJvYcCVVQ6eQ2vVKBuJ7VEyPqh4q2YzDYdFJCU74tjKro6uxtoX1MTDibPEJXvx9QjLg2gY2QqaB4ASw2qmFnQp+@vger.kernel.org
X-Gm-Message-State: AOJu0YzlMVujesoZRccI64U5m3YD4/XIhZ4KnDtfjpVLS2ltqqAOeq5c
	+ILNLpGkl0M+18hFke+CLGG6bLwgXz2CWn3O0WrQnSmC4EPjsudWTHape3oZy7kc85k=
X-Gm-Gg: ASbGncukWIeRCcDhzye6XfVL/g8602J1L1zfSTs7TCA6zVz+PP34Pl97FEQ7AoVb0sd
	E2CeYLArsHCZik7thGlk4EPAhQwfr3/5woLYZilPUKT/tLvL7IuWxgirKEQLM+559KhdYyvj/od
	QDBqd9yNPlnBWb9lEA8CFOyVonJtLke8Zl/LHIvkSI//dDKp/CBFX6h6MZIQLzHNduktVe62mo5
	jQ0XCRuQBo/hO43G9vV/pnULB42B8g4e84t7wFhtb1eEKfQjaWGsqi7XEOlYKb+jM4eh+u31R69
	/qwSxoDK6pIfPD2M5lLCRM8G9C99xxqTDsLHjTavV7TS2y7NIw5rZ1HhUY6WZfMeeqVZ6djY5b3
	3czNLXDWnlgfutWyRjU7cawxmwvkceMPIf1eh+0tidVSaM0dgyDqY4BbToCgBIUaRx7j6OLmxl1
	I8SjTUwc2VrwikRV57EA1LWBo+mEcpN7lD95FayIWLFQ==
X-Google-Smtp-Source: AGHT+IGFpjPN8Cn5YgLMJOAQI6Ro/JGJGzDgKuY2HvqITluVdL/i2A10CTxri2/CVAdNVkSLxXekrg==
X-Received: by 2002:a05:600c:a08b:b0:477:c68:b4da with SMTP id 5b1f17b1804b1-47718176e5amr27234325e9.20.1761653291379;
        Tue, 28 Oct 2025 05:08:11 -0700 (PDT)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4a36easm193604505e9.10.2025.10.28.05.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 05:08:10 -0700 (PDT)
Message-ID: <aaa361f7-6ada-4347-8bc6-3820cfc9feb4@linaro.org>
Date: Tue, 28 Oct 2025 12:08:09 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
To: Luca Weiss <luca.weiss@fairphone.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251024-sm6350-camss-v1-0-63d626638add@fairphone.com>
 <20251024-sm6350-camss-v1-1-63d626638add@fairphone.com>
 <20251028-defiant-visionary-rottweiler-f97cda@kuoka>
 <DDTUHFIN3IEK.3FY5IS9S73ASO@fairphone.com>
 <0bf4ab2e-9846-4f8b-ad72-e9db6fb7d08e@kernel.org>
 <DDTVUXIIQQUS.2UUJ9BS4JCZ0V@fairphone.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <DDTVUXIIQQUS.2UUJ9BS4JCZ0V@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2025 10:28, Luca Weiss wrote:
>> So that's vdda-pll-supply
> Just noticed, this S5A regulator is the MX power-domain, so we cannot
> add it as vdda-pll-supply.
> 
>  From what I can see, so far no other camss bindings take in an rpmhpd
> power domain, and given it's not referenced in downstream kernel, it
> doesn't look like it's necessary to control it, from camss.
> 
> Maybe it should be added to camcc though? Still not quite sure how
> downstream vdd_class should translate to upstream...
> 
> Thanks for helping with the other points, those are clear.
> 
> Regards
> Luca

Standard practice here is for MX and MMXC in newer parts. MX certain 
pertains to the clock-controller in this case.

---
bod

