Return-Path: <linux-arm-msm+bounces-62621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA2AE9B0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 12:19:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 07CF21884F8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 10:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EDC221FD2;
	Thu, 26 Jun 2025 10:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q+Ty9IYA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29802214A94
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750933149; cv=none; b=HFsTXB7UIbCXaumssvwIs65wtMjY8UU2EvJXV09YWDFnT/ZWjNqN2CT3e3pdGONaGPLWOqcali9kvr/Sdnt4tmbUI1JbuuN7Sj3R9ojM2AdK07dyWuRPeVE7vILlFl2aLmObBKomr4uXOJamLsXeIIAZgHpn7BuF+d8kzSDmQic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750933149; c=relaxed/simple;
	bh=ORf1jAoipV+9qFhNmjCAhgnKjCxHxHChKLRLA7Th/yM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gq42+2MhsS3jW20b5qALf6xW4AVLXKSooGXRAn/a74qboZ3cU4i2kK9wbVhpQ9t3uoFo1/pU6iLvx/GCFGxCAgJqkq5Nvscb+GfV/895WcdBk7BU/0SVPw4qYiyAw7gnYCSO6MKGWAFJJHLnx3zDnHNtraQb4yGFBv4i94iIXYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q+Ty9IYA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453749af004so4234465e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 03:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750933146; x=1751537946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOgwuucZNG7PSzZM8+FS4NfuM4P4osp+GB3jAEqWNYo=;
        b=q+Ty9IYA8iLeNXXN7XE3LQ+B1anf74IpWnaYs6zPYmuZgkc7bfA+aZ7foTH/wvFCDz
         h1FiwW6Ja5akBYE1UqS+YvPtIRPt1T3KNAEyKg6NhwCIBAS8qomGEzkV34t533HoVmos
         cCJFuNDNOfL3V3+w/xmVCrmnVMrhi9uHSmCzsXHoLzyQ+K7bgqUHFD0ibkfrIiDNnEz1
         s3WkbOQl3eyq4unWsGk5H7jbPLXSPB2uJykjYcb2/W7Zd8L7HUyiM0BqZxgckrppN4r5
         QYgNbys+JnM+lovVK+fKVDOSqo8V0PBRryQB/avtXvcgeSh93v7gnw3cDayd2nWmyv0X
         3t1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750933146; x=1751537946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wOgwuucZNG7PSzZM8+FS4NfuM4P4osp+GB3jAEqWNYo=;
        b=tFCStZeLEWavIE9G7pafwOnyC34bHVnT5m/UlvKuXHooaNK1iYgrGqcEqfpRJeZEk+
         BjA0NcW1PYoYDGCicFZ42sFhDyh1rhGBBBET2nS40MJtTCYcLDktWZOFXH1+zKYuexn3
         yRxxwAzJcxf7AUhCFSTqpYFr8u91XMrzTzGqalmsxbycCfGJxacpXHGgAm/3DHAiPo2c
         7rN+Lr4+uP+T/8XEoomlxTFdRIiikDuSK63deuyBAgMR5otwLy7PtHYpbWaEb+1JNeDc
         N8MqDJibBIa2tFl2WzxtC9A2e1HQWZVftpb105luPbb5M0xG+c7BZ8fzMKlcsIEAfEVO
         BWNw==
X-Forwarded-Encrypted: i=1; AJvYcCVduDd749A8OSTY2PoOldzy7N7kSqz5m1a6UlCjTjCjI/76m42RgPgqoYyDNl32UbnoVVRc5xa50kE4SAae@vger.kernel.org
X-Gm-Message-State: AOJu0YyXTuM0mPzyrlQZpN+X6PCD8QimVbASJwOS3PwbIxRr4savWovv
	DO4zkCUvyd0hCCSSK29f23iUHEtW37FvddN66SDBIrz6gy99IJIwI2E1I96U4z1N01s=
X-Gm-Gg: ASbGncudHag8xF5ZzVxXiL81hqesGnW+VUdaFa98s5wi3Ay0Cx3wG9Rf9xnM+jVrGX5
	XF9MR2UtBy6WO5N/VHbiPdEOwm1BJVHed7aRRqCyLM+jBRIYmWyvWhH1u9gIBm76iitDmHBge42
	fdrjAjSBkuZicAHgBnWDm5CnVDWLR5/ZZuCc8Xh/jmQ5RciGrN/n62pgxIjOvJjfwaKxNatpjbu
	+Fs5HVaqCLiHUDxP6GOWhRmheUddMT5ig+q1vJKCvqDRa/2LGsouiUw88AcgNM8TZRtqNKynO20
	VLJaNO8+gRXuD0babP2KTQ+7DFtm9/YgwKSgoN08K7CEr/OcOz+4bnmlVJyW1q4xPTr8aPJijwb
	kQzLBhtepiUZTPaw5WrvIb9RmSks=
X-Google-Smtp-Source: AGHT+IHhY4kA1SbAViLB8X9Km2mENEE84lQY6AN+7FfCsVcgs/PjhB+h05Xzr97C7x/nhon5QU5BGw==
X-Received: by 2002:a05:600c:548f:b0:442:f98e:f37 with SMTP id 5b1f17b1804b1-45381b0f431mr60466415e9.21.1750933146492;
        Thu, 26 Jun 2025 03:19:06 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234bc1fsm45131555e9.14.2025.06.26.03.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 03:19:05 -0700 (PDT)
Message-ID: <e928a7c5-56d5-4f2b-b667-bdbefb506d1f@linaro.org>
Date: Thu, 26 Jun 2025 11:19:04 +0100
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
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <50fa344c-d683-420c-a3b5-837ec6d8e93e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/06/2025 11:00, Krzysztof Kozlowski wrote:
>> +  reg-names:
>> +    items:
>> +      - const: csi_clk_mux
> No, I already provided arguments in two lengthy discussions - this is
> not sorted by name.
> 
> Keep the same order as in previous device, so msm8916 for example. Or
> any other, but listen to some requests to sort it by some arbitrary rule
> which was never communicated by DT maintainers.

I don't think if you look through the history that you can find a 
consistent rule that was used to arrange the registers.

So we are trying to have a consistent way of doing that. Thats why the 
last number of additions have been sort by name, because it seemed to be 
the most consistent.

commit c830aff08d51f8391e59fc6744757c58e320b41b
Author: Barnabás Czémán <barnabas.czeman@mainlining.org>
Date:   Sun Nov 3 10:45:35 2024 +0100

     media: dt-bindings: Add qcom,msm8953-camss

commit 2ab7f87a7f4bf392e3836a2600f115a1baa1415c
Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date:   Fri Mar 14 13:14:00 2025 +0000

     dt-bindings: media: Add qcom,x1e80100-camss

commit c35ad8e3c59714e9cef96036edad1529e70d1a7a
Author: Depeng Shao <quic_depengs@quicinc.com>
Date:   Mon Jan 13 10:01:29 2025 +0530

     dt-bindings: media: camss: Add qcom,sm8550-camss binding

commit 0274ea59f83e4650c75b1a0370fbfa540bb88f9e
Author: Richard Acayan <mailingradian@gmail.com>
Date:   Tue Feb 4 22:50:15 2025 -0500

     dt-bindings: media: camss: Add qcom,sdm670-camss

commit 5593555343f3ec299ca28d46a478e718c1119f74
Author: Vikram Sharma <quic_vikramsa@quicinc.com>
Date:   Sat Dec 7 00:48:56 2024 +0530

     media: dt-bindings: Add qcom,sc7280-camss

---
bod

