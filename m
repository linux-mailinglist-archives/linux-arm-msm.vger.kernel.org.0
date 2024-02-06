Return-Path: <linux-arm-msm+bounces-9939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF41284B448
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 13:05:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95700286F5F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 12:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01CC0131732;
	Tue,  6 Feb 2024 11:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFhOF60v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33871134CC2
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 11:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707220458; cv=none; b=mpn+VvcbV1zWnVoJxxTV+GVOQd4QJCAssttJnsiXMADEJ9PplLomy8U20rP/OeCVKRiGBHD3qdQISj+SMOZzRw/XkRCO6KIRuakg2RNLtTX5E0Kt/YejLu8yLL5zk3RIxKys6G+OWY7r/1ksNO0SZLY+XPWpJDTkogUF2HKOq9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707220458; c=relaxed/simple;
	bh=c4nL2AZZAqBG96kJsZ0MdlzC79I8FOAon3zB9YTB6o4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VVdnxXpReR5LZhHk3aHLiOZNzvJhpj6kGr+1YOR9qTQwUjjPyX1hpa/myDzgWDrUrG+O7FPn2KnJpoimzi86NprXILUznW8g5BARYdJdhcGoqJkxZV5jRuaDklrqrFma1lvXfrem4mYBEwr90B8OgHtUA/4GdiF6WfeIFxzp1uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFhOF60v; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-604571d73dcso21648807b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 03:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707220456; x=1707825256; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k+g2G1J563FhgHa0pVbwRRYWXQO1ux5R87Q2h090ixk=;
        b=YFhOF60vGk7fZJQsD/JUbJYjE+p4C+hZ+yIxqeU1aKz5GecNNW+2RPyE4YiZcIlCcE
         xOReZi6yWSlk58UWvabK2CfGdzUw7TfwMxzVsiNyrbdCJuvxBFpkYcRlzi3JS6S8DVXX
         j3tsERJDauSjUcmHFUcfRd1KfpYLPtKfWcaz2zF4/B8RoOVSbqPZlPNegyiauQuckRli
         y+RyRWmgL0dwyjfEerHwkCHtOZ3FJQsTJxTISVIadJ0GEh5GL3V5KXmS/+EmnEdQWhQ5
         EldtNlxdcJrb/nwokHvDEWAEHwak/1fIJk2pNkr0WSOnnj6XiTfNbLpPq15J5axpHror
         2B5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707220456; x=1707825256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+g2G1J563FhgHa0pVbwRRYWXQO1ux5R87Q2h090ixk=;
        b=DqT8SqnCbT8wAMNoZdFLPzfzoRVyozNQDo6B5cNG9YcQ9kVlWldQa8Q8UAGvbljRK8
         nW+LjWpbE8htQ2apiiFuWcLjNiQ7CUIiVgbLGtOuuJpKOlSo2/RTdWKcBKPaV7MaJlxI
         Iidq1ia4ti7qkB5kbRFcr3L2Msvind2d252KlattLrW6Qtl3mG/7IWoNscuWhOBKwpBa
         yoMjzaa0SYWvU11fCvK1KOPytMwiFbjFBZOb6Id5ik0sK2F77eNoRbjmVurrlBTJZIUg
         x7g4R7+r5RLfJEVRdJteRtKb7h53q66RZSRanogE/+4ezNxdfK2Z4QCrL5lg+Mfws2ZU
         NY8g==
X-Gm-Message-State: AOJu0Yw+DO+GnneiAxmOCVjxg6zNjTTleBJQSD0RQ50/wa/oDwcSwD1C
	aRecmSksiicuGwracC31OBiTZu8JAHx/efYA3XyOKXShXq87MFEdlqkL7EvAT00TIVnW+W8rbkY
	bkY0QgYXNl4GT8xiXq54aHpku5OFXzO4zMMDdLA==
X-Google-Smtp-Source: AGHT+IGyjkoi6lCugHYrX0jjGg7nYH9KbgUkdjJNkYsIwUNnqru8Qqk5EuxRiN4f6S4+SLN0+PzCRkU1QWTTXKFaxcE=
X-Received: by 2002:a25:216:0:b0:dc6:4062:1341 with SMTP id
 22-20020a250216000000b00dc640621341mr1452675ybc.16.1707220456035; Tue, 06 Feb
 2024 03:54:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206113145.31096-1-quic_jkona@quicinc.com> <20240206113145.31096-3-quic_jkona@quicinc.com>
In-Reply-To: <20240206113145.31096-3-quic_jkona@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 6 Feb 2024 13:54:04 +0200
Message-ID: <CAA8EJpqbKQS7Bp28xNZ0twu7BFLdOES9qS5xBvoonux8Ma4q6Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] clk: qcom: videocc-sm8550: Add support for SM8650 videocc
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Imran Shaik <quic_imrashai@quicinc.com>, 
	Ajit Pandey <quic_ajipan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 13:39, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
> Add support to the SM8650 video clock controller by extending the
> SM8550 video clock controller, which is mostly identical but SM8650
> has few additional clocks and minor differences.

In the past we tried merging similar clock controllers. In the end
this results in the ugly source code. Please consider submitting a
separate driver.

>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/videocc-sm8550.c | 160 +++++++++++++++++++++++++++++-
>  1 file changed, 156 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
> index f3c9dfaee968..cdc08f5900fc 100644
> --- a/drivers/clk/qcom/videocc-sm8550.c
> +++ b/drivers/clk/qcom/videocc-sm8550.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>
>  #include <linux/clk-provider.h>

[skipping]

>  static struct gdsc video_cc_mvs0c_gdsc = {
>         .gdscr = 0x804c,
>         .en_rest_wait_val = 0x2,
> @@ -354,15 +481,20 @@ static struct clk_regmap *video_cc_sm8550_clocks[] = {
>         [VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
>         [VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
>         [VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
> +       [VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
>         [VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
>         [VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
> +       [VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
>         [VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
>         [VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
>         [VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
> +       [VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr,
>         [VIDEO_CC_MVS1C_CLK] = &video_cc_mvs1c_clk.clkr,
>         [VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC] = &video_cc_mvs1c_div2_div_clk_src.clkr,
> +       [VIDEO_CC_MVS1C_SHIFT_CLK] = &video_cc_mvs1c_shift_clk.clkr,
>         [VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
>         [VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
> +       [VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
>  };
>
>  static struct gdsc *video_cc_sm8550_gdscs[] = {
> @@ -380,6 +512,7 @@ static const struct qcom_reset_map video_cc_sm8550_resets[] = {
>         [CVP_VIDEO_CC_MVS1C_BCR] = { 0x8074 },
>         [VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
>         [VIDEO_CC_MVS1C_CLK_ARES] = { 0x8090, 2 },
> +       [VIDEO_CC_XO_CLK_ARES] = { 0x8124, 2 },

Is this reset applicable to videocc-sm8550?

>  };
>
>  static const struct regmap_config video_cc_sm8550_regmap_config = {
> @@ -402,6 +535,7 @@ static struct qcom_cc_desc video_cc_sm8550_desc = {
>
>  static const struct of_device_id video_cc_sm8550_match_table[] = {
>         { .compatible = "qcom,sm8550-videocc" },
> +       { .compatible = "qcom,sm8650-videocc" },
>         { }
>  };
>  MODULE_DEVICE_TABLE(of, video_cc_sm8550_match_table);
> @@ -410,6 +544,7 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>  {
>         struct regmap *regmap;
>         int ret;
> +       u32 offset;
>
>         ret = devm_pm_runtime_enable(&pdev->dev);
>         if (ret)
> @@ -425,6 +560,23 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>                 return PTR_ERR(regmap);
>         }
>
> +       if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8550-videocc")) {
> +               video_cc_sm8550_clocks[VIDEO_CC_MVS0_SHIFT_CLK] = NULL;
> +               video_cc_sm8550_clocks[VIDEO_CC_MVS0C_SHIFT_CLK] = NULL;
> +               video_cc_sm8550_clocks[VIDEO_CC_MVS1_SHIFT_CLK] = NULL;
> +               video_cc_sm8550_clocks[VIDEO_CC_MVS1C_SHIFT_CLK] = NULL;
> +               video_cc_sm8550_clocks[VIDEO_CC_XO_CLK_SRC] = NULL;

Please invert the logic. Make video_cc_sm8550_clocks reflect SM8550
and patch in new clocks in the SM8650-specific branch below.

> +               offset = 0x8140;
> +       } else  if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-videocc")) {
> +               video_cc_pll0_config.l = 0x1e;
> +               video_cc_pll0_config.alpha = 0xa000;
> +               video_cc_pll1_config.l = 0x2b;
> +               video_cc_pll1_config.alpha = 0xc000;
> +               video_cc_mvs0_clk_src.freq_tbl = ftbl_video_cc_mvs0_clk_src_sm8650;
> +               video_cc_mvs1_clk_src.freq_tbl = ftbl_video_cc_mvs1_clk_src_sm8650;
> +               offset = 0x8150;
> +       }
> +
>         clk_lucid_ole_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
>         clk_lucid_ole_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
>
> @@ -435,7 +587,7 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>          *      video_cc_xo_clk
>          */
>         regmap_update_bits(regmap, 0x80f4, BIT(0), BIT(0));
> -       regmap_update_bits(regmap, 0x8140, BIT(0), BIT(0));
> +       regmap_update_bits(regmap, offset, BIT(0), BIT(0));
>         regmap_update_bits(regmap, 0x8124, BIT(0), BIT(0));
>
>         ret = qcom_cc_really_probe(pdev, &video_cc_sm8550_desc, regmap);
> --
> 2.43.0
>
>


-- 
With best wishes
Dmitry

