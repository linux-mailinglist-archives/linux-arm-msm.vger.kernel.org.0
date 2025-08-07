Return-Path: <linux-arm-msm+bounces-67987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B89E3B1D585
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 12:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D91B3581070
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Aug 2025 10:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70228231826;
	Thu,  7 Aug 2025 10:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvmgJ6zf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CED22B5AC
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Aug 2025 10:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754561497; cv=none; b=M1jHeLFgq1eCWN1WjFtibSyX12dEdR3pVWrD9GG5f0iDjOR8OM1C7ZKlzZdPJ+p9Mq25WsgKT5Zma1/VS7cHvDCAFfSuve+ilpI+kIwXRhBb5Rmv26EQCOnCDzhiWAErfZ6DldjxuOUWql3dsaSJ1HjpOFuOWONllVxyv7YqFA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754561497; c=relaxed/simple;
	bh=O6Y8cVOuHgA/hdqV1bgBIn4O/CUwlnYyFlCzNIDIYM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ToX8/kjN3764OXzP9jR3qSgiAv/6OYYg50A+xZgm4nDko3cXX4AGmcf2nvARYjjllXHEN3wH3QL3HrgBmSXmFQRBHLI2n0dwN/KGA4WmOAyNGjMMIOqZG/PZsfAFEghFmQC0c1CyKNDIq69rHAeCVhG3C6JikKiBOlhnIFS6LJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvmgJ6zf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4563cfac2d2so6606205e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Aug 2025 03:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754561494; x=1755166294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UCEOeQAX58eFRpMAP8AQskjLHPoD1JzG7voJikyFC+Y=;
        b=gvmgJ6zfWuydL4/n/O1WHIY/Pk2l40OgMcfVxiEJEC3vX3ObpnQ6Tw5HZdpB2Bqbxa
         A3rxPcTOIUq6GBQMCjw7VdOlikB5h6tXxPMAV7LPL7UDcPPip4r0FxjsMAZ0D0U+VQ8Q
         B4k4po9JxcIfgvM01w+dYCZCO57I8WxlgmCaFdRdC48lmHwh831qn7RhORvTB1lyHsoe
         e2BPA9PLYjen6Z/ZYUIfi0lHxfzvBVW5N2nvNrMitbVe08SFrFQWdg5U2fM45HNqS4Cs
         HylUpQvW6iyMZ3dYwxXGrYyUu9xPrlrnDLvB1LPQNI8JL/4jl1wouSILsnrQn9mJYf8H
         15og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754561494; x=1755166294;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UCEOeQAX58eFRpMAP8AQskjLHPoD1JzG7voJikyFC+Y=;
        b=b7mcUZVx7lufBJur7QyrCwmBpPXAMRAINh6d+AopqZbG8dBzthNmOTZx83h1b3Lgk7
         8iJ1bwRlIZxcm9Cftr4KAr4+/YptxGfoEzEHe6b1iMSOr3HTcuLx9e34J0POhbPdsFoU
         pKU6UanqfQ/lQPziulO3N9QcJ7i/zZFTmJBijgAR0t6WTFmbaOrOaWQ3jRI5/uHOMfAR
         M5ewoT++h+xlMWlJfeLM/uoi4AUEGNNFGhnMp+oYCT27BHU6ysHahZZigzLjbvNwC7R+
         WMmMSupmwM2420XQ7/06RPwzYqD97n2E7E4gsCpjfH0+UuXoXq8R2YeEZXRJO/g9Yj5a
         Jg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5PkaNBYMe52pqkGLaMvjpa7+HJbHX8Bg2TzFTyglV6p/UppJmU/onV7G5dtuwGujtZFkSOLdJNhfHSdYx@vger.kernel.org
X-Gm-Message-State: AOJu0YwmC4gxGQUoX7RG4hD+FTk9JweQux9SpnbsD70DbYqSDpRTNUL0
	9i88gj2jr/aILzJE0ghhKChY81Y52a5U9cLOmg33w66upys/+vzawJi8kB4ptdMbv9g=
X-Gm-Gg: ASbGncuq2jX8mvF4Bu+Uv5reGwIvt1tNrjl9SlR4UbB6k733xSHEqMJDHxX6JLrWNU9
	uQsEpJj1aoZlLMueECJwMMxIDy45EU9IajELeGKK1nwEd7ELgnwsXktb1rBrV6FcXpuX7QcQpCk
	u/5aS/pIB2Z4XxIdicdax/tQRgL51eyQSK8KBTcZnyfBfV0X9VyVK6aPqtRgTr03PMyTdfvQ/TG
	QMjDTdNtLu9B1+W7Q17Zd4d32Rr93bNY1our7lJV+yfTgFFYiLt8NqMJjmUWxvLUaz0gBxcycxU
	5VJsr/6tyQwpc0Pw7FGK519s+lsnDSaZurmUo1ADW6cSTQ/gnJ5Bxfky+heqQ5NZsmfnGWV65Vy
	pQYf7exXsTFe+/OaeeYPn908aU4aM1Lu87CzjpqMYwijSDWVS43skvqSH2TWsmcc=
X-Google-Smtp-Source: AGHT+IHhek7qLMtG/D0lLB216ukv1XprlpVNWNYygMd7NFMy48jfNMcwOJb/6mt3RoRrKwpkALkG4w==
X-Received: by 2002:a05:600c:4f4e:b0:459:e06b:afbd with SMTP id 5b1f17b1804b1-459e74b6367mr50737565e9.29.1754561493918;
        Thu, 07 Aug 2025 03:11:33 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8e9464f46sm12001442f8f.19.2025.08.07.03.11.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 03:11:33 -0700 (PDT)
Message-ID: <40d543e4-e53d-4289-9b87-5ca8c0139bbb@linaro.org>
Date: Thu, 7 Aug 2025 11:11:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] media: venus: core: Add qcm2290 DT compatible and
 resource data
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 quic_dikshita@quicinc.com, quic_vgarodia@quicinc.com,
 konradybcio@kernel.org, krzk+dt@kernel.org, mchehab@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250805064430.782201-1-jorge.ramirez@oss.qualcomm.com>
 <20250805064430.782201-6-jorge.ramirez@oss.qualcomm.com>
 <4chbcvub4scnv4jxjaagbswl74tz4ygovn3vhktfodakysbgy3@kukktkwd2zsr>
 <aJHgh8mon9auOHzi@trex> <ce9cf017-5447-457c-9579-700782f9f0c2@linaro.org>
 <aJRMUzF0GN2LFIZd@trex>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aJRMUzF0GN2LFIZd@trex>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/08/2025 07:48, Jorge Ramirez wrote:
>> There's not alot of value to the user in that configuration.
> I dont know the user base but when I originally did the code (v7) I was
> thinking about security conscious users (signed firmwares) who might not
> be able to switch to the new fw release so easily (unnaccessible key
> management and updates).

Since the driver for the LITE hasn't been upstreamed the # of users must 
be ... zero

---
bod

