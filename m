Return-Path: <linux-arm-msm+bounces-64953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B22CB05395
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 09:46:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 939C63B76A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 07:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B49271456;
	Tue, 15 Jul 2025 07:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oOCISA++"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57F61FCFE7
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 07:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752565578; cv=none; b=SChlVLNQWjuzqUaFtmh0KxtnmMCdv1dHozzr7mzrAsooOJOabnR0rKj16uGLJhyx50TASvjNkX0QQeMIvOlOmOS88SZE+go4izFc8O5djT1aO63v2DCufx9v9cg+Oj8Xs7cXiC/hEk+YSXdbswp3hvyu32ZZTekmMrIx8lDA+yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752565578; c=relaxed/simple;
	bh=IzIpovWOnc5f6gec2JUVRCeKBBVs9a0NAjuf3aEqXpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jc78BFssW/atLQbMwMTJWzB2I8UEavT3mXk2iYIEP8Y8SY2SC7vreUECAUraKndh9LqK3c+VK6ZbVFSeLVLtqcOwMxRAWLQQ5chPzOt0RLDAsN6fXKgcPkxd6kQiQEyjcEK7HRiiMXF9uiMGgD+tCWvttsCfiaw7cdDhCfY07Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oOCISA++; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b39c46e1cfso633092f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 00:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752565575; x=1753170375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/PtX0e7Esm8rTzV71dVvhrf1harP8o5hQTrR50K8MNc=;
        b=oOCISA++ICaEjfw14IO186Pc/lkJtDTRq7sVMZJX5hPcH9qDvDVaaN5RSqw/fXfEEc
         05PUH1x8n19i/Awp26ZpEc8BBKbALEWP/0bncxCtmaYJZNza0HPVDdyDQ/rhBtLgBOHh
         bMHQL4kUZlFPFVwVAniUHGpRAfU9THadSomoKmXRt8xfw3wb3+5Trq87C/UfJbJU5jG3
         pS8JU5ssE0HbrscaOaTT58c+oL4bn4vWLTuYluN0fDgd2U2n7XdVbGfzOxGdOKxpPbHy
         Tl0Pakf5rCZyXSSFtrWtPlucSo0bxAZ4oTsXNTmb2cc8TiQ600LT6M9s14V/SETFiHf1
         tMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752565575; x=1753170375;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/PtX0e7Esm8rTzV71dVvhrf1harP8o5hQTrR50K8MNc=;
        b=okJzdCiXIreYKJHmdl4frDTnr7am+eRsfNUPOTdENbBmJi2KzB/Q45P4SisCclHx8Q
         n5nL9IugE+FX8scV7MGgN1WIb+zh5tSYKlkDOQBrI2oh9rYvsoMwD3kPHqE0PjgJ2gfn
         dLfxxRAnDt7V2V1v2qiaJujmwfiDadAhXFgyQrHXyu2/8Oh7uqHfssFNYoY2TCaadJMB
         85A7AsyzEEatAUjLtqbxXu0b1x1j+n8gTsp+7D8CT3Aiuq8rr51wTV3/chTZZvEc1RyV
         bYXKVuwNRtet4C8W+9LfigT3DafbBO3iXQ8Y9vyJg08Q8KUZJLDAOTHHCIH+ocbRI7/d
         wK/g==
X-Gm-Message-State: AOJu0YxMNuu1UUQG+NjjPpR7ZPOx/ZTg93G+1CB6M+Zd9fiA+Q3Ggzm7
	2jp1FFQhtrMFLWhllr++xuex9iAl9tYqFRgHygYD/evE6TrMl9ApFYwWjlVrOYwCjDg=
X-Gm-Gg: ASbGnctLTWmm3MBSF3OBB4w8i5iJCPiC0mJ1RpHdWsbUaprpKEspLa7D1WVUXgz0T31
	GNbQzoA/5f3hvfRQR8UYnLkEcLQiyfvmc3KV+iPabPtdutrCrqfuHWcn3biLaa5o3xe3jHMUjcO
	kafQe8a78NUJZD65tk6cNVAghPSrji0zDbwWXXyiVGFK606yeLso7seumQs5NGMn/8yUmo2zF55
	sVrLLtO5zcxZg2SV4QvnW+kRWvAo6kVYXZAXN+zM2QO2hcUqABib1HP7qmbsQh3VbPV9yI5yCvx
	WWT/6VBsrr7ySI+Astj9Ba5ZP+xevwtLMC4yRVt+77/Gpch97F1+W8P297vKMv7xVK0H+l219Es
	axtfYDl8lDGcZyvo3EjMdTew+ILX/IV9YNyFF3urEvQ==
X-Google-Smtp-Source: AGHT+IEA6odCTSZRUo0FWmIxT6/Fuh+xtu40gUfLS89I3yzEOjI/ZLAh3ngB6RN8IMsZjRvEgri1dg==
X-Received: by 2002:a05:6000:2c0c:b0:3a5:28f9:7175 with SMTP id ffacd0b85a97d-3b60b376944mr195053f8f.9.1752565575164;
        Tue, 15 Jul 2025 00:46:15 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8dc2464sm14728597f8f.38.2025.07.15.00.46.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 00:46:14 -0700 (PDT)
Message-ID: <8323e152-eb08-4a60-97e5-7b50b2aea7a3@linaro.org>
Date: Tue, 15 Jul 2025 09:46:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <9361e954-e2c9-41c6-be4c-12b0e4f367f5@linaro.org>
 <5f3b2bda-92f9-479a-9af7-5d08e420121d@kernel.org>
 <bd7cab62-f0ba-440d-8dc2-3304afe884df@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <bd7cab62-f0ba-440d-8dc2-3304afe884df@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/07/2025 09:19, Vladimir Zapolskiy wrote:
> On 7/15/25 10:01, Krzysztof Kozlowski wrote:
>> On 15/07/2025 08:53, Vladimir Zapolskiy wrote:
>>>
>>> 2. The whole new changes for legacy/new CSIPHY support is not present
>>> in v1-v6 of this changeset, it just appears out of nowhere in the v7,
>>> and since it is broken it should be removed from v8 expectedly.
>>
>>
>> Why? If it is broken, should be fixed in v8, not dropped from v8.
> 
> There is a conflict between these new v7 changes and another old and
> still unreviewed/uncommented changeset, which provides quite a similar
> functionality, but it has slightly different CSIPHY device tree node
> descriptions and their connections to CAMSS.
> 
> This technical conflict should be resolved before making a bet which

Not really. People can propose different ideas, although I understand
possible disappointment. You don't get however monopoly on doing something.

> one of two CHIPHY series is better and should be fixed in the next
> version.


Please provide links, otherwise it feels you are pushing back someone's
idea for really vague reason.

Best regards,
Krzysztof

