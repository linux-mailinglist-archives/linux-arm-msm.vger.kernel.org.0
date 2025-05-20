Return-Path: <linux-arm-msm+bounces-58651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8DFABD167
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 10:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F7371BA1B5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 08:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F50220E000;
	Tue, 20 May 2025 08:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sJdfiUDg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6E621323C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 08:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747728324; cv=none; b=rf6UiEdjkLU4mntWvVPj2l0N9+rWvIntkoUk1ihfyPg5wKmSSIHVVQFsmzqXVL4wj0zeItxCvRqIKxrc59jA3IfwCOhbrIi3fAPZtvwdteDG9L/p5oqSiPjam1msIhSikb6qdAN7kU/BN8O3hDlLaGyQucVv83eRhia78ToAgGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747728324; c=relaxed/simple;
	bh=Mx44AFtHKg6NPUwYy9XHoArClrZEsXPQ/I3fa+2ymjY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qThZg8NV/bOz+/Lghz3+JxUNBprVE2tK38GdhoaGmBSOPgRttc0s9tn61UwKDo6D5uIKmQgevtLqffdTBAb8dQPu6ONXEe43KQJsz+4c5FviCKayc7Y7JoadvZ4zEKpLMyFhGecVWyONivrzxd0dOi9nNT4Ex9ToxTxB560gSYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sJdfiUDg; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edb40f357so43438875e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 01:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747728320; x=1748333120; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uNWDaQGmXlN2WBOvHoF7sz3M4udRBK5xujbVMotESw=;
        b=sJdfiUDgDxuVR3f4yBHDx+QjhyYwY0ILqv2tBafwfxzb0heFB5Fagk6+VuySGrc7OF
         D/MAAAhXj/3P0iuzdISiJBbdpiwtGnIqOdKi47AYIhFNYOGJhnF9hiuMw1LBF5xizXU1
         RQVIIUdvPnbno/eTgOLz0FNkwH/Lwjpx2uxxP5e4aZ5G+Y4HLQ5i/4gV7n7wt6L62IN3
         MQf1Q4aDpzpFfwtqL0tofW7o7wFxLUc03aN+fSefi0LzYbyA3wYw/XduL8Gx0mHx6GOT
         TwHl8VQmlw0i5d6irP0H7gBTdv19j/1BiTqojaXKz6YqgoKmVSFjTvMO7UDy6BWb5SxW
         1ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747728320; x=1748333120;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8uNWDaQGmXlN2WBOvHoF7sz3M4udRBK5xujbVMotESw=;
        b=VE/GAN7TdyW2rcbSjLOOQJf3d4IV0wk9YAFQ5dx52Wwi/z8U8ZbMGLG5d5EmS2qHC7
         2xZSojYWZmdQbTPB1tEiuV1xfG69OdcX8lp2bQrzbAYBJkHA/8ASwvVNSTIGBnMNbBs6
         dI8B9DsQYIDyD7F/rZjGZsTsVaWAj5GlfmQa8U3RCT6hha2wgEuL/aQKHpss/pMKYf/U
         RCM3XtNF9IDOdnqg3VjVMQZ67flKT9Da5O1D2tCXMfvuqB/MsMLLlEsy4UFVJik42osK
         6nky8FtA6R9JbFCf/yVnjVqm4QekNylg5A5nRv+7XXgOdpXdwzTSzH8RHX8o9Qt2h80v
         D/Zg==
X-Gm-Message-State: AOJu0YxwBpak3PIa9hH7cFhYaf47QaZmGDIwnJW1j7DmqAKjJJM8zp74
	Cnl62jE5RuqLqh7TUpFwpHbuTCUlwqqRzjgIFmjw5mXUcpUDwIXgOPIu60TNbcCO8ME=
X-Gm-Gg: ASbGncuHz4a7OBQP+Z+FqxKE9fQXa9yfPxii0wFlf/tc8rzo8y/WqKGGMUjEYilNKH8
	GpVYvUXYctuGxdzxq77Wm/Rvk71z0ARBskD33cR8IkK4jUEOR7kgrANtOGpxMvqTl+PaWHo0xY1
	cSSQSP2OJEsVjN5FPkI7m6m1xLLhFUfR5BEhLOL1OEUui4sLkPcYD6U1f1WST4Ujo3Gnn4PK9M9
	s9yVQl/kKckPFHoSpWl8M/r5lnOM1v9rdE2uYWcE3KQImoNM+1AUq5iqYF0R/pUeUUJop1U66CX
	Tnki/sEdsKnpY7fySFUU+Y/ftQSpIIi3YMyWL7nzgJXS8MYPRLhxlcpR+sDHc4FaljzTU/DDAdD
	RIGHzmI2SyR7e5pSJkwviGbEfibM/
X-Google-Smtp-Source: AGHT+IEdhL7k5DzcFwB/JV4pFW3hFU/M2ztaF4G0E1I47kMXHVf4IEu46LQ3/VSTgqWHUuOLyF6tAQ==
X-Received: by 2002:a05:600c:4fc9:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-442fd6271b6mr194407665e9.10.1747728320567;
        Tue, 20 May 2025 01:05:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f182538fsm21418725e9.7.2025.05.20.01.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:05:20 -0700 (PDT)
Message-ID: <b6a18331-2f5a-4ce6-a3a5-2a483805cc78@linaro.org>
Date: Tue, 20 May 2025 10:05:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 28/30] drm/msm/dpu: drop ununused PINGPONG features
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-28-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-28-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> All existing PINGPONG feature bits are completely unused. Drop them from
> the current codebase.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 12 ------------
>   1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 9658561c4cb653ca86094d67f7b5dc92d36d38cd..c1488a2c160b0e2ab08243a6e2bd099329ae759b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -87,18 +87,6 @@ enum {
>   	DPU_DSPP_MAX
>   };
>   
> -/**
> - * PINGPONG sub-blocks
> - * @DPU_PINGPONG_SPLIT      PP block supports split fifo
> - * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
> - * @DPU_PINGPONG_MAX
> - */
> -enum {
> -	DPU_PINGPONG_SPLIT = 0x1,
> -	DPU_PINGPONG_SLAVE,
> -	DPU_PINGPONG_MAX
> -};
> -
>   /**
>    * CTL sub-blocks
>    * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

