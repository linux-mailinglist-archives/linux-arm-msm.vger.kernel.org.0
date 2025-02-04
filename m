Return-Path: <linux-arm-msm+bounces-46854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B69A26E14
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 10:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E694165BA3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 09:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88FA206F37;
	Tue,  4 Feb 2025 09:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eILPqPrK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADAF207A00
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 09:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738660857; cv=none; b=jX4VtzAr2FRMbM6Xdsyw2TJdSwtCmAZBdyZHF1qNYUrxvMww+slfPo0G+HU1lzk66GFb7H3254xI66EC+odGfJKeSIvENlCUDFzD4uSGAuz7JheAqYIU0K3wvakKKZAkHNMuZe9U/W5qmf/1TrY2vh49VBU7Ra4PRCU5xvzhwPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738660857; c=relaxed/simple;
	bh=O4eOmjAQzwHhI5lzYn3JiCBN1g+XRupIaxZdgM+ZxXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KQ4El9UUaBNeqUN5+4DW73F/TZOIbcj8CdCREjPyxL6iAQa1IpMbcnhTIFza57ZEN7W+UbmcGe4vqAkGoTebikvlhMksxt1BVdFw6TRFFqQ3UIEVfxJMZa8SA9kzHwA+EfIdVrKfUaGKRSNPhVsiI4nxH27dhcMboARKUoSBFVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eILPqPrK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385e44a1a2dso317645f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 01:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738660854; x=1739265654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pjOn8HlqiUp9imgeIwX/Vs1stgG6CCtQrFtgz5ne2w0=;
        b=eILPqPrKTu3/3B9A5GJZCW7+b6rUZbPenWyF4qezHses2ydmBgdbf3l0UyvPVeRkiB
         Cab/0qkpbLCB2X5VHta3rI9YF7wtofG0lVtWnOmwmqsggPRhbs2Cgk+MZs96U64OB5Hx
         P7u07ChjvNHr6m53wMBzUVNwwFiLWUQfLjJUCrvZzUndnsNJUAnsA6xM1gTVzvyw1BxO
         L31IUtLxs0Zu35CdBW2T12bz2p5ThUueRx1w6f8XYfiOfeaouyRifonSUXVVOpbNhixF
         jaqefgdn9Q5/5qmqTRpgyAaL8mNuLQBpj+Nbb47Has1HwPKLS88T5HS7NMpflPep5bvA
         iWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738660854; x=1739265654;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pjOn8HlqiUp9imgeIwX/Vs1stgG6CCtQrFtgz5ne2w0=;
        b=L7eCcjJ+txeRcr8XeTUXOgYK/AYzAzeShuukHAGqMZbFDYKsR65zq7jjlAGyYxBuBh
         hXCuHxxtX3ds5oEIKue9ChFcFDbLvrYBC1UTfqjlwA4Q7nU9AU39L6NNOV4BThHrLg36
         SDxjoW0Gq4FvjAtwVqMkfBzadgECqPNImzH0cXhViCKyoaCWxdBRoc7DewLIY68okGe8
         0cAoXYvXIY/bRURe7DCM2iOSd4fS1HK8dn1cqGKyYqSfjJIXblutpphXdi2BRItb+dJz
         5BEruFKeqb92rKIRYZToBVR10LPAMDVBEiSiTsgrEttx+5RkfoxSSFpxmjr5V/ST2vLh
         x3XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh3iOqzIt98uuNXnN2MeXl2sU7aUJFmbs1H/pjRNWzP3kNKtMNM+JA0Lg77J8W8WbiFcApVXxM2Kwkc546@vger.kernel.org
X-Gm-Message-State: AOJu0YxdQN+POn9wn4D7bYiWgSrJRXFjkMGnB7ADgLh+Z3FjHRlA4WIa
	OP0dB1/k7pTbAWstkL8JbBQORPwOzwqiFT4iJlwOC3SBpXCivkLMzxlxNcEgiNU=
X-Gm-Gg: ASbGncvk+yBjnGvKOOm2buIlq2vo6nLwaYojr7xoCMF8TnrI+QvRLlVS0Ex8tI30uN8
	Ps1jXLBCVOrsRteOwVWnwqC8uTEgvFyK2y6JDGPeTON7vshBnRlEKt2eI5JIq3LTSNuvNQoldgZ
	m6+YusLrfMHILVVxxrEkyN0YQsM8VSnyku5iWAY4IoYv8T5kbI45xx9x6CB2t4SbTiKMu9J5HH2
	8k5mKjPaT6003vUqYKGYJUzwW8qLwvtsRvy+kivRRRNp5nBv5pBco2f7m93U4w7++ExDLmYpjbW
	JZ7i42h2+QQnDF0bR+LS6V+ck+6xabQDo+U=
X-Google-Smtp-Source: AGHT+IFloUpSZQql46Cok/SCgcqCNh/GvapYs4i6t5zqyN7Opagv1IM4g04vLOIGgxfILq4uWlvkXw==
X-Received: by 2002:a05:600c:3ba6:b0:434:a339:ec67 with SMTP id 5b1f17b1804b1-43905ac256fmr8627075e9.3.1738660853880;
        Tue, 04 Feb 2025 01:20:53 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d42c7sm187223825e9.3.2025.02.04.01.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 01:20:53 -0800 (PST)
Message-ID: <cc63872f-3ad5-479e-bfff-8d62478e446e@linaro.org>
Date: Tue, 4 Feb 2025 10:20:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated
 from driver side
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-1-862b136c5d22@linaro.org>
 <le5kxzhm3b2whxoo3eblkelryc7ak2yezugqti2sxw7m244dzc@nyuhhs53jdup>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <le5kxzhm3b2whxoo3eblkelryc7ak2yezugqti2sxw7m244dzc@nyuhhs53jdup>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/02/2025 18:42, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 06:29:18PM +0100, Krzysztof Kozlowski wrote:
>> PHY_CMN_CLK_CFG0 register is updated by the PHY driver and by two
>> divider clocks from Common Clock Framework:
>> devm_clk_hw_register_divider_parent_hw().  Concurrent access by the
>> clocks side is protected with spinlock, however driver's side in
>> restoring state is not.  Restoring state is called from
>> msm_dsi_phy_enable(), so there could be a path leading to concurrent and
>> conflicting updates with clock framework.
>>
>> Add missing lock usage on the PHY driver side, encapsulated in its own
>> function so the code will be still readable.
>>
>> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 13 +++++++++++--
>>  1 file changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index 031446c87daec0af3f81df324158311f5a80014e..c164f845653816291ad96c863257f75462ef58e7 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -372,6 +372,15 @@ static void dsi_pll_enable_pll_bias(struct dsi_pll_7nm *pll)
>>  	ndelay(250);
>>  }
>>  
>> +static void dsi_pll_cmn_clk_cfg0_write(struct dsi_pll_7nm *pll, u32 val)
>> +{
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&pll->postdiv_lock, flags);
>> +	writel(val, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
>> +	spin_unlock_irqrestore(&pll->postdiv_lock, flags);
>> +}
>> +
>>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>>  {
>>  	u32 data;
>> @@ -574,8 +583,8 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>>  	val |= cached->pll_out_div;
>>  	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
>>  
>> -	writel(cached->bit_clk_div | (cached->pix_clk_div << 4),
>> -	       phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
>> +	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
>> +				   cached->bit_clk_div | (cached->pix_clk_div << 4));
> 
> Ideally this would be FIELD_PREP or a special function generated for you
> in the header.

There is no header. That's patch #1 and I do not see how changing this
to FIELDPREP is anyhow related to the actual problem being solved here.

Best regards,
Krzysztof

