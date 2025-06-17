Return-Path: <linux-arm-msm+bounces-61621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE1FADD839
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 18:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B12B4A3987
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 16:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B622ED16D;
	Tue, 17 Jun 2025 16:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KuXylERU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EFC239E7B
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 16:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177844; cv=none; b=XhhEevTZPyeZ0eQIFsB3DFYtlKfRWHjenDsKNlJM1x2xmm6An/jTukwLiuew0905BS5tqLJB4ICcDgsxRwU5PxD4u/IjHeRN9ucNBVl6SlI+wTxlQ3xtNjonWJcypxsgJRQyj3rLeVdNUjBMXXzEgGx3zzX6T8JPH1g+/skWenw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177844; c=relaxed/simple;
	bh=92dyse23h6JXvee3dXbWSUKtGr8lwMEvpeF5vbNoRAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cjZ37Fj5bkmqO4y9moecLw416yh87MmT1vrTRfXhIrS7ycMI3fSbxC7hu00THt1tlIhYvyRVqB6RiFZLjYmLmT9yC22I89zBgtpATedJZYQn+f+6/2rdRLvzO3lB4zbEcNH2L++nY9L1jZAwoJE9ZUqpVoCME3Zf0NSdN8EmTow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KuXylERU; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553af143356so367262e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750177841; x=1750782641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKWQGllLmr+qLQbLghsrgPHsywgYjq7ibiyjzz6QaX8=;
        b=KuXylERUUOvvc7NklI5IQto4ZnlF5KY31+ceYwIeygryizrK0qt/Us3G2zwaBYpkDB
         /wwLfAlfxVlw8rOAoHYulm0mtfUUaabBc7n79u+HP4Dsh46y58Jcj0qAgORYH0ZKMv7/
         2vGiUaMMqXRm/RB5CurXioprnS+tbQDjG0/8K6aRZTyAoJfUIcDK/dLisxyehI99q+/y
         JWQP7kdrmu8fBwvibE0qQOTuLi4B/Sy+DFONMmDVjFsB4hwJAZ+NRzGd3MvkQmMS+o7x
         oXWbuS36FWW0pHGxJl8gLEOxBsO7kpq03FjL8nNkdOmNxOg49jVFOG0TH6rC+g6roK7R
         zJag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177841; x=1750782641;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKWQGllLmr+qLQbLghsrgPHsywgYjq7ibiyjzz6QaX8=;
        b=Fde5NYOnc1YidaYR+F0u48neHKXFCziMl20f4XxgpQ3ce7oOE4eJrtg558YgYb4S45
         EhTM9bGjWCA4ttNwREqc4SROhHM25XrOpyRtGJoiytTPGNA6ug9iH1QcnRDiAlPHzzRC
         SaZt/XGRSmfGZ+/5vgS9pLlCfuWAd6A/RHLBYUKHJSfVLxcWQPyBpmoIdc+Q7aXD706h
         i+IHZxSudvpaGRKNtfSJHAI8LpR0gIsLlvA8HpYrAw4qz/o4ZwMWCc2CKwczQWGA9fS+
         Oito3JCMZ/CHYhLXjO3ABat0AEvZ7JE1Kh8mABk7b1lIuaOVLb2Ba1qfKsiZ8Y07zAmh
         fJCg==
X-Forwarded-Encrypted: i=1; AJvYcCUkQHbU7tHRIKb+nC0IRA4fWVWqm/YtaNHGhoXGhqpAQURc9NaBpfzGIV0+oQb8vj4LsuUyUvWKUEYPGbpa@vger.kernel.org
X-Gm-Message-State: AOJu0YxQZvzxkHORZgVSi/faJs3RL3vKysMhnt8WLThvOAeKJsNohIJV
	KAEAcNvwsmjxlsE+PlregkLV2smAf90J+ZVbxh8kqmPIMF5G/umXUejLqPwR90w65dk=
X-Gm-Gg: ASbGncsZ7GkasuOO7qvgUxA2AgItmZ0FBXe+H5+Do2BAMrTA7QYKt2SiIpjxjXQnBBN
	S6RuN3bj87qrKpxBk2rkQxYcSAAuiepeVs9V5dtpbz0V2hp4T/NDoayiRhKnKX97bjhjyYurbec
	FLnHGBmozCtvnkokwwWToT93j/VJiHz6C6+1/p+QsE7uNSvO2/b2fA5gq4A6djRRduxDisgaeZ0
	ock8af3QWC4bn2Izp53ysTb1dKoGyv/1SmbB1svciz+q+ZwigaFwMp9blc55hUlWs6govIXhAeK
	LUHxipDNKiv3nRqvloVK9ayE3+19mfmoUVyaMRG/JDCvTZd1M+TiwWybxxkBnhzqIUwEPAnfLBP
	MYDchyAGQOQ3u2Bmbd2v8dpgCBgqqhnxS2CX837yS
X-Google-Smtp-Source: AGHT+IG1O0EQZqSHWUxhKDiVNAb4CQwzoQEy891M5j0PGfDaKo0e09AEW2bjqZxxn8TyTHtNGy5IRw==
X-Received: by 2002:a05:6512:b97:b0:553:2a74:b455 with SMTP id 2adb3069b0e04-553b6e8b1ddmr1127584e87.4.1750177840384;
        Tue, 17 Jun 2025 09:30:40 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac143a7fsm1982363e87.87.2025.06.17.09.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 09:30:40 -0700 (PDT)
Message-ID: <53de7a8b-b0fe-4a56-8746-d2019d26eee0@linaro.org>
Date: Tue, 17 Jun 2025 19:30:37 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] media: qcom: camss: change internals of endpoint
 parsing to fwnode handling
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <yzkDfU7Mw7hBOVlBNpZ3U-n5SK8AMuFq-cGYPxp-hdzeaGy5aLQdZ28j3eJldg_18hj0x0H1y6EV42d1e1Zlng==@protonmail.internalid>
 <20250513142353.2572563-8-vladimir.zapolskiy@linaro.org>
 <69563c23-42cc-486d-9c01-3467859e7860@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <69563c23-42cc-486d-9c01-3467859e7860@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan.

On 6/13/25 12:30, Bryan O'Donoghue wrote:
> On 13/05/2025 15:23, Vladimir Zapolskiy wrote:
>> +	fwnode_graph_for_each_endpoint(fwnode, ep) {
>>    		struct camss_async_subdev *csd;
>> +		struct fwnode_handle *remote;
>>
>> -		if (!of_device_is_available(node))
>> -			continue;
> 
> The change to fwnode seems fine I think but, either leave the
> of_device_is_available() check as-is or move its removal to a separate
> patch.
> 
> Changes should be as granular as possible.
> 

The change from OF handling to fwnode handling assumes that there is
no more room left for of_device_is_available() calls, it passes away.

of_device_is_available() here is useless, CAMSS ports are not devices
and they are not disabled in board dts.

--
Best wishes,
Vladimir

