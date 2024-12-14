Return-Path: <linux-arm-msm+bounces-42207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EF49F1B7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 01:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F54E7A0470
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Dec 2024 00:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0542D26D;
	Sat, 14 Dec 2024 00:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LRnV8jwO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6958BE4A
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Dec 2024 00:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734137398; cv=none; b=Et76Somqj6vnOsmw+8nXLaBt+o70dtzfZG9wQZatQt7nE81RLMTpLdxg7KrJ72/X+E+k79GH9ebR8Wyi1CGbaWJ86iLuWAm1JJuGYDLoG7fNPqNCiQ0UePCMmSSWu0LlyJ+/hI4LbUrQgQOZsOEtsGip3YyO7BqlHfsyg50UqUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734137398; c=relaxed/simple;
	bh=LF9f2q7wQ5vyQD4uKD7ZO6qHf8a3O2obFR51imVhytg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K9G8JKi03C97o9DhuID1+Un8MgCFo+X35YSF1Mgx1Fyg0FKJz4fKn5fZyRECA9oz8BvfzKZRfbFZrl+lZHEoweQ23Z+8ik/n8K9Epclr5QgLQZuYioUyskx6/l6/nkAXpDs8KPSkK96oxv6NSwMVznGvxeVjbMpIREVkrUrS7yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LRnV8jwO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso2081257f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 16:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734137395; x=1734742195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zZHQT3+1AXOHwySh7rmIQ56owPwbOS+jVtet/I/oewQ=;
        b=LRnV8jwOV0SG5IWaihuzl1//P4nNulgNrK6O9E3pUa6+cJN/VVgaE2c9QgnFMe4+mC
         /Fhk1SKuSyOX28ryvEPjT+bq1zM9YOWYznKUlObqG/fa9HC02KW/rnD49jQ7XR4rTPEI
         o2TljLwj7MGTe5fCz4EgFG7PVU2OjNVqLfJJEZ8HaReM0dHFlUehhvdLtxl8CzW/qBdS
         x4ANxNQZ6ipRfet0D8fGjMDsQ1jBabuaCbAj5rGjq6w3IzO7RoDfRrAiazHbKWq4KV2N
         jnIpkkM+dwJz3GSB1KOhZ19RBk+OjprgptwoWngOBb3CbRJJKyzdiY6LH3X0MsEt0/7T
         necg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734137395; x=1734742195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zZHQT3+1AXOHwySh7rmIQ56owPwbOS+jVtet/I/oewQ=;
        b=K1rDVZwxYpUa+QAvyQwwmmb7Vkw4Z5Wvu150oP5gqkBru7te/kPQDHNv3rtXpPjkj0
         J8EKHqzM/vVtd1mUkHKg94laaAJ6gQxicPzcDTV1abxc8qF+f7Sbw6HsrzghNrJWmr3t
         ufDh3RcIZIaR3tme5PB0MRfChHl/buBxqYRCrBf5VqRL7AsztX+kRuyFFpn+ib/9OQBN
         Dye15P8SoO1a02NMUn36bnlZCt4tJRaUd517E7UDIsBQ4eC4wwIRI4EcBBklkGkPmzGN
         9LGvqyixkGVFygBDsos4zTzbC3Dez2V/nN2f5yXaBw55+8cUsrpnx05QJh0XuR2K+msZ
         vkvA==
X-Forwarded-Encrypted: i=1; AJvYcCVgkEkJJKOTpJkE+n2e8UAKfWPbJVoSEKSRcrf030sEfiRhvGyxccJ9YNp4Y4DHDnf+v7xuj0iIo6/yuRhD@vger.kernel.org
X-Gm-Message-State: AOJu0YwYuX3gckL6uLVs93Yrvd9oNPB3AkWvXm5YxgejfkXOPPPPvxHW
	7o5qlh5jXKHttVLnkvSDpXmRJHF+poFKVXlO8KanC2Hu5/FyDxg9/FDrssoAWBU=
X-Gm-Gg: ASbGncv6oobF7WmoG/ucYL+0JSuoY+KtxV/LcEzx5qNZXU7AmPqffOG6FrkeYqZdYsi
	RFEQ0kfNRswXEuvovk3E32i9xKI9ROme1WrsaGVHZrRDkKv2KXDm7pw6Q9bwDwomZJyBgDyDgoz
	oidM8UL1ojBjKfc+ox6YmTbWbKKe5xPJFoHbpO3iqVK0WI+/6Zhy+iVYHQsyU03mCHXUiXoR+0y
	ar0dGlZoy4RcWCVI0B5zf8oGWhPNLX3oDFbCnWy4K9I3uU+tXCdk0maQOQsJv1RKfQxMw==
X-Google-Smtp-Source: AGHT+IHGByL+SnFZLh6TJ7bPmNjCMhZaO4qaTKsbRPxcaxQjrB96T87kcly1ELijtAI4mJfcF9Gh8g==
X-Received: by 2002:a5d:5985:0:b0:385:df73:2f42 with SMTP id ffacd0b85a97d-38880ae14c3mr3370858f8f.32.1734137395326;
        Fri, 13 Dec 2024 16:49:55 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80165c5sm995925f8f.25.2024.12.13.16.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 16:49:54 -0800 (PST)
Message-ID: <08241f60-a6a1-4b69-bdb9-c9b83ec504f3@linaro.org>
Date: Sat, 14 Dec 2024 00:49:52 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] media: qcom: camss: Add sc7280 support
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com,
 Luca Weiss <luca.weiss@fairphone.com>
References: <20241206191900.2545069-1-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241206191900.2545069-1-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/12/2024 19:18, Vikram Sharma wrote:
> SC7280 is a Qualcomm SoC. This series adds support to bring up the CSIPHY,
> CSID, VFE/RDI interfaces in SC7280.
> 
> SC7280 provides
> 
> - 3 x VFE, 3 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE
> - 3 x CSID
> - 2 x CSID Lite
> - 5 x CSI PHY
> 
> We have tested this on qcs6490-rb3gen2-vision-mezzanine board having IMX577
> sensor. Verified both TPG and IMX577 sensor.
> 
> Used following tools for the sanity check of these changes.
You should state in your cover-letter that you depend on a prior series.

Unfortunately I found a bug in your depends series:

https://lore.kernel.org/linux-arm-msm/1a570c17-c501-4a29-a4f7-020f41563f3d@linaro.org

v9 will have to be gated on that series being fixed.

---
bod

