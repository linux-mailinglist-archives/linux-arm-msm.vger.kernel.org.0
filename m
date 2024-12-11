Return-Path: <linux-arm-msm+bounces-41531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E60579ED0BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 17:05:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF13618886FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7A31DA10A;
	Wed, 11 Dec 2024 16:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kon1QaTR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27A41D61BB
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 16:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733933012; cv=none; b=CGcW9TFJbbx1Ntzd1FNbj6tOH1tXT0eCAtKbGGnuKtw8ixQhW3AqGAagdDsIHTMWR19kROLXN9QSTtlb7yS7N+mdcQsIWJeK1dRxRAV1W/ErYZCLllh0r1AOGhzGwtXygejs0eCYvdMFZYYm9vySbn8QnZrOY6hMn2UH2mO+Wxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733933012; c=relaxed/simple;
	bh=o9NBCAJibBE7Cg/Mwi3++Bxz6puXmkfI8Fuw1rijxM0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=PxA9u3IVT8UL5uWkT+ZkD79MLoBZCk49bkf2ouAX1sbrOgshi9y9wSdFQjwfMaLbwt4YGsspXHsCOv1Z/owK7og9LMzSz86Ky2DEEzFiFS/1qOP5ByXoZPcAimvHDzUCb1vmE1jbbwtkw03V6sGZ0X9dAsiBuyUqXuaFdV74CKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kon1QaTR; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9e8522445dso1379687366b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 08:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733933009; x=1734537809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i5RH8KE9lwCw2dJZrNysrG24xTalE49KqC5ZdyyDDKk=;
        b=Kon1QaTR8FkOLe3+OHyisYBVCt0EH4Pz7D1+l321yNMl3xNtYW7+x5CwJr0b+ODpTo
         h4F8dxub+IUHhjV6hA2AUsCbPRthA/+E+TgTrgBidw771bMWc3/qCfsHIorPsL+iZed/
         1hCsX8HP6xPk92XC69mdd99mNN1LUqxE5IRb9RT9/8kbZqZq970SYs3lV4Q3DsOXWiu3
         pysiGBEHjXoBwy9/rz4bLW1wN6ROhrUUGE2kGZXgn6IgVzU+ed0LKC74zij05gGz4q8w
         7wNqUPc/bfbgeR7NXSrAOR6CS/qa3+XPRyPC6LFG5vz6OfGAlvbnRq6gcki1umR1aOcP
         7wTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733933009; x=1734537809;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i5RH8KE9lwCw2dJZrNysrG24xTalE49KqC5ZdyyDDKk=;
        b=Lm/jHI/LBg5oC/4vOlVTA90kvBMnATBJkimeEMklhWIT/hlZwESwo0K70GPK2gZl4q
         0w1+9Tcf5bvgIVK+R9SxSqeKUc8IjcJbYzXCgWXkK8+5meL+N3Be0wwc7oGgxMuzt28N
         IvYREVJoLDnEr4PEyJ+nYIMb/MeTEuVBATJURLdy09on3VViHnBnA9JxInfVzomWhuXR
         4ybqxCsj4msQ68/jr6lnVaIy1lgwiGh+SbBOyrsGMKHojfr51RXiV7krGxHCB5KhkuSY
         nTEm8x5zg24DLH0gzMPF/tt4XTufNNyeXpvIGOIuIss1lsTCtAAEGgfW0zfkEPlv81cH
         n99g==
X-Forwarded-Encrypted: i=1; AJvYcCVFDT6AY4179LK+lAuNTB2+NTOc4ZYQtC1Ac0Fpl0Ret1A07KfCRNoaLy7A+PrmmulMZyKT1Hd4Kgw2m3UJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyFrD6T+ugL108aveNHaq4OhiSQqiG53AhCdikivbLvAw5t70wE
	N1XHylvo1Gfg8n+JWcUo7Xq1ytKYstpA9dregtS1hx4gzj+EUwoj5sEeKVxAMzY=
X-Gm-Gg: ASbGncubqnlphkSmo6EO5iOux2YufrE2f4Tuzgoqdk/ZdBB9CG9gJPGfpAkqnRGhE1g
	rvJ20hqn+hUjwmg2aVbTsreyfb+3lrORGTFisi7aA/6uu1awCVn2ZfO4pQ98GHOGU9xmySP7Jsi
	iIhvQruDPip/Z8p/Js7r67e5EFtr7rDr1x5uzB5p7mgg2CbowvEbT/qY04c+SvPyyuwio8wySnA
	GZF3AYuP4hIiSZaiLb1w9VNFI26CkkD9tuv6aQD15Q4OQirnyr9MaZ0RPpult5Qrsc=
X-Google-Smtp-Source: AGHT+IG2FdkJPT94HQEtRGwYWaBTAxIlJjHQeKSD0iBM++VhPK90sU5ykr6gyv375oO439qmFde18Q==
X-Received: by 2002:a17:907:7712:b0:aa6:87e8:1cff with SMTP id a640c23a62f3a-aa6b11b33d2mr276373966b.24.1733933007333;
        Wed, 11 Dec 2024 08:03:27 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6b473e496sm107680366b.99.2024.12.11.08.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 08:03:26 -0800 (PST)
Message-ID: <63828150-ef52-49c4-bc60-72c1f6bff202@linaro.org>
Date: Wed, 11 Dec 2024 16:03:25 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/16] media: qcom: camss: Add sm8550 support
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Depeng Shao <quic_depengs@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org
Cc: quic_eberman@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241211140738.3835588-1-quic_depengs@quicinc.com>
 <12704563-f2d5-4e2b-a6ad-53b8ab5c5df8@linaro.org>
Content-Language: en-US
In-Reply-To: <12704563-f2d5-4e2b-a6ad-53b8ab5c5df8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2024 15:36, Bryan O'Donoghue wrote:
> @Depeng.
> 
> Some of the patches at the top of the stack here - won't apply once 
> Vikram's 7280 patches are applied.
> 
> Could you please rebase your series with Vikram's patches applied and in 
> v7 send a link in your cover-letter to highlight the dependency.
> 
> You can get fixed up shared patches from my x1e tree here:
> 
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/ 
> x1e80100-6.13-rc1+camss?ref_type=heads
> 
> ---
> bod
> 

https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/arm-laptop/wip/x1e80100-6.13-rc2+camss?ref_type=heads

Same patches on rc2.

---
bod

