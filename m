Return-Path: <linux-arm-msm+bounces-45174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC4EA12EBD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 23:53:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9B433A7BD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 22:53:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC9F1DD88B;
	Wed, 15 Jan 2025 22:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YHGp0IwV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42DF1DCB0E
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 22:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736981510; cv=none; b=b+FOQTZlKHkrqOD52VAGJJM00bgm9W2q/ENteWpBZ1M9CJwL28LzzELX15iFvRv/cea9EH18iqBDI1qjg2MBDWCxQZ9fgkf9TokAmG2bYLQmKNJ9nhKIMi+wb1lANyUaq+GoYapZMY90R7lLixa7CF2QE5chWX+h8/5QJSacgXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736981510; c=relaxed/simple;
	bh=QxFEBGcR1CdG6irlGiHovcxB3ftN1n6CSXPIZNE7Bd8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Lu7WU+DAH/S0vjTuWz4ZUdVWMsWBSig2NjMzkCmKUUuDKc12nJuw+bggzCny9t1FLFC9YdaWS0gBJdX6cAWbJOMCf64N6TD2o58BoMjvjPRnaBCTLjO8BtjGPqoE5bVhX/lLsafj/FC/WpPCeLv2AsjzQgcJ8iUkORSZHzRJoVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YHGp0IwV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436a03197b2so1340245e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 14:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736981507; x=1737586307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vZEM/yr/sJJ+vK/Kh+SEVlD5R3K0fT0VdR1mPmEBOBc=;
        b=YHGp0IwVyeTxYBzgdt0B/mCs4WpZ+3UZBLf9oCPsq1VzPZ3c6y0plGk76WjLAB/iaE
         GEgV5g56MtpR6OMmQhoZNnxagvuc3Zv9PnL3Z3ACasVcKNyMwGGfbH5aSv6VzvRTOGgg
         OpOxkJoxXKg5GXhurgxqRlViEDgQOoRkHgbamqQuCZD8NUjtSr03i3AnfAmd4EKcP2bb
         wTBAbYT5i8P6lvOzZitk4jbb6mWJs7LhRYmQahEPSenHw7zZl2MS1xhW38MbKHZCx3hu
         oH5kpL57hhctoMbGj46a/49A8JAhj6ZADMFwEBUodR07wp9lmXP7WnZe/0n9MIkt/XaP
         OePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736981507; x=1737586307;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZEM/yr/sJJ+vK/Kh+SEVlD5R3K0fT0VdR1mPmEBOBc=;
        b=Vkl8E3uZYyRAOkdGaAgT80ohW3JX4DxEJQW5o1Zra665GX8cOGPAB9BXUNIgnfU+iF
         g0b1Fs02irtCY7MswnYUfDUB2GgAvo5Y2o5F4aunEYl13Wd4dS8EF9TSQRBG8khobyUv
         BVPOLRECDejgWjIKTpLDx+pd00F5avpQPmgU9O97yY4qDDTnPwzDmkKNZgzjWbzvWxll
         5R2v6Ymj0k70jr+vCfCDD5vqQogCsTAjZZutjQGG2cuyzLhNGkWq2HjIqRcuzRQ8GZFy
         02011eTm1YaQn5OLnDorOd7UGPOiennGRr98pUzw8qUCeDCRl8K7iPuoGwGFwstBPKEp
         18TQ==
X-Forwarded-Encrypted: i=1; AJvYcCWISyf5goKblnzYUvmw5ORpkOjrI5Bkgf3bTc6WBoF3vCzxxMKur/SGCvPaziVY81tanzBRjuUe2NV2njZf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz4q9YJCSXOXkI+Ld8/SU8vO3sV0K0IJu062Z3J5XF31PykFgB
	LNi24FZwJ8d+nyCBECrzrYxufcCalBpiSP/g67ec2s1JQlpZ2KPGQxbo7hTO9c8=
X-Gm-Gg: ASbGncvM08Ca5b4XGYbNkGVIXS6Jot7epLQnI/IhhhO+FuLm0rrXLsRS3XERD3ezyCQ
	ZrW9ftMP03qnWiv/0HQYQXsSrSn+DjErX28lxXAFTDju+BiaJz6bI9rxorF/QzE7sA2QI4Bh05R
	EgTl9a/18kl8ycjpnczqv3n6NI33qlOxdNnXDvFVj3/PPicIDUvBNHkfygLNnOSoLeQ540OdhMx
	prF0+Hu0zTlwj8Li7vrPyeIEA1PXL7nl/6svQCkqmPpWlthbBtlXDYsr7PFLj40ZArj6A==
X-Google-Smtp-Source: AGHT+IGUheXR4YGw0Ar+spKtPL7X4S4R5Etrl4Vv5SUbRLCIhXQKPJyNUv/uMmmcRx8Nwt1FXOXiag==
X-Received: by 2002:a05:600c:4744:b0:434:a7e7:a1ca with SMTP id 5b1f17b1804b1-436e26f043dmr260503665e9.20.1736981506906;
        Wed, 15 Jan 2025 14:51:46 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74ac707sm37448145e9.15.2025.01.15.14.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jan 2025 14:51:46 -0800 (PST)
Message-ID: <42b0bf4c-d39b-4a97-a746-0a1f4c1748a8@linaro.org>
Date: Wed, 15 Jan 2025 22:51:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of SM8250
 SoC
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Johan Hovold <johan@kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
 <te2nhzkl2mx3y7vknokzwtr7szfge7dum7sy37ndy6laot5yqn@urv7svjqgmk7>
 <1bcf0995-cb77-4e01-b3e0-14f88dc91140@linaro.org>
Content-Language: en-US
In-Reply-To: <1bcf0995-cb77-4e01-b3e0-14f88dc91140@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/01/2025 22:49, Bryan O'Donoghue wrote:
> Shouldn't there be a parallel venus patch which either has its own 
> module parameter to quiesce binding in favour of iris ?

I almost typed "either has its own variable _or_ reads the iris 
variable" but then didn't.

Shouldn't venus have its own quiescence variable caveated to the 
transition list too ?

Caveated to sm8250.

---
bod

