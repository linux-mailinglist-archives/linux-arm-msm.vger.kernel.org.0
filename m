Return-Path: <linux-arm-msm+bounces-9802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FAD849A6B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 13:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DEA21F21456
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Feb 2024 12:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BC11BC37;
	Mon,  5 Feb 2024 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPwwwYoA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A17D1BC4C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Feb 2024 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707136524; cv=none; b=rafBDTxK+g7Hgdi7VJGfBm9Qr+N1tx0AOROoQ3HvxI9YNLyofX6wp66CWePyvFRnETtVebGhbsJm2D1fHqN05tKxTP47oWdkGMcACFwqfpBRCZRSQ/burlHZVw2Cm8qucw76Chf4xOIdDLdeOTuBeLoO4JwYmTOvzh7avOy7qbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707136524; c=relaxed/simple;
	bh=pW4Sg5PcKZKdStlyRiQLu9/KWM+IE0TFUuYesPQuhRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huz33L6euU8KpYF1BKMY7pNw5egbFpW5+WF5l+hrNNrYP0i70TkadH56t0rhyc8AGmgQw54+yCc+to132TKNyAlDnipY2yGG1LKTsd0Kgc9DTmvIcJivglnxvTIHgLa3t7yv3nYm7WVorBApB1+VDZSvS+4AOhxsNbUXBUN/2X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPwwwYoA; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40efcb37373so39860375e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Feb 2024 04:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707136521; x=1707741321; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rL9f+hMYldBfyXyPiV4oRL8eI8BrgCpvwXNIqQTEkN8=;
        b=tPwwwYoAfiWBSVfT/wCEHml841FLpwOQjxqLWfZ82ldsQYwdt8KWD53J5w3u2uZxm1
         b/sVANALWY+y+9sOYHjSdoYXdjL8epkqduuyXDoN/26c4qLey+/rHuwDeLiQpkKQOzYd
         DVkA6WBtL2lhi3BAoKsp4b7EMMYxLKc7Hmi80umerziuPIUasY1xAW6FJGZWJBV/Q9Ll
         3TAv0yfOLFg9vMv3sd2IDCt6g7rqTVQmtxXlUBt5UoTSD9x39ixFlvEcy0+gTyWIou4+
         1vTpw90+Gob6EefrxpSurBRU0KIFIbEZWs/FsGwOGBpgiZIZxtwiKad1hKDeR9VDIyo6
         iOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707136521; x=1707741321;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rL9f+hMYldBfyXyPiV4oRL8eI8BrgCpvwXNIqQTEkN8=;
        b=jYeucZ/M0lKntOsWRy6IZg+OJGvHu4P/tBc4fKzG+h6/2wu7TKO5yQwcB+Hf9kI2lC
         rtY3Uiw+PHiP+SD/qWY76qbA0o60NuqQel0siW5ywwfMWGWksnbK4rWyunf7UhJrQg3x
         xIX2pCrX9ie5kcO5gy79NI+XW7KhbE97wyazuJ/FjjOeKnKVW4CxURHPohJpkddZrqLy
         Vhe1sthVOqW4ETZTIdzZFYm6g/euB7lTzDJY/TFoWBOJaEDJH+FcKwI6FaXysqj4cSEL
         JzEdCHERz84TzjyGMVVm83UmNIr7byKkI6atqX+OD60MlIx7Sbuli56F63sb46vZW7X+
         8E6Q==
X-Gm-Message-State: AOJu0YzhtgpFmrNC1W0axxuQmaXba1mRVpwVuSZMUsi0IFmG2TbkHyqa
	njZfs9Pea7OUHWXTgBK1HpFuWLd2Vlp3F50lLmUUxplIPSzC/YKZsqgnTHxhWQ4=
X-Google-Smtp-Source: AGHT+IGBs7Ga4VKeNn+Gz/1P5QMJidDVz1egOK2rkF0wXfVugFuuiH9Mu5AGfU8zCs7YIQy8dJSIGg==
X-Received: by 2002:a05:600c:3d8c:b0:40f:dd4a:11f5 with SMTP id bi12-20020a05600c3d8c00b0040fdd4a11f5mr1103731wmb.34.1707136520713;
        Mon, 05 Feb 2024 04:35:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVGgDIFmJTGPFNXa1N86mOVWKTmcwMjdH5S+6H42RhHb4SR66IFOxVizqNwQVbo27NRfJQ15bJvdVEMSp7/hJxGYhMenoHKt2G/RzhIQO9NfA/ja9ofyugpBx7AzZixud/jGzyNokfh4mjoJNkIw/x8F4QEsgbgi+TZ9nQhGQzXrHwcKKIQ6f/GPg73n1VC5aYbT6zHdLVclCE98RHFCzssPXPMXHiBWjsUVhuxGKPpy3wyJKo8H6fbe+TB+q3wwt/AR68eLLP/016u4YcalT4jJbW/CaUW5jZkHozHwJS439Pgh/pEy5KOvjPySe12/hH9Yg41flAVdCzXAgFuZJ6kLXfn8cRw0ggt4oZA+T9rMGeA3wlCjb+e5tvU
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id e35-20020a5d5963000000b0033b3cdb9336sm2256202wri.57.2024.02.05.04.35.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 04:35:20 -0800 (PST)
Message-ID: <a429f2ab-8c6d-477c-8abc-51243523064c@linaro.org>
Date: Mon, 5 Feb 2024 13:35:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/6] arm64: dts: qcom: add base AIM500 dtsi
Content-Language: en-US
To: Jingyi Wang <quic_jingyw@quicinc.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: kernel@quicinc.com, Tingwei Zhang <quic_tingweiz@quicinc.com>
References: <20240205115721.1195336-1-quic_jingyw@quicinc.com>
 <20240205115721.1195336-6-quic_jingyw@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240205115721.1195336-6-quic_jingyw@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2024 12:57, Jingyi Wang wrote:
> Introduce aim500 board dtsi.
> 
> AIM500 Series is a highly optimized family of modules designed to
> support AIoT and Generative AI applications based on sm8650p with
> PMIC and bluetooth functions etc.
> 
> Co-developed-by: Tingwei Zhang <quic_tingweiz@quicinc.com>
> Signed-off-by: Tingwei Zhang <quic_tingweiz@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi | 409 +++++++++++++++++++
>  1 file changed, 409 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi b/arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi
> new file mode 100644
> index 000000000000..cb857da8653b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi
> @@ -0,0 +1,409 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include "sm8650p.dtsi"
> +#include "pm8550.dtsi"
> +#include "pm8550b.dtsi"
> +#define PMK8550VE_SID 8
> +#include "pm8550ve.dtsi"
> +#include "pm8550vs.dtsi"
> +#include "pmk8550.dtsi"
> +
> +/ {
> +	aliases {
> +		serial1 = &uart14;
> +	};
> +
> +	vph_pwr: vph-pwr-regulator { };

What is this? Why is it needed?


Best regards,
Krzysztof


