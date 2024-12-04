Return-Path: <linux-arm-msm+bounces-40247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E869E3ADD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 14:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65233281B78
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 13:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21B81B4F02;
	Wed,  4 Dec 2024 13:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U/bR2/XE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08386746E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 13:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733317859; cv=none; b=eVwr6N79T4FAJcs8tmpiX5vqX9Z7IrdaqcxQoetDVeTyPxTM9GhE0SUOBsiHr7anGMYixrD7eB1I/LfZQ3QRvjwTIfgVZDGwFErc+oPc/f7aI+Rq3zRyvkY3px5RWYhUv5UTOo42lO59uvoFPi+BbzAzcJmpsjEjZQNCmcP2P8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733317859; c=relaxed/simple;
	bh=d9srN0x/w14KgArGFuugj5uKagGGfKV7pLkuONxS+Dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oox9RaqJprwa5IHGwrCGzDOMNDKa6+TIssNw9uvbGEsOJgvI/DKC7zdlTVa408Atye8MofpDfGGxZfLtT+ywzGYt+UTg6ZGO1XGYmUUKIlqPDAgaXSPiwgpIdRMCff9LrxoUcF9uQvikERMso+jsss7UKss7gSQrbu2nZY5UJUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U/bR2/XE; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-53de3ba3d39so1167504e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 05:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733317856; x=1733922656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v90yvB7RAiniL1C2+QudwZhiuoJT9vTsYZRhdNmXhhc=;
        b=U/bR2/XE1pLGEwUhn6Y8QPGosmAFEYSvYHhcPjHJUFAGxUi3wFYWoI08zykZUHulgL
         GG0RD3+N2llGfANP0g30nd0YL8AO1ni/GMVstW664ebzGlEKrMwcMiJya6hKAzNmOQ3x
         pPo8LvwI9yrNCcirxN2/y6fRuPbeBQUZnmyI9MWud2Rm/ed3JIayDiTz5ipV4I6hju0K
         /fw71MBTzcVgaFNWGj5Nw+3jEoqHCslSGrNZO649bWPBV6zFfgu0NaX3q2JUXx3EUaqG
         33hu8lMxw/7mmfYll9A4VxXCymiBlGMeFbpvaf/O/zzS0WzWQ7tA/802uudMT2L+xLVQ
         5vmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733317856; x=1733922656;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v90yvB7RAiniL1C2+QudwZhiuoJT9vTsYZRhdNmXhhc=;
        b=Quk17UJ8MTJnG0VS9uG5kJb0OsuLipw3edkZdblJ5BQBaIyH770DwkKq+oaDH+K5QO
         ex7wCqhycxbpWOte8xR4HukLB9fDYwVOfBJ2Rx3sYetkTaKURJ/ArfRq9N2b9PpPfRg4
         9dP61WpSE0BRL4nuDlbeu03kami1SbmzETf9xkCXzwloFF1JUvkyT5PEb8tOmHUp2c9o
         xM71RdvfQYszk7t1GsVcajluw8jmaF9flKhSVZSG2jTbq4qcep9i9ikV1z4c2KtqS6KL
         Mia7cJ1qiyXpW0l8AIJYeLdijdVTKFrJgE4mQldesEV9tIhFEOGzpG7qqJXJAMgpdaQu
         +aEA==
X-Forwarded-Encrypted: i=1; AJvYcCWJzg5PcyaY/to7br25j9CwD1rVoFIzBxvC26VlgJXSybdtDgu/kjOvKehhAF9QU5lysv8E65cF1GgngTw/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9JzRAWpgeXNsHNcF1bm0GojDNLzljZvbSvLmnyxsQ2RhCA0uz
	g8r8AsFe/Y20u/hAnu12O6c89tVtRYxDIVvVQo28L1ipMGsLU5FEE7vOVfLVNRw=
X-Gm-Gg: ASbGncvcKwBGrojIrjCfnFhPE0BNVnvG9d7Uo+qouEI/kqEVM+tMLOMQZAOYociIOGl
	O4iGfhEqLoJG+rQj3biX7+rT8NbnQWFrsZibOMzrsZH19eGQ/YsRJOBS6AqSE/51W7JjBVQ4i/M
	bCDgBszQjytC5G8/sQ/qsJVq3HAkwsG+4rXhCDlEzxVtOvcMw1LMmnZdLDEN9Ugd+q63/0W4NTp
	u849OQCKzZ0FfSq+KiFnWEhl7iztruMZTk86668bCIJWjcA3rz08St3plYmERMa5ZPAeFtNGvJS
	fuF9kV5rpfH5Pe3DYtgOyi2cz3gR
X-Google-Smtp-Source: AGHT+IH8wgGCDm9wMUjZa+Ps9/xwljaqHUU5uVvMp2BZp/GBAgPi1/iYQ27QcuFH9QI7yv36jUzghQ==
X-Received: by 2002:a05:6512:2397:b0:53e:1f1e:130d with SMTP id 2adb3069b0e04-53e1f1e17demr168656e87.3.1733317856104;
        Wed, 04 Dec 2024 05:10:56 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1c715607sm274323e87.39.2024.12.04.05.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 05:10:54 -0800 (PST)
Message-ID: <cd754842-42f0-4938-b590-34ed7c4503c6@linaro.org>
Date: Wed, 4 Dec 2024 15:10:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine:
 fix ov7251 lane properties
Content-Language: en-US
To: neil.armstrong@linaro.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241204-topic-misc-dt-fixes-v1-0-6d320b6454e6@linaro.org>
 <20241204-topic-misc-dt-fixes-v1-2-6d320b6454e6@linaro.org>
 <vlvchjynnwvevr2raosrwggwmjd5bdrs5skbsztskmzxjjdg7v@6qkhrjyaxlsz>
 <0c1f4e6a-a77b-46d1-b944-9eb47d66556d@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <0c1f4e6a-a77b-46d1-b944-9eb47d66556d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/24 14:16, Neil Armstrong wrote:
> On 04/12/2024 12:05, Dmitry Baryshkov wrote:
>> On Wed, Dec 04, 2024 at 11:56:54AM +0100, Neil Armstrong wrote:
>>> Bindings documents data-lanes as a single entry with a separate
>>> clock-lanes property, but DT uses 2 entries in data-lanes.
>>>
>>> This would suggest clock-lanes is missing, fix the DT using the
>>> bindings example.
>>>
>>> This fixes:
>>> sdm845-db845c-navigation-mezzanine.dtso: camera@60: port:endpoint:data-lanes: [0, 1] is too long
>>> 	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov7251.yaml#
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>    arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso | 3 ++-
>>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
>>> index 0a87df806cafc8e726aacc07a772ca478d0ee3df..5a16f4c2b346b314af3d614266e1ca034057e643 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
>>> @@ -115,7 +115,8 @@ camera@60 {
>>>    
>>>    		port {
>>>    			ov7251_ep: endpoint {
>>> -				data-lanes = <0 1>;
>>> +				clock-lanes = <1>;
>>> +				data-lanes = <0>;
>>
>> Is it really this way or the other way around, clock = <0>, data = <1>?
> 
> No idea actually, on the schematics the lanes from the DB845 are :
> 
> CSI0_P/N -> OV7251_CSI3_LANE0_P/N -> MIPI_CSI3_LANE0_P -> SoC
> and
> CLKP/N -> OV7251_CSI3_CLK_P/N -> MIPI_CSI3_CLK_P/N -> SoC
> 
> So I assume the data-lane is 0, for clock-lane I just used
> the example, but I found nothing in the code using those assignments
> 

It's a sensor property, and OV7251 sensor has the non-selectable clock lane.

If it's technically acceptable, I would rather suggest to deprecate and
remove "clock-lanes" property and hard-code "data-lanes" value to <1>.

By the way, this particular device tree bindings miss bus-type property,
it could be either MIPI or LVDS serial output.

--
Best wishes,
Vladimir

