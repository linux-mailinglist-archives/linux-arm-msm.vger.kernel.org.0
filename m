Return-Path: <linux-arm-msm+bounces-42998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6E39F96AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0688166CE9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 16:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F1D219E9E;
	Fri, 20 Dec 2024 16:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mWD4iOZw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499C5216392
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734712622; cv=none; b=A/nUzynWdIgprsnTjutzfcjK2wHucTsWM5awvrnVXIKRNdFaG2jqgpFhfAjd7fgv0tmMJ9SYYKaOqefDy5KwWnt3o0FwkbJwJtDqFk+wDxAZJq36/fMzePuikq5GBSJwnxHf91lGIYkWp83NNmrBRmpPA78bcTM+t8CNHD0QyJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734712622; c=relaxed/simple;
	bh=bEWRU12WpWPIeMDN8FVOFQxbTCC7SXobuaxurF/0EsM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAMPht3v1gTZOsCXXjQAF1pnAuG6ahSgs8PzygNbP7VdjXfx5a4nwe4lirW156UDvdN46mhh3gtYlKftIrGwAZzcBxIWtBSdNjPXo+ZlBMQEgDqZ9a2WzkYyAFw5FUYOQjhX/qxuYRicg23yWmlSMtItx4kuCg4wb6SfFCW+DP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mWD4iOZw; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401c2bb7ccso239801e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Dec 2024 08:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734712618; x=1735317418; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d5A1L57IAweu5CryWVUj44bHWooyuzy3DJH86XpP5RM=;
        b=mWD4iOZwikC6/sY1fhaqYUMyt6tG1yL084IiXUTLp7SdweQRxL76A1KS33G1xlj72X
         yS/Szat3wBf+em2b0o06hBBoUzJZEaPt/J9I3Yfq6THuO5c2XEYL+VDFY91siGt/mFBR
         WFs2AbUlpUNGwmydSnBwCjb8u9sRlVxnX50vjS/qVY7jvD4Wj1L0u8k3DoUW/Ben7MID
         2m3ME3hIapwVhETCT3UT9n8uUysu+/P3jTPcDIR1Z6Vuv8krC7vzzNWXiq5aJZ2ikmFS
         h+PjglAo9J7UjDuC3WbUDkQ7w5qPkpl//ROmBPMesrtWBXyMfq9UhdWYQ3IKBRWF76M8
         nKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734712618; x=1735317418;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d5A1L57IAweu5CryWVUj44bHWooyuzy3DJH86XpP5RM=;
        b=Q3jlrBYIe49jmabcM8R6QxR/yjmg1G4ZENUBKIL7xYYIKKyoNvdBnUiODn2T4bErb5
         ZCmWpneiMnEM/luTFrHe3oMkQa6v734gFpAyBfxDh3smzW1j8eAjisFvT/3wA1vdVd8k
         Ktjvmw14jCQXcoOM5ljisy5j81mCEvtmlraKOKGI6z921JiCC39jp33KyBN21pafzdW7
         K8g/7+Yv6cNT3/Iov4Jy0n5l7b5N0VR9Ta6bmvEEjuMYdLVFCQhN3DT8zRXRj+2h2Udr
         Zm57FQOn+20fCJtPO/jMOK3m8M0OeGeOYY8Li98vGQBBNzyPscc4646I+ulr8b55BZEL
         QJzA==
X-Forwarded-Encrypted: i=1; AJvYcCVq7lmmk0XwrKleHOYLnQh6IQ4F2f1k8Ah24t9jvstYSNfel14WMVf31RiuNGZX/pLP6xhFHHCYnqTiyiUw@vger.kernel.org
X-Gm-Message-State: AOJu0YznTwm45MFEmqIg+xkqZcQjnOrPKS77dt2MsBDY22DViah64D+e
	0vFdXQqeSF+BfQbrFy25FRJBCmj6/KLZTVPRUAQ1pIG7/itPGMSzQ0sm6DBfYfU=
X-Gm-Gg: ASbGncstlLipShjuGykDJtKypMxg+X3BInkoPYdVfZRVeFRSVi0JKnhDLvv9IE/2lig
	F9yn0D5T1xh3LWu4KiGLvWiVV1oROTRfuBafg2DbY6FmMcJOcBL6RS/mYlh+R1jb1JJBRjD+hYt
	1NQCUTIEhVJS1dnQpR5uLTpouMHd9ExKjuABYtze6IjMXcmDY5sBnfJGfI1jK/QII8avAU34JR2
	s7mwilTv0q4pWxsjRsQhttvaHJok/hNjYTWsorU6xxD+5baIHxaGh4GdYJ2OypLsFbsHysGw23A
	RITslcO0UdoGBpyckt0H7BYCpDR15ii1gPQ=
X-Google-Smtp-Source: AGHT+IE8TnK9IvRiznibBWY6VYtR979POUMMCtyniJxLit34dsZxQlt2H0tfxRvYUQfhVYsRY4b0qA==
X-Received: by 2002:a05:6512:1252:b0:540:22bd:e24f with SMTP id 2adb3069b0e04-54229567da6mr425163e87.12.1734712618376;
        Fri, 20 Dec 2024 08:36:58 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c1bsm511240e87.280.2024.12.20.08.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 08:36:56 -0800 (PST)
Message-ID: <d9030fb2-85a1-4b13-8fac-94ee2defca14@linaro.org>
Date: Fri, 20 Dec 2024 18:36:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmem: qcom-spmi-sdam: Set size in struct nvmem_config
Content-Language: ru-RU
To: Luca Weiss <luca.weiss@fairphone.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shyam Kumar Thella <sthella@codeaurora.org>,
 Anirudh Ghayal <quic_aghayal@quicinc.com>,
 Guru Das Srinagesh <quic_gurus@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241220-sdam-size-v1-1-17868a8744d3@fairphone.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241220-sdam-size-v1-1-17868a8744d3@fairphone.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/20/24 14:22, Luca Weiss wrote:
> Let the nvmem core know what size the SDAM is, most notably this fixes
> the size of /sys/bus/nvmem/devices/spmi_sdam*/nvmem being '0' and makes
> user space work with that file.
> 
>    ~ # hexdump -C -s 64 /sys/bus/nvmem/devices/spmi_sdam2/nvmem
>    00000040  02 01 00 00 04 00 00 00  00 00 00 00 00 00 00 00  |................|
>    00000050  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
>    *
>    00000080
> 
> Fixes: 40ce9798794f ("nvmem: add QTI SDAM driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

> ---
> Related, it would be nice to set sdam->sdam_config.type to an
> appropriate value, the ones currently upstream are:
> 
>    enum nvmem_type {
>        NVMEM_TYPE_UNKNOWN = 0,
>        NVMEM_TYPE_EEPROM,
>        NVMEM_TYPE_OTP,
>        NVMEM_TYPE_BATTERY_BACKED,
>        NVMEM_TYPE_FRAM,
>    };
> 
> I don't know what would fit for SDAM and I couldn't find any info on
> createpoint either, not even what the abbreviation SDAM stands for.
> ---
>   drivers/nvmem/qcom-spmi-sdam.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
> index 9aa8f42faa4c93532cf8c70ea992a4fbb005d006..4f1cca6eab71e1efc5328448f69f863e6db57c5a 100644
> --- a/drivers/nvmem/qcom-spmi-sdam.c
> +++ b/drivers/nvmem/qcom-spmi-sdam.c
> @@ -144,6 +144,7 @@ static int sdam_probe(struct platform_device *pdev)
>   	sdam->sdam_config.owner = THIS_MODULE;
>   	sdam->sdam_config.add_legacy_fixed_of_cells = true;
>   	sdam->sdam_config.stride = 1;
> +	sdam->sdam_config.size = sdam->size;
>   	sdam->sdam_config.word_size = 1;
>   	sdam->sdam_config.reg_read = sdam_read;
>   	sdam->sdam_config.reg_write = sdam_write;
> 

--
Best wishes,
Vladimir

