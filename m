Return-Path: <linux-arm-msm+bounces-28461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4819C95169A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 10:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04AE42863CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 08:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0210481C0;
	Wed, 14 Aug 2024 08:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sf77wpav"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3020928DA5
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 08:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723624271; cv=none; b=OKnKLC4NQpaMVmnKA2ujCpvgx3U+o/pJWG1mdlO9cSJmeN0hbZm4febSD+IK/07Zc9o9bSgc3twPH765oZgNe0j461cJhexgXe58wiFUy11D9HlR0G5f/twNVSmhQoFaWCcE6f9aGsZXhvoGR2PzVAh679qHaewPLHuLdz4ovlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723624271; c=relaxed/simple;
	bh=WM4wGLw+bCnNhcdXmhghAEKcwd5gTCQsqiAP10ujOKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lPIfgqxYZDEt7HOXRfTglngjZL/VOQwu8EhmElW0S0nzh4TY6K7x3GoS/rk3wfkzaCt9NSR8AbPQD3XqSbYQ2wC85OXTjg++43jyXqSXrNqHp1ElK6a/5obCbqFxgEIQDR4Hh3Wsew4TWzi1mGhojvcG4sWGYSImQnba0COJgZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sf77wpav; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso69983121fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 01:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723624268; x=1724229068; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5gwQzCwBy7vN2/2RxMQ1HqIkB84Cqquw56cycMRPu0E=;
        b=Sf77wpav0iXojGKkcNcbRPAHJzjGxwacZ6dcjKd0lS6dm/GJUzEVbC36tLIFB/r/ay
         awU7QsArvv3eCB0zWoES/mTOMYLhg/RuGNlFMwDKg2GW+KbgLoh3Xkrl6hfFaYMD9cSG
         BLambWR0TVs6HvaSBmvRn44O409PrXQDTigcOBckk+JxDcjsdyJDBgoubNV9KGZaSnYW
         x2nbIhn6BYIWeUNhvv6lPXP+aDTFxw3lvvmbd8ndWtiMvcV8UUDTP5TvQl0lnnCnmY9x
         JUj1zYjHD9MRoOXyiWpO4dcOeGFoOQEDuOnt3KTKPlz2wmbRvx0dB62PK8vA/sROdh8f
         2eYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624268; x=1724229068;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5gwQzCwBy7vN2/2RxMQ1HqIkB84Cqquw56cycMRPu0E=;
        b=MN/FxIYd+LqyE2lPV1IPXoCwPxASXHJKL0qCPZAwqTnqttYC5WAf8rzQPoZ5j1mdqC
         Afxuexk8jv99SyephEVBoWtmv1qBgyVuVORuoZolX8AJznGTs/tp/PCKYHzS9Tv9vIq+
         mJr1C7/8eX3TAvp8RGm+WJSeoHX6Gd++IRmHYQAvrSLD4gkpRkThj2jOxbsd695neC5Z
         Y+stav6rAx8gDM+wvv+nxDV7YFiw5kl229x6YmSIxCh9TnPq/P2jnO+hOoPOJR2/5ykl
         veBRgDtGjICMDpJi9MXFmLxKZ8HbMvdlxg//n/Fvh+v3SJbp5jxDhZJaXXJX4354r1AA
         30wg==
X-Forwarded-Encrypted: i=1; AJvYcCW4mur0tojhufpkonhG3oi7tfpsCnc8orWvEU/28idZYSOjSfhyb3dJRqwHnclIP5YyabuOU5CXaHPOjZYo@vger.kernel.org
X-Gm-Message-State: AOJu0YyKj80z6j/p4pABPLqVuC/AncIOfGZwF8q6hjMGVHTBnpVgHSku
	fBZdHWDgwgBExPvyn5IUNn/kJVEtcfmJ8u9zXmQQerLjRYkgN9QKNimYxEm9hO0=
X-Google-Smtp-Source: AGHT+IF6QwpbeJz7sN4rejcITBP96MMp53BWoiX+ED7Mk7W84b6OrlnrFjb3C+iqG3cwrNXSoLTWOg==
X-Received: by 2002:a05:651c:50b:b0:2ef:295b:4946 with SMTP id 38308e7fff4ca-2f3aa1b3ba3mr13953301fa.4.1723624268052;
        Wed, 14 Aug 2024 01:31:08 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded58266sm12718605e9.42.2024.08.14.01.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 01:31:07 -0700 (PDT)
Message-ID: <487eb44a-be4b-4434-bf12-e3b679ddc42b@linaro.org>
Date: Wed, 14 Aug 2024 09:31:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sdm670: add camcc
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
 <20240813230037.84004-12-mailingradian@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240813230037.84004-12-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/08/2024 00:00, Richard Acayan wrote:
> The camera clock controller on SDM670 controls the clocks that drive the
> camera subsystem. The clocks are the same as on SDM845. Add the camera
> clock controller for SDM670.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index 187c6698835d..ba93cef33dbb 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -1400,6 +1400,16 @@ spmi_bus: spmi@c440000 {
>   			#interrupt-cells = <4>;
>   		};
>   
> +		camcc: clock-controller@ad00000 {
> +			compatible = "qcom,sdm845-camcc";
> +			reg = <0 0x0ad00000 0 0x10000>;
> +			clocks = <&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "bi_tcxo";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>   		mdss: display-subsystem@ae00000 {
>   			compatible = "qcom,sdm670-mdss";
>   			reg = <0 0x0ae00000 0 0x1000>;
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

