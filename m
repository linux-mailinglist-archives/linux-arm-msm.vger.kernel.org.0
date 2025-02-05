Return-Path: <linux-arm-msm+bounces-46928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3931FA286A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 10:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3788516202A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 09:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B5622A7FC;
	Wed,  5 Feb 2025 09:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dtH1/6Bv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45F122A7E4
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 09:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738748092; cv=none; b=JOSNEgZcWSMlu/1wyKUie+Qy992Yp8c3S0rkOSa9L2/FKLv6V70W9PokPhuZCdR6bcIBMSB76FKTUYogDRr+FILCc//NbQAInBzCPyr38JIHliAz5K9+TxGdaS+FmTP6nTp0IomD0jxPpct6mpp4e4dvoNPx+EU4OInufUktUp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738748092; c=relaxed/simple;
	bh=1zBtiT801pepCprORdyCM08nsls2kANWhaHk8TfTpQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+MPcmZsRBpL+QsbNPBTjQlNEAV+u6ucmxO5JVpRqJFAixOOtSYx88SBuGSM1ltx7eEuTuT764/BCPPlRBVODWIWhl/EKMFO+itLWgaAdVvBQxe7Jaz8vxiZ5uUzJitxEcqlUePr03d2Oiqc2ZGnEQsdiNHtn6bJvTOjAbhFUq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dtH1/6Bv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38db7d18842so24339f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Feb 2025 01:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738748089; x=1739352889; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XME8GwkXK8bhfCVEpnNIXbNPEdxuzw7y0bc5Pucl5KI=;
        b=dtH1/6Bv27W6NEFb5A3guctR2k5FZfPKj6RbQQot4x6bY+zF2O22Z5oBHUPBnNPSI5
         FO8sAqULTb/3PRZjvimx+tUg6pDbiB6OJ0vyIZyb/zhGS9azVrdzeMwHtSh69ngXyPIY
         hSEUSNrBuXod3Ipf2blgZq5AcfHAluq8LvJuPp+lCvOwDAAujjxhbQ7v/16KWcdEwWGL
         GBcITJnwybMJ3mVbdwOCHzcGJjnfvCREF7N606aQvQwQ8rQLgJXLpvj1fgTKn8bwTeAS
         5/y57V/bmnrB748PzRE8ggbO1/WkFsiIbuySUsf84N4JQCXyjfkdODQTToqW702aqwpb
         LNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738748089; x=1739352889;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XME8GwkXK8bhfCVEpnNIXbNPEdxuzw7y0bc5Pucl5KI=;
        b=lNy8+IxJLuniRhJUgoFzdJhrZGgeQzY9uAeU5FGod4EGuGZVfN2JvLNV7IGpxHl9k2
         WFi7C1OG2mdKlP9QpkNaYw/wH8b19OAprKkf17cTQvQ5agfaOdGCZTMKeDjhFkYZArCv
         Mt1voJFF3TfR1wNaCi2HMy7XKf8TO0GiKVKtjPiOl6SPOcu3JTiKH2mzmJ1ANYU2zLhX
         7xQ/2zAYwJw8eJBrvvddX0QcYS6ako0YsB9zajIT6WNKTRWHXqRodlCaHOMuaBO0UHL/
         MEhkunkjS49PjxSDUoudJ7+YGsPBy37F3feyZzlEafFJ10he8KnMD9Z+CrFX5N+AXWJC
         gTAg==
X-Forwarded-Encrypted: i=1; AJvYcCX1znubXHGjAWLOClsSNs42WKfbH0088W6xP5pOkfQ1Ybnj+eoHI7xwSqX2fE3KqcN38hMs30Vhi/kdQzpo@vger.kernel.org
X-Gm-Message-State: AOJu0YxS68WXQrX4l9NR/HCpeGj2Rz9fc9Q5nTNMPMmly6vixyeKfgfO
	xktEwu5yDiN5DTkHognzuI7LTVXH0MSwPK+FaJOyMS7zEfNboC9aDgoTWEljF6o=
X-Gm-Gg: ASbGncvr2VzJsdg2aRju0w3pO+VEthWIssCA2GACFW3cxfiBuMDVRu5k2cN3UEDBGqQ
	5+skmeQarB1bne+wW/BD8GX+7m2G7JFnYbRuV0eZRuHu92Kk3qVZcWl3pzuLM2xgMKMPOMHMw14
	HPHJl3MrdXwihkSJKS8OvDfENloyM1gagFBsgPlJR0c8hnBft7SL7jr5wiTdSb1vmBFIKMb6SWv
	HCNRIDrCreMQov+MUOVPCIkjcXPSRKcwkaVBRITujS45DnYHnvtmjOlZFXpG7L9ZeMPiqbCQyb/
	ZR9wh3ERuqPORyCeBWAz0xgSVBUwIJ1n3oU=
X-Google-Smtp-Source: AGHT+IFId32xeOrxh0GKul0CUktRUdVt/4VLShRZOZ9U1CUAWE1uPKI5kfaxj9Vm/C7CanMsHqRQXA==
X-Received: by 2002:a05:600c:1f96:b0:434:9cb7:7321 with SMTP id 5b1f17b1804b1-4390d430247mr5878735e9.1.1738748089060;
        Wed, 05 Feb 2025 01:34:49 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d802sm15966595e9.12.2025.02.05.01.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Feb 2025 01:34:48 -0800 (PST)
Message-ID: <6cba59b9-4852-4cad-95eb-dfecb2e44dc4@linaro.org>
Date: Wed, 5 Feb 2025 10:34:46 +0100
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
 <2e96ae62-3114-4c7b-bea7-27f6e2009634@linaro.org>
 <t4zn2gv3mbn3nqlh5h3l3ej5zxs4wa74ncgymonci7v45w47ai@qmmtxbelichw>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <t4zn2gv3mbn3nqlh5h3l3ej5zxs4wa74ncgymonci7v45w47ai@qmmtxbelichw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2025 03:51, Dmitry Baryshkov wrote:
> On Tue, Feb 04, 2025 at 04:46:04PM +0100, Krzysztof Kozlowski wrote:
>> On 04/02/2025 15:26, Dmitry Baryshkov wrote:
>>> On Tue, Feb 04, 2025 at 10:21:25AM +0100, Krzysztof Kozlowski wrote:
>>>> On 03/02/2025 18:41, Dmitry Baryshkov wrote:
>>>>> On Mon, Feb 03, 2025 at 06:29:19PM +0100, Krzysztof Kozlowski wrote:
>>>>>> PHY_CMN_CLK_CFG1 register is updated by the PHY driver and by a mux
>>>>>> clock from Common Clock Framework:
>>>>>> devm_clk_hw_register_mux_parent_hws().  There could be a path leading to
>>>>>> concurrent and conflicting updates between PHY driver and clock
>>>>>> framework, e.g. changing the mux and enabling PLL clocks.
>>>>>>
>>>>>> Add dedicated spinlock to be sure all PHY_CMN_CLK_CFG1 updates are
>>>>>> synchronized.
>>>>>>
>>>>>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
>>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>
>>>>>> ---
>>>>>>
>>>>>> Changes in v2:
>>>>>> 1. Store BIT(4) and BIT(5) in local var in dsi_pll_enable_global_clk()
>>>>>> ---
>>>>>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 35 +++++++++++++++++++------------
>>>>>>  1 file changed, 22 insertions(+), 13 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>>>>> index c164f845653816291ad96c863257f75462ef58e7..e26f53f7cde8f0f6419a633f5d39784dc2e5bb98 100644
>>>>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>>>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>>>>> @@ -83,6 +83,9 @@ struct dsi_pll_7nm {
>>>>>>  	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG0 register */
>>>>>>  	spinlock_t postdiv_lock;
>>>>>>  
>>>>>> +	/* protects REG_DSI_7nm_PHY_CMN_CLK_CFG1 register */
>>>>>> +	spinlock_t pclk_mux_lock;
>>>>>> +
>>>>>>  	struct pll_7nm_cached_state cached_state;
>>>>>>  
>>>>>>  	struct dsi_pll_7nm *slave;
>>>>>> @@ -381,22 +384,32 @@ static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
>>>>>>  	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
>>>>>>  }
>>>>>>  
>>>>>> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>>>>>> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
>>>>>> +					u32 val)
>>>>>>  {
>>>>>> +	unsigned long flags;
>>>>>>  	u32 data;
>>>>>>  
>>>>>> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
>>>>>>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>>>>> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>>>>> +	data &= ~mask;
>>>>>> +	data |= val & mask;
>>>>>> +
>>>>>> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>>>>> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
>>>>>> +}
>>>>>> +
>>>>>> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>>>>>> +{
>>>>>> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
>>>>>>  }
>>>>>>  
>>>>>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>>>>>>  {
>>>>>> -	u32 data;
>>>>>> +	u32 cfg_1 = BIT(5) | BIT(4);
>>>>>
>>>>> Please define these two bits too.
>>>>
>>>> Why? They were not defined before. This only moving existing code.
>>>
>>> Previously it was just a bit magic. Currently you are adding them as
>>
>> No, previous code:
>>
>> writel(data | BIT(5) | BIT(4), pll->phy->base +
>> REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>
>> This is a mask and update in the same time, because:
>> 	(data & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)
>> is just redudant.
>>
>> I did not do any logical change, I did not add any mask or field.
>> Everything was already there.
> 
> Yes... and no. Previously it was just writel(foo | BIT(5) | BIT(4)). Now

You did not address my comment. Previous code was:

(foo & (BIT(5) | BIT(4)) | BIT(5) | BIT(4)

Just for shorter syntax it was written different way:

foo | BIT(5) | BIT(4)

> your code adds BIT(5) as a 'mask' parameter. Is it a correct mask for

No, my code does not add it. It was already there, look:

foo | BIT(5) | BIT(4)
      ^^^^^^^ here


> that field? That's why I'm asking you to define those - you have changed

No, I did not change bitwrites. The code is 100% equivalent, both
logically and assembly.

You mistake maybe with some other part doing "writel(data & ~BIT(5)" in
dsi_pll_disable_global_clk() but that's just poor diff.

> bitwrites to the masked bit writes. Masks should be defined.
> 
>>
>>
>>> masks. I want to know if BIT(4) and BIT(5) are parts of the same
>>> bitfield (2 bits wide) or if they define two different bits.
>>
>> While in general you are right, it does not matter for this fix. If this
>> are separate bitfields - fix is correct. If this is one bitfield - fix
>> is still correct. You could claim that if this was one bitfield, using
>> 2xBIT() is not logical, but this was there already, so again my fix is
>> only fixing and keeping entire logic or inconsistencies intact.
> 


Best regards,
Krzysztof

