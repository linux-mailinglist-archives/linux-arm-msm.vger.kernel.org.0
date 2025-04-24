Return-Path: <linux-arm-msm+bounces-55344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EB5A9A87C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F60A1B84B6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4074257AF4;
	Thu, 24 Apr 2025 09:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sh38oJ8H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA08A230BF9
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487260; cv=none; b=Be27aIolVz8f8ggnIDQrpzzHddma16kXDOgdLWQBsrPfuRdWCXL1pCtXpni50GeOr1gj3l2S0yQ5lsTxTHuTBgCQCiQe7BWTAu16bNEizgP6PLHRS7QpJKrY8wWBqWdaF8zUNDRxOYk90doPvDRQOlZxKP/HIzag7rcO6EiV/yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487260; c=relaxed/simple;
	bh=W2UdDM9Gz5lK2YImWaOi4sawa1oA0xKXY9iJZEb34wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQgLfoObk2SVjqlN2TnhPULLhWjn95Fx4w/A6NFfCm6jBOr8UHAFQQgh5AaT4J+pZMhEvwE24Ta1CJAvenswLZyGmAu72mrvJJWhGLgNzEn9EKrWH+lTlKWz3lwARhMFvUR+eRCpJXeUzTSZW4A0ZSvvoBKUyagiaCqow7Vv8hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sh38oJ8H; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso7311995e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745487256; x=1746092056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VtiMeBtG7DKFIw/MlZYPyAoFtecT0rBQL9R+KBs9yMk=;
        b=sh38oJ8HTQdcmD6Kl1dDD54+5NzOLoLVvGiC0pMAp3KIgu63cTY67XTGc53J6wHumR
         Mk8uWVJeftnvaDVNCdmIDjgjGt/eKnnxrZWxShWTTBd1q1NU3ON7ek0mOMN0vvBiN4sj
         2hn3wNf5ydBJHG1e5aY64C1jxRxOSOmoWbtj/1vqH2Eup6L3g9cAKiSGM8MSzzmRnXAX
         PM2Os5RjCBQ+ow42ovTFVUlkMNTDY9Gt4NwOOBVkUFBSJfgz27W/gGsiFwJcolBwjoRh
         yyutPLKTRldJ5ZjHeKo/tPD1AVAmEVTGZb+WzNxuGjlgGasykl3RnJAVcXueWZqcOJu/
         5vOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487256; x=1746092056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VtiMeBtG7DKFIw/MlZYPyAoFtecT0rBQL9R+KBs9yMk=;
        b=L7ErEfnaSx4ekO5JzAph+3EQ2tnEEvRKCdDlPz/iVPLbBna9DxwydiikPxohSIpJT9
         3EXjFIcoDbNi5BxOtdB6FSeOe/dwNh1d8tmN5ObdpkjrfjJsME2H7lvPcrXqgjmwhx2M
         qyS6q3oT63auwVWT6vuQHdJVK7JXO7yRvcP7ydiVT3Tpx6gV5Lng2d88Az6f6dsyVRe3
         Y/Wx5cOpO4TJGtrVoxYOsshrcvn9GAYuq55Nmf99m2dmekCbyYoWmd8CpquPH6mm088j
         5ZGJOFpSSxQV8157YE/0g89FeYlwZx3o+s0aUCZU+QQ1Vc4niqB7WEhnLiQ2GpfI8IVh
         NA8Q==
X-Gm-Message-State: AOJu0YwqCBPZwdAMbOFB+8qj8JXi6ruHj8DzBUIZxanjMLYUCJxd8Hs8
	GvLzOAUYiXgo7PSeLu3DTOPRlkg8flBnxmsaJw1swSN06C25xFrHWyIxanRU3Wc=
X-Gm-Gg: ASbGnctOowZFT4xEqg5cutvuJsXk29I9yH4SalniVFNYr+O15wiUajsK8oCbUe8U0uM
	Q7a1gC2DgcZoHWgBAEoKwMdY9jR6sT4wBIwGBpyp0dnoYu7qR9wHScln56ngtQtWgVQb6mUlxYN
	l9+OEYY9SpxNM1v0rpkaVn7/o9rwmbt9YXs+VJ3mEChKehEFaM9P7iNblaGCf8ZoD781w8rQBaH
	n13k18+R/S4/PQ7Z6UfYuc/yTQrGVmLW2ootBQ/COmG/Zj8xf7UBy5lnxX7CdNyRNIDhlKBfttV
	ZF1LQ1phg2wwK4GMUMpZPahGv242ZhK6sK+PQU57YG43p0W1GkHiYlI8msSuuT5rGpOuRUA/Wbh
	Pay6w/g==
X-Google-Smtp-Source: AGHT+IEdBmL2+QOX0Fby79sdwrm+D04fNRL3vM33gjqGvaPB6uAl38Q5X0016d+zpuDYUabB6o/lJg==
X-Received: by 2002:a05:6000:4008:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a06cf4b575mr1650020f8f.9.1745487255883;
        Thu, 24 Apr 2025 02:34:15 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ea48sm1476432f8f.94.2025.04.24.02.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 02:34:15 -0700 (PDT)
Message-ID: <54eeb470-cd90-4bc2-b415-6dea1ce2321d@linaro.org>
Date: Thu, 24 Apr 2025 10:34:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: Add qcom,x1e80100-camss
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3ec3fd62-bf21-47e7-873c-ce151589d743@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 07:40, Krzysztof Kozlowski wrote:
>> +  vdd-csiphy-0p8-supply:
> Same comment as other series on the lists - this is wrong name. There
> are no pins named like this and all existing bindings use different name.

The existing bindings are unfortunately not granular enough.

I'll post s series to capture pin-names per the SoC pinout shortly.

---
bod

