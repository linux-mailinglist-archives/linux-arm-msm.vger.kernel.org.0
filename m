Return-Path: <linux-arm-msm+bounces-21529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6F08FA610
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 00:53:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FFED1F246FC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 22:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4926213CABC;
	Mon,  3 Jun 2024 22:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CUMtuqwC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8664F13B791
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jun 2024 22:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717455222; cv=none; b=PPPKLiiwkbU7L5MIT1NFSG9lU+vpWVlmS/Pw+EOa+Rwk2kX2pTTUV1RfhrttlZp4jVBz+UyChAdMBn8Vwb57kFl4fSgU/8QI+w27vWo4wttI3o4Tn322GXejRPw3BMeQB865WuUXq9EtWzLZOYgfTByYbxkWOt3wRCLOyIJZaW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717455222; c=relaxed/simple;
	bh=1O+jSFdxFVgeNXpaSM+18pB8mEWHTJkOio0TJRlnCDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hqYtQK22/wF7e58FtU0/gsw1BNcn66V1Xczigoe4Nj38ANbGp02riV4pevWe1a+OTNLV/vtNiAtj2r8P3LWksOZ/aJj3TEFLXApt5NwfP6CIO3M89MwjVJLsz6k6HtG3aX+lNK16j8GhxBlT9xj1uNKc17MVTu04HHoIyEsRNJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CUMtuqwC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-35dca73095aso4096267f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jun 2024 15:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717455219; x=1718060019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0HZ5LR9brtVaXPPFehubrQnp6b27zagXRHlQw/mMZDc=;
        b=CUMtuqwCXn8Q6+SYTWyEiUju5EWibETkv7L/4xkAxqqJw060vh2CxbcILvLD7t6zsN
         Tn7dhGiGFMlhCHfpDjtFtGTQdBSVEJwbsFf+iNCTgNd7Hq+Pjqe8IXp9J4SUaaS0S0P0
         5z41nIR3KubhhQFhRwL/JIFYWPwB+adII241v+mI4fNX1txq4wavaekHaExDHIfWQf6N
         l4P3u+BbFuRUUJs4b1b/g+J4kEMRMiL4v3b0nqnrRV8yXMSSi5vuiyHiiJjj1F3JVwfY
         UPkoxX5aoQlit8J2GRUy02JJSw9blzwXsbVzxbxj+Zx0/Ih8x/r3y2njRJDkFSbpIg9h
         xo2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717455219; x=1718060019;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HZ5LR9brtVaXPPFehubrQnp6b27zagXRHlQw/mMZDc=;
        b=Zd+9wGRul8TRkuSXx7xRBqYuPWQwwlGebP54jgSFIgWzhrHkYeI7zFMbkZ7QwO5S2y
         xP0cpL41iu0OUDZl1n7Dbb3l6Vy7ZQdS7LOV8ryaNU+hWQ954D1FCNYBZalNtwC7PxFz
         NWcGWsAFNSOfP5kOjTryDNFZ4y6unKhtrVJ7l16+iwYeNxOckEC4SJO58uE8izdryFH0
         MUw8BEyA/zc8c0VqcomgMWwVLHKui1SH3dFsw47zCqfg3w0qnjmNjn6BkVQ2aN1C3ocF
         LtufsxMx3vnyJVLuQCL+UiOuaPVdNsx5qEo/EDlX9pmhU1XsfOhci1LHEo3RYgEqpQok
         /qRg==
X-Forwarded-Encrypted: i=1; AJvYcCXK2b86ACAV2rDG4wl8T7rEs5pTUM/ojxYWbMzNZb6h/UkeXK12FTRijQ9IpJOiEt9WyIikhg7Xat1HAhWQMs0hktwz0cWanTYhE4WlOQ==
X-Gm-Message-State: AOJu0YxOCd+JHQXVmHy5gPsjF6ARS8PQFmmcBm4/DDTKaOOq2JpFXnI6
	ZkQPajivnXHSilkc5h7c3Rl8BK0vSIMf6LLLg/FGbNFWChyJpUE5blNXl7kt5vE=
X-Google-Smtp-Source: AGHT+IGw7uz1nVwn4Qwm3BlhI2Nm0K84pczwRY0EoHObHQ8kx0Cv64cwJ1Ocvd4pkhwBDj11rt9Qaw==
X-Received: by 2002:a05:6000:1282:b0:354:f944:11de with SMTP id ffacd0b85a97d-35e0f2869f4mr7171255f8f.28.1717455218902;
        Mon, 03 Jun 2024 15:53:38 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0f1fsm10038807f8f.15.2024.06.03.15.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jun 2024 15:53:38 -0700 (PDT)
Message-ID: <0f3f0b35-b13e-438c-bf55-7fb0064b61cf@linaro.org>
Date: Mon, 3 Jun 2024 23:53:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/8] spi: qup: Use new spi_xfer_is_dma_mapped() helper
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Yang Yingliang <yangyingliang@huawei.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thangaraj Samynathan <thangaraj.s@microchip.com>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Cc: Serge Semin <fancer.lancer@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240531194723.1761567-1-andriy.shevchenko@linux.intel.com>
 <20240531194723.1761567-8-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240531194723.1761567-8-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/05/2024 20:42, Andy Shevchenko wrote:
> Replace a few lines of code by calling a spi_xfer_is_dma_mapped() helper.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/spi/spi-qup.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/spi-qup.c b/drivers/spi/spi-qup.c
> index 2af63040ac6e..06da4aa7eeb7 100644
> --- a/drivers/spi/spi-qup.c
> +++ b/drivers/spi/spi-qup.c
> @@ -5,6 +5,8 @@
>   
>   #include <linux/clk.h>
>   #include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dmaengine.h>
>   #include <linux/err.h>
>   #include <linux/interconnect.h>
>   #include <linux/interrupt.h>
> @@ -16,8 +18,7 @@
>   #include <linux/pm_opp.h>
>   #include <linux/pm_runtime.h>
>   #include <linux/spi/spi.h>
> -#include <linux/dmaengine.h>
> -#include <linux/dma-mapping.h>
> +#include "internals.h"
>   
>   #define QUP_CONFIG			0x0000
>   #define QUP_STATE			0x0004
> @@ -709,9 +710,7 @@ static int spi_qup_io_prep(struct spi_device *spi, struct spi_transfer *xfer)
>   
>   	if (controller->n_words <= (controller->in_fifo_sz / sizeof(u32)))
>   		controller->mode = QUP_IO_M_MODE_FIFO;
> -	else if (spi->controller->can_dma &&
> -		 spi->controller->can_dma(spi->controller, spi, xfer) &&
> -		 spi->controller->cur_msg_mapped)
> +	else if (spi_xfer_is_dma_mapped(spi->controller, spi, xfer))
>   		controller->mode = QUP_IO_M_MODE_BAM;
>   	else
>   		controller->mode = QUP_IO_M_MODE_BLOCK;

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

