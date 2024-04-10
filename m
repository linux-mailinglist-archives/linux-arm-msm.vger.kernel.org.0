Return-Path: <linux-arm-msm+bounces-17048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB28E89F3BD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 15:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 282CD1C26714
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 13:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FCF715B562;
	Wed, 10 Apr 2024 13:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lUlh/Cjt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF4169DF4
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712754671; cv=none; b=jaxJwla4t+kY/ZTicfk/wgxzBr51EgMBf7ZW6cMmFmAeyG2gG00HbiWkweZmsggFTFrfUwt5NxtYDxYMERA2Pul2mdyt204zHMw7X/msSPMVDeOxOsRytHWuDlYJCKg5WFTr3J7J80dqYPzOkSP2Kef89wvMy5c79lIJCawPCDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712754671; c=relaxed/simple;
	bh=iJXKJ9CpJ3I9XYiTXdS+1k1wRrzKc2yrbNCLqNpYCc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kbPlSp3D0MUoEtlx8cvVBdLmNgwG1EZ4z+c41vCKoYWZaJtvAvN0sGgVv0I7SrWysC0Kt1eArVIQw7pa/4ZN5BfdQ7NpUsByA+oafichyim9Q3zLjJEfnG+CCZhWgISkA9pG1JvFumCJsN0KvmgruKZM7bIRGdK1XDV0UkVOSLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lUlh/Cjt; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-516d23d3bceso1912765e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 06:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712754668; x=1713359468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJeIiq+w9iVuyYHr5UfbJwHE+rG7lgQOt3FsE89PJGs=;
        b=lUlh/CjtPYqx4Q7DOSLq0bpmRl/CGqfXDKF+/yVuKbsgonEml1bjIlXQQ0H1+zboNo
         fMNL1OuS4rvE9Md1k27azfdqwfAVCXNpLdbbiNQbGN5WHQZgb11kGP9ixLBOdBP28eC9
         GSdZhQBIbmffFuWqqIZ4m5FmkYXO9ONEnHdUciwYMMqB9JCYXoCoNoL9O05KH5W0mnnB
         rppqzqoAVcSRz9Q3V8PqRmzGwLBGq2zvq1fy7eRJ2ae/P2tcl9CTClHY02zgpGoSyMV2
         xvZllryUmXfsZtCR2ofB335Qto8+fvR5RhUWKasvNGYjyHKy8w1dcLOSr1Zm1Wf3PAiw
         E42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712754668; x=1713359468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJeIiq+w9iVuyYHr5UfbJwHE+rG7lgQOt3FsE89PJGs=;
        b=mF7Q/Ex1tc1rHggYlZqNQ2sy5+BvI3X7X478PulJF6WksLLfWTQjs2lrGSTB/h9hzH
         6pREj1rm5mfDN9jkEGeufRhBE6ERqoHahFuLfDb6MDjWMpCQE/EAMoHOftfXJBPpfHFQ
         EkBrkizy6YZP+JUSVzei94CNkD63Tbwlja+cF3gUXA//I425oVbaxeoXBL9Fs4Xeg/VZ
         cxiaWXBQHmtn5z/QdDFKG+/Xjp+m9FocK6Zg0bXzFetcoMYD0m9rc8VuzGPXFEDun7Zt
         5fDqgNQtBkbrKsDhhW57ReQyiEbHv6QxPLO82YgFX3XrywhUk/OBotKxLJHvFOpSJTlO
         R0XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeDp7i0wiXc69NiTRqYO+rldUdsfLHsmio5h42DdT9h4S2QUthIKZj46X4P7bdCdFDZPnWmW63+u8EBFF4RFFRnEb+pkzDFGXtzhTPAQ==
X-Gm-Message-State: AOJu0YzfVzJV7tBb+w282g3wEg8oP0tlOq2mJSFKfH676ptqnXirTf0j
	1CS/l6Ir7aIof7aB1PvnW7cMQeQFCx4cp/1C+1k+ATt5X7HJPS5pUxb7maa0gNA=
X-Google-Smtp-Source: AGHT+IGw1111AQE4BaDv05h1Qy/ZNddTA1/tpPWTBjNDdPuYcgdYsqY0QtjaNl/HCcvqm7k49HEwgA==
X-Received: by 2002:ac2:515c:0:b0:516:ced5:3af9 with SMTP id q28-20020ac2515c000000b00516ced53af9mr1556490lfd.5.1712754667737;
        Wed, 10 Apr 2024 06:11:07 -0700 (PDT)
Received: from [192.168.1.102] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id w26-20020ac2599a000000b00516a1a54edbsm1838685lfn.94.2024.04.10.06.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 06:11:07 -0700 (PDT)
Message-ID: <b5f81ed2-d2d9-4c48-8feb-d78bfd714a40@linaro.org>
Date: Wed, 10 Apr 2024 16:11:00 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8650: add description of CCI
 controllers
To: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240410074951.447898-1-vladimir.zapolskiy@linaro.org>
 <72816a9f-3c25-44d3-8386-9b561a8ae996@linaro.org>
Content-Language: en-US
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <72816a9f-3c25-44d3-8386-9b561a8ae996@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/24 10:52, Neil Armstrong wrote:
> Hi,
> 
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
>>     https://lore.kernel.org/linux-arm-msm/20240321092529.13362-1-quic_jkona@quicinc.com/
>>
>> It might be an option to add this change right to the series,
>> since it anyway requires a respin.
>>
>> A new compatible value "qcom,sm8650-cci" is NOT added to
>> Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml , because
>> the controller IP description and selection is covered by a generic
>> compatible value "qcom,msm8996-cci".
> 
> You'll still need to add qcom,sm8650-cci to the "CCI v2" list in qcom,i2c-cci.yaml,
> otherwise the DTBS check fail, even if the fallback is already present.

I do recognize the problem related to a build time warning, my motivation was
to follow the rationale described in commit 3e383dce513f
("Revert "dt-bindings: i2c: qcom-cci: Document sc8280xp compatible"").

For a similar sc8280xp-cci case it was asked by Konrad to drop a new
compatible, I kindly ask the reviewers and maintainers to stick to one
of the two contradicting asks.

--
Best wishes,
Vladimir

