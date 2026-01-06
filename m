Return-Path: <linux-arm-msm+bounces-87640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB51CF7093
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 08:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C7A33029EA4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 07:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385D4309F1D;
	Tue,  6 Jan 2026 07:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9Jmo4ec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EFC178372
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 07:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767684596; cv=none; b=epZ0J/kqwQetFUowWkn0Sbb0fVpoz41j2UeX1mUoRYeZSvv1CXBtkSuUhteCgH7YGkqeCESwwxnp/rqYm6U+qwtT9fGy0EyV+dEeWhMT20+CLgeuaiM1n+I6jda8aTgRk7JsxkDz7oYHHn+W0GYnpIyYTxqsApXPinL9g2fY+/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767684596; c=relaxed/simple;
	bh=uwQMBGRBP0eBvM1mTA/eZvBph4jmcVJkihTxQLBFsGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJ3l4F6GA6PrtQMdKsrGcIljESkLEIMRkZ1JiBU65gTjVM0+8Btk6zCYR8NI2OgoamuKa6pW7fpdkPNDuRRpTN6KAXzMLf/ruIjejKMbCURYjql9DiqRWU0RSiYUVeq2BU9w6hPRRCLMS1R0GXeeFOkgk2TjhW/PiEmQVtZHavc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9Jmo4ec; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0bb2f093aso7055655ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 23:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767684594; x=1768289394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NSjp2mll7hJXV1/dG5UrDm8t5mdq7BgvFVfOgQMOYa4=;
        b=T9Jmo4ecR9VHH+MEfkILVLhUW7wA6jMFNVaA0p0fqy7fkMCLQJfH3mPDsaDHxdbLen
         Hgqa0rQNqRVZnj8/pqmUuSFSjrz+JMR5m7SZyi5/QTs5QGOWROo/LsVbnhAeX+BpLHup
         BKhfHO/i4lnJc7gUnUOcSgZAUJ7swM3u8bLbowzCB68OiwM1ua/VWt1odAeZvalYA+2r
         16/xfiy8y/+n9QiTxfRb9jRP43PxL97YT9MlDx5PVCNhC1QPy26b6fs+vhldlgGjLjMm
         pVZ2pr5fVR1y4JXEN/GYhysy/8SGga4kcfdvljrbTOAIBzZN7b03VJnYNquFsegBDVK0
         iJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767684594; x=1768289394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSjp2mll7hJXV1/dG5UrDm8t5mdq7BgvFVfOgQMOYa4=;
        b=EIwas7EE79fKkF7+cU3TjfKlxeysFs0TFkesyPcolaJVWJAfTDfMc9vpTbieJX947j
         Ll2dqUyHqImvGFHwBpuJtWBo3tZIZcvzf5mHbJYOynEI+CTF/re4Y1JWScQksgTDNy6y
         LmYO6jliVE5inbvy7NKTbO5owyyrfSM5d1hs5E8jYS1X2Z2z3f5HNMJqM0V+8wW0J0cl
         AC/mI11WJvQGVITsBO0yeASVbjaJR8c9wnYAQRSycBc5BoZ4s9Yv/bi9q7WWqMOm3qHg
         /8XarYgBocNUBgFGwZmQdMCG8bTWjwIIAi0SiKTt6PCOKRWZWpxyrNwvYcexP/bmOSVY
         6Jpw==
X-Forwarded-Encrypted: i=1; AJvYcCV9hUPE52lwkPrwdRBv+Zwrbb9l4tbinRmCJuG8mc33G8J/0pwk6yVQCVT9utIssFrnXAnj9NZNTHquTb6C@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ik6Rju37Wc728Td1hEVGui1XgqA9IqS2cefJbS8w0CkeNP2P
	fNawRORSakwBS0gONKP3b6bEyog0b919dUM0Yx+69lsUu98aMnwSOPWOvPBhww==
X-Gm-Gg: AY/fxX6Z0FvxB3fgvhZrFncwhbdOXQ7RvEIc+F1N5yTvDbU8Y9WdUMI9tBew1zuYrQW
	OAe1krvDJqCnzOENfdd+trhxJvOqDDZaGvj+igohQRfsEja7uXjybae601Kb/NGEp6x4d5dahFX
	Fw4VTdyYq/r7sc2cjAshuaYq4PSU1vkbrL0jpXdp9o2roLFqdfVjq47ATBlFG6Deoo/uYF5kBXO
	b/8KDoxzaXI9Lxz81yDQfpwxZUJacpXoEVZ0HvkSK/+lCZHHf6VitrIOxCbsGV8hETPSN+SqHAt
	Z8tXcTTHuQhGE9kj/PMdfNPg4Dj5/ZGpwcnMKlOYIOe2QOnXITybr5KjCUOKQ79vgrGtf5cOIvf
	60FADz5v8cnr6vWpzeXJTiQe+JVSTBz2anSFCPOXk8eseedbx+7+J5VOfx/+T6epLBhyGDFkGKo
	6I9HQW5gyu4J3DxRqY6axW4VzXrPqBL40AHv7vyveWO/EB
X-Google-Smtp-Source: AGHT+IEmFA7FqxXfnfDtj2yBgazK16tv3f7oKGrryC4Cs3CVp2BbXQDLKd8tk4p65AZyJ4GR/Z7k8g==
X-Received: by 2002:a17:902:c952:b0:295:86a1:5008 with SMTP id d9443c01a7336-2a3e2cf827cmr20031175ad.38.1767684593838;
        Mon, 05 Jan 2026 23:29:53 -0800 (PST)
Received: from [172.16.20.12] ([136.226.245.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa195fasm1201628b3a.1.2026.01.05.23.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 23:29:53 -0800 (PST)
Message-ID: <31907a16-1737-4269-92f3-ea998d684396@gmail.com>
Date: Tue, 6 Jan 2026 13:00:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251230130227.3503590-1-tessolveupstream@gmail.com>
 <20251230130227.3503590-6-tessolveupstream@gmail.com>
 <30ee8541-3ec2-49ac-8fe0-987cdc5b16e7@oss.qualcomm.com>
 <14613f89-6be0-4eb3-beb5-375ab008a313@gmail.com>
 <kfjogrtbwpk7mkg4fq2vyve6k6nwccguyxupdwhrcknf3qnahm@xyd545je6u77>
Content-Language: en-US
From: tessolveupstream@gmail.com
In-Reply-To: <kfjogrtbwpk7mkg4fq2vyve6k6nwccguyxupdwhrcknf3qnahm@xyd545je6u77>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06-01-2026 03:43, Dmitry Baryshkov wrote:
> On Sun, Jan 04, 2026 at 07:16:20PM +0530, tessolveupstream@gmail.com wrote:
>>
>>
>> On 30-12-2025 20:21, Konrad Dybcio wrote:
>>> On 12/30/25 2:02 PM, Sudarshan Shetty wrote:
>>>> Add the device tree for the QCS615-based Talos EVK platform. The
>>>> platform is composed of a System-on-Module following the SMARC
>>>> standard, and a Carrier Board.
>>>>
>>>> The Carrier Board supports several display configurations, HDMI and
>>>> LVDS. Both configurations use the same base hardware, with the display
>>>> selection controlled by a DIP switch.
>>>
>>> [...]
>>>
>>>> +		pinctrl-names = "default";
>>>> +		pinctrl-0 = <&wifi_reg_en_pins_state>;
>>>
>>> property-n
>>> property-names
>>>
>>> consistently, please
>>>
>>
>> I didn’t fully understand your comment.
>> Could you please elaborate a bit more so I can make the
>> necessary changes correctly. >> +		regulator-boot-on;
> 
> What is the order of these two properties in most of the other DT files?
> What is the order of them in your patch?
>

I got your point now. I will rearrange the order of the properties
to be consistent with other DT files in the next patch series.
 
>>>> +		regulator-always-on;
>>>> +	};
> 


