Return-Path: <linux-arm-msm+bounces-94416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPmvOQ5coWmDsQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:55:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCCD1B4C60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 09:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FB6031940F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 08:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812703D3480;
	Fri, 27 Feb 2026 08:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rjzexa22"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621463B5315
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772182226; cv=none; b=fXbjuW8QfXzf/lf4iLAN8wCPGL7vukfkf+Udo7LDPYOpmuqLAmMAdLL629JK2zc/YqeBWU9sRh9coX+Wvy9QSAxBoANCq2LCbc6gizgL0e0jmMQwTbNrdqBmFD7dGgw6BZvtNJNQoh9ERWRdScPG5sQY1jC3TBVAB8nBoJGB8D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772182226; c=relaxed/simple;
	bh=m75GTlzzItsnmceJyWSlLMXL2IXTZE/pklfGMLQT/9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiGB8TxyWDaH/HL8hVgJZ58sd23sI4FW1tr1HtQPm4CMmG3P7vfIK9iRe3kvlkvPApjVwkgqq7MXZVFYTGLwro3dlqcAiogLHDZdPhqpt65QeBaM3WZWNPAYq3MIopoA73bBIeoiujYMyY+9z1qfpFMDAk7s92psdycOADccjwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rjzexa22; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48375f1defeso12750285e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 00:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772182219; x=1772787019; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1fAwVs7Otjkhg3KIx6sVOnt9Pa3bh3y7PAXDFn0IhyQ=;
        b=Rjzexa22BpoYN8hYaFyOJDuDUijiHbQ8Jv8TZy97nK0cAhh3RClJ0hwSfjwxkLmvYG
         7610A8Jv4jukimD7iE6YZoUiFt92Le2UX9pKtCXmMDEC5LwhH4xjtQh1V7aXVwQY1urR
         usA8MWsB4ToGrDfHjV+nBTSGOAjYVjbFvtwL4CrViCWAvNhXJVDbN8hrjlyyDKnjUB4E
         NULkSaRRUEaK4pWPGaHuEcaWQW3HftrdDTxYMw/bJEu9bZaMp92zvuANk7l03MwXAKVc
         3ILJLY4YaieHo7GrOmowjxjFC1tyrwNgo/w+4gXvSasnzRhgDsXDvP8+Or7u9YnAQmm0
         egjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772182219; x=1772787019;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fAwVs7Otjkhg3KIx6sVOnt9Pa3bh3y7PAXDFn0IhyQ=;
        b=nulMF7LLzSoQ3H6K0qLGKLoZA2tOytZE5g74dg56kW8pzmPq/J7qCpjn4a7EIVYXZS
         7wHUKN+cixRs3VVLBbk9bH2ff9QZ/UFptX5ab3ZPfSfXkFSy8L9k2XPglLzsxWl+Jpuz
         s9PzSwg79SQMA6xZLKilXY7YQStLG4ScHkWs6YTQC+9jY8YBUlm0/MPQKFpJyKEgq0sP
         OOh9dx1gZ6P+hdZaq52pfbOPvaME6SdsLd00YDbeNB0QdVKGFnKWb62vJF86NUDC1LI4
         6hPpQ/WQJKK40Itj9ZYLwG/34he7kNnMrcJb+c8tuDqc4ZrUaqBkGoHUaqnQJzqxOPVr
         HDbw==
X-Forwarded-Encrypted: i=1; AJvYcCUGP+eu86TRSfkG8rtLLujHYeX/IhLlGFRJmfb+9csI4GAHm11zNE82Eeogd9s7wQl1Cw8gw9U3p698LuOW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3OjCiL0FRwvXV35N1iBrjbVTrFhSU4X9xvu6UPzEQL0IOwB2f
	WlO0ZQErMu2kJQp4e3yGdxjUP7+3lTcsH59eRM/SwJNfKAIZLiklyEEeLCA/ocEM4Sk=
X-Gm-Gg: ATEYQzwSCNdjp0a2QUfZR6VGo1lfSf/Cj0yG/0ekq3VDUkrDbJV6N3AKkSfKXFZ2s3u
	vhw+J/DWju8ETELUP18C6oIrVENw1PU70VAUK48br+VM1gszDmMez6Iiaua/Faz8N6WVivWJgw2
	QOdJqiM74jAIiqoz63EYcaFcPq1tdc97ReTpvtFUGjlGTPEMKwf73ZpqRNdljQ1hWJVxjYlJhBk
	KYWw1NIM+cnIUoobMJn+ogsFs/+bAXCAE54PG+BEVfZ083kgBuNGryxb8y7pPzu9gw1XWw3Xyc8
	N6VJsX8/H9laVkuEi0CsFdcebW6BDihnRI3O5LpXxIylgGPqqnopoxJFFX3SE5YZts7DU5Ffd9u
	JICMYDqPgJd1arzabm8ff8C5H93bvbUVtenCYl6SNoEj5VYfzu7BDd32SXlOe20wjrULWrs/F/q
	9B79Yaq34YwKxeKF6QfLpt7eEZk2xssV5xJwfEubWYIqABRqzJlHEpmvrKQRaJtvMs
X-Received: by 2002:a05:600c:8b26:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-483c9bc1e0fmr28491395e9.14.1772182218741;
        Fri, 27 Feb 2026 00:50:18 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf5fbsm54151445e9.18.2026.02.27.00.50.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 00:50:18 -0800 (PST)
Message-ID: <e844eda1-2de1-4bf0-8531-088cbd59b06d@linaro.org>
Date: Fri, 27 Feb 2026 08:50:16 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/7] dt-bindings: media: qcom,x1e80100-camss: Add
 iommus minItems: 5
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
 <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-3-a59c3f037d0b@linaro.org>
 <20260227-electric-singing-tanuki-fd290f@quoll>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260227-electric-singing-tanuki-fd290f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-94416-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 6BCCD1B4C60
X-Rspamd-Action: no action

On 27/02/2026 07:27, Krzysztof Kozlowski wrote:
> On Thu, Feb 26, 2026 at 02:28:44PM +0000, Bryan O'Donoghue wrote:
>> Specify a minimum number of iommus entries. Currently the schema
> 
> Why? Your commit msg must explain that.
> 
>> requires exactly eight. Add minItems to allow fewer entries while
>> retaining the existing maximum.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> index 8dbaab16b11d4..f406cf6f8f9c1 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
>> @@ -104,6 +104,7 @@ properties:
>>         - const: sf_icp_mnoc
>>   
>>     iommus:
>> +    minItems: 5
>>       maxItems: 8
> 
> Same review given to two other such tries from Qualcomm - you need to
> list the items. You know differentiate them, so the items in the list
> have strict order and meaning.

Ah I knew there was something I couldn't quite remember - an 
differentiated list.

Yes np.

---
bod

