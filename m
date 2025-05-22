Return-Path: <linux-arm-msm+bounces-59008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E47BAC0593
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 09:23:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68FBC9E2F16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 07:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585FC2222B8;
	Thu, 22 May 2025 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NEH4+g3D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697A7221D9B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 07:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898595; cv=none; b=VzsgP/afXnZLKIOEOiGXPbip5dEh+vnF0zyiQOipE5U+kMv/6uuyR0w6tiW7AipEOqeDIGk3kH4k4bLxiZzReq0WLBiDgD4zRZpb1oL4a8Z5PX4aDpAyp278mW31lI/xHp7sj6Ud05EIgGrTj8lHWmhHWwAJIqo50qCxnZbGggo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898595; c=relaxed/simple;
	bh=+W5ZcdVBC8wnQHb6cdslYN7V09ylGS82Z5oEceUSFN8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=TdUbX55X5PjqYWkVyQFnMP8IJ3Mv4OwNArTLI2mHFDFB++ogV+aD+vPy/nhhGJsmPxnZz5Fp5uhw8cXq/2JayXKnjKQ3gusVIyu0goayi7DFCVCjo+Ei9lhbjG1fAoWx6CaaM4O5/vAYYFjC6ht9MBg0JNQEw2dpI4mrz5tPr88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NEH4+g3D; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-445b11306abso30608535e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747898592; x=1748503392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKcV9YJnik1heDPbiDZhe+461Bkk9PUXYS1vSVg0MNo=;
        b=NEH4+g3DT/oJJF+a/Q7qVqn4vRrUKsQPGWqZniHg2/HnEhjvEN/gcN4hROMF4jo5Kq
         7LuZDD4CZS11qzdQqVnum2RwW4ytWihhcxXeSLmBO0F8k0EclUwc3vFhYS4CyBs3/eMx
         Ddgb5b1fygzSMuTJ3zZ6x+DUBLjShSTWmcAj4JWHJAnfZtYBR6hB4h6lb7g938v7A+mW
         ShM+AUPjh26+srM0gnUIVOWESamhLqKLLU1+665Nvc3HFVjs7/+NdK1JM5j+ypP4yfaF
         PWfK5HFnb6KfrbWjrsTDEnylxb8v/T8K3oXeuhmxUQoqK8eWXp8t5P2A+8cO6iyetm+b
         rXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898592; x=1748503392;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DKcV9YJnik1heDPbiDZhe+461Bkk9PUXYS1vSVg0MNo=;
        b=EIddSoEJDSe0XNzKfYpaCqhMJh/VwKITK4r83Tmq/4fEA4+9g2LegfWRJAOrv/aIqi
         24IZqzZMf29nWsyrYDbJdSdFsQopxMDeemzM9wAaYrfOyabsSPe1KKKuqIwlFJf9R6d3
         OuM/3KKVSLjQwIyyBWlY+pr6MtgE9lOSLJkdHuhXG7YdhGPKOD/NeDd2PQyAjSsHeLOy
         bZkesHBH01/H5pIqmQeChPUP02Xai5MhfGPcjf+HxWScbbEzPGACm2fgWw8NFVGvfBO1
         kt0I4lnIZ8f63WiNVi4J7LluWuqkXsKr8DC3BLya3hiVVTzwACcScRsl12Z7Nj1ik3Hl
         /7zA==
X-Forwarded-Encrypted: i=1; AJvYcCWYhVdErZ5459qy+IdZlMyjEsA5Bq45A9D3+KrkyC21gXhPPQ1ruah3NGQuruq0HUlYSPq4L7pD0PWpMMBB@vger.kernel.org
X-Gm-Message-State: AOJu0YxYKcCmHcBT7DR5e5WC4w/QcNq2ZYn9GKxNvJWQSbz4LIXu439/
	xq+bXx9DlyXAjzcSQoTgIpZWQ7o3v4Y/ysL0PYBKbV+OmUnc3iKF7Y4V+aBk8eEDsQI=
X-Gm-Gg: ASbGncuXW9hWZPfvLQ9TRKzYu6augC4PhPbAk91Knit04sKOCe6z5DlfDhI2Vomfz/I
	30s7zaq/mEANZqRDMECtbpWnH7LPfYCX+kY/kUG3QvN5+LYm0OGMlGYh1UY7KUX83lgESmE7RkZ
	pJUDq8DRaVugOdLM3Cz1qwnVS6mAiWImsMeYSgpoTEQ21lAPvKXVpTDBs6J8F5nPL6+N6GlOwSF
	8Tt0FI3HgNnKR/SjwUHxDAKn1o2yol3pG5ISHKXEswPFj58T9PpP4WbSJFuKzjJCdLGgRWNW3j5
	FMc5fOek9W6mQ+Zpwu0BqhcbahgZzfi2WFUrzWvtLad1yHkUBJ21ptOcraD9QouzrSaRGzccmvo
	IEKIiky3nIDoAgX3dAEY2hwh4jboI
X-Google-Smtp-Source: AGHT+IHts0eteY4PlR1SQN/PyYMswWNwfgjzZcpYKjCK25ZDntVHx3kCGx8YLO7OAaDj+8ppdM5vmg==
X-Received: by 2002:a05:600c:548d:b0:442:f44f:678 with SMTP id 5b1f17b1804b1-442ff03c63emr240517275e9.31.1747898591652;
        Thu, 22 May 2025 00:23:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5? ([2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd94f1sm97174725e9.35.2025.05.22.00.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:23:11 -0700 (PDT)
Message-ID: <fa65b2bf-b76e-428a-8110-325a6191752e@linaro.org>
Date: Thu, 22 May 2025 09:23:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 2/5] phy: qcom: apq8064-sata: extract UNI PLL register
 defines
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-phy@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
 <20250520-fd-hdmi-phy-v4-2-fcbaa652ad75@oss.qualcomm.com>
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
In-Reply-To: <20250520-fd-hdmi-phy-v4-2-fcbaa652ad75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 22:44, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> The "uni" PLL is shared between several PHYS: APQ8064's SATA,
> MSM8974/APQ8084 HDMI, MSM8916 DSI, MSM8974/APQ8084 DSI.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-apq8064-sata.c | 23 +-------------------
>   drivers/phy/qualcomm/phy-qcom-uniphy.h       | 32 ++++++++++++++++++++++++++++
>   2 files changed, 33 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> index cae290a6e19fcb7fd68fe6cd0229b9b00d47131c..dd9929429f9a0e2f265180e8d3f390451d91adde 100644
> --- a/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> +++ b/drivers/phy/qualcomm/phy-qcom-apq8064-sata.c
> @@ -15,28 +15,7 @@
>   #include <linux/platform_device.h>
>   #include <linux/phy/phy.h>
>   
> -/* PHY registers */
> -#define UNIPHY_PLL_REFCLK_CFG		0x000
> -#define UNIPHY_PLL_PWRGEN_CFG		0x014
> -#define UNIPHY_PLL_GLB_CFG		0x020
> -#define UNIPHY_PLL_SDM_CFG0		0x038
> -#define UNIPHY_PLL_SDM_CFG1		0x03C
> -#define UNIPHY_PLL_SDM_CFG2		0x040
> -#define UNIPHY_PLL_SDM_CFG3		0x044
> -#define UNIPHY_PLL_SDM_CFG4		0x048
> -#define UNIPHY_PLL_SSC_CFG0		0x04C
> -#define UNIPHY_PLL_SSC_CFG1		0x050
> -#define UNIPHY_PLL_SSC_CFG2		0x054
> -#define UNIPHY_PLL_SSC_CFG3		0x058
> -#define UNIPHY_PLL_LKDET_CFG0		0x05C
> -#define UNIPHY_PLL_LKDET_CFG1		0x060
> -#define UNIPHY_PLL_LKDET_CFG2		0x064
> -#define UNIPHY_PLL_CAL_CFG0		0x06C
> -#define UNIPHY_PLL_CAL_CFG8		0x08C
> -#define UNIPHY_PLL_CAL_CFG9		0x090
> -#define UNIPHY_PLL_CAL_CFG10		0x094
> -#define UNIPHY_PLL_CAL_CFG11		0x098
> -#define UNIPHY_PLL_STATUS		0x0C0
> +#include "phy-qcom-uniphy.h"
>   
>   #define SATA_PHY_SER_CTRL		0x100
>   #define SATA_PHY_TX_DRIV_CTRL0		0x104
> diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..e5b79a4dc270f25d8979f51bf4acd6c76998032e
> --- /dev/null
> +++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2014, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef PHY_QCOM_UNIPHY_H
> +#define PHY_QCOM_UNIPHY_H
> +
> +/* PHY registers */
> +#define UNIPHY_PLL_REFCLK_CFG		0x000
> +#define UNIPHY_PLL_PWRGEN_CFG		0x014
> +#define UNIPHY_PLL_GLB_CFG		0x020
> +#define UNIPHY_PLL_SDM_CFG0		0x038
> +#define UNIPHY_PLL_SDM_CFG1		0x03c
> +#define UNIPHY_PLL_SDM_CFG2		0x040
> +#define UNIPHY_PLL_SDM_CFG3		0x044
> +#define UNIPHY_PLL_SDM_CFG4		0x048
> +#define UNIPHY_PLL_SSC_CFG0		0x04c
> +#define UNIPHY_PLL_SSC_CFG1		0x050
> +#define UNIPHY_PLL_SSC_CFG2		0x054
> +#define UNIPHY_PLL_SSC_CFG3		0x058
> +#define UNIPHY_PLL_LKDET_CFG0		0x05c
> +#define UNIPHY_PLL_LKDET_CFG1		0x060
> +#define UNIPHY_PLL_LKDET_CFG2		0x064
> +#define UNIPHY_PLL_CAL_CFG0		0x06c
> +#define UNIPHY_PLL_CAL_CFG8		0x08c
> +#define UNIPHY_PLL_CAL_CFG9		0x090
> +#define UNIPHY_PLL_CAL_CFG10		0x094
> +#define UNIPHY_PLL_CAL_CFG11		0x098
> +#define UNIPHY_PLL_STATUS		0x0c0
> +
> +#endif
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

