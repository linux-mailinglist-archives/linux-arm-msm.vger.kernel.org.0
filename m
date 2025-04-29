Return-Path: <linux-arm-msm+bounces-56133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE43AA0D52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 15:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA1683B7421
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 13:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 111B22D1915;
	Tue, 29 Apr 2025 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qv9dgL3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266B72C3779
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745932703; cv=none; b=Ui9KD41mWqCq9H/pi5nxWSu0DKAR/Do9Mprt3Y9WWd6cyw6f+h6WczHnUOh1j7nkAF2XDaCw9WBm/MOTNYO7CeJapfCHxJp7xpw4/+dk9yGii65VnlMFEyAJsT8h9xmHSRQO8L2Bkhz9g33lm3ZEqaQdOKl8gM/CGbvZSeFt7LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745932703; c=relaxed/simple;
	bh=7GuFmJlJkpyEj+Xz5PCNI0n7N2g2U0yxS9UydMYaeqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fBYtM1jGuFxqbGQd3cSGr0Fr1RFYIndaWgrwjTXpKtsqxiN/lvcms/h4EA5rcLN6J8uQU0qYl5oLB0wtK/aYNrLNWDIcreq4IorelXkBh3SrN8Hv/Rfrui7APXrAdlXlMyLLaJugzrzNzpSbPIcjaOOUu4UUDyubQfGIrB/U2x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qv9dgL3h; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so56699095e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 06:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745932699; x=1746537499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2XlQd2/HEe5mbj/2V1eX51IsWAdpjepiCj86XBPTjGQ=;
        b=Qv9dgL3hUdK1A6yducaIN5zKNYmfXlzrP6Cg/QyhBk/ULdYlxQvgTZMGL0a+65AD7C
         ZIvANg00xgIei4ahZa5fZspLKTD8PKtW7ph8/elCToGs+mvGJw3h1GJJ2+qHdlFfOarL
         ydEkvOE68e8+YDj0qQqgzl9JjrZzKNTuzdM7/A/SH8HvXf1OoScFmjauYRktdZB76thl
         6lz0/MV5Q2tOP5LOrE6RFW+R7DgYBMe8tRahmLiCWkembDMyg042JW1qut2BhDeOIMrl
         yFh+IvfsMJocrMMmynyL7xy8yg1HZEosySjN9IN7z0c5VzruFYXV5hfssMHCn63cj7ZS
         5n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745932699; x=1746537499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2XlQd2/HEe5mbj/2V1eX51IsWAdpjepiCj86XBPTjGQ=;
        b=UG4KkSgfShNufgMa4gppt6n0NZ5Grz4auwqN1N0irqEvUmvF0YRfM6+f13v1XkTQVC
         mVSRDVUbtiTgJGGn+OufG75r/pGTy5EuDdn/zhUB6iZdzdYk3E21qJLJMjD1Ps6e2hZm
         RwUEfJoBNef1ryoPFpSCZNPYfwouab7sTXvMWi6dhGTqn1JxvrIakhsuLpwEerqlXgMQ
         x0OMNXRFvupXoa6qO4tj4W4El0dIzmiYvvgGlxZBXL9E8MaV3bgEkH/3bYXjGXK6fB+R
         xkU5DNpNRcOd6Rl5JjBxtyVlzNf9kk+/W/jkyOW/NZJtI0ORpliYr/vmzYJtRPIwhw9j
         t4+A==
X-Forwarded-Encrypted: i=1; AJvYcCVAnA0vRLZ9iXc/oNuh6ba11iJeXXtLmCBYkXf/Fxabx0BRLOqRL3yVmkc5C4rmV6DPkIEr90xI3TXbhmF8@vger.kernel.org
X-Gm-Message-State: AOJu0YzQzK4gHWlTX85oSumJA3HwXFcKHY80aV7Mt674UbGtk6j20gZ7
	dhIkGJ6JoWyfFWdk/5VuLL915JSsV5uldycM/jeIhyy88VrREXq2g6ruygxnBHw=
X-Gm-Gg: ASbGncv3p7CcQoNVaps74fxWqH4f+FgLDfoluYeZIqZvW9CTXzEzG5gGfHXhlPrEz6m
	iFUe3JQAeLP+iAA1OZD66hQxBNpfu7cthMzWWhIXtUxX6kBRRWvkTGI4knNGHelJEyE4A543SYt
	Re9XMpvqN5Zt5FvZDWSYCK1NISibCH69G0dVX2zdRSTRPbGZIyxh+ubkruTiCXd45f+/1UBZVKE
	aEInb1+jnEnkyDwrkGy1dzIVDFfzwh1Cf+RYZ6aLJOe0WPjdhg8+obqJMOMOuZTGjkt5MVz0IKp
	nBeMoW59rKf6mL+8qqX54OZt2QqZ0aI3m0M4uPbg0PMeFrnNp7mPx4m/o4+sJ7JK3XTiAmZ1y4U
	5yeQojg==
X-Google-Smtp-Source: AGHT+IG+VQ+1R+K2OB7YlKrxn+da+IIVh40TXy88JJghKE4J3gyi0OFrpnjF7OqWP2RlC1qDNZ6eCg==
X-Received: by 2002:a05:600c:4e51:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-440ab79f582mr146937895e9.10.1745932699387;
        Tue, 29 Apr 2025 06:18:19 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a5310ad2sm155816935e9.21.2025.04.29.06.18.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 06:18:18 -0700 (PDT)
Message-ID: <c5cf0155-f839-4db9-b865-d39b56bb1e0a@linaro.org>
Date: Tue, 29 Apr 2025 14:18:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] media: dt-bindings: Add qcom,qcm2290-camss
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-6-loic.poulain@oss.qualcomm.com>
 <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
 <CAFEp6-0iXCPn80Y0s6Hoq2MjgNa+OYJEr0oWSKuXtah_OF6cAQ@mail.gmail.com>
 <e82a8733-a3b9-43de-9142-7454bc57474c@kernel.org>
 <CAFEp6-3EA5dQJCsZYaqr_ySV1hV7kY+53jTo9ZaX6kx3rq7LYQ@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFEp6-3EA5dQJCsZYaqr_ySV1hV7kY+53jTo9ZaX6kx3rq7LYQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2025 14:08, Loic Poulain wrote:
>> OK. This however starts new questions: why aren't there separate nodes
>> for the CSI PHY controllers? These are separate blocks with their own
>> address space, own power rails, own interrupts and own clocks.
>>
>>> (both of the above are supplied together without individual control)
>>> - VDD_A_CAMSS_PLL_1P8
>> This does not need voltage name then.
> I've been trying to follow the various threads on this topic, but it
> seems there's no consensus yet. So wouldn't it be more practical
> to use the regular/simple bindings, similar to those used for the SM8250?
> - vdda-phy-supply
> - vdda-pll-supply
> 
> I understand that more complex bindings, including voltage, CSIPHY
> index, etc., are not necessary here, + this will likely be replaced

The thing is we know that a single rail for all phys is not correct.

The choices are

1. Continue on as before
2. Do something interim re: my proposal on
    csiphy#-XpY-supply @ 0.9, 1.2 and/or 1.8 per PHY
3. Move to defined PHY nodes like just about every other PHY in qcom let
    alone linux -> dsi, usb, ethernet

Its pretty clear from the DT people which way we should go.

So, I've already started working on making individual PHY nodes based on 
our recent conversations.

I think tbh that we should push merging new SoCs and just solve this 
problem outright.

We can aim to merge the remainder of x1e, as well as all of qcm2290 and 
sm8650 for 6.17 then with the new PHY structure.

---
bod

