Return-Path: <linux-arm-msm+bounces-84597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F40CAAF43
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Dec 2025 00:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D700930A214A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Dec 2025 23:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33133221543;
	Sat,  6 Dec 2025 23:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O93fM6QY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4794E1EA7CB
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Dec 2025 23:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765064171; cv=none; b=LmC8EcLJvwwbo90/X01Cg+Ttyj29vAD6Fqeqx80M2gKXUkcx/zO8YSpuz39XU3cCimaAjeieRtwbx7FnDROPGr8VdNcdy71WoZUn3PKTbrjAo0YStvTKWNFvNNQ2J7nEz2C9g1Wbr0UgX4sdr+yBwCUZZ73TcP4fh+b/WZubP0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765064171; c=relaxed/simple;
	bh=n39ZtZQpgqh0rmdsLr3Dvs7oradJKbLY8rLQkbdX4Vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dc8Q1jGfV2JVxfbwH0PAXSsVVE/+Rih3xvNspShkb/jdiUmrLfhd1uiA3r43Lizh8pG2Ac5M2dRSPN/tjS8g/KPN1S+UD+CUM55UEoAxdEQVenc3hDU9sYs//us9K1nJb9Kvvp0T5W0VKLzJUbro4OMCvL3NF68AojEZSbRX+qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O93fM6QY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso35433215e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Dec 2025 15:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765064167; x=1765668967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6OJJA8csQgRWCs4kKgByCAwLtWKbPHN0nnLUeeHWkOI=;
        b=O93fM6QYZtSOR+9TPhShlYS1/SQYKdyJeOmZQy/J2yZadFv8fHDVSWmXJ3Xznwr3Yj
         7y2rhexgh5N8GlwOLRCh9sbtUsIb8Ls7573/M17CQTHP/zf/6LG9RO5zTsGEhf3aY9MR
         nyOC/lto3APVNwefIqk+grhSs6d3s0HKcR4MQXK+2P9PQvf8q9uU69aRn0V+QAPFZSl5
         vmw74HurIax0u1Xz1vcdPX5yigfQsIO2uETYzVc8sTvxPkAXIBnJCRQ68s/t7VjMrD5p
         FpFyqOsG2jEeCokucIx0FvvpJIktIVH1IJiO1MipzNzjZKoAL8/ogWn9Tg5SwGajBzmX
         b8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765064167; x=1765668967;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6OJJA8csQgRWCs4kKgByCAwLtWKbPHN0nnLUeeHWkOI=;
        b=gvz1TjBHgmaradLK20qNnGnZG3w42PNB/fEFENiW0eYfPmuqxJQ5qp0c/hkgixnxOs
         +gGpbtArac/nEL9VkBuq/VFlZgTRuNFTf6e6JLvg4F8YQVcLf5cE8ipLZ++LjpxOwUqZ
         ugUc/7mgwFcrW4KTkh5wzdXKqb+/OJmg+wD16Kq8ixpVxY4bFmCbBAxb7KHC6zIFHnkf
         TEwOlM92XZjMVxgdMcsRetwFexOUgn1NHH9v1tAFbA9IrUs/cWjrOOJOC52cKCQekra/
         MAXSfaptBahBzbbGfgVNn7cGnKqXkuuAA/xTlD2v9GximbM8DOS/klL+Hxy7pSG0Fm3S
         IyQw==
X-Forwarded-Encrypted: i=1; AJvYcCVmbiHUKKww4u3SF3mRWRFjFZ0Og7B3+qZf2adNqAKMuCkBYq0suRDi8eeOjaJ3WR41Eaigzn095FFoVe7I@vger.kernel.org
X-Gm-Message-State: AOJu0YxfUizKS093MMzBSzSKwiv1UrtkmlUXSH8i1TZw4TqvcPh14KBb
	KVa8ArBK5ImlkHZIcRCAczmuwa0bmNg+Whuc43B1WJJru9OxwTgnG6GwRDS+hMlLiuY=
X-Gm-Gg: ASbGncsJk6xhTmGujkcWz3+I4LMQVC9jDjXXqPTkrHWkThC1gqfvYsehpn/xHnb2ZRF
	W1ZQIEQE+lvegvdNA+B4eDKeev1xAJUHAoDjr1Pah3OOf8MVkOjDwa5ahb7TF99ugPs+EGyZWlZ
	Y1yjvDgq7eLyZa0iY2nbSndeFaALWAOtcVpkk0S8lVRlHqST8EstppJS6k0FGDBVgo7lehMatHp
	QLTNfWXtHzmDOUlQcQP8yGN2WJ6yVZ/HwW1MAxLg7wYXclAU7qzml4rHwwmd7ZlCKxFw4OTiWVf
	E0udg2tJ/W7aJClMBkUaWPUKItsCehwBkQ90SRtZV/Z3JOAeXYnw8QQT1ZdLyiCA+aV29XJu9Yd
	jm5yXghVINkOphn58P2hZkAmNIx0kZv98F7BjwHpnUdAfiU3lqv5tQELOoO37XvNbX2SCbMg810
	36FWlZQuCJFXRdrZH0eZT0HvVtLbPuEE5fPEdJWTMNMKaUsfYqekSJ
X-Google-Smtp-Source: AGHT+IEQf012fIeorUGnrSpMbj1n0JAaRqvn4fJv5//pu7fi5eLlEUQnRB82jRweo5J65VWhlj78SA==
X-Received: by 2002:a05:600c:8284:b0:477:5aaa:57a3 with SMTP id 5b1f17b1804b1-47939df534amr37167615e9.2.1765064167485;
        Sat, 06 Dec 2025 15:36:07 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331e62sm17312118f8f.35.2025.12.06.15.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 15:36:06 -0800 (PST)
Message-ID: <422cf96b-9f5e-4497-b151-7050f4f11924@linaro.org>
Date: Sat, 6 Dec 2025 23:36:04 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] media: iris: Define AV1-specific platform
 capabilities and properties
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20251110-av1d_stateful_v3-v7-0-9913a15339ce@oss.qualcomm.com>
 <20251110-av1d_stateful_v3-v7-4-9913a15339ce@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251110-av1d_stateful_v3-v7-4-9913a15339ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2025 17:21, Deepa Guthyappa Madivalara wrote:
>   #define HFI_PROP_BUFFER_MARK			0x0300016c
> +#define HFI_PROP_WORST_COMPRESSION_RATIO	0x03000174
> +#define HFI_PROP_WORST_COMPLEXITY_FACTOR	0x03000175
>   #define HFI_PROP_RAW_RESOLUTION		0x03000178
>   #define HFI_PROP_TOTAL_PEAK_BITRATE		0x0300017C
> -#define HFI_PROP_OPB_ENABLE			0x03000184
> +#define HFI_PROP_AV1_FILM_GRAIN_PRESENT		0x03000180
> +#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED	0x03000181
> +#define HFI_PROP_AV1_OP_POINT				0x03000182
> +#define HFI_PROP_OPB_ENABLE                 0x03000184
> +#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
> +#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189
>   #define HFI_PROP_COMV_BUFFER_COUNT		0x03000193
> +#define HFI_PROP_AV1_UNIFORM_TILE_SPACING	0x03000197

I'll fix this for you because I'm infinitely sound BUT

#define HFI_PROP_AV1_FILM_GRAIN_PRESENT         0x03000180
#define HFI_PROP_AV1_SUPER_BLOCK_ENABLED        0x03000181
#define HFI_PROP_AV1_OP_POINT                           0x03000182
#define HFI_PROP_OPB_ENABLE                 0x03000184
#define HFI_PROP_AV1_TILE_ROWS_COLUMNS      0x03000187
#define HFI_PROP_AV1_DRAP_CONFIG            0x03000189

please stop using whitespace for tabs !

---
bod

