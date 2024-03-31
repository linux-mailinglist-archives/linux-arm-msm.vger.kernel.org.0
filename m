Return-Path: <linux-arm-msm+bounces-15855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB39892E39
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 03:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F6531F21550
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Mar 2024 01:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C7F10E3;
	Sun, 31 Mar 2024 01:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ec21xZ/T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4464DA5F
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Mar 2024 01:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711849180; cv=none; b=DizRxTyAEEL1CWxyq38aO7HTTXJQyA7gIzJNSQ0Jhvjo+YFfcLZAM5ov9ipQW2QzpNQhNjbJ/DSYz3ptp3eMPkahxZIzXEOdbdrMq+rbcbQ3cafQTippO30N+fisX89oKuLZtow/thTkIxYj7RwzgncXVh2la/u9nkX2uAEHINI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711849180; c=relaxed/simple;
	bh=Fn+TsTQBzYkr8BN5S8QtxbkmZytkFwSLWuUHGwvJlyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfcy2KMpzpPtEN3MMREnjCAjCRy6JRjHm+GyYVeyuivHMfZe4LWxEgvW1K4pPixxGrZW6nrhRtn7edyyTBqsKTVeSQRxrRK+uWOXOoN9RY3mtcD5D/mizQQd5xjDBCTycxVwdgDbRUFu/bQBeYIEuxMYJwBhdbDTRsg1NQ0uRuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ec21xZ/T; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbef31a9dbso2021209276.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 18:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711849178; x=1712453978; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IasEhL5XOtCSrP0eSjZWS05JFaU6jm3ChlspgQqiITE=;
        b=ec21xZ/TG7HJ1LadNOXPtAbdLUE0GLi2V1DvsA8oUTuSNLdZKdwLeeRDpcKVFNUXbZ
         yPztQK1YURJ/4KBRPm/rLfoGvYTpkKoLfIwuTdT69zFX7dX3q72m95O0PMHak5DaaQXI
         9ct84KgkjHV/+vqEW03DR/zfEpv8lsCF6RE9zVP7LvNnW1ky3+RIqMCCFNi11yuMhC8a
         zgaqKI3Dn6XPkGYD8Q2g3E4ozGXH4F3CEPfugWgaGDsoXxN9nLWh2BH/T2jtCTWPMnjF
         ZRDyC/2QkSC/M9M5cn7WCu8LerNJvg45lEa7MiKjLAMl2apwuh3XH2L63kEhFXMyPpwd
         288w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711849178; x=1712453978;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IasEhL5XOtCSrP0eSjZWS05JFaU6jm3ChlspgQqiITE=;
        b=Sk2WG0VCjbQTfMAqdcCO8STC1meFyzviZd+6zQCH8UaRxNPcdcu/I/aYEPTvO42B8L
         mEdfoEs4yQGi3DdGChmV7OJLMqs4Zwpxb1WTlm0roZo+Hjoke+GpsnAIw6ktaGvlCqD0
         8SA7yAz6ooY8Jam6cJ/jvOsXZlW8e9g19KcgyRUDIKbpcuqBzJhTgqfuKTP5Bs4ZYSjc
         W/Jb2pCx2uBK2b7gK4l+jxgbr8MLtLD5ivVTRP/zw5fdqWI+Bi6YKpd26hRq651kXDZo
         +f1ErGQmAfX+QQYmFnOXsLC6AYr+fhrOWrsC94lBGO44UQIliif9E8c8kN93gmWAQuKh
         nPog==
X-Forwarded-Encrypted: i=1; AJvYcCXNZUO9Yfio2sMJqktVtAEk3/xkYZ9OxxoA0eVJvCu4GDUiIlrHwHgQDQj6D4yb10y16BQCfCSt2IpNJkyz5E4jxJ6JPdNxYI2YI6wzDg==
X-Gm-Message-State: AOJu0YyhtvbZMl4Gp4jE7/WSV91vF2ElMucBM3duu040RiwoRDE8F+GP
	rAm9546E1+Q5TthbiSR9Ozj3Rmb/wdir1UH4a2+2yt4+0yc0V1LVSvpLu7kFl9cbovRTHFfk1Xm
	dKVwN/QbELa6DgN+gRkpWwHcPxjagLU6w6ZqK7Q==
X-Google-Smtp-Source: AGHT+IFZngZH/RN6IjIHSHcLDidaqOdf5FUk3Q4dmjxq8F5vqdd8kZDwudv1k1scL3eXkUauYjD8gHOMM0SAY40Yw+M=
X-Received: by 2002:a5b:6cb:0:b0:dcc:57ff:fb70 with SMTP id
 r11-20020a5b06cb000000b00dcc57fffb70mr5248782ybq.60.1711849178283; Sat, 30
 Mar 2024 18:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240330182817.3272224-1-quic_ajipan@quicinc.com> <20240330182817.3272224-8-quic_ajipan@quicinc.com>
In-Reply-To: <20240330182817.3272224-8-quic_ajipan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Mar 2024 04:39:27 +0300
Message-ID: <CAA8EJprtCbePun+gpwxg5e6o5NaBnunEJrmDrCV+O8BdHEeuYQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] clk: qcom: Add GPUCC driver support for SM4450
To: Ajit Pandey <quic_ajipan@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Mar 2024 at 20:30, Ajit Pandey <quic_ajipan@quicinc.com> wrote:
>
> Add Graphics Clock Controller (GPUCC) support for SM4450 platform.
>
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig        |   9 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-sm4450.c | 806 ++++++++++++++++++++++++++++++++
>  3 files changed, 816 insertions(+)
>  create mode 100644 drivers/clk/qcom/gpucc-sm4450.c
>

[skipped]

> +static int gpu_cc_sm4450_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +
> +       regmap = qcom_cc_map(pdev, &gpu_cc_sm4450_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
> +       clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
> +
> +       /* Keep some clocks always enabled */
> +       qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
> +       qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
> +       qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */

Why? At least other drivers model these three clocks properly.

> +
> +       return qcom_cc_really_probe(pdev, &gpu_cc_sm4450_desc, regmap);
> +}
> +
> +static struct platform_driver gpu_cc_sm4450_driver = {
> +       .probe = gpu_cc_sm4450_probe,
> +       .driver = {
> +               .name = "gpucc-sm4450",
> +               .of_match_table = gpu_cc_sm4450_match_table,
> +       },
> +};
> +
> +module_platform_driver(gpu_cc_sm4450_driver);
> +
> +MODULE_DESCRIPTION("QTI GPUCC SM4450 Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.25.1
>
>


-- 
With best wishes
Dmitry

