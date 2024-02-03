Return-Path: <linux-arm-msm+bounces-9727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1E0848883
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 20:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48D371C21840
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 19:25:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7812E5EE80;
	Sat,  3 Feb 2024 19:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TG61Sebl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F23A5EE79
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Feb 2024 19:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706988338; cv=none; b=mG73OXPtMCPFY7vBf/cDcKNzYss6Ffpjmjz1wNccg/H7GJAit/FPqBLjvfVy9gRqxVCI5zyZYlup1nNf+k3deQOQIUl+0Ff1xNTWhju/CwT8cIyJ56+79ug2HzN2ZAXk+DEofnZnbyZ3izUnF+75txfST/h2c3gJZD2c8Xrwfmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706988338; c=relaxed/simple;
	bh=WZuW+i9I0SbhN74JIp5ooyGufqf923Ax0b/yXy/pogw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a46iDrO00z1152F5HmW4i/uNV0E5dqYMF0tyFCG1k5io6qT9cHuHZGFrbqHOxfBcnU8pkusWdIHD3Yx++t7FXybfGvQZQyXfc5bxgTULHaqkBKBSfhi0XvFH20yc0srI4tki+eDBtVipyXfZR9WK/M95d7Mejs5cXFPd/M2GpzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TG61Sebl; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a370e7e1e02so178747566b.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Feb 2024 11:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706988335; x=1707593135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hEML+AOM+rv/5aZrMlAah3f4OGCAU/KDw6eugc8miJE=;
        b=TG61SeblhEAHzBBxRGKSkf9FJgNEj4yqm5y5LLmqy5ZYmL4oG/Oq8kHgJt8/LEX+k/
         /R2KEc3kWiUpmZN7mAp0fn+apnR19WxWRgbRPmIHwzNxAGTHC+DKXd6Hck+PELE3/Sz3
         hk47npjHF6vkYX2uM2zTGgQ5i3EHNGdEub0YYdCRO36jCUOPimZhwUuePNRSYt9roFri
         KK5i9+aZhzNAPraYEQ/E38SLvSjHZ9Gx4hL8MQsD12PpaXkv/rOUEHnVI3wklsJtdpy/
         XlA3KZA7gWpGRWFxLHNPddusz4Q6V5IQ7mXCbg/oCAklY3aDJKTQCdTvpNawxiiGlSy0
         QW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706988335; x=1707593135;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hEML+AOM+rv/5aZrMlAah3f4OGCAU/KDw6eugc8miJE=;
        b=YKWkcboK6v6/lrZi5AsXFcX3X/l3pXtCGScFyV1KUgdypM1FvMrgX6uhTQtjO9aJLB
         FRPewPXR4TzOOm/Y9NYRdg0USIzrjml6+tbsh7bSf0c3ZtsmoK60lYgnI47csc9AHlHp
         2DwkgXNohjUycuze747VnYePeQ340WgON8G8x26BMrZwIPIJZ1/0szXmWSdQr67Vj4cI
         5EDm4J4+thVfq0KyCtoQDV2IxZ2pSmwZnQZ6C4AgI6Zo0pIioY5HZ1AR9bioMPBztof4
         m1uiJQNmfw6cbc1/kXXqcDOBiJrn0EaqL+rLsF626gW+SvxrlLu2xJs/dBXkEAVH/1cu
         Sb+Q==
X-Gm-Message-State: AOJu0YxbGI1alCB8uOSEWNJ3MmrssRLGsR3XUVl7ZOe3DvCCW2bQ/C+G
	5NqHwPuDXIP4N9/jiOQe9NYI2BV9hVnn2p2dLw5tuak+7qp9pSERKqssD1z6Tkk=
X-Google-Smtp-Source: AGHT+IHGndbrFj74i4kASgzVXdEPH7tSWXYN2tnwmTOEl8FmjUKlszk2RL/MmK0W4XJNxF8eOB1FPA==
X-Received: by 2002:a17:906:19b:b0:a36:fd11:3f98 with SMTP id 27-20020a170906019b00b00a36fd113f98mr3934343ejb.17.1706988334706;
        Sat, 03 Feb 2024 11:25:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVxM946bFfssIgtIHzYj7lq97yueIzD1LqLA14uMf1g50QzWVHT4Dao1F4ZmQF+rBDUIkw94fOUCISvJTH6xhQg7fvx9bSe9lWcmiZyESYVO4ok7tijGoX5I4cBPh3iUImHr/rZ+SneSo0tzfaTpDTseySa1Jp+kndSx1iCTM3lRNr3pA6GvhNBTmu/slc0h6d9cbn9+IFUqpUSGXy2KV1XBRcwGsgnd6sosiaFHSPAhZCV1DZ/Ce1KKzkWSheuyuvNqvBn8E56Olp4
Received: from [192.168.159.104] ([37.8.245.233])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b00a35ed4fd4cesm2296206ejc.115.2024.02.03.11.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 11:25:34 -0800 (PST)
Message-ID: <9f3a2850-6a4d-4521-94a1-3e1853a22815@linaro.org>
Date: Sat, 3 Feb 2024 20:25:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: sc8180x-lenovo-flex-5g: move
 pinctrl to appropriate nodes
Content-Language: en-US
To: Anton Bambura <jenneron@postmarketos.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240203191200.99185-1-jenneron@postmarketos.org>
 <20240203191200.99185-4-jenneron@postmarketos.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240203191200.99185-4-jenneron@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3.02.2024 20:11, Anton Bambura wrote:
> Split keyboard and touchpad pinctrl nodes since they are for different
> devices and move keyboard, touchpad and touchscreen pinctrl references to
> appropriate nodes.
> 
> Signed-off-by: Anton Bambura <jenneron@postmarketos.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

