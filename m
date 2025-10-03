Return-Path: <linux-arm-msm+bounces-75868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD300BB62DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 09:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 882AC3AF269
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 07:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDA7822D9F7;
	Fri,  3 Oct 2025 07:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GMqyCqBy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ACE248F6A
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Oct 2025 07:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759476813; cv=none; b=rVAYN5pAeaqI3WTKbz5bnyPPl1hQdduom0rACntYblaA13VXggRFrJcOp6AzcamPNKLwWgeDSNuZqv2aZuUWm0a/akEIRgzbLBxxFhp2Uq/rfuoI2wFwXFEHQD5tH6XfSiQ5JZfBW3Jtc44XkR5a/mdyWMXqMM66lmYO9OeZESg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759476813; c=relaxed/simple;
	bh=IxHI9oZKexr2YZ8a277fL0eG5BkjOZVsjcZA5qaSKIg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZNocfRFpywRGB6RNFXrNwU+yNZpiLJeKsghW/ihTRg9bjaVLcOcgDtLeA86tKfpjTeboSFxEFII/DBN+tWuA7b9/R5ly6kaCJWd4Dc7R/+AMoYbXpSaK/ESDszA6KA1KVEXBocHElJzWa+NaLlCrancRdAr2JeCfG5oXrUBiyZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GMqyCqBy; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so14969025e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Oct 2025 00:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759476810; x=1760081610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5grRFMX+2MrPypsgKycA1aZd8AJQaqdGLD/iYz7bwBc=;
        b=GMqyCqByLpZwSGHy76HGNP8qE3V9eZZjuIXzRbjhSCGNrI7bjHR+9qnqzK+ETwySBS
         eTmpurDmYRKOH5unq18W9Ykc17GuSeozwaxBWoval+Yzni8pjNVje0iDjsBwCweieYlG
         Z14x2RiYgG9Wmdq2KkSdRretyc0SUW3PpGAoG+fjr8iLhB/dsF/BFYmluddP9TaPovlI
         BHmeEXtJ69+DEVQYBa5uJ5zMhnkq+XqM3lbzYwIbZXW8bCerG8/4vSO7Ohq5agQKSMYJ
         D7+Vexnn1fCoXezRTZnDjT0JnvjD7tQJhL9ykxJX0H3LxxGfIZfu2xi9hcxHzxj1zzlu
         A4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759476810; x=1760081610;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5grRFMX+2MrPypsgKycA1aZd8AJQaqdGLD/iYz7bwBc=;
        b=ixGYdZn4esvynyzgcDZp1Wx2OfaYJ1eNSHZ4KPVREFT2Y3FGiCaE5nQpW5dUZcu/YA
         jAZA7+kLhxmi6075iU75wUxeZm0jfbnI0Pi7UoGPIPJZN+tTRgjpjhBgwothRVvJdK7T
         Pwl9n8LPXbruO5AZI+dqwAe06gDz+nfXP9+qyfKazK3ZO57M3tT+5huXz9LDqIO/SBc5
         K6sXPVG+GczJEY88yoPr+HY0mh9VvbF/RMD0Mhg3lEmbNt4D2OVome9arqHoWjJ3Yy6c
         M2LKUdvHuaICfCSJBw485ZB9UaaeOQv5cxh1jJj/Hg7QY+RdCTbR23nSNO+mVOsUxzx6
         DHjg==
X-Forwarded-Encrypted: i=1; AJvYcCUSl8VTE8pjwdzSvwWhfszHAqvxkJgpUk+13ds6K2GR8GBa8X59z2/thVu5m0iX9QPJ5h9QRGI+dGwLYclb@vger.kernel.org
X-Gm-Message-State: AOJu0YyhlfMUt+71qYI8VB8wvE6/uM7RoqlvdveA2JlNgwsPBKKdnogK
	1RzKMufTWkmiHsk7RKoXGLM82XEBlxUixKPlgLGSohHVbL93nY4zXqdWcVYy9BJw01ryurfX0jw
	xqgwV
X-Gm-Gg: ASbGncs2ZxbCg3hdSI7EDkHU+Tgz7pZXbqEMVQLYAX2efDm92WHRe3sbpp9AK61SC+C
	CPWDqe3lkAufyXW8ZQqp7pQS/y+3pvGv2uD8ulxi1EeRAdaJ4ZuxgFnEab7Msxn1BNRjs0E/e/K
	hzj7ZkaMEOx7Rs/zDw8/gfsuOVqLft2XoNjrs/LaFsN2+50Dr8iqfhBaVEt1yOgi+Y837s6mH9G
	kHWcbsbW+v/YLbSV93O5kQKRvDEsv8eUZAxSc48bsAu1XjmcE/ioEYc2yxLgxhCWrM3WmiTGgzH
	5l82VIOLIHAqwsri8hj18WMV4q+XHRTyvqJa6N0jsNXST5TEM1jkeO/iO1uNZoKTF45xnwUaR/I
	N3BWUiY3JueNyh7W9gmbZhk+4VgYc+/V+imOYOKRo8mQBLGaoLmneFy5egWl6eRZidkj4AxF6el
	2D8KKR0aEWVJk611uJ3O8NZBw/F1g=
X-Google-Smtp-Source: AGHT+IE3WIkcpTDGTYbL1KkTG7og5gmapvp+rB9slPdpJDq+7fpgXOqr+o6R0DGbS0j/8Ti8nPucHg==
X-Received: by 2002:a05:600c:6094:b0:46e:39e1:fc3c with SMTP id 5b1f17b1804b1-46e710fff73mr14591685e9.5.1759476809742;
        Fri, 03 Oct 2025 00:33:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:1516:b5be:def8:9a0b? ([2a01:e0a:3d9:2080:1516:b5be:def8:9a0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e675b557fsm96132185e9.0.2025.10.03.00.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 00:33:29 -0700 (PDT)
Message-ID: <3ccc3649-dbb6-406a-bec4-fb3d4068bad1@linaro.org>
Date: Fri, 3 Oct 2025 09:33:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
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
In-Reply-To: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/25 01:57, Jessica Zhang wrote:
> My current email will stop working soon. Update my email address to
> jesszhan0024@gmail.com
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e7515a412e9..7a712ded8f9f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7652,7 +7652,7 @@ DRM DRIVER for Qualcomm display hardware
>   M:	Rob Clark <robin.clark@oss.qualcomm.com>
>   M:	Dmitry Baryshkov <lumag@kernel.org>
>   R:	Abhinav Kumar <abhinav.kumar@linux.dev>
> -R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> +R:	Jessica Zhang <jesszhan0024@gmail.com>
>   R:	Sean Paul <sean@poorly.run>
>   R:	Marijn Suijten <marijn.suijten@somainline.org>
>   L:	linux-arm-msm@vger.kernel.org
> @@ -8325,7 +8325,7 @@ F:	drivers/gpu/drm/clients/drm_log.c
>   
>   DRM PANEL DRIVERS
>   M:	Neil Armstrong <neil.armstrong@linaro.org>
> -R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> +R:	Jessica Zhang <jesszhan0024@gmail.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> 
> ---
> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
> change-id: 20251002-quit-qcom-5125b64a86aa
> 
> Best regards,
> --
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

