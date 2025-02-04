Return-Path: <linux-arm-msm+bounces-46877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D86A27657
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 16:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5684B1884AE4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 15:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5DF22147E3;
	Tue,  4 Feb 2025 15:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S6ZpCAnE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24A92144DD
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683971; cv=none; b=KkwgTmmyjSxPwqJnMkXwwz1qAx2BacuS/gdnn2ad6A7lUcRwREhG1gllDp4PCapGrdhEgLcfH5/kI8r1IGSLiNxwjzJGDiKzjGoDmhz7GI/QQGv1mTunnEjkslIZRiU0k72poFBNm6twl4AAOgAB1xk/J8c+1OGPm2rNeSpyfHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683971; c=relaxed/simple;
	bh=iqM7MMpJNyOaVie7Y5SBgOqBm+Q8ljR8LiH3qct7tys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8Q6jgC8N/sbpIxsbDzA0Pk1WV7486tqT9NLwIjMdPlSHt/fXwdROV+/LvaEf77wGsXMbJdENr7F4/lWxucieAYith+A9wT6B7TTZQLAokXWSEzv0UI67rBuO5hMYxfjl9gsb2RUiuuXHAds/o/U1GiXR0xFgNqinZcMQFRwK9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S6ZpCAnE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38db1bb16f2so18840f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 07:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738683968; x=1739288768; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8VDsh+thrrBkA4ryOkMm1ux54Rb9IUk/Q1coP2a2u8M=;
        b=S6ZpCAnEw6HiZkBZns4fS9tvYgdqH9Jl5aga69xKr3rk5sRhQpekX2SIxZSNTF3glP
         4vy9lnJSDWHiP+Kv7Sybmm0FB3/6Up+yVln5CK9h08qN9AnC78tXZNmVH9SRflldccKc
         GAKoQIimt+OnAzeYB9G3IgF2BA1lg6e+Ner7T40k/HXQaakM2epV1nbgB0KPw1Eirprv
         J+3MZwvmzk/MkgnspYudxYbdHVYxQKE178TzT+shxC/0PWBG5OVPiFPvjrlLd0CPYj7+
         y2g6shi/y3+2sS04lgYJt++XQX3GEYc0MmvW2ZLz4C+LXNOfY/+IkUcwcOtMIQq36JzW
         scWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738683968; x=1739288768;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VDsh+thrrBkA4ryOkMm1ux54Rb9IUk/Q1coP2a2u8M=;
        b=s8/u600aHJyOhwh8r7yAyWIaDeOptjDO6WV4d/DZCv4Er43gBE9f6KLhgXWSpEToxU
         pFcq5kpvMo5QNdz0Y2byFlbxqlXhNbtT71IzsKDeJo6wE9HEwUaBtsBd7IvMl1sw4PC8
         FpwZiGLmNcv6LhsbIP792IsYAJETML+FgXt+hPdd7+KwaxGg/u4X4pRXvqSdO5mXi6Rw
         uVdoMYz+aOTCxjvQHasGhV2ZZwLRQnyYPpbjMne36hhfQ7czZBffWWemw8apnMMs8Mxd
         IKgN3Q3LtriVPGKe8sqlu6+8w/U1O2ehn4aKl2KFaJUstTkLoCOOgpOqyXrK87Euy6j3
         iQVw==
X-Forwarded-Encrypted: i=1; AJvYcCWlOOcQsZ2qtCa5BaVMRc47Xmt+t+8etPHSAqHZ7FUYDUogvBIMbPOewDmhwP7Pf3bHXFPsID/U31MSog6d@vger.kernel.org
X-Gm-Message-State: AOJu0YzrYDl4O1/cBGif7LP58Xm6tq9adYiJ0MnqQmCUzKYbOvR/qqnb
	sdBuQMgNNtmrWeSMLehjx7r/mEMuHowIg+mobv1D+r0tTNGxjrnxReyaAJ2Dz9bKadp+phcCEYN
	P
X-Gm-Gg: ASbGncsJossq4ZZcF5pS7YFg8VLvl+HtN+gDOqJg1FyxsPpQS7sgSU+a15mf+eCd+9J
	zfPEsl+PZBAzXiviwPjBiJnKhBR1qZ8URrbnrTw+6Q8aIUkjc8SZDcUOo14KPPYP1zvQ59kyRAZ
	989r05VsmYTnjvAobeoWRVRJIUjfHX/gsLG0wDBLDKNIFK4sbphfrdgfcvJsBmJ4UgiXruM8Slh
	FGMVyd8DLpG00SxDdcm7PKJ9uOBsHZ1+42u7dZvRMDZD6UKoeMf7fZRfLiuCGKG+LxYJuKT5gax
	iPfPRPdoaI11YsPBLrqzilkCV3qsWupGidc=
X-Google-Smtp-Source: AGHT+IF/8Y4CiuuRVb7XUvn4YXoFmIVvEj0+wakfJm9mjoxXU19MUcLzDqSusKkvwT8fX8F3IUisuw==
X-Received: by 2002:a05:6000:2c8:b0:385:e10a:4d9f with SMTP id ffacd0b85a97d-38da4d75ce6mr1142148f8f.0.1738683967786;
        Tue, 04 Feb 2025 07:46:07 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec02bsm16388163f8f.13.2025.02.04.07.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 07:46:06 -0800 (PST)
Message-ID: <2e96ae62-3114-4c7b-bea7-27f6e2009634@linaro.org>
Date: Tue, 4 Feb 2025 16:46:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-2-862b136c5d22@linaro.org>
 <u4qho7u2nu2x6qxkfxpeakotmbdgoha3e5csmsamaanlxziiif@22kzxupzibj7>
 <12275e11-eadc-48be-b8c3-9463cdf92698@linaro.org>
 <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <vfqfbpxc3zrerrb2hyis6h4kgk7aqfljwb7sxlduwlkqprmodg@rjjfsgwr5c6j>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/02/2025 15:26, Dmitry Baryshkov wrote:
> On Tue, Feb 04, 2025 at 10:21:25AM +0100, Krzysztof Kozlowski wrote:
>> On 03/02/2025 18:41, Dmitry Baryshkov wrote:
>>> On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
>>>> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
>>>> clock from Common Clock Framework:
>>>> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
>>>> concurrent and conflicting updates between PHY driver and clock
>>>> framework, e.g. changing the mux and enabling PLL clocks.
>>>>
>>>> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
>>>> synchronized.
>>>>
>>>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
>>>> ---
>>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
>>>>  1 file changed, 22 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>>> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>>> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
>>>>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
>>>>  	spinlock_t postdiv_lock;
>>>>  
>>>> +	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
>>>> +	spinlock_t pclk_mux_lock;
>>>> +
>>>>  	struct pll_7nm_cached_state cached_state;
>>>>  
>>>>  	struct dsi_pll_7nm *slave;
>>>> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
>>>>  	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
>>>>  }
>>>>  
>>>> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>>>> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
>>>> +					u32 val)
>>>>  {
>>>> +	unsigned long flags;
>>>>  	u32 data;
>>>>  
>>>> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
>>>>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>>> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>>> +	data &= ~mask;
>>>> +	data |= val & mask;
>>>> +
>>>> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>>> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
>>>> +}
>>>> +
>>>> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>>>> +{
>>>> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
>>>>  }
>>>>  
>>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>>>>  {
>>>> -	u32 data;
>>>> +	u32 cfg_1 = BIT(5) | BIT(4);
>>>
>>> Please define these two bits too.
>>
>> Why? They were not defined before. This only moving existing code.
> 
> Previously it was just a bit magic. Currently you are adding them as

No, previous code:

writel(data | BIT(5) | BIT(4), pll->phy->base +
REG_DSI_7nm_PHY_CMN_CLK_CFG1);

This is a mask and update in the same time, because:
	(data & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
is just redudant.

I did not do any logical change, I did not add any mask or field.
Everything was already there.


> masks. I want to know if BIT(4) and BIT(5) are parts of the same
> bitfield (2 bits wide) or if they define two different bits.

While in general you are right, it does not matter for this fix. If this
are separate bitfields - fix is correct. If this is one bitfield - fix
is still correct. You could claim that if this was one bitfield, using
2xBIT() is not logical, but this was there already, so again my fix is
only fixing and keeping entire logic or inconsistencies intact.

Best regards,
Krzysztof

