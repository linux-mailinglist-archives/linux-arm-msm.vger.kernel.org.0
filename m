Return-Path: <linux-arm-msm+bounces-79572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4494FC1EA69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 07:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFA923B58BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 06:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98641332EBE;
	Thu, 30 Oct 2025 06:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kge+qA/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13CCA32E6B7
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 06:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761807552; cv=none; b=Khu9pKYrwMvCzAMCFS895MS7JfYaiB7geUJH9pmMOAw9qvejiSAcFPgxyW6Sd90oPiPD+HmR1w1Jur/QF3/O6LVvonVhzOUK1ilz1kqLN6CvOCSsLU3Ouulluoj/eJGJEU243Ih4dybFJ+aQT9FpGuNoQ9ndcObBjhnViSxTCf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761807552; c=relaxed/simple;
	bh=+BXNpvMSYXQ5gkRV1Igb+qGK/PD3CybD10G8Lpfk3ps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KFUF1Jjqu+NUFPqaTpUeXME5L3lvwvs8/K8PO03TDQ5mdIsyHqRPN3fO4g1SbKhRGD+ejLuvqMaTg/ebHpdP7cxcWEcYwULE4t43byAZ7qn8gaIfvjgIlucnuPHxVLu49hwz6vk1yR9FnAlTy0zUeKR0lAAsRLhxGW2dNJamZIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kge+qA/p; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-b6cea7c527bso535935a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 23:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761807548; x=1762412348; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O2On5/uZ00EsAWd87Xl9UGDQOXgXaq8KavS45zELduk=;
        b=Kge+qA/pOMCaxqH7lK3oJGhfvVmRIb/otUk36KQpWVzdRX/tK1sOEZozNe+9CPOs6+
         QgJNuuikkYWVUVX2weUTlA3+MXmFhnlwhi2TFiDLlm0p4jFOaYxiB8ubc4ImS/Lm2HtL
         9mEu5hM/GvdRcqNAEyaGOk/gsHe9XDGVRMlrQX0xKTh0eJ1nbzJ9ylUI2sGMxmeuoF+N
         otLrY7tu9aFT/YFc/3mjCV7oWayhgfuFHatG+kjXP4ZiHTs9Z22rF03TJteFMoNBhRPa
         FK6hXTjxjfBX5rcK5FMar7Vwh4XgIlzVZLBgh5dxFJzrvHzjYcAmPnJSD9aEWo9kCqOw
         4ofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761807548; x=1762412348;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O2On5/uZ00EsAWd87Xl9UGDQOXgXaq8KavS45zELduk=;
        b=duV7LZaEwprBXc/x0O2nXaxpo+dwWWzo9WOtrp3jSKquaEugrylomb76ac1mCcQRp6
         h0gzDfygufNIIwT4qr3lGS3m6jUNYp28JJUk5wxp1A8bbXTADEAyFtnk4/b7pSM4PAfq
         VVNlT2iS8znt03PGiXVe0ggT/dv9ezfpA2AFwXbL18S5EDLz1meh/4eddRKYD+7oJ27T
         m8box7S3A6TjfmU8gMZr2F2a8NZLzK5G5a8mfwla9AVxKzXMipXriqE9v69UZa4TjCOO
         aFo56MVF+crkKVQluRAEGFQ4zHW1PMAqf/mosuXQHV96mvkXEKfgvTe+PrXAZG/kbXfj
         CJTw==
X-Forwarded-Encrypted: i=1; AJvYcCUJXbW5b7x34uVUwOYbP+i67CIeD/tsBYUaQ8zIA+Joe2KYwsVGWJJwhZW3rtPCokvkttUAymTomUBHCquB@vger.kernel.org
X-Gm-Message-State: AOJu0YzBTtl7Wyf/EQYqJYRrSnIOfwCqtSunWCf00FdobJbzu0MJ4KoZ
	RA8znu9cVjAUu9DI5cIwCTLpLGUpCoARXrcV+B+GGj0hJThUsh7Ci+J3
X-Gm-Gg: ASbGncsm45OcxxCROgqm47B9sRGUqM646hpDjYWWlm1PxHlogYjXBNKs2x1H4X6lqde
	kPp7QKDNx4Y33WPfHDPQkdep300AWNcrW8VZrNDqsHNTSfXybO6sGuPJl+tUbmuDfETAsvLhvzH
	GZO+/9PIlntnSTLfrbAB/VvHCVsYnA2xUUdRI368XRZ3tWflsDFbeWCDuDpfiG+32o2jzuZ+Pyj
	lIjPjdF8RZyz8qOIbkk2R0O9Gyc+bUKmHWNsfSsFFUwquNm9WFplir29wPy/vz6XIZoPG96ba0h
	PAG/SaT5fOFRsKcEEY8MNg+tw4w+yAT+AYvnv28Fi8eDxSy2QoE8+uzwY2EfF5sfZQXh+A3924C
	3FllrIvkzghyLHDw21pl2yptRSH72ZppQYeFe4prMPHV1of/QvGG9DCbUdJUb+tMyf7cL4r4oIR
	J2d2AzsRUbGGkaP6s84VxzFBASmirpUAeiVcDdkqAjroeJA+nkw2J5xw==
X-Google-Smtp-Source: AGHT+IEZNLk5umwmBOUCw1YoD3/cw2kbTnO1hk91vhVghFo2XMH5JsrjRDL7YnUDlM53qfRU+p5zXA==
X-Received: by 2002:a17:902:d503:b0:26f:f489:bba6 with SMTP id d9443c01a7336-294ee46ac8cmr24375645ad.50.1761807548302;
        Wed, 29 Oct 2025 23:59:08 -0700 (PDT)
Received: from ?IPV6:2600:8802:702:7400:90ae:1623:a8e:9839? ([2600:8802:702:7400:90ae:1623:a8e:9839])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b7128b63b05sm15663848a12.20.2025.10.29.23.59.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 23:59:07 -0700 (PDT)
Message-ID: <59cd28f3-f2a4-435d-9b13-3d56b1d1299c@gmail.com>
Date: Wed, 29 Oct 2025 23:59:07 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 0/4] arm64: dts: qcom: sm8750: Enable display
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mahadevan P <mahadevan.p@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 quic_rajeevny@quicinc.com
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Abhinav Kumar <abhinavk@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <w6f3s56gx7psqgweuntqvkzrot7elhc5pdrxhvenukzwyt5eys@fndmaszfbo5k>
 <921afe20-42b1-4999-b5c4-035669dc831e@linaro.org>
 <32eb3b4f-b2c4-4895-8b48-ade319fd83de@oss.qualcomm.com>
 <2db06bcc-f04b-4a57-afd2-1d0c665d376a@kernel.org>
Content-Language: en-US
From: Jessica Zhang <jesszhan0024@gmail.com>
In-Reply-To: <2db06bcc-f04b-4a57-afd2-1d0c665d376a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/28/2025 11:27 PM, Krzysztof Kozlowski wrote:
> On 29/10/2025 07:20, Mahadevan P wrote:
>> Hi Krzysztof,
>>
>> On 4/26/2025 1:24 AM, Krzysztof Kozlowski wrote:
>>> On 25/04/2025 21:34, Dmitry Baryshkov wrote:
>>>> On Thu, Apr 24, 2025 at 03:04:24PM +0200, Krzysztof Kozlowski wrote:
>>>>> DTS is ready and I consider it ready for review, but still RFC because:
>>>>> 1. Display has unresolved issues which might result in change in
>>>>>      bindings (clock parents),
>>>>> 2. I did not test it since some time on my board...
>>>>> 3. Just want to share it fast to unblock any dependent work.
>>>>>
>>>>> DTS build dependencies - as in b4 deps, so:
>>>>> https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com/
>>>>> https://lore.kernel.org/r/20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org/
>>>>> https://lore.kernel.org/r/20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com/
>>>>>
>>>>> Bindings:
>>>>> 1. Panel:https://github.com/krzk/linux/tree/b4/sm8750-display-panel
>>>>> 2. MDSS:https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org/
>>>>>
>>>>> Patchset based on next-20250424.
>>>> If the DisplayPort works on this platform, I'd kindly ask to send
>>>> separate DP+DPU only series (both driver and arm64/dts). It would make
>>>> it much easier (at least for me) to land the series, while you and
>>>> Qualcomm engineers are working on the DSI issues.
>>> DP has also issues - link training failures, although it feels as
>>> different one, because DSI issue Jessica narrowed to DSI PHY PLL VCO
>>> rate and I have a working display (just don't know how to actually solve
>>> this).
>>
>> We at Qualcomm are currently working on bringing up the DSI display on
>> MTP. For this, I’ve picked the following patches on top of |v6.18-rc2|:
> 
> Display on MTP8750 was fully brought already. I don't understand why you
> are doing the same.
> 
>>
>>   1. All the DT changes mentioned in this series
>>   2. [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
>>      https://lore.kernel.org/all/1154f275-f934-46ae-950a-209d31463525@kernel.org/
>>   3. [PATCH v2 0/2] drm/panel: Add Novatek NT37801 panel driver
>>      https://lore.kernel.org/all/20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org/
>>
>> However, when testing with |modetest|, the panel appears blank. I wanted
>> to check if there are any additional patches already posted that I might
>> have missed and should be included.
> 
> Many patches are missing because Qualcomm did not send them for months.
> I was pinging multiple times and I gave up - my job is not ping Qualcomm
> to send their patches.
> 
> I have no clue what you have already, what is your base, what errors you
> have and I will not be guessing this. For convenience, you can use my
> integration WIP branch from my github. I already shared that tree with
> Qualcomm more than once. Please reach internally first, instead of
> poking community.
> 
> 
>>
>> Also, I’m curious to understand more about the DSI PHY PLL VCO rate
>> issue that Jessica had narrowed down—could you please share some details?
> 
> Sorry, I am not going to repeat stuff done year ago. Please reach to the
> archives.

I don't have my notes on me, but IIRC this was the byte/pixel clk RCG 
failed to update issue that was causing the clocks to default to a bad 
rate (despite driver requesting the correct rate). It was fixed by this 
patch [1].

Thanks,

Jessica Zhang

[1] 
https://patchwork.kernel.org/project/linux-arm-msm/patch/20250520090741.45820-2-krzysztof.kozlowski@linaro.org/

> 
>>
>> Lastly, I’d appreciate it if you could share the plan for merging these
>> changes upstream.
> I don't understand what you ask me. Process of contributing to Linux
> kernel is well documented.
> 
> Best regards,
> Krzysztof


