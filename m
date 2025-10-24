Return-Path: <linux-arm-msm+bounces-78740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0731BC06C50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 16:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10CD43B5689
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 14:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00189225A3D;
	Fri, 24 Oct 2025 14:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LkNjP4Bj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0ED23314B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761317297; cv=none; b=XBur68Lsiighi3B/ueHEGWhgp+tvLFzjVwVkJzlJXioz1/EDaDhazsz3+6G1EfwYynouGxF+eZYNY15F6I4I6rXPTnOODNkEjPatop5LJW/GeMTjEaXaAo7h51rhqlUR+fvi1O/wqxrLULCsQhRzJpD7Dm93Ugz6gALDW7TIBe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761317297; c=relaxed/simple;
	bh=6FCvz4Pr8iy8SbSq47KBPpQDq+up64+6iZWhDBOaJ/U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=M1r9ryccbYx4ZQKwVQjs3syWzAglCgbyd70ehFaKjSmC3lIwVMSqrxFL0FBxwHkQb1fZkjmdvEryXkYf+9poXyqYK2rTweOBdnHrG7WDBJuvAAbKe7U7yxSPyCrTVI5fvLnFcCeKVrIVva2Fvtgm0GXHRURFI+Sv3tjWPotFv+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LkNjP4Bj; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-471191ac79dso22767265e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761317293; x=1761922093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1Hx5nLLV2Jg5MZCp9AF1ElKQLvEIm2+dthQoOXPOnI=;
        b=LkNjP4Bjp4vcpX3h/ygVwepvc2dvVVX+hKTDZqCQiKC5aQVqoYr6vbnbYsMNsvhe57
         2loHdYAn2zYIdVCmJNl8JEMDKpY5dGhw9nHjBJdkWzBZDRjQd0ncGAXUz9PuNt3T1hNl
         /K07feD+pMDfSIXppRVWJVwl9AgHGQGVx8iC+9d7vKsmIlVjesy1WbAOJqcfLJ7Y5Jse
         s2AJ8kfDLFUBSFSKHsU7wDAGCrvLSfsIWr+JPYDTmmcKxKMFpz6A84rO0HNgWElWoFXN
         jjjaAP/18BOxA4J5F21bU0Erai0eaaL4JU4V8cB2yhbDQe0R5iECq/oXeS7bloynXR/X
         dxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761317293; x=1761922093;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A1Hx5nLLV2Jg5MZCp9AF1ElKQLvEIm2+dthQoOXPOnI=;
        b=tmAOL5987oLALMm9Wu/CHIcMgOlHp7nZGP+FbMe+osOQZKyB9opTDHYx6Sxcq0B8TO
         THGMMq1WoTc4TpIpa0GTkE9+w+txVgCOzJr297KQs3SYCT9pKD/p6ffKO0wLAZdmQJer
         AllyC82nZkv8yInuayc5TTqnwWFCeXhLXMpjCWarlI3N8HmodrSAYqxNAQXX2jICVChG
         mgqK9isHxnErrGKcBX2rqjbj6uR6/vP2Rz3NS9jq/ZaJ9erjr/oUPlg5dDr/ztmGOM4a
         fpCjw7BXWJZjR1Z5GWtUTTqTH0thWtYhxtSWGM8jI1CjMOWVDffT3EQhOgHzo53HDxD4
         IXnw==
X-Forwarded-Encrypted: i=1; AJvYcCXAg1kEbw8/pJK3/DgmKxB+Wz9RBWUUqVjAg2o8pHVFRoatDpMmRK2XY4Ya+fe4TjQbY++D1NxQM2ySyoKA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/8vsFAoTL4/s+bze6r1414YNCWkpWGw3VSsmvB5xsi+/FdVbx
	sp902uKVil/djarSxs2IJ5ekjHirRGAiz/+J91YsM+4R/1h09VzxiOs+doyK8gZhjXY=
X-Gm-Gg: ASbGncs5J/XlrWrEHvLgn3fnhsoOVU03EhgFJAexTZBz6RtmTl3bT74Brbb1c2tSTl5
	hChb5biVL2+7MoC+wvlLwqUJ2zMRS8wKye7K32wkxzbEmwc4iO+f4oCSRzTH+vHAKPGlEPSlVFs
	w6lVC5PXsx+feZ8u2u+FSfjR7j3GObADvUi9joM1YJPKY+ryvxMAOwdsoFt/sN6fc6FA4B2ckrC
	R7z0FqniC0QveffWm2wz1zgLsyvup9i3rzmgRfyFwAXWuZP3Px/WsjoXPIe9SVhcnqvafmPlqVG
	7CCnPjKhNyAwqlG8igGoCbqKAElMaQi+FJPOCRleOANZj/H/hhDM5iv+UVPy5vkphbz8Hy+mylo
	UKzzfO0lVD/53ZSlrojO8vvrGJ8/w6veQnDhj+1nFF+fscn4VIs7Pn0RM8XWlq3Jysvxs+n7pts
	0whUQHU8Lw8PGAnszn46MeO0jPG4ViS2CcO1NDj/KKi6kzyAjz+Od0a3U46RZLzJU=
X-Google-Smtp-Source: AGHT+IEVOj5qtIK9SZlpsAuRM/0uGNxmJtS/Z+rrAuP/YjslZpEI5RN54V/lFTwvhArOAWWIiCnq5Q==
X-Received: by 2002:a05:600c:6309:b0:46e:4499:ba30 with SMTP id 5b1f17b1804b1-475d2ed1ba5mr21582565e9.30.1761317293064;
        Fri, 24 Oct 2025 07:48:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b4ee:479d:354c:6970? ([2a01:e0a:3d9:2080:b4ee:479d:354c:6970])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475cae924a1sm120723715e9.2.2025.10.24.07.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 07:48:11 -0700 (PDT)
Message-ID: <7d8e9395-d2e4-413c-9058-fe22e3d2d68f@linaro.org>
Date: Fri, 24 Oct 2025 16:48:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
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
 <50a49d72-2b1e-471d-b0c4-d5a0b38b2a21@linaro.org>
 <05d6ea2a-c1ae-422d-b178-5d2a306f3669@linaro.org>
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
In-Reply-To: <05d6ea2a-c1ae-422d-b178-5d2a306f3669@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/24/25 16:34, Krzysztof Kozlowski wrote:
> On 24/10/2025 14:43, Neil Armstrong wrote:
>> Hi,
>>
>> On 9/8/25 11:49, Krzysztof Kozlowski wrote:
>>> Hardware Programming Guide for DSI PHY says that PLL_SHUTDOWNB and
>>> DIGTOP_PWRDN_B have to be asserted for any PLL register access.
>>> Whenever dsi_pll_7nm_vco_recalc_rate() or dsi_pll_7nm_vco_set_rate()
>>> were called on unprepared PLL, driver read values of zero leading to all
>>> sort of further troubles, like failing to set pixel and byte clock
>>> rates.
>>>
>>> Asserting the PLL shutdown bit is done by dsi_pll_enable_pll_bias() (and
>>> corresponding dsi_pll_disable_pll_bias()) which are called through the
>>> code, including from PLL .prepare() and .unprepare() callbacks.
>>>
>>> The .set_rate() and .recalc_rate() can be called almost anytime from
>>> external users including times when PLL is or is not prepared, thus
>>> driver should not interfere with the prepare status.
>>>
>>> Implement simple reference counting for the PLL bias, so
>>> set_rate/recalc_rate will not change the status of prepared PLL.
>>>
>>> Issue of reading 0 in .recalc_rate() did not show up on existing
>>> devices, but only after re-ordering the code for SM8750.
>>
>> It happens this breaks the bonded DSI use-case, mainly because both PHYs
>> uses the same PLL, and trying to enable the DSI0 PHY PLL from the DSI1
>> PHY fails because the DSI0 PHY enable_count == 0.
> 
> 
> If it is ==0, the check you removed would not be hit and enable would
> work. I don't quite get the analysis.
> 
>>
>> Reverting part the the patch makes the bonded work again:
>> ===================><===============================
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index 32f06edd21a9..24811c52d34c 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -426,11 +426,8 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>>    	u32 data;
>>
>>    	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>> -	if (pll->pll_enable_cnt++) {
>> -		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>> -		WARN_ON(pll->pll_enable_cnt == INT_MAX);
>> -		return;
>> -	}
>> +	pll->pll_enable_cnt++;
>> +	WARN_ON(pll->pll_enable_cnt == INT_MAX);
>>
>>    	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>    	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>> @@ -965,10 +962,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>>    	u32 const delay_us = 5;
>>    	u32 const timeout_us = 1000;
>>    	struct msm_dsi_dphy_timing *timing = &phy->timing;
>> -	struct dsi_pll_7nm *pll = phy->pll_data;
>>    	void __iomem *base = phy->base;
>>    	bool less_than_1500_mhz;
>> -	unsigned long flags;
>>    	u32 vreg_ctrl_0, vreg_ctrl_1, lane_ctrl0;
>>    	u32 glbl_pemph_ctrl_0;
>>    	u32 glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
>> @@ -1090,13 +1085,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>>    		glbl_rescode_bot_ctrl = 0x3c;
>>    	}
>>
>> -	spin_lock_irqsave(&pll->pll_enable_lock, flags);
> 
> This should not be removed.
> 
>> -	pll->pll_enable_cnt = 1;
> 
> So you basically remoevd pll_enable_cnt everywhere and reverted entirely
> my commit. How is this patch different than revert?

No I did not, I kept the dsi_pll_disable_pll_bias() refcounting and call from
all the clock ops, which is basically needed here to never access PLL without
PLL_SHUTDOWNB and DIGTOP_PWRDN_B being asserted.

I only removed the pll_enable_cnt from dsi_7nm_phy_enable/disable because the
PHY code is designed to allow setting the PLL rate while the PHY is disabled.
And the bonded DSI hits this use case by setting the DSI0 PHY PLL rate while
configuring the PLL1 PHY.

So I wonder why it was added in the beginning because since you call dsi_pll_disable_pll_bias()
in each clk op, the Hardware Programming Guide for DSI PHY is satisfied ?

The commit message doesn't say anything related to dsi_7nm_phy_enable/disable.

Neil

> 
> Best regards,
> Krzysztof


