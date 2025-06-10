Return-Path: <linux-arm-msm+bounces-60877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10154AD445B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 23:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C3701736E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 21:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732D5267B04;
	Tue, 10 Jun 2025 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nfzyURAa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767E6267732
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 21:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749589368; cv=none; b=EUEXPuAkaQQ+AivttJLaUNSnZWy7V6PbCM+E0wEf7yasm89Fy+QAQWI/q/nJKA6y5u7oJ5VzyW+YRPOIJZyOdA3iw2zK4tEXYGPkN9kF5N9gu8OdRUyk7XDidmxNm7Ef5kL+JT6a8AwhIbq/F3eIo2/TJaYGrBT+73cWsUp12bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749589368; c=relaxed/simple;
	bh=qfhSjwvyRn6KR8oOKBXXu50Bff40BG2bB9yxr/8s93M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUt1jAYsTgaK0H7Jp/YY2K3w1qPYfMy0AME1+vTEsAwZUrstJyKHiwPqvbWvJ8buJIaJx8Ja6ya4Z3/sQtM9UQSyInJMCmESNTakRnKNaHrJzwHUcarquXzSnVb4zk0NQUuX3nOljXISkWPOxt2ChKHM5T2axTZpq9hWBdccr9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nfzyURAa; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553645133f0so634724e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749589364; x=1750194164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vEX5+m0SmtzPkAXHZnRUD0tql0bHqOfER1OA5um3tgo=;
        b=nfzyURAa3ozGMebl/W0JwT6lMFFWqD5gF6E5cooeyI2qhKTh2MBmE8fR/HHIDB5eKZ
         ZK17ByhiKIajULlZTtMXzkZJ9MgHRhcPvemmkvkdw5MQRdepNU2GdfWfk/jV3vzEofrJ
         UXEOdczJsBTn1Xtd2KuXoPcuhxMXykORPcMDRLwTaaeMr9r89GyeespKWKjZR4wAetYs
         vHd1AVb8uF+cql5Q5lLLCpuzrk1RsJuRr+nqUAUXk1l821OHC76r1e8Cozf+Of5kedeP
         2KLIKuq8EytLmLvaJxnsGehEl2EQq/uzqX7PDokMQoh3vL0vHkvv3eMTOzXO+Dwh1OO0
         irMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749589364; x=1750194164;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEX5+m0SmtzPkAXHZnRUD0tql0bHqOfER1OA5um3tgo=;
        b=ah3gpPFd/8DzGI8j7yM/eV3YeFBddxdVgK2LB9K/td+pr6IQ+oEo0kHlq0cIWDX9qR
         7lFDkScsFETbjURG7Jr13zoSE32Zru+kOK8c6s1NAeHdQHikxfUoe53DfZo01QIM1rwj
         1Z2zs8gIceX+9JkstnXOsVePmCYnSBYKhvoivrsaKNJPiFYlCYyxZs9dSkNEa0RDwDML
         JLolB7H9JQhfUKEPsZO23/I9v6/Hhj3a7Ft0hesABLltiHGzoTCr4usRJpGRPxz+yCC3
         iMZc4W9+BSVc8xBjR8z03UInJKR8QGEhMhBvF0f+5mnaA7FcEvRylV2LmZklTPWBkvAO
         P3DA==
X-Gm-Message-State: AOJu0YzhVKbe/SyAZ/n8Vsovg2ZpnRJvovX7lzFifCTJ0V+i2FLrRkpA
	MVvwlCmAzriveqtPfzm3FS89XiGicSv8+yLnf5FVzAA/73B9LCzpq/TZV3SsFddSy+9xZ8puED3
	mKRMg
X-Gm-Gg: ASbGncvjunIz1Q0sLowlKdChuwlgJI6rt7s1iZnB/GhjTEfIbwNbXfPHFkIfHJg79Jr
	V7pBFD6c6zx99eZ6SsfLw9HK5POFWY7VIjoteexCIM2SnCdEqVxrmDmg0xwMrvd6ULIe5QOuVhL
	qiDRglfqXj2pIlaxMXNk/bFpb8KpW7PjI32ovjaDv9cSy+3McNLw4PiH0a11iRlePM/KV7ciMIk
	Qtq9S+ftttSu5NgBCOsMA9m677kWwycAZQF6bjasTeVE4MhPSSyPY/KkR6i23sEqiaJDzEiXC5w
	bOB1728+MdsLz/oauU5OasYLoO2hAGm85AnYEX57wDIbwmUxVFoxRF77SAvNTV7mFmz9jMXci3f
	iI8A7fjvTpg821rQK3qOkgl67cXMvQSURpWN5ALNM
X-Google-Smtp-Source: AGHT+IFEFIJWrRfj6+Pu7NhQKIOTBe12JY90TCUN9nzhGZ8nBRQCkhDsR7KECb1Mi5qTpg+TryH5fQ==
X-Received: by 2002:a05:6512:1509:10b0:553:3a0a:188d with SMTP id 2adb3069b0e04-5539c106d7bmr77460e87.1.1749589364478;
        Tue, 10 Jun 2025 14:02:44 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553676d7b37sm1686862e87.67.2025.06.10.14.02.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 14:02:44 -0700 (PDT)
Message-ID: <1883d9d7-26d4-40b1-9848-ae0477cf95c7@linaro.org>
Date: Wed, 11 Jun 2025 00:02:43 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: qcom: sm8550: Add support for camss
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Wenmeng Liu <quic_wenmliu@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 quic_depengs@quicinc.com
References: <20250516072707.388332-1-quic_wenmliu@quicinc.com>
 <0367d5bd-a42e-4b6c-b841-ba20190b3127@linaro.org>
 <dc4720a8-2f15-44aa-9a52-8440c7518328@linaro.org>
 <739bad1b-f26d-44a6-9cc1-eee28023474f@linaro.org>
 <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <dc82457e-de2b-43ec-a50c-08f7d8bdeff1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/25 22:02, Bryan O'Donoghue wrote:
> On 10/06/2025 13:49, Vladimir Zapolskiy wrote:
>>>
>>> List feedback from DT people is isp@ is the correct prefix.
>>>
>>
>> My bad, but I don't understand this comment, it seems irrelevant...
>>
>> The expressed concern is about the novel label name.
> 
> I mean to say the feedback from Krzysztof was that we should use isp@
> not camss@ and I agree.
> 

Let me repeat it thrice, it's okay...

I don't object against the properly selected device tree node name "isp",
here I object against a never used and very questionable label name "isp".

Please feel free to ask more questions, if you still find it confusing.

Again, I may missed a discussion about the need to get and use a novel
label name, then please share a link to it, it'll be very much appreciated.

--
Best wishes,
Vladimir

