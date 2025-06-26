Return-Path: <linux-arm-msm+bounces-62624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 970EAAE9BBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 12:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B8E55A0FEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 10:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB967255F39;
	Thu, 26 Jun 2025 10:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z6YsGLt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222251EE032
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750934897; cv=none; b=m9WCXmvscLIZpVus5KRB70R+TE30yvLi7CJggXv0dAqkUIhvHXb3yJBOyKGILyAHEpJtNYHAXvaM76JqU5RDRs0EnWbvl8yFCB3+VfovznTLbGIVIlfPK+F7Mw/qeQ2pwT4kO8wBmYVPR2DjutX6w5MpzsrqGOg3VqsutyHSizI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750934897; c=relaxed/simple;
	bh=iDPYcXFSHqv1aXfl8/YJ053KuD2moVV4g3YDzQAcxtc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGtW9LFNK+RPt4oa58OZRLmgy50TzAwgaRFZgioQyrPt8+UwnofijHf1Pt+TLlsHq+EKrTG7TEjuS44heecrvmpHTtI+aj7xOgS0/N5NOLlBVy4+5w4HfhpNdAbEjaCFinjCm+JKtydW3KBsrPjAncie7vAA0JRj85RRaEAwusg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z6YsGLt/; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4538bc1cffdso3343965e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 03:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750934894; x=1751539694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUjw7qBE83HsX3Aeqbgt73oRkerz87TNCfkEGmj2ZvU=;
        b=Z6YsGLt/8q+q8W5vV82LSVtbDK5gha9W0hqjDhIcqeSh5Dh8k1Gh4R/hqRSdw94aHe
         euJPuorv3vsF/0ZJBbE2Tt4whDpaKAyRZcR6NM+IxTHUk9+BOlJALFNlhcXi/xU2G5XG
         VbHz8E7yjx7RRf/nO/mlB5Ulkgn7L+Ppa5wqmUSzYA/4YhI0DEMJIl52eSBL5e1S4ZlZ
         1VjDRIv2HS7twWHKqsgt1EXFl8q4XP/m91MhVyEFPuPAF3Gk65SQcjW9//8k1nXIUeE0
         2p+JkYglpuFS7IC2K7f8YQTWDfqIatptlsSMA8p0nO3WndzbOfFOfqOMX0phQ8s0GNvC
         gzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750934894; x=1751539694;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HUjw7qBE83HsX3Aeqbgt73oRkerz87TNCfkEGmj2ZvU=;
        b=YxZs4aSZVR6+Z0EwxX8Nl1EdpOH1ObjH+cpK8Kq5RsuhVe4whF74AFlpM/L8OfkMF1
         47WdY3SulI6sKcLHEqkq1k/wSyvRD3CDOam+QVAaWmNmpBzL3ijBxOfsr4NfxmRzjyjU
         QjRPtmv1/bKUW5EcJCsvtI27bpSfJLIly0gNdsHzt/0YnxXQT7cc3Ai9eACfW84d3Q/d
         7PY/8M8UKXrBlVPXXAE75G5cGk3JqOYiYcD6HhWmmFoqsZKeksyurrd4cbuNvobujrnA
         Z4tJPGC37/O4RBhJP88YvvAXi/RYUwTAd1fUKnQi7xp4ZO+wgvzKXGDC/rdXo5YV/c5m
         9aUw==
X-Forwarded-Encrypted: i=1; AJvYcCVVoFHGBqq4inn/P2m4fANnMcLhljBlKm4Myk1WliAnien8EQRo7GpHWzA/fKUrP5MDffomwwVYfelC3fH/@vger.kernel.org
X-Gm-Message-State: AOJu0YwDDiDAPJzo4eIZgOhn3rh3dK5o9vQYxFRbawSlfV+PmWYi0CIG
	qZNrLiRCRU0Td+cMPCSRzSyGxAQ1D10TU8oir9Srzid/5B9VhqHr1lPZIxTQiYUSj2I=
X-Gm-Gg: ASbGnctT7EPgV36Qi5iE5rTRzJ9n6s2GqypRPa2RoESkXqGh1eWZuq9/d8ryYzmTHBq
	0+6glFcQqfY+YDR2CO91q3HX1XpZaXrPQi66iyjHg5DZqURqqS0dvroF1+B+d5dSdZeUI9j0yMv
	beKt/lZHSfav7HcT28U4exW+YoDBmuTJSIld5k91IALEecVYEuCKLddNPPLKB5jWdd7Hq42d8+N
	5qPgTU7mz0ZawarZ3anipJz7xDMAl5Ck0l1K2qOj3d3Sr6w7WMQRzaJM3DflmAcMPOzFXAsJ4VI
	Mqk33ht4gYRWP7M1BXWnZ2b96o4S+wQR9AsrJEsQGP0nxf/OrmkcBn1TiB+0GoYdVaiAt7idNGg
	saIvTnHZsjP4DTjq+7cEOgDfxwts=
X-Google-Smtp-Source: AGHT+IGsQdj4iGv9FBGfoAWi9XRLBBqhbfDylK0ITEXpt4PSByT7nYhuvCMByEIesH6nO5RpBBlepQ==
X-Received: by 2002:a05:600c:5490:b0:453:81a:2f3f with SMTP id 5b1f17b1804b1-45381afa899mr71269575e9.30.1750934894357;
        Thu, 26 Jun 2025 03:48:14 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8114774sm7141630f8f.94.2025.06.26.03.48.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 03:48:13 -0700 (PDT)
Message-ID: <d1b0b5c1-a031-4429-bb4b-ad8bc914c971@linaro.org>
Date: Thu, 26 Jun 2025 11:48:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: dt-bindings: Add qcom,msm8939-camss
To: Krzysztof Kozlowski <krzk@kernel.org>, vincent.knecht@mailoo.org,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250613-camss-8x39-vbif-v5-0-a002301a7730@mailoo.org>
 <20250613-camss-8x39-vbif-v5-3-a002301a7730@mailoo.org>
 <50fa344c-d683-420c-a3b5-837ec6d8e93e@kernel.org>
 <e928a7c5-56d5-4f2b-b667-bdbefb506d1f@linaro.org>
 <0e030c09-0a89-4883-b958-85ddd6831407@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <0e030c09-0a89-4883-b958-85ddd6831407@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/06/2025 11:28, Krzysztof Kozlowski wrote:
> On 26/06/2025 12:19, Bryan O'Donoghue wrote:
>> On 26/06/2025 11:00, Krzysztof Kozlowski wrote:
>>>> +  reg-names:
>>>> +    items:
>>>> +      - const: csi_clk_mux
>>> No, I already provided arguments in two lengthy discussions - this is
>>> not sorted by name.
>>>
>>> Keep the same order as in previous device, so msm8916 for example. Or
>>> any other, but listen to some requests to sort it by some arbitrary rule
>>> which was never communicated by DT maintainers.
>>
>> I don't think if you look through the history that you can find a
>> consistent rule that was used to arrange the registers.
>>
>> So we are trying to have a consistent way of doing that. Thats why the
>> last number of additions have been sort by name, because it seemed to be
>> the most consistent.
> 
> 
> Why are we discussing it again? You asked me the same here:
> https://lore.kernel.org/all/8f11c99b-f3ca-4501-aec4-0795643fc3a9@kernel.org/
> 
> and I already said - not sorting by name. You take the same order as
> previous.
> 
> If you ever want to sort by name, answer to yourself:
> NO. Take the same order as other existing device.
> 
> If you ever want to sort by value, answer to yourself:
> NO.
> 
> You both came with some new, invented rules of sorting, applied it, and
> now you claim that "existing devices were sorted like that". What? NO!
> 
> Best regards,
> Krzysztof

OK.

Discussed this on Slack with Krzysztof.

8939 should be like 8916 because these are devices of a similar class.

x1e has a particular order if a new device x1e+1 comes along with a new 
register then

reg-names:
  23     items:
  24       - const: csid0
  25       - const: csid1
  26       - const: csid2
  27       - const: csid_lite0
  28       - const: csid_lite1
  29       - const: csid_wrapper
  30       - const: csiphy0
  31       - const: csiphy1
  32       - const: csiphy2
  33       - const: csiphy4
  34       - const: csitpg0
  35       - const: csitpg1
  36       - const: csitpg2
  37       - const: vfe0
  38       - const: vfe1
  39       - const: vfe_lite0
  40       - const: vfe_lite1

reg-names:
  23     items:
  24       - const: csid0
  25       - const: csid1
  26       - const: csid2
  27       - const: csid_lite0
  28       - const: csid_lite1
  29       - const: csid_wrapper
  30       - const: csiphy0
  31       - const: csiphy1
  32       - const: csiphy2
  33       - const: csiphy4
  34       - const: csitpg0
  35       - const: csitpg1
  36       - const: csitpg2
  37       - const: vfe0
  38       - const: vfe1
  39       - const: vfe_lite0
  40       - const: vfe_lite1
           - NEW ENTRY GOES HERE csid3

A new SoC with a significantly different architecture could have 
different ordering of regs.

The main block should go first which means the above should look like:

reg-names:
  23     items:
  24       - const: csid_wrapper
  25       - const: csid0
  26       - const: csid1
  27       - const: csid2
  28       - const: csid_lite0
  29       - const: csid_lite1
  30       - const: csiphy0
  31       - const: csiphy1
  32       - const: csiphy2
  33       - const: csiphy4
  34       - const: csitpg0
  35       - const: csitpg1
  36       - const: csitpg2
  37       - const: vfe0
  38       - const: vfe1
  39       - const: vfe_lite0
  40       - const: vfe_lite1

I think I personally haven't understood what was meant by "devices of a 
class" but its clearer now.

Appreciate the explanation.

---
bod

