Return-Path: <linux-arm-msm+bounces-83259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A2DC85488
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:58:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C26A4EB19C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 13:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BAD26ED2F;
	Tue, 25 Nov 2025 13:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e3qA7chA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0FA026B0AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 13:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764079011; cv=none; b=jA1HRDbcbz2CHQ2nvRth2ApsQ2lt7Qzi/K7vntcYlgFP8Q76y3U32xPgukLc/rCCrXOqECJQWOYyb+5eo/Qof8DvbwGsRkWjeM0LCUydJ+F42l5nH7vZ/kIn6O/Zw27Lz8Ox5KJeYQFjClEaYA6gjeOnDiJsU1mWuaU2c9ou7CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764079011; c=relaxed/simple;
	bh=L4m4mHl/f0of1YsKOYahWRuOiJNWTG7xDNnu30Tv/bw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=llQu6SIaULA2dpBKPiNHzAihg3ONuCoQvxX6m83ycrrxZr01bwWjwwOzl3WRb4n7Sl3TzP7TC/n2RA3KOHC0pTM+d7OrbVuPNgAXSjLpa3QGHkRGwagla6p6UosbvdLPZr6+zbXFcnBTOxQVl1FAOIBEgZbqWxIEtBVjdRHY8Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e3qA7chA; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b38de7940so2793981f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 05:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764079006; x=1764683806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOKmJwWRVLI79glKE6xdHe9dx8mGZzY803qUnmDLg/M=;
        b=e3qA7chAmKkbcMYO3k0tjdoa2xt5F4PMQNSFYBFY4bHeoT9khtqDo5qDPlTbJAHDCy
         3Q2A1i8i9vKpj78Py275HH1v810jth3hmLaYMHTWQOuK8IY8eRJem3eM+/ITH1Y9ydm/
         QFSbksB4JGC3YS2QOlrG70OWBb9lwqOislj0TqDTvStA9GvDUscjHtanIz6MVxfDN+gc
         yhrjaQzBl7SAQ1jHOikDHSRIhHNqjGh3y8DdxTKscf29eVEdj3tDaNZgYuQsV1ix9VBi
         mkKdyjgHuf8vABdWN8R2M9i9+NU84Vwuu6fN7JiAYmsHIxUtftw2Z0WvqVClRdfbUQ2h
         JNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764079006; x=1764683806;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOKmJwWRVLI79glKE6xdHe9dx8mGZzY803qUnmDLg/M=;
        b=DvTLQyqi3MP/8S8P+yHsbrryzGX/zwrxwBNWCoUbIhNtEWUBx6WbIp8ilvtXHjIJ60
         fefZtn4cKY+qE+tpDgQvWh3gabAA3eKMHBhqFsN9Hv+Auu5IbXF4GFICJrn92O94j/LX
         Yh/mMKyIlp48ZXmdQ+1YzY3hKUmW1vvXfjxTgJEaw+wKsmQCozIrHbKoeShHMe03/tcj
         ei+2xiKlGyIfmHHS9xdlrVCKHCF+rVTopk/trDffulvBRAfrGI9u9Lkni3EGVUjcuG8R
         61ETFTm/Gd17QOES6kWYQzuqKemyfFIiX8U9bBP2C54cOtjpM23lFr013uqxsNKTGPZi
         PmCA==
X-Forwarded-Encrypted: i=1; AJvYcCUpVNgS7RoD4xumEd1aPz7YiZFyfho34BFpoDxdWAw+2Ce6kDPe3cdTx0JRv0CtzkMyECiiVIDkOlo3AZkG@vger.kernel.org
X-Gm-Message-State: AOJu0YzuJu9skdrUWMpCI+qpr0YD9ogZARt1/QxK2w4jkIMuOxfhwnJB
	HzDZdyB55smUsvR3ePpuHDQot3BqMvUxTMOknapOyrh6wtPkIrRZN6Ckk71SXLZrUqEfALo3DDt
	ijnT87n0=
X-Gm-Gg: ASbGncu+65dAGbMkAEUWs07rye96aBkRhBY++MPI82AU9wpToBPIHRkHc+gBSwx2ZaE
	g2LXodgKZUGakGg0l/kybWtfWi56k7zGuj/pyqPHcXfx/tZRS4+Yuu5vNLnNhKrCcMvHlkYZx0q
	XQpS5kIEx3sStToxcrQ0RxhcIF0UBVgg2N0Eg3erthdbXPMqhs8+3OqVvlps4YQs6/GqFGElYZv
	rdqBkv1kseOuzIpnqtme2BNYJcoSstJcYSNB0WGBsXuutklXLBKruoLRzO6mYAuqbRrf4AU1GM/
	qfTSVGywkH/njqVaOVXuXiQc6sf/qUP7lFq8SNSV9gwEbMYwfpInDkLDs3ikNc6gsL4QYL20Md/
	OFYgZj35LirkeOM2ZN0ogD/0CiCS18IEpZovnIHP5KGduPDqKJjFBa5dSFT+VcMIQ4KCCMAvSaG
	LTywrIc4C90b26ccthMNLc42R1dxXbAtlEsNu9gG2YePbciidIm9LG7hKwHiPiy3w=
X-Google-Smtp-Source: AGHT+IHQYDOU5Wf4pw0JNABvIsPoN88FinckcxFluDh5iW8CMtfRl+GqjWzvSI8AB6Ieto+tANa5Xw==
X-Received: by 2002:a05:6000:250d:b0:42b:41d3:daf8 with SMTP id ffacd0b85a97d-42cc1ac986bmr16822822f8f.18.1764079006044;
        Tue, 25 Nov 2025 05:56:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:dea1:baf7:4d0c:118e? ([2a01:e0a:3d9:2080:dea1:baf7:4d0c:118e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cbd764dbesm31274248f8f.27.2025.11.25.05.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 05:56:45 -0800 (PST)
Message-ID: <8e75b00d-06c3-4f8c-91c2-42d468a67a12@linaro.org>
Date: Tue, 25 Nov 2025 14:56:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] power: sequencing: qcom-wcn: use device_get_match_data()
To: Bartosz Golaszewski <brgl@bgdev.pl>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251125134700.29135-1-brgl@bgdev.pl>
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
In-Reply-To: <20251125134700.29135-1-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/25 14:47, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Use the generic fwnode interface for retrieving device match data
> instead of the OF-specific one.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/power/sequencing/pwrseq-qcom-wcn.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
> index 663d9a5370653..823f68ffebd1a 100644
> --- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
> +++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
> @@ -12,6 +12,7 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/platform_device.h>
> +#include <linux/property.h>
>   #include <linux/regulator/consumer.h>
>   #include <linux/pwrseq/provider.h>
>   #include <linux/string.h>
> @@ -373,7 +374,7 @@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
>   
>   	ctx->of_node = dev->of_node;
>   
> -	ctx->pdata = of_device_get_match_data(dev);
> +	ctx->pdata = device_get_match_data(dev);
>   	if (!ctx->pdata)
>   		return dev_err_probe(dev, -ENODEV,
>   				     "Failed to obtain platform data\n");

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

