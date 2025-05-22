Return-Path: <linux-arm-msm+bounces-59009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECEEAC0596
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 09:23:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CAC41695DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 07:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3110221FD5;
	Thu, 22 May 2025 07:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YHYQroET"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72685D8F0
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 07:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898607; cv=none; b=IA6TZ7JlFS1Gz+xqhooWZT9PiOXC3VPQbu9+gNeUGzNstYqUYjCLc5l1iMrGNLnfvosbGxx9yq9Zu0jMpP5sDUsiugAj5oyFCT9lpyGXL1U/FcAHDSQ9xv3pyqu2SG7dPkDy5ZAITStm6mOq4L0+xkUC2XBr0nFLLdNwHHHnnpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898607; c=relaxed/simple;
	bh=kfzQFTzqUXl3JoxfHKT9wyaYEVv5cnXsyzO9kmYi/w8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aDRVq0mqs3f7lO4zQ/2/U/d8G+WpKArq9DvijbxjORG4Bt00if8B/v1CyZjG/yn05sKrICF6S+4gjQJIbuPgtxWfmyrV4gOkJrMljwEpEmVlpwuw+XJl36GiaZdYAfrlYgV8zuYHaHh0Ld+7NKj40mSJ4cF18kO8VJkHH0k4his=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YHYQroET; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so63445965e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 00:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747898603; x=1748503403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZR2UmwyvYbkG1MeoeRYmbzrVJKOcssJezkUQpLtb9g=;
        b=YHYQroETd7PrtG6P4uu2vCDnb+6kjyRXoH95fy7fepbHmgIsr6eSClNxPHvxQCw6Vo
         dbBQVe9Ux2+yjhaua+mAypUGrAem37x3+PyWZm0T8yqOz+5U5/QQDV6zCwnE0eATXoUS
         WR16l/X3OKyB3JReRB3jGdklLeZKIClbBMyY3t3Yh7Xfr60X7O+6TlD2KhjmokW8Cc47
         oOG/Dos6C2CTGe2dZDHa3McxlOmZM/0eBQcxM1KX7/40434VljMTGWVckSf6Ma+ZezVM
         vSj+jCb/3Hei+4IZepGtx/EFU8QjRLdjiBEaQ+H+CMNG7pLqO55aQDfIQrsNfNCAkjjM
         b9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747898603; x=1748503403;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QZR2UmwyvYbkG1MeoeRYmbzrVJKOcssJezkUQpLtb9g=;
        b=jBM1+rF/Rk3j+Ojr2/qwJ4UMR8P4bruZqiz4hyc/NKG+yXCZ0QnIcp1aAurpTUtsCw
         kQXTHJAoO+BwtGVTXxTXG/+KiGjo8DcXJXq9J1ebwP7e525Tg3OU5EN2IiPsJAqZkVUq
         oKWbLERYRHmP2kuiHomb0iS2AvkPTwk9G8ShLh5WOVYEHM73HbVM1owW9YjIwGLYwy0p
         PIEaIXt6X/mf+ocROECPjGPVFHpLgAs/c2JzJZ6pktUmD0Rb1u0wjO3ThqqKH6kAbAqh
         npaNkksgPImw3yszd2Ftgnds25RB1eEx4Yg7E3PEsfFteKGw4Lz7FkBQXN6sL6Nf/U7b
         iaHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkEwd31iYXO7uWHuuZH/SYn99VwTYtDUKilrV3583UkUbkVEr2WWCkPQYzh0ZHwV2X9laGeKHKf0vVNMHm@vger.kernel.org
X-Gm-Message-State: AOJu0YyzZgr5762SXu+79/0NA3nyXmUNnElBLnghCgfscg6eRp/SxHER
	4Xup9jcNzcRMgGKt036l9W+lIiFL5VJOSLdiBsCsnFWIS8F3L2c+oj8KKznVMMofG1M=
X-Gm-Gg: ASbGncvw0R0eixkOpUgU3Wvlj47bn+Fkwj+CdCyvEwxMJjXygJQxBVMYmFQyS/nBQmI
	G5X90GUuJtUWzd6BD6tgy0dkQ4aj23VbtP6dQ1A+M2ESg9iV/sSa+fxchtHYnHKVpkR6x6Eljpz
	HpPtFmnFaReoy1za7HrOQNl+n7MNLFT9TMjAEuF1v+4uzcq+Ixu3uDuUToeS9eQQazDzZhIuM+4
	E0WoA4kwSBpVBPhcMy8IzWd4nvaaK0sTDUlwUzTQyjxt/96+R+NDCLy11/ls5HMQV2xYeRuiKso
	d3z2VqxOyA4edKD56ubOUielenu7QAmO47Gc0XbIr0i56rqkO5zXbQYPsfQ0fwyOOblWQcCAkLv
	MmG/xZoRbjwHaS7Rr9fMFjKAS4vuQTgTiu4fABEE=
X-Google-Smtp-Source: AGHT+IHIvSY7+qwnZ/QQdNvPjKupe5qhn5r92x/K597uQ+Eo6bTe2yY6F9VCdwYcPSbvThPcoAaNew==
X-Received: by 2002:a05:600c:3f07:b0:43d:77c5:9c1a with SMTP id 5b1f17b1804b1-442fd60b516mr239629295e9.4.1747898603150;
        Thu, 22 May 2025 00:23:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5? ([2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd94f1sm97180205e9.35.2025.05.22.00.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:23:22 -0700 (PDT)
Message-ID: <86f5b662-db35-4a2b-83bf-841977d183dd@linaro.org>
Date: Thu, 22 May 2025 09:23:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/5] phy: qcom-uniphy: add more registers from display
 PHYs
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
 <20250520-fd-hdmi-phy-v4-3-fcbaa652ad75@oss.qualcomm.com>
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
In-Reply-To: <20250520-fd-hdmi-phy-v4-3-fcbaa652ad75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 22:44, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Import register definitions from 28nm DSI and HDMI PHYs, adding more UNI
> PHY registers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-uniphy.h | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy.h b/drivers/phy/qualcomm/phy-qcom-uniphy.h
> index e5b79a4dc270f25d8979f51bf4acd6c76998032e..ce782018124b5431ee647575289c963d8fd0de1f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-uniphy.h
> +++ b/drivers/phy/qualcomm/phy-qcom-uniphy.h
> @@ -8,8 +8,19 @@
>   
>   /* PHY registers */
>   #define UNIPHY_PLL_REFCLK_CFG		0x000
> +#define UNIPHY_PLL_POSTDIV1_CFG		0x004
> +#define UNIPHY_PLL_CHGPUMP_CFG		0x008
> +#define UNIPHY_PLL_VCOLPF_CFG		0x00c
> +#define UNIPHY_PLL_VREG_CFG		0x010
>   #define UNIPHY_PLL_PWRGEN_CFG		0x014
> +#define UNIPHY_PLL_DMUX_CFG		0x018
> +#define UNIPHY_PLL_AMUX_CFG		0x01c
>   #define UNIPHY_PLL_GLB_CFG		0x020
> +#define UNIPHY_PLL_POSTDIV2_CFG		0x024
> +#define UNIPHY_PLL_POSTDIV3_CFG		0x028
> +#define UNIPHY_PLL_LPFR_CFG		0x02c
> +#define UNIPHY_PLL_LPFC1_CFG		0x030
> +#define UNIPHY_PLL_LPFC2_CFG		0x034
>   #define UNIPHY_PLL_SDM_CFG0		0x038
>   #define UNIPHY_PLL_SDM_CFG1		0x03c
>   #define UNIPHY_PLL_SDM_CFG2		0x040
> @@ -22,11 +33,33 @@
>   #define UNIPHY_PLL_LKDET_CFG0		0x05c
>   #define UNIPHY_PLL_LKDET_CFG1		0x060
>   #define UNIPHY_PLL_LKDET_CFG2		0x064
> +#define UNIPHY_PLL_TEST_CFG		0x068
>   #define UNIPHY_PLL_CAL_CFG0		0x06c
> +#define UNIPHY_PLL_CAL_CFG1		0x070
> +#define UNIPHY_PLL_CAL_CFG2		0x074
> +#define UNIPHY_PLL_CAL_CFG3		0x078
> +#define UNIPHY_PLL_CAL_CFG4		0x07c
> +#define UNIPHY_PLL_CAL_CFG5		0x080
> +#define UNIPHY_PLL_CAL_CFG6		0x084
> +#define UNIPHY_PLL_CAL_CFG7		0x088
>   #define UNIPHY_PLL_CAL_CFG8		0x08c
>   #define UNIPHY_PLL_CAL_CFG9		0x090
>   #define UNIPHY_PLL_CAL_CFG10		0x094
>   #define UNIPHY_PLL_CAL_CFG11		0x098
> +#define UNIPHY_PLL_EFUSE_CFG		0x09c
> +#define UNIPHY_PLL_DEBUG_BUS_SEL	0x0a0
> +#define UNIPHY_PLL_CTRL_42		0x0a4
> +#define UNIPHY_PLL_CTRL_43		0x0a8
> +#define UNIPHY_PLL_CTRL_44		0x0ac
> +#define UNIPHY_PLL_CTRL_45		0x0b0
> +#define UNIPHY_PLL_CTRL_46		0x0b4
> +#define UNIPHY_PLL_CTRL_47		0x0b8
> +#define UNIPHY_PLL_CTRL_48		0x0bc
>   #define UNIPHY_PLL_STATUS		0x0c0
> +#define UNIPHY_PLL_DEBUG_BUS0		0x0c4
> +#define UNIPHY_PLL_DEBUG_BUS1		0x0c8
> +#define UNIPHY_PLL_DEBUG_BUS2		0x0cc
> +#define UNIPHY_PLL_DEBUG_BUS3		0x0d0
> +#define UNIPHY_PLL_CTRL_54		0x0d4
>   
>   #endif
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

