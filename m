Return-Path: <linux-arm-msm+bounces-42770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 363689F770C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 09:15:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7410116206C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD6F216E3D;
	Thu, 19 Dec 2024 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YF8O/PCe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589BC1BD01D
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734596152; cv=none; b=qURAmEUea+oEMGkcYEfEfYs3rZQmMm6HUeFvRN875E98QiQ2qYGn3Ej3FLMFmbMdo6wQASsEAdlwLU2fDbcghxYZFHcKeRgBX8QCaDgOaOVuUJ4AS0Za0ZnKjAfzdvsAKfzS+elIfDTTrLNjXtFaqbuAYKP1tw2BdMKaRKqNndY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734596152; c=relaxed/simple;
	bh=1Pa7ZqK8jBJ9o6HDfo2fK6P6onPvi8M5AseR46YM6Rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDV5Fqfp9Nfb3O07Gg8pkWqiRI1lFOz6Un4ICvWxbCP+XroqSxliMMmSB7fDVOWtW/G/AbO45isVcRxe39DMtE7KQRAddnaCSIO5bLWpCgFNPwktdSXfw98XeHsxJ+D9GngfV1qCZpwUlWmtSlG0OD7HbfouSr1QL4XcEm8s57c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YF8O/PCe; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-385d851e7c3so7252f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 00:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734596148; x=1735200948; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R8nkKPNVeuZfDWhVmISypup3R+4qveiv6WjtfKLomVM=;
        b=YF8O/PCelwIgGTUoekeovDGYmBUfJZLYHgzHI8k3vB76+oG/NLCgV901xfQKkBlrsf
         j54cv2zdUSuYUOgQQt59X22ivV7g5qBjkuWxIMqv23EVRb/FKHWolLgsfwruB1Il25Rc
         fN9DhT95aJ+UAVZBonm30W4wF3U/kug/7paneADsQeaCmABJrcfld/O2BO2UiUOY2jKP
         wXUcoC3O1lJDUWXrKCoi/Q9fe35iBX7976nRdZgvSBqLa087qyjhaRTv46ij/Gzyu8me
         zVrbzliWd9mDFq/s3CDkkHpDG7wk+e80GM60e89lk8euXKu55+fvYs+o6Z2voyEwOajG
         6zFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734596148; x=1735200948;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8nkKPNVeuZfDWhVmISypup3R+4qveiv6WjtfKLomVM=;
        b=ryDhEp8mhtK9OiodlBrU/Xn8W+OUEtnFUQdNfdGMJQorNT4Ph9IYtyLo011SgzVTLW
         65LdP6PNWybP7VfN/2/62Fho8r7tmFjEUlFo+uZ99kUk+0DbA8RWjvSxakxxFe7k8NSF
         vPx54mqX/A+msyrxpkyN+efJ+b0CB0zIDjSZ7fhm1gXhEiZRKwS+t5AW3oyWDKqnvTx8
         QHW7BdeGiaDPeKg2oQk79a8kXQSnX1YdMY2YtH7LOA7gjx0XlXb6ArMsK+DJSiOPwBbR
         rwvn8XL84bCWa1UgAqUdLSfpHeqy4NvjOrfxlJp2Rw5tel1u8yyEi0L4R1tQANtGflks
         I3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWa8CAvUwWNDsFd28dq/wy4QT5USxM5G4v9QLNEogru0KcfwwJH3V/i3A6mIWzROWDFV4MyrkKG+mEgrhfa@vger.kernel.org
X-Gm-Message-State: AOJu0YykHeuQh4fvLXf2PWqK0vQZyMriYRGTF7QgEy97TrSIBfJctkg0
	nPpnZKOUK+28pmJa3/AQy1JiimNnafXf4Kb1qkBfx3v9MEjm52yJPXLGj/TIAZw=
X-Gm-Gg: ASbGncsU/J/7aItxaAysi3RMGJHs3pu3a3odgQ0PrffdArhjPr34F6Ls8jPBGoc7+U1
	ugkTaZWs3ffbpyiBmeXrSB9gmBwuMiO7PK9fXa4oGRfbtgsadC4me7Wd2PUY2oq4NtY8DuGSc0D
	xtN60//2BNjRBEodDPCcdUtiXxxvfFsgdKJXcuiRQlAX8p1bYzw4cgNqU9Drdj2bcePE5OtY2tr
	4lssKcJh4ZV8va/iva6zoAwjjvaBw7K3P5j6/IFM8VNcV4Tr107pEFq+T0hZ7c3fP3795DPLYSi
X-Google-Smtp-Source: AGHT+IG20Dvi1Dz67p3T/a6LyvS1PnaCCT3e57rdfQ3NKuFlKzLHvMEgrF9Ihf72tkGDhtPx/hc0BQ==
X-Received: by 2002:a5d:59ab:0:b0:385:ed78:e188 with SMTP id ffacd0b85a97d-388e4d4f60dmr1851988f8f.5.1734596148550;
        Thu, 19 Dec 2024 00:15:48 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8330e0sm931348f8f.34.2024.12.19.00.15.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 00:15:47 -0800 (PST)
Message-ID: <2867cd9e-4de9-47dd-b4e8-c88f78b1113d@linaro.org>
Date: Thu, 19 Dec 2024 09:15:46 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: pinctrl: qcom: correct gpio-ranges in
 examples for qcs615
To: Lijuan Gao <quic_lijuang@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jingyi Wang <quic_jingyw@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
 <20241219-correct_gpio_ranges-v2-1-19af8588dbd0@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241219-correct_gpio_ranges-v2-1-19af8588dbd0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2024 08:59, Lijuan Gao wrote:
> Correct the gpio-ranges in the QCS615 TLMM pin controller example to
> include the UFS_RESET pin, which is expected to be wired to the reset
> pin of the primary UFS memory. This allows the UFS driver to toggle it.
> 
> Fixes: 55c487ea6084 ("dt-bindings: pinctrl: document the QCS615 Top Level Mode Multiplexer")
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof

