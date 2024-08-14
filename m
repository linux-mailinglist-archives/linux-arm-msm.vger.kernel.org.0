Return-Path: <linux-arm-msm+bounces-28463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4E39516C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 10:40:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A25FE1F2489B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 08:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 508F5140397;
	Wed, 14 Aug 2024 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sjaDuM/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832AB13FD99
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723624819; cv=none; b=Ce6wLRpSmPJQDQbcDXXhe4C8HGQao7Rs89guNyMXNxSey8+yfl39CwMuAY5cBcktZOudeBt0EXbbolz5UQvE2rii6cBvNNq3/75qoUKKcSy/omqUbjbqkUAgL61LSooCeSNBbSs6Bjp4fI67MNWwWNmJd11et6PHXYS7Br2V6T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723624819; c=relaxed/simple;
	bh=DVbdr7AanZ27U9ijojEgtJoKR5IMhUJXo/vEn3/GQvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rGXm+hyuCoprNQnu9jpaxS6JUC2Ce3YGVms6wBU8d4b7QWEwmTV+tXAVsjauaUx0TQpls61u4B11F7MQTQhi0GvruwvWKTAjVxR/pMk85Kg2wM6jrr/aiFF1iDvy0VxtLzjUBrQ1jCuHGVozcZqdqfBXTh5cFgmZqe3taWGmJZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sjaDuM/d; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso46595425e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 01:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723624816; x=1724229616; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WaeWWCopdnfx9jqWozyufPs4aDdtkzcEVh6S88PN9p0=;
        b=sjaDuM/dMQbqLsRlnNax8QjVhuJhUyQn28EssKeibZXrMddQunuCOPz7xrIflemoNK
         ix/2YRdFNVCPPsbBFlZgM+B9HDduYlILxsOxKYl5J9zlHgQpcp7OUh5rc05dKORzpduv
         IQ6fF3jW30tqqvviw1ikeGld2Z2Ee8UKGhnBE04k8FNqEjixiez6JLEnkjwkCQGX9qjI
         CmxU7sfWkj5J8Mbe5WZ7vC540ruYJJ0VdfyF5ntq5gLZOS1x4TTlujhiMgoCX8fzI8Rj
         eCFDBq3QnRv/LQnTqJgy20LgrkZyHkYaGWox+lZD2KdaEMKvI74+RDS6u/lsyz4kkvVt
         ML8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624816; x=1724229616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WaeWWCopdnfx9jqWozyufPs4aDdtkzcEVh6S88PN9p0=;
        b=vJhGu8coEFGS3ObWjxL3r8dK6DAphTkGAHrg4JZphHWO90OIzcx2iyVGxUFmUl3BSB
         U1k6wtdPMzJBaXFQ10I/odhCro20ifA2ienANUMAfaoWaUk4x7uelX2mNpELq/JX0RVA
         axl8xITHGzvO/zwyTBCKcu/szntPag4DY8/OIqzotnPN+1iK0oCYXWyWF8VxYVyHPkEc
         8zrLifZ96JHAoO0w48lSzDWJh5wTCmn71Zin5cve7hy3eCtgadHqxNcPpkVaky43Q3px
         MD6ZfNq7sqmc6dzD1Y1SZmAv4OY5NsEvXdGgAdZKhOmxbwAR7I+Q27zBYipk41avXPkn
         UmdA==
X-Forwarded-Encrypted: i=1; AJvYcCUt4IMGckHfkM21JvMmEIGjC0ft4X0ZqlKQfBd3NeZccsGebN9hchYOz2BqFjOUPbtKy9/N2MrB8ouZbEJ2mdsr1Lh1qADTLRNk6vmXiw==
X-Gm-Message-State: AOJu0YwUqlCEVgadIE8BaeiZhuKOWSdSamqDXsGFkzb5ZrzTEbp6omAK
	oT7L9frjohWUUgUV6v1376QZyMbM7Rf1X94Haj4quXhk0BujG800B5KGeJIaf9U=
X-Google-Smtp-Source: AGHT+IHrHFeh+5ZkoLxrh4JYHitQRcU8I+BlGBcaDvHfA/mRypqzGEr2lZtlq2RcKbQzVws8W2FBuw==
X-Received: by 2002:adf:f9ca:0:b0:368:4e2e:7596 with SMTP id ffacd0b85a97d-371777c60f1mr1429656f8f.37.1723624815742;
        Wed, 14 Aug 2024 01:40:15 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c36bb07sm12382299f8f.5.2024.08.14.01.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 01:40:15 -0700 (PDT)
Message-ID: <bfb6d579-44c9-427c-aa79-8e5d9bdda0d8@linaro.org>
Date: Wed, 14 Aug 2024 09:40:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: i2c: qcom-cci: Document SDM670
 compatible
To: Richard Acayan <mailingradian@gmail.com>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240813230037.84004-8-mailingradian@gmail.com>
 <20240813230037.84004-9-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240813230037.84004-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/08/2024 00:00, Richard Acayan wrote:
> The CCI on the Snapdragon 670 is the interface for controlling camera
> hardware over I2C. Add the compatible so it can be added to the SDM670
> device tree.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index c33ae7b63b84..87f5e5bdbbe7 100644
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
> @@ -143,6 +144,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,sdm670-cci
>                 - qcom,sdm845-cci
>                 - qcom,sm6350-cci
>       then:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

