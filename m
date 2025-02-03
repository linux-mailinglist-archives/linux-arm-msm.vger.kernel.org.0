Return-Path: <linux-arm-msm+bounces-46732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8C3A257F6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 12:19:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4DEFA3A28AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 11:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B0AC201015;
	Mon,  3 Feb 2025 11:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LE6G7nfu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23711DB551
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 11:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738581550; cv=none; b=qqbp2b/+r/5n7odxdHyfJpovEtt7vYnOuzxiPSFURWmeY4io/G07fj8r1Jw3lQBRsAsBDjy5xVp9rL35KPfzIRkg0IQxHLBCizytmF15KxfdwTrYDoBfC+wZzqWcteLiZnIMQIDyPWM7AshYLzZl/R9qjX6LeoM3Zerl1joR4C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738581550; c=relaxed/simple;
	bh=JzwrKZdL+/xl945va38rwQmUC8GAszrRLNy8Jaym4To=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RZwm52J1m/gjoMqALo9rcsFbbwV+QownkvKiqcMv0+nBJMlqO1c7Q1di9/cTRQsgaDjYU7tWGAb4vFvGPbAGyaLSJ1KQA6KLBRyupVt3gl2L0HctDnsJ+OkS6qmp3BpAbIP7WWdwy7rSpICp5Sr8i/CzaH8KLG+61vjAhzMncVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LE6G7nfu; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43616c12d72so6501735e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 03:19:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738581547; x=1739186347; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sV4cQIzGYSLtSFdV9umQ0o/NA8MRzb578c5v3cNInBk=;
        b=LE6G7nfu5WfW3zs/Et1rT/ZDGOcl1rOiSMJjtRIV2TKAdriifvxBrKAFfeU58QIE9/
         Qn7Vz1YNiGTsVyAvXcEfE3pbhVYGDyYa3b2ZaLBH2cX4uAZzd+tEXLbmjVI6lWhy5db6
         7A3MbMZUnBKK1PMw3trN/7crkCagqfkNaRKRBpTAPujaG3I++bg1ayHenR2ijtaK/8sv
         Zly4NpCiOnWAfKaFa9SupSey222Df538AHjrWNb15Va9/DV4/AwaSB9gOxexhcIb11Ux
         d0WcIYS0rzz4PSPU2PbrIarDQvW04i4d6BR3LIIfpaREuaeK1GcQLo7JjmacfctVVFrW
         l0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738581547; x=1739186347;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sV4cQIzGYSLtSFdV9umQ0o/NA8MRzb578c5v3cNInBk=;
        b=lKMYg681+Y0XokvwgvLBWB989xelVPcn2UdRPgyTyUlG1zo8XYmIkGvEEFCiG59aIt
         gnMG7MI4eP7AfwwMMLlyaEPua0CbHNqDD3Kn741n3LUUhfFhIJ5MD+mIYYKe7qwsPzYx
         suaaZE3/LwlNvXhM2SnP/sjLWL7hMOgSnlAf29FFqCfD/0nv2MyTME4eSFUbvODE8NHn
         X/D6+5oT4ZoYsKG/hmhRDGPdS8P5rOGtroPa8wga+eM4pFXsera11Ro7Eg5s8bAtjus7
         ebiZ+mQDH1dIn1o7oK+6SCVgI962eAvjqxFGqr7WubUHNfseJOC841EIx7gp4zpny+NH
         nHcw==
X-Forwarded-Encrypted: i=1; AJvYcCXcn1OzxrI+VMmQyGgjaxdESgsiNa4b7H4gOMZAyF4wg0oORMiG7Y6TOmK1i3ZodUUNdClINqho0YEx8OBA@vger.kernel.org
X-Gm-Message-State: AOJu0YxHlDzT743MpalT+oGkvQFRoBw64epdUTfRZt86wWa1FRqXbcC0
	7HVi0yv79bGWNN/P42aqAUu/5HhD/SiDT3naQDhrborb6tknvFM4njENdAS51Qw=
X-Gm-Gg: ASbGncsHjhoOlWMLJ9gXd2qqPSq3s42/qCM8XZFNaYZmbgqal/gqcxRynDPgxZudyQx
	4tjaE1rL3wQCxRLlDJLYrLRdEd0mf80FoytLV9jHZOJxGQLF+y3T1WfyTFWo0ysGJsAlzVcqYTA
	DUmDNlFudDtKpRTiGSgHKav9xGES2K4nXZEiqNBbSvZv/PU+9cI47x5QMa2AHTJF/ZEVTZcRZk1
	XOy3qmnGEQTY1U/Tzh6jq5ZZpdrRBur/euLYAR8HB5RufhdR7D0HK6sZpPSNGEyRcEpk0xbrKBw
	J2SPxkwTYg7Gy6rxN4j7btgPA1Tlwt/IWSI=
X-Google-Smtp-Source: AGHT+IFELzjgmQMrwyoZp5AbwTBss0vqShoqykF1UYf+inlf8ZSPwy/iWgnZ4ZDrh5EfqwXw/w6c8A==
X-Received: by 2002:a05:600c:3590:b0:42c:aeee:e603 with SMTP id 5b1f17b1804b1-438dc4213d8mr73167145e9.7.1738581546885;
        Mon, 03 Feb 2025 03:19:06 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm12334130f8f.1.2025.02.03.03.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 03:19:06 -0800 (PST)
Message-ID: <2c10caef-09b3-472b-9d1b-4d35083576e7@linaro.org>
Date: Mon, 3 Feb 2025 12:19:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against
 clock driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250131-drm-msm-phy-pll-cfg-reg-v1-0-3b99efeb2e8d@linaro.org>
 <20250131-drm-msm-phy-pll-cfg-reg-v1-2-3b99efeb2e8d@linaro.org>
 <p3ybn4zsbipks2mzve5uybow3s5baydpmevuzfk7twejnk4cp2@3ljzapngbe65>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <p3ybn4zsbipks2mzve5uybow3s5baydpmevuzfk7twejnk4cp2@3ljzapngbe65>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/01/2025 17:25, Dmitry Baryshkov wrote:
>>  
>> -static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>> +static void dsi_pll_cmn_clk_cfg1_update(struct dsi_pll_7nm *pll, u32 mask,
>> +					u32 val)
>>  {
>> +	unsigned long flags;
>>  	u32 data;
>>  
>> +	spin_lock_irqsave(&pll->pclk_mux_lock, flags);
>>  	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> -	writel(data & ~BIT(5), pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> +	data &= ~mask;
>> +	data |= val & mask;
>> +
>> +	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> +	spin_unlock_irqrestore(&pll->pclk_mux_lock, flags);
>> +}
>> +
>> +static void dsi_pll_disable_global_clk(struct dsi_pll_7nm *pll)
>> +{
>> +	dsi_pll_cmn_clk_cfg1_update(pll, BIT(5), 0);
> 
> PLease add these bits to the corresponding XML file (here and later on)


I need some more input from you - I don't know which XML you talk about.
Do you think about:
drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml
and others alike? But doesn't it have only register offsets, not field
offsets?


Best regards,
Krzysztof

