Return-Path: <linux-arm-msm+bounces-11006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76524854B14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 15:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10AD51F2367E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 14:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5310754BC7;
	Wed, 14 Feb 2024 14:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fGy/DMD6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE4C54BFC
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 14:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707919639; cv=none; b=UW4s8Gg27hRfPt2MX9/k2gFxYzQXNBDtkcb8vUzvS4Bm8jkq8jssPHTer46scoUkUcHalfrV5Vam3hviHwAqpRISTZsZY6Lk04Q9e/BXVTBIAMbP+ULwgzKBOmosEJlaBadYUEEkk7mKTdq0ENQgftJXlZVrCs7A1cj2NFF+vI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707919639; c=relaxed/simple;
	bh=7Ubyxpypb5WJzZVN2u8TTtK5nY9p7eYOo9MXL9hwfsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUKU9cDTXctmwdRaihwj0xP2+rX6pW0Nr9UwF+bv0dpPmETwccILtDY+dhSk9eYeqFIN0ne6eObTGci0/YNa8XDHCX8zmvF2/yASoh6G6QqhFUk2CJIiSlunLPzJQdUEcD6tJhw0gqwBcbY0Wwd43iUDqIpmzJ5GvWH0iUp7iMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fGy/DMD6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-410e676c6bbso15669825e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 06:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707919636; x=1708524436; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mzLCkT3Edbyo2kgMkRX8HzJIBRMOGYcfnWVhdPfle+4=;
        b=fGy/DMD6wOJVj8U99P54R3mUM6u23eGaYZDL/kbxIjZeaETJbwt1KL+wOGPZJX3vG2
         FvHHLOL00siVvoqfHoSYLUR/pghW3VxBnPUZ3MM1ugB+wT/CYZAvv9G3BfjKwVXwaHfX
         rdSWy/8V/uQMkysjlSnmR9E54TOUtz2uz/neOrCU0McH/TT6QxvcVfooHsxD34s9qPMW
         7i4ANBwbqRwqzVykJJ/TROXfFyGBhwbAgJbnBpQBT292cJEMsAOZ5mG2gVHVRmfnz9L5
         brZE4hwxhA84sA0oV7743FjnteK7aQUXN0FKZW6unC5YVub2iEWsynEYHEQgKdG4iwf0
         mAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707919636; x=1708524436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mzLCkT3Edbyo2kgMkRX8HzJIBRMOGYcfnWVhdPfle+4=;
        b=c4CVGKFSiR7Bzbdmx8pQUI/xcCtqYE8ToNedH/dCUVtuifhDrsre9o8/CGEZzcaMLa
         RqxMd1mPPuS6uPGuIITC9Oyha5acYlVjG3jsstzf6V5X13yueJI411JPzrwUIMe4nQk+
         LitMSUXL6EbiNR3fxYwab6fJNWe7cvzIzJwWaGmQbTywQjPMx9DGPu+0Znn/zHgAVJsO
         UIp7u5KQ2JdLU7fhvcReTmkQIzO7a4cWpUCD85ZzVtopKMrto7zFeo4BZYvWYR3yOUDM
         /1+BCub3YTrO85Zad/kt25lBI6yarej2Mc0pntJzApRetqHAQgsURrXfYmE1lK7NDg4W
         0Swg==
X-Forwarded-Encrypted: i=1; AJvYcCVuiQcK9cj8k+0iCalblv6cpFa0JvSuZoyFWJzg1lp+HoKO/HY/cKxoxQRD/IFvfNtwo6HAwyadF9pV6gzxf3DJwa8ON8QtU5jjFgg2dw==
X-Gm-Message-State: AOJu0YwOM4aj6GzgeNYmIRNa0lntF90Axxc4rahuE7s+V9/maxgqQ/75
	T/AC1MqFuFDS6F8x7QeiVaCIMHsB9mSGJ/PoYQnm7kNsX/AVUN2H4mV0QPHO/44=
X-Google-Smtp-Source: AGHT+IGAuh0C9NPqIXTbCFmGeR0IHyJc8CaKb0LJGgi0HwGox1I1a0QhshP6cFVf20f/7NiuTP/wMg==
X-Received: by 2002:a05:600c:5103:b0:410:3bb2:67b4 with SMTP id o3-20020a05600c510300b004103bb267b4mr1963930wms.28.1707919635730;
        Wed, 14 Feb 2024 06:07:15 -0800 (PST)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id c25-20020a05600c0ad900b0040ffd94cd27sm2018672wmr.45.2024.02.14.06.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 06:07:15 -0800 (PST)
Message-ID: <f38468b4-8b16-4180-9738-0a2b557651a1@linaro.org>
Date: Wed, 14 Feb 2024 14:07:13 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: qcom-rpmh: Fix pm8010 pmic5_pldo502ln minimum
 voltage
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, lgirdwood@gmail.com,
 quic_fenglinw@quicinc.com, quic_collinsd@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240214121614.2723085-1-bryan.odonoghue@linaro.org>
 <13baed68-1014-4a48-874a-94027a6dd061@sirena.org.uk>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <13baed68-1014-4a48-874a-94027a6dd061@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/02/2024 13:25, Mark Brown wrote:
> On Wed, Feb 14, 2024 at 12:16:14PM +0000, Bryan O'Donoghue wrote:
> 
>>   	.voltage_ranges = (struct linear_range[]) {
>> -		REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
>> +		REGULATOR_LINEAR_RANGE(1808000, 0,  2,  200000),
> 
> This will also offset all other voltages that get set, is that expected
> and desired?

Yep, looks typo in the original submission.

ldo3, ldo4 and ldo6 should all be 1.808.

---
bod

