Return-Path: <linux-arm-msm+bounces-40091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A299E1E35
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 14:50:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A170166857
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A521F12FB;
	Tue,  3 Dec 2024 13:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HnSmirQ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB5C1EE00D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 13:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733233838; cv=none; b=cdPy0b+qUiOXMmGYJyH17ZSf8Hg4wkODAbrHrSsQHkLFv0GD5RLdvkl4nJYhFl+jTkQzzBzCHYKbnM4Z6bW2JgJiAujPetAzQFqg2pgXOtD5fLRBw39U7knOQq4cYUbe+cN4cQYTKBqdrTVogL7kI7Ja7HoV+1zjjepULbWyfAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733233838; c=relaxed/simple;
	bh=bZyUqYcg3v5s0JBNpXcGl0Kr41t5wBvVh6TYlFZoBiM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hDiduYlWDv/ELuD+/WV4zDjr178FNVL5QW1eED8NMvVfHXRsvMRxWSv1kAChXgjWfeMJJhU37CUSxR4orEbgj188Flo+X3ej+imhitU1TepgA75vCAs1JefxPgOmsF6bZr1gJqPiGTcpIX6YHZb4U0tU9hh2VUIKWfMhUAQyRsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HnSmirQ1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434a10588f3so35935325e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 05:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733233835; x=1733838635; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hBcwo9eIpFhlU/J4DHTZIeUqEYh0WviOXbdmOon8iiA=;
        b=HnSmirQ1Z6ljQcEiF7FMv+TQlXjyg/CM2ja4izsEXOzr9MQYOc7ejrN2ArFjzpGdCp
         cY7GqnSV7YYFggwNk7ze3VMx1TDeDa/kfLr3bXTvuse7mMIozmKgjiDrDOp8kv+mmwDD
         f4CrX5nZd4p0Rse6UB9WEW/QR4ciEvLYq6XtjNWMdNtiFTajk1u86EgWYkG5JJjr2Yki
         Kw01O+tYiyk6xYOyih+aGItIsRwxH2Q3Kwe2Iwb4xE9gsYm8l3uuiVJ02O66ksQ3vSUI
         IDJTq0Ht74vPCVsqmmnGDMXtks5S5g7qhP8UpBIy8igaAfMAFMDdP0DoXf0MD9DpsPkA
         2sFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733233835; x=1733838635;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hBcwo9eIpFhlU/J4DHTZIeUqEYh0WviOXbdmOon8iiA=;
        b=JyeFRzEBcUE6d8RtoByaFdFSg+ewVczjvXdFar2HA9UZrH9xAlZWBSb+BTAE+3whlC
         6DJDYuASPX03pgNEpL780cHkQAqOGMWYSIRscRidNw+3U+j5iYfBimsbEZnywAmg5Mvq
         WkxuxSafCGdEcEWXGg/QDHNcAeDuu9J3jqu80+d0CwQVoAJt6K78Tf7kZm/KCbm9eVPL
         zx/0+98+FATxfof5C5ZTDdkxL6SGdmeR/qXXRo0jzP35JM7gpME/Pm0UV6mkVhxb/MeT
         q9yEqQkLptlhwh+shT9vSSuQ8iFfi3wt6m3zMV/RbP/zMQWHPqWJN/57BdsS6XegBr4K
         1Msg==
X-Forwarded-Encrypted: i=1; AJvYcCWklxgoXryEGf3lfQawNcU5pLbUQm5SGyE/8Z+QyU9petR5gPlxJihgmn7h2wAA+1oIDXs6vXI/2sfwOtTc@vger.kernel.org
X-Gm-Message-State: AOJu0YxkVLg2H43P1LhC4XNzACPCvxS0i3yAVKC+idy/eKx9Mu1SXs7J
	LIIwoLzBFueUdEdtewPHYM5yxYQHNGTtl4L/oPZQ+A8fcBtHpkQReuk6hsWEE5w=
X-Gm-Gg: ASbGncun6B9WUtSkjSfbEXv9WSJbDGzPe3X1417BpFOpV9YdVOg90JugfAsMqH2/trp
	WBmuhPY3gLZowolTIUXUKVCF/YuCyGAWmgoU90OQBozM1quqeXTMPDP92FNKHN7fryQHMJQViec
	jQWoOm7fU8muP570APztQc75f7u9KYmUIihndNiKi4EMeMLnRyjVbH2t+4qCurScODfAeoDZO8U
	xkoJ2pdSRTRUr0u+yDFEGQzoUWO/h9HwL6pXUG7gXXdMaTvaPnTl2oOdOer4tXEe0PdpCtOfD9p
	ciZ/uHMaXn9z5NZYl6DgHKlr
X-Google-Smtp-Source: AGHT+IEi93wdfnyxOOsXD1iaOm0aYo0vmjHZ2S8lJrh1fgGf6vIMZGQiHeweFABcyUVMhTNIfdCzPQ==
X-Received: by 2002:a5d:5985:0:b0:385:e3c5:61ae with SMTP id ffacd0b85a97d-38607ae39fbmr265368f8f.31.1733233835095;
        Tue, 03 Dec 2024 05:50:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b668:b88:4ecf:c065? ([2a01:e0a:982:cbb0:b668:b88:4ecf:c065])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385df63255bsm12765093f8f.86.2024.12.03.05.50.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 05:50:34 -0800 (PST)
Message-ID: <a2252349-b9e6-476d-a838-cb0e55e78da8@linaro.org>
Date: Tue, 3 Dec 2024 14:50:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 6/9] crypto: qce - make qce_register_algs() a managed
 interface
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
 <20241203-crypto-qce-refactor-v1-6-c5901d2dd45c@linaro.org>
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
In-Reply-To: <20241203-crypto-qce-refactor-v1-6-c5901d2dd45c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2024 10:19, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Make qce_register_algs() a managed interface. This allows us to further
> simplify the remove() callback.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/crypto/qce/core.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index e2cda24960f63..5e21754c7f822 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/clk.h>
> +#include <linux/device.h>
>   #include <linux/dma-mapping.h>
>   #include <linux/interconnect.h>
>   #include <linux/interrupt.h>
> @@ -37,9 +38,10 @@ static const struct qce_algo_ops *qce_ops[] = {
>   #endif
>   };
>   
> -static void qce_unregister_algs(struct qce_device *qce)
> +static void qce_unregister_algs(void *data)
>   {
>   	const struct qce_algo_ops *ops;
> +	struct qce_device *qce = data;
>   	int i;
>   
>   	for (i = 0; i < ARRAY_SIZE(qce_ops); i++) {
> @@ -48,7 +50,7 @@ static void qce_unregister_algs(struct qce_device *qce)
>   	}
>   }
>   
> -static int qce_register_algs(struct qce_device *qce)
> +static int devm_qce_register_algs(struct qce_device *qce)
>   {
>   	const struct qce_algo_ops *ops;
>   	int i, j, ret = -ENODEV;
> @@ -63,7 +65,7 @@ static int qce_register_algs(struct qce_device *qce)
>   		}
>   	}
>   
> -	return 0;
> +	return devm_add_action_or_reset(qce->dev, qce_unregister_algs, qce);
>   }
>   
>   static int qce_handle_request(struct crypto_async_request *async_req)
> @@ -248,7 +250,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   	qce->async_req_enqueue = qce_async_request_enqueue;
>   	qce->async_req_done = qce_async_request_done;
>   
> -	return qce_register_algs(qce);
> +	return devm_qce_register_algs(qce);
>   }
>   
>   static void qce_crypto_remove(struct platform_device *pdev)
> @@ -256,7 +258,6 @@ static void qce_crypto_remove(struct platform_device *pdev)
>   	struct qce_device *qce = platform_get_drvdata(pdev);
>   
>   	tasklet_kill(&qce->done_tasklet);
> -	qce_unregister_algs(qce);
>   }
>   
>   static const struct of_device_id qce_crypto_of_match[] = {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

