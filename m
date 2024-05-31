Return-Path: <linux-arm-msm+bounces-21244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFFA8D5F19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D43CB2119E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32B11422B0;
	Fri, 31 May 2024 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h8M+6Rsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCE81420D0
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 09:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717149549; cv=none; b=Pd1crC6N6GkyzhLJlI7pgxWHw2nw+MZ8FMwJrKRzAst2Oc/+QsANSeVNaFiss1IrhoKGsmPMwGVy3Cgwa2iEWhlZRSocmCDfC8rJPO7mkkCgg+qHO+oFJfjhGmzaCXXSWkmLtrxVB6C2xam+1/pjEJ0uXkCTvsSXflHmXhBpILI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717149549; c=relaxed/simple;
	bh=TS0aNFqbHPFsvBdQirYfOholEHMs1BHDZXm1LW+YKkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zs0LdOmZnpQA0ibWzzR3NzUPlf5FRxYagiYI8fI8FTZoQOyzMut+iTgEMD/jHpqsGoiVeJSnIKiubTPSMdW3y1TAeliGEuOR+wGJ/HiCQDhEFKvv8xAkhBRkZp8XiSjcAM9Iz9Ogv1GHyrFdfSa7hZWJhsBv01TvaG4l/QSSLWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h8M+6Rsj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3550134ef25so1861001f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 02:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717149546; x=1717754346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vi95+L4O4R0ZdGQiuRKgQLOfIqq6j8AsRKubh/zDydk=;
        b=h8M+6Rsj9pNRtMt2noBdosQCTnA7pGb7xrdd1h7y6Qwk5olk0ktdTyJrdL4ZbtkPDB
         Rcw+3LEqv3hKW1LenSynota8FiFg/NjaJX+g2CbsPFIBriHFs9muMjkoivaGgBZAGoXQ
         siqn9jpNDivMOtN5G3y3b0AZi5KI4OvYVOtMBiQ7TuMLcAQVyE3Rs6vEWfvM4kBKwT9X
         bfCRvZehydh9APRTsLmSzjhYOn6Z56iT7l8HlyNP0QkHmQYQxhCtdIABPSWo9VEEcVn4
         NLPiVfM8hfIWB6bwvbOoJsXQPWkT9zbeihEDs6aGp81WKRhBoxH7qeaHHjIssgOBi9k0
         hU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717149546; x=1717754346;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vi95+L4O4R0ZdGQiuRKgQLOfIqq6j8AsRKubh/zDydk=;
        b=wZI9xJ7da28iS8R1wngep/QrQiZm9eJWfiWZa+LFjV5bTk8vS2r4BmBqGy1u9lcg+k
         Vzrq16ublt1ctR+B5W9bTRcbDolTVrK/ibYMfcp6jA3K8jLoXavFp4ofrBV4CIJYe4b0
         1IappdiQ/beZvUfkkIf0opG6iGuukn/3giovXoaWUb514crrRfx2ZVkqTs+Hv2HPNSEv
         MyjuyjSeYgPHQjPvEI5Lcmg5+SMzJ5GTyBkg0dTW/i+OUyKHt/bWQgFnmVdNY91+wS9q
         MOqz1IJiLFCXav4srhTH68Rms0dokKxL3qqgvg1YCgWjhGDgKEE+SGUxqlftSUxb6G0F
         ah2g==
X-Gm-Message-State: AOJu0YwjPDf8rFgFvFmNM2YEaRmzdNTILdQzKQExMCUz9xwqd9OPlCoF
	8bDgY8qJWIyuVD42Bh7UNvF+VAPTTvJ0UvRFlLpxFRjPtdCr8YoAfncadBVleO8=
X-Google-Smtp-Source: AGHT+IEwGQkcSHmWfDPU2mEKb/h+ku1J5TFHAC//bbJyV5zfCFEovQssnCVv1NEmmdQwCLE0BKx7tg==
X-Received: by 2002:a5d:4dc6:0:b0:35e:11e2:5a5e with SMTP id ffacd0b85a97d-35e11e25c3emr621279f8f.58.1717149546401;
        Fri, 31 May 2024 02:59:06 -0700 (PDT)
Received: from [192.168.2.24] ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b8a758csm19891385e9.36.2024.05.31.02.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 02:59:05 -0700 (PDT)
Message-ID: <0f56831e-8572-46f5-89cf-d1e990813a02@linaro.org>
Date: Fri, 31 May 2024 11:59:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] clk: qcom: gpucc-sa8775p: Remove the
 CLK_IS_CRITICAL and ALWAYS_ON flags
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, quic_jkona@quicinc.com,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-5-quic_tdas@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240531090249.10293-5-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/05/2024 11:02, Taniya Das wrote:
> The gpu clocks and GDSC have been marked critical from the clock driver
> which is not desired for functionality. Hence remove the CLK_IS_CRITICAL
> and ALWAYS_ON flags.
> 
> Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/gpucc-sa8775p.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-sa8775p.c b/drivers/clk/qcom/gpucc-sa8775p.c
> index 1167c42da39d..f965babf4330 100644
> --- a/drivers/clk/qcom/gpucc-sa8775p.c
> +++ b/drivers/clk/qcom/gpucc-sa8775p.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2021-2022, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2022, 2024, Qualcomm Innovation Center, Inc. All rights reserved.

That's not a fix.

>   * Copyright (c) 2023, Linaro Limited
>   */
>  
> @@ -280,7 +280,7 @@ static struct clk_branch gpu_cc_ahb_clk = {
>  				&gpu_cc_hub_ahb_div_clk_src.clkr.hw,
>  			},
>  			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
> +			.flags = CLK_SET_RATE_PARENT,

I fail to see why this is a fix. They were marked as critical on
purpose. It was needed, wasn't it?

Provide jsutification for commits, not just sprinkle Fixes tag all around.


Best regards,
Krzysztof


