Return-Path: <linux-arm-msm+bounces-23036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF1590D24A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 15:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 556B928696D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF4D15990E;
	Tue, 18 Jun 2024 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BD2DLsfg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618DD1AC233
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718716661; cv=none; b=qUJRGIvIpoBhzZE7KOfG4+0jDEFft5dvtlWydLRqirX7BNaeSfIN6BB8yu5QmycfzYMo5UeZcjqj0gAbuVplssblNr4kMm0szWcA0xICkMe+F4DP7iS3DpbyrLmgRhBP9QbGduOSfzEittRVrcTSARfZ5nXpujfeHiG1HveUyWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718716661; c=relaxed/simple;
	bh=dYYiaXmFOEbFoZ+97yJjlwFWE+IY/NPfWJW84IF2A/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CihUiQjHc8BOfLasgHWkwFIR3bwLGd1Pzb6rWWC1Jn7ftTUByZ8bi+6kt5vw9kadsTuq8Wh4Nqz83iQizk99cf88GWudyEXGNe3wsvoCR9ln2XB5TRSJ22vzuLdGtB/UOW4LFcx/ew00YdOXtuutSM+lw2wlVuOOhuB/y+RjHwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BD2DLsfg; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so64024911fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718716657; x=1719321457; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mk8uewFO0KRxxLg0+mDDtwNCg+MZ1kNFg2DyIG8z5qI=;
        b=BD2DLsfg/S+kmiLGqtuZHf42DvawUOGzuHmF5CbUBrcklV/hnLllOhARLNMoaBYjCu
         zXBn46jstgY/CLZ4EamqmHJj5KJAU6O4wIhgNbFnRPRPPhyC4RSH/LG+DnqpQOJJ+nWr
         p4k6JR4FkTLjpiJT37yFQAlyc2qiY+kV76m18gNngRXS58YSae+ZCX5ZXMHNx2ut8Hye
         REzJ2cnO/9LLLF7f7ilcVMOsVZYG/Q5Y3Kw2aiO3BSrUIqNs7z8ldnO8gdpM5lNbE9PI
         xfTuOpyLjrV4KSwNx32RnTs6CKxIJnS7rQ7xZT+vMOJOFTSUqCX8e/BsEz/h217NVbL/
         TMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718716657; x=1719321457;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mk8uewFO0KRxxLg0+mDDtwNCg+MZ1kNFg2DyIG8z5qI=;
        b=QoH7yMhGdvk5OmFQDJ0Aj7Wk/GCPm44xOklmk6gTrNPzS4bOQdw+eqU9Ot/paPD9fo
         D/cWMjsd77aO7FNFpGaV1t5waKCW1YROX+TxHhXW5jc3w8Gh2q34Bayy8oaTBg1mvM73
         Xk/c/NrANMfLODYRTzzS7EgW0/i1wwGR0sU1aXxTP+akKz/UNX69eBeAQpzd3+UVsje1
         USxT2Xb9tPX9QnB1YZD8fQ3gq4DqswjJNMvlWZXl2Q7NCZVtJhosUSR8gtfEn/tVAXJ+
         J+voNwdKKIDaYa98jijzV6k34z2j7nEMIIXLxEICjnVemknjOKwc25CDMCtd9mMT/gkW
         o+qQ==
X-Gm-Message-State: AOJu0YyUuyIm3G+6IsDjxhc0+RxMXZ1W9Ba7HTj3NQZYkWBjX0qodfWI
	nBu9YizLEh+D1/gLifLZvKmu+lvSbHfZoC+wsvEz92EOnX3sLY6ulIwq65qjZ5M=
X-Google-Smtp-Source: AGHT+IG+7i5p8fTNS+EDQNmIzyHmx4/2sNcJnQQ9IiKL3mGkiZcYftoS1PHhwtxv0bBDOcyFjgA4YQ==
X-Received: by 2002:a05:6512:39d1:b0:52c:8449:8f01 with SMTP id 2adb3069b0e04-52ca6e56eedmr12254798e87.12.1718716657140;
        Tue, 18 Jun 2024 06:17:37 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2889d38sm1510528e87.303.2024.06.18.06.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 06:17:36 -0700 (PDT)
Message-ID: <e1ab08cb-4373-416b-9e04-b6ee5c03d112@linaro.org>
Date: Tue, 18 Jun 2024 15:17:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: Skip retention level for Power
 Domains
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 quic_jkona@quicinc.com, quic_imrashai@quicinc.com
References: <20240531114148.8550-1-quic_tdas@quicinc.com>
 <99967eee-da39-4a35-b80f-a78fe3c10733@linaro.org>
 <76f0e79c-b100-4b61-b861-17b324e1e4f7@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <76f0e79c-b100-4b61-b861-17b324e1e4f7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 6/10/24 11:42, Taniya Das wrote:
> 
> 
> On 6/4/2024 5:46 PM, Konrad Dybcio wrote:
>>
>>
>> On 5/31/24 13:41, Taniya Das wrote:
>>> In the cases where the power domain connected to logics is allowed to
>>> transition from a level(L)-->power collapse(0)-->retention(1) or
>>> vice versa retention(1)-->power collapse(0)-->level(L)  will cause the
>>> logic to lose the configurations. The ARC does not support retention
>>> to collapse transition on MxC rails.
>>
>> This is not very legible. Are you saying that:
>>
>> a) transitioning to/from LEVEL_RETENTION causes the resource to be powered
>> off internally for some short time and lose state
>>
> 
> If there is a logic connected to MxC and the vote on that logic(MXC) from a subsystem is initially to LEVEL_RETENTION and then to power collapse [0], then the PLL connected to MxC will loose the contents. This the transition I am referring here.

Okay, is there *always* some logic connected to MxC?

> 
>> or
>>
>> b) the linux implementation of rpmhpd handling causes that transition to
>> include a power collapse step that makes it lose the state
> 
> No, this is not the case of SW implementation, it is more from the HW ARC implementation.
>>
>> ?
>>
>>>
>>> The targets from SM8450 onwards the PLL logics of clock controllers are
>>> connected to MxC rails and the recommended configurations are carried
>>> out during the clock controller probes. The MxC transition as mentioned
>>> above should be skipped to ensure the PLL settings are intact across
>>> clock controller power on & off.
>>
>> So is this a workaround for clock controller drivers specifically, or should
>> MXC never enter retention, and only poweroff? (the latter sounds like it makes
>> more sense given MXC's purpose)
>>
> 
> This is avoid MxC to not enter retention to OFF state.

I'm still not sure I understand. Is this to prevent MxC being switched off
while Linux is voting for LEVEL_RETENTION, as RPMh sees no other user and
decides it's okay to cut the power?

> 
>>>
>>> On older generation of targets which supports only Mx the logic is never
>>> collapsed and it is parked always at RETENTION, thus this issue is never
>>> observed on those targets.
>>
>> "On older targets that do not split MX into MXA and MXC..."
> 
> Yes, but that is only Mx :).

My point is about the wording.. There is no such thing as "supporting Mx".

Konrad

