Return-Path: <linux-arm-msm+bounces-8754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C487083FD1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 05:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29EC6B20F49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 04:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9723511CBA;
	Mon, 29 Jan 2024 04:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rnFuZ7Mr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1361172C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 04:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706501332; cv=none; b=lDen/64gsHeYZh8AP6pxOMQUQ7b5LXY7dCzVp6+pvyTaT0ew7vBOcQZKZYFG+iFKip3QB9QEwgVBl2CNVg9hEi0B/IcEMzcqxeVS9qwnopb/jTocHkP4dPcHxNBE0ENXu+mazFhp5SKOd5XG5aZtTEpFGc53AL8G8DkcyBuO6vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706501332; c=relaxed/simple;
	bh=MFnqxa2FlwSQnHD4FuVTTxhMbrdlgpPdXx9P5+EY9jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K31/U+f/AS3CepaBrhTOhQeDK/UB6iS3IuJ6Ds+VF3yggh4L2NCUKHqY0yWAqvcjpWpbVElzMhpC1ycr6I2BX2h4OaK3Mso3L03ayUcJXZyXWS1zhJFM0Qt8SMj9RflzHCKyE3QOBkCGJlRHVhQGSyGbGDllo0DTPuGlIUJEQ9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rnFuZ7Mr; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6002317a427so17277837b3.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jan 2024 20:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706501329; x=1707106129; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AKHdQZdCTLHs4pcHr7TzhQwsCq0HwLSonhICMhFAgjk=;
        b=rnFuZ7MrkWp1PzUWSio+u2CbOiXmUmCc2CONW/odWGuXNbfbcyLdvByxY97Q/v2Pfs
         CHujqPfiAAB0ph4BWthOD303v2WbJ76uT87ZXzKY1J6XyGrno2/RBEktkAHHEprF8vD1
         DbszTvEL7/5vC36fJFHvnIZN4ylwF3HeWvRy+Z2hpHh0gB7TUDZgzVbMf/US5zAwbynK
         Q8G3yS7IO1ZQZFsEnYJvagV12QMqWoF71imr1MGA4oXsWYCeaM/YI/2impEwv7b0jnQT
         GEyXhfyqWu1HAMvs8oMbtpFhHeMOsLN1tjsCwOPedyV/ModgG5rDbEywQUVLI2Gaf5al
         KXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706501329; x=1707106129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKHdQZdCTLHs4pcHr7TzhQwsCq0HwLSonhICMhFAgjk=;
        b=ZsjpvaqgG3fR08BMTJGI3XJo4+3OdsdJsOemI6WEk/MDCv4XRT13HV0XZCUXDXoWDN
         7GFbfo1BkoWyql8E6sHofl47DDur8UQUR1bxUp/Z52z1nq7dsutK7M7W4EtZXb5Nx+yI
         Ivk59FAoEoYoZi15kcWf7ut3wREVdLIdNPowIlf9LTrRgG02ayvOb5J+prMEk0xEntgW
         hQOc/ZhRVxGH827K0PJpeukStLb7+yEyWMbERlyzDy2KkShqKnULC9PS08OggrOCKjSW
         Am/vgPDuC932NGv8atFodqr0vPKZY4PhN8qPuggYUO4RvjhOoL0Xjn7+XrSE9XCA87Ri
         RFgw==
X-Gm-Message-State: AOJu0YzbNhnyULWSeiTjmTeALsBxiEfLbkDY7/wHwl0gOYk5ox8ZY+7Y
	jINwFk/1XhlNqQTB2ojfWvSWdco8OpNCbpnFuVBYbDpFmv8KEvvvaIUrYmhc1XxnmXCRBvLFenM
	vVdu+fBCdAEfSFhVjG89IELRYMksSpKjV2nQbGg==
X-Google-Smtp-Source: AGHT+IHmGSN3vYOtt0Yg2EhoesVrd7TO0jYAzwGfrgIgN8CjVtzRElVO9Po5LQYN1roAhOENrN/kaSwBj3wivE0PLWA=
X-Received: by 2002:a81:b666:0:b0:603:414b:d357 with SMTP id
 h38-20020a81b666000000b00603414bd357mr2958529ywk.52.1706501329443; Sun, 28
 Jan 2024 20:08:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129-x1e80100-clock-controllers-v3-0-d96dacfed104@linaro.org> <20240129-x1e80100-clock-controllers-v3-6-d96dacfed104@linaro.org>
In-Reply-To: <20240129-x1e80100-clock-controllers-v3-6-d96dacfed104@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 06:08:38 +0200
Message-ID: <CAA8EJppBtc2HKcZ2sAgBm=+sxtisp-hsADp-ui6PRTRRixB8xw@mail.gmail.com>
Subject: Re: [PATCH v3 06/10] clk: qcom: clk-alpha-pll: Add support for zonda
 ole pll configure
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, Rajendra Nayak <quic_rjendra@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 00:52, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
>
> Zonda ole pll has as extra PLL_OFF_CONFIG_CTL_U2 register, hence add
> support for it.
>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 26 ++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  4 ++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 05898d2a8b22..85f8e2ad0b37 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -52,6 +52,7 @@
>  #define PLL_CONFIG_CTL(p)      ((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL])
>  #define PLL_CONFIG_CTL_U(p)    ((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U])
>  #define PLL_CONFIG_CTL_U1(p)   ((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U1])
> +#define PLL_CONFIG_CTL_U2(p)   ((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U2])
>  #define PLL_TEST_CTL(p)                ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL])
>  #define PLL_TEST_CTL_U(p)      ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U])
>  #define PLL_TEST_CTL_U1(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U1])
> @@ -228,6 +229,21 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>                 [PLL_OFF_ALPHA_VAL] = 0x24,
>                 [PLL_OFF_ALPHA_VAL_U] = 0x28,
>         },
> +       [CLK_ALPHA_PLL_TYPE_ZONDA_OLE] =  {
> +               [PLL_OFF_L_VAL] = 0x04,
> +               [PLL_OFF_ALPHA_VAL] = 0x08,
> +               [PLL_OFF_USER_CTL] = 0x0c,
> +               [PLL_OFF_USER_CTL_U] = 0x10,
> +               [PLL_OFF_CONFIG_CTL] = 0x14,
> +               [PLL_OFF_CONFIG_CTL_U] = 0x18,
> +               [PLL_OFF_CONFIG_CTL_U1] = 0x1c,
> +               [PLL_OFF_CONFIG_CTL_U2] = 0x20,
> +               [PLL_OFF_TEST_CTL] = 0x24,
> +               [PLL_OFF_TEST_CTL_U] = 0x28,
> +               [PLL_OFF_TEST_CTL_U1] = 0x2c,
> +               [PLL_OFF_OPMODE] = 0x30,
> +               [PLL_OFF_STATUS] = 0x3c,
> +       },
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>
> @@ -2093,6 +2109,16 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
>
> +const struct clk_ops clk_alpha_pll_zonda_ole_ops = {
> +       .enable = clk_zonda_pll_enable,
> +       .disable = clk_zonda_pll_disable,
> +       .is_enabled = clk_trion_pll_is_enabled,
> +       .recalc_rate = clk_trion_pll_recalc_rate,
> +       .round_rate = clk_alpha_pll_round_rate,
> +       .set_rate = clk_zonda_pll_set_rate,
> +};
> +EXPORT_SYMBOL(clk_alpha_pll_zonda_ole_ops);

Let's maybe follow the existing example and #define
clk_alpha_pll_zonda_ole_ops clk_alpha_pl_zonda_ops ?
See the defines at clk-alpha-pll.h

LGTM otherwise

> +
>  void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>                                  const struct alpha_pll_config *config)
>  {
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index a1a75bb12fe8..99a3db9de4a1 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -21,6 +21,7 @@ enum {
>         CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
>         CLK_ALPHA_PLL_TYPE_AGERA,
>         CLK_ALPHA_PLL_TYPE_ZONDA,
> +       CLK_ALPHA_PLL_TYPE_ZONDA_OLE,
>         CLK_ALPHA_PLL_TYPE_LUCID_EVO,
>         CLK_ALPHA_PLL_TYPE_LUCID_OLE,
>         CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
> @@ -42,6 +43,7 @@ enum {
>         PLL_OFF_CONFIG_CTL,
>         PLL_OFF_CONFIG_CTL_U,
>         PLL_OFF_CONFIG_CTL_U1,
> +       PLL_OFF_CONFIG_CTL_U2,
>         PLL_OFF_TEST_CTL,
>         PLL_OFF_TEST_CTL_U,
>         PLL_OFF_TEST_CTL_U1,
> @@ -119,6 +121,7 @@ struct alpha_pll_config {
>         u32 config_ctl_val;
>         u32 config_ctl_hi_val;
>         u32 config_ctl_hi1_val;
> +       u32 config_ctl_hi2_val;
>         u32 user_ctl_val;
>         u32 user_ctl_hi_val;
>         u32 user_ctl_hi1_val;
> @@ -173,6 +176,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
>
>  extern const struct clk_ops clk_alpha_pll_zonda_ops;
>  #define clk_alpha_pll_postdiv_zonda_ops clk_alpha_pll_postdiv_fabia_ops
> +extern const struct clk_ops clk_alpha_pll_zonda_ole_ops;
>
>  extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
>  extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

