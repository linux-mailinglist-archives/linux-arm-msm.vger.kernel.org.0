Return-Path: <linux-arm-msm+bounces-16931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EB189DEDE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 17:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 869FAB2E2C9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 15:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082E413B597;
	Tue,  9 Apr 2024 15:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hgtPpHpA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3157F13B592
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 15:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712675602; cv=none; b=XrHC0tjz6XJf8zDeuhDeJC8EQPt9w9E5nK/RE6q01THr4Pd4kABkUGZin/t4J3KIW3Qrfx/yUtdTsV6sliQ8aTHfWTrpWD6SoMe7blrGqjV3N12V4WsE2KQTRmAeQHjPrXm+LwmTBASq6n1oKeD6g11VYTZG6hKERxEe0f3lpXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712675602; c=relaxed/simple;
	bh=8zS/aBSiaDopJsrV6iViyi5TVd9qN+1iM93inBrcRGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZ72uEpNqI6dxZndMe7n3dxDxu3BsB1z5qFlvWheuJbsmD9frdqA9ZX4thUxiETZHS3Ps/LZPPOfHYn2U0VUNl7qDl2mwwesMFOLjwCgHBxVsXoTjQZclVo6PlJcegrPzE+ybbusCsrN92iqI3zCWDSPoWtWnrukRuOIboNDi4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hgtPpHpA; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516d68d7a8bso3814373e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 08:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712675599; x=1713280399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Y8LMcLnVJ7kXsKs8XUXqanjMzUM/+eZalvbhRQqwe4=;
        b=hgtPpHpAElTNDZ5QPIA3zWEy9UupvVN4++ZNAmGUDHVfLW5tms8FB6ezoTg1xfyskz
         J7VvhbCCdWM6Q3tUFBXOCdq8KiN4KqajbQ+IEfqgx1JdFi5r1QizyTDnSSvn1YU+Updl
         S5ahZfQi4ggAxhjAtEUL3CIbuLvziSrhgzlxyd8NGglihspARyBc6S7eKUdYKKNufx1a
         P6b1fSbUoHMZzrFBZJ1tafcPKnCoGYacxY3PqNlaH9iMPD+z0lse51iZcs7lVlyGgZWx
         xjmqhVo3kAIPYH0i/UklMkw4EKN/6/s/oWBpkQ3qTW11G07teOP3C4QnS50HsdGnmz1v
         H/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712675599; x=1713280399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Y8LMcLnVJ7kXsKs8XUXqanjMzUM/+eZalvbhRQqwe4=;
        b=pzQv9Md0GpQNYiarBlofOPBukBpNnXR6sBbaLlGsF+k1M1MKHrM5k6NOjPP/BQl0tr
         c1BgYQmZEtw0ePxu+jNRYbzWVEHPkuo1/AHL9xSFgmtKqq0gFuj71w6peW0qe424PPeg
         HnyfUmz2f/tqPwPZ77m7yKGt+9lmICF6o6/VUhQ/cfA31mdl1F+tsdeR36GTf1uqn9ul
         IcoCBkwWzWNtfVGl07dffX9z0n0zZFjZhb00Px+IE7F4StnztOlC0gML10vb536I2qmZ
         AB8NAleoIW48MSeevuHhTvHlm0Eh8YX3daCBpEqOQkP5jzA/4gA9JTXZBjImhSY6Znc5
         UCmg==
X-Forwarded-Encrypted: i=1; AJvYcCUFHK8Kws0qx1HyELe/ZFoAc5KRY+G4twhxp0edk0jneIVr0jZBcDiOgmKA8VMT6PskA3OmK8soj04Bv3wRsrj0T/jLZ4HiC6T6KNZqBg==
X-Gm-Message-State: AOJu0YzLFQwgRGDiVc/1Tkb9t86ZhEOu+B4bTMPmXz8rWphooKPEmFac
	BtfCJm4JgtlLj73s8Dt5nWOohtDhSxg+7bfh2l9oTALZXZcLaMWX3PfO86ecDK4=
X-Google-Smtp-Source: AGHT+IFlaw2LMhoJukUATahy8181y2HaVjByLfM38iyBHMbY2UF2znz52B2OFJre+KGvD+E2b0w0ew==
X-Received: by 2002:a19:3812:0:b0:513:d1d9:9eda with SMTP id f18-20020a193812000000b00513d1d99edamr982073lfa.27.1712675599395;
        Tue, 09 Apr 2024 08:13:19 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id 10-20020ac25f0a000000b00516cea36d5bsm1603418lfq.21.2024.04.09.08.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 08:13:18 -0700 (PDT)
Message-ID: <0955cabc-fc4e-4790-a82c-7f6f807fe36b@linaro.org>
Date: Tue, 9 Apr 2024 17:13:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/adreno: Add speedbin data for SM8550 / A740
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org>
 <20240405-topic-smem_speedbin-v1-5-ce2b864251b1@linaro.org>
 <nek4paofg3hturvjwpa2bnsvmicwmvwixzr6e6iuqstemgrqyo@cagcrnzjsne2>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <nek4paofg3hturvjwpa2bnsvmicwmvwixzr6e6iuqstemgrqyo@cagcrnzjsne2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/6/24 05:25, Dmitry Baryshkov wrote:
> On Fri, Apr 05, 2024 at 10:41:33AM +0200, Konrad Dybcio wrote:
>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> index 901ef767e491..c976a485aef2 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
>> @@ -570,6 +570,20 @@ static const struct adreno_info gpulist[] = {
>>   		.zapfw = "a740_zap.mdt",
>>   		.hwcg = a740_hwcg,
>>   		.address_space_size = SZ_16G,
>> +		.speedbins = ADRENO_SPEEDBINS(
> 
> I think this deserves either a comment or some info in the commit
> message.

"this" = ?

Konrad

