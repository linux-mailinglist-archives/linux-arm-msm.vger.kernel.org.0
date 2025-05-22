Return-Path: <linux-arm-msm+bounces-59011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BC2AC05E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 09:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36D5F1B6417C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 07:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE82422258F;
	Thu, 22 May 2025 07:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dVtBGH0L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B237722094
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 07:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747899520; cv=none; b=F8w3ZwJgN55omNeAOY/9MQ54P/TRWBjqZ0pFhzPrEQPdNhvTVSlz0ouiHfzD0QxGh1IJNMQ0oEgkRWjfjw7tWZQtoy55t65eLDEaVGGh+Lxa5yGOZY4RCHjgZfShvn5pm55UIfFv2fdVama8AepLRGrW6iQB7q3r1Ao27LOlW8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747899520; c=relaxed/simple;
	bh=o95nKMg223tMGoS9vDgOi8Gy2YHCGLiKyamcEO+mz60=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=orZJOl4xGBA4w42uqD0qReSQikSVCxd4nCocDU+oYVOoarAAIr7h3nktRhcsPuhEUpSor8YB93BhD0jmychx8ohjlvZ5NL8BvrQT5FsIf0gjy74bF/fMl3l75cDFZxA1tRrgLmw47odqGhABaDXPlo95RkQgm3zm6+1/jL9wUM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dVtBGH0L; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso59070205e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 00:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747899516; x=1748504316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LD8ntK8xfh1M3SZdEUxa9DUXDRo4uk6n0BDBJQLK434=;
        b=dVtBGH0LOAuCSszyXLxE1ddwchhr4aIXzhyp68QvKFQ+ghqhS1Vljx8saUMtL5dSXh
         R3u/rwDMDwgk9dPSxUuu6+h5O4eG9L1r4Xj1n0CeB7dyTUoePSX+qrYJMPZSvfRjTqan
         xiCbJKwYFrXrw1af2kCMVMyNz8kyfbpmsIeddaRo+05DQkIKQCt3ouIjBlU8yXK/8+Qe
         f9W1nw6+v3nmQPYEAnrP6eS4Jbe+Q0bTc4JIvPfo2s2aHVIWOhh1wCY5685ET9nu61SS
         alHWnOven3aSMCkC+EU8LIzCHQFV59rGTCcG5v4U5epr7r+FpygMfHUet5vOdaQfFtmu
         W8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747899516; x=1748504316;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LD8ntK8xfh1M3SZdEUxa9DUXDRo4uk6n0BDBJQLK434=;
        b=X4zDN6woHecUn12HxG8DoghlWdtK3GdkBzV1MJpKN4RYxjnry3INrmUYO8FBwMzTiP
         qmAxEyWlrIJgsHBCMyEkVa6E8hvLIvwS6hHxsAJsIO7Iu6kiyJHrxFtGpUj6UbmanfLL
         tiNFXdCU/uHE3qCzXl0notnsKTGq1SAgFF5YDMvzlVJTN/2WyZzwVtdWwvhqYF0enJS8
         Kr1wE4XCjt/kQPdE8SMVoMrLdJY5AQ8hX4h3C/NnBN3ktAadlKcTGhUmg0rRVauiPW/Y
         YQCvqD+F+zXCZSbNDXxTRt7WArY5poqXP+qb12a8QfftI/kEnVw1VZarsYCT3RH3ueyx
         iP2A==
X-Forwarded-Encrypted: i=1; AJvYcCUslKucG3TfhjQgxSEp791c/9iWVdO1/Hwd298fmrJKcp2w7zhc1WZZNI/rTL7cdLfh7AdPa5E2hXA+GArm@vger.kernel.org
X-Gm-Message-State: AOJu0YxTD2XKCOIyBDaB9NbRb6mNKFA2Hhdqd6n1Vr0gtu23uYCxndLz
	++zB+KYoAtnijBLkONlW85lLkr0vEwNjfmut0sBx0TdGN02+uRrE2U7yCf9hdno91ytw4LU7Pp6
	hbMyT
X-Gm-Gg: ASbGncslan4R+ADZ5euF4VtJrUHP9yujXYhxe7ItQ1ge7tySBUUwdPV7+ReSKVSnD2z
	Arr1BIszCM+vV88RDJL4HhpXV6CMl8lOuMMgA+fj4wKMQGclXFP7OKqtxp2Ixou2vp1Qmx7x5IR
	bgz7CUek07qk1LyRMAl0G5nST42sg9mo6EKg7SkH2OXhztLYdJvW/GUC4dacc4VAV/uHD/Z7MVO
	Ozt5cTcqWHliETqzfdqF7Tl32r1SgjMkIHdO0y/yM5GZy4gGFBpIYuXPGV/rURg8Ft6cOKZhJrH
	rkhPQbMFVNIYD50RT8orufSv4yEK6JeLs3KxfX48W7JWGOlSoEe4g0OQaxw+30o019r+Gam52tL
	njh6vxNIlqSAPzlTlg55CC/XtGKmy
X-Google-Smtp-Source: AGHT+IFkx1lvqitqZfDeiJsWs3JMGtQyZreZK7E9FGT4beePl8PD+rep4VjjgQc2mmbXeTT1TE60Zw==
X-Received: by 2002:a05:6000:18a5:b0:3a3:76ff:a617 with SMTP id ffacd0b85a97d-3a376ffafa7mr10754675f8f.32.1747899515856;
        Thu, 22 May 2025 00:38:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5? ([2a01:e0a:3d9:2080:ca6a:4d93:cd32:83a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8899bsm22008549f8f.62.2025.05.22.00.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 00:38:35 -0700 (PDT)
Message-ID: <a42b9cbb-2f85-40c4-8b40-6f84970aba86@linaro.org>
Date: Thu, 22 May 2025 09:38:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 1/5] drm/msm/hdmi: switch to generic PHY subsystem
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
 <20250520-fd-hdmi-phy-v4-1-fcbaa652ad75@oss.qualcomm.com>
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
In-Reply-To: <20250520-fd-hdmi-phy-v4-1-fcbaa652ad75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/05/2025 22:44, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Change the MSM HDMI driver to use generic PHY subsystem. Moving PHY
> drivers allows better code sharing with the rest of the PHY system.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/Makefile                     |   7 -
>   drivers/gpu/drm/msm/hdmi/hdmi.c                  |  58 +-
>   drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
>   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  32 +-
>   drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 225 -------
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 765 ----------------------
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 769 -----------------------
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
>   drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
>   drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 458 --------------
>   drivers/phy/qualcomm/Kconfig                     |  21 +
>   drivers/phy/qualcomm/Makefile                    |  14 +
>   drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       |  71 +++
>   drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 441 +++++++++++++
>   drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
>   drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 212 +++++++
>   drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  81 +++
>   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 185 ++++++
>   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 442 +++++++++++++
>   drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 495 +++++++++++++++
>   drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  77 +++
>   22 files changed, 2259 insertions(+), 2596 deletions(-)
> 

<snip>

> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> index 53a7ce8cc7bc7b6278eae2cbc42c3fda8d697f6d..1a00c26c1b40fc81623c9fb22ba25f448c27bffb 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <linux/delay.h>
> +#include <linux/phy/phy.h>
>   #include <drm/drm_bridge_connector.h>
>   #include <drm/drm_edid.h>
>   #include <drm/display/drm_hdmi_helper.h>
> @@ -286,11 +287,12 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   {
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> -	struct hdmi_phy *phy = hdmi->phy;
>   	struct drm_encoder *encoder = bridge->encoder;
>   	struct drm_connector *connector;
>   	struct drm_connector_state *conn_state;
>   	struct drm_crtc_state *crtc_state;
> +	union phy_configure_opts phy_opts;
> +	int ret;
>   
>   	DBG("power up");
>   
> @@ -304,7 +306,7 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   
>   	mutex_lock(&hdmi->state_mutex);
>   	if (!hdmi->power_on) {
> -		msm_hdmi_phy_resource_enable(phy);
> +		phy_init(hdmi->phy);
>   		msm_hdmi_power_on(bridge);
>   		hdmi->power_on = true;
>   	}
> @@ -315,7 +317,23 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
>   
>   	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
>   
> -	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
> +	phy_opts.hdmi.tmds_char_rate = conn_state->hdmi.tmds_char_rate;
> +	phy_opts.hdmi.bpc = 8;
> +	phy_configure(hdmi->phy, &phy_opts);
> +
> +	ret = phy_power_on(hdmi->phy);
> +	if (WARN_ON(ret))
> +		return;
> +
> +	if (hdmi->extp_clk) {
> +		ret = clk_set_rate(hdmi->extp_clk, hdmi->pixclock);
> +		if (ret)
> +			DRM_DEV_ERROR(bridge->dev->dev, "failed to set extp clk rate: %d\n", ret);
> +
> +		ret = clk_prepare_enable(hdmi->extp_clk);
> +		if (ret)
> +			DRM_DEV_ERROR(bridge->dev->dev, "failed to enable extp clk: %d\n", ret);
> +	}

Why do you again set the extp_clk since it's already set & enabled in msm_hdmi_power_on() ?

Perhaps I missed a change but it's like that on next-20250521

>   
>   	msm_hdmi_set_mode(hdmi, true);
>   
> @@ -328,7 +346,6 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>   {
>   	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>   	struct hdmi *hdmi = hdmi_bridge->hdmi;
> -	struct hdmi_phy *phy = hdmi->phy;
>   
>   	if (hdmi->hdcp_ctrl)
>   		msm_hdmi_hdcp_off(hdmi->hdcp_ctrl);
> @@ -339,14 +356,17 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>   	mutex_lock(&hdmi->state_mutex);
>   	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
>   
> -	msm_hdmi_phy_powerdown(phy);
> +	if (hdmi->extp_clk)
> +		clk_disable_unprepare(hdmi->extp_clk);
> +
> +	phy_power_off(hdmi->phy);
>   
>   	if (hdmi->power_on) {
>   		power_off(bridge);
>   		hdmi->power_on = false;
>   		if (hdmi->connector->display_info.is_hdmi)
>   			msm_hdmi_audio_update(hdmi);
> -		msm_hdmi_phy_resource_disable(phy);
> +		phy_exit(hdmi->phy);
>   	}
>   	mutex_unlock(&hdmi->state_mutex);
>   }
<snip>

Otherwise it looks fine even there's a lot to digest and hard to figure out
the exact changes done to the PHY drivers.

Neil

