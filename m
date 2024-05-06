Return-Path: <linux-arm-msm+bounces-19246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 247D78BCECB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 15:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE2D51F23411
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 May 2024 13:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C186763FD;
	Mon,  6 May 2024 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b="qsX4lcGr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187414EB45
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 May 2024 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715001514; cv=none; b=ibjMWMhm1pD6MYTIWLu9nStVk3YLuzoRhwHmyatpzI1rQKXFr0P0SD9j1nGVhmPveekscKHQSXicJUs2eF2h/jwXSzoDnnwdaPuswpGCcahwOqaIIIJxtQhNxI2BFjyq2euMYdymfO1JhttC9TTa9VhqXfVYb+wyHFdep2097vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715001514; c=relaxed/simple;
	bh=+gcC3XrKopVY7+x8hM7REzI5z8k8UA1xsaVjo+OXoGw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WPctwbkh4kziov8o7R2/NahyauMoRdMxEUjNRtH5qaHbhPvMh+y0GqFvaFFtfyymjm31C5p6TVq3HSxg2TVaO54Ix2nK1eeN5Nponoh8P2TwOgTHhjhflXUEduZH5CfbfuwNHTEsbtSZyvhp6w8IOxQNG+HB7idyG3lBaUI0af4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=freebox.fr; dkim=pass (2048-bit key) header.d=freebox-fr.20230601.gappssmtp.com header.i=@freebox-fr.20230601.gappssmtp.com header.b=qsX4lcGr; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=freebox.fr
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41b869326daso12985525e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 May 2024 06:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1715001510; x=1715606310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fbLk4eEqBAfYnW+4L9hnO8Mh3W5E5jUNZYMwae+Me8Y=;
        b=qsX4lcGrVT40pGHhQj0Q+TQvqvSkgrGAZec6GuMLBU7KYXkBheYv3csM3Ybx7Wr0Tk
         CEAvxGKNFXIeOKt4epirAgYPv4k2t+KliYKCTLLbwGAeOKxY1c3zCOcnwEOoJoVPYWCu
         ln3Audqq47lIGuwoDkxACTwKQ4THPcGgsZsyY6ozwYcII+uwwcJp4N+94J9HebzAq+QH
         vgcOg1c8eh5XAnGHec4xT8glsqHhzs1nS8aHMzBCMjlbEWGVY1pFkDV4D5PTyG6CU8nU
         Foo0M95qb+aOpQmOVjlPfmssWrZQBhRatpLS0btpQUG685q9OLa2h0wte4Eg2Cqau21U
         WpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715001510; x=1715606310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fbLk4eEqBAfYnW+4L9hnO8Mh3W5E5jUNZYMwae+Me8Y=;
        b=CFPYiXbv8IiEhE7q7hRktpV7elDNKNT28jgbSGQxPhEaIMhYyHONt3qGcADD8NqjG/
         y6Cf80Tpsyol1StJFJ8dzMcGdbFYdk5OsXnvvrPGWjwNZJuKVp2rKVAU4gN5iFWIjrge
         J69aT2BTMx4xC0D3fHwQzMA/a7MG8NALdF7ifcYL6OwKwOpkjMf+evpjgN8bjqBTMnLH
         96k71JOtIGz6Onvd/zS5kGZct5G3gGxSRJ7+5nHyLXUBf54MaMKfJimfMwI7yghkG7H5
         yfHQNRD2iaHhrz+/KNLU8kj5fjlg5luWTBdIHWI+2vgqcxezuHaZ2WynxOWv1/vWIYxC
         DaEA==
X-Gm-Message-State: AOJu0YzEyb0iFB37Eo64EN1cgTJA/6ND7kGUe4u8xCIGuyxWgjgvzi72
	LObcvWE4+GqIN3elzwdJjf6PYPu/WAurT2/jdRERhD99q8GZ/Yj2frB0i0bCyrQ=
X-Google-Smtp-Source: AGHT+IF9uX0HTONjn1phL8nh3FDI+1fDGp0+XKmvEbXbtamhRXsgMUoOLg5bXZ/FwnnWgFEIL4Tc/A==
X-Received: by 2002:a05:600c:35c4:b0:41b:e201:eedb with SMTP id r4-20020a05600c35c400b0041be201eedbmr7959795wmq.41.1715001510138;
        Mon, 06 May 2024 06:18:30 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id i14-20020a05600c354e00b004169836bf9asm19831169wmq.23.2024.05.06.06.18.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 06:18:29 -0700 (PDT)
Message-ID: <c9418e9f-711f-42e4-8032-480d0f32dfe9@freebox.fr>
Date: Mon, 6 May 2024 15:18:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] media: venus: add msm8998 support
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Jeffrey Hugo
 <quic_jhugo@quicinc.com>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <ff646f97-68e3-4fef-9b56-2bd98f0cbe7d@freebox.fr>
 <9844c940-21b1-42af-9448-62a2d5ffadb7@freebox.fr>
 <3e522515-f7ba-461f-1af2-2e22b143981b@quicinc.com>
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
In-Reply-To: <3e522515-f7ba-461f-1af2-2e22b143981b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/05/2024 14:19, Vikash Garodia wrote:

> On 4/30/2024 9:04 PM, Marc Gonzalez wrote:
> 
>> From: Pierre-Hugues Husson <phhusson@freebox.fr>
>>
>> Add the missing bits for msm8998 support.
>>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> Signed-off-by: Pierre-Hugues Husson <phhusson@freebox.fr>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---
>>  drivers/media/platform/qcom/venus/core.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
>> index ce206b7097541..42e0c580e093d 100644
>> --- a/drivers/media/platform/qcom/venus/core.c
>> +++ b/drivers/media/platform/qcom/venus/core.c
>> @@ -587,6 +587,47 @@ static const struct venus_resources msm8996_res = {
>>  	.fwname = "qcom/venus-4.2/venus.mbn",
>>  };
>>  
>> +static const struct freq_tbl msm8998_freq_table[] = {
>> +	{ 1944000, 520000000 },	/* 4k UHD @ 60 (decode only) */
>> +	{  972000, 520000000 },	/* 4k UHD @ 30 */
>> +	{  489600, 346666667 },	/* 1080p @ 60 */
>> +	{  244800, 150000000 },	/* 1080p @ 30 */
>> +	{  108000,  75000000 },	/* 720p @ 30 */
>> +};
>
> Can we reuse the table from 8996 since they are exactly same ?

Now that I have squinted closer at the downstream code,
I see that the tables should actually be different...
Will spin a v3.

Regards


