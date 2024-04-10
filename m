Return-Path: <linux-arm-msm+bounces-17052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B47389F41E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 15:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D13D1C22668
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 13:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B503415ECEA;
	Wed, 10 Apr 2024 13:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vXHd5qbl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD099157A43
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 13:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712755326; cv=none; b=RtoCdjb76cFVYpkLOedj7Appsq6/2RR3Eog12QFRf0D3t4mxs4uOZTDEMmH3k2+GKbI0GJvOzKbXjklolNldzwl5zEiDBwu3vQFgufaetY8px5YqzfkGpBVOXr0aZ7U0wQgomcU0/n/hWGaWa1jwtcgtLonk68B6K57SnouKqQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712755326; c=relaxed/simple;
	bh=J8KNRn2YkgZP+K6stIhakSHmZ0jBcWmmePj3ynN8Dc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E9uFM/3k+0FduJIkGWnLelmlBpJoJ13VdgtV735mTt/lS48vXFoBVQVY+3rJwGDslUy835i0YEQ/ncwW+QiL2bo4vS7Mq8eHXg9eiTAJgwIamA6gnoTlza3RbZBBFIbv/M0Y+6yTG82ImUXU1ICeqBMsJvnMo+ySH4L1TAKO+Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vXHd5qbl; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516ecbdd63fso1375729e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 06:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712755323; x=1713360123; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c3/NomYbE2x1vbr8XmdmXB5WI2Ish0/3/rLOMxSV6pE=;
        b=vXHd5qbl51S7Th06uAxStfolhC4eLDpl4KY5571ruWZzT9hl3RXpUiMiYImS3EYQZV
         NiEh66g96qLTDmNA6oZFulk/MwlgvIUz83a5NhZvYpBviyCQ0/Y+h4ljtg6tEZUKcQmf
         1dogwUfXeYNQJzNnDvfZhbL6kaYrWLiskbz9YI8VfSuRxC48i1AnA1DcA9BP6iWxAq5s
         xPv5qRHV2HoYUaIvWmuLaM/Fyx9oLdfpo46YMWG/Vg9/qh7G9ah2thYvcG98TlQtnpLr
         IXU21YP8mnt7qLwd0L02XalMhoTj7qs3+GlKgNWMhzJoysDxbQ2mCu60pXaOfGvXla9g
         crAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712755323; x=1713360123;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c3/NomYbE2x1vbr8XmdmXB5WI2Ish0/3/rLOMxSV6pE=;
        b=cC8uXPEjrKVbnfHp5apoGPwyb9rBD98dTLolGW3Jqqhskt3tevDiiKILkW83Rv0YL2
         3y9h8dokNJGfRMiRrdfH89zxMOlefQ5wQgTt9CsqVHDsaHhsXNPM0np8YrTkNCBnyhAD
         OW/7fl/F/ttPzs908F2UEHBAm38RRYXSLUzoTFYiXZQMipnsLWerqW1q1KTHCdGeiyAO
         Hzx2P+UASKmGpaIe3yeSl3zOIC+HJnSzwngDAmN4HntwjVagDtVx9KNFeOCrYln6YTVq
         xa7pY2mNJs7q+cT0oVIOIQTxFSYDI68awgM6aBwhp5EVoDRuLp/sAY5lSy7kFh0BfuTD
         lYOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJhBw+ZHcEpmGHmEPZwD9WcmmBhj3FpQQVZv35rSFWLdwh5d6vMGEg96XlV1W+mLJzmO7YkUMVjaiWStDcj9YRxm1Z1nop7hVtD/OMrw==
X-Gm-Message-State: AOJu0YzCFYfRb/FvSZWVjHcOd9NrQwDtBiOGfVhY+tUpzFG7TMaE42KP
	d0ronN1elipGxXraMrRw5FTgqAgXhoJZvo+8xrtrhmUVgKYQkN0uqbRZKgoPd/s=
X-Google-Smtp-Source: AGHT+IGvZ7r/3mBXiQf19VSpIR8wkCYP3AQEgaaFhaA+i9cQgr+1xjcoaLV3i+bVg1GNH+4RNWtwOQ==
X-Received: by 2002:a05:6512:684:b0:517:8252:8c96 with SMTP id t4-20020a056512068400b0051782528c96mr297784lfe.5.1712755322784;
        Wed, 10 Apr 2024 06:22:02 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id r13-20020a19ac4d000000b005131c5285f8sm1833959lfc.107.2024.04.10.06.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:22:02 -0700 (PDT)
Message-ID: <d91239fb-d15c-4984-96e4-1c2bd1361ad2@linaro.org>
Date: Wed, 10 Apr 2024 16:22:01 +0300
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
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240410074951.447898-1-vladimir.zapolskiy@linaro.org>
 <d47ce3e8-8ce7-416f-be0f-2283575f24b2@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <d47ce3e8-8ce7-416f-be0f-2283575f24b2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/24 11:26, Krzysztof Kozlowski wrote:
> On 10/04/2024 09:49, Vladimir Zapolskiy wrote:
>> Qualcomm SM8650 SoC has three CCI controllers with two I2C busses
>> connected to each of them.
>>
>> The CCI controllers on SM8650 are compatible with the ones found on
>> many other older generations of Qualcomm SoCs.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>> The change is based and depends on a patch series from Jagadeesh Kona:
>>
>>    https://lore.kernel.org/linux-arm-msm/20240321092529.13362-1-quic_jkona@quicinc.com/
>>
>> It might be an option to add this change right to the series,
>> since it anyway requires a respin.
>>
>> A new compatible value "qcom,sm8650-cci" is NOT added to
>> Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml , because
>> the controller IP description and selection is covered by a generic
>> compatible value "qcom,msm8996-cci".
> 
> I do not understand this reasoning. So you introduce known errors
> because errors are ok?
> 
> How does it pass dtbs_check validation?

To continue the technical discussion let me ask you to comment on the
absolutely identical subject, which has been taken in the past in connection
to "qcom,sc8280xp-cci" compatible, probably it didn't attact any sufficient
attention before, so let's continue now.

https://lore.kernel.org/linux-arm-msm/0a3cd2f3-85e9-4769-9749-62353e842625@linaro.org/

--
Best wishes,
Vladimir

