Return-Path: <linux-arm-msm+bounces-23409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5A3910D8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 18:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAAF11F210C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 16:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D281B29B6;
	Thu, 20 Jun 2024 16:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pCtwnP2J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6712F1B14E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 16:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718902192; cv=none; b=UhmJK1+f7oq0M5s+ocyxCz15mR7hjtjMBek6dStOPEFHz2WjLkR0BO7CrbjnCwt4P2/PD7tfIUqOeFsNRgQbbtB6tYK2OibObdfiX3+UbDTgxVp7ALYC9Ixkbe3TO8x+2+pRNpvQSUDD7dZ9GjorTNFLb6eXt+Mi3mbSoqps7Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718902192; c=relaxed/simple;
	bh=K/cfNSTDSkBQxZsTkqMrHOm6LPQ4yATi/xG2niJvV5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cus55o0pznHIRjK51k5zNbBtFgYU651OEt4hC08a4A/dQE/a+ARf9zJXVsJAY7YwFj/8HSswUT2PihLrgF4WycezAUSjXkQKHxi5mCKTaRp6C82tZUK9AR4htxrs5LUKfVtJgMK9svMzK1OVVPNEhkBFJ/XhF1U7fikLB3sno8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pCtwnP2J; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6f0c3d0792so137051766b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jun 2024 09:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718902189; x=1719506989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GqQopnvWVUJ77bCPyUL9r68U4uxLIHub62go1lzROFU=;
        b=pCtwnP2J21ZnD9BczwYhqtGHXePBF3JUCj1Cu7jTT0cEpaajtbdsrT4PodvM9JDi/V
         8Jr1h7TymEmi1yjWbseFz/+d8jsgZXbrwAy6RBrfwXH5zZQk2oxJEZdwKF/Qzwdp+Dwq
         2JsZ/P5YspRDpCCzWNo4RNzkWlsKmcTFWk7itP4R1pRDJskkKPa67tMlilB3qmfVjw6c
         Wzh9XpsTxryA3iK6iSOj1bX5BiQJ/Aq7TD06bzLT6+1GYOVauFYRlV4+ftAnzHBn8dti
         nfdYKyTR1r6q8BMMHqGW9ojloANAQz8LB2G0mOdsAlpydId/wEf/+/YH1h72RMAnb32J
         b8AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718902189; x=1719506989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqQopnvWVUJ77bCPyUL9r68U4uxLIHub62go1lzROFU=;
        b=AbEiCnhQjg9Bcxjzyrw5M1dZqST87xlTyYVzae0/cycKygOskojj560FvP++RaWZE5
         moKsXi8NOZXrtsDXpAvBd7/IuUrmYfM+hXhXayw6q5zvKr6YQa5AGDWom9fZr8iyDboa
         Azzb2DyMmpIWtouZlQHbS7VgIFoWtiiIly09Vjjraoa8IvRjOEuP1oV0YplBjp7boeyp
         T417UCpWtc2UTCfFmCePTwS2DVdbLv06PnpVvfoYNMGXLU5HGvCKKZoW0ikeAE06rLY4
         cYCUxKT45NZbWUBeX6gqXf1mizDphyWkmaXKIQKJoWL5KQxRduHPNnbM1XzfaWiXESlJ
         HmGA==
X-Forwarded-Encrypted: i=1; AJvYcCWqgYxms3/+uJQA3wsRZqj5BRwp4iQeyTupkHRdFI9tdx8FWALWCVvu7/jHc49NeJG9NizaPnETsCIZQ8UXs776CTDaycO+axTEEFbd5g==
X-Gm-Message-State: AOJu0YxQB8julzJu4ZDBO5KhvX0gtejZGwoWD6ZVEAWoLGIJJkyYPZCP
	fM1/4ZMMOEQvejSjIt2ISHOsjYfoP46knBCMxrk/uRoq89oow/3YtzqihHmGM4M=
X-Google-Smtp-Source: AGHT+IGysnIrSKn5ZsCRoX6C8aN64NnfdvBmRtWtf5nKzRPFf3y/BPDA4dK2cGa7MsKDCazb1HAtkw==
X-Received: by 2002:a17:907:7716:b0:a6f:5318:b8f7 with SMTP id a640c23a62f3a-a6fab645215mr361554666b.43.1718902188581;
        Thu, 20 Jun 2024 09:49:48 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::ebdd? ([2a02:8109:aa0d:be00::ebdd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f42badsm782858666b.184.2024.06.20.09.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 09:49:48 -0700 (PDT)
Message-ID: <35d9f16d-c009-4383-a616-9b21f0819b46@linaro.org>
Date: Thu, 20 Jun 2024 18:49:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: set
 role-switch-default-mode
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240619-rb2-fixes-v1-0-1d2b1d711969@linaro.org>
 <20240619-rb2-fixes-v1-2-1d2b1d711969@linaro.org>
 <CAA8EJpo94qg0dDR-H64v0yC7jLKHuD9O59m3hG2tNR4v3NAkLA@mail.gmail.com>
 <c10b1343-921b-494b-94dd-6f5acc894e6d@linaro.org>
 <v3dgoeybewgegi2xuixhaq5c7jwju6wojrmzcq3rtb5f5r5nfu@6gj4tfz5blx7>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <v3dgoeybewgegi2xuixhaq5c7jwju6wojrmzcq3rtb5f5r5nfu@6gj4tfz5blx7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/06/2024 17:07, Dmitry Baryshkov wrote:
> On Thu, Jun 20, 2024 at 03:30:29PM GMT, Caleb Connolly wrote:
>>
>>
>> On 20/06/2024 15:15, Dmitry Baryshkov wrote:
>>> On Wed, 19 Jun 2024 at 23:33, Caleb Connolly <caleb.connolly@linaro.org> wrote:
>>>>
>>>> Give a hint to the OS which role we prefer. Host mode generally makes
>>>> the most sense.
>>>
>>> Why?
>>
>> I guess this is subjective, but on these boards the more common usecase is
>> host mode (before we had role switching we forced them to host mode...).
>>>
>>>>
>>>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>
>>> Would it make sense to set this for all the RB and HDK boards?
>>
>> The rb1/2 are the only boards which lack multiple USB controllers. For
>> others it's fine to leave the default (peripheral mode).
> 
> SM8450-HDK and SM8650-HDK also have just a single USB-C port. My logic
> was slightly different. We consider these devices to be SBCs, so I'd
> expect that they act as hosts _by_default_. If somebody plugs RB board
> into a laptop, then it's logical that it should work as a device, but
> between the phone and the RB board the RB is a host.

Ahh I see, then yes perhaps it makes sense. I can send v2 with patches 
for other boards too.

* qrb2210-rb1
* qrb4210-rb2
* sm8450-hdk
* sm8650-hdk

Any others?
> 

-- 
// Caleb (they/them)

