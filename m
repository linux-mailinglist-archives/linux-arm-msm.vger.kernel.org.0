Return-Path: <linux-arm-msm+bounces-33585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0A59953CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 17:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB3AA286840
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 15:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F27B1E0493;
	Tue,  8 Oct 2024 15:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WghEbx8r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CB318CC15
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Oct 2024 15:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728402685; cv=none; b=KZr5r6SAZVbw1to3893LzcPcMijHIqkbRMjRR6fY7VXi11XQ/ZISyqHMOhOaLU1Y4ZElHKZrRQG3rPoPCZ2VTJO1vKLuL6XpZBExEiPU2v4KyTLoSJBcaazTg2k3vLVQQwLi8IDl3UsDUWNNZMcizx0Vg+kDKAi+NMItqJRpCpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728402685; c=relaxed/simple;
	bh=/OcYinlfUm2bQAH4EHWqFQBFUipDGMZ0FRph/e6jhIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZ4lkg/mWJySo/KxB4bsY0xOGhqY7yDhJn/LPJwUlftErBed5XSW/Vy/BqNsAggWTrW2IchxPpzUOBJaDrMjPsntJ/+dvxtimg41n5ul0Yvl4rMcWY7k0FzvWNzb3UGRsIBpP5qNB1KWVuXiIZ2pD2N8KAaL5i0BDo+qBiQ5iAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WghEbx8r; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a9982159d98so56838866b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Oct 2024 08:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728402682; x=1729007482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79l5wEjitn6GAvmsuVLo/zoVaHjhNLREDeiP/bvEQAc=;
        b=WghEbx8rx4kwGTKhS3oh/RL1ROF06bmHOetMCjX3BA9xzff1HYMvMl39on0gmDxB3C
         iO7l4sQX0xdrtIAoJr0Z7haFI+XBMs8JaF7AJ4WdRwuNPOuFeeOt3SLs7KHlAnPDL2gm
         CBqjVmKXleuPetcpmuz909BPtLl1JDKqtu9kLP4D0QT8eNLeQs5vm+hUohOgZcK0OhF4
         Kn1AtJgOETWgePYXkS8963+nj1BkwgBfdjJBel0n0oHy17WadgNRRCNuYDtA6NWRTQE0
         ITlGW8o8vUiOJMyvDHCZnilHPdqnBiJOXBnN6o9xalB9JoBFiPHdQxtcUwanHmJo8EwM
         Bxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728402682; x=1729007482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79l5wEjitn6GAvmsuVLo/zoVaHjhNLREDeiP/bvEQAc=;
        b=nUnJWiW8QlHlLYVaL/GGkqMXgS/XCNaO+DZ7OjdrdXXEoOLit/niHjmn7icIOTVfZv
         g0O/g4i7SUWKdOQYjAw8avEYqReyUocpyWBm/pM9gcJEXW/JZDbgd7TqP7qgJqJoxXFL
         WL/Okqdha10TOreb68p3KcMgJqYD2UIks/AOM0uPGqmQL3fy9w7N5dLyXrSxHnslLch8
         i9Wfi0r70GaJWJhr1OAspPHM39z1DQ8GJz88XNmvcWGoDWGHFr5YLjnD5fDcgvlI9lri
         EUPhIXR39J2+I8/rBYYISGNPMdJaboAvimeMmzF+bTMqQ7V6HGWB84LO15hJMxIAVeZb
         zb9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUx8saJKVXxp2i5dyaKT/AYoXssm9MyjByS9s7XAME1URoL0WpfzzF4hNgFnJg0OtTQt/7lbs/n/43DjAc@vger.kernel.org
X-Gm-Message-State: AOJu0YxDdtOJMrSj7sHLyEuRQs11U16fmsAy3Lqg9MC1N1uvwCF8Yl84
	3IkXr0BPa/dpd2tFQTKLHQCH3XTlVFXo83S0uz/LvX/Fp/TvMUY0zjUSEK5veCE=
X-Google-Smtp-Source: AGHT+IF0OqfzHzDOFoA6N9UTBcWS4hGoT4H2SMIkyzUw2kqRYmCyUZ1LiIfXcRAGhqMMaT2U0ST05w==
X-Received: by 2002:a17:907:720f:b0:a99:5cf0:4b83 with SMTP id a640c23a62f3a-a995cf05511mr579718866b.30.1728402681703;
        Tue, 08 Oct 2024 08:51:21 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e7b1d25sm522101766b.150.2024.10.08.08.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 08:51:21 -0700 (PDT)
Message-ID: <cdeec240-5a13-472f-b144-fc0012facc6e@linaro.org>
Date: Tue, 8 Oct 2024 16:51:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: media: qcom,sc8280xp-camss: Fix
 interrupt types
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20240923072827.3772504-1-vladimir.zapolskiy@linaro.org>
 <20240923072827.3772504-2-vladimir.zapolskiy@linaro.org>
 <datahu33nmsser2p4fb2hyncsujtkwaca377ivwmpc6yj2naut@2sjsbebfm3gf>
 <3f87e855-8779-4df3-8f26-e3d2b611d3e9@linaro.org>
 <313667a6-afcd-44cb-a6f6-0d550e8f68a0@linaro.org>
 <4bf490cb-228d-4f01-a956-cacbafa94e2a@linaro.org>
 <27f39cda-932c-4b79-84d4-be78d266ebdf@linaro.org>
 <c18a92f0-5824-417c-94b2-ed10f4580cfd@linaro.org>
 <bb138ed9-2abe-43ec-80af-2d77b7349b37@linaro.org>
 <86d95099-4053-4c3f-a36c-cfb4b63e627d@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <86d95099-4053-4c3f-a36c-cfb4b63e627d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2024 16:38, Vladimir Zapolskiy wrote:
> 
> % echo -n ac5a000.camss > /sys/bus/platform/drivers/qcom-camss/unbind
> % echo -n ac5a000.camss > /sys/bus/platform/drivers/qcom-camss/bind

Yes understood.

Lets go through the process of checking the qcom docs to make sure we 
are making the right change per Bjorn and Krzysztof's queries.

I'll do that, I have the necessary network credentials.

---
bod

