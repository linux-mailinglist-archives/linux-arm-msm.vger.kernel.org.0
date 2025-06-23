Return-Path: <linux-arm-msm+bounces-62019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A53AFAE39FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 11:26:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36AEE172157
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 09:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBFA231853;
	Mon, 23 Jun 2025 09:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P6Nklvny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1171F1522
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750670795; cv=none; b=RpmvPJ6UsJEFYHkEADxlbSGqHimAq/rqLiFj90tFjsDCL0vzyJs2SZsFDRqnawEHkfNay61QifbniHwmEO1e5xhQ7wqTRT5LEHwSeCDpmGgplfYy3HG5IHMGVLWifwIQ38Kurz5Lyx9+ImwlmEQxppCeNsqTwtBh4FHC+GSa52M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750670795; c=relaxed/simple;
	bh=xtUyqMFV83fTFQBF+WMWiz2UvH3RGoxUAJ5qhkmGkgU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kT9tbcZruTcXUnIP9WzxWWDgBmO6JSeoOVsjru476lRUZ9MsGdSNuYQVDAJAadIwBClvns7Jw9WpEeliyDiEfhll413wG2461Ox0rXp8IA3KicIqA3qeV9+KbCC5Sr2hrAM7WtFPuSXhiC2N04kRceKaMvcYakP9AnVUYj4qX7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P6Nklvny; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so40310905e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 02:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750670792; x=1751275592; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X21lnlJPbDK4NppSEK68ujExR0n2cpS3qgLeA8C+iTg=;
        b=P6NklvnyCcnF0xy4FOxNUmG0Ifzgnd72NlU/WM3sp3u+Klh7W6Ksz8MGQgsnc5iCPK
         aINuti2SqsZDffvDx5uBlAE8raAsLWONX8NYVhi3AqQXXk9qBbDk4HGtEYCmKmoUcjDG
         lq6lUsc2+pWC6/UnP6f1Lcspd3e7ZToTlNiCHMtpLqB7gtYfTUg44Us0Ny7t38JBVnh8
         LaQ1kZgBO9z5GuFIq8GU4TsJtvL0LkWbTcZ9+i8QL7VYTJI8kbwzexB86UXu/FYHR7VA
         YA+bd0KT/XCsqf1XJQrKa3GJ+P7XH8DCgIo9nRZ4/x3ELFMcrnfoUP7cqdjHmnzfKYQv
         Swog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750670792; x=1751275592;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X21lnlJPbDK4NppSEK68ujExR0n2cpS3qgLeA8C+iTg=;
        b=XBBS5wMfpSPv2yCOVQIeGhX2X5HQidJj78MOO5Z6APO/p3Emg4gxcjlzTNCg4qyL6C
         5YAyvcJc131h8/HEHwyRUze5750uWK8sAf6bFIOV4++96EbWz05r7rwKPsu14uGHdP7B
         ohK0Vi93AieXPke0TM3NDShLIHFy8Tb+CyRkKGQFHx68gX2hhYL06FfIv7SeWkOZ2+6P
         Cu4WTMW75aEGghTRH68mFiqfS+4i82wrxBOxLU+KdPMBdr9KX503wgT3G07kH5/47FJ9
         n8zrQlMRkVg0CvW9uikLTanYptQQ6ResE0gqpqpIt2ICTmBYRWjjM+4vt4dSm7Vv56v4
         EB6w==
X-Forwarded-Encrypted: i=1; AJvYcCXJANnEeFtM1ax6RfO2xVpJpQXcxfIuN4wEP3anoV6zrmutX+h0wEt1/42c8ifELMZ/2+Kf25tfUP6Mv88D@vger.kernel.org
X-Gm-Message-State: AOJu0YzN9Qg16rjdJa2wTBQA5hCVxe8AUWZl5tptJQUuQNmID1lIzexG
	A2ZUnGp+l+nAYQu8G1qAA1iBnKkZPbFwqjD4ridUOtkKoeYylY9OcQe17pDekCKnyxo=
X-Gm-Gg: ASbGnct47tN10S8kz7lcShOonhiCDPpv7587osfvnuMsRUYmEKz4gT0HLITcWRjyT/S
	1EvSJMgAFo11z3zedgQ9mFWgnbg94lhTclATM3vgqChfv3Vg2cdQnP5sHea1o45vXq1j82m1j+8
	n2Ca9Ix0eTvu88uZCZyxrhNlUofGUle+re4HnMneudnG+7SSX0LGTMBGC5251Ar/lGbBiijuIq6
	QIIdD08v31/qRVpUgKYZpRINNcVDBHRbINfnFvprvbIu1HeJKqPwXKWWvbQAj2j+gyuj04qBsVd
	bVgjMa0jvjlkQ65Mlu9u32Ne6LmEysWcQ9DxniaGqPGvLikSEQwuS1h5NnTggsvYGnnAZg2KkUl
	uBlsxnzuQ6mHFLBwkYRXNdv7Uifa1w8/QzaTN3J0slq0lo08rAQ==
X-Google-Smtp-Source: AGHT+IGMCQ2ZGbiUxUdbBOCEAWG6EmdQjuiVRNOyZjUlYiahyPCL5XapfPJY1qYD9YRtPLuo9lXxWA==
X-Received: by 2002:a05:600c:c10b:b0:453:483b:626c with SMTP id 5b1f17b1804b1-453660bf3f8mr68932685e9.23.1750670791982;
        Mon, 23 Jun 2025 02:26:31 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d? ([2a01:e0a:3d9:2080:8c08:7c51:bbb1:5a2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1012bsm8972255f8f.5.2025.06.23.02.26.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 02:26:31 -0700 (PDT)
Message-ID: <df889cdc-fda7-409c-a9d5-4f33a59f2b2c@linaro.org>
Date: Mon, 23 Jun 2025 11:26:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 5/9] media: qcom: camss: unconditionally set async
 notifier of subdevices
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <20250513142353.2572563-6-vladimir.zapolskiy@linaro.org>
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
In-Reply-To: <20250513142353.2572563-6-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2025 16:23, Vladimir Zapolskiy wrote:
> For sake of simplicity it makes sense to register async notifier
> for all type of subdevices, both CAMSS components and sensors.
> 
> The case of sensors not connected to CAMSS is extraordinary and
> degenerate, it does not deserve any specific optimization.

Could you describe the difference on behavior in this case ? and how
it's still valid ?

Neil

> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 30 ++++++-----------------
>   1 file changed, 8 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 976b70cc6d6a..4e91e4b6ef52 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3556,7 +3556,6 @@ static int camss_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct camss *camss;
> -	int num_subdevs;
>   	int ret;
>   
>   	camss = devm_kzalloc(dev, sizeof(*camss), GFP_KERNEL);
> @@ -3627,11 +3626,9 @@ static int camss_probe(struct platform_device *pdev)
>   
>   	pm_runtime_enable(dev);
>   
> -	num_subdevs = camss_of_parse_ports(camss);
> -	if (num_subdevs < 0) {
> -		ret = num_subdevs;
> +	ret = camss_of_parse_ports(camss);
> +	if (ret < 0)
>   		goto err_v4l2_device_unregister;
> -	}
>   
>   	ret = camss_register_entities(camss);
>   	if (ret < 0)
> @@ -3647,23 +3644,12 @@ static int camss_probe(struct platform_device *pdev)
>   		goto err_register_subdevs;
>   	}
>   
> -	if (num_subdevs) {
> -		camss->notifier.ops = &camss_subdev_notifier_ops;
> -
> -		ret = v4l2_async_nf_register(&camss->notifier);
> -		if (ret) {
> -			dev_err(dev,
> -				"Failed to register async subdev nodes: %d\n",
> -				ret);
> -			goto err_media_device_unregister;
> -		}
> -	} else {
> -		ret = v4l2_device_register_subdev_nodes(&camss->v4l2_dev);
> -		if (ret < 0) {
> -			dev_err(dev, "Failed to register subdev nodes: %d\n",
> -				ret);
> -			goto err_media_device_unregister;
> -		}
> +	camss->notifier.ops = &camss_subdev_notifier_ops;
> +	ret = v4l2_async_nf_register(&camss->notifier);
> +	if (ret) {
> +		dev_err(dev,
> +			"Failed to register async subdev nodes: %d\n", ret);
> +		goto err_media_device_unregister;
>   	}
>   
>   	return 0;


