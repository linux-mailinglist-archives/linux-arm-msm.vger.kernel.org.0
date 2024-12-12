Return-Path: <linux-arm-msm+bounces-41633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB849EDD25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 02:36:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0C1C18889CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 01:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF0C6F2FE;
	Thu, 12 Dec 2024 01:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d3QJR6qX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C422558BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 01:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733967358; cv=none; b=dvWjrfvQIAdtysupk6mdUAwa10lOyJc0WNLzj5Rf2OLC662MmdM6lvL7Re1G7kMuDhl+M2R024gdgP6Y4hT/sj7I5mJ6qxqHI6GvZmajtBzqXWnmsBPumWmvUhJ0Gn175O5Dd6m/bNflKx3CxPqNl3YbwcDsGR03X/0zbH/p868=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733967358; c=relaxed/simple;
	bh=4I8gLbH5PN0mP0QVrcUYvhMHECsTPhYZMcXQ+WQ+Uc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXB9DPFMt9hrI2xoISyy+HMnC6datMSkOkM630vCO5767NgQ+/uzoKPNekk4tQP6FtffmN4NO9tN9w+Jow0jsklhLt/cNAOg7m7Blfh2nKq0rVYKXKLumUiyKp03vvUTww6Ec5nzaYUrlrC20aZwTh2HOMAt9FyZdO35sxVp4lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d3QJR6qX; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso6599866b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 17:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733967355; x=1734572155; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWBYwTpQeje3+MoafQaLkq72MrcYW1QRecg5ZQdtiMY=;
        b=d3QJR6qX7NaDtFxjD2HaVKM15ka+CL4FmycuhGVcvU193ham67OVEVHWRAvdL2fFBn
         L4rSuM0QIPx8kSGKJFJ27wquoivXydzsaSyB62RKamesCymLF0gK6XQU1aANvA8SA84g
         opWuJ4oJm0ucRyVOW8VikUm9noo4wqT2V25PVDKt9hDX4hfX7DZ4FMznSKDauPaPqhJj
         vvQMW8mpB7R+5i0cvS80QfhgYOAPq7Y+fspXovMgKgWeF4m4fAgpXg0uYWh/WtRIl16D
         Foq2n10Sylra61fI0HnKQTmFgt5v7qEcorZD/KyaWj8XiNk/K/Yc87tXLWUvb3kcKquR
         DKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733967355; x=1734572155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWBYwTpQeje3+MoafQaLkq72MrcYW1QRecg5ZQdtiMY=;
        b=N3ruIagQFZAKwzQAdBUbmWqJeJ/RKGwBLXI6sipWjN43Uih29SJhZlKMKyExn+/3hO
         ZLwdstCxbNBjm8PYHXdmpSyZUlnMqBcskHRw9wxqncatTR43WHw5tHq0PSyh8VNpfb0u
         Q5Nw8PeOYgu7HIuTeWlRjYWfqdII4w/2N4Ds2NgbzyK4e7LUQf2iRic4kyeKDSwLvxng
         rMMEgMsnC7oD80nIMWkejkAMNBfygLWRnHOtrrdBIMWP/YwzZT1T6Za9c7rjABewtXWH
         RwL/1bHARkOJjIdHDBCs6XOYjc+7taxR9VucWqH3Oi4U36Yuq+KXT0RmXFrVCyb5a67r
         7M4A==
X-Forwarded-Encrypted: i=1; AJvYcCU/MBNaHbBi23D7oo1PZ7yNi7HNrv/BIhpDXiMHgoTf5P9+mPn/F9PtnP8gjisXQBe9PkLWnbu40ccpeFrX@vger.kernel.org
X-Gm-Message-State: AOJu0YwM3lRrl009pYvRPluT2tV8LlptCwy42AZ+4aM7y8F17x36iG33
	FCVaBK5E7GtHKW6TdnSqXXAcWC+uXMHnDhfFsOgA1a9JiqrZkzF/j8DKtTD682U=
X-Gm-Gg: ASbGnctkZSGHWpJEPvRYBWrbACpvi9PL/HuBks+cw+0e6irOEr4eAnyVYml/Hp2lks0
	Ic82QVJn3qWYSNEhGMq62W+q59t5zpX3dHT1KxXMcHKbe8WaWxGQn1KxffKBLsNAwpsSLcI/+Ti
	W5JivrZNVB+hmy6VzoHFij0UMtokMyARKH1FIcjmFGcVxHRJOTNoJV5WX/hw+8XCJs3Ne8YHgd+
	gTltWrbCsfHLt4tuHEUZwk04UTcYCYJuGIkmqdmJGEHUfHRmpKc86T7e3PDIu/qJ3QNcQ==
X-Google-Smtp-Source: AGHT+IHgvSzHuYw/GrNRNjwFCk9Xmc3on0B3OZiRwksob+JXvyPD2txPuKabUXJltPHhBbSxp616fA==
X-Received: by 2002:a05:6402:360b:b0:5d0:81f5:a398 with SMTP id 4fb4d7f45d1cf-5d4330356bbmr10824470a12.1.1733967355629;
        Wed, 11 Dec 2024 17:35:55 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa69c3512f4sm398006366b.2.2024.12.11.17.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 17:35:54 -0800 (PST)
Message-ID: <ef9a65a6-339e-4428-8487-ead242b3b2d4@linaro.org>
Date: Thu, 12 Dec 2024 01:35:52 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] media: qcom: camss: vfe: Move common code into vfe
 core
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <20241211140738.3835588-9-quic_depengs@quicinc.com>
 <79fc669d-999f-42f3-948a-ee5f3a91ddfe@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <79fc669d-999f-42f3-948a-ee5f3a91ddfe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/12/2024 01:06, Vladimir Zapolskiy wrote:
> 
> This is a massive and a functional change

It shouldn't be a _functional_ change at all, just a refactoring and a 
reduction.

I'll take a look too, see if I can spot a regression on rb3-gen1 and 
replicate the breakage on rb5.

@Depeng we can probably get you remote access to an RB5 if you need it.

---
bod

