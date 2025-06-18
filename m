Return-Path: <linux-arm-msm+bounces-61729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A3ADEDE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 15:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15CA51898219
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 13:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72B72E9730;
	Wed, 18 Jun 2025 13:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q7Sqybzz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EB814EC5B
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750253667; cv=none; b=ZMWMzBr5BHPAKfOPonRb3PdDLy3g9iL4miijKZgcZ99cUcC9uPCGf+P2uEnsCmoc10r4deLady8DaKNxexZoeN2xgon9AAOE13JZsrTf9HSkH2HLYOlMjlHO+EHjP8ZOCL0IU1wptZLjRTR2DK8X+Od+7d8BU95q0x8jsU0jrP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750253667; c=relaxed/simple;
	bh=xag2MrL6xxr64Wri2TH89LpJkyUAY5P+eGl/CyChhzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OedLtjEUKSeln6prjQqFESmoOtNwe2x6mVtwfVzpSiN9DIGzc83DF6B3wJtNimobOzgCIFHgwuctXLvmrhvqgRqdcgrP1D21UZDsSbGsHRsdiqdygGFTy5YIBUXy7WX/t1SMDhE9nKeYoZpsGddsrqhVSO9twevM4ghpWErAv40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q7Sqybzz; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad56886dd60so85464266b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 06:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750253664; x=1750858464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6frIG43o5dRLHq9FGiAb0h3bHapLxU4GqrCx6avI2UY=;
        b=Q7Sqybzz1Rd9VLJTD2mnwgw+zrrDtkYMpQSp4XaZ13QUDYvk8CeARKRHRWfFTjdOJY
         VDqhfcIEq2V/XbwFpZKv4r4AEjXDKaoT4jmVMzDdc5b+3Njjy+ElUd8IiNkysU7GCAdT
         Sz6xGAY4c7ySlyr4VoIOuWi3h/K0PqbVYmVi0XsbMikpcbTZ9KcR3lmvyCZ/WIR7bSL+
         /4sJ1EdNQOh+lDmLqCBTC9yVX9IP/ytfTc17MlGY3t7C7Ljv2TM9B0o8TKjQnArbTH8/
         gUP/1Yqix1Py4A6S/b5+8EBqBw8l+CWAwEKRgOtCPBChkV/dsGEaPNQOI9JjTl1n1EhF
         4Wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750253664; x=1750858464;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6frIG43o5dRLHq9FGiAb0h3bHapLxU4GqrCx6avI2UY=;
        b=DXP61D2zVngcE8XP5o47U9ikxVSO0SLCGZpBmqpoybX/7jpl2wiIBtDuok4EMv5Lp3
         SnnNkVdlpjoJrRSQ3NswG9Pl4CO0TelC9Vzy/VNRBysM6XLBGdUAeHOl7EUisg45E8EE
         mIzxcmXVk1sfIuE0IzPoY6slql4k9ok5X48YXve1MRDnwcBm6QTo8tIhNr6b89gtJ3gR
         t65Veofcxv+6aD7gtZLeNo68JozY/wOXRYLcgpyGUVQDg4xd+qnqERjESlZw9df7xWFX
         cTn1kY8PRQy0gMjUsKpdf/YF4vegXIp4lGS+965CweAYQcdTD/2Eh3/cEB8dUpCNoKhq
         AACQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbCoiuHARsepKTAJY3L4pEPofk/1B/Vz3TN2ZUOvVKrkHsLbTdW3+PHScQj41srmhacM4wQWVwxr6nztKW@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0PsLUqfb0pev4IqJ09p/rplQ+9sej2wkkftYY1YAHtgzPWcsh
	Y6PCCUiwwx444PbthzP4unKE1VmjmacjKj/gjqVTPLJIkmXW7jwlHpgpZsvSugFHn9g=
X-Gm-Gg: ASbGncutF9BJfZTvjnk1AtXzuf2ucPHc/v8HG4WFzThMLWe0m37r+vj5otD0ZRyKfES
	+BRTqSSmjxRAG+aqy4j3Q23u6fyCMk2tNezZzX4Oor1kMiJXFOaGIxtN4QAOuv+ctL9ZhHkJrqK
	uopNVUVHIeth2qyLSxJzmqL27Ggih4F88wV6vRI6bRWe3crrrUHVidptdQ4cuk65a2JvIcgK/2W
	MdJlBSB07EzhIwLiOL4jPvoDf91hRbyLVhARn1XwsDatai+EPkv43bTVdBnT/jGwt+6bc60LLr0
	8JjCzBwpjciSREctDmxGf1h/0iVR10gRn8FGMZycJI6SsS4wF3JzaV0cReweFprtYbwt1irouzE
	KLDoScw0=
X-Google-Smtp-Source: AGHT+IFNJYcKBCCcjLnQk5biUOnlV/IWbHkYqEGCDAwJBNW1gZHzUE96e+XCpjPnovUVzQQNHmSQyQ==
X-Received: by 2002:a17:907:70b:b0:ad8:8189:2563 with SMTP id a640c23a62f3a-adfad550105mr571897566b.12.1750253663591;
        Wed, 18 Jun 2025 06:34:23 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0128886edsm207624966b.76.2025.06.18.06.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 06:34:22 -0700 (PDT)
Message-ID: <f2654844-091f-46bf-88c6-6f6d4edc5533@linaro.org>
Date: Wed, 18 Jun 2025 15:34:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
 <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
 <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
 <24xkss4bw6ww43x2gbjchcm4gtmqhdecncmxopnnhf7y2tblc2@iibgqhuix5rm>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <24xkss4bw6ww43x2gbjchcm4gtmqhdecncmxopnnhf7y2tblc2@iibgqhuix5rm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2025 15:07, Dmitry Baryshkov wrote:
> On Wed, Jun 18, 2025 at 10:28:10AM +0200, Krzysztof Kozlowski wrote:
>> On 13/06/2025 16:04, Dmitry Baryshkov wrote:
>>> On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
>>>> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>>>>   
>>>>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>>>>   
>>>>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>>>>   {
>>>>>> +	unsigned long flags;
>>>>>>   	u32 data;
>>>>>>   
>>>>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>>>>> +	--pll->pll_enable_cnt;
>>>>>> +	if (pll->pll_enable_cnt < 0) {
>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>>>>> +					  "bug: imbalance in disabling PLL bias\n");
>>>>>> +		return;
>>>>>> +	} else if (pll->pll_enable_cnt > 0) {
>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>> +		return;
>>>>>> +	} /* else: == 0 */
>>>>>> +
>>>>>>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>>   	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>>>>   	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>>>>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>   	ndelay(250);
>>>>>
>>>>> What is this ndelay protecting? Is is to let the hardware to wind down
>>>>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>>>>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>>>>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>>>>> without any delay between them.
>>>>>
>>>>
>>>> Great question, but why do you ask me? The code was there already and
>>>> MSM DRM drivers are not something I know and could provide context about.
>>>
>>> Because it's you who are changing the code as you've faced the issue 
>>> with recalc_rate.
>>>
>> Heh, the answer is then: I don't know. I think authors of the code could
>> know.
> 
> The 10nm HPG documents a 250ns interval between enabling PLL bias and
> and enabling the PLL via the CMN_PLL_CNTRL register. There is no extra
> delay between disabling the PLL, disabling FIFO and remobing PLL bias.
> Please adjust the code for 7nm and 10nm PHYs accordingly.
> 
> 

I can drop this 250 ns here, if that's what you ask me. But fixing
anything in 10nm is not relevant to this patchset. You were already
asking me for different fixes for some different things and I find it
not acceptable anymore. Stop blocking this patchset with every little
existing issue.

Or merge this code without this patch if a fix for reading PLL as zero
anyhow is questionable for you.

Best regards,
Krzysztof

