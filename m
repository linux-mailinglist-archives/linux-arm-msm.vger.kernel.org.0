Return-Path: <linux-arm-msm+bounces-84159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DBAC9E356
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BFC9B34A99A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8F529D281;
	Wed,  3 Dec 2025 08:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ht0w19ae"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D196E2C376B
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764750360; cv=none; b=EdVTc0uqomt0zgbQqfNaPRjVt/cSQc5IP9SNAUOxBoVnh+TyvkilL8+iiRekTn1ZdqDaf7HZ2CqfZNbuUCtGEN6RGrh0L+fQYRdQrSmT/OFGNIQlqWrCGBO8TJBgOKty0y8d5nCqKbzW/16JtrQ0LGsbSrg5EX0jFJewWJhucLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764750360; c=relaxed/simple;
	bh=/NXgQG0xOs2Vb9+EC5Fvx9enDTKCtG8oeX2wJtfWjiE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dF2Q89kV9+M9cgjf4qoVKG1rIHljA5mLwnxtUVcQz1rPPnhB+NRxhZMzemQUD59Y2SqF9n94bsfCid4yLA7lDF4BCFeKLDccQPxXJTV3nbIUC7yxJ+iqGE/x73ZPvX2xP18b6mI0HacfHfVNyJ2UIPXru1OwBfvCKKozg36DsOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ht0w19ae; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477632d9326so41052305e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 00:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764750357; x=1765355157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHzHe58fsvGLgrRPvS36XGIRe+uYE6BH0rl65laVcEw=;
        b=ht0w19aeOh2eXqt7D35Y32kcaSjNWMxJ/pXWPAdcPMxKa1Yzq2Nm1TuEbfxu6D2FfV
         gAO0je/J7G0IPI+yR1EfC9ZNQYRsKoLsLruZ9UeFXDdexiX2EN33uT8EkKVwKhGGUwIp
         FFfQLApMq798zWa28u8cILXYHiPltgLsTz7TQU4SqtOI9/wFh7IpGEG+UsLLSjVYBtde
         At/ZvrG7ZmcR7NA+w/h+2kK7Tq3RWYT8DuZsR7S+M57ATwtWtEzY1WiNu8mx8opaC+8m
         QTZacnhtnrPWn0h8Hy8wNzgBT+7HzHc4SpMHlWN9/uVuE7H+x5NWEdgFX+6c+4ik1w2h
         ZR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764750357; x=1765355157;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHzHe58fsvGLgrRPvS36XGIRe+uYE6BH0rl65laVcEw=;
        b=ulFbnT5r8UqluAVBlM6kOEwmG/KpeFsL30E+qK7hV1MRTavR5o33SgWj3XHYhGLybN
         0nRw4yhmqMlsR5ykT4qFOoPGGJT3Hn+8DUjQ1LIAe7reNAqEzMylKKsjjNlqbhIMblnr
         rQw4P/6NhWXmveJ8IVvN7Yd+FTFTcFkxMzEscFRo7/IvNgk2EbCX0z/MNkgwleCYzHMz
         G0D1gKHnfSS1sp9EVTVgz7ymx+vWx1cJmU8KiOOIiMNw7YSAqMHAJiAnYEIWQj41M2aS
         EzUbADZhlyH0X0XAdhl4rxul3rmvbo1bFXPvD1pkrin0CoEQB+CtT5LdgDaX+C//1wb8
         lvWw==
X-Forwarded-Encrypted: i=1; AJvYcCUe+SW32SeCqh2C+7KwBPTCgMAE4VFccLJBMya0F+9tU7scdacCtyfhFIxzNnZlrOPtdQajU0X4aCTkuDdR@vger.kernel.org
X-Gm-Message-State: AOJu0YyuosXAoN9ptHyCh55JZXRnJ8n++wsQ7r8+ecnwwzYdWFFGoXXI
	bYWOaNUZwjuMEl6Bnk3re4ch/GS2OL4rm2+rfkunaxiXksfdrAmz8xNOq8WE13Sp6K4=
X-Gm-Gg: ASbGncubNcrMd+DCQG+nxru4anzJ8kGeRWijWOKHT8CexgAWhpoUuB9BHU7/oSMk+R5
	weTfNB+Ur7rQhkFdGsTxwj740D+3aI4lmt2nbCdA8sjvRK6xjbMYWk1JPGmw9r+i6C3Wjsf5yD7
	vCPEaysvsumcJQu+YDTQQ52x0PyBvc/d+RXBzZ4UZuI+HXpZexojr14Wx3XF4jF9n+KS6IyxkS4
	+BwkdXLDiFnJLARp7fuLjIERZc9R1Af30SQyqqazm64qRxP9kddxgEB/KTBENUQn5vu1TOgBJpf
	WVB/JJ+fdzgSr7DAahw67/8IISMHgQod4XSVa9lRLxhyRnZ7EDn8KWEAVxw5/1S4NzuqavqnGVI
	72TKx+2aY1ObmrOzjCHL3jaY5mu8cFiFYyiIzkqbT0LF1l8CFIpgPA8Iy5ydPkwWtNNds6gEhJu
	bb4qlwMPCA+VwI9FFvoq+XSje+7tBq0jPRsaZbM3oJdYhlwFoN49gd1r/pLB5LKg4=
X-Google-Smtp-Source: AGHT+IF/fEOY/ijbQscZNFAGzTrfA8TJUMUQxP8gJi/0UPcnOEdUxoCEK30yXC/e1Ij8/TqdFOhkwA==
X-Received: by 2002:a05:600c:3b26:b0:477:9ce2:a0d8 with SMTP id 5b1f17b1804b1-4792ae60275mr16332235e9.0.1764750357151;
        Wed, 03 Dec 2025 00:25:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:955c:3368:b15d:18c3? ([2a01:e0a:3d9:2080:955c:3368:b15d:18c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a7a31ecsm33060555e9.7.2025.12.03.00.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 00:25:56 -0800 (PST)
Message-ID: <ae0e20cf-807c-476e-a87e-bd39352c5acc@linaro.org>
Date: Wed, 3 Dec 2025 09:25:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: sm8550-qrd/hdk: correct S5K3M5
 properties
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20251203040538.71119-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/25 05:05, Vladimir Zapolskiy wrote:
> The changeset updates voltage regulator property names and removes
> an optional data-lanes property of Samsung S5K3M5 image sensor found
> on SM8550-QRD and SM8550-HDK with Rear Camera Card boards.
> 
> This reflects the changes in the dt binding documentation of the sensor:
> - https://lore.kernel.org/linux-media/20251203040241.71018-1-vladimir.zapolskiy@linaro.org
> 
> In addition to the changes above Konrad asks to place 'status' property
> of camss device tree node as the last one on the list, do it as well.
> 
> Vladimir Zapolskiy (6):
>    arm64: dts: qcom: sm8550-qrd: rename image sensor supply properties
>    arm64: dts: qcom: sm8550-qrd: remove data-lanes property of image sensor
>    arm64: dts: qcom: sm8550-qrd: move camss status property to the end
>    arm64: dts: qcom: sm8550-hdk-rear-camera-card: rename supply properties
>    arm64: dts: qcom: sm8550-hdk-rear-camera-card: remove optional property
>    arm64: dts: qcom: sm8550-hdk-rear-camera-card: move camss status property
> 
>   .../boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso     | 10 ++++------
>   arch/arm64/boot/dts/qcom/sm8550-qrd.dts                | 10 ++++------
>   2 files changed, 8 insertions(+), 12 deletions(-)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

