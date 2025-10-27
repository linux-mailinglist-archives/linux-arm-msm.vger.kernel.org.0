Return-Path: <linux-arm-msm+bounces-78867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B616C0CFAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 11:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6267E4E0704
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 10:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28E02F4A14;
	Mon, 27 Oct 2025 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xCLu2o22"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3E58462
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 10:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761561349; cv=none; b=Qlleut/0AlilIyJS5FQUml9/aGf8fmA9pL5ZXt4yPwz+9c6h0ZNAJxQqgiFpulPKxUUn1u6OJeZaE6A86unCVYwR2ETe8/3VbUX/zB2F3oFCTZG5bDVJQ5mYJz/yTCfKZ86om2ELzu1V2njpIQlF9zj8jaYkBMCfVL3LR+GxLeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761561349; c=relaxed/simple;
	bh=V0xT/F6pKcz8ylzVL894eSbp5yjD9vZ0v47uUsLy0cU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=GkpnA6ijhwlqwFAuyl9OJKFCqRNTb2tlCzHw/9GuSFd3yc3Dpuim4GWpyrDAh7K6oSxc+TxV3cieJibwGDaDKxbFke2+4WL6aMlIQ8CROwIphSzFCzwHJhVrMqWt4EWwmy030souKVI977a1meePl0Xhi3g2Y7e+HMm53QkKb9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xCLu2o22; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4770e0b0b7dso431285e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761561345; x=1762166145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1eC2sjSfHiIWN4j8w+yh7atvloipy18ZE5R0r29G0js=;
        b=xCLu2o224zktFlNgPogYuGEV07pkR3T3D7Y/DZRsEQZAM6fVqAM0JAelsPN2FBIpaR
         EMtZXkVf92ebM4U5a6LUM1esRAbW0Mi0Rpa0eFh1gVOy/3kbNmMduL8DCUl3KWXv4xFQ
         o6BM9gZfNB3XNkLg9WO7Txjj8TNaO4qtpvbYdX5+hnXJWsak37A/+uvTl+x0X19wy+WJ
         q+IBBT+/KVj5Q0OReXRsGl4ykbAKShv4rtX1fOU0mK9PIybwuC0si+vzKGKgBfHoOKfm
         3FWDNeT9nA3h6UkyKeW/YXJ0Az8v1XQbLirl7q9o0w1z4gM20TzG8H5a0MG7DoK+kAed
         LTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761561345; x=1762166145;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1eC2sjSfHiIWN4j8w+yh7atvloipy18ZE5R0r29G0js=;
        b=s0mHvxFtsfy0GlsQo0m8Gdw+6ZvpoCvRgXzANgbttykH+brQ8Bwq64zXIJzZCH5DLc
         /iYrNLAQC11VSAEPFKJw2VmSda53LSwz7/oNdDbdUPnTvE/UhgesUg9HWWL4+t5au0LB
         j4VJM+sKDrYnhR8GaqKSFiFXi0AjuihAZtSajFjIc+G8R6F49pWO6hiY+hQMZCxHEi4C
         iIkKLeGopy/aEqlOUXU+ZNut3i7aMgCDb1cdw1MXPVJgC6Lt+RgC1nqevi8dcnawWWEc
         T21gh4Tgtz9T84oU/KyjFGp4AN22Ufucc8SNQq97abBZJVZZMb2pX9w217nC3Q5Iovbd
         hybQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6ajHRCApkyQ8zqCQylU0EX3sxMhN6KFsLfrnzkJEASt/cfuIuMJJYci4XuxWF1i470VV1tIrTh7yJ4tMf@vger.kernel.org
X-Gm-Message-State: AOJu0YwyYoLIxm6t2UipLM0olF4vyHuckaLKinqXCEoQf2Z3lcu94XEf
	KMopSAdUlxPf76u3uBeW9yUv2B2Mu7G4+cvIF4/jHTBLbe5GBdjS4ZNCeiFAx8F5Wzk=
X-Gm-Gg: ASbGncv4nMMd4nd0NGiX6CYWfpR4L+VlFLZyO8do6ihdqgik+tffwGfIfvBR2eadBPx
	41xVaZw2K18n2xNwsTDnJj9oA5Oi+U7zSisbBSuf+pV5zGpMLaJB8QEAR3HNbrtE0JxQx2o/b7q
	EnnaGDMoLpXsV+lADYFhD59O3q9BIqf7C8jCLPRMHuQtbUKG6glhzEN1J78VmKPW1HQ52Hxyn6Y
	wnlRSmGYQ6cyaBAx3lkEMuTbmgcJqqfZEEl4xAfQDZPPnhujkEN80+MOQTgFS6bFZJ1CikHnjud
	WID+Y6tYkKdY8sJftX56BlRVNNwGieNlT2pRoNbi+50Qn+u6DX3mAyWFTrkr2p1IV5f1JMmy2Y7
	2yIngRtIbnm/RFzk7f9NSgwDKpW3qCYTcvAcaktYgw4EbGPHaf37wTXQNAw9mFCtzJ4rrDPEQ46
	47YsBAPBayGscUNR22KO9d
X-Google-Smtp-Source: AGHT+IHoKMtB0k7tD+QS9RPEtlM0Hd0nVYHf0+EztHHBmQYdUIcuy9l+kJwZ92M2NezWHb90uo3n5g==
X-Received: by 2002:a05:600c:4449:b0:475:dca0:d457 with SMTP id 5b1f17b1804b1-475dca0d543mr29474985e9.8.1761561344933;
        Mon, 27 Oct 2025 03:35:44 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd035e05sm128895305e9.7.2025.10.27.03.35.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 03:35:44 -0700 (PDT)
Message-ID: <f2c9d3f8-f63b-4645-9899-49f2abb1ff3f@linaro.org>
Date: Mon, 27 Oct 2025 11:35:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/msm/dsi/phy: Fix reading zero as PLL rates when
 unprepared
To: Neil Armstrong <neil.armstrong@linaro.org>,
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
 <7d8e9395-d2e4-413c-9058-fe22e3d2d68f@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <7d8e9395-d2e4-413c-9058-fe22e3d2d68f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/10/2025 16:48, Neil Armstrong wrote:
> On 10/24/25 16:34, Krzysztof Kozlowski wrote:
>> On 24/10/2025 14:43, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 9/8/25 11:49, Krzysztof Kozlowski wrote:
>>>> Hardware Programming Guide for DSI PHY says that PLL_SHUTDOWNB and
>>>> DIGTOP_PWRDN_B have to be asserted for any PLL register access.
>>>> Whenever dsi_pll_7nm_vco_recalc_rate() or dsi_pll_7nm_vco_set_rate()
>>>> were called on unprepared PLL, driver read values of zero leading to all
>>>> sort of further troubles, like failing to set pixel and byte clock
>>>> rates.
>>>>
>>>> Asserting the PLL shutdown bit is done by dsi_pll_enable_pll_bias() (and
>>>> corresponding dsi_pll_disable_pll_bias()) which are called through the
>>>> code, including from PLL .prepare() and .unprepare() callbacks.
>>>>
>>>> The .set_rate() and .recalc_rate() can be called almost anytime from
>>>> external users including times when PLL is or is not prepared, thus
>>>> driver should not interfere with the prepare status.
>>>>
>>>> Implement simple reference counting for the PLL bias, so
>>>> set_rate/recalc_rate will not change the status of prepared PLL.
>>>>
>>>> Issue of reading 0 in .recalc_rate() did not show up on existing
>>>> devices, but only after re-ordering the code for SM8750.
>>>
>>> It happens this breaks the bonded DSI use-case, mainly because both PHYs
>>> uses the same PLL, and trying to enable the DSI0 PHY PLL from the DSI1
>>> PHY fails because the DSI0 PHY enable_count == 0.
>>
>>
>> If it is ==0, the check you removed would not be hit and enable would
>> work. I don't quite get the analysis.
>>
>>>
>>> Reverting part the the patch makes the bonded work again:
>>> ===================><===============================
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> index 32f06edd21a9..24811c52d34c 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> @@ -426,11 +426,8 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>>>    	u32 data;
>>>
>>>    	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>> -	if (pll->pll_enable_cnt++) {
>>> -		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>> -		WARN_ON(pll->pll_enable_cnt == INT_MAX);
>>> -		return;
>>> -	}
>>> +	pll->pll_enable_cnt++;
>>> +	WARN_ON(pll->pll_enable_cnt == INT_MAX);
>>>
>>>    	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>    	data |= DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>> @@ -965,10 +962,8 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>>>    	u32 const delay_us = 5;
>>>    	u32 const timeout_us = 1000;
>>>    	struct msm_dsi_dphy_timing *timing = &phy->timing;
>>> -	struct dsi_pll_7nm *pll = phy->pll_data;
>>>    	void __iomem *base = phy->base;
>>>    	bool less_than_1500_mhz;
>>> -	unsigned long flags;
>>>    	u32 vreg_ctrl_0, vreg_ctrl_1, lane_ctrl0;
>>>    	u32 glbl_pemph_ctrl_0;
>>>    	u32 glbl_str_swi_cal_sel_ctrl, glbl_hstx_str_ctrl_0;
>>> @@ -1090,13 +1085,10 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
>>>    		glbl_rescode_bot_ctrl = 0x3c;
>>>    	}
>>>
>>> -	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>
>> This should not be removed.
>>
>>> -	pll->pll_enable_cnt = 1;
>>
>> So you basically remoevd pll_enable_cnt everywhere and reverted entirely
>> my commit. How is this patch different than revert?
> 
> No I did not, I kept the dsi_pll_disable_pll_bias() refcounting and call from

Indeed, I see now.

> all the clock ops, which is basically needed here to never access PLL without
> PLL_SHUTDOWNB and DIGTOP_PWRDN_B being asserted.
> 
> I only removed the pll_enable_cnt from dsi_7nm_phy_enable/disable because the
> PHY code is designed to allow setting the PLL rate while the PHY is disabled.
> And the bonded DSI hits this use case by setting the DSI0 PHY PLL rate while
> configuring the PLL1 PHY.

OK, I understand now.

> 
> So I wonder why it was added in the beginning because since you call dsi_pll_disable_pll_bias()
> in each clk op, the Hardware Programming Guide for DSI PHY is satisfied ?

Don't remember anymore.

> 
> The commit message doesn't say anything related to dsi_7nm_phy_enable/disable.
> 
With your patch it works fine and does not produce clock warnings, so
seems fine. If you send proper fix, then:


Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

