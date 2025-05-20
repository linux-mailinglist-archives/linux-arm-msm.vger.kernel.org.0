Return-Path: <linux-arm-msm+bounces-58635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E34EDABD11D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 09:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 131AF8A4E32
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 07:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9275010E4;
	Tue, 20 May 2025 07:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bYwEUWhr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00D225DCE2
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 07:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747727738; cv=none; b=jpmCvRw1F0N7igRNVwWTTYNTupxgmCejJGE0tOtPl0+lye3WY4sYcxJD789C5Y6rFJMX0IN7S4/wdG8lxcQI41Sxxst0Hy+Icwk8QUU74/50CP4oHEMP8jbz7/D3w7NuPDQk4ZfFB3sp01/AazGsFgZlHXKoDHwtTrMj+Xj2L7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747727738; c=relaxed/simple;
	bh=DH6iJT9MP8tGghHOHinv/qCD072YDipr0uv4fSaqCw8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=musxeOsYs/P7KBNn6zSiV4+a52DchSD6cm9402yokmwXjHugr/4M6B3QQ1ogf0YjNfQrEnDEXY4CHnbMj1rdEcYZ9Ujb1dJQ769pmRO81Uh2IEsCNdwpXahxvA+te4ymziu0rdgM7npYgDS6xAmPtBuqfVJxfIpOohAeNUdVkvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bYwEUWhr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a36c2d3104so1360856f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 00:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747727735; x=1748332535; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTwYJuRi/Eg0WELxNnHnxBQFaapmJT03AsdQ27gfLkw=;
        b=bYwEUWhrYROr8FA2nVhUNNOqyzQrhyAs9K0UntbFjBxlA7ZodXti2DR+uUwpnPAjhZ
         qazlwsYUZI/MVio4cBIZoMS0PYhlZNTchvMCXVT4Bmboqht3X0N7yaAxpwmWAY5jRWhy
         MQGgAR+AqzcnZTVMtp/vjIDN/eNmniXlIfpeOTEIoynRbWY2/K7NSfPOEBPpo791P/2n
         Y7L9WD9gs2xE+7ZfI+4GNG3vd2isJvJldeH1yenEeJ+xxF8vSjKtKTjUMXIXQ2ma6MtC
         jCNqqsl60EEWJ1Ngvj/WV8NZd94etkBdLIZXjPitlbRmqtVYGP9rFof2OOfFlhmADDmM
         7kKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747727735; x=1748332535;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TTwYJuRi/Eg0WELxNnHnxBQFaapmJT03AsdQ27gfLkw=;
        b=cszT9FRtbALRJRBzYCqrclU8bAtxixmEGHwegHbErYAZbU6Wv8BPtV1SP+VxTI8CQo
         2m4E+Oly3DHFVBI741HN42jiQv0w/CWz785Hod5fqT5vIucchosRB3MHgQjqZJN36Ob9
         IyZJxGfJJ9G81ekaA+n4g1tU6rlyp3NbJl6NQ2g4et2Mo+4i5V1KlTw365qb4I0Q8/io
         mL4j8dVeeNg1WYFatpFdd9hxqPSptPRz4rUI0Yp3MNVw0RaSRfcFZbmK0pkaiMmccPEU
         OfMHrFzc5iEwIcjEg5yf7M1Qpluntbz+/zLxeM+e+wwqG3kUCMmoeefNhJJvXLa69kbD
         4pkg==
X-Gm-Message-State: AOJu0YzOLjQER2HE4n3jNaHCM4leBkfQwxSQi+jG235qJzgz3lyi2Jlk
	90ZSLYyVGpy6UlQkouXgdKI/L62p0zvV550w+Lu0AjIqWtFzZLZsw23SWKMQQ6wFD/w=
X-Gm-Gg: ASbGncswwVQxX256Sbr0siOiWLmz2bKho6YMuK+IG20nRy3FCaU5nSfoifp8C98OR6I
	rPKkyuNbOAwpO/+hIu4VgcBepjp6p9djd9K28L+qyguFV7Bfai0u7h+jL0vy2h6iil2WtviVc6E
	/14uUXdM+tgwL3FIG8GSJ+soCfoFzhOXSI5G9KPVAwwhgy7CaCL6oBp5Odpcbw6CP9znf1/hl+m
	pnXvZMYUNuERizyHUOShJDicerynGqwG6LEDbrBxTqUSwGXwJB7ltn/sVbrteec0akrKqvohpbX
	avLEe9B74ES+6kIo+OGLwmPZVJlYpElfcv1RZPioHRVeazVsk9NORDMyk4U0atxuqhTThBOQG4t
	KXPIJelW6+BU8vYAVpW32QipL6LcB
X-Google-Smtp-Source: AGHT+IEMuKGzrABlj661R3JZRoUiiB7Sh1ePQqZHRqYdqZBm8E8d5LXLqnzq3lo2mUKPxjsoFNp+5w==
X-Received: by 2002:a05:6000:2387:b0:3a0:7d27:f076 with SMTP id ffacd0b85a97d-3a35c808dafmr14870100f8f.2.1747727734967;
        Tue, 20 May 2025 00:55:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68? ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a365bc0b5esm11764180f8f.9.2025.05.20.00.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:55:34 -0700 (PDT)
Message-ID: <3bc8e8dc-1e73-4a2e-b5d6-975768f64989@linaro.org>
Date: Tue, 20 May 2025 09:55:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 13/30] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-13-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-13-6c5e88e31383@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_DATA_HCTL_EN feature bit with the core_major_ver >= 5 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 2 +-
>   3 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 5cd87b13e839e7ad60356cde162405fdfb6f9498..1244dd59648d11123c507a1369f28f952d047fd5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -106,8 +106,7 @@
>   
>   #define INTF_SC7180_MASK \
>   	(BIT(DPU_INTF_INPUT_CTRL) | \
> -	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
> -	 BIT(DPU_DATA_HCTL_EN))
> +	 BIT(DPU_INTF_STATUS_SUPPORTED))
>   
>   #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
>   			 BIT(DPU_WB_UBWC) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 3b6133e1bb581741fe87b049ad0c89bf30b76019..bf6b2392efb47fa8c3e3c5d17f1a72341872e18b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -143,14 +143,11 @@ enum {
>    * INTF sub-blocks
>    * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
>    *                                  pixel data arrives to this INTF
> - * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
> - *                                  than video timing
>    * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
>    * @DPU_INTF_MAX
>    */
>   enum {
>   	DPU_INTF_INPUT_CTRL = 0x1,
> -	DPU_DATA_HCTL_EN,
>   	DPU_INTF_STATUS_SUPPORTED,
>   	DPU_INTF_MAX
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 1d56c21ac79095ab515aeb485346e1eb5793c260..8f9733aad2dec3a9b5464d55b00f350348842911 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -237,7 +237,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>   	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
>   	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
>   	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
> -	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
> +	if (intf->mdss_ver->core_major_ver >= 5) {
>   		/*
>   		 * DATA_HCTL_EN controls data timing which can be different from
>   		 * video timing. It is recommended to enable it for all cases, except
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

