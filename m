Return-Path: <linux-arm-msm+bounces-46857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6834A26E39
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 10:24:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B139B3A1CF2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 09:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B241E207A23;
	Tue,  4 Feb 2025 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hb5XsqL9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F6B206F37
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Feb 2025 09:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738661075; cv=none; b=nC505gGQt31d6jp45F3i/gqUnHAcGBX3Gr25oBoxjfMuZFYcsu9gdEczUHXnMN3XwmQqyA5wmK9HHJ1Dyt1zK1ukoPfMQ5LtDt8DGiHEQtu4+Ad1cvMZmix2BOPrOrApCVC2K7yA4/HTUD5A0/D2mKNFBIWnCIkhyw0CAbVHrH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738661075; c=relaxed/simple;
	bh=cOgr9XEGKuKIJ6fuL8fg+xexeTZ7VDKIaC+bj4hW32w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tTIRR1zg8oHMnGEuAA2Kg+xscwTkGL5oi6Q3I5yTd1sztLqJwfFXg3vV3CuXFic/uOO4b4BwwqV6WSteWwjh3ANPhT+AWPfNmxUV21nYPN0/MYqMCIMkjpRHn9vcVfl2Rj/vkOYar1l24RkTvL2gx5KBnyML5Ee/AVe31wT2Jyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hb5XsqL9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3862de51d38so196481f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 01:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738661072; x=1739265872; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kOdxREfmr3m4px8NFB1aHCxS9qChT2GU2XSMlmEQIQs=;
        b=Hb5XsqL9do25fkbSzA1ajJT6gNWRPHGhpU0YYGCYIA2ekKCBppbwnwDHfKR3m4K9o2
         361yAMZiclWcgtZJDCyoQDbYCUtXgOEYUxC+zIifum/TIgUvC8wMBmunEEbg2tC6oIvV
         2DdbK85mi6z8UuVgmb3rldVCIS41ru14wjK744HUtVxbC/M/hh20DydgJ785lXP2wNRm
         HAU1DPcdEsCdr21EmcVusx1/noncNVlyzSO/VzEt0JuAB7SXHvmPW77FA2ICaOqrjKFf
         ZTeVhcEgDsc88FXOHFiMUpufgiZvKPjWUMZQebqHNNJupB/BxO9roeVJOTx92Ai/0o3o
         hkPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738661072; x=1739265872;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOdxREfmr3m4px8NFB1aHCxS9qChT2GU2XSMlmEQIQs=;
        b=NdzTPRmtt4BBKJNUHel3upYfVoMhVv+LcOuMSmCiccoXtZm4nkN/880aztM4Cz+bGt
         EDoXpFuZCPVjBG2CEZSo27PfK1QC1sd6ozekpPMXIWxxLxN4s/Uk6t1ql+eV1tmTwnrZ
         +6j0uCZ2S4UklIWd3OebOicvl8SPEfM2/yCwyDOcqQu2q/4hNloDcxudwfn48xLsQ10O
         EydvWCpXbzKX6P6IZrLruDCTqme3aqNJFTEoozzZ/Ry2Ne03ImylX+Ut4BhhQAwQESNt
         KfaJYO+azOB4hNakwXwbdPxkPKZVXnm3ypHIIrs6KeVemZ8N57O0J9Z6sr8h+aA2vh+P
         Slmw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6pHUydt5lisFIC5a8isTvJFILlv9N74sHo5v7ACyVYRgWzBoRBLvqGr+u5WxQs+Jo8r9V96nrIJZxWdr@vger.kernel.org
X-Gm-Message-State: AOJu0YyTd6scEXVthhKb1cy2ePx/+/FpfPGv3Y9mbf6ExDSeK7u9zHjY
	TL3lvENLMxpQtJ6ImfgFBdwC42nfhGHJA9ps+THUFlbF7TIkG8bPCIXS3z5o7A0=
X-Gm-Gg: ASbGncsMBWhvvAVDRhyK3hNh9eCP7T+wYqkgyz7O5lQX4dl5ktRiJrdNa/F+G8mwmRh
	/LtjGUFZBeJ7xeGLO9H1Yh+MZJUvPQQefKasMcvGC1oc99f6O9pCNwiu6dyuT1V499FUyYhZVDU
	jqCKFmDrqOo/itOcExiB7ye0tyErTFMBIE4wS/iinfOnNK4FVe6zngjvuXtxAnIUcVuag0t7rSX
	odAYdSuZVW0SqQZAOcGdwoO2wBS+LBFlRwIOU9p59rASZFahf5I/ZiYLr5qFLB50yfaIQeeKtdi
	02ODUOYk1iqP+MhMO1fGVVM7LugNlw7FvKw=
X-Google-Smtp-Source: AGHT+IEUVGP4e8dVkERX7f/wfDQJCgJ3+T5h5terey2co8faI0jzq1j1NM8hMwbKcC2UFZ5F1JDeQQ==
X-Received: by 2002:a05:6000:18a6:b0:385:dc3b:da71 with SMTP id ffacd0b85a97d-38da4e6386dmr747012f8f.8.1738661071681;
        Tue, 04 Feb 2025 01:24:31 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ecc80sm15480656f8f.16.2025.02.04.01.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 01:24:30 -0800 (PST)
Message-ID: <ef1f91e4-aec4-41e8-b842-52d3f91e82bb@linaro.org>
Date: Tue, 4 Feb 2025 10:24:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250203-drm-msm-phy-pll-cfg-reg-v2-0-862b136c5d22@linaro.org>
 <20250203-drm-msm-phy-pll-cfg-reg-v2-4-862b136c5d22@linaro.org>
 <hhedgfdbqpbv7s6iegtoztmznqdqn7bdumik7dm5xtsfsj6uwp@3jz422fhchcn>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <hhedgfdbqpbv7s6iegtoztmznqdqn7bdumik7dm5xtsfsj6uwp@3jz422fhchcn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/02/2025 18:58, Dmitry Baryshkov wrote:
> On Mon, Feb 03, 2025 at 06:29:21PM +0100, Krzysztof Kozlowski wrote:
>> Add bitfields for PHY_CMN_CLK_CFG0 and PHY_CMN_CLK_CFG1 registers to
>> avoid hard-coding bit masks and shifts and make the code a bit more
>> readable.  While touching the lines in dsi_7nm_pll_save_state()
>> resulting cached->pix_clk_div assignment would be too big, so just
>> combine pix_clk_div and bit_clk_div into one cached state to make
>> everything simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Changes in v2:
>> 1. New patch
>> ---
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 31 ++++++++++++----------
>>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 12 +++++++--
>>  2 files changed, 27 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> index 926fd8e3330b2cdfc69d1e0e5d3930abae77b7d8..b61e75a01e1b69f33548ff0adefc5c92980a15d7 100644
>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>> @@ -67,8 +67,7 @@ struct dsi_pll_config {
>>  
>>  struct pll_7nm_cached_state {
>>  	unsigned long vco_rate;
>> -	u8 bit_clk_div;
>> -	u8 pix_clk_div;
>> +	u8 clk_div;
>>  	u8 pll_out_div;
>>  	u8 pll_mux;
>>  };
>> @@ -401,12 +400,12 @@ static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
>>  
>>  static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>>  {
>> -	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
>> +	dsi_pll_cmn_clk_cfg1_update(pll, DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN, 0);
>>  }
>>  
>>  static void dsi_pll_enable_global_clk(struct dsi_pll_7nm *pll)
>>  {
>> -	u32 cfg_1 = BIT(5) | BIT(4);
>> +	u32 cfg_1 = DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN | DSI_7nm_PHY_CMN_CLK_CFG1_CLK_EN_SEL;
>>  
>>  	writel(0x04, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_3);
>>  	dsi_pll_cmn_clk_cfg1_update(pll, cfg_1, cfg_1);
>> @@ -572,15 +571,17 @@ static void dsi_7nm_pll_save_state(struct msm_dsi_phy *phy)
>>  	cached->pll_out_div &= 0x3;
>>  
>>  	cmn_clk_cfg0 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG0);
>> -	cached->bit_clk_div = cmn_clk_cfg0 & 0xf;
>> -	cached->pix_clk_div = (cmn_clk_cfg0 & 0xf0) >> 4;
>> +	cached->clk_div = cmn_clk_cfg0 & (DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK |
>> +					  DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__MASK);
> 
> Could you rather store these two fields separately by using FIELD_GET?

So make the code again more complicated? OK.

> 
>>  
>>  	cmn_clk_cfg1 = readl(phy_base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> -	cached->pll_mux = cmn_clk_cfg1 & 0x3;
>> +	cached->pll_mux = cmn_clk_cfg1 & DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK;
> 
> FIELD_GET
> 
>>  
>>  	DBG("DSI PLL%d outdiv %x bit_clk_div %x pix_clk_div %x pll_mux %x",
>> -	    pll_7nm->phy->id, cached->pll_out_div, cached->bit_clk_div,
>> -	    cached->pix_clk_div, cached->pll_mux);
>> +	    pll_7nm->phy->id, cached->pll_out_div,
>> +	    cached->clk_div & DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_3_0__MASK,
>> +	    cached->clk_div >> DSI_7nm_PHY_CMN_CLK_CFG0_DIV_CTRL_7_4__SHIFT,
>> +	    cached->pll_mux);
>>  }
>>  
>>  static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>> @@ -595,9 +596,9 @@ static int dsi_7nm_pll_restore_state(struct msm_dsi_phy *phy)
>>  	val |= cached->pll_out_div;
>>  	writel(val, pll_7nm->phy->pll_base + REG_DSI_7nm_PHY_PLL_PLL_OUTDIV_RATE);
>>  
>> -	dsi_pll_cmn_clk_cfg0_write(pll_7nm,
>> -				   cached->bit_clk_div | (cached->pix_clk_div << 4));
>> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, 0x3, cached->pll_mux);
>> +	dsi_pll_cmn_clk_cfg0_write(pll_7nm, cached->clk_div);
>> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
>> +				    cached->pll_mux);
>>  
>>  	ret = dsi_pll_7nm_vco_set_rate(phy->vco_hw,
>>  			pll_7nm->vco_current_rate,
>> @@ -634,7 +635,8 @@ static int dsi_7nm_set_usecase(struct msm_dsi_phy *phy)
>>  	}
>>  
>>  	/* set PLL src */
>> -	dsi_pll_cmn_clk_cfg1_update(pll_7nm, GENMASK(3, 2), data << 2);
>> +	dsi_pll_cmn_clk_cfg1_update(pll_7nm, DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__MASK,
>> +				    data << DSI_7nm_PHY_CMN_CLK_CFG1_BITCLK_SEL__SHIFT);
> 
> use accessor function from the header.

For which part? for last argument? It will be almost pointless, but sure.


> 
>>  
>>  	return 0;
>>  }
>> @@ -737,7 +739,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>>  		u32 data;
>>  
>>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL__MASK,
>> +		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>>  
>>  		phy_pll_out_dsi_parent = pll_post_out_div;
>>  	} else {
>> diff --git a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
>> index d54b72f924493b4bf0925c287366f7b1e18eb46b..d2c8c46bb04159da6e539bfe80a4b5dc9ffdf367 100644
>> --- a/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
>> +++ b/drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
>> @@ -9,8 +9,16 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>>  	<reg32 offset="0x00004" name="REVISION_ID1"/>
>>  	<reg32 offset="0x00008" name="REVISION_ID2"/>
>>  	<reg32 offset="0x0000c" name="REVISION_ID3"/>
>> -	<reg32 offset="0x00010" name="CLK_CFG0"/>
>> -	<reg32 offset="0x00014" name="CLK_CFG1"/>
>> +	<reg32 offset="0x00010" name="CLK_CFG0">
>> +		<bitfield name="DIV_CTRL_3_0" low="0" high="3" type="uint"/>
>> +		<bitfield name="DIV_CTRL_7_4" low="4" high="7" type="uint"/>
> 
> Are there any sensible names for these two regs? It looks ther are
> not...

These are the sensible names. That's how they are called in datasheet.

Best regards,
Krzysztof

