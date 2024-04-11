Return-Path: <linux-arm-msm+bounces-17230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 569438A13E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 14:04:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82CE0B254D5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Apr 2024 12:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5353814A4E7;
	Thu, 11 Apr 2024 12:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yXDtg14+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6B014B071
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712837030; cv=none; b=PcxLU8K1Ir8NrlwhQEWa37V/VlbbZMHZpozCM8ciLd9TGXNK4VUKhxRQgntWczqMPa+2XS2g718dIyorpE2BjX/X7mFXU3XMGg3q8Kt5+G9Uk3x7mjZeEl5Ypsu/9N7VAYOnsVu+N9RNcT4HopbwTey7VqDfrcpuGJRDQvoeH0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712837030; c=relaxed/simple;
	bh=YsvOlpZLPoUHIkr3UaqpI48VTI/10LmLMkVaA+4714w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S12FBAhrr2qhrRUfWCkdZtSKdfj7qAkWog9wBsWyVWcImCtuDDzwMVQZhrc4RBj6iHOdfsdeAZpJivUmUa96FCv3gWkLvfmKWrmq7GwZHq3qpWFxj4Jevi454NnzX3MS6d+xIdwTUXIzsf8zGfUhRdMctMEsp9j8IaInOJxeWOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yXDtg14+; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-516d6c1e238so6865280e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Apr 2024 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712837026; x=1713441826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IexOE42EXTCOMSvPu8H/Y3qybAXhflAFb2Zkj0hmMMo=;
        b=yXDtg14+lwrwAa0hN+p6zE4ww6KIx6SwWzr79JOMnQeMf2AOqELroEAxKbNDMRa2Wt
         Pig46UAMaJZQ9i0HKcEpieWxUDt7j1vkDNq+6sTsO+L6DfT9SBmj1ekw2wQiyb1SnJ0J
         Fb0xZcUdcZH6tE7Yd60CvgVdw1v1f9c7/K8VBp2BiTkMyNWk45msU21pQOMbxQDWeNmJ
         3xjsgA7x4aAkgdypTultVyXs4YghkLCoM7I3rAU3jW5KlahuNsmbpQfdroINEzQaBIiK
         d3+Y3gswsCEbrCAr25rtTpeEAjg76zgDSodmv6V/A9t1uU0lg3XzAnYArOZQ7H48Zfof
         R2Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712837026; x=1713441826;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IexOE42EXTCOMSvPu8H/Y3qybAXhflAFb2Zkj0hmMMo=;
        b=SCwMFIDQbTGxRP6AngDl70lEuGkwN7FAFPvqfXXJbvkPwriLIBWyW1o236XhXpZWsQ
         +pzUKKC+f3wakNISQmiqn2hZoi20v6VJbZ3+ybP9ddOxeBD0RG9FDkKkHTtzthDKxZVV
         yWr0rZE/xHlIIiBUdvEm6U6m434NBgF02DYg/0lzZZcr+JhOcFKcQk83DzVlzfrevzPz
         YLdCbiasHSLkixRanmYmiQwxprZKWYoWHFkJ7QJXjWAQ+usp2f4RA7vbP7crUJL2QK20
         33FjlYCgNtbeuqDnnAp7lucU/Sv2bimMcPLAEqP8/hh5bkAo1Q0xV9vJ7xEJoHe4q8qm
         3/hQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+2LjxsPaXzSprkwpiO0E4YhRan8/LdHOjKV1q9BfbSe1BLqqMAYpuCfz5nHTLmhkneSrAZ2zhYQKADzj0ZFl9hFYa6sY6b9JAhzCdvg==
X-Gm-Message-State: AOJu0YzJmrsxIye1vuXZbNZeezsBxsVNaKWNXYJNos6WFXFocizuqkrI
	NvdxEoNCmqvMl4rOacpApbrk1jU6u1iwZehnN/1eIyNlPqyRUJPPgU8lDdgAuek=
X-Google-Smtp-Source: AGHT+IF1KtcyUIBtnfg9KDZ5b4T9mpjn2O9ESuRogKrYvOyQsokLU/sC0dQ19l+xWvmO15eVlw7Akw==
X-Received: by 2002:a19:380f:0:b0:516:d259:ee5f with SMTP id f15-20020a19380f000000b00516d259ee5fmr3149347lfa.7.1712837026285;
        Thu, 11 Apr 2024 05:03:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c311000b00417e31724c3sm898855wmo.13.2024.04.11.05.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 05:03:45 -0700 (PDT)
Message-ID: <0b810e39-b82f-4cca-87b0-6e586690b242@linaro.org>
Date: Thu, 11 Apr 2024 14:03:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "Revert "dt-bindings: i2c: qcom-cci: Document
 sc8280xp compatible""
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Wolfram Sang <wsa@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20240411085218.450237-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240411085218.450237-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2024 10:52, Vladimir Zapolskiy wrote:
> This reverts commit 3e383dce513f426b7d79c0e6f8afe5d22a581f58.
> 
> The commit ae2a1f0f2cb5 ("dt-bindings: i2c: qcom-cci: Document sc8280xp compatible")
> was correct apparently, it is required to describe the sc8280xp-cci
> controller properly, as well it eliminates dtbs_check warnings.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Subject:
dt-bindings: i2c: Revert ....

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


