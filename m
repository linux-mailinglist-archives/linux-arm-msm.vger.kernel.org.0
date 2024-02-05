Return-Path: <linux-arm-msm+bounces-9791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A118498E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 12:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6616C1C2152F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 11:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5111D18E1F;
	Mon,  5 Feb 2024 11:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qSWqRmpA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1348718E12
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 11:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707132817; cv=none; b=CqaTF39edrMf//57Io2sgKdvBGTmxws6XjuQbIA6/r7gPuRbME0qDu/aAWiHxJhAqbFdIXR59wY5Z7KLaxyQuN9tAm5cPZZnNfLuqMnG8wFdtsBQfbWq44UOtRoQFKajCK/Z8If5oxmah2Kq92BmeV5z9ECrlve/e0QXif/QOFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707132817; c=relaxed/simple;
	bh=pqHr8ktcWjb7z6YkpH8/0b9yqCF/o9NhA+xa5c+rTns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Iw3H7I9O0jz0BSPigp4pPflIotD3cJfXnVGoz5qHJqN6exUgUlbKgXVFbGMY9jKvQEuH/Q40jVcvtdrDkWC5ra28PvOSreOtSN6OQeJzDM/8w7j4/0wOdvEk5K+ekDk0E7yTQ3ikmMvV5bSiKn6eICHBTXeaQEoKPbPCRr94ZEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qSWqRmpA; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a37ce4b2b23so66506866b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 03:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707132812; x=1707737612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o4RoA1rH4rB2jaS+AHrZsou+aBL79EHdgTVoMA6pD7E=;
        b=qSWqRmpAAV3ysP0eoc4GTKQEWXviQk7N/wSa/+WeujTdNfJfwXKUgIai/rFr5hOVhe
         xeHemWEQGu9MQ/+hkA+jRf+NRHRbmmu8txibA1wBG1UbbNK8AynuW9PZ4R7r6ljNqqop
         v1NGt/kskHMzVqwv/XP3QAn0aR+RgvyoNdeVpf5/9eUGFTuvXoU6gm+1BLJt05b+vovh
         kMh/NWlT626RP/4tHiv2QrHGcq7kYDRgWTpsUR4uAYvOCrZNgeMR7GAa219ZduYJoVXB
         ypgzteh9zBdEGLW2IsaaC1TFxOzjNwom+ZQ6jN4ttr7xM/Hh7zS1b1EyXU+aHh4OeIi3
         Bd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707132812; x=1707737612;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o4RoA1rH4rB2jaS+AHrZsou+aBL79EHdgTVoMA6pD7E=;
        b=Pv1eD0u+KHsfVxrpz+0aa+KWqil4oT56qWrNj77uODQ2aR0+tzgl9MNYcW7msWdQpT
         RszW1TINCllOi8I+cLJHUzLsjG0oEfTcnHeIIoBbjChmCvHn8Viwj7suq0nVK+smYerO
         DwFY46V464bFP5ee+x6JMGqUb51jsKYlNcDBe+NGigCaxteS3i9uf68Jr0qyKR0xDLWs
         VMZiF4aYBxYgbwB7PrOYbnGwq4WS4pKXrMnbDrioMR69L/269LXugTTKIMcDBXHibCLG
         Wf3cotMF31y3z+mp2sqQipkkuOLw4m6tyWPDNwT+PKJcKRFIUmqXk6NVP9mg026Rtnrr
         EV7w==
X-Gm-Message-State: AOJu0Yx4w59gaPrey3Z/W3a+RuLvA37KhcJCMFlNbTKignITqmAKCBjs
	eXhkynpCGIGyzIUiyHJ/3Iel54h1dUPdL98UrNHwNgOuayyvqsOnYWnDYVyNDUs=
X-Google-Smtp-Source: AGHT+IECEQfrfiKwnBW6JBBmnfYfx4ll9x/HMfLGeAGA+z1tHhkvEOdqDeipnNcAozA5+TVebA/rUw==
X-Received: by 2002:a17:906:31d9:b0:a37:2176:251d with SMTP id f25-20020a17090631d900b00a372176251dmr5226974ejf.15.1707132812195;
        Mon, 05 Feb 2024 03:33:32 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVIKDymKFwpaw0owuIVjaaVHIJEixWT6e2nh/2aI2NxesHM6Fn+jsrih0eFIHj4iw2Q8nSDuTOVNNMTJbcvfaJ4vHgwbFGdQi+SXcneuAkekZomVLErSJNvVfa3xjtpJpx/As4NmOezkfAYHyVFX9I6r2xfVySi1INlVPX4Ill98BCq8z7zJmT5KY8LlOTqWOg87x5QYxnA6IYBR1Uj33oRmG2pYTHr6Attvqd99Z3+H0WsKrP5Xe5nO/RYVBPH7Rb75YSDgvzQ4M5ZttkjblpYJ+5XHJYn4OWSZQBbT2a6qboAZ6C2VSZMx7aaoNakIWL+dX3wy1VRPSRW1S/N8Hg0cYr6UCz0Z4AXrqbz33FftZ5P/1jq3Jj/5gkGzlFMMdhAa//ikgiYLqrt2VwXz8+gHrsePFB6fUt1cuVtiaEB7s+tQjSRjaFuFDQKavEaq/YmOWP077j2SK981wdKKxM+K/x9gbzZ9C59W13cOIEGXbPiGQ==
Received: from [192.168.159.104] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id g9-20020a170906348900b00a3522154450sm4299604ejb.12.2024.02.05.03.33.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 03:33:31 -0800 (PST)
Message-ID: <6fdde54e-12cb-442c-9dea-d1d6cbca340b@linaro.org>
Date: Mon, 5 Feb 2024 12:33:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: gcc-sm8150: Add gcc_parents_0_ao support
Content-Language: en-US
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240123-gcc-ao-support-v1-0-6c18d5310874@quicinc.com>
 <20240123-gcc-ao-support-v1-2-6c18d5310874@quicinc.com>
 <d31a52fc-9073-483d-b84b-1f02a5698a89@linaro.org>
 <77903574-696b-90f9-f136-be5c5d219ba1@quicinc.com>
 <5ae84692-b05d-4a43-aabb-4d2e7d9926d5@linaro.org>
 <04788b2c-a212-b8a2-1124-d904f2f61f5d@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <04788b2c-a212-b8a2-1124-d904f2f61f5d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5.02.2024 09:37, Satya Priya Kakitapalli (Temp) wrote:
> 
> On 1/25/2024 3:25 PM, Konrad Dybcio wrote:
>>
>>
>> On 1/25/24 06:49, Satya Priya Kakitapalli (Temp) wrote:
>>>
>>> On 1/23/2024 11:17 PM, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 1/23/24 17:34, Satya Priya Kakitapalli wrote:
>>>>> Add active_only support for gcc_parents_0, this is needed because
>>>>> some of the clocks under it are critical which would vote on xo
>>>>> blocking the suspend.
>>>>>
>>>>> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
>>>>> ---
>>>>
>>>> Is there a need to keep gcc_cpuss_ahb_clk_src around? Do we do any
>>>> ratesetting on it? Should we ever turn it off?
>>>>
>>>
>>> The branch clocks under gcc_cpuss_ahb_clk_src are critical clocks, which are running at 19.2Mhz causing vote on XO during suspend. As of now no rate setting is happening but this rcg is useful to get the exact rates from debugfs. Hence this change is needed to avoid XO shutdown issues.
>>
>> So, if I underderstood you correctly, this clock serves no purpose other
>> than getting rate?
>>
>> In this case, I'd say we should de-register it from the clock driver and
>> use debugcc [1] (contributions welcome!) for precise measurements.
>>
> 
> Although currently there is no rate-setting happening now, its better to keep the rcg modelling as is, considering that it might be needed if some use case arises in future.

We don't tend to solve imaginary problems, please lay out what it would be
used for, if at all. Then, we can assess whether it's necessary.

Konrad

