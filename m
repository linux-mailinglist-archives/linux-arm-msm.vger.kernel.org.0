Return-Path: <linux-arm-msm+bounces-13134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D6A86ED3B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Mar 2024 01:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5761E285DD6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Mar 2024 00:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2111FA35;
	Sat,  2 Mar 2024 00:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r9lDuAMv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0047E9
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Mar 2024 00:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709338189; cv=none; b=fQ7N0MhHqMv+8a5/GYqPp8iKUYlDF28RjuZLSRpwm8yOjlEcxqbyMiPBDSRlvdIF3vWPURuh0rypjWqvLE+lWDktubAp6GHokxLLi9ZKMB4qWBJZmez+hZL6IeKUIwP2YANOtRg9RC9m9nr7g8v7Kk+LPBZfEVP5SwCWEcqIfx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709338189; c=relaxed/simple;
	bh=aaYenj94lYAKmEeNlbWHmqDr9FoZd2BuTOpG3dSb7mY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tu6eP22LK4I09XVGCuVoVJUcBNqir/2asns0gqXgs9lBkO0nFXqX6MsKWzPKrTvlgGjgJMJvdAM8waeUEKJf8ICfGJoMhxT4IZkD919ovzpv0l7rrFzNE7/fLTt8e4rWD//RoKIb29lm3+xxgKyiruN9OtaKaZ3APa41hsYfUGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r9lDuAMv; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-566e6192da8so1460073a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Mar 2024 16:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709338185; x=1709942985; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbR6AbhBZF11elL+xt7U1HhrawAroMggNQxYLOE4mts=;
        b=r9lDuAMv/g+HAQ5tCQq3DJ6fhpLvdTfjQcMSd6ECJPZQ0WYBFZK4dQcL4THt2SnrYz
         ULnQ8fs7gdTUsoWW2YRKXHfjPnUPL3ewwZ1LkogtfND1SNqqjDOOhzXVQ62Em29p0q80
         iS1bsytGbohac/7JTHeZZJFwofFKszI02Q0QIjYiFXA6C851nCO2oTGg6EKP4wlaQhKJ
         H1IYXH/9M7yb7F37Ri+NHC+EL8v/LqnOEb2CdfcgttZZFgTN2Ut3IghLpDb+S/TkXPQB
         8IYq/S4zDxeXC0IXbvCt1ZFcdSxDaCN9h8GqyCh0oJgZuQaJyXeXcryHh0cHTrqrQqnU
         EPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709338185; x=1709942985;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbR6AbhBZF11elL+xt7U1HhrawAroMggNQxYLOE4mts=;
        b=dx+aMz5DYuUYYDuo1Tm8v6UzkkKifBoul0uSUAZxiXk0Vg2FZQGSQTAeIC0QJNXrva
         72l7gJeUFMULe5MDbWcd2K7Z9c8ER3U1NcQSHAUDxEynT+2KuRGxAhlH3RfnW4wZbpmZ
         OfG0dgIfKy0EMcHu585vON6D/7Mc31E7/6iTkvjaF6MAZnLXoIli5HGl07zzoA3lXyDG
         V/PoESUdVQ+tGex3h+GMHQrx2eJ+knJqVT+x4zMnXjHAEwg5RfCThCU6+Y4rY/3brVF4
         Ap3CKppX48HYlnJJv63aCroOMI92jZy+5MPH77MQO4Lg4kzypV2UQubQvxP2mebkPVDh
         lHXg==
X-Gm-Message-State: AOJu0YyNw2MTJXLqyQEMUtBNJcsRpo27PVIjNhOtODlAEs2ZCrEaJu5Q
	hlWJze9isaG3ByoZU7M2kk896/X2PsLU3TnBaKoFgrdz8DsIg7d3jyqf7GEWPnM=
X-Google-Smtp-Source: AGHT+IHxDzakBreRzMnBPgHVrmxjv5vjoTpXYiD6LRVf8n8u+9IBszh8vjLffU1cl1BOKPiO1MZFeg==
X-Received: by 2002:a05:6402:1e87:b0:565:1460:8447 with SMTP id f7-20020a0564021e8700b0056514608447mr2482709edf.28.1709338185564;
        Fri, 01 Mar 2024 16:09:45 -0800 (PST)
Received: from [192.168.216.32] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id u8-20020aa7d988000000b00566736af295sm1984776eds.94.2024.03.01.16.09.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 16:09:45 -0800 (PST)
Message-ID: <33f40e44-fbfe-42d2-aa23-f77529ee904e@linaro.org>
Date: Sat, 2 Mar 2024 01:09:43 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sm8550: Add mapping to llcc
 Broadcast_AND region
Content-Language: en-US
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <cover.1708551850.git.quic_uchalich@quicinc.com>
 <d36f8c70e103bd6f740ebfaa512d246188aadf10.1708551850.git.quic_uchalich@quicinc.com>
 <4e5129de-ce1d-448c-9264-b7470c3feb49@linaro.org>
 <65e9ef21-3406-4632-a607-2c4e9d587131@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <65e9ef21-3406-4632-a607-2c4e9d587131@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.02.2024 02:17, Unnathi Chalicheemala wrote:
> On 2/27/2024 7:49 AM, Krzysztof Kozlowski wrote:
>> On 23/02/2024 00:07, Unnathi Chalicheemala wrote:
>>> Mapping Broadcast_AND region for LLCC in SM8550.

"Map" would be grammatically connect here

>>
>> I don't understand this sentence and I still do not know why.
>>
> 
> The check of whether status bit is 1 in the driver is being done
> with the wrong register all along (sm8450 onwards). So I am adding
> the base address of the right register region in the DeviceTree files.
> 
> I can add this explanation to the commit message of these
> patches if you think that would help.

Yes, the commit message should definitely state the problem, and if
not obvious, the reason for the solution.

Paraphrasing Greg KH (I think?), the maintainers are going to assume
your patch is unnecessary and your job is to convince them that it's
not the case. You do it through good code and meaningful commit titles&
messages.

Please refer to [1].

Konrad

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

