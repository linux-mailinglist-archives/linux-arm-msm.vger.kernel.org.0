Return-Path: <linux-arm-msm+bounces-62202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8820AE63B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 13:38:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 396A34A134A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204CC28641D;
	Tue, 24 Jun 2025 11:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wK46u2wt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E71283FF4
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 11:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765096; cv=none; b=Av6OQTBH68MwowVkREvprWECr/o3tPnRLwvRboAndkkcOfsfImi8okMtCDlM9ObuulQkXNelDCQsmXhUE1MBbKXk9qT/VA/gVO9rFwJmdGkY4Tds5maMUzixDVPYwBTvZnoWj7+hM3Q4/JSKDc9GA1WFk5GgYZABQFx0a7kr63k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765096; c=relaxed/simple;
	bh=RISdn8se4eZFI/7bIwlWhVghSpmypcU6lLVYr6WWbOw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ft120BOreGNpWmFivp6sqY5a3amJVTylFYMJ8HOhYZPO+CCnQEryWb9We1QlUz0p+SfmEk6A4uHJea2qKFOHV2WYuw6z1Hnj3fmO7+KDWog1sxkJz/3+G5Ze1Ir+eNGOQCZP1ZdGxJH8YA/aCDJK3in7rTzKuWtP+Lis8s24SAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wK46u2wt; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b7a3af9aso474896e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 04:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750765092; x=1751369892; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KU9iU+hQX85DLrN6RqDyNPoBwm/rVTmxBoMbBcJ2tl8=;
        b=wK46u2wtaCqvt57dtXkO+/EEQYDN49UbedbMXfSoF9IYAF+GYULdjQBA5Z9MqwUGIH
         wkkJsvDeMbInNwlHb+NqY7ze7vn7iq1uPoMfV12cChhrZO7QIH2YCOjFbDoMkcPs4i/W
         5nTHMsDnHp6yNUQUqcUMnqSbKdaT9CvDqFDpNXUIzQKBNQOqyE0NDCFNVFrmagqhWrTK
         nxEKuL1acyIIgKXbRAise/kEMUOmUjhpzitZ13Z8HWbRu8+mJUltBdUbNF5hH6k8FXUa
         mjTxROPJBB986rEvsm1qErm8Yzr/cuFMBnU/hEuO6mlnecBEOP4oQM1AETsuloe0h149
         KCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750765092; x=1751369892;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KU9iU+hQX85DLrN6RqDyNPoBwm/rVTmxBoMbBcJ2tl8=;
        b=tJYaT/cK1KgdK+rXSThZ0ofTbeaWVyFyjlZQKxD1hG1USX1Fe+z8GwJRmkWghIBdYO
         1Rb3nZ6Wf2WCFh23NyWqS4OQuzCP3WiyI2KFBsjRzWF/Twnte0540EwjYxd+1BvHRawU
         dwdqiB/yX9OLLyHtlILGTdvhD6zdOuBon/w5VWMB4krUTiPzeFEBBGWkYFReSnmlHG2z
         2aIm7UV3PRYBnc7KnEHe+pjrbT9/N0Nan8Um9uBEo7Dq/GO88vZWyr3Nf/RrPrRr+vYf
         yuqswM+5TV4aP95+1hU73I8xssVV5HrSJSFyiVolrJayXBvjfEZycCTGSnadQIJOrGt/
         1d1g==
X-Forwarded-Encrypted: i=1; AJvYcCWTMISgQFXwMqImDuP3+3iSZsPHG0OaIVMbmh8oOGJjb6Oao2V+zLr7jHychX5gOozOSu1dmZ/iZ6mIv88j@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp0i7Sn4jdscmIQZm+3PxDlfMFmoTvjx4W1jWWkHUnEyv7bErA
	Avr18DI+BrNLejBc1RA5J9AVHUzh4g7eAkERP08P3r1ap1PGgRuZtsaCtEUXXsKce0k=
X-Gm-Gg: ASbGnctSMoIVTJo7EochddLTNUuVM77dr0Zs52u18LZ51MRCm9tB37cl5oZk0O3NyBN
	eVR09SnX0KwgfxP+skHDUgXzrO8/IcwGoBzXnUeLZIat6jU8GMZIB8sNUKYCdtpCybATi9sOM1b
	KxD7FqTyBe1CcUsmA40/us4JsMFIq15bfSyVSv1eB6/cFPXqG1pLvf1Sf5jji+u2HTnSlKDe6LC
	doPgtCsx0AfTwicrFpcTE1xk/GGxo3/BfR5EVlBgp+OoJnQxbG0KBOIYxvWpA+8FlKEyuYuUf74
	xqtY/hH5po+wnsV3efj7IuG8bL0Q86uDsQmxgAggk92bsHYXtdO/zSOFSFDTnQ0F4Dgc1QCNb/5
	FbGOcgCflWq+BHXf6xrNaJGtOCqru0EYK6IqSc9Fe
X-Google-Smtp-Source: AGHT+IGLkRpAYMw1Gi9clpkFUqiOhmtR7IOar5rMOl6DHsBt9ot2NgeuSSchmngJj28KpJ8ax3YpSg==
X-Received: by 2002:a05:6512:110b:b0:553:af02:78e4 with SMTP id 2adb3069b0e04-553e3bbced5mr1755843e87.5.1750765092396;
        Tue, 24 Jun 2025 04:38:12 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbde6sm1805161e87.136.2025.06.24.04.38.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 04:38:12 -0700 (PDT)
Message-ID: <fff77f71-e21b-43b9-9da5-6cf819add970@linaro.org>
Date: Tue, 24 Jun 2025 14:38:02 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnects alphabetically
Content-Language: ru-RU
To: Krzysztof Kozlowski <krzk@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org
References: <20250624094253.57441-1-vladimir.zapolskiy@linaro.org>
 <20250624094253.57441-2-vladimir.zapolskiy@linaro.org>
 <aa56b956-95f3-484d-8afa-058925b95bfd@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aa56b956-95f3-484d-8afa-058925b95bfd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/25 13:10, Krzysztof Kozlowski wrote:
> On 24/06/2025 11:42, Vladimir Zapolskiy wrote:
>> Sort the entries of interconnect and interconnect-names lists in the
>> alphabetical order of values in the latter property.
> 
> We do not sort these entries alphabetically and you did not explain why
> you are doing this.

I did it, because I assume that the preference is to sort all named
values alphanumerically.

Since my assumption is incorrect, I kindly ask to let me know, which
properties should have values sorted by alphanumerical order of
${property}-names values and which are not, there should be a method
to distinguish such different properties.

Below is a list of the most popular properties which are coupled with
"-names" suffixed properties:

clock
clock-output
dma
gpio-line
interconnect
interrupt
io-channel
iommu
mbox
memory-region
nvmem-cell
nvmem
phy
pinctrl
power-domain
pwm
reg
reset

Thank you in advance.

-- 
Best wishes,
Vladimir

