Return-Path: <linux-arm-msm+bounces-78730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DD0C064CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 14:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A67563BE11F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 12:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DE33191D9;
	Fri, 24 Oct 2025 12:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wra4ELPV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C2E3191C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761309830; cv=none; b=K1QwN1X0J1fCtjxWryAHRNyliuJVoRM+GtQMnljuK7mkgboc6hmw5sujO8iVqQIUXbdU0dlQ/8+2FGjSdpffJmLtfKycPn0NBuyuvsG5ZzaR7A2accdRtKFcqlr6LkOw7fwvwWebdXy/wcencCnuWCbuTKfkFI1XozRZiPwXilU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761309830; c=relaxed/simple;
	bh=Vk8nYPvpGqjn0DBzJa6MLPHwu3nXrZw1MXCjdx5Mr3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=i1KE2DZ37NB2Z2Pplh/Xk6sAWOuC4sQddH/ubCyL2ehyaYRdb8TPUHVLWefXYEA3RnTHtK6NOBGET0rFmnRd2SKcIrT4Nt/CW8TrW303GRmqz1h+7M8dO58j7eK1xP0weViq+lSCt99+udvKkS4tJDianQ/pcSfmZ9Ejp/96CZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wra4ELPV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4711b95226dso22809435e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761309826; x=1761914626; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igAaRPL1BwJfQsihzx/18gJypJVrJ/IkmKGKkQI3J/I=;
        b=Wra4ELPV9PaiKp5OQiSxChPUBb7wUFkHg4zm511ILf44R7H3jipMO2qjRJ5zqxE2hd
         VilmXIIshrBpYbKjGiRYCfWtXLHJvS8s5xZHNwTW33NJPSLP8XM0nULfZhnO3DCg0rpS
         YAewI4oktBPmcQ3i5tq9OO+WCjf5gVxPESSFLqAe0S9ZGgwhBtHIe+zQNxU31XQTkh2A
         HjJ8rr5WsSVAcXUvdnZFQn2UnFaaPxcC5YjKnhWhDnM17+LREQZ4NsQ6bEXF86cmMBnK
         646UWgOj7pAaebFDACGW88Sk3elbe+TVTVTC15KlRjjwMNdAjh5eXgRubobHTk9Au0RO
         DarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761309826; x=1761914626;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=igAaRPL1BwJfQsihzx/18gJypJVrJ/IkmKGKkQI3J/I=;
        b=j2SNQVgnJqwlmOIh/JjopMgcRAKSH1AeKzUGvRAAUd1EFfgQrt3a8jtpHIPQdJVIhB
         BSf0lnHg37143n3cTfGCLjkUX+tiiRgHnPuP6f5Pjjqd1YLRR52zd/gC9uxM7VpVHgGB
         RWJYVJLfyepqiHF9RE2yR081vkGlcLICoIz4t7FqKkurFM/nmS+hF6lSrmZUx08A/TWS
         XacFTeI2VAzIz1CHDEK6hgXIz4hBwu0kMKaoAMvS79MHecVbDMf0qkvI0vewnzRbX74N
         3XjAZ2l+HOtYTTGPNaQ/CDmj/P59TJBLiHl4rq1vlDBSyLwksAJehlCYx8CxZG3z4tfI
         eJJg==
X-Forwarded-Encrypted: i=1; AJvYcCWRZnLJ8xDAC5W64O+ynmXbK8z0T9SADiacNRIfMBrWgtCej94589Zvse6H2WYFf78e4VnZD+i9OLbr1LW9@vger.kernel.org
X-Gm-Message-State: AOJu0YxdS7eAnWZ6nkGndMFgxQFXqg0ihEmvODdISSVXfC+LpuX31iNb
	PV9KM7Hr1CHlUXFBqiZM+3GzXtQo0DdYstVDcfBo5ZR5sPyHrOxJYUSy6+Ed/PZI7E0=
X-Gm-Gg: ASbGnctWtU9LHtvgCsG+oGXw9iijmjFuZxJ7HGCyYVCBnObhMP7S+dm+JEDCgNHTkcI
	psaBIZKtTmVyoHXIkI3G4drN9oke9VTnDFtv/pNIsLE/oOYCvQfQbWMSiPVMoNRd37lJZFT/1gP
	2td3P+VVpiQeWDyFIEArbaU8A25Ixvsbbp2j7zpaCw4d7biM79oqAZMWiY9GGPG7syESfqqCcbd
	HAkD/F+mgQUGfdDj7i/pxqFe084w6kvUhN0HPAjEcdqy++qm3AuAR0ukyrqzIHwtEto6vaBrP2V
	kVyCDULDPM806AWgMcnX5AiLYbdI9iBbwmZzNrQJfgm7vqD4nfqAbDXU5FjirHf8iFoy7DnBfkj
	AH49r7WHmpRAqijD/vsm/lcoEiplwhtn66MZ/wMcQc7HO1cN9wnZWrXmr4vO0XfzQ1ogbqbwPvR
	k7XfCNcLwY7LrdYA1vM2v1lmF+n5SuiEKTRLLnck+R4U0Jm60mJaiJoRum2H3gqp0=
X-Google-Smtp-Source: AGHT+IHH0dnsx6kI59FtD2gD+G+iMgdJ7PtioVuZnAh7rBTjoaPSkxaanum/a6GHlMPunZS2BZWYIA==
X-Received: by 2002:a05:600d:4354:b0:475:d944:2053 with SMTP id 5b1f17b1804b1-475d9442192mr2846135e9.2.1761309826046;
        Fri, 24 Oct 2025 05:43:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b4ee:479d:354c:6970? ([2a01:e0a:3d9:2080:b4ee:479d:354c:6970])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429898adf78sm9746118f8f.32.2025.10.24.05.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 05:43:45 -0700 (PDT)
Message-ID: <50a49d72-2b1e-471d-b0c4-d5a0b38b2a21@linaro.org>
Date: Fri, 24 Oct 2025 14:43:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7] drm/msm/dsi/phy: Fix reading zero as PLL rates when
 unprepared
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250908094950.72877-2-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250908094950.72877-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/8/25 11:49, Krzysztof Kozlowski wrote:
> Hardware Programming Guide for DSI PHY says that PLL_SHUTDOWNB and
> DIGTOP_PWRDN_B have to be asserted for any PLL register access.
> Whenever dsi_pll_7nm_vco_recalc_rate() or dsi_pll_7nm_vco_set_rate()
> were called on unprepared PLL, driver read values of zero leading to all
> sort of further troubles, like failing to set pixel and byte clock
> rates.
> 
> Asserting the PLL shutdown bit is done by dsi_pll_enable_pll_bias() (and
> corresponding dsi_pll_disable_pll_bias()) which are called through the
> code, including from PLL .prepare() and .unprepare() callbacks.
> 
> The .set_rate() and .recalc_rate() can be called almost anytime from
> external users including times when PLL is or is not prepared, thus
> driver should not interfere with the prepare status.
> 
> Implement simple reference counting for the PLL bias, so
> set_rate/recalc_rate will not change the status of prepared PLL.
> 
> Issue of reading 0 in .recalc_rate() did not show up on existing
> devices, but only after re-ordering the code for SM8750.

It happens this breaks the bonded DSI use-case, mainly because both PHYs
uses the same PLL, and trying to enable the DSI0 PHY PLL from the DSI1
PHY fails because the DSI0 PHY enable_count == 0.

Reverting part the the patch makes the bonded work again:
===================><===============================
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 32f06edd21a9..24811c52d34c 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -426,11 +426,8 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
  	u32 data;

  	spin_lock_irqsave(&pll->pll_enable_lock, flags);
-	if (pll->pll_enable_cnt++) {
-		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
-		WARN_ON(pll->pll_enable_cnt == INT_MAX);
-		return;
-	}
+	pll->pll_enable_cnt++;
+	WARN_ON(pll->pll_enable_cnt == INT_MAX);

  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
  	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
@@ -965,10 +962,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
  	u32 const delay_us = 5;
  	u32 const timeout_us = 1000;
  	struct msm_dsi_dphy_timing *timing = &phy->timing;
-	struct dsi_pll_7nm *pll = phy->pll_data;
  	void __iomem *base = phy->base;
  	bool less_than_1500_mhz;
-	unsigned long flags;
  	u32 vreg_ctrl_0, vreg_ctrl_1, lane_ctrl0;
  	u32 glbl_pemph_ctrl_0;
  	u32 glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
@@ -1090,13 +1085,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
  		glbl_rescode_bot_ctrl = 0x3c;
  	}

-	spin_lock_irqsave(&pll->pll_enable_lock, flags);
-	pll->pll_enable_cnt = 1;
  	/* de-assert digital and pll power down */
  	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
  	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
  	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
-	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);

  	/* Assert PLL core reset */
  	writel(0x00, base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL);
@@ -1209,9 +1201,7 @@ static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)

  static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
  {
-	struct dsi_pll_7nm *pll = phy->pll_data;
  	void __iomem *base = phy->base;
-	unsigned long flags;
  	u32 data;

  	DBG("");
@@ -1238,11 +1228,8 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
  	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
  	writel(0, base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0);

-	spin_lock_irqsave(&pll->pll_enable_lock, flags);
-	pll->pll_enable_cnt = 0;
  	/* Turn off all PHY blocks */
  	writel(0x00, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
-	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);

  	/* make sure phy is turned off */
  	wmb();
===================><===============================

This removed the phy_enable/_disable from the equation because the DSI PHY
code already supports enabling the PLL when the PHY is disabled.

Could you test if it still works fine om SM8750 ?

Neil

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Continuing changelog from "drm/msm: Add support for SM8750" where this
> was part of.
> 
> Changes in v7:
> - Rebase
> - I did not remove ndelay(250) as discussed with Dmitry, because:
>    1. Indeed the HPG does not mention any delay needed, unlike PHY 10 nm.
>    2. However downstream source code for PHY 3+4+5 nm has exactly these
>       delays. This could be copy-paste or could be intentional workaround
>       for some issue about which I have no clue. Timings are tricky and
>       I don't think I should be introducing changes without actually
>       knowing them.
> - Add Rb tags
> - Link to v6: https://lore.kernel.org/r/20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org
> 
> Changes in v6:
> 1. Print error on pll bias enable/disable imbalance refcnt
> 
> Changes in v5:
> 1. New patch
> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 53 +++++++++++++++++++++++
>   2 files changed, 54 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 3cbf08231492..e391505fdaf0 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -109,6 +109,7 @@ struct msm_dsi_phy {
>   	struct msm_dsi_dphy_timing timing;
>   	const struct msm_dsi_phy_cfg *cfg;
>   	void *tuning_cfg;
> +	void *pll_data;
>   
>   	enum msm_dsi_phy_usecase usecase;
>   	bool regulator_ldo_mode;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 2c2bbda46c78..32f06edd21a9 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -90,6 +90,13 @@ struct dsi_pll_7nm {
>   	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
>   	spinlock_t pclk_mux_lock;
>   
> +	/*
> +	 * protects REG_DSI_7nm_PHY_CMN_CTRL_0 register and pll_enable_cnt
> +	 * member
> +	 */
> +	spinlock_t pll_enable_lock;
> +	int pll_enable_cnt;
> +
>   	struct pll_7nm_cached_state cached_state;
>   
>   	struct dsi_pll_7nm *slave;
> @@ -103,6 +110,9 @@ struct dsi_pll_7nm {
>    */
>   static struct dsi_pll_7nm *pll_7nm_list[DSI_MAX];
>   
> +static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll);
> +static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll);
> +
>   static void dsi_pll_setup_config(struct dsi_pll_config *config)
>   {
>   	config->ssc_freq = 31500;
> @@ -340,6 +350,7 @@ static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
>   	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
>   	struct dsi_pll_config config;
>   
> +	dsi_pll_enable_pll_bias(pll_7nm);
>   	DBG("DSI PLL%d rate=%lu, parent's=%lu", pll_7nm->phy->id, rate,
>   	    parent_rate);
>   
> @@ -357,6 +368,7 @@ static int dsi_pll_7nm_vco_set_rate(struct clk_hw *hw, unsigned long rate,
>   
>   	dsi_pll_ssc_commit(pll_7nm, &config);
>   
> +	dsi_pll_disable_pll_bias(pll_7nm);
>   	/* flush, ensure all register writes are done*/
>   	wmb();
>   
> @@ -385,24 +397,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>   
>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>   {
> +	unsigned long flags;
>   	u32 data;
>   
> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> +	--pll->pll_enable_cnt;
> +	if (pll->pll_enable_cnt < 0) {
> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
> +					  "bug: imbalance in disabling PLL bias\n");
> +		return;
> +	} else if (pll->pll_enable_cnt > 0) {
> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> +		return;
> +	} /* else: == 0 */
> +
>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>   	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>   	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>   	ndelay(250);
>   }
>   
>   static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>   {
> +	unsigned long flags;
>   	u32 data;
>   
> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> +	if (pll->pll_enable_cnt++) {
> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> +		WARN_ON(pll->pll_enable_cnt == INT_MAX);
> +		return;
> +	}
> +
>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>   	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>   
>   	writel(0xc0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>   	ndelay(250);
>   }
>   
> @@ -543,6 +578,7 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>   	u32 dec;
>   	u64 pll_freq, tmp64;
>   
> +	dsi_pll_enable_pll_bias(pll_7nm);
>   	dec = readl(base + REG_DSI_7nm_PHY_PLL_DECIMAL_DIV_START_1);
>   	dec &= 0xff;
>   
> @@ -567,6 +603,8 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
>   	DBG("DSI PLL%d returning vco rate = %lu, dec = %x, frac = %x",
>   	    pll_7nm->phy->id, (unsigned long)vco_rate, dec, frac);
>   
> +	dsi_pll_disable_pll_bias(pll_7nm);
> +
>   	return (unsigned long)vco_rate;
>   }
>   
> @@ -600,6 +638,7 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
>   	void __iomem *phy_base = pll_7nm->phy->base;
>   	u32 cmn_clk_cfg0, cmn_clk_cfg1;
>   
> +	dsi_pll_enable_pll_bias(pll_7nm);
>   	cached->pll_out_div = readl(pll_7nm->phy->pll_base +
>   			REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
>   	cached->pll_out_div &= 0x3;
> @@ -611,6 +650,7 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
>   	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>   	cached->pll_mux = FIELD_GET(DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK, cmn_clk_cfg1);
>   
> +	dsi_pll_disable_pll_bias(pll_7nm);
>   	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
>   	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
>   	    cached->pix_clk_div, cached->pll_mux);
> @@ -833,8 +873,10 @@ static int dsi_pll_7nm_init(struct msm_dsi_phy *phy)
>   
>   	spin_lock_init(&pll_7nm->postdiv_lock);
>   	spin_lock_init(&pll_7nm->pclk_mux_lock);
> +	spin_lock_init(&pll_7nm->pll_enable_lock);
>   
>   	pll_7nm->phy = phy;
> +	phy->pll_data = pll_7nm;
>   
>   	ret = pll_7nm_register(pll_7nm, phy->provided_clocks->hws);
>   	if (ret) {
> @@ -923,8 +965,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   	u32 const delay_us = 5;
>   	u32 const timeout_us = 1000;
>   	struct msm_dsi_dphy_timing *timing = &phy->timing;
> +	struct dsi_pll_7nm *pll = phy->pll_data;
>   	void __iomem *base = phy->base;
>   	bool less_than_1500_mhz;
> +	unsigned long flags;
>   	u32 vreg_ctrl_0, vreg_ctrl_1, lane_ctrl0;
>   	u32 glbl_pemph_ctrl_0;
>   	u32 glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
> @@ -1046,10 +1090,13 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>   		glbl_rescode_bot_ctrl = 0x3c;
>   	}
>   
> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> +	pll->pll_enable_cnt = 1;
>   	/* de-assert digital and pll power down */
>   	data = DSI_7nm_PHY_CMN_CTRL_0_DIGTOP_PWRDN_B |
>   	       DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>   	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>   
>   	/* Assert PLL core reset */
>   	writel(0x00, base + REG_DSI_7nm_PHY_CMN_PLL_CNTRL);
> @@ -1162,7 +1209,9 @@ static bool dsi_7nm_set_continuous_clock(struct msm_dsi_phy *phy, bool enable)
>   
>   static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>   {
> +	struct dsi_pll_7nm *pll = phy->pll_data;
>   	void __iomem *base = phy->base;
> +	unsigned long flags;
>   	u32 data;
>   
>   	DBG("");
> @@ -1189,8 +1238,12 @@ static void dsi_7nm_phy_disable(struct msm_dsi_phy *phy)
>   	writel(data, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>   	writel(0, base + REG_DSI_7nm_PHY_CMN_LANE_CTRL0);
>   
> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> +	pll->pll_enable_cnt = 0;
>   	/* Turn off all PHY blocks */
>   	writel(0x00, base + REG_DSI_7nm_PHY_CMN_CTRL_0);
> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
> +
>   	/* make sure phy is turned off */
>   	wmb();
>   


