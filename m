Return-Path: <linux-arm-msm+bounces-28039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B15DD949BAE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 00:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E08001C227CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 22:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48525171E6A;
	Tue,  6 Aug 2024 22:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xPjIo4KG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38243171E5F
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2024 22:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985112; cv=none; b=C3kCwriQ6A2hdFS6oKftkfBo1PTd4ihKC4Drp8mNfzaJShOiSLEiikP5Xima4i8jgAbEOj+Z6nmtQm+EyrH0ynOAb9c8O/LWiDFS+HobBD9S92gKHbhM3ppn9MumVzpkB9cgOSzWpN23QBIKgdyn9IHjb1X3GeV9TL+ACd045mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985112; c=relaxed/simple;
	bh=DCrt4e2csQcgaOcoc7wvmZTQ/fOXRJmfPUKFxrYg/qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DarCbU5zQ/ZopgJQPzLYb6IKNzKag+/V/o1zASXOI77TSu20VDAKptSL2tuRAzS/+Jlauz3kCjSC7YAY62Vj55EtiOIgw3CFJ7/NLbW3LDpLYI1djkR3NaSAEvhR/dR/0sS2QsrXee1aKfkxUNk9C4PsaY8GuzkETlns8MZ3CW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xPjIo4KG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-368526b1333so184400f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 15:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722985107; x=1723589907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6VgOqGVZjJb+ycfH6+81Nmb6cqd2SEWfGswHYDs07ts=;
        b=xPjIo4KG3m9banCe/JgYu3zI+A6X7biKjSrWenyDfUgyvVJtY7gUE6gFY28kgWQhwS
         oDAAYK9haZzb1lCbp0cUa/rrkoLJUSYbD1ptsdfC8pg7pZu09FJ/rMGocnNde4cuxPMh
         rb9yvGDL2QMOY8jCz58HgZUSZnbjicfcQ44/F4ZJZ3fUJrlgrIcgwm4fr6UFTbSgkL4F
         SyAgbvCFCK6UGcv+QZt2o/trilHPOiI9/ZbLFMQ0q/Z/7DNJcfhcZl0XyG3e8AIXZ2qv
         KImN6fyCArEAAnj8NB8VbL7Uyi2FdY/oKKGKze7v+RVZqYeIiauPrRY2CSKWuZkEJ19z
         cjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722985107; x=1723589907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6VgOqGVZjJb+ycfH6+81Nmb6cqd2SEWfGswHYDs07ts=;
        b=EjtsQPOIVtVRkTFT4qgxvw1/EZ2Haq9dQN4obX46jIpcdaac1UvzBKjZvzEx/lP/sF
         B/ralDc1tR5aeDElnNtL4b0yvGoo7OxVywyf2vfbmCg9gdb8dL3g0buVuXniZlZL8xn3
         u1s4QRgt75gcaIvN3esVCNfP9TEhtLmddSGNZP/PVH+pchmbmhL+tu4rqIQ828YynQxl
         63tHTmMIWLsZod+ETbwZEpzq1dDKayc/2zWaLIEFGaW8C7RmsveSNA8M+ZrKhB3KqESE
         sZPa5xwABNVK0/c1k/8eez5JzZohVyYAV5xWfzN04n7oBWmxhJSffu6R73xVIE7BmI0C
         N3jw==
X-Forwarded-Encrypted: i=1; AJvYcCWjPkLNs468/ZCtxYgCw1xk1QSOpdYnAJxz7r4jOSwEeWz8+B9S93U6RVD1e9FuiLiCyjPj4gxGvlh/cG96NlYqWTTNwGdxxL9G/DnAFw==
X-Gm-Message-State: AOJu0YyVGSjXa6m0Yntyq20YqAef3ZpAzEPEfQaInBJgXw/+YFg2QdOl
	AJkIddIEz6QnY7XiEG+DiEuCjzIBVSG0RToCeQ8fi07iER5hFgG/rdrLYlW64dU=
X-Google-Smtp-Source: AGHT+IHr3I+rKTStPBoCANodVKvFELxt2xSun5IdD0M5aN8HcwcsaQwDHFSnpsdESWfT/LjY9sr+6w==
X-Received: by 2002:a05:6000:b8c:b0:367:9048:e952 with SMTP id ffacd0b85a97d-36bf0dec5a6mr159172f8f.18.1722985107468;
        Tue, 06 Aug 2024 15:58:27 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059a6703sm1063145e9.37.2024.08.06.15.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 15:58:27 -0700 (PDT)
Message-ID: <d083367d-cb61-40e4-b9c3-2ff3e450e656@linaro.org>
Date: Tue, 6 Aug 2024 23:58:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document SDM670
 compatible
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240806224219.71623-7-mailingradian@gmail.com>
 <20240806224219.71623-8-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240806224219.71623-8-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2024 23:42, Richard Acayan wrote:
> The CCI on the Snapdragon 670 is the interface for controlling camera
> hardware over I2C. Add the compatible so it can be added to the SDM670
> device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index c33ae7b63b84..49fa8304fe4c 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>             - enum:
>                 - qcom,sc7280-cci
>                 - qcom,sc8280xp-cci
> +              - qcom,sdm670-cci
>                 - qcom,sdm845-cci
>                 - qcom,sm6350-cci
>                 - qcom,sm8250-cci

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

