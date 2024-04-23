Return-Path: <linux-arm-msm+bounces-18290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0318AE62F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 14:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F2D61C21D66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Apr 2024 12:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DD285631;
	Tue, 23 Apr 2024 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SK2picvp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AB38528B
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 12:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713875721; cv=none; b=HeRUAKKNEvowBs5tRjiye/mhTNklfSYgcuYLOURpMk6M9hUfpt8sLzV2OZbZkGix2715NGya0ZY5uwX6/YeiTdLp52ojHHTWa5rMnrV7Hf+aSS9aOuKZyRxxWfiZ4C7zJaN8La2FcgaD1T9KFhYprx+sN0pyawcV87GrLJ7b1YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713875721; c=relaxed/simple;
	bh=+npk7CU5D1IrWY2XUTyMctxvg7b3VXIhqcFDFMQo+e8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YfW9r9XmMZ/uGT0DU4Cq8XJnjL8GItA0OdfEbU9k61yJgUtBezabKYGidrCkcwegCw1uZIqFOj09j2QQCqHFFFySlKRkqT4NEXMUEF9CVVPw3hvmnwz1ylazbQv3YWMI/q5w4JDPOTPa/HU0/dnXOkaXD7hXoiRahB0kCzzbrvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SK2picvp; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2db6f5977e1so74772481fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 05:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713875717; x=1714480517; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ph4gnrNXsU4/y4bAQnJy1r34G9v8Qh27X1SKuQMEaTw=;
        b=SK2picvpes6D9vOWit72ewWIIUxsxX4jaUcrp/zimEWXQVPYNGjwLrhvtEPmf0urVl
         YmRolHRpLQo/CPGoAA0Xww1h15iOR8CUET4kyVZkeEidK2ZP2+EDggHbc2LGCFlD8pzT
         r6YERu3hy+esQZxkQQA4H68CDTVWi7Wy2rU0RBYHOc/CTrPjpJC7Vhy/zvO1CvC4Za3D
         ah39nzB4PWGNlTzaPr5DoOQcQ9h9PMqPkGXaORoo0TVHtqATlWjAVp4xsEwdkKGD6INB
         EtKRuoci5Add5gCayWYXzzJ6FJ77yeirJl2stv4hcrTwdhwhh6IBtWsL8PhGSz999M+Q
         aMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713875717; x=1714480517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ph4gnrNXsU4/y4bAQnJy1r34G9v8Qh27X1SKuQMEaTw=;
        b=SNOY+xVNJr+vN6fZvwwYwBUSev081Rj5xkOaygitNssL4iTJAYnh+bkRH+dxbWRjk5
         8e9AuiNa/eQB7gI6CX6EhCNOLsv3EUumEzjih/Je0rtrQ+ys3pZv6lDQv7zjmELTQAMD
         28TBA002JLtNveSpRFVdAmDegkZrVdtVTrfP0b98zKpfp2zMp4dEbSmTgRqkBTmh0rIk
         lqH3CICUl5InFIM2SMKE23iIYTb+w4rb5mjWKvZS+daQqVt7Y71IK7cfBzxkj72rpR7P
         Tpt9Wes53eSSDtD3+EHVJ0Jfvd0u/8ktoygnxuwt5Xs+il721Fr+vCRa3MjMMEj7NwlU
         4Azw==
X-Gm-Message-State: AOJu0Yz/ev5yzPeXgITkoHnypq89mn8YomRHeS2oYBj7JnJ9y4eF+6Ak
	RTurQcfQvelgTd3O+9/gUothV8MuVaIXKuvfFmY8CQqGYNZEFm2mYowKsLoncCY=
X-Google-Smtp-Source: AGHT+IGpYlyiOfOUNdMRXGfWPTLzW+ofzpyxAXXOrOSh/XHRY4qI3aB6iBHB5IbjxUmQ1zoiQS/Kiw==
X-Received: by 2002:a2e:b712:0:b0:2d8:7fa5:5034 with SMTP id j18-20020a2eb712000000b002d87fa55034mr7987293ljo.43.1713875716528;
        Tue, 23 Apr 2024 05:35:16 -0700 (PDT)
Received: from [172.30.205.0] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id g18-20020a2eb5d2000000b002d9fc892cc3sm1718213ljn.13.2024.04.23.05.35.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 05:35:16 -0700 (PDT)
Message-ID: <c1d07eff-4832-47d9-8598-aa6709b465ff@linaro.org>
Date: Tue, 23 Apr 2024 14:35:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] clk: qcom: lpassaudiocc-sc7280: Add support to skip
 PLL configuration
To: Taniya Das <quic_tdas@quicinc.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240208062836.19767-1-quic_tdas@quicinc.com>
 <20240208062836.19767-3-quic_tdas@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240208062836.19767-3-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2/8/24 07:28, Taniya Das wrote:
> The PLL configuration needs to be skipped when remoteproc brings the
> LPASS out of reset.
> 
> Also update the lpassaudio_cc_reset regmap name and max register to handle
> the regmap conflict warning between lpassaudio_cc_reset and lpassaudio_cc.
> 
> Fixes: a9dd26639d05 ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>   drivers/clk/qcom/lpassaudiocc-sc7280.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> index c43d0b1af7f7..2619a8ced9d5 100644
> --- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
> +++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2021, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
>    */
> 
>   #include <linux/clk-provider.h>
> @@ -766,11 +767,13 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>   		goto exit;
>   	}
> 
> -	clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, &lpass_audio_cc_pll_config);
> +	if (!of_property_read_bool(pdev->dev.of_node, "qcom,adsp-skip-pll")) {

Big no-no.

> +		clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, &lpass_audio_cc_pll_config);
> 
> -	/* PLL settings */
> -	regmap_write(regmap, 0x4, 0x3b);
> -	regmap_write(regmap, 0x8, 0xff05);
> +		/* PLL settings */
> +		regmap_write(regmap, 0x4, 0x3b);
> +		regmap_write(regmap, 0x8, 0xff05);

Model these properly and use the abstracted clock (re)configuration functions.
Add the unreachable clocks to `protected-clocks = <>` and make sure that the
aforementioned configure calls check if the PLL was really registered.

> +	}
> 
>   	ret = qcom_cc_really_probe(pdev, &lpass_audio_cc_sc7280_desc, regmap);
>   	if (ret) {
> @@ -778,6 +781,9 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
>   		goto exit;
>   	}
> 
> +	lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";

Ugh.. are these really not contiguous, or were the register ranges misrepresented from
the start?

> +	lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;

Provide the real size of the block in .max_register instead, unconditionally

Konrad

