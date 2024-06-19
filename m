Return-Path: <linux-arm-msm+bounces-23209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DBF90EB0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 14:25:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8CD10B267C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 12:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1484A14372C;
	Wed, 19 Jun 2024 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nvn/+l+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33FF0140368
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 12:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718799843; cv=none; b=mPA8G7kYnIQF2TUcAMXCLddD2R6Lf/TuikQ9yE2psxEizm92BCfA0yWtgH1Q/PLjkcoq8Uvw3V5JsEbA0kpxGzyslhqrAHcnt4KqBiXJdEH+6qo9lA2Kt9wAIVfmGoIJ6jR0iuLe2pCN4lyyTXJVbw5zW6B8/Y5wQsa5u5HYIZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718799843; c=relaxed/simple;
	bh=bz1IakQFfcfiAJ7FlVyWHudEX7j14MDRLiwXOlzfR2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M2D4Nk6u1I80w03+7kwld8UYeQ3UV+ig09V+3dnXmltfSPMScah7NOQ279Y9Qp16ofgBz31ck2mPETGTaPS2bvcs2AFmiYkiUfRmI2RBJrZCI713jXOYdvOhxz/kvYHPN9hvxpRCdI4wjKXY0vioCsh6Iy++XBYl7igM121lpE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nvn/+l+h; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4218008c613so49913535e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2024 05:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718799839; x=1719404639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VHUEUcW2skIFmJr8wZ7QcNeIR23OIvnta7eNO+sU4Bc=;
        b=Nvn/+l+h7BECNOdnpTAGGiTZSz7QjT7J1paHs0xKBpidPMeLJ1h7gib3ligqAkHgAb
         B0zRzoBNANby5jUZB6aW4TOrAVy9oLbfMOiq469LkbIcOcwjuV9i+Z1nlopkmybayUFa
         cWQJrpgXacP1YwX5hbURwzqgsd2Xxm1OJl0gl5kiR3PQVJ7IAacRxV/1mKgE6+ZOj8nC
         JNwydKgo9rcRqwrkMEc4VuvH1WePoCIvSgMdXpV6K4nlv48GDme9Jo/4DzihxwjNXK4u
         5NWFDpOqOjvgPRgV83yJgLGz0bx+q7fse2Btq3ZOIiXEvrXQq6v1G05pKgYpt2ZrsNNU
         Pg0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718799839; x=1719404639;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHUEUcW2skIFmJr8wZ7QcNeIR23OIvnta7eNO+sU4Bc=;
        b=ZtrWKJ0g+GaNIyavoXe/KUm0zIjfPaNs9l4Z7ZYkDnv+Dl2k+1BXZ6nql+uSjywXE9
         nUF77UWGyKbh4E8xpYn/jprxR37G9s/AgcesJ9B5iT2/y1zVFWq3JTIgxiDvZHLxRmp+
         FRNSCeOCK0L8Uqh4Y36M97XT/6O+/5PGe4Y84tNCivCQVxUlWlA0IAl+RfIT0y/SyPxE
         60VUwg/4ElsyZ+n5KFmOZWMiLpmhhJPh0ica5Pd3wMt0OpHvZwkuL3cBmSdXPNOeiaOY
         JYl+XwGwOF3flkm6JStUKxtVbVhiXYieTOfUshaU8zFbjW+zOn8Nmin4H/l8Za5A/UT0
         q3Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUlAQKrPpnLN09+LJ3gK9MW1VUzjXvLd/b2SsdLUMJFmn5HlMT6dcLDF7KPM8D6Mttz1WVxPTNJIdlj/BY9LZ8YRHx6sHaKDRRXb9KikA==
X-Gm-Message-State: AOJu0YxYReFC+Y37q+LJKhedK+LX3+WYvua8fRmwO279b4KqzO062Kar
	vUAHZm9dPWh809jPLdxSyGXMkuc8PNlTS5JlST3KJ/hxn9t+bLYhurYEdusAJJ0=
X-Google-Smtp-Source: AGHT+IGYIQ8j6on7KsIOL1DTsgh1Wi9tlJ8z4iKPN6WIKHifRVl6a3pQkGaSMBmzmnLnzeIV7MJUDQ==
X-Received: by 2002:a05:600c:1792:b0:421:75e2:c090 with SMTP id 5b1f17b1804b1-42475176435mr18751355e9.11.1718799839499;
        Wed, 19 Jun 2024 05:23:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4246eb25af4sm71637185e9.4.2024.06.19.05.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 05:23:58 -0700 (PDT)
Message-ID: <10568cd0-8005-4a8f-bb4c-03d33c87a15c@linaro.org>
Date: Wed, 19 Jun 2024 14:23:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable secure QFPROM driver
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: Komal Bajaj <quic_kbajaj@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240619105642.18947-1-quic_kbajaj@quicinc.com>
 <5582a2a0-c772-4573-9d55-2f963cb87df1@linaro.org>
 <ZnLKwqENxC4wzrUm@hu-mojha-hyd.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZnLKwqENxC4wzrUm@hu-mojha-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/06/2024 14:10, Mukesh Ojha wrote:
> On Wed, Jun 19, 2024 at 01:08:48PM +0200, Krzysztof Kozlowski wrote:
>> On 19/06/2024 12:56, Komal Bajaj wrote:
>>> Enable the secure QFPROM driver which is used by QDU1000
>>
>> Qualcomm QDU1000. You are changing kernel-wide defconfig, not some
>> Qualcomm downstream stuff.
>>
>>> platform for reading the secure qfprom region to get the
>>> DDR channel configuration.
>>>
>>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
>>> ---
>>>  arch/arm64/configs/defconfig | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>>> index 838b4466d6f6..c940437ae1b3 100644
>>> --- a/arch/arm64/configs/defconfig
>>> +++ b/arch/arm64/configs/defconfig
>>> @@ -1575,6 +1575,7 @@ CONFIG_NVMEM_LAYERSCAPE_SFP=m
>>>  CONFIG_NVMEM_MESON_EFUSE=m
>>>  CONFIG_NVMEM_MTK_EFUSE=y
>>>  CONFIG_NVMEM_QCOM_QFPROM=y
>>> +CONFIG_NVMEM_QCOM_SEC_QFPROM=y
>>
>> Module
> 
> Should not this be inline with what CONFIG_NVMEM_QCOM_QFPROM is having ?
> Either both CONFIG_NVMEM_QCOM_QFPROM and CONFIG_NVMEM_QCOM_SEC_QFPROM
> should be m or both y

Why? There is no dependency in Kconfig.

Best regards,
Krzysztof


