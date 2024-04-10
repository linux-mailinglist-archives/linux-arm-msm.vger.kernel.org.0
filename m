Return-Path: <linux-arm-msm+bounces-17064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC2689FB5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 17:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 718BE1C21632
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 15:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980F316DEAB;
	Wed, 10 Apr 2024 15:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GdAvB+Jp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CA715D5C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712762397; cv=none; b=pnr/vBz1MtzEF7O8J9Ea74Trl4SWaxS3J6rG8p6BeVh9lpnaA+UZd00ZW9ceQNEh09K/iqed/uYC3oEweYxatMZNqi37L+KEInbCdCBM0o95F4gdT71Z7S/qsqWdxJ9XS7LMS28SZZhNWP92ry3/8ye/RwmCAuWSbRZWs0DJwsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712762397; c=relaxed/simple;
	bh=zcUtgLA4vZcPCoP2NkXfx2bAoaIBEM7wOUXDrJwsac0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n9vFNCZBRXxjNm7I97kxmeJT7UWMrHlObzd7TFlPCCwsvaQezE4sYDAXbFpmrAfHIH61JN4X3JyBWAHYN7hYCU7Ze6r7v+QDjdj4/VnWHgJZdlQFhkO2w+lpzjP7mWM2//vFPioCw2w0pTFvNBec5rj79F9F/1ODAgaxQujYlgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GdAvB+Jp; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516d8764656so1788504e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 08:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712762394; x=1713367194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XUfPDli7bAOd0FyKa6YWNi6sWaCDKPi16Hf/PKnsZh8=;
        b=GdAvB+JpTq68CtsPUQ4jCi79wLNmDxfs8AqO3349Z0Ow4ZJiquNFvRLBGPMYfRFOsw
         JJ1505YpRrLooXW3qNjxUngXxqpTjOyXIfBfup68RJqewNKw0JVr0VWFnSb0aXu/1+Ba
         nPcdPqI1r2RQOFfUT7UuMeoMsInoOzp0fmLyCgKj+Bmqti735zfqWBjtB1y41dswGEt+
         VnCr5zy6I574mHem9nYfgPiYL0h0MhLtGenjnPsUIxRxa/L5SrVlWYILnzFt7loQb10j
         9tISjlaaBGSqO4AVIoK8a137IRBLtVg7FvgRKt8/GG2jOlqyg1vwufo6jhtqDlbq8Us/
         7VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712762394; x=1713367194;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUfPDli7bAOd0FyKa6YWNi6sWaCDKPi16Hf/PKnsZh8=;
        b=DZBQPqT64dxIvQT1tezhHV7IcLDRBNFmw81nHjrFe5RPncMN/oj1tcBAhxWGGWtdcb
         LiqQxBAl4Uq3pgzgir5+uSwUHSb6EoUuA5xmzKK7vle11MycbisBBBp6LQ/+ffFv+d+z
         dtErlDi28WxN4e9y7aCiijZDnUWYOVyJ/Q0MMlZuksIKyTbWMOUwLkrvBSqeOuiXVeWE
         4AFUEIlcd1pJM4H+kj4jZYf52tbkHbdpnV8SNB8pX6XFIb+Ek6nkaY93DBC3bnTfKry4
         wziANRgt74G9e+l1ZiHhAt13uT9DmKZsvYarQA+eT0zIq0io3Yjgxg224zhlJzbb0tX+
         CSmw==
X-Forwarded-Encrypted: i=1; AJvYcCXGNut4Yw+8i81+tCXN3sjCOwX6Otb5Yjq/g1RBJFHK1ltBZTjzyIbD4PIdf1zGUKQmD4YGyAIqUONs07njkJ2o0tBbbtdqvE3mn1HtOQ==
X-Gm-Message-State: AOJu0YycrNsXhFO58bRz/qESXaCAqF91Gl6EegSjGqEOEsEn9Ob1Wh3k
	f7EbgF+ZqveYP93OSLw6bcHMpr4fPf/j39gXGyeAlDMHGHCw2mX8ZOlRGn+pwFU=
X-Google-Smtp-Source: AGHT+IEtSUfgXWc7Z0ej2+6mBr4qzBBVjSs/mY7aARyuiJ0/bhN9Gjd+ixkBO0L12YL6+nHNQO8wyw==
X-Received: by 2002:ac2:51ae:0:b0:515:d5e6:d48c with SMTP id f14-20020ac251ae000000b00515d5e6d48cmr1627359lfk.0.1712762393723;
        Wed, 10 Apr 2024 08:19:53 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id v1-20020a056512048100b00514b5462dc7sm1865031lfq.56.2024.04.10.08.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 08:19:53 -0700 (PDT)
Message-ID: <f5611116-df8e-4118-8aad-16561f65c79f@linaro.org>
Date: Wed, 10 Apr 2024 18:19:52 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add description of CCI
 controllers
Content-Language: en-US
To: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240410074951.447898-1-vladimir.zapolskiy@linaro.org>
 <72816a9f-3c25-44d3-8386-9b561a8ae996@linaro.org>
 <b5f81ed2-d2d9-4c48-8feb-d78bfd714a40@linaro.org>
 <4162174b-df35-4282-859e-84b0579ff91b@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <4162174b-df35-4282-859e-84b0579ff91b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Neil,

On 4/10/24 16:50, neil.armstrong@linaro.org wrote:
> On 10/04/2024 15:11, Vladimir Zapolskiy wrote:
>> On 4/10/24 10:52, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 10/04/2024 09:49, Vladimir Zapolskiy wrote:
>>>> Qualcomm SM8650 SoC has three CCI controllers with two I2C busses
>>>> connected to each of them.
>>>>
>>>> The CCI controllers on SM8650 are compatible with the ones found on
>>>> many other older generations of Qualcomm SoCs.
>>>>
>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> ---
>>>> The change is based and depends on a patch series from Jagadeesh Kona:
>>>>
>>>>      https://lore.kernel.org/linux-arm-msm/20240321092529.13362-1-quic_jkona@quicinc.com/
>>>>
>>>> It might be an option to add this change right to the series,
>>>> since it anyway requires a respin.
>>>>
>>>> A new compatible value "qcom,sm8650-cci" is NOT added to
>>>> Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml , because
>>>> the controller IP description and selection is covered by a generic
>>>> compatible value "qcom,msm8996-cci".
>>>
>>> You'll still need to add qcom,sm8650-cci to the "CCI v2" list in qcom,i2c-cci.yaml,
>>> otherwise the DTBS check fail, even if the fallback is already present.
>>
>> I do recognize the problem related to a build time warning, my motivation was
>> to follow the rationale described in commit 3e383dce513f
>> ("Revert "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible"").
>>
>> For a similar sc8280xp-cci case it was asked by Konrad to drop a new
>> compatible, I kindly ask the reviewers and maintainers to stick to one
>> of the two contradicting asks.
> 
> This is totally different, this commit added a new compatible that is used in the driver,
> while here, you use a per-soc compatible that is (for now), only used in DT and uses

I'm confused, please elaborate what do you mean above by "this commit" and "here".
Could you please be more specific to avoid any possible disambiguation?

If you refer to the driver drivers/i2c/busses/i2c-qcom-cci.c, then there is no
difference between sc8280xp-cci and sm8650-cci. What is the total difference,
which you found?

> the generic "qcom,msm8996-cci" as a fallback because it is considered as beeing 99%
> compatible and no software change is needed.
> 

I have no objections to revert a "Revert "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible""
commit and to update the change for sm8650-cci accordingly, but as I've
already said it would be good to have and follow one common approach for both
cases, since I based my change on the maintainer's decision from the past.

--
Best wishes,
Vladimir

