Return-Path: <linux-arm-msm+bounces-89040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 513B7D2074A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 18:12:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F6B9301838D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 17:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FE1A2EB87B;
	Wed, 14 Jan 2026 17:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F40cSKjP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9CC2E22B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 17:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768410755; cv=none; b=swN0IMb1DpIDsnPnXHbUvEH2DdoEjOdHjyDkHGUkVCKXKVZmBDaTqQZnnUKKePwqWSP9IuzAOozEzvqlfbCZoQ5ak48XMPmEy0iMG6dvZ+PGBe1jVKiptcIs18jyav3ZMNBLT250s0NrlZE1jHupaMHSKu2mCRLs/STMj9DD2Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768410755; c=relaxed/simple;
	bh=eiioKJ3tLh9q54ub5L5c6Y0umdmDSBQ74CLvEFFADKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5EC6updXRdOdhiaRZkHPsMAHUO1tF8ExkMtEDvjpEToI9IEGugjfoHM3FDhTYy7u98paxPVNbMebMoW+J2YpuAaWMpTbI31Ob8GdHdHf1sQCXybOGeq2Vg0dvLGRDercQ8jw1/0Tx0NojxjIRBptoTSU7SBOh2YE8RO/dSIXK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F40cSKjP; arc=none smtp.client-ip=209.85.221.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-4327790c4e9so41213f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768410751; x=1769015551; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxA45yuwhvAuNepLYjlGsV0QtZmbxlWi4B0eDH+Qoig=;
        b=F40cSKjPuUS9b8AQNb7n41c8bf3rJO3dOqC19j8s9j+SLVX3pRv32dnlxbWGxeFn+I
         vwZw0tw9aCFgTVgfjJdYSlA7aLkfqgM3+BGQkwWdsAmv1uSvR5TEyMmqbhaTI2sfWsFq
         1tt6YUjKD7w38ihJ0KMrN6hg5n2rfiWARq4dSfVvmCl9tBjAea1ch+MJeDXPmyHQX5am
         KFm93C63hvZKa36KzLfAOls+5XsZ1x4Xh7xFvFMD0KgsFYw/GCbK6oXnpqqhazMiaDjX
         QLhZd1rC/HUPcc5pd/dpG/h8jM9ypJSBU9M33NANcLA/cPXT+OLx2cwMzbVyb704KgxB
         VDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410751; x=1769015551;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rxA45yuwhvAuNepLYjlGsV0QtZmbxlWi4B0eDH+Qoig=;
        b=l+AvBxwPr4X5JYE6pArPRrVf1HimvwXd0TLJnwb09Tr+E+BbYMvFbdtkZG6jn5O4Vy
         TkfYkakp43jaQ8ylhl07ovcsOA1S6Qy3q7WqKEOM9MRkwRfCnIE/7SR+t+0JG87cB83J
         q+cmJYkZYqWgmMu0xh3MVjtKLVdOKCSuVl8dvzXms+XcvOSxVJq5pRMs7oit7Cq8+aeb
         P4korbn6Q1mK7frKyXhegCA2zMpHdMgLVG8MjJALF4pXuT3NUAXH+4p8PZYVrr4MgDfv
         UJ6K34d0bdrHeFQ2fNdp92oCUoRXxlTFXr0jAYsTYGUDaNIjWC8hcbNjaOyYOSBgAjLY
         j1eA==
X-Gm-Message-State: AOJu0YyP9aeYGxBgHLelQND8tZLGlLiTE3yNWzjqbpbLe5NlgB8aoCDe
	m7SjoIby0NsjHB40xBWFpN6gaW74RxnDqa2J1mGqIRhVBrcWuKED7C/gn+1kSUpoZUbqIpXAKIr
	GfQsw
X-Gm-Gg: AY/fxX42gMWOVdYXRFNCo4dV6TYgni7tIvXDrxxAenyyMYfU6tTnEIlY0ZrC5bdZSyI
	wrr/BQKhNAFEvlNQr4SFkFvx2DM34Z9pbPPXWP0OKbhHxuzL8Swuy/3mcZzjOodlnt/Zgn5kPJJ
	+WoMQR+gTjAeAFN1koAHVfsYBXpeiaQdvqLdL3hgMZvyDSi6NTYRL797ZMgFeDVCoPw0gFwC3w7
	cBzHIRgl1hhKpt57MOpHPTHgCsOqYoD+FluQW4Q0eJ6rdy7HMaIW5q9w2Nw1aQwq5xoO04iI8vW
	6B+HOPznwwvl1A9Rbb26AqmQgm84BZPDPgL4e7JfNUQiL/rmLaPBSW5Koxd0hy5Gjxr3RQH1oCh
	X13v82nejuYH0qSmXC8bhlhQ9UHK/WXD3pPfA18pel2ebFUzJwQbVrTJ6DVtu22mZQCWwZ6rHWX
	pK5JnDg0m9y+tSdB465Uy7KZPKJ6vdcGqL4bAcUoGFmqljM+jMESUfUqDSMSs79lk=
X-Received: by 2002:a5d:5850:0:b0:430:f1e8:ed86 with SMTP id ffacd0b85a97d-4342d59bef0mr3575666f8f.4.1768410751001;
        Wed, 14 Jan 2026 09:12:31 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d? ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6e09acsm360931f8f.35.2026.01.14.09.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 09:12:30 -0800 (PST)
Message-ID: <d153103d-4b9a-4380-b5cf-1f07dcbcedb8@linaro.org>
Date: Wed, 14 Jan 2026 18:12:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] firmware: smccc: default ARM_SMCCC_SOC_ID to disabled
To: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, trilok.soni@oss.qualcomm.com
References: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
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
In-Reply-To: <20260112-disable_smccc_soc_id-v1-1-a5bee24befb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/13/26 07:24, Satya Durga Srinivasu Prabhala wrote:
> The ARM SMCCC SoC ID driver is currently enabled by default and publishes
> SMCCC-provided SoC identification into /sys/bus/soc/devices/socX/*.
> 
> On platforms where a vendor SoC driver already exposes widely-consumed
> attributes (e.g. Qualcomm socinfo [1]), enabling the SMCCC driver changes
> the format of /sys/devices/soc0/soc_id (e.g. "jep106:XXYY:ZZZZ" instead
> of a vendor logical ID like "519") and breaks existing userspace consumers.
> 
> Flip the default of CONFIG_ARM_SMCCC_SOC_ID from y to n. Platforms that
> prefer SMCCC over a vendor driver can explicitly enable it.
> 
> This avoids unexpected format changes and keeps the generic SoC sysfs
> stable on systems that rely on vendor-specific identification.
> 
> [1]
> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/soc/qcom/socinfo.c
> 
> Signed-off-by: Satya Durga Srinivasu Prabhala <satya.prabhala@oss.qualcomm.com>
> ---
>   drivers/firmware/smccc/Kconfig | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/smccc/Kconfig b/drivers/firmware/smccc/Kconfig
> index 15e7466179a6..f830d11ebdca 100644
> --- a/drivers/firmware/smccc/Kconfig
> +++ b/drivers/firmware/smccc/Kconfig
> @@ -18,8 +18,11 @@ config HAVE_ARM_SMCCC_DISCOVERY
>   config ARM_SMCCC_SOC_ID
>   	bool "SoC bus device for the ARM SMCCC SOC_ID"
>   	depends on HAVE_ARM_SMCCC_DISCOVERY
> -	default y
> +	default n
>   	select SOC_BUS
>   	help
>   	  Include support for the SoC bus on the ARM SMCCC firmware based
>   	  platforms providing some sysfs information about the SoC variant.
> +	  Note: Several vendor platforms provide their own SoC information
> +	  drivers under drivers/soc/*. To avoid conflicting sysfs attribute
> +	  formats in /sys/devices/socX/*, this driver defaults to disabled.
> 
> ---
> base-commit: b71e635feefc852405b14620a7fc58c4c80c0f73
> change-id: 20260112-disable_smccc_soc_id-ed09ef4d777f
> 
> Best regards,

Disabling it by default impacts other platforms, the arm64 kernel is designed
to be generic and run on any platform with defconfig and from the same build,
please don't forget that.

If you want to ship an arm64 kernel tailored for Qualcomm platforms, you're
allowed, and you're also allowed to disable ARM_SMCCC_SOC_ID.

The soc sysfs interface is designed to support multiple source of information,
from vendor (like qcom socinfo) and smccc ID. And this is well documented,
and pretty obvious...

Neil

