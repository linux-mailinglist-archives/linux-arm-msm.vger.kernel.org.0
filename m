Return-Path: <linux-arm-msm+bounces-45751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE73A188E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 01:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8692A18879D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 00:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E0C4A24;
	Wed, 22 Jan 2025 00:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s6nfezr3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B642A182CD
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 00:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737505390; cv=none; b=NKz7H/FEAMXHG3GuvvsmpSRiyWZXjyu9txF+D9grmYdOK11wVDvZCBt+j6dEMftMCsLsjdCmBXabkke4JA5ymc98Savz3+bi94mhH13l2fsMQsKkqJUUHBo3a0DHr9B/Zwj9eJxDkPM3JYP4Mf7vtMzNdx+Obc0+cmWt5vUe2fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737505390; c=relaxed/simple;
	bh=4yCpljMzPlAVYGrTlq8EYb2mmWKfdU7nrndVdkCBQKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d8FxOcgR6KTLLZcccoAtXyi9LTnmd5tafrsoE/aQAYQNywl6oxibqegDluZCj/ghUX8qcuZNWZPk0yI7uhzJdbefssuy3/8ycl/3DE4V8/r2QusEqlhTR3zNhVQ7HQRohSJu7Zkq8H711fEqAk3oiVnfa35CKCRwoFL0K6OeYMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s6nfezr3; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30167f66717so4414881fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2025 16:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737505387; x=1738110187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u0HJqNUI3/7Fv7C3ghrvDvyETXZbWbMIAg+sHqC9AMM=;
        b=s6nfezr37lPhkB6njjLcE6VP7emBUg/LpKFDIGcW9DDdeZ7rvdgTFia64rMNNamGUu
         YaBlXCzFq6ks5NWnUKT/FiBqkd3dy+upMBoDUoaoZ1S6NCBDJ3yAiAxEf5Aa9iKy9n41
         RCTCQXwXR3PEpXdCkpeMnT+9AzlSumV6J2aAJsG/LSbjLolIjc39RoUoAUflydfx8RVZ
         J0dH3fAQGqxHnmERYyXi76ryxcEe71dFA+LGp/QuepSZ2zbd3qqXxCbXc+UNBFeFGP+8
         MQQDqAarjQoQelOVgW9fV8VlYcrapveocn7cMaLgabPGQTFIH55a9q1y5QqK0vF1lYYe
         HnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737505387; x=1738110187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0HJqNUI3/7Fv7C3ghrvDvyETXZbWbMIAg+sHqC9AMM=;
        b=HVdbyz6WaDp1yJue7FGm3w8t76ulfTvlS+gcYX14RNn8mVhzcrtGrM9niRaxZLcS7u
         LLy534W14lDRyViYu2fJmNdPAjwk2Tjo0rifBFLWse3XssRqRB3urHXzIrxC5jIkZumF
         Gs4vCGQUpxma44xX1Dln5q4VWaMi6IiuW8NUj8N3QTmxx/BHyxI/edBpke9407Kwv9Sz
         c5zQ9lKQympVxgAC3ynZnF5ok7Zitwy87bibhhC+r584EGCnOlfw66GOzLXYJ2JsIKA6
         GgpLdTvYTShI1Sl3sjBZJCdMNtN8D5tqCyclMlbstJEbhrH0EGtV7eCP1AkNqzXibLzT
         nAsw==
X-Forwarded-Encrypted: i=1; AJvYcCVudJYuqTRe1G/D9tp4Ah7hp+atU31TwoKR267zeNyeEZR73TOKbneHXkoi5c3UFhRFZwWBOGUv36Xk6m24@vger.kernel.org
X-Gm-Message-State: AOJu0YxBz0Jkaj1Y0l8uT3GLCx4lGoR0fWKa+3OiGXCllhm5RP0yFnOQ
	nDgYrGXAV3t0m3ebunDFlJHUpzZZSgI6fntRGzHwxrePQ2pAuHjTS0oZ1cv50sw=
X-Gm-Gg: ASbGnculnhmgD3dbptcllMRs7EZrGowrvHoANykToYlHUa2S2Aq6gcEis7nemtjccD5
	wK17jssw1L5+60HgNIpyLkEw6gi2qyOfqzwLr6XoqgsDWezhcngWjEWJDs61iLRgjfppMaEYwIn
	CiZJb+TFLPozBhYZiPWrbUtXsb+npjcTXQ8RSA1pP96INjSgsdNVkuYjLRjWG9q4vifOAkg0pcW
	a7wb5wTGoBlG8nScTQeougjGDi676v8NRmYcn758Z/r0gxomFbrckuu2VBprQZuGVBQ/ZuCqkuQ
	NyqtP+uEg5lAEAK51m4OKk8qR56xSlyPkRqidRteZHZ7EIh1
X-Google-Smtp-Source: AGHT+IGehczE7c0uuAo0Zo0nBz5xQR/MBgNuOF0Q3+9sCbYo6xr1LGkNlCSvRELQ1OyRp1ZW7lODuA==
X-Received: by 2002:a05:651c:221e:b0:300:c10:7c33 with SMTP id 38308e7fff4ca-3072caffef9mr24267851fa.7.1737505386792;
        Tue, 21 Jan 2025 16:23:06 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a3446c8sm23683521fa.27.2025.01.21.16.23.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 16:23:05 -0800 (PST)
Message-ID: <f6fa8949-6c49-4aa2-8b3d-1ce23ca73f96@linaro.org>
Date: Wed, 22 Jan 2025 02:23:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] media: qcom: camss: Add support for 3ph CSIPHY write
 settle delay
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Depeng Shao <quic_depengs@quicinc.com>,
 Vikram Sharma <quic_vikramsa@quicinc.com>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
 <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-5-44c62a0edcd2@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-5-44c62a0edcd2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/25 17:47, Bryan O'Donoghue wrote:
> Currently we have an s32 value called delay which has been inherited from
> the CamX code for PHY init. This unused value relates to a post-write delay
> latching time.
> 
> In the silicon test-bench which provides the basis for the CamX code the
> write settle times are specified in nanoseconds.
> 
> In the upstream kernel we currently take no notice of the delay value and
> use all zero in any case.
> 
> Nanosecond granularity timing from the perspective of the kernel is total
> overkill, however for some PHY init sequences introduction of a settle
> delay has a use.
> 
> Add support to the 3ph init sequence for microsecond level delay. A
> readback of written data would probably accomplish the same thing but,
> since the PHY init sequences in the wild provide a delay value - we can
> just add support here for that delay and consume the values given.
> 
> Generally these delays are probably not necessary but, they do speak to a
> theoretical delay that silicon test-benches utilise and therefore are
> worthwhile to replicate if the given PHY init sequence has the data.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

