Return-Path: <linux-arm-msm+bounces-8805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 252BC8401DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 10:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77AA2B21102
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 09:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18AC55777;
	Mon, 29 Jan 2024 09:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nl0TWa5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD32E54FAE
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 09:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706521088; cv=none; b=HuFYnq5aA0KJ/kMo2LkF94cEJGGyAv+peAibpAi1mFfyXbnYlh82f1AYgi8CReqKIJOxAZHGuhQWArzJ6w0xNXlJCvlZTNgbdxntbGXR5PWiVOIMFDYuvImwWy8pauv1/lF2ESOsTGHcAb3bSVwZ9ZgJlqtHcXFN9CNpdrgvb6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706521088; c=relaxed/simple;
	bh=Ldj1FDg/nEnZb9STOe9WZ7ecK09+3FkjkQDPFWHzixs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hC4gKjwDoLimw0olxqJAIaQeVjtU7fljCq1Oz0gBzHusNh+ksmfVPFjpeUkpHIdUwDSY2w0RWf3u2gJQbrVOF+qUwrAY6w3dSqTbhh0o2PVSG02TsqQWTFwzFwX+YdU8+htd5zhV3W6TfFthLbh7x28m1209ilrLY0SnJoZoTAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nl0TWa5S; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5ffcb478512so16998467b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 01:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706521086; x=1707125886; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7GUkQLMq88GAXuh3Eqx0lD6UD7ww86b8Rhtv6iqBIbU=;
        b=nl0TWa5SnLrytGAWQRk0g4SW80M2Vo4gZU8aO+ILxSlBU6DlflrmukDGMWwy3fKHuj
         NfBj+FGfE+hWjxiPdNrya5S4r/Q17k4mcLM+Zeg8aTFUXbePSS0gjYkBPvm+Uc3ZJ6SF
         JB0L74Xb8+JkitijWhxS+1tw0QETuMbpiQY4la1GCCo9YygJRvtu/hp5oaWx/DNzk4sz
         1O5rScmqiieFOSr8k+mnIjucTQ7wbFCmom+1JFY9oWZZwVB45IbT6F262ShYPeSR/V2G
         8AYFlS73+LG1OyDmQ2fGG5NMe0/GRdrfY7uK+RGp2VWro1r+sdF+PiZkl5l9oMwGlgFw
         AxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706521086; x=1707125886;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7GUkQLMq88GAXuh3Eqx0lD6UD7ww86b8Rhtv6iqBIbU=;
        b=HJc0JGYHMeWTICu3Gi++MPM3hYRBVAp4mzfsDvgYt5QrUJxC75z0GgRvjMXg2ZVvsa
         flQBHIjxi+nII8KrkXVkj+WsfxdmFf6a2inbGmV4ywziuhGS6N+/dN+bkjO+v5lTFASb
         G3FgQrcETx6Qdmqc2cryP3b+cdzeHeWzLmYQTQKV0+rW8wKZ4L0yZ8PjaAsXCi98jAMp
         eLxJogoARJaB4+KpBg2MYLpjKBO2/TEq2OqucvVIzUuzeQNfgXfofP/mxgi4osgMly3i
         oJF3Q6vTn2y9/QS6rAxW2/fRVlt6qkIvVUERdExW9KAOdCeARsKK3BYJnINY6eFmPGlX
         afvg==
X-Gm-Message-State: AOJu0Yy3miM8ombGqqsVOkK713E6iZJH2mir9c96ROZP1huyZvnapozb
	d7k2sgBDCxbL7mWv8IkIiE9lLrka3avVpeQCgPanY/oDc45Wl074sfeiiTza5qnfvmjcoNV4+6s
	DtDTOe6ZPMptCq7M1726JRw/T55XhoUIdmy2paw==
X-Google-Smtp-Source: AGHT+IEeoJUoLMtBvZJFkIJY4mg0SVO8RrXIC2eL8rV9XVO7o4cYzCCwHONGiBoxbodpc9WxXQGklKeSWkdZplHmeNA=
X-Received: by 2002:a81:aa12:0:b0:5ff:5406:e064 with SMTP id
 i18-20020a81aa12000000b005ff5406e064mr2222313ywh.10.1706521085719; Mon, 29
 Jan 2024 01:38:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129051104.1855487-1-quic_devipriy@quicinc.com> <20240129051104.1855487-4-quic_devipriy@quicinc.com>
In-Reply-To: <20240129051104.1855487-4-quic_devipriy@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 11:37:54 +0200
Message-ID: <CAA8EJppG0NehyLPkML5_Xe__Vy_aEu=qNYAd8WU5rsgLjrW8CA@mail.gmail.com>
Subject: Re: [PATCH V3 3/7] clk: qcom: gcc-ipq9574: Add gpll0_out_aux clock &
 enable few nssnoc clocks
To: Devi Priya <quic_devipriy@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	p.zabel@pengutronix.de, richardcochran@gmail.com, geert+renesas@glider.be, 
	arnd@arndb.de, neil.armstrong@linaro.org, nfraprado@collabora.com, 
	m.szyprowski@samsung.com, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 07:13, Devi Priya <quic_devipriy@quicinc.com> wrote:
>
> gcc_nssnoc_nsscc_clk, gcc_nssnoc_snoc_clk, gcc_nssnoc_snoc_1_clk are
> enabled by default and the RCGs are properly configured by the bootloader.
>
> Some of the NSS clocks needs these clocks to be enabled. To avoid
> these clocks being disabled by clock framework, drop these entries
> from the clock table and enable it in the driver probe itself.

Obvious NAK for mixing two independent changes into a single patch.

>
> Also, add support for gpll0_out_aux clock which acts as the parent for
> certain networking subsystem (nss) clocks.
>
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V3:
>         - Dropped flags for gpll0_out_aux
>         - Dropped few nss clock entries from the clock table and enabled
>           them in the probe
>
>  drivers/clk/qcom/gcc-ipq9574.c | 83 ++++++++++++----------------------
>  1 file changed, 28 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
> index e8190108e1ae..987703431b5b 100644
> --- a/drivers/clk/qcom/gcc-ipq9574.c
> +++ b/drivers/clk/qcom/gcc-ipq9574.c
> @@ -105,6 +105,20 @@ static struct clk_alpha_pll_postdiv gpll0 = {
>         },
>  };
>
> +static struct clk_alpha_pll_postdiv gpll0_out_aux = {
> +       .offset = 0x20000,
> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +       .width = 4,
> +       .clkr.hw.init = &(const struct clk_init_data) {
> +               .name = "gpll0_out_aux",
> +               .parent_hws = (const struct clk_hw *[]) {
> +                       &gpll0_main.clkr.hw
> +               },
> +               .num_parents = 1,
> +               .ops = &clk_alpha_pll_postdiv_ro_ops,
> +       },
> +};
> +
>  static struct clk_alpha_pll gpll4_main = {
>         .offset = 0x22000,
>         .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> @@ -2186,23 +2200,6 @@ static struct clk_branch gcc_nsscfg_clk = {
>         },
>  };
>
> -static struct clk_branch gcc_nssnoc_nsscc_clk = {
> -       .halt_reg = 0x17030,
> -       .clkr = {
> -               .enable_reg = 0x17030,
> -               .enable_mask = BIT(0),
> -               .hw.init = &(const struct clk_init_data) {
> -                       .name = "gcc_nssnoc_nsscc_clk",
> -                       .parent_hws = (const struct clk_hw *[]) {
> -                               &pcnoc_bfdcd_clk_src.clkr.hw
> -                       },
> -                       .num_parents = 1,
> -                       .flags = CLK_SET_RATE_PARENT,
> -                       .ops = &clk_branch2_ops,
> -               },
> -       },
> -};
> -

What is the actual consumer for these clocks? Why are you trying to
hide them instead of making them used by the consumer device?

>  static struct clk_branch gcc_nsscc_clk = {
>         .halt_reg = 0x17034,
>         .clkr = {
> @@ -2585,40 +2582,6 @@ static struct clk_branch gcc_q6ss_boot_clk = {
>         },
>  };
>
> -static struct clk_branch gcc_nssnoc_snoc_clk = {
> -       .halt_reg = 0x17028,
> -       .clkr = {
> -               .enable_reg = 0x17028,
> -               .enable_mask = BIT(0),
> -               .hw.init = &(const struct clk_init_data) {
> -                       .name = "gcc_nssnoc_snoc_clk",
> -                       .parent_hws = (const struct clk_hw *[]) {
> -                               &system_noc_bfdcd_clk_src.clkr.hw
> -                       },
> -                       .num_parents = 1,
> -                       .flags = CLK_SET_RATE_PARENT,
> -                       .ops = &clk_branch2_ops,
> -               },
> -       },
> -};
> -
> -static struct clk_branch gcc_nssnoc_snoc_1_clk = {
> -       .halt_reg = 0x1707c,
> -       .clkr = {
> -               .enable_reg = 0x1707c,
> -               .enable_mask = BIT(0),
> -               .hw.init = &(const struct clk_init_data) {
> -                       .name = "gcc_nssnoc_snoc_1_clk",
> -                       .parent_hws = (const struct clk_hw *[]) {
> -                               &system_noc_bfdcd_clk_src.clkr.hw
> -                       },
> -                       .num_parents = 1,
> -                       .flags = CLK_SET_RATE_PARENT,
> -                       .ops = &clk_branch2_ops,
> -               },
> -       },
> -};
> -
>  static struct clk_branch gcc_qdss_etr_usb_clk = {
>         .halt_reg = 0x2d060,
>         .clkr = {
> @@ -4043,7 +4006,6 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
>         [GCC_SDCC1_AHB_CLK] = &gcc_sdcc1_ahb_clk.clkr,
>         [PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
>         [GCC_NSSCFG_CLK] = &gcc_nsscfg_clk.clkr,
> -       [GCC_NSSNOC_NSSCC_CLK] = &gcc_nssnoc_nsscc_clk.clkr,
>         [GCC_NSSCC_CLK] = &gcc_nsscc_clk.clkr,
>         [GCC_NSSNOC_PCNOC_1_CLK] = &gcc_nssnoc_pcnoc_1_clk.clkr,
>         [GCC_QDSS_DAP_AHB_CLK] = &gcc_qdss_dap_ahb_clk.clkr,
> @@ -4059,8 +4021,6 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
>         [GCC_CMN_12GPLL_AHB_CLK] = &gcc_cmn_12gpll_ahb_clk.clkr,
>         [GCC_CMN_12GPLL_APU_CLK] = &gcc_cmn_12gpll_apu_clk.clkr,
>         [SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
> -       [GCC_NSSNOC_SNOC_CLK] = &gcc_nssnoc_snoc_clk.clkr,
> -       [GCC_NSSNOC_SNOC_1_CLK] = &gcc_nssnoc_snoc_1_clk.clkr,
>         [GCC_QDSS_ETR_USB_CLK] = &gcc_qdss_etr_usb_clk.clkr,
>         [WCSS_AHB_CLK_SRC] = &wcss_ahb_clk_src.clkr,
>         [GCC_Q6_AHB_CLK] = &gcc_q6_ahb_clk.clkr,
> @@ -4140,6 +4100,7 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
>         [GCC_SNOC_PCIE1_1LANE_S_CLK] = &gcc_snoc_pcie1_1lane_s_clk.clkr,
>         [GCC_SNOC_PCIE2_2LANE_S_CLK] = &gcc_snoc_pcie2_2lane_s_clk.clkr,
>         [GCC_SNOC_PCIE3_2LANE_S_CLK] = &gcc_snoc_pcie3_2lane_s_clk.clkr,
> +       [GPLL0_OUT_AUX] = &gpll0_out_aux.clkr,
>  };
>
>  static const struct qcom_reset_map gcc_ipq9574_resets[] = {
> @@ -4326,7 +4287,19 @@ static const struct qcom_cc_desc gcc_ipq9574_desc = {
>
>  static int gcc_ipq9574_probe(struct platform_device *pdev)
>  {
> -       return qcom_cc_probe(pdev, &gcc_ipq9574_desc);
> +       struct regmap *regmap;
> +
> +       regmap = qcom_cc_map(pdev, &gcc_ipq9574_desc);
> +
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       /* Keep the critical clocks always-On */
> +       regmap_update_bits(regmap, 0x17030, BIT(0), BIT(0)); /* gcc_nssnoc_nsscc_clk */
> +       regmap_update_bits(regmap, 0x17028, BIT(0), BIT(0)); /* gcc_nssnoc_snoc_clk */
> +       regmap_update_bits(regmap, 0x1707C, BIT(0), BIT(0)); /* gcc_nssnoc_snoc_1_clk */
> +
> +       return qcom_cc_really_probe(pdev, &gcc_ipq9574_desc, regmap);
>  }
>
>  static struct platform_driver gcc_ipq9574_driver = {
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

