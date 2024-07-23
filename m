Return-Path: <linux-arm-msm+bounces-26862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C597939DD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28D4B1F230A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 09:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEA4150990;
	Tue, 23 Jul 2024 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vn1U5ZZs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4A714F10F
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721727001; cv=none; b=h/k/WCW9FCyTLI0mIZ99P/OYe+ClhKiMmHD28S9znQwijaztvnHBkogRcOh5nwIUoF/EJriO9N5kvZDelzaJ7jksD1QbSgQOpmCQ8WazjxSCFltRcBCC+1xx/rcCjv3vA/G7G+wsx2AsaPB+c+RMIfyru2lJm4ebrjetRtUi4m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721727001; c=relaxed/simple;
	bh=FAuZ0UAD+vdkUjJ0UlsabJSfZQUX4W2wFDKeefUEpgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HpHfo/1veWjCOmOZNBb33YT9slOKqtQay3UkE0Wz+r00J8xknw8wra41SU07g/FwnQVNl8SeFh8FUu1Law6hrlTHBSchu3fyVBdUjSD3u3N7d6ypNyi8JjFIW3FyMP7fKV61w5fuGGT9LDSlLlkjtKYOp2ghOMKQLRhxY7DXC/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vn1U5ZZs; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a3458bf7cfso4502841a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 02:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721726998; x=1722331798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vEOkvbFbp3f9Cjx9et2nB6QuzkeXuOLLdhC4BThQFM=;
        b=Vn1U5ZZsU9hWnaEzg8S6MRZrUZQ167gaEgEawz6E19Vmj5QL9k5h8ZnP0oBYF5yY2o
         5lpxJslsC0+ZhYLh7SUCP7MsW9hriP0gg1f6C6UBa5I7tjNel724WwW+PGhj+Swwimsh
         iJnZ920wbB2NW/MJCma5Vpz0+K2hz0cvr6PgeilDzauW/e+2NLgGGjo/diqkEPRU0dOe
         k8GPWOp2GZ4G7NBCKDTP6WduDrHB5KAzhY/u/JgqICIaGZWdTH85A2F9VCZeMWSo/prh
         mRS3CJ9DHr7R/uUqIvzUJTbeu+pp/VdDMlAIPgyQ3hQ8vuYyhx+o89lKMnBZ/wCZdXON
         lAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721726998; x=1722331798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vEOkvbFbp3f9Cjx9et2nB6QuzkeXuOLLdhC4BThQFM=;
        b=usj1jRQ9JzPIlS6kyZsJnbry0AE5nP6zOdYU8TqGVTVNwehKHuxuAYXD2erlKGPqT6
         NRQ6vDP3ZgZWYpAk0rLvSjDLpea5GsaYjPEjx9UuOft0hLsNL03slAu+mCu+8iy7WUHH
         2pxN+pRJy5yU1GNJENgwoeoVacQI6K6MSPkGHxGT3zKI4sRot4VLfH5wwkNTXMeocxs1
         vmvlpD02pF0nwq6aPrg7+DIz1y0+r0f0unAS6svJq6ecywvqGcY1fcfC/YqtdwHx9DS1
         9DmMcvTPDL9aYsVipdKbBxic9nZP3tKniU5xl9b+uI5w7pccIz343BTGaHVi9jquN4FO
         tghQ==
X-Forwarded-Encrypted: i=1; AJvYcCX37NTRCO+imsj+Lp158xMSFAdoRmYHcBjHHIBO1QNSIhh6Vum0cWsxpL4TS7AqsVnfJOEsg5QnRDgIO/9sFRfXW2e+Y0tqGnWAWHwvjQ==
X-Gm-Message-State: AOJu0YwARfyaiE51J8aIANBcQ3VqTcztJ7SAfzqT2y3tRWLCHVR1PcTi
	ZbyYUypn2EcCmou7rtRuucFao86ggSj69HrxMF2k7+0+lR55Vl0PGPzfODbd5N0=
X-Google-Smtp-Source: AGHT+IGrHFX9JiQx/Eykl83Z2R2uBLLYPpx8qq7c7tKOtjvgIyTkMQ510ZsluMgEq+if+UaXKvMqgg==
X-Received: by 2002:a17:907:9408:b0:a6f:1ad5:20e0 with SMTP id a640c23a62f3a-a7a4c2a3323mr642854066b.45.1721726998064;
        Tue, 23 Jul 2024 02:29:58 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a8a4de922sm84336066b.56.2024.07.23.02.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 02:29:57 -0700 (PDT)
Message-ID: <a0ac4c3b-3c46-4c89-9947-d91ba06309f4@linaro.org>
Date: Tue, 23 Jul 2024 10:29:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: Remove always-on GDSC
 hard-coding
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: dmitry.baryshkov@linaro.org, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-v1-1-fadb5d9445c1@linaro.org>
 <f0d4b7a3-2b61-3d42-a430-34b30eeaa644@quicinc.com>
 <86068581-0ce7-47b5-b1c6-fda4f7d1037f@linaro.org>
 <02679111-1a35-b931-fecd-01c952553652@quicinc.com>
 <ce14800d-7411-47c5-ad46-6baa6fb678f4@linaro.org>
 <dd588276-8f1c-4389-7b3a-88f483b7072e@quicinc.com>
 <610efa39-e476-45ae-bd2b-3a0b8ea485dc@linaro.org>
 <6055cb14-de80-97bc-be23-7af8ffc89fcc@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6055cb14-de80-97bc-be23-7af8ffc89fcc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2024 09:57, Satya Priya Kakitapalli (Temp) wrote:
>> I have no idea. Why does it matter ?
>>
> 
> This clock expected to be kept always ON, as per design, or else the 
> GDSC transition form ON to OFF (vice versa) wont work.

Yes, parking to XO per this patch works for me. So I guess its already 
on and is left in that state by the park.

> Want to know the clock status after bootup, to understand if the clock 
> got turned off during the late init. May I know exactly what you have 
> tested? Did you test the camera usecases as well?

Of course.

The camera works on x13s with this patch. That's what I mean by tested.

---
bod

