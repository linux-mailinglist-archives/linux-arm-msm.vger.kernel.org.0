Return-Path: <linux-arm-msm+bounces-80702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F10FCC3EB24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 08:08:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D423E4EA339
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 07:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482AA3081A9;
	Fri,  7 Nov 2025 07:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w3PA2YOQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2DD307AD6
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 07:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762499316; cv=none; b=jJjoUt6Phf7rFxwNxxbbpoXmyzKfGvFBSfAg+FWbRbe+Inbh2eVYehXgnbEL5E6/IGdaqDxKIrolgvZuZXB6jG5ccFLlSdXE2f4JayvWPCdZFjwz/3IVpssaJz8b85mV/ReFmBCQB5Uqn+iGZe1aMnHj/v3oPVF0+fUZL4T7tts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762499316; c=relaxed/simple;
	bh=md0Aa/YTnfNW4R97P4UMHUVOISoMcFKjUWy0BEnbyH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOAiOgsW/+egn0u/aDudVmv3s8chWjeQPU20VTbYrHxzNy3TZb1d4fsX+XfJ8LP+nSOcRGMBWr4QCBUdSJ0rNSnp9PKBDqP+RWvEQPX2YDH8uYu5Jqni2LFcJXwixFJaOCqDd24AEEFjHOO0oZDlxHprOdYy0/ijs4nyxIPvyeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w3PA2YOQ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4271234b49cso46570f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 23:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762499312; x=1763104112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qtwNZ51TOe1KmMbJGFmq0uDZnSOTzBAwW5XE8OEKres=;
        b=w3PA2YOQBeQnIJJFJ7xkBLlS+Ghvl743UPYVYkkReKHF9Di1zG3Z/rNq1ZC0xwBxyT
         Mor0eG9CoB6rzW4+nXpRvVR+RMBXZ52DzSo+I6riuqmucRDFZTCJxH03jS4jcYcPHobn
         h7TqvpYvcdw/D3ZDbQPKIgZwgmz/FHpmz/Xf2WNRpdzGopd9mSPlNih3ucbLTNXpU4bP
         a82IX4TY5V7I4bK0MWRPGUY6nI3QsGnwF2hv8+plEaISH9RVhvGLw5E/JtuOoJU69gtl
         Kc1Z/sXTOn8gjBpZR8blKJirwebi/PY5+5U2JXPJNqcNIrwTmMsV6h37s8E1A8i3MeTT
         Zrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762499312; x=1763104112;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtwNZ51TOe1KmMbJGFmq0uDZnSOTzBAwW5XE8OEKres=;
        b=qbjCSPblQGb9rfBLW7g0xm+XQHzDQBHb+hl7lFCTceIVpOWJY4M1fV5DJcFKllNsdR
         XHCGMPmAcgzNehatXhTyeGg/QJfEoEAIdrxThWTBRXwzTjWUG+P9UIrHMN8jL7jA9qaW
         6/45imvO/r8IB1PpMf/ZCV+WUbjT1HdtC1G0YNvDg1iHpkHH/WL8CleVdt68MLPRo6ew
         1I9x7brQGV+UmlDjj8X/kIIr7b33RfRQON8jpyVFp/uTkGeFoE8B7cpiOmpQt4gXiY1T
         fhEYfjbFcYCDoVJxd4OyBQmv9iPHWA1dOEdYu/zZUXc8xeF1LXtfvf1Hx7zT8+P243ju
         wT2g==
X-Forwarded-Encrypted: i=1; AJvYcCVK8N1OHUCtmmhHznYr7roowUisuPpG06wbHlXVo8gb2xT+k73tptKq2qGattlRJ6+vMECOGSqP1RfKFLTZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxrJlzr5majyn9AxtBD7s04Fs6/uSIDAMNmtdNn03PjkSr5qRjc
	tIDaQzEoZPPANLpp66u5o9XDQAUnshWTNJJDV6u0OrUaN718jfMfpQEvyeqPPV0syQw=
X-Gm-Gg: ASbGnctM2d4dCs3mTIVtOzkPq7p0ppx8vhSgsAdlR804PWON5XWUwSrlbLXtLVx5NnB
	esZOjVRcXp//orySV/xB7eEwK39usGbLRVv2oQGhzMl8ox9ef7IfDp/ZwCLEigwHqX9TVpR1lYb
	gyqs/AwFKbeekWiM6cw0UVyW2Zu3oKImmPX56hqLUg55qmqTl2vlW8h+zuIVwoThDvuOgi6CzGE
	0iwZtFumrRaFinPH656QJ0iIyPzoamOZLlWgNVV3lE5z033RPMr9C77DPwM5+aW1CP2pxiY57HW
	9mUizZR4XaBYgIg3tno00pn5nQ61pkd5VNfjBWcfjMBBVFwDXVzZHII70gOPIqLaQ8rJgh2JLxU
	0EzFfUKcxdSjXH7tQk6V1nZZyo4UK0Ad/Xrth4NzPQ6/5JBoS7f1f3Dd+ltQL/HKcbc+qzKE9zC
	aJP7sQxQOdtJck659qvJtHTyPnT/ERTJg=
X-Google-Smtp-Source: AGHT+IE77T5dGr6wx+Zi4AgBBU0bj3shUSkAGD10kNklEOoD/4TJ7x49hYuoTtpTUQ6bFauuSPanLw==
X-Received: by 2002:a05:600c:46c6:b0:477:54cd:2019 with SMTP id 5b1f17b1804b1-4776bc81647mr9463155e9.1.1762499312082;
        Thu, 06 Nov 2025 23:08:32 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62bf40sm3513388f8f.9.2025.11.06.23.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 23:08:31 -0800 (PST)
Message-ID: <a06ed143-c497-4141-8b4d-98fcb322e130@linaro.org>
Date: Fri, 7 Nov 2025 08:08:28 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/13] soc: qcom: Simplify with
 of_machine_get_match_data()
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-11-d780ea1780c2@linaro.org>
 <odmsib3dsxzzggq4gcx7gmh6vq3crlv25fz4z2l2ntezvx6gbi@uelqojwjjait>
 <a8952b46-94b6-4fe5-a5be-d69aa41d44cd@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <a8952b46-94b6-4fe5-a5be-d69aa41d44cd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2025 08:02, Krzysztof Kozlowski wrote:
> On 07/11/2025 04:19, Dmitry Baryshkov wrote:
>> On Thu, Nov 06, 2025 at 08:07:18PM +0100, Krzysztof Kozlowski wrote:
>>> Replace open-coded getting root OF node, matching against it and getting
>>> the match data with new of_machine_get_match_data() helper.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> Depends on the first OF patch.
>>> ---
>>>  drivers/soc/qcom/qcom_pd_mapper.c | 17 ++---------------
>>>  1 file changed, 2 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
>>> index 1bcbe69688d2..07198d44b559 100644
>>> --- a/drivers/soc/qcom/qcom_pd_mapper.c
>>> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
>>> @@ -613,25 +613,12 @@ static void qcom_pdm_stop(struct qcom_pdm_data *data)
>>>  static struct qcom_pdm_data *qcom_pdm_start(void)
>>>  {
>>>  	const struct qcom_pdm_domain_data * const *domains;
>>> -	const struct of_device_id *match;
>>>  	struct qcom_pdm_data *data;
>>> -	struct device_node *root;
>>>  	int ret, i;
>>>  
>>> -	root = of_find_node_by_path("/");
>>> -	if (!root)
>>> -		return ERR_PTR(-ENODEV);
>>> -
>>> -	match = of_match_node(qcom_pdm_domains, root);
>>> -	of_node_put(root);
>>> -	if (!match) {
>>> -		pr_notice("PDM: no support for the platform, userspace daemon might be required.\n");
>>> -		return ERR_PTR(-ENODEV);
>>> -	}
>>> -
>>> -	domains = match->data;
>>> +	domains = of_machine_get_match_data(qcom_pdm_domains);
>>>  	if (!domains) {
>>> -		pr_debug("PDM: no domains\n");
>>> +		pr_notice("PDM: no support for the platform or no domains, userspace daemon might be required.\n");
>>>  		return ERR_PTR(-ENODEV);
>>>  	}
>>
>> Here you are mixing two cases:
>> - There is not match in the table (in which case the driver should print
>>   a notice)
>>
>> - There is a match in the table, but the data is NULL (the platform
>>   doesn't have PDM domains). In this case there should be no notice.
> 
> 
> Why? Existing code printed notice in both cases. Why refactoring which
> tries to keep code functionally equivalent should change it?

Ah, you mean there was a debug before. Well, then I am a bit confused
because table has entries without data (so expected condition) but old
code returned ERRNO in such case - so unexpected condition.

Wail failing the probe on expected condition?

Unless it is not really expected and notice in second case is valid as well.


Best regards,
Krzysztof

