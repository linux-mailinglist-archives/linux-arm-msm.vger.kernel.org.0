Return-Path: <linux-arm-msm+bounces-49291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C922AA43EFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:14:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E49293A571E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E3725A2DB;
	Tue, 25 Feb 2025 12:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ePRKtB9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1681E1FBEAE
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 12:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740485657; cv=none; b=qaG4wpdOMh6ER9MRjXRCeYo89ZHapB+vseSKLnlkEWWW8zLpvJ6fJYGiV+eg1LRmmk75yCMUjx9wJ6oQX0YTEqCFUDdZ3AWSaQL7Dl2X1WYzR9sbu9PJjwjmtbBuGwt+RSjRgD08OtkIlXxa7xegNf6jR74kz1+f+BJfsiQboqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740485657; c=relaxed/simple;
	bh=mJicKQ0PEycmnzOCJ3b1UyYkIpJ4OoEZluDFDNvy3MM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6qOWfPWVp1To0sGC6WI8WKPYXixxLv1ogNEdmUdDXJsTo7Kzik772u0GZxT+gHYsP2JvRLgy0jiZo2XvYJSBHGa2Jxgt1/ij+oyx2x9KL/dC57DzefC/XXTpdcgzI6LAryzqu4BGfU3ySd3XXqpcYwFVo64Blr5Hp4QMU0bsiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ePRKtB9/; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7f9f57192so73476166b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 04:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740485654; x=1741090454; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v5fnly06+CmqlWFeIJmPZceHNs21M7+gnE2t1oYGWus=;
        b=ePRKtB9/YQpVZOeEUBYFyAwNwy6scOq1Q5+Sp4SgrXqhKlrcx4Rmxy7NdQ9+esARZg
         3B91qr2byDwK4szZBT25XSDHlUQ2hHew0LFXsFy6QQ6+6m39sXZxYC3ANfJiojT1L+4Q
         xsaRbwFRdIpXx8KpysZeT4oek6x9svM2uaEiNKFCRdB+O+bR/zwOyk91rasihLW3bpOz
         H8ZMh6obN4LVRGtUYnqXGPsw05KhzJc+d7fM+TLJxjYo95dtSf1br0qppJ1A2xZn4vJD
         NffbbQgOdVnLsCCpKeuYMpNvZ1rJ89JKy14CmruFyk3EfuSTp0l/8gyCWdBqZiskYhmO
         AIjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740485654; x=1741090454;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v5fnly06+CmqlWFeIJmPZceHNs21M7+gnE2t1oYGWus=;
        b=WsYODCQfcbz8qZPsqMFkEFYhjQIBV7qtG1cXTU5OsrXzVNus9PdMA5I0lzX5YW24uW
         rh4+EE72b12bgQYCcUBw/hEb1AuNaGo6Tx+OabJH4CBENTIe0gaJNVfW4udzlKQlsjVw
         +xEnmbVX5ZSAc6ov1jI+uNvD7Nl/ZYElIVLIyMyb4OgU03nlNsH6ToVioeRY4iBmYduR
         KSj5/L+L80zL0046+sr7CzJUkZyS6tfDcPJ5wtBjIDEu8knHJw4YSPWZVgxdEzKeXLEm
         9N3bm59M1xBzObrs4rt2892YH+iHj5DgW1thABMBm0cLhhkPyd6ZF2jFahPkZngA6w19
         i/FA==
X-Forwarded-Encrypted: i=1; AJvYcCX7O0StMMY73acviCdsM7BfkeD2Z6CXh5LXQGZgqUUf9iyNrbRNCaujtUk7j4RikJ2XkhKFc7hg6cyBpZV8@vger.kernel.org
X-Gm-Message-State: AOJu0YzyCi/JmSdbvw2zFuaIAGn56e+APepg8KPmQ2rcSi/3HFyAF5jk
	TJx70A3LmcyDEqrdvvc89Fu4JOwAeovNlvPQmXc39wGaSqmoOgVtRvLfHPEwDTE=
X-Gm-Gg: ASbGncu980t4qr5AV1DY08fsFrBtzb7ksMi0spLslR5qpJ064bSLWIHpuG6UBHOi3WC
	MVKNcU1lTZpgdScaB1x95svzDqH/U0b1ch1wc4mCsATNPIwotgpWXoHz6g4JYRBQP4hRwgrKjhk
	nhJl5sKCaWvY37mlj0uYGBn/T3eKHlRfNFcDIWlG3ATvGfAKhNVGvBI/HKRFhqDRMzQXp8SCj0T
	DD9mJt9qPSlQ0SbUqPa07ihgg4LpYFBFj5uM7SZdtkvgP9Sw5O0emxTrYCXilPqaYZVIZQ+KFSP
	z9P+E7ftASgiHuzQiAf5EyVfCm6mSwnmaqQb1JxGyMKY++AGU73DEyW67d9gi7wsJoZ53AEXI+J
	yDu3K
X-Google-Smtp-Source: AGHT+IHNSecMVYPg7kUTSpgSppbUi0iIwY7XvdrS70D3afB469L/MoT97QXoyQkoyZnSBV6IPjpt+Q==
X-Received: by 2002:a17:907:2d22:b0:ab3:8bcc:3d97 with SMTP id a640c23a62f3a-abc09a46c73mr650643266b.5.1740485654346;
        Tue, 25 Feb 2025 04:14:14 -0800 (PST)
Received: from [192.168.0.18] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed204fadbsm129189166b.153.2025.02.25.04.14.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 04:14:13 -0800 (PST)
Message-ID: <d93789c6-61d9-4761-98f5-aa3dbec14d82@linaro.org>
Date: Tue, 25 Feb 2025 13:14:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-slim7x: Drop incorrect
 qcom,ath12k-calibration-variant
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath12k@lists.infradead.org
References: <20250225093051.58406-1-krzysztof.kozlowski@linaro.org>
 <sfhcmlz3x254fdowufeeuh4uiwxfgkphm4ch4laceivbrs3zir@qvqk6jxi6zhf>
 <7b54e965-3395-4349-8ae7-51a28c759235@linaro.org>
 <kce6gzso22fp3ze2wp43fvy4tv6yqkaijm72kh5qk34jwijk2l@3ifaiz5tgjvl>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <kce6gzso22fp3ze2wp43fvy4tv6yqkaijm72kh5qk34jwijk2l@3ifaiz5tgjvl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/02/2025 12:45, Dmitry Baryshkov wrote:
> On Tue, Feb 25, 2025 at 11:22:25AM +0100, Krzysztof Kozlowski wrote:
>> On 25/02/2025 10:50, Dmitry Baryshkov wrote:
>>> On Tue, Feb 25, 2025 at 10:30:51AM +0100, Krzysztof Kozlowski wrote:
>>>> There is no such property as qcom,ath12k-calibration-variant: neither in
>>>> the bindings nor in the driver.  See dtbs_check:
>>>>
>>>>   x1e80100-lenovo-yoga-slim7x.dtb: wifi@0: 'qcom,ath12k-calibration-variant' does not match any of the regexes: 'pinctrl-[0-9]+'
>>>>
>>>
>>> Adding Jeff and ath12k@ to the cc list. Is the driver able to find the
>>> calibration variant in case it is not running on the ACPI system? I see
>>> that it uses dmi_walk. Does it work in the non-ACPI case?
>>
>>
>> But nothing parses such string as 'qcom,ath12k-calibration-variant' (see
>> git grep), so how would driver use it?
> 
> That's what I'm asking: is the property redundant or is it correct and
> it is a driver that needs to be fixed?

I assume driver will need something like that property, but that's not a
reason to accept incorrect one in DTS. One cannot add properties to DTS
without bindings, so bypassing bindings review, and then claim "but my
driver needs them". Send proper patches for driver first which will get
a review.

This could be instead renamed to final correct property, but since there
is no user, no indication it is needed or correct, I cannot prepare such
patch. I would not know what to write (e.g. "rename to qcom,foo-bar,
because I have no clue").

Best regards,
Krzysztof

