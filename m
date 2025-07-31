Return-Path: <linux-arm-msm+bounces-67255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5674AB1738F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 16:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CB7B5619EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 14:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444FB1DFE12;
	Thu, 31 Jul 2025 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j0BrvQ6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5747F1DE4D2
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753973894; cv=none; b=ioBC8puVnNa+kQulzzshgpFx8+p62ZgsHdx2sGsceHKd9H0Gh1wVIKwIOhFGPaaRtQuYi+MH7I8yIVNyFHn9ptKHHz0oQZ6yyJZ03vQNHX+xAHX6iZMQb4xQm8t2W0PLTR0G6cHZLRRXUHnXQ/sfl5MiwAxLygOvljcGCkxqklM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753973894; c=relaxed/simple;
	bh=/Nl6OMRMQI+j/D/FeQ0+/Hu9aMwMGkFL0oIoYF1EXds=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=K6XN2i4x7bo43/a0YAngrnUYuaHrWfOsXCjpb9U6kDnfmtTO9eOqghhPcf1+al1qUhz18APC6ec09wBc1+MtR4rk7hEgrjh6AmpYwjOB9u0eJ1D5/PQuLClzI8esfkzrBxttYCKLakcyOaWCc4MosaqAAC8L5Kc05srzMKRMxD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j0BrvQ6o; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45619d70c72so16297675e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 07:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753973890; x=1754578690; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UYSC+snvuRl9xh5vK5+UophT/Pu3Y9kJHZ4TR6UIQ90=;
        b=j0BrvQ6oNv6a94FTVMV30TTMab3rysF83DDgLYZDmZ5D/wmDfRasENZ6C14WwGrFrb
         CbO9jZ9+ULBavR6WZtlgNj7urVRtJewOHCoqP1fTijAWczez2zhs99v4JCajFfEMzNO5
         rde8yEY5Q1OGpZAg+GeDmhFYVifALyI9TTo9JjmfE6VJ19BJ6wvZKcsyUOyP8F1Fq5VE
         tUAw32lVr+vuYN9mzgYrL5fn8eF8JSXHR71UHNsJEkjq5yZzKFh4s0KVY+R+QmPnEu24
         DSlvqfXYAzde4KwN1XBsnjUYW97S3FwuPeQB30x6BKfBjy46IEpU3kG2OgC9oZaBjYmA
         Z3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753973890; x=1754578690;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UYSC+snvuRl9xh5vK5+UophT/Pu3Y9kJHZ4TR6UIQ90=;
        b=nyYVRK6BFjUEvWAnkxtgnEOS5bVH3lcPOVaS/x2jN898fn7KKscQJGfF3qgTIRqf4R
         vJKyIkkRrCg2bV9JXhv9zbj1nU0I0oBW5b0LA6R8ntHHGLpq8DZhgimNF+jKWTlRvnMA
         AT1hZ+B04pZnOdcC6VYLya1xfL9Qm7+SPSggc3+hIqXWwf6P/UoM6ZGZA8oZxXd8OkzL
         IhNzuKfz3RxeJwLPhC5cT6FNXffXgL5WCgzFL1OYj0Yef5K/p4OuBmo1FCUIl2XFdSnS
         Q0a13eOMji7BetjIvJ5dW/k4TliPB4B7zDnyM2tL64jT/w0wlWjzFVCEB65PnmAQ5nwQ
         OooA==
X-Gm-Message-State: AOJu0YxozAJXNw/FUjtrBVYH4gNIzDA3fAwRo77jGeMsJLKKgIy4HKi8
	4Qh7HLZJ7xH3P4vSo7p8K7YFVp3/HuqZ+SJmSDMScX6KfxPB+bR8QfuAzx19VyMzv7E=
X-Gm-Gg: ASbGncuXWqNruLnPTZt/1TvUmIwbohYUK3UUpGeAm0W85zaS4q/S/hyUGlW5qi3S4ka
	XSk7bQoxI8lEuG/GroEMTkb5H/UP0cWha9DybjtEysbEcBcGC7hJqRMFUAXI8kIL8LlAoHNqooh
	JWn5Yk+sxgHLj7/QRHorgBnqnFvA2i+0GTgkAgRF5Cf6BG+lSRpQmbeDPqgXlpQGXt536CFBm0v
	MfthSTOdMWgcjmEvL2oiVHsUoaCkZ8pNM1VgPDbCyG3jRCkorRPBxQX9Vus+anmyXQDtrfibedx
	J7+hUfd7C9AN1hbA01yBUBZ9KA95jfRrnfLVWudX7UJYNzUbMkjnCl8oREBgZ6Fk0uNLBGtyZr5
	QeCzjgJv0i8S554QvmkRzozpLnkXtCEoY8MKg//Jr9hkExMH/4K3HJ99rgTHpOFjg7FEOMku1PM
	QQyw3LG9Q=
X-Google-Smtp-Source: AGHT+IF/x1z+XOkIb5kPsEMrjlpAe76OpJMnjZ5nXXOYdZrgYcKT02O7pTqubGbXxoZkZwM+ViAY/Q==
X-Received: by 2002:a05:600c:a08e:b0:456:189e:223a with SMTP id 5b1f17b1804b1-458a222a97fmr26720225e9.10.1753973890541;
        Thu, 31 Jul 2025 07:58:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5d4b:b132:363:7591? ([2a01:e0a:3d9:2080:5d4b:b132:363:7591])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3c4b75sm2602564f8f.31.2025.07.31.07.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Jul 2025 07:58:10 -0700 (PDT)
Message-ID: <490f9017-629d-4c19-8c2a-7fd106b4568c@linaro.org>
Date: Thu, 31 Jul 2025 16:58:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] soc: qcom: mdt_loader: Deal with zero e_shentsize
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Val Packett <val@packett.cool>
References: <20250730-mdt-loader-shentsize-zero-v1-1-04f43186229c@oss.qualcomm.com>
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
In-Reply-To: <20250730-mdt-loader-shentsize-zero-v1-1-04f43186229c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/07/2025 22:51, Bjorn Andersson wrote:
> Firmware that doesn't provide section headers leave both e_shentsize and
> e_shnum 0, which obvious isn't compatible with the newly introduced
> stricter checks.
> 
> Make the section-related checks conditional on either of these values
> being non-zero.
> 
Missing:
Fixes: 9f35ab0e53cc ("soc: qcom: mdt_loader: Fix error return values in mdt_header_valid()")

Or it won't apply on stable kernels

> Fixes: 9f9967fed9d0 ("soc: qcom: mdt_loader: Ensure we don't read past the ELF header")
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://lore.kernel.org/all/ece307c3-7d65-440f-babd-88cf9705b908@packett.cool/
> Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
> Closes: https://lore.kernel.org/all/aec9cd03-6fc2-4dc8-b937-8b7cf7bf4128@linaro.org/
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>   drivers/soc/qcom/mdt_loader.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index 0ca268bdf1f8c579b36a04fd94417be172fc1099..5710ac0c07a8c8a56110e3fc5e30b8610e106449 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -39,12 +39,14 @@ static bool mdt_header_valid(const struct firmware *fw)
>   	if (phend > fw->size)
>   		return false;
>   
> -	if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
> -		return false;
> +	if (ehdr->e_shentsize || ehdr->e_shnum) {
> +		if (ehdr->e_shentsize != sizeof(struct elf32_shdr))
> +			return false;
>   
> -	shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
> -	if (shend > fw->size)
> -		return false;
> +		shend = size_add(size_mul(sizeof(struct elf32_shdr), ehdr->e_shnum), ehdr->e_shoff);
> +		if (shend > fw->size)
> +			return false;
> +	}
>   
>   	return true;
>   }
> 
> ---
> base-commit: 79fb37f39b77bbf9a56304e9af843cd93a7a1916
> change-id: 20250730-mdt-loader-shentsize-zero-8c99653b6343
> 
> Best regards,

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD

Thanks,
Neil

