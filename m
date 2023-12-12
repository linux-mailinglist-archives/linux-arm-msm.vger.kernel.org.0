Return-Path: <linux-arm-msm+bounces-4339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CECDF80E4EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 08:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DE71B20E06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 07:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5586A171A9;
	Tue, 12 Dec 2023 07:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N6OFXljg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB18FE5
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 23:34:23 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-dbc8b07ceddso1774520276.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Dec 2023 23:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702366463; x=1702971263; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+pdaSu1iaftES05p6Uxq/8Q9jwd2VkFxw1jEmWMZH5U=;
        b=N6OFXljgRMKRBBcUUNCUgxE3195f9hurVTiltOAIAKikEoee83cPJQtWj+sK9Qma6T
         fsX3/2V6BWHEZJLp1YH+aSmfOML/b1A41tOAHrSEraOm6iQep126ajEekxbb2HNyojLX
         lW9TJrjkWB/B3uqowpBZPDFZqBodrup5HJxXp8kakdGp7EKDeo8xFgHhSQ6JEdRtuJ9F
         mbiD8NEWobzwdZywCx4XYNNe++DCxk0dMEAEltdUGxWAplBbmbCmY4C4YBG9ddkQT1wX
         1rkX0TdAJS6du1D52nBoJCwyGQn3qF6k4H99rhJtJ6LIpvgLsdBkhQKjX1/Qz+ypBx85
         gOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702366463; x=1702971263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+pdaSu1iaftES05p6Uxq/8Q9jwd2VkFxw1jEmWMZH5U=;
        b=mg1MsioPwJR/89SMH2Gk2UHtWgrkri3XuroTGf1e+8bQjcw+v6w79mQVRSq3+Zv9tb
         BMmd0xixsCSh5WQmXqykUOyuCxWAERtRacEE5u80P1Wr+DJDfJhsL4w9y1TRYcEIHKZ0
         6JcB0c/cF4fLOqqhbna/OOSFoE3rU/YzcLYOTFO99MlfVRf6reCWxfExRDf7PdSdyz/Y
         QefMoE76gnf6ZZemNVGz8n6/ugpWOsDQTGZHJfEZoJ6fjvN1+wC4lCtBrCLPxZigiIsw
         lDSzQ4tC90Oyf2omMHkLmVENWYutBalfsO8jNNFgz4hqP2wYfxCZIKgejPEhK/UU2eiH
         t/HA==
X-Gm-Message-State: AOJu0YzH30qP+mGy5d3ZVpthinHvwA7QsZhN4Eg2eLNuOBPIw7XJHkPy
	YEQuW1ExjEix/7llgPbPczfpG72rQOVR3hBfdXghBQ==
X-Google-Smtp-Source: AGHT+IG6+yn2hi4f5zQoiq02flHYyYZcOj3F9xkCU5tCJvPy/fwIAjloQC6Z6o1Vf2hildMHxeo0ve7vFrAyVXXqFMo=
X-Received: by 2002:a25:d152:0:b0:db4:7ba7:cfbe with SMTP id
 i79-20020a25d152000000b00db47ba7cfbemr3437327ybg.16.1702366462818; Mon, 11
 Dec 2023 23:34:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212-x1e80100-clock-controllers-v1-0-0de1af44dcb3@linaro.org> <20231212-x1e80100-clock-controllers-v1-6-0de1af44dcb3@linaro.org>
In-Reply-To: <20231212-x1e80100-clock-controllers-v1-6-0de1af44dcb3@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 12 Dec 2023 09:34:12 +0200
Message-ID: <CAA8EJprDT8s=JJaiesnQ0KJywmzS9y2Zwgv6T-k9PZxSGxtyLA@mail.gmail.com>
Subject: Re: [PATCH 06/10] clk: qcom: clk-alpha-pll: Add support for zonda ole
 pll configure
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

On Tue, 12 Dec 2023 at 00:46, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> From: Rajendra Nayak <quic_rjendra@quicinc.com>
>
> Zonda ole pll has as extra PLL_OFF_CONFIG_CTL_U2 register, hence add
> support for it.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>

The order of S-o-B trailers is incorrect.

> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 26 ++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  4 ++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 05898d2a8b22..e1919b57fb65 100644
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
> +               [PLL_OFF_USER_CTL] = 0x0C,
> +               [PLL_OFF_USER_CTL_U] = 0x10,
> +               [PLL_OFF_CONFIG_CTL] = 0x14,
> +               [PLL_OFF_CONFIG_CTL_U] = 0x18,
> +               [PLL_OFF_CONFIG_CTL_U1] = 0x1C,
> +               [PLL_OFF_CONFIG_CTL_U2] = 0x20,
> +               [PLL_OFF_TEST_CTL] = 0x24,
> +               [PLL_OFF_TEST_CTL_U] = 0x28,
> +               [PLL_OFF_TEST_CTL_U1] = 0x2C,
> +               [PLL_OFF_OPMODE] = 0x30,
> +               [PLL_OFF_STATUS] = 0x3C,

low-case hex please

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
>


-- 
With best wishes
Dmitry

