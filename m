Return-Path: <linux-arm-msm+bounces-64928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FC2B051F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 08:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CAEB1AA6346
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 06:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2709726C399;
	Tue, 15 Jul 2025 06:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T1sm9XCl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D492594BD
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 06:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752561616; cv=none; b=UxWJm/MyiRL04nT87Mf2CVb57KRZFmMspvm04wlwN5MJg/ZtQQRcJxuL/3r4dsPlQ9WY/h7ar7D2QVdEuic+hZLESON5QEKeJcEkafs3050/Sj+YHFz4AGIVmmZ7zgvXtAwOojQSr6LeClkUeU0yG8agHY1Zuh5IpLYZsb5cR18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752561616; c=relaxed/simple;
	bh=XvhUwch1kWk+h7hXn8TTsbFUD7dvqo/TCnjlMoY8wd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCOkfllX5VteCoUi3qOxODm3rFpvG5ULhGPlYbZL/vA0+jPWoDcJYTSUjXsMg3gZhebfODfl6CGRelgtxJqX/+wDA/dko7oC5/yHi47tN8ovyCHRklv84XdwXFSZ3YozcC6TlR92yii1sY3OcSNEd8pKWl6VbPePj7Oc2qqwTNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T1sm9XCl; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b4b03e0a7so2026731fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 23:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752561612; x=1753166412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tIQ0MAA7ilgsnxpjHpbsqjmKUfNKURLm5JM6QSNd4g8=;
        b=T1sm9XClcdjyQFwItMITvys5cQI8JEk6Umd1TG/Zj5ieX//afOIqm370efy1SEzhv5
         wc0dmvJFqHf6AeJGJLER2KGNlRMV7uqWlVDk/PyDLyuUMXg+2MzaIzmaaUg2IGKIjtYG
         q/3cGSnz41ghCUKsoIKJ0f7rbMRXd5EvbQoclrCtrA5GnXhaUuHh+434QtIjavZ9v6uU
         hbHKD+tCWgp5bt6m+9NY88SH+dWSKEUcXyU1HS3XR4Y+2ik7LDOu/hsmxZ9U0utzQ1G7
         5f9CCqWdScFflJjJmoZ8WWWiOafZrBTyPoa39tF8MygHaCBDKtNKve1vcgKreEi+vwcV
         7tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752561612; x=1753166412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tIQ0MAA7ilgsnxpjHpbsqjmKUfNKURLm5JM6QSNd4g8=;
        b=aqXw5JCiSd2102HbPmbuLV2Lwn42jD8zJZtUUimq7xk2pnNh2dov56Vx1tl5EfM6JM
         rV8nE6c0jAhInnIj623iiFTeBYHvq82WZR2R7hUUW/aj4k+zLfAZyEohFtPQIDdSvffq
         sRUvkLYexm06zhpTJ8CpA3oZFkeHtTDfSTwkyeZiI6ekzDyFVHiKpAM8raUkDqrKM7ve
         Rw4Xxjd7Rrf12Ri4zQ+vt/x/Q404AOv3Oeh6Jl7Bj7pJsJhFUUJCia0FuTHS2c9Gk33Y
         rPCUVg5mYiA1hMOkdJ54B0OhZJD/mT4apD09OUEbRJijGTPX1fyFYIKESwI85cfsdQQi
         m7ew==
X-Forwarded-Encrypted: i=1; AJvYcCXhIxKHJTnIEqqRHaFkL6rKg+RnL5PUSIAuQIYmz59CKnuA5Do9BGuPQ2KnXGxf/46P5Ky1Y+eistETRf3M@vger.kernel.org
X-Gm-Message-State: AOJu0YzlPjrHOGu1Yq7EHRIbeq5SEsOJ2GfBs7Pe4hSwMYaj7ww+7TAY
	hR9jUIgX5x6wdBoyE2oPabOCCyvNYNwEPqwddE7zkZHjTPsw9qND4TJLbDfZZVwjAGQ=
X-Gm-Gg: ASbGncvVuOpL27ihnBNNhc8DgcfGvMd/OP5sK+oyjfBi6u2Rb9gjQekJYeVgLRfKH7J
	HReb6WGgNGiGxAPjAbYKUp402hvQISlKaKr9Au0bQPX9Ycy4OiKKnG0NVmoBYWMcReRkRvdf8QN
	Y7H/upzPnTUscrffrYuAo8/+sW2EqfqWgVtICYZYJcycV1DFh7U1FftnRCDsHQhzWJ0RVBxx3Qe
	P2lZBbsP6kKeT1rcH2XxgNMlMX0myBTxyulFf+vTW9pN94+vWiiNk+WSWJRH7ZoWd+lfnv0p6ZG
	BB46mQ7UCtAF/vkIreV5oqj6MpIlE07khu5CUvWccNrt3acVLpCYFPz07q+2GEXd9X5eEhhv2kB
	JTm6/oeQs+zdKKEH5NwcAUxDQGIWBwC4fYotjRSP8lCx3mr+1i+zju9o+Uc5Asz9wFnSCyiNtky
	rE
X-Google-Smtp-Source: AGHT+IGaFJXLkox1nF/8pLLN1OAvLc85Z5RHAm50nAQslP1unGzqc1kserBe9j82STD5G66WKnTIuA==
X-Received: by 2002:a05:651c:1a0b:b0:32a:7d76:2660 with SMTP id 38308e7fff4ca-330872d2995mr581861fa.2.1752561612382;
        Mon, 14 Jul 2025 23:40:12 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fab8bf2e1sm16881731fa.55.2025.07.14.23.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 23:40:12 -0700 (PDT)
Message-ID: <dd3c2fea-2c85-4a4e-b048-68f95f4a7d5d@linaro.org>
Date: Tue, 15 Jul 2025 09:40:10 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom: Add MIPI CSI2 C-PHY/DPHY
 Combo schema
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org>
 <20250710-x1e-csi2-phy-v1-1-74acbb5b162b@linaro.org>
 <8ed5eeee-78a2-4b26-989f-03676a9e5da7@linaro.org>
 <01080f5f-f3e6-4989-ac84-766c030dda35@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <01080f5f-f3e6-4989-ac84-766c030dda35@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/25 17:42, Bryan O'Donoghue wrote:
> On 14/07/2025 15:13, Vladimir Zapolskiy wrote:
>>
>> There is no ports at all, which makes the device tree node unusable,
>> since you can not provide a way to connect any sensors to the phy.
> 
> data-ports should go from sensor to the consumer of the data camss/csid
> not to the PHY.

No, this is an invalid description of links between hardware IPs, and
this mistake shall not be copied to CSIPHY/CAMSS.

> Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
> Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> 
> https://lore.kernel.org/linux-media/20240220-rk3568-vicap-v9-12-ace1e5cc4a82@collabora.com/
> 

-- 
Best wishes,
Vladimir

