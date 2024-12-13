Return-Path: <linux-arm-msm+bounces-42162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A84B19F1951
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 23:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A9AB164372
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Dec 2024 22:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1760E198A05;
	Fri, 13 Dec 2024 22:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u1C6JoOz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C7C1990CE
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734130001; cv=none; b=Mj+zMjUg8+klIrcsOwSiA7LEYb7O08Kh67MpJxFj/rRBXK8osxFXDJccQqbyi/EEs3Vtk+MVIINGmySSYLFDd20wVgiezkY4D5O3X1a4/dz950RuNLpqw1gs0K6Lcu4avFVMUHJF6skE8ZajyhLNOScsGoRxHNXSJs5IvVLUtcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734130001; c=relaxed/simple;
	bh=40UdhAIFkNpCWAKbO0Y7oEN+u3yqHZKe340TjJTE2Pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVHCHmGFiSTg0AvgguSYRbu6Tr4iR23Ugm0uPctXNzK2i0aJ67Zw4kHa+F8FDIRKkje4dWefH5KW/seAG98RR8gqGmag6U+wFRc+jX93BvlTa3WO/VHd8jzfM1oQYlzB0CNJSyDeLoxQx/zJY25aIipqKQPgGyLOgypYRUeFm7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u1C6JoOz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43635796b48so2222135e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Dec 2024 14:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734129997; x=1734734797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KTuOD6icErcsFYaW9j21xu4YdtqCIv9gqicrizfjG+A=;
        b=u1C6JoOzkQJPC3UQZDOR4MvJw28UOvYZGDM57yLagGpDp8kI9tIPdAGfegoiGkiVaE
         8M/MZwHxbXq+GlHTWOghP20oYfSj4Bl+KWDL17cCUXn6XSUBYSRsB2zEBtx5K0mZNrH5
         ZytIBuQQVDDm1pgYnfgSLkiuKr1xgqpV4kWAIU2TsoxbgWXqpqCAi4LzuQmEcm3ZRF+N
         +w4+WXCBJK0v+Ha4C2h8Fd7CJto+bYteYgvbnAhtCEZDRGyAeMysKZzljEQxtO7BW/TU
         x0PlqUQi5ua089j0S8bF6WzA04xyllyy4csPc5Gn4LTf+xg9sCzV9eDU6xVbE9e/eMIt
         AopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734129997; x=1734734797;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTuOD6icErcsFYaW9j21xu4YdtqCIv9gqicrizfjG+A=;
        b=uAc20m9BCc7A2B3W+6LcvowqASrCTIjtV4CG0K1brAwaLX55ewF5E/w/6Iwnphw38k
         joEE/gZ5nXlhT+JR78M/Kbcb/0eCgs3nt50JgKQLIyYBfuOAKPyBgoKm7ItlIQt3S8sY
         +54LrY86TY4juM82MKL7qswxu8+SzzOIfvIlFGAJWk+TIrJNBo2WOvsbKTHu8XvqtP6g
         ZkfNdnOgFsDlTrGA6nqI5yC1JxQPq+nD5z8bGXnyrIl0CvKTy06rOHzxBn67nVUa3HSB
         /tbH0a6RRyyXyIZOQRNq0fSKUPdVEzbWIPNlv4qH2SJha/SB2wAPCDI5wyA3i2tJBmOC
         uQnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWelyaZUOZWVjSyRZesTxELN0y+TrL51GywMawcoA85SkIoNvnv7Zu9ToQ/H0a94ViD+9rRy1eIW8QE3vmL@vger.kernel.org
X-Gm-Message-State: AOJu0YxJPfCLt+ADTeP9Idw8dAPCRxKcjktltuPi5EaSN/SwDg4AUEke
	Q5aWnsVUu6Ar9BxknRufkALuYDjmtlfyCjMFwpx4iDXmqDbPPEGxSYZYr77s6Ek=
X-Gm-Gg: ASbGncsCihZcpFWLMe1xuCwss9FPzOC4TpO/YTj0mMZAstqNQcATGNJkOpJ1704HU1f
	QwI34WgmGsgyg7YDppDcxO9I5hX6/Byk8IK/Syb1TxrySWon2FQJPh4f3yfnEjQuoPX3prwKoxN
	BCgXvteSYPdztVVyd8usDIbWngfy/4cKblatVmQH1PQCptVnoeVuaZhqtwKncWDrRBV3WmF8A3F
	LGxyAQ/D8LgBe8aGn6f0nkJ1ildPfoXhZOegX9CIahr2UPH6q+RKC8ozEKIpV8iijX/mg==
X-Google-Smtp-Source: AGHT+IF8LUTsKZXa8frqGxeBxZl582Ej5d81AFeE5NCeWffygpOwWGp+rL8WjqRfyLO0969GF07PDw==
X-Received: by 2002:a05:600c:c8c:b0:42c:b8c9:16c8 with SMTP id 5b1f17b1804b1-4362b14bbe0mr32131525e9.10.1734129997407;
        Fri, 13 Dec 2024 14:46:37 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436255531b1sm63871835e9.2.2024.12.13.14.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 14:46:36 -0800 (PST)
Message-ID: <47d81240-2717-48f6-89c5-f64f7bbd7505@linaro.org>
Date: Fri, 13 Dec 2024 22:46:35 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] media: venus: Populate video encoder/decoder
 nodename entries
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: quic_renjiang@quicinc.com, quic_vnagar@quicinc.com,
 quic_dikshita@quicinc.com, konradybcio@kernel.org,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>
References: <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-0-ef7e5f85f302@linaro.org>
 <20241209-media-staging-24-11-25-rb3-hw-compat-string-v5-2-ef7e5f85f302@linaro.org>
 <e159b61f620eea520b06e20a294bf84be781fe19.camel@ndufresne.ca>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <e159b61f620eea520b06e20a294bf84be781fe19.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/12/2024 20:00, Nicolas Dufresne wrote:
> Hope this hardcoding of node name is historical ? 

Hardcoding is historical in dts.

We need to add two more chips into venus before iris is merged and at 
feature parity for HFI_6XX and above - HFI_GEN2

Something like this.

enum {
	HFI_1XX
	..
	HFI_6XX
	HFI_GEN2
	..
};

 > And not done for newer chips ?

HFI_6XX and above will be fully supported in "iris" with encoder/decoder 
selection done at session creation time.

Iris is being added phased. Basic decoder with one format, followed by 
decoder and additional formats.

Once we get to feature parity HFI_6XX and above will be supported in 
Iris and removed from venus.

Leaving HFI_4XX and below.

That's a long winded way of saying new chips minted from the fab will 
either be HFI_GEN2+ or HFI_6XX.

> We discourage userspace on relying on node names cause it always leads to
> complication and non-portable code.

Writing this driver from scratch - basically what HFI_6XX in Iris does, 
you'd select encoder/decoder when you create the initial session - the 
initial state.

For venus that's an unknown amount of work to do.

What we _could_ certainly do is make the static assignment in this 
series assignable via a kernel parameter.

I'd say though that's an additional series on top of this.

First pass here is just to fix up the original sin, not to improve 
selectivity, just yet.

---
bod

