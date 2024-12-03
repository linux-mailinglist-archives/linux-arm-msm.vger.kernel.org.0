Return-Path: <linux-arm-msm+bounces-40095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7829E2150
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 16:11:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 354BEB3E978
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 13:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541852AD02;
	Tue,  3 Dec 2024 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OS2Rhfn1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9061EF0AA
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 13:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234007; cv=none; b=QaXC3xbkbSPZZfNv3jU+UYtU+mx5lbHBY9VqcW7yT0cuH+52qiP7IRcWYKkResyuax5KNigHuHY2yrv88oNhqkREOrVMpFjaL9B3Hk07E7p7b7ny967tKCzApk6w5CkmND3nqNKGqkCKUX1LecvmynKXFlEtw29zms5oB+rYl9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234007; c=relaxed/simple;
	bh=MfM0drVwbDYoPluV0REjpJpK0fyBprYzaokHgqmg1QA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RUXHHMb92hRt9v62CgWRqVjmPzs22HwUqVBUALuAZg31MlVdn7cRf9AWjSLflPOUvjJ8yKr+ejjaEjA2AqWtGTm3+2zYNqHMPrb27CRRjQF+9CTXLYoSSFdLSTAW7+d2bGwRZ1xTzNLLr8DUqHBgufyzb+euRVF+bm3rXmCCcrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OS2Rhfn1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385f4a4093eso1478376f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 05:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733234003; x=1733838803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDNjqsNTvkXwslsyJDHeLHfffqCQZCYq3Xs1+G1L73g=;
        b=OS2Rhfn16X2DnccQyEsDMeN2i08kkIRnYum6HsZOYsDTqD46DayBumhkMttelvwZTl
         aiTNoorgZ0JsswbYJHPvWCDPqtQvo/bXr/Uy5BVh5Q5qFsCjH0kur7oOeLN8YI5DaAhJ
         KtItMQGYX4WlnERP2nNIY+gazW0QsPn1aF+KgpIfoGsRKBxIIbiCcxgkQ4lGAG8wzJwu
         HY7vOIgH/sj0IkU1Ti+o/ihy+cNpoNxfIPz/AYYcr/CSjWPAjGuZ9KqmgokrnmJM5QsP
         7VCzV3CYhQmOV3OIpBE3t6q1dEBrlSOa4VlQnRmbEfrdTdErt25A2xdWcmQw13oDjPCv
         cD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733234003; x=1733838803;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wDNjqsNTvkXwslsyJDHeLHfffqCQZCYq3Xs1+G1L73g=;
        b=tzMdGePl15lMOEOqQnh7/5wpaXqioAlfKjEnmq3KekJxx1IVi4hXT2+AbT3otRzSUH
         tpDEjLGcaXm+1w99SlqJnxWevjFooIkjNuzVm7bgctqhJgKUC7oaxB9IzADRyTYVIejy
         Ug+seQ9OYELgkiHN6FplbqZvSchkmuOucGRG0Bhc9jwBHKNyWnb8lGltiaMOHqYus/Ky
         WYCzxHwTggrwQnLZanw2OL9Nk5XknaIuWONUsTvieAQgqnGz3pC+2acHdHp2AoQtNSM2
         CryUSOuxWkH1uW7U9GyrGZx1aaNy45LY2ZwAPNIc5SnzRmRwKKw/ov2x//J03iicRHGL
         +log==
X-Forwarded-Encrypted: i=1; AJvYcCWx77ScvAoHay/+sB5wwCKBd7jVK72l0ZfsTGp8gJmkjhZRFhp8ReLMY4T1RtfBDq/RVSkqjs933ezO6638@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0sLgffn2Wd7tXGYU/kyKeHpRBxkxZLkhpI2BnLWYFQ4EmZKp
	Md8FmsNZFRzzvu9mr1UpjlZUiSpJWyDK2VM3q8krthmereaIs+e4s1qa12xQIG0=
X-Gm-Gg: ASbGnct+v5CCRxQ6ly3Rj/onEHb7MpYcL3gGJUFPwBoNcW9xNtauBCn/+I8RcR8slde
	ODR76knEJMu+pJ5bhTQ5X+PsrXS11HPKUEVc28/eifSIqzkAgm9rV0a1v8QCJTc2/EAM7VY0f5N
	N4tL6ltxdOo13qimRZY4MwbMYMv9nM5qGBCPqbXhCick4iO+4Oy9M6xKTnPts5q4CLzvPBc0SMT
	tHhqwalkdX9fAksR/RPxT+V+Qm2HhV0pK61YIYI5gERcX6nip+hMU4hH6rrr8ubT1CrsRJn5ZsS
	Mv8CTTW46wKVyr8x827Rmmko
X-Google-Smtp-Source: AGHT+IGh+XS+vM0CbuRcrxDNTg3Y8TKQ9gEnvK0wrtUF8j62EtQ0gbCJvdajb5h8bz5IO1GMuUl3LQ==
X-Received: by 2002:a5d:648f:0:b0:385:e13c:5409 with SMTP id ffacd0b85a97d-385fd3c68d2mr2122986f8f.5.1733234002695;
        Tue, 03 Dec 2024 05:53:22 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b668:b88:4ecf:c065? ([2a01:e0a:982:cbb0:b668:b88:4ecf:c065])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0d9bef8sm189836875e9.7.2024.12.03.05.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 05:53:22 -0800 (PST)
Message-ID: <d6220576-eaf5-4415-b25f-b5984255ab78@linaro.org>
Date: Tue, 3 Dec 2024 14:53:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 9/9] crypto: qce - switch to using a mutex
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Stanimir Varbanov <svarbanov@mm-sol.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
 <20241203-crypto-qce-refactor-v1-9-c5901d2dd45c@linaro.org>
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
In-Reply-To: <20241203-crypto-qce-refactor-v1-9-c5901d2dd45c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2024 10:19, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Having switched to workqueue from tasklet, we are no longer limited to
> atomic APIs and can now convert the spinlock to a mutex. This, along
> with the conversion from tasklet to workqueue grants us ~15% improvement
> in cryptsetup benchmarks for AES encryption.

Can you share on which platforms you did the tests and the results you got ?

> 
> While at it: use guards to simplify locking code.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/crypto/qce/core.c | 46 +++++++++++++++++++++-------------------------
>   drivers/crypto/qce/core.h |  3 ++-
>   2 files changed, 23 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> index 6de9f1e23e282..e95e84486d9ae 100644
> --- a/drivers/crypto/qce/core.c
> +++ b/drivers/crypto/qce/core.c
> @@ -3,6 +3,7 @@
>    * Copyright (c) 2010-2014, The Linux Foundation. All rights reserved.
>    */
>   
> +#include <linux/cleanup.h>
>   #include <linux/clk.h>
>   #include <linux/device.h>
>   #include <linux/dma-mapping.h>
> @@ -11,7 +12,6 @@
>   #include <linux/module.h>
>   #include <linux/mod_devicetable.h>
>   #include <linux/platform_device.h>
> -#include <linux/spinlock.h>
>   #include <linux/types.h>
>   #include <crypto/algapi.h>
>   #include <crypto/internal/hash.h>
> @@ -89,34 +89,28 @@ static int qce_handle_queue(struct qce_device *qce,
>   			    struct crypto_async_request *req)
>   {
>   	struct crypto_async_request *async_req, *backlog;
> -	unsigned long flags;
>   	int ret = 0, err;
>   
> -	spin_lock_irqsave(&qce->lock, flags);
> +	scoped_guard(mutex, &qce->lock) {
> +		if (req)
> +			ret = crypto_enqueue_request(&qce->queue, req);
>   
> -	if (req)
> -		ret = crypto_enqueue_request(&qce->queue, req);
> +		/* busy, do not dequeue request */
> +		if (qce->req)
> +			return ret;
>   
> -	/* busy, do not dequeue request */
> -	if (qce->req) {
> -		spin_unlock_irqrestore(&qce->lock, flags);
> -		return ret;
> +		backlog = crypto_get_backlog(&qce->queue);
> +		async_req = crypto_dequeue_request(&qce->queue);
> +		if (async_req)
> +			qce->req = async_req;
>   	}
>   
> -	backlog = crypto_get_backlog(&qce->queue);
> -	async_req = crypto_dequeue_request(&qce->queue);
> -	if (async_req)
> -		qce->req = async_req;
> -
> -	spin_unlock_irqrestore(&qce->lock, flags);
> -
>   	if (!async_req)
>   		return ret;
>   
>   	if (backlog) {
> -		spin_lock_bh(&qce->lock);
> -		crypto_request_complete(backlog, -EINPROGRESS);
> -		spin_unlock_bh(&qce->lock);
> +		scoped_guard(mutex, &qce->lock)
> +			crypto_request_complete(backlog, -EINPROGRESS);
>   	}
>   
>   	err = qce_handle_request(async_req);
> @@ -133,12 +127,11 @@ static void qce_req_done_work(struct work_struct *work)
>   	struct qce_device *qce = container_of(work, struct qce_device,
>   					      done_work);
>   	struct crypto_async_request *req;
> -	unsigned long flags;
>   
> -	spin_lock_irqsave(&qce->lock, flags);
> -	req = qce->req;
> -	qce->req = NULL;
> -	spin_unlock_irqrestore(&qce->lock, flags);
> +	scoped_guard(mutex, &qce->lock) {
> +		req = qce->req;
> +		qce->req = NULL;
> +	}
>   
>   	if (req)
>   		crypto_request_complete(req, qce->result);
> @@ -243,7 +236,10 @@ static int qce_crypto_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	spin_lock_init(&qce->lock);
> +	ret = devm_mutex_init(qce->dev, &qce->lock);
> +	if (ret)
> +		return ret;
> +
>   	INIT_WORK(&qce->done_work, qce_req_done_work);
>   	crypto_init_queue(&qce->queue, QCE_QUEUE_LENGTH);
>   
> diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
> index 39e75a75a4293..eb6fa7a8b64a8 100644
> --- a/drivers/crypto/qce/core.h
> +++ b/drivers/crypto/qce/core.h
> @@ -6,6 +6,7 @@
>   #ifndef _CORE_H_
>   #define _CORE_H_
>   
> +#include <linux/mutex.h>
>   #include <linux/workqueue.h>
>   
>   #include "dma.h"
> @@ -30,7 +31,7 @@
>    */
>   struct qce_device {
>   	struct crypto_queue queue;
> -	spinlock_t lock;
> +	struct mutex lock;
>   	struct work_struct done_work;
>   	struct crypto_async_request *req;
>   	int result;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

