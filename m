Return-Path: <linux-arm-msm+bounces-61732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 154D3ADEE8B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 15:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FD731BC22BF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 13:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C4D82EA746;
	Wed, 18 Jun 2025 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V6KBpNr8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954D22EAB6E
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750254873; cv=none; b=OwLJzPTM+N+2xNJhboMsN9u2aXL5DYltirSqOH6oZp7b5giwHhCKLWrETkiAcTCFsdL7IwOpG6AVWln87EcS26NY9AQXD8qKbY+0sVWyCr3D/degMW5DK80OM5K4bagpKww80PnsVqxd32+5hZcqPKtqqTZmmfaFu+sMZuUciis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750254873; c=relaxed/simple;
	bh=0UFoENu50ZTkfQPdsEVQhcY5hAw7OHivCnTN+o3lPpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYVR5thlLu4+TT8R2BeoPUQ3BK6wQq6YTIPAB5q4kN2kkN3KnQkCZVF7hwq0yW79PcmIFFq8YXQkefyWPA4VMcWJb/wrahrSaAHjwLdC7fF0dDJOP7wIKoq5I6K4sWE/iKtsDrh8CnQgdFqjKttnoOgzFwK3hyaoGURWjNg2H44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V6KBpNr8; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso697647f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 06:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750254870; x=1750859670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AWjIwRrGgNhijgz5jxbu7f3s/HYrSgK/4vHwebpDl+0=;
        b=V6KBpNr8SWxhKdwCywlp5DEfmArCBj84t6trhlCE/nyTXdHrAZk5m8ZsaXI6DsnX+P
         4DSoXv59zWrmF/hsMy9Pb8sq06LmtIojJHfyPWi59Tx5jsEpZjR35eMUjUl0WYSgrJW6
         MrYYiV3ot7ueA17gLVLTl08dCDakz1VTbhDpYmQ0EztHji4XP54a8PtUOJkFlX8OvjKC
         jLGqo3dphsw9k7/NDKRtIrz2eC0mtLYFSaRDUV00dNxz+INIMWQtlJVsrHj5VzBtInu7
         341S7dCmEHchlhH5NcaVZll81G9qQb6TU3fPtN5wtblbbx8DtgRh0a0CYWn2iU1+em4I
         p0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750254870; x=1750859670;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AWjIwRrGgNhijgz5jxbu7f3s/HYrSgK/4vHwebpDl+0=;
        b=BvjFrMvzJ6hZt1hSgdAZG25XX4g7yBEEy8BuMohKGTvXg6s5aOrh0IaKRNSWk2tX3Y
         NspI4fkwETgR8bIYs4MT6G1znJJw7mW/S+J8i6FNnHKareMRmV1T12zcLnNDQy+gSezj
         4GZSowqBuxnkpPXck8341pQ48KwQDkiqoxGhpm18MBwjTB02kcoKUGLEZGyoyfyaVmYj
         44vniaNSxwODDiG0TIcVbhiEMV6kTVB07RosQUannmolEUKs0raUzX2gDHSbYhC/CbNu
         +R3nnhapz6xbfoOcVFe6dt1a4dP1L0KKJGQm9dFNaI6cYP5phkJs8G+VBt9uEYlPu1ou
         Miqg==
X-Forwarded-Encrypted: i=1; AJvYcCXcL5NnpdXdeneAwjFF7nJqH7gzYAN2aJvbufOn5O9LHsjU1kfoLB2f9CPXHKPY20dvX4k5xlmBBnu11cDt@vger.kernel.org
X-Gm-Message-State: AOJu0YzaxvsZ6aKBRylcx202N5iQQrz+xES8MndSibr6QmCzYuG1sD2j
	+szqgfeoZLWkz+CmeVC8COqdt5i4+yyBahGFwccPvMjfqADm+3T49im+DjyTRnq+mpI=
X-Gm-Gg: ASbGncsNITYDyomgoU///1HymABIjuvrDhKlbwxGXOGdlc+BiJwcl9V+5Vk8MWgYl/x
	KltuRTpjIufr0Zki0dVCCKfT0n1O4F6V1qEbxsf64KyxkF7NRKf/Q14PxKQQ3xKVuZuTJu4hMIF
	cBVZjqmEs0cIWQGC3QBVdZDNXfJow5gRmcGM5xpU/r6c5UMo45j9TdnJTagQsigpegZ31u2sASE
	pZLfSyB8fXjagW5IsMEQ5VyLr04B0+Qk3H52cCzTfEY1sVsLzxCHbU9ZGJvJey4ueXlUNb1pI6O
	37wPEYSEVVQNLoOrPRUms2WswefysLBBPVI03CNxGGzH8Er6dfE2ijZ1hTt5F9VAfX7TuKQVzdI
	c7r5yes4=
X-Google-Smtp-Source: AGHT+IFIDwtsgZPAfFivmPBda4I5bWtgd3I8v5X2E5jG1PRTDFnTfpxzy7dAaPeCl1P4AggaKF1pUA==
X-Received: by 2002:a05:6000:1a8e:b0:3a3:5c97:70c with SMTP id ffacd0b85a97d-3a572e8c559mr5703696f8f.14.1750254869706;
        Wed, 18 Jun 2025 06:54:29 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a58a03f059sm4450137f8f.44.2025.06.18.06.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 06:54:29 -0700 (PDT)
Message-ID: <07af3f49-6992-4897-acec-b2d46158fa00@linaro.org>
Date: Wed, 18 Jun 2025 15:54:26 +0200
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
 <f2654844-091f-46bf-88c6-6f6d4edc5533@linaro.org>
 <fa8d4af9-e822-4dec-a8dc-f3bbf5dd0100@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <fa8d4af9-e822-4dec-a8dc-f3bbf5dd0100@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2025 15:39, Dmitry Baryshkov wrote:
> On 18/06/2025 16:34, Krzysztof Kozlowski wrote:
>> On 18/06/2025 15:07, Dmitry Baryshkov wrote:
>>> On Wed, Jun 18, 2025 at 10:28:10AM +0200, Krzysztof Kozlowski wrote:
>>>> On 13/06/2025 16:04, Dmitry Baryshkov wrote:
>>>>> On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
>>>>>> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>>>>>>    
>>>>>>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>>>>>>    
>>>>>>>>    static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>>>>>>    {
>>>>>>>> +	unsigned long flags;
>>>>>>>>    	u32 data;
>>>>>>>>    
>>>>>>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>>>>>>> +	--pll->pll_enable_cnt;
>>>>>>>> +	if (pll->pll_enable_cnt < 0) {
>>>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>>>>>>> +					  "bug: imbalance in disabling PLL bias\n");
>>>>>>>> +		return;
>>>>>>>> +	} else if (pll->pll_enable_cnt > 0) {
>>>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>>> +		return;
>>>>>>>> +	} /* else: == 0 */
>>>>>>>> +
>>>>>>>>    	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>>>>    	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>>>>>>    	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>>>>>>    	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>>>    	ndelay(250);
>>>>>>>
>>>>>>> What is this ndelay protecting? Is is to let the hardware to wind down
>>>>>>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>>>>>>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>>>>>>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>>>>>>> without any delay between them.
>>>>>>>
>>>>>>
>>>>>> Great question, but why do you ask me? The code was there already and
>>>>>> MSM DRM drivers are not something I know and could provide context about.
>>>>>
>>>>> Because it's you who are changing the code as you've faced the issue
>>>>> with recalc_rate.
>>>>>
>>>> Heh, the answer is then: I don't know. I think authors of the code could
>>>> know.
>>>
>>> The 10nm HPG documents a 250ns interval between enabling PLL bias and
>>> and enabling the PLL via the CMN_PLL_CNTRL register. There is no extra
>>> delay between disabling the PLL, disabling FIFO and remobing PLL bias.
>>> Please adjust the code for 7nm and 10nm PHYs accordingly.
>>>
>>>
>>
>> I can drop this 250 ns here, if that's what you ask me. But fixing
>> anything in 10nm is not relevant to this patchset. You were already
>> asking me for different fixes for some different things and I find it
>> not acceptable anymore. Stop blocking this patchset with every little
>> existing issue.
> 
> I think that it is a common practice to ask to fix the issue in relevant 

No, it is not.

It is common practice to fix things everywhere, but you rejecting the
patches on that basis (coming again with some requests for unrelated
issues) is not common and not correct.

> pieces. For example, we frequently ask to fix all the DT files if there 
> was an issue / workaround reported against a selected set of those.

And you reject the submitted fix of one DT file based because
contributor did not fix the rest? Really? Since when do you employ such
practice?

> 
> In this case you can send a fix for 10nm separately, but please post a 
> fix for that platform too.
> 
>>
>> Or merge this code without this patch if a fix for reading PLL as zero
>> anyhow is questionable for you.
> 
> I think I've asked it at some point, to split the generic code parts and 
> the DSI enablement into two different patch series, so that they could 
> be picked up separately.
> 
> No, the fix is not questionable. The patch causes questions though.

I have no interests in fixing DRM code. This is not my subsystem, this
is not part I am responsible for. If it raises questions, why not
devoting your time to fix it?

Best regards,
Krzysztof

