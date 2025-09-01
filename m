Return-Path: <linux-arm-msm+bounces-71377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0BEB3DD86
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 11:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 02A437A2432
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 09:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182453009F3;
	Mon,  1 Sep 2025 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uLsPWZpO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0AF2FF154
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 09:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756717441; cv=none; b=oMGBcXa1FN6S3j/eIZ3UdWwR/Xi4N+T/WKHaBX5nnElErHHrwP9fazh5eFZLS8tkRpUdMgwu7EhFxw5qF1tMW8LQIu+oxXgCWTjkcqdrWy+mYJYy8NC63SweBH8S6xiyq9mk2/8M6LbZWz5Nwqv/aVSMvzTk8+Am35wpu1tJRqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756717441; c=relaxed/simple;
	bh=BRVffIraDrTcVxvFJdlUUUnJJYHLdGtchn0lCofCxlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfkrq/i0gIjtH/SU3rOsP1ZDSovdpQlsX4gR8WHUt+EnyWTEmfIi8l0SD9f48mtJ3nf/JmbFLqdhSjWh2nuXRXvdvtSOqYJN1el1frKVIt8b+6nrd6FrFF7vZQdjoI/XUfDjq3hskt57MHQKJ0WI3pyISG6Wx3BjqwGq8xqUWKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uLsPWZpO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45b89147cfbso10438815e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 02:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756717437; x=1757322237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLxQeBkb7pg30Hm1b4BwH3XF1UA4XXnA9/e/abfa5DU=;
        b=uLsPWZpO019pbS6/8j8oIeTYmgvvc0Ex3Jaa+l0/de6ZS0cox4UQD8OmLDE9g4lidC
         VdVG/JIYaHK8wonXs2kyiOId1/FJRwxzbS9SPmNKlWxdx28wcFexYlFalBwiCGVSa1Fv
         qv4ggfNjlB7jWQNTz2rBnAmEvuAE86tioWV1tnb3yqAmmWDxvrZDlu9em/6bEZSJBoEZ
         a2weE2PMsHZyhb1/uX9ngo/SqovPnAJobqXXsEJMUIs+wS5a0N6WuAf5rq2EOiGqyjPw
         AUZOUc0rWcO1msp0xKiZoC84VHXPWRSddvx1GZHSHY6nWeuG+dO6pZQFv1KiTARIsBtu
         khQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756717437; x=1757322237;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MLxQeBkb7pg30Hm1b4BwH3XF1UA4XXnA9/e/abfa5DU=;
        b=ADmWDhkVzX3k45Uwsbr9s80OBabiSsslihWNTge2dbJU78xPzCMs6wsdacFx++gAkg
         5dQn4HccCrDcF1UhSkyHkgQASdDfaLztfVx+ceqMDMc5B2BRrABK/IYA3Jscb7uN+4F1
         M/MvKhwkNTtNeq+D7G9eDKKWRfU6GVou2mSVp7NnFYd8DTNxM/0JlwY8f5qfv906pUL7
         3fCbT5qXJlqD8GXSSFQd/SyFEinaJVnHjIjMRhyG+pKSvI77MlOEUxlcZzqMM8/ZCZeZ
         m9/0d0MQjJCga3s8kbHWZQic1MyUDmR5JqTEkMkIbRC4UALyFR965wc88NTP+CrkSDyA
         BHLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN7zQgCafL0yV7LhdzfRvpVZbvLGoc6fIyNH4QJxbBmM15sL5Og6OE7ttZKTmLwrbLVx/jbyPDAHVZ7/7L@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/BbfR3WpkzV42JUAzF2Nfxc+H8qQhJxbk+Wnc2TzrrZS9JEJg
	0eu6KRjM2dkxAcqMCOcShGUh7fo/QfOnIlCc9KZwOMI4/iZgzTtdYHujVhqhOlOIZFc=
X-Gm-Gg: ASbGnctKa0lQlmUKaOeD3aDI9KNISHFlsHGuB71TTKvfojmX/2IVw7tVShb+x+KyE91
	MqhhfMI+ID/zr7XLxjMShiHRymt93FT/CrEb20gEL8rFVWVuwAgZ2ZQMoow03HJZo8jXsEBrd2x
	w50IKsAHDmHbj+O3lLtpHUB4xdALFydryVnCXGOcWeFIKc+mAwjBWIdnLngAaMQsN6I3qxtSt8g
	hQLV/IORGeaR22U+6pA/wla1nY/2jraM1/0F1SRWuplO/o42OAZhoaaRK6e0pKVYGmE6glLmLlc
	Ws4H5cabr0J065uQt1I6YJLPL5Q3lgi42NQAr3m6iuoOk2cq/FAqyLVhjDrYn6qLE8i17eOKUXM
	V7bBEldmf+TOh6ENyUU6wzs1pW8iHHdQThQNjFVONGsw6wCptFxsfQGYTB/LfIy09zXT1Wal8Xe
	IkycUoMPE=
X-Google-Smtp-Source: AGHT+IFRon1/4eAXp3QDGK+LmMCItN7KW9fmyhhUSOX/aEte7rl35eC/lBri5/0sH+daAyHsLqfoNA==
X-Received: by 2002:a05:600c:4692:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-45b855983f8mr46646315e9.20.1756717437302;
        Mon, 01 Sep 2025 02:03:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a? ([2a01:e0a:3d9:2080:881c:7d0e:ad0a:d9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7d9548edsm93591505e9.5.2025.09.01.02.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 02:03:56 -0700 (PDT)
Message-ID: <d39a0299-bbda-4284-b7ab-81648a787305@linaro.org>
Date: Mon, 1 Sep 2025 11:03:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/3] platform: arm64: thinkpad-t14s-ec: new driver
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <20250831-thinkpad-t14s-ec-v1-0-6e06a07afe0f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/08/2025 23:28, Sebastian Reichel wrote:
> Introduce driver for the ThinkPad T14s Gen6 Snapdragon EC. In theory
> it seems to be compatible with the ThinkPad ACPI driver, but these
> devices are booted with device tree. As the name implies, the existing
> ThinkPad ACPI driver only supports the ACPI interface. Looking at
> the implementation, the ACPI DSDT contains many mapping functions
> to translate the low level I2C messages into the interface used by
> the ThinkPad ACPI driver. Adding DT support to the ThinkPad ACPI driver
> would require adding all those translation functions, which would add
> more or less the same amount of code as writing a separate driver using
> the low level interface directly. I don't think it's sensible to make
> the existing ACPI driver even more complicated, so I went for a separate
> driver.
> 
> I managed to get system LEDs, audio LEDs, extra keys and the keyboard
> backlight control working. The EC also seems to be used for some thermal
> bits, which I haven't looked into deeply. As far as I understand most
> thermal and fan control is handled by a different controller
> (0x36@i2c5) anyways.
> 
> Apart from that the EC is involved in proper system suspend, which
> is something I do not yet understand (I don't have any documentation
> apart from the dis-assembled DSDT and existing ACPI driver). Right
> now I disabled wake capabilities for the IRQ, since it would wake
> up the system when closing the LID. Hopefully a way to mask specific
> events will be found in the future.
> 
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
> Sebastian Reichel (3):
>        dt-bindings: platform: Add Lenovo Thinkpad T14s EC
>        platform: arm64: thinkpad-t14s-ec: new driver
>        arm64: dts: qcom: x1e80100-t14s: add EC
> 
>   .../bindings/platform/lenovo,thinkpad-t14s-ec.yaml |  49 ++
>   MAINTAINERS                                        |   6 +
>   .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  23 +
>   drivers/platform/arm64/Kconfig                     |  20 +
>   drivers/platform/arm64/Makefile                    |   1 +
>   drivers/platform/arm64/lenovo-thinkpad-t14s.c      | 597 +++++++++++++++++++++
>   6 files changed, 696 insertions(+)
> ---
> base-commit: c8bc81a52d5a2ac2e4b257ae123677cf94112755
> change-id: 20250831-thinkpad-t14s-ec-ddeb23dbdafb
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED

All worked :-)

Thanks !

Neil

