Return-Path: <linux-arm-msm+bounces-11013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79579854BC3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 15:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B03B2863EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 14:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4454D5B04F;
	Wed, 14 Feb 2024 14:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rHj5Y+B2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C18E5B03B
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 14:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921903; cv=none; b=no1UcqN/4qhM8HwOzQ56yKkbkK3gVCdb/d4LJMAGm+Ii6l5omlL3Cn03tY52ZU9u6Ex1BA9Y42ggu3g6V4uahAUM68MdzqCvlcg7ihrzKzgeJwbqiA3Uo2o6Dca3qZy03eigjkXAMpcVAouDx6syMmvfCUZKG/ej+NSN1Yle8tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921903; c=relaxed/simple;
	bh=cpZQsQAjR85c+f4hcFxp9/sRJXc2W9hgbX3v81eEAI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QKQDaCmAcp4jSRmSZnRSmCIAXKKIQkAvhwSOUQjPL5PI4eEO0VezIYGaO8TKZXeAobHS1XFANG1W88s3PqYTOI7bpErx/KFjnHFkV/LJXm1R8OoUk2n+YY8QLI/786JKA3z0CjPB+51PRFHmr/x5x9qrdbj78NoslTfV4IwYXqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rHj5Y+B2; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41102f140b4so15913135e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 06:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707921899; x=1708526699; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xr6R04jM3t8mG2U+5kNCVy+S/HHY/qN0Owp9FdbuDpc=;
        b=rHj5Y+B2lcf4GUlgIDv7z1zifHgK0Joi9eSXZxlUpwYMmq93JWA+uDo1JLp04v9IFb
         fVl5xAyV1Scl5tn2kAm1gUQWXWQhLLZTp8Z3xSZ8tVQPRPsvsSlQpHSzlTOBvw1mJBTn
         hWdXxrgULUijbEdo+LpUUFjFkPoshWFzDm1yb7wBQuYST2A6f5u85iSUYLNRSfl2/yOC
         F2f1AptgrdNpCsHmq5P4YACozzTxnrpDHLSRVu+FvJJdl61rRTBo39HpMvWxzC5CQlB9
         IEn12n94yhp1hggdAytK9VmM/7FOQF3ZiFW1QeRD4tp6ZHYvvO3gzMGhweDywtJAmuPm
         0e+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707921899; x=1708526699;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xr6R04jM3t8mG2U+5kNCVy+S/HHY/qN0Owp9FdbuDpc=;
        b=jxozBmCy7GqjjpA9IGoegArDFnR0nO0fNhfM3ianO/6uT4smKw0+BNtUL5QIlv0XVI
         cFrPM1g7BBuKSgreOBVjgcNHL92wdLxtc8L0QjnHsOHv+oRTSAJt3kAt7KQC4cvpZpv8
         SvTUm0nAE29wmcgPN8AQtYbIoOXf2WE66ouGerckXJGpT8EgIgJFoP2+MK04T6LMzs9C
         FdDen+oxBjKEym7zVB9i6Ue7IBYLO+2fsDQ4Q9QYpMvsUxQ6LbB52CWRUo1AB2HozG+Z
         MDES0cc4WlLGH3+GFuWnQVETCVTpcl4aWYIJRfi4lkczznFJWQrdksVdRjWNpTbQCcFn
         3+PA==
X-Forwarded-Encrypted: i=1; AJvYcCXlImC7kjTyNVKrpx07gr1pl68WC66P9QTAatSNrBLnoH/qlV84ZkJWDllKw3s5xDBIH/Q3vsQN9BVYJ7pNj6iawK3s8+PwmtiLinnEMw==
X-Gm-Message-State: AOJu0YwwIJew2qJtKHy12bP131eeyJbn2lH6XDP77im7wrh4s16zuX4U
	vgQd28pLJYGdSU2mph9jDDVLjqWEWmac6RmuWdBu2BNWJt7rgXFmxkcaaNSLbQ8=
X-Google-Smtp-Source: AGHT+IElMJMY7bS3dgxro3ijjinZT1sz2k9Pm5ejvDg/fAd7OjD5N4Ely+pHprq+pPYGZ+ndGxwn8A==
X-Received: by 2002:a05:600c:c12:b0:411:e5c1:e55a with SMTP id fm18-20020a05600c0c1200b00411e5c1e55amr1461543wmb.6.1707921899609;
        Wed, 14 Feb 2024 06:44:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWnOdQ2SY9hCQ06/sghxX3DftuhWnm1gBviAx6lVYGzJvQjjaRZRUnXNrbfLMnnW91ye+Pm7rf71m15JZ7ujtthiRD8unJGzDskGXXloVbwq6LVBeJ5uxz9qojHrfIjFWkrBa7e/fTGjNS6YJ72dO7qDus6Dt905jReUQR4znnlEmj1gQu0rc9D96cf11NlV48TSCe0fMXsLLltpGGzDQih5JDF3A3w0a3+mASDkqxEYCmFRmiN9jGN1AA0XftIl3yaOF5z0v0f4dKf0IukSvP5WKrWuqu7UyxJaw5BbSsV7bLtwcm7O6Rzyzq8Ig==
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id v16-20020a05600c215000b00411bff9f7cbsm2125171wml.37.2024.02.14.06.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 06:44:57 -0800 (PST)
Message-ID: <3851e21f-f8cb-487b-9ed4-9975949ff922@linaro.org>
Date: Wed, 14 Feb 2024 14:44:56 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: qcom-rpmh: Fix pm8010 pmic5_pldo502ln minimum
 voltage
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, lgirdwood@gmail.com,
 quic_fenglinw@quicinc.com, quic_collinsd@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240214121614.2723085-1-bryan.odonoghue@linaro.org>
 <13baed68-1014-4a48-874a-94027a6dd061@sirena.org.uk>
 <f38468b4-8b16-4180-9738-0a2b557651a1@linaro.org>
 <dcce3fa9-ecf3-42be-adf6-ca653a79ba2e@sirena.org.uk>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <dcce3fa9-ecf3-42be-adf6-ca653a79ba2e@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/02/2024 14:13, Mark Brown wrote:
> On Wed, Feb 14, 2024 at 02:07:13PM +0000, Bryan O'Donoghue wrote:
>> On 14/02/2024 13:25, Mark Brown wrote:
>>> On Wed, Feb 14, 2024 at 12:16:14PM +0000, Bryan O'Donoghue wrote:
> 
>>>>    	.voltage_ranges = (struct linear_range[]) {
>>>> -		REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
>>>> +		REGULATOR_LINEAR_RANGE(1808000, 0,  2,  200000),
> 
>>> This will also offset all other voltages that get set, is that expected
>>> and desired?
> 
>> Yep, looks typo in the original submission.
> 
>> ldo3, ldo4 and ldo6 should all be 1.808.
> 
> Not just that but also note that every voltage step in the range will
> have the 8mV offset added.

The documents I have just show sensors attached to ldo3, ldo4 and ldo6 
fixed at 1.808.

I don't think there's any better or different information than a 
+200000uV increment TBH.

---
bod

