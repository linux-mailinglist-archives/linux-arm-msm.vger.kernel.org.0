Return-Path: <linux-arm-msm+bounces-48215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0164A384CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 14:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DC82167EB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 13:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5C221CA10;
	Mon, 17 Feb 2025 13:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tci4tq25"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BC221A44E
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739799457; cv=none; b=V87yvHNR9NoshFtosLzk1NsvP+haFdin8cCv7La8GC7YY+IJMD99fnJYdQcYJs1bMQIyaEAVm/QNdeJaQWtqm1If1/iBS3yrA7+nfyHBZojmTTN7UFTXC+bJpB6AEA+6UhUu8EJahMpp5z3OUycEa+kTkOm5b327WJggBTeOa+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739799457; c=relaxed/simple;
	bh=Lvzzc7lXRWBmv5zAJAXlqpLp1clocjKKumHJlWIDmcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATPfjOR5Q3mXLzCwqM6n6YR4CAf59vZf9jkYpbGAvr0ZifEHN5FxXLQ12qeiPvlTmIsFGDxrlETdeixqsmpGo4qr9s7injlN693fyc959mCnDXUVdrb4kZcBzmfl5BI5Y4dXcxZl4SsKKsqU1575ypPviOVfcTUgCGF5jEf1GdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tci4tq25; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43979038df6so1177855e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 05:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739799453; x=1740404253; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yf/H9xQPOC5Mf7egObQiUCwJ+y9rttCstxQBnQsk93k=;
        b=Tci4tq25wYYoZZGPsMlk0q52m8CBiXj5j6frcVVPa1t65mpSzEV9scZc4SFmQDd5hB
         pievRmLe+RTZhIFOvkqX63STQkgYKsAZUE3iq9THDWTfGR+8TDV2uGQq9dCEK7YIZ7Hn
         kgmblz3YbBrwJVmHsvX79GrsO5QCvXsihdjM0fqmrCqle3PIk8ZpIiEOUqSC6IuI3U6a
         D1Wd5ueQglxZe9P0DbIFSZ/EqiAw43T16xPQVgYEgSacyp9WFezHWdsKQFnUa9Bu8gwj
         gO0PoQU+YqedK8fFskPkVBBPe/Wyf4NpAn+tE1mdhKnAHhEAIc8jKHqUAAUTsqNOIK9C
         SeQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739799453; x=1740404253;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yf/H9xQPOC5Mf7egObQiUCwJ+y9rttCstxQBnQsk93k=;
        b=JOePsHsplJmMaYphuP7K8J/Il7GVdAeO1u5/nK7wiU7d8HzUDroVhgJZtb30DCrpXa
         raFPam/g/EDMQI5pnwD4zPzmIh1D9Tzb0hW0ms2VZ6XOOpUbZOE3ws82ykitdWKxmPfc
         pma5Gh1ArdMHUVwBR48AiB9SQjfehlozje8sK0qRPjuIycH5K7R7hsZE9uleJPoZtcUx
         hnKVwkj8gdW1nc/lE3kGsolF5WQ/M9Sklgvuhyk/ocSaWh4qjdRickKdr4R/kjMGeQyj
         cnOYkZTgsL1mtOFYjxPs0i44vLOGibS3wrcG5NzhHvCJgDTvw74ZYZecSuGoCt0kSYbN
         kvuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGOfA4Vy/e8PfkI2uodDvjbjwvfaVYwmlAghZ3qcAzbH82CsTPiAVuoIcQ5fAokr4wLTGUcrEJ7eBDqFSv@vger.kernel.org
X-Gm-Message-State: AOJu0YyINjACpqEEBB643q5cf5uqzEtAKUZIUstFdwPjchNDUK9i5COh
	raeLyoHI4wlkbGtdl1QodTZYizxX3i8WVfhIaIbHpYl+n3deCmiiYcQ3lIJQoMkC5KLYofaRk9X
	x
X-Gm-Gg: ASbGncukP9pKhu10KPV1X6tbi5SMHn8s3Le/R6jCwLhSfPumn4qiwqi01oRrMj0KGyY
	EcXzfhubzJ+KWWH17thuN70013GbmnACGQz0BxRKGo/otR9NvoqSpJws2/0UuK5dE1eePvw1SNK
	mnX3Bh49KHwkSfUTq5XxCkAAhzpfCwFmZUelAj9Uxyk+AApYNHx6lz6+UDrmKCeT7IwO0TJrwgL
	MOWZOyhrDgXkzpzQl3amIq8nT05KbcdccArH55Yh8Jtj+ouydr3lBopS2l5+MP0K7xzS7CEA4R2
	FbzD8GEG4KrSxcvhBoluNCBYJKyheD6d7VY=
X-Google-Smtp-Source: AGHT+IHJ+dLliMlsrncfroa5visZAN+EnKWNf/e+q93+1SrC2y08Ffo1fzeccqrwlWiQWBM98iwqIg==
X-Received: by 2002:a05:600c:1d23:b0:434:9cb7:7321 with SMTP id 5b1f17b1804b1-4396e6d8163mr36478495e9.1.1739799453088;
        Mon, 17 Feb 2025 05:37:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439831f209bsm33076465e9.13.2025.02.17.05.37.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 05:37:32 -0800 (PST)
Message-ID: <df4cfdb1-66be-4264-aed3-0d5567e721f7@linaro.org>
Date: Mon, 17 Feb 2025 14:37:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/msm/dsi/phy: Define PHY_CMN_CLK_CFG[01]
 bitfields and simplify saving
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
References: <20250217-drm-msm-phy-pll-cfg-reg-v4-0-106b0d1df51e@linaro.org>
 <20250217-drm-msm-phy-pll-cfg-reg-v4-4-106b0d1df51e@linaro.org>
 <ocxifv24wxghio3gfoychilmmjsxpeypxkzidspoq2e4dor7ja@wc54pryzyjge>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ocxifv24wxghio3gfoychilmmjsxpeypxkzidspoq2e4dor7ja@wc54pryzyjge>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/02/2025 14:13, Dmitry Baryshkov wrote:
> On Mon, Feb 17, 2025 at 12:53:17PM +0100, Krzysztof Kozlowski wrote:
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
>> Changes in v4:
>> 1. Add mising bitfield.h include
>> 2. One more FIELD_GET and DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL (Dmitry)
>>
>> Changes in v3:
>> 1. Use FIELD_GET
>> 2. Keep separate bit_clk_div and pix_clk_div
>> 3. Rebase (some things moved to previous patches)
>>
>> Changes in v2:
>> 1. New patch
>> ---
>>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 13 ++++++++-----
>>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml |  1 +
>>  2 files changed, 9 insertions(+), 5 deletions(-)
>>
>> @@ -739,7 +741,8 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>>  		u32 data;
>>  
>>  		data = readl(pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> -		writel(data | 3, pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
>> +		writel(data | DSI_7nm_PHY_CMN_CLK_CFG1_DSICLK_SEL(3),
>> +		       pll_7nm->phy->base + REG_DSI_7nm_PHY_CMN_CLK_CFG1);
> 
> Nit: should this also be using dsi_pll_cmn_clk_cfg1_update() ?


This is before clocks are registered so there is really no chance for
simultaneous access.

It is rather then question of code readability or obviousness.



Best regards,
Krzysztof

