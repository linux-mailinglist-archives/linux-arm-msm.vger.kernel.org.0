Return-Path: <linux-arm-msm+bounces-65041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB8DB05BEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 15:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3691A3B438C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Jul 2025 13:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D182E2F17;
	Tue, 15 Jul 2025 13:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DRM+Om9z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FADE2C327B
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 13:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752585762; cv=none; b=C28QeLVbH0Qh9J5oPNXNNhoJIGg3V4mcHDDulefsNng6wRjf5G3N6ENKXN9x80lGnPT+CBiZWfmkySj5ee+RdPyUof5xML5vDyMs7fJgdRj/EAl/Y4dTM8in+HCc4hjAbplJXbYofVZTL1kyG1tp0KrLjQ5xkJha9jOB3GAkfuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752585762; c=relaxed/simple;
	bh=ggSBZe4/MRYCdgcgShw/v6VB4zRNxAUpfJNW4Q2ASJE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MfIWai+Ur7X7u/cGrpAJlUsXD8hP/1+Ax2WFpkeMiLEcc7AvCgP5n+zbH39BNHcsPmRadDmC51QeVKQa2wqLIbT7LPqOoYA9RcrMCob8jz5QAgqL9OdXcD+etX5eAl8kBZGhELDqeCDzmQv/kVDBaPU/vuxeQf3dHmrSaQNdizk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DRM+Om9z; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-455b00283a5so23700865e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jul 2025 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752585759; x=1753190559; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3H6Iidp9rhDRZxtCBFi+Uvs5Kn95t+qmKzadfhzoSHU=;
        b=DRM+Om9zoIMPN8JSJnTRl2wFDjex/lJd/8WXyjCMoWc+XPQ4YLT1tM+lydpl3JqMCI
         ECApSx/rj7U1v8iJX31ungXX1kX9MK9BdOfaQBi06L8ZTJaqwgAlwlTMYtT69f2jU6Up
         JnxG9G99f/cAmk+GUem3Atwgqc4YGuW1zN/Z3JgRJX40ZI3F7gcNGL6oaN8BEjFsc14A
         4q7uHcMd4N6QUVz3aQvteToGn3jEanmbt0wsaKfylJq+6+UGgeA/eQw9a7y/shzyXP+D
         dN+79vMA7mWitPVxBq8aazhRg2okSQ8CemWQs3VCj/RugpB0Tcd1SpricrYFfHQkbYR/
         55eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585759; x=1753190559;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3H6Iidp9rhDRZxtCBFi+Uvs5Kn95t+qmKzadfhzoSHU=;
        b=oP6TbZ4guI2vU7OJaGGIgavMx5bIr6Gocl49jwfIFKZkCgrRrKrxV2RU4BFQH4+uRP
         sTXn0/h/X4nL1h+/yaFVCRZjK2bTRvZ+7wbr3puaTnft4QmJImuRK3PFZiHrxTU1UMlk
         kblxYYdoSRZca573+a45dmKVzjLFxUECvD6XDahVUJhcPEY4pReC/y/Em/UafOAC9jIw
         Nwu9V0CUWBjSu3v4sp3aOvBrbRCNVNkTTKYXqm9UR/EhjsLWzGX9Gaswas8Ax5pQSxoL
         k1aaP7fHkuhPK1Zr5SkSV9fe9Xo0ld+PlqCNQBC7iELj+LcqAA+FLTnL4HPwV6z5+wiL
         FzCg==
X-Forwarded-Encrypted: i=1; AJvYcCV/J2b5X2qVwWfRwnu7KpeI/r5FYD0hhfmCmpjZ+I2Leha+hziqyjw4iT7Vp0Jw71Q2KmF1UoOHrfb+hr2/@vger.kernel.org
X-Gm-Message-State: AOJu0YyFKtMdBasbmnzFc+9H14XWBR4HWksaXlhBKYDp0r8irR5/JMVG
	bZ8r3fSLZ5Jb8msXYHdILc9SD7uZVi32Du8VoFYaNBRfPS/g2lfr7+8oZFeU8t6oc+s=
X-Gm-Gg: ASbGncuIESrMfEKktKDqvdj+ZoO+TMY+sNm0OT+K2BDoETOqWaAuZ56NQ5L1XU5LIEu
	rM1/1Pm6rgwv385NPCwUZzyuJhJJsGkbzflLrQEnrjUrsHijyq6jpQES+usTBzMEJMIQBaEo8s+
	lDtYFKeLCoidBmBdS+3hrQOAg+ThotupQImLEafx+J1vg9iyuG/rh/heC0Yrb642xuvmSpoAL0L
	5Rx7z60cjXMNXh3z7DAseBOazFEVAtrVvqGJBtPvavZWMP//RRKDVY3fcehsFRIoLhy63ZMU+NA
	lxCAq+Hw7KkYhvjNjlVaRYHlMxDHke+lHk3pZLxd4jD/1UfB1VP7GbGmFvu2X34m4zQIWKhbGv6
	/UskB1u2fTPU8sSI5IYTfc6GSXfY4W8Xlwzb4LCHZxWjAAUfp86rDRL3p3CE/m690
X-Google-Smtp-Source: AGHT+IG5laFib5IuGaEe0/CAIHikaeUxn66e8XaT3qBceu8HH3QCzXBdKNCtQKvvZS2pZhhp2+9shw==
X-Received: by 2002:a05:600c:3e83:b0:456:237b:5e4e with SMTP id 5b1f17b1804b1-456237b60e3mr43102535e9.32.1752585758680;
        Tue, 15 Jul 2025 06:22:38 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26ee3sm15418891f8f.96.2025.07.15.06.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 06:22:38 -0700 (PDT)
Message-ID: <85c1a702-1a3a-4145-8f2b-240d61d6e72a@linaro.org>
Date: Tue, 15 Jul 2025 14:22:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bod.linux@nxsw.ie>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <9361e954-e2c9-41c6-be4c-12b0e4f367f5@linaro.org>
 <ae0a309f-7e52-4d3c-8f26-989f22da5b07@linaro.org>
 <GbVC82h7wSXQsAJh8XybKorKYy9wupjQLndjf_uYNXOZnk1UqS_tT4Yg9gzf8X3Kn55Mt5bXfcFrHtyMoFZ4-A==@protonmail.internalid>
 <a4ebdf5c-8d4f-4994-afd9-22c8d889fe97@linaro.org>
 <4281887a-e7c0-43bc-9e72-96f0e432c58f@nxsw.ie>
 <f753f088-474b-41bb-82d3-6684bea2f87e@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f753f088-474b-41bb-82d3-6684bea2f87e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15/07/2025 14:08, Vladimir Zapolskiy wrote:
>>> It's quite easy, sensors are not connected to CSIDs. Moreover data flows
>>> from any sensor can be processed on any CSID, there is no static 
>>> hardware
>>> links, which are attempted to be introduced.
>>
>> This statement is not correct.
> 
> Please elaborate, what statement above is not correct?

"static hardware links, which are attempted to be introduced"

No such static hardware link is being attempted to be introduced, that 
statement is incorrect or a misunderstanding of the intention.

> 
>> The port@ in CAMSS pertains to the camss-csiphy device not to the
>> camss-csid device, so there is no hard link to any specific CSID in the
>> dts scheme here.
> 
> And here it's just a confirmation that my statement above is correct,
> so please be consistent, and especially in any kind of accusations like
> you've just given above.

Sorry Vlad I don't see much basis litigating this further.

I've been very clear, I think we should have standalone CSIPHYs, there's 
no reason to bury them inside of the CAMSS block - see CCI.

There's a clear way to do endpoints established from sensor to consumer, 
there's no reason to give that data to the above CSIPHY driver, it has 
no "use case" for it.

Its unfortunate we've done parallel work but, I'd ask you at this point 
to rebase your multiple sensor work on the proposed CSIPHY series here 
and for drivers/phy.

I very much look forward to and value your contribution to enabling 
multiple sensors on the CSIPHY predicated on that rebase.

---
bod

