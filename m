Return-Path: <linux-arm-msm+bounces-11231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D948856EC7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 21:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F2E2281D62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Feb 2024 20:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15F713B2A3;
	Thu, 15 Feb 2024 20:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y0tV8u0c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23831139560
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 20:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708030037; cv=none; b=ANSywWhlM6jg/D9REBMnJld50AmTk/AhnWRDqc/10ng3jMulDqvPreFG6+afmzwL0eUEO/qpH8K6B3q6AkrbcH14WiuHksb2tcPZYtRgOBlQKP/u2XAYM/SoMxV8kjW4sA1PILGoxdkGak/TElbIJdEvoMK3Sb3o9XTe1vTO7XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708030037; c=relaxed/simple;
	bh=44BgV4oicz/rGKi//p4o94K+ZSxX1Yu/Qv3DnpWFVAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jACqyvW76pvQ5knxLxwLaR5TuZ8L2z2yXxrt6JZBonM72HTIfGifHN3F4Y610ZXqQcHstxwfVxqmwmwAOnFySEWmLSlhqkQPjdRQN7GHjk9ru2w9TTF9wCuEjXHReC2X85phfclKSoCxQIuTlOSIz62TbcwRc6MTspxp8yReNrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y0tV8u0c; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a28a6cef709so10568266b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Feb 2024 12:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708030033; x=1708634833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o10kEk/eS7gjgG8R7sXSriAe1317jCN+q5Gprc+KLJw=;
        b=Y0tV8u0cKGhjViPxaXnJgJhcR/G2i09hW/b3KPWHeAgCMNCOG+c6lhuoAtBCDig3+G
         RLO9n4IAtbwoPTWVTU7mt2JsaseahGuQvdNzCwAhcY09LFylBTodIUkChdd4E1KRa2QQ
         P4HTBTUKV37M0rEiUupqgYxu5TBX/JT5kAUUJg3ezrQClkIGc/ZHP9tM7DYt1tIlV+6U
         g/FNEZy9RHAhLGznDaYC6f1rB11dl2DrWcNkso/OYD+KoCwCvMWJvwEz6m9fjlGp3I5V
         bLn/usqQ5U5GG0VScPfpVTciK2b/sJ5eYrYB2szXU+rw8zCOwucHyaWTllEhC6ONRM3W
         IsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708030033; x=1708634833;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o10kEk/eS7gjgG8R7sXSriAe1317jCN+q5Gprc+KLJw=;
        b=X9RO1f5bjJsh1BaGpLWJxqPh/Lh+D/PBwn7XCL3XLDsdZtkR5KPf6uCaov3Q3PoBx7
         1sU1Ywx2UjUbxn2qGBf2HC7s5xAd2uw+XIqICBHQ3QTl1Q7oq/zD09QWCZnxGc3CKbWJ
         6XYo0IeQ7qRAjzNxAsmJpPqzDEXK1NxCHlsRP3aWXQDGg+PE2ufGXRgO+qgSj6bspKJ+
         ApV/G02PiYo+maKkhdZsPVdHdzm2AEOyODCxIKDXXhEjF3GA/2GJtDJCitHuE8/pAPvQ
         UeIpFp6DtI7dC7baELqGICvszL/FXw0ALr4ruVJtibDfFw+MyqcfBpPKQfXKZvFBNwmN
         3KJw==
X-Forwarded-Encrypted: i=1; AJvYcCVODMluzij+ZLbNg0LnbrTLV+HbmtNMg6jzTkTB+utD5qpCxYzA+8kG7N5WI2MPDPU5YXVOLbJMDSoNjrJ1JMVufSC9tng2qeUNaBjFaw==
X-Gm-Message-State: AOJu0YwQgmmpxF2IcXYBZPW8bVxg47ygptRD4n5wbzc3Pm/vXAPOl8Ox
	y0wi4huYBNaTPT4RxAmu9SbYYzOPcQatRaua8qXiFnDXueUNlk1yFrqjO21v4+8=
X-Google-Smtp-Source: AGHT+IG1IFNRg3FbQeBlhiBMN0o/5Awm6TsTWKNorFkU6Ark5AmN7biKHaXvaspq53XPhRwrDEuK6Q==
X-Received: by 2002:a17:906:40d1:b0:a39:1702:ea2a with SMTP id a17-20020a17090640d100b00a391702ea2amr2147849ejk.46.1708030033385;
        Thu, 15 Feb 2024 12:47:13 -0800 (PST)
Received: from [192.168.192.135] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id lf5-20020a170907174500b00a3cf7711d40sm905558ejc.131.2024.02.15.12.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Feb 2024 12:47:09 -0800 (PST)
Message-ID: <a2323580-6515-4380-a7d8-fd25818e9092@linaro.org>
Date: Thu, 15 Feb 2024 21:47:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] arm64: dts: qcom: sc8280xp-crd: limit pcie4 link
 speed
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240212165043.26961-1-johan+linaro@kernel.org>
 <20240212165043.26961-5-johan+linaro@kernel.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240212165043.26961-5-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2024 17:50, Johan Hovold wrote:
> Limit the WiFi PCIe link speed to Gen2 speed (500 GB/s), which is the

MB/s

> speed that Windows uses.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---

Hm.. I'dve assumed it ships with a WLAN card that supports moving
more bandwidth.. Is it always at gen2?

Konrad

