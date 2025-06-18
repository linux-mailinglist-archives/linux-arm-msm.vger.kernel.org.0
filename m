Return-Path: <linux-arm-msm+bounces-61730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B168CADEDF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 15:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AA3717E1F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 13:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 721782E9754;
	Wed, 18 Jun 2025 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gYBwUqxh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62B22E8DE1
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750253760; cv=none; b=lZ8AwcNT6FtgV8RsKOLRgqaYu3FSKCgRgh5dxK49DMXNpzxKPhMVcUa8irMGOle9dCP6+Js5n0ha080MiXk6Uw/t20zZiJ1qcvR2lkPCBn7F+RJadmpjNSX9IrAgYuFoLMR961Uih9UtVvgiQe1zzk2D3rlA70Jf52EASTIosgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750253760; c=relaxed/simple;
	bh=oPJM7QhMmBy1bs1KbbyHUDef3Omzubhxo/q1a2c1SiA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Xf8dDzvyvhFFYSLr3+M5SCL5QGE9h6ymQqNVlyuY2qDDE7m9gQ5mrFypcepB9vNZO2lq2xuyyTQu+Y1JAizcC6/zw1Z96j2wLNj7qoCYe2biMbk03hOVV7QRck0OWOaLpd7ZMOpsJXvY2zARu9mql8MOoMxhH1HhC91xzqRrTAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gYBwUqxh; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-606e757287aso1079894a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jun 2025 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750253756; x=1750858556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vm95n91Ns52KWia1xFtPhZZXKAC2p8xjQR1LgtP4GLI=;
        b=gYBwUqxhx3YKx9eCGEZrovnLJXJ3SCY5T5B18st5YjVsMG/0KzIqLVnMIA682cIktO
         TI+VAVZpwYvevf5tx4WEsEghi4fUOFtxEfUSZxtjRSnGbieodz/VkUF1Auivwswc8d5k
         ITjVv86TRXf8SAy5Hi5DqQMUjEHpjOPC21RL+MLXkLNWcckQmX4YFS/9ioJf/2fRef6r
         uM6iUzLdqd4tXsUATwE6yQWOaoM3AfwczJzzmeoIDJ6dKx4sHuXTT81tT7mfyLCb9zkm
         7SzCgLMqJEep/GSD5D7GlbBcKst3GMTzLPh03ZlXfzUBITBPD3bxl6vJABwrxMikRbA1
         VWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750253756; x=1750858556;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vm95n91Ns52KWia1xFtPhZZXKAC2p8xjQR1LgtP4GLI=;
        b=wI/6F8XJixXEJ2oTxL5ZtpGwzVj4GoZIBcgtb4Q7Oe9sJaCg9j0jzhk1WJonS3iDVB
         27bEg3ANYSShvou8S0laikXs4KRL2EN4cbaAzP2OILCarGD8xxZMHwwFlhPfMrV7Fezx
         QQ6wgiXKMN61MZdG9C1e++qNBQb5j2mPPNcQG2vcSLtP1V1gvMUhmQxpr5f3kdyUB6Yy
         D9T6rOygpGrXXi79N2QTCbSD8Eq7NpgIvPHVpHMy/0R32u90OBvqQUXBQSUHflqKrfho
         DX3hbpyYUtpqv15BBhb+dDrAZ9co/o4Bh1dQXtOtQFDAvWylqWnMSHdBe+2/ywA+buqy
         Qi0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXvyij9wkv8cBG9NQtw6fwt7P360QUzLHSWrA1FOklyNc/qBbF8I7v+fbUTvjX6ryuKX4icHdosUow4vxu+@vger.kernel.org
X-Gm-Message-State: AOJu0YxHTSM6EIPL9PyvG7Gx1yGNYpflAolJz4+xGKlPaSdp6dirRXHe
	fbFawwNG+2nAD9EYEbv+zLEJIGVTJYsq/tlSMeuNV3DEaMpAb3yd/2uRJ+bmzSj2aNA=
X-Gm-Gg: ASbGncs2EFgK+O3jtF8EzD3A7mmFs4+55F3kdFCWP+ukDLnrtX0lO7K2oLFT2kDrtlj
	eZrjwhDTRMxy0/ewMpHl9rCUmNyBmgAZIpjqIf1AtmeFL5dhnQNlpkBXdPqgu7yo1dPiVmHCdaJ
	CO9HSRsDUARK1BNGnF09BF2LPH4LjuOU+RJ+oOf0h+z54ygIbLAvCnuU5XQRQoZB4muHU/9YeWH
	GkTnbxfss0I6Wnh7cp4b6Q822Cj1oTK206CES3tc+BbZixVdpVapdHpEof65q74mrtlWEV85Hc4
	2I7J7eLSb4HXnPZK8s0jIPuXmu7g/L55X5AGZvGR73BHSIdoY38ESkKtaL5OtsUAIJk4irWeXOS
	NrfocNKA=
X-Google-Smtp-Source: AGHT+IE1ud3yJYsJ79Qd0+8elKcmVVdwL9QoowOoPfGYgIuLMPOKhG0CbABrtSSUISu4VSl+T5X7Kg==
X-Received: by 2002:a05:6402:42c9:b0:607:7add:8647 with SMTP id 4fb4d7f45d1cf-608d0a22945mr5401571a12.8.1750253756018;
        Wed, 18 Jun 2025 06:35:56 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48faf6asm9699865a12.31.2025.06.18.06.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 06:35:55 -0700 (PDT)
Message-ID: <51f03189-6a35-4387-acb9-c853ffc56a0a@linaro.org>
Date: Wed, 18 Jun 2025 15:35:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <f2654844-091f-46bf-88c6-6f6d4edc5533@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2025 15:34, Krzysztof Kozlowski wrote:
> On 18/06/2025 15:07, Dmitry Baryshkov wrote:
>> On Wed, Jun 18, 2025 at 10:28:10AM +0200, Krzysztof Kozlowski wrote:
>>> On 13/06/2025 16:04, Dmitry Baryshkov wrote:
>>>> On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
>>>>> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>>>>>   
>>>>>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>>>>>   
>>>>>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>>>>>   {
>>>>>>> +	unsigned long flags;
>>>>>>>   	u32 data;
>>>>>>>   
>>>>>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>>>>>> +	--pll->pll_enable_cnt;
>>>>>>> +	if (pll->pll_enable_cnt < 0) {
>>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>>>>>> +					  "bug: imbalance in disabling PLL bias\n");
>>>>>>> +		return;
>>>>>>> +	} else if (pll->pll_enable_cnt > 0) {
>>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>> +		return;
>>>>>>> +	} /* else: == 0 */
>>>>>>> +
>>>>>>>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>>>   	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>>>>>   	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>>>>>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>>   	ndelay(250);
>>>>>>
>>>>>> What is this ndelay protecting? Is is to let the hardware to wind down
>>>>>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>>>>>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>>>>>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>>>>>> without any delay between them.
>>>>>>
>>>>>
>>>>> Great question, but why do you ask me? The code was there already and
>>>>> MSM DRM drivers are not something I know and could provide context about.
>>>>
>>>> Because it's you who are changing the code as you've faced the issue 
>>>> with recalc_rate.
>>>>
>>> Heh, the answer is then: I don't know. I think authors of the code could
>>> know.
>>
>> The 10nm HPG documents a 250ns interval between enabling PLL bias and
>> and enabling the PLL via the CMN_PLL_CNTRL register. There is no extra
>> delay between disabling the PLL, disabling FIFO and remobing PLL bias.
>> Please adjust the code for 7nm and 10nm PHYs accordingly.
>>
>>
> 
> I can drop this 250 ns here, if that's what you ask me. But fixing

But please confirm that you want dropping 250 ns as PART of this fix,
not some separate commit. Separate commit is irrelevant to this patchset.

> anything in 10nm is not relevant to this patchset. You were already
> asking me for different fixes for some different things and I find it
> not acceptable anymore. Stop blocking this patchset with every little
> existing issue.
> 
> Or merge this code without this patch if a fix for reading PLL as zero
> anyhow is questionable for you.
> 
> Best regards,
> Krzysztof


Best regards,
Krzysztof

