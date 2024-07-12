Return-Path: <linux-arm-msm+bounces-26065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 919FE930122
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 21:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 021F1B21DF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 19:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B74381A4;
	Fri, 12 Jul 2024 19:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E74S57r8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B5C44C68
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 19:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720814056; cv=none; b=i7tWkU4KYMsYeqba6rmXpkSXb3fKOYOqJg7MDFURaLxCy7LYOvceeRXToLdZc8GC2abEhtQoN/6UvqyvbaZhXmrlnoEpSvJp9egKo8XHMbsb+/enyYArT5v6u9X4VL6+Wmc8UA0hp4VMaxc3axzjJAxTORCoSUbGokwrvRGXekk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720814056; c=relaxed/simple;
	bh=f5jO4v5h4HSSIUY7LAsod2tYpiu/afgmmVVLyhJ+j+Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qUhaDCQrlhMrzyixfv79sGBr8cO7XJM/gvX8/3yUR+eaHeT62W6aN3pVPt/LCcgJnXTmvbsEZt5H95FjatanGT3qtlyXb8A7ikMu6mMkWyJV3qLueknt9EOnP/viGruq9ZQH8/k+HUyqWjImEQznRzNhb/G/uSoGD5hm0f+6GYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E74S57r8; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eea8ea8bb0so45959141fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720814053; x=1721418853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yFjv710SIVqWcm9hWgEm1m6RPWcEtHDSyAm3w4DCuwI=;
        b=E74S57r82VLJfu0ugm5ApNaMsbLx/a969cDYcPbyWuiMz2BMn3q+RTn0oWYPorqb73
         6jEUZkB7DzSMPwiUYvHf3QxQk/K0kilOeAu4zaSxf1psNgeqVK5H+c6wkL2/06qGn9Ay
         v1WY/Y5OuMv2RhT1Re2rGV2SOjN27TvlxVMUZxOxooHcRFg85ISmRIHt9AOihM2As9Z/
         Z26RmnAls7NzwcgwanXv+19OtXMBBj/MOQvFlECJ/ZgzaxeZzK1PvGzZnuscX4tsG6Hi
         Vh9fDTAp3PciC/Rf6r6s/9earOk/rzqW8RXFswBjvFlj/BBhKP7/WOkA/6zukML6xQ5R
         aT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720814053; x=1721418853;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFjv710SIVqWcm9hWgEm1m6RPWcEtHDSyAm3w4DCuwI=;
        b=CalRDxv4tdcdahOgLkSvXgguRa3G8u6qN6GJRuF9g5XY+8J9yBpiQDZ7iyn7hlPw84
         AZF8E77b/ifpRZ58uNCRX/XwN5By0pFKxNePO6HPq7kUvCQ0tx2SRnFIzUomiUw1vBEK
         kJ5xWikvqJA2iO2Om2bwHLZ7b2sBCut3RsooHU1/w1U9oZrAHACCZg3e79D+ZL6Tf5o3
         8fAmwuP6RJevrnmd1kE8g1zXyIGos4CapZ3bmGv2l1fK2ahm4xv819twtV1IFylxzabB
         pPyCIDpEVls5bWWliTTDR8LrKprXssJOn2wa/mAujdmimxIWURhfwmn1YawyqMSbvZbk
         YIjg==
X-Gm-Message-State: AOJu0Yxr/65+bYsSnDDoOOMMoPEA8ThtWcMO27VnggCKxeyKuY0+R7GC
	nUUzvCtBGZSmmFOpi2fnt+i/Zm7CvPtONvG6MQ8TO+sflIChKDzB6R9vT1z/xe0=
X-Google-Smtp-Source: AGHT+IFrnDCE2DhRwi0ZogNbSJPfUmV9sglnkKeXIz6ZAQeinBlxJj0WQOuYW1N9sLJEFIuMyLmKjQ==
X-Received: by 2002:a2e:a603:0:b0:2ee:9521:1443 with SMTP id 38308e7fff4ca-2eeb316b0a3mr95547971fa.35.1720814052500;
        Fri, 12 Jul 2024 12:54:12 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6e172csm373572866b.86.2024.07.12.12.54.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 12:54:12 -0700 (PDT)
Message-ID: <a05951f8-792d-4c83-802b-0350dd8760cb@linaro.org>
Date: Fri, 12 Jul 2024 21:54:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8939-wingtech-wt82918: Add
 Lenovo Vibe K5 devices
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Nikita Travkin <nikita@trvn.ru>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 =?UTF-8?B?QWRhbSBTxYJhYm/FhA==?= <asaillen@protonmail.com>
References: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
 <20240712-msm89xx-wingtech-init-v1-3-64f4aa1870bd@trvn.ru>
 <2146ca56-6c2c-48a3-8e77-75aa04cb2b4c@linaro.org>
Content-Language: en-US
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <2146ca56-6c2c-48a3-8e77-75aa04cb2b4c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.07.2024 9:53 PM, Konrad Dybcio wrote:
> On 12.07.2024 6:04 PM, Nikita Travkin wrote:

[...]


>> +&pm8916_mpps {
>> +	pwm_out: mpp4-state {
>> +		pins = "mpp4";
>> +		function = "digital";
>> +		power-source = <PM8916_MPP_VPH>;
>> +		output-low;
>> +		qcom,dtest = <1>;
> 
> I think you meant qcom,dtest-output

No, I apparently found this in msm-3.10, ignore this comment

Konrad

