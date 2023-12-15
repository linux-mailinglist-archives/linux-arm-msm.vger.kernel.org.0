Return-Path: <linux-arm-msm+bounces-4927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10449814848
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 13:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB0DC284267
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 12:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FD42AF10;
	Fri, 15 Dec 2023 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="EjeWhxIP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E0E2D021
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 12:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c55872d80so10073915e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 04:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1702644047; x=1703248847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fNtmiBWPHlC/LwlBwvLKuqfbmVBFPg3plNoHQEQoN/I=;
        b=EjeWhxIPKHywT//YuEL5Lg7iOE0UH6DdEDiEgpZRz3hJUclhYXTPrtTr8GMHKCkpIu
         wusvN+g4wOU+/lErCDHJaicm71rHwMruY2YwfWyzgF+JJ9TitSa2M/R4YjYrRaA8hBIm
         crJA3bDB9/p/aJNJt2aoaNBHT7U+pJNSwywckKckRdJ2G+FfgXloaVmkogd+rF6L8Oxo
         0FvgK2obeVvWqT6OgDKynNdLWi1jCU9idSxb2PyGeVFCyFbnUPc+sjpu1D9neDSMPk/H
         YPnWHsKRzKUC4Jtf/DhhEbiz2DhAFp0O64WwNzFoPAEXMKSc9HhIaV4RJ6NdCLXDwKwK
         EE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702644047; x=1703248847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fNtmiBWPHlC/LwlBwvLKuqfbmVBFPg3plNoHQEQoN/I=;
        b=ofUdl5IMVvqRQJ70qDivbgZXpMLKJikix6lrqhsr5Y+qnMvUo/SLT6wnlPRL3e1t8q
         DpBQhANmRBnSfHM+lUeqL7ZaSS0RUU4y0yMVP52eXpLgdCid1fWxEOzerIZ/Q/vWWZgE
         g9KqyKHBSQpooFpTsUDrL8NoGvRagbYVpxngGrRqrvPH/bcc80mFL1YKThR9zOBotxhb
         hfN/Qar8+F9dCoXJ9Jws6sYr283TWDKv9bz3+0k3yfOfkqpC2IV+bEqZtAbTx3foiGBW
         PHNbCfkn8p3TQHM2Oe4FhleLus+rHpWLRArer6wJx6vogXRxNC23GcHJypKoZnluB+ol
         xwlw==
X-Gm-Message-State: AOJu0Yyv5V7wrSxX40W4w9a5Eoym0+S4J2wj3lFkn0akSlDA1uoORqsx
	91lNkPAo9whGeynOIKZ7IPcfFw==
X-Google-Smtp-Source: AGHT+IGiN3j4Qb8EtMxTkG4LySvEND8uLeelHp6zvDnIHcQUdtmycW6VA3EM7ZimDrcWJ4hDHRkLlQ==
X-Received: by 2002:a05:600c:4511:b0:40c:2d0c:a3ca with SMTP id t17-20020a05600c451100b0040c2d0ca3camr6080783wmo.89.1702644047102;
        Fri, 15 Dec 2023 04:40:47 -0800 (PST)
Received: from [192.168.100.102] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id bd21-20020a05600c1f1500b0040c25abd724sm31774158wmb.9.2023.12.15.04.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 04:40:46 -0800 (PST)
Message-ID: <fc6f8e78-f704-4104-b3c5-bd10627c33b4@nexus-software.ie>
Date: Fri, 15 Dec 2023 12:40:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/10] clk: qcom: Add GPU clock driver for x1e80100
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 Rajendra Nayak <quic_rjendra@quicinc.com>
References: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
 <20231214-x1e80100-clock-controllers-v2-8-2b0739bebd27@linaro.org>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20231214-x1e80100-clock-controllers-v2-8-2b0739bebd27@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/12/2023 16:49, Abel Vesa wrote:
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
> 
> Add Graphics Clock Controller (GPUCC) support for X1E80100 platform.
> 
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

> +static struct platform_driver gpu_cc_x1e80100_driver = {
> +	.probe = gpu_cc_x1e80100_probe,
> +	.driver = {
> +		.name = "gpu_cc-x1e80100",

I think these underscores are very unnecessary and subtractive of meaning.

.name = "gpucc-x1e80100"

> +		.of_match_table = gpu_cc_x1e80100_match_table,
> +	},
> +};
> +module_platform_driver(gpu_cc_x1e80100_driver);
> +
> +MODULE_DESCRIPTION("QTI GPU_CC x1e80100 Driver");

"QTI GPU Clock Controller Driver"

---
bod

