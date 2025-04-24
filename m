Return-Path: <linux-arm-msm+bounces-55522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A54DAA9B98C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 23:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0C2E1B876F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 21:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19D472820A7;
	Thu, 24 Apr 2025 21:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mPtE5+EW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056822422D
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 21:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745529035; cv=none; b=VLbDbMIM37CQZS20LHNmMLCtChpy4k+kBFR36gjfitgcIIQdPcsQ+6qRzQs6EdEPgdqQXkAPaZLEMnNcs1p8OMW96y+sLtjC7wzFExXnmUBxWpfuuolXUqwCfrA1gcv0xRvxqlzY4UfpNAyAc1RQSY+LlUlvHoSCMJPN8vnVUDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745529035; c=relaxed/simple;
	bh=SAAXfe/KmgVnrM0sBHNxSuQBzWcxeMCd6SSxcmfEm6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bnIb/+M4m1oyy0Xr3NdNu0YAqKKcEj8o4aM37jy2eDNmt9MAF/O6KtWk8Ws3nxRYprKFcQXxhkTOysSNgrBWNh07oEEjetPvzasDj3wRwxtGViEjkIjhASJROBIfRGKZVrC4D5JaymQ3/Tlquu+0wd1uo0V+Pp/sO5AT09wv8Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mPtE5+EW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so1368190f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745529031; x=1746133831; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fpJUvS8XH91DbwFGx0Gn68uuFYZumKhYa+GRw9ZFlRg=;
        b=mPtE5+EWP9AStOYu4l6kt9YU5MwGrW0PFLKCUpy4JN5UrIHtbzr98YNeUMEAo8c7dl
         f4BYUiy1HSPyob8bBdh0tO3BS9RvekVUHBJRk1c6TeMbPhkFt1p5BBIlRQ0q4bwAdorL
         7QisSGfwjRNNV5GCUd+fNZ+tEWgTjmP1ihmhKabRwnsoU9Jt9+nI5BXjPHiT26Ump5Qt
         rfcLk4pt4k8jtY6JNfYaCZH0H6TH9eTOYJh2OAE0c6rD3MouXIcelUyikVxLcSD/XX8P
         tRHxBCpEnhJZQieXT7oIofMzJU42Xy6YvmejSwAOcBsTbHaRIhTU10XbMpCwZHQoeLeQ
         Nolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745529031; x=1746133831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpJUvS8XH91DbwFGx0Gn68uuFYZumKhYa+GRw9ZFlRg=;
        b=nr0mncJ78Z+xr3LPdfXk7AY4mFEgMlaydzicoZquqaJZ1Bcv/ssSL0Wmo6o92pTCjX
         ILIeQ16p+f/937X9kXHsPCZtYeXg4JcZqVUI0sVsmld9rR8NngktU687DcLJeZBHHjAW
         owv0XNP/vbra11hwprEFbgG4kMTSpdiD2Shflfc0ob/a9tq4eJ0sp/1Lm9RgiRh635fy
         QsBnMTBxcUaKGpiu78QxdxsKxhJJKQH6EsE+am16rUSVjjLqgZNNO+adg9zuoRW1d/vA
         1OPhqAW8UmXdknTPo/INp0WNzK4t3kzbLIDXxd/z3WeGHl1zVSfzW1buGo8+bCps0PPd
         rMig==
X-Gm-Message-State: AOJu0YwgrVR1H2cl40DFymqKUWHfI1bo2yCYBSOS2y1haYqR/c+qYNXD
	kvS6/2VqImjVftDTceLc1E3ziPYh3DEGaynYWXrWATr52hyTt5XcyfcsjDL3IGs=
X-Gm-Gg: ASbGncsy0SZA18lm3Cd0Y8JaS70qSLzvSPnJF1plN2pf4jNUa4iP6UCLbKdCniPQvfE
	wu4omudz9hesuD+xT12RRYyuFVd5Fq4YHbgmJLsFkTpACtj+Q9mU2cx/jP5zaIZJ75Jwyu41xmS
	bOGGqhmPXqhk++IHqtFiQmF8Og9QVaMGka1ADDRpBNQgoXLolSlrSwJUNM7A7xBw+Cj7cdj3xAP
	XTU1ci3aPIN30Hp6mYCxB5JPs/+vpgnKRFdLC1L3N54paqNFNG13bMdujkoQsppecafFg/6JOjY
	3EQBg/17RXffdRwvWP7jWIXLbJcGqgjbu6s+GUN+GFI208dxLx+t/+94WM5O4JZFRByEKUNjCED
	mTfM6HA==
X-Google-Smtp-Source: AGHT+IFQkn1+bYDDTCD4Ik2NQke355Zk6NhxCyw/2MWOpTV1mCxM9793lDKvqt+tzTQ/fQ1A8Lt/qQ==
X-Received: by 2002:a05:6000:40cb:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-3a072bb38e7mr581586f8f.42.1745529031365;
        Thu, 24 Apr 2025 14:10:31 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a536a1e8sm1651745e9.28.2025.04.24.14.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 14:10:30 -0700 (PDT)
Message-ID: <e7a229f9-b02a-4979-b609-ef5e478fe9c6@linaro.org>
Date: Thu, 24 Apr 2025 22:10:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-0-edcb2cfc3122@linaro.org>
 <20250314-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v6-2-edcb2cfc3122@linaro.org>
 <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
 <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
 <0ab31397-580f-4e5a-b9ad-d9bf79d29106@linaro.org>
 <36feffed-4558-4e59-97db-2f0e916dbfc7@linaro.org>
 <6a4ec36c-c003-4ce8-9433-8c12ed3188ee@linaro.org>
 <d97194a7-2b7d-4a76-998b-92da495e8bd2@linaro.org>
 <d0958f7e-db81-4e4f-93e5-24ba0cd853fd@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <d0958f7e-db81-4e4f-93e5-24ba0cd853fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 21:08, Konrad Dybcio wrote:
>> The Test Pattern Generators - TPGs would then also fit into this new model for the PHYs.
> Maybe we could consider modeling various camss subdevices as separate DT nodes,
> perhaps on some sort of a `camss` simple-pm-bus or something alike

I hadn't though of that specifically, call it option 0.

I had been thinking of

1. Doing like venus with a subdevice based on a compat
2. Doing it like DPU PHYs and just moving everything into drivers/phy

The fact that the CSIPHYs are technically inside of the CAMSS 
collapsible power-domain seem to mitigate against option 2.

---
bod

