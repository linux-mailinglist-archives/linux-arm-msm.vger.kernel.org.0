Return-Path: <linux-arm-msm+bounces-55399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 573A6A9AEB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 15:15:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AE7D5A37D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 13:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D78227CB0B;
	Thu, 24 Apr 2025 13:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Inc4sMll"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF5627A93E
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745500491; cv=none; b=lwkXGIEaRCnRPcqhacUWgdE/ejWeyWi7GRJeM0oc3NTpC1NSRr/75X+sLDjNqYl45cawECtov1QBRH2Tha+yh+W4rHhkhbb0uCTE9YnjPzc8Ts29ZlaE0YY4uu0sAEmbaYx5C50auCjVACZ1iaiXuFQ+u1Vba5jkhfDkQ3UbIvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745500491; c=relaxed/simple;
	bh=ycSeVELEnwNAgAnxdeXGcGLnmcLA3gaLRIynsrsnfPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QBV2tPL7BOnQEo7vuDthPfUTgU+8HaDEnkUNIyabQiiDhRcmlddsqcV4chY7FWIwiGOYBu8Gcpdn28eHx8arTjn0Ab+V077ujx0R+X/ZGGQxIRAItUxb6e1OnldNcnWfBm/ODE4OrK5YyjUjNmnpruwrPZgm/qhlHv5tbQ+hwtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Inc4sMll; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43e9ccaa1ebso1268475e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 06:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745500486; x=1746105286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9fJDMJVKM5gjWUzEIaPpCTO0CvzLUUYLSldbcI5zTO0=;
        b=Inc4sMllR4Ky+HwjmzgXJGCZZUZZ6VXkRumDjM/lmCghite7Rzusuqm1EveksNEREL
         l5F/FpkIUp7bGTGPsl6lUv2+ErxDGbz9S2oD1el6FPnzkDh5+vSfAnDKxISfcNKnRgzg
         m6QG6eb/y+f5mBl8elBbwo+kVN8VVJtkSKdtTP2+sq+rKMHbeVgJMPfVulm85QowEjPa
         IUTK58uSY48A2K3o1kYsywpehQNZ7HqURZ9Mo7Tr5gf1MI0oj40AFe3COoUO3ouByz+1
         kzBubTOzhUyYkQtQzXuYRGJ5ckimauESBlK0zTKFVJcYtOmWPpj7ktg04B7JgMuu7lLT
         kYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745500486; x=1746105286;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fJDMJVKM5gjWUzEIaPpCTO0CvzLUUYLSldbcI5zTO0=;
        b=DO4z0SNKZjW0EL7rSLh1BD2bGp2x6G0SjCzFsfrKUxFnxrBDRJJXWcaod1Dw7NTxu5
         EzCphd0xjy1LBrBfaL/Jmt7ycekCoc5tVdCkJTUGqE4b4Z5jo2B4PlDU7jLNGdxda1gC
         pIyqtFjKPWSoFEqa/1Zrn2Xl14sfM2j0DnTsl9dkEQVzzQWIMz41EpgkfZ0IcQsB3b1H
         JPPLAgs0d+y3sjGk1PSZAYxDqJGEBYaVSzJNHgyGJt2hS/kXQF8z8xZj1QU5vT54oUuS
         bhL+J/65m6HwxsSKktNhXkGDHd47hU8NYHPjF4pjYAYy3oHV3/XRltWkaHtq9rhiBgp+
         aPhg==
X-Forwarded-Encrypted: i=1; AJvYcCX2xZ/6g1QWWoK2qGooQzxY0QxWUtfdasAwWqWoAjsyny4QvnCw+EqcbCWB6mKJS5y6fiZ4EX0oUPOY36dZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzsPZgaAgLfdc1fF42bWv1MTJ1edef9/KYSO/z5/E0CQk1Jb8vl
	NsEwzm81Hdjou+viAn1aVOu4Fi+zTnTi5h8ty0f0sP5hgYzUUOtLXNBs7ymN2A0=
X-Gm-Gg: ASbGncuwI/2TAfLd1KDtoN8TcSoyekDjOQfUnVIL5UvSk7ePDfHm6yDQxbzcpv2S9Wk
	XcF9olNLkm3f/TvMpX6NOv5/U3V6fv0Wr+07iZdLTXUEKTtvRMo4gA7aKw0xDCymvY71F1MEUGS
	GsP+5yYiMrK0rfsIk1lX9I56ZHJYlgq8ZK/r5qGu8p6JOTQIAQEH6LNBu5EU8uF0sqmkW50Gt55
	P2J3X6Ft/CJ8b2F810ZYz6r5CTi8MSzPbMQD9AkFZxrs52WYYRoHpqMciGLHvSa1YgU5dMouGuy
	yA4KEXFxzjb4A5iRsl4rrc2m7zBdDgwF1eU6bmiqdf8J4k3dPZhrplY1oe0=
X-Google-Smtp-Source: AGHT+IEzRy/+rQU7LjsCXdU47mWuRWSR0lDw2YUL4cJ/OTcTVyaMy8MCbXOqx/W7rdoUK4xr6xZIFw==
X-Received: by 2002:a05:600c:3588:b0:43b:c228:1ee0 with SMTP id 5b1f17b1804b1-4409bda57efmr7730915e9.7.1745500485899;
        Thu, 24 Apr 2025 06:14:45 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2e00d8sm20344205e9.35.2025.04.24.06.14.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 06:14:45 -0700 (PDT)
Message-ID: <3a222bb6-7401-4442-afcd-6933cbf811fb@linaro.org>
Date: Thu, 24 Apr 2025 15:14:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 1/4] arm64: dts: qcom: sm8750: Add display (MDSS)
 with Display CC
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>, Abhinav Kumar
 <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250424-sm8750-display-dts-v1-1-6fb22ca95f38@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/04/2025 15:04, Krzysztof Kozlowski wrote:
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 30ee98567b6078e8225142f2e13b25b5f35a3038..753b069cab1de636a3b1108747f300bec0f33980 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -3,7 +3,9 @@
>   * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8750-dispcc.h>
>  #include <dt-bindings/clock/qcom,sm8750-gcc.h>
>  #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
> @@ -2585,6 +2587,419 @@ data-pins {
>  			};
>  		};
>  
> +		mdss: display-subsystem@ae00000 {

I forgot to move it after all the rebases and merging other changes, so
this is not sorted by unit address.

I will fix it in v2 (but not planning to send v2 now/soon).

> +			compatible = "qcom,sm8750-mdss";
> +			reg = <0x0 0x0ae00000 0x0 0x1000>;
> +			reg-names = "mdss";
> +

Best regards,
Krzysztof

