Return-Path: <linux-arm-msm+bounces-61170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A30AD8568
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 10:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D83A13B28BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 08:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F6026B769;
	Fri, 13 Jun 2025 08:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bF7mysxU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187E4258CF8
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 08:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749803012; cv=none; b=tl0PWLpezL86Mr5DzhkRpXBiu/f3QBCNNZrTAh6JGwtDKRt8M1TkfgFyocgKq5z3EXOzWWwTIKwiWNfGv2RHQBnXfFDw1aEJo+4VNUJItghNrQ48/fge3sapRJHITNy1DZ+HAFG6wHutSehdwPk9U/tZrIn4bvkw+9UpNt3LveQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749803012; c=relaxed/simple;
	bh=IKdAWnzwfFWyOXdX+1G6U0sXevLYVYDKwcZ5PhqJDyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GshVnuX6g8TSAb6SNX6VKZSfUPNBmGZH3p1kULpvIEin85wHX2AiYVH5IvAWxOHPt05aNblPiMxC/G0eZ96xpHahRuJcRZD4XrbNt2lgEX4QhirvbB+esogz2pjX2yaTGwsl835lGYdXbZ8u1TsE4V8Y7kyauikXBLxC7XS0tfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bF7mysxU; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d6ade159so15803215e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jun 2025 01:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749803009; x=1750407809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SL0zV9DuqfcJBeCX55h9Xj8eRYlqXWH7BtBGhKU/pUE=;
        b=bF7mysxUx3VkkxE/cmqT1kQK2UvZAsOeApL2QkSQ/zyeniAlPASIgwaE8nS8V/tRmP
         kaezQ+xYct5YBbqIjiG2Xb01oTD1n43s92t1XKWD/ctOTQIeSTsMU186BpN2TM9ipXaG
         EeQlBNFDijqE8gPrVo6Wky2HJULqnTPUz2ASr0xD+dEMeh5jXGAFessr7VwoUNno9GA4
         E4M6zL3aONwrbmugmz3UpPpTQDUw0SVN3nRX8V2MfLVIAOfyQCD6WJrJd7Bgnckm9+lV
         crqOLFecAnLezJBxNW3jXIOlB0oxnWAMqpcZUPu4X6Ulgn+miDgXfEIPw066g98elq34
         GPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749803009; x=1750407809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SL0zV9DuqfcJBeCX55h9Xj8eRYlqXWH7BtBGhKU/pUE=;
        b=BE4IxbEmQTfye2S8jV6ncTVHIyhYLerKq/5NyayYSfx7gkpxBXJE4gaTyMCpiE/47I
         u32bLd3KPx6vdHdMbAwS2AuBAZxXdQkybpVdNdHftp89r68RCyjLInP9tOfrVtXv8fC5
         uWXPP93gEZlk+MQk3v8vib8SXNXDGJU5JxzGlw2bB0V5rCk1ZK/7+SqHdKWYJUgkzrTb
         DiHniUutzGOiTlknXx52NPlpynwyfBu+ZrnI9Uq+/C7SbXwbi2GaPMxMj7jWb1tY4IyS
         S2JcPgXn5wfyjV51pdX75UFD8M2AcI5MqgYqxHDhsAZ3xQwEkqyOgS11Fvgc6VzktjZT
         nP4g==
X-Forwarded-Encrypted: i=1; AJvYcCUW36Xg79NBsYsHIuTvvyRr2gHRG2oOC+uud6/hz8qcnhFHK53Ve6tRVTWIE3Mg4QliuBZ6uinp6xuIgBgM@vger.kernel.org
X-Gm-Message-State: AOJu0YyO0odYpshyTNkZi1wElw5dtZFNsmF59QO1yLeAsdYk4zOBXukg
	j5AlDNqgtrJ0a5p+z6kMMKAPsMB1QW+fjpangiDJW14niq14FTU6PDG3G3wWpbjQiVg=
X-Gm-Gg: ASbGncuM/KsLRaFbalyqaBla+5gbUGK2UK8xyvQJWdF8lLkUIepxq4kLft4fqZNQYO5
	GzcytSw8yYDXyPuijL6dK5wMEHAxuoWVwz7n1PUW4uLixRevZODZQExQd4pyFQJ+Ps+bFzzueyt
	eYdWbmyXhXepLPJurA9ssz/xQ/mPWns4Ggh+ca8FAspt6WF6r4AWIcFAN1qcOj6BywztDPmyBe3
	zWwuORHN/mUeosN/Nyn4G73IaUT8EIiwPt7P7iL0fW26/K2qjCsRJ05al0DYT+BEx0Uy1Lc20Z/
	Rrru6R6VA6v94R8dM2glzsOT2jKIIZXATS7QA9fZyI5dGEc3cqm7Dl8ruqbW+Dw9IXgNYdg+CdN
	1b/bFobQsgRK2VHSGf8Laxkk0jpU=
X-Google-Smtp-Source: AGHT+IGNHdTsjLgwG/C438NLrGIbJka/L3CLjJ8ARU7Rx01chsRF11AsJfB2bRKuYUGzbEuQNFsylw==
X-Received: by 2002:a05:600c:5395:b0:43e:afca:808f with SMTP id 5b1f17b1804b1-45334b06b56mr20467385e9.31.1749803009292;
        Fri, 13 Jun 2025 01:23:29 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4531ff595b7sm64979825e9.2.2025.06.13.01.23.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 01:23:28 -0700 (PDT)
Message-ID: <830b7ce4-69f6-4200-b4b5-0e9abfe3600b@linaro.org>
Date: Fri, 13 Jun 2025 09:23:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] media: dt-bindings: Add qcom,qcm2290-camss
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: rfoss@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com
References: <20250423072044.234024-1-loic.poulain@oss.qualcomm.com>
 <20250423072044.234024-6-loic.poulain@oss.qualcomm.com>
 <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250424-versatile-brown-chowchow-dfc4a9@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/04/2025 08:37, Krzysztof Kozlowski wrote:
> On Wed, Apr 23, 2025 at 09:20:43AM GMT, Loic Poulain wrote:
>> +  power-domains:
>> +    items:
>> +      - description: GDSC CAMSS Block, Global Distributed Switch Controller.
>> +
>> +  vdda-csiphy-1p2-supply:
>> +    description:
>> +      Phandle to a 1.2V regulator supply to CSI PHYs.
>> +
>> +  vdda-pll-1p8-supply:
> 
> 
> How are the pins or input supplies called?
> 
> Before sending new version, allow people to actually finish ongoing
> discussion.
> 
> Best regards,
> Krzysztof
> 

@Loic

Could you do a v5 of this series with the voltage supply rails 
consistent with:

commit 2ab7f87a7f4bf392e3836a2600f115a1baa1415c
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Fri Mar 14 13:14:00 2025 +0000

     dt-bindings: media: Add qcom,x1e80100-camss


I don't think it is reasonable to gate your submission on a PHY rewrite 
for another number of kernel releases. We've been doing voltage rails 
like this for > 10 years we can loop back and do improvements to expand 
when the code for that is merged.

Seems unreasonable to gate new SoCs in the meantime, so if you have the 
time for this update, I think the rest of your series is ready for merge.

Merci beaucoup.

---
bod

