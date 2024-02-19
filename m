Return-Path: <linux-arm-msm+bounces-11705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F2C85A67E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 15:53:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4365283A92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 14:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3ADA93771C;
	Mon, 19 Feb 2024 14:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wPoO9OlU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3797C2E419
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 14:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354430; cv=none; b=MNdenvv9q9ofZH7AHLp/cMgsUYb4OYKDdcn6UMg3z6G+WJOK76V5xuGKvQY84E5bw0UkIkcKYAhQX5nUTdpbShF/+Ues9Ea2ziHFFL2BkSBHO0HLcWBNfeOSTtPjmP8TXLvGteo3NmPJGE0y2FU9v+oVMQaMFgEn9nSHEUpQAsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354430; c=relaxed/simple;
	bh=A4nq5x7Ib9yQ12vGKrkxl7Fvyza54Vi2OAWKmupXEmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KizJUED9/0PVHu8qgR+Y2DWIGkB5CmY8PBYidYd8CqXv+a3mqOudqVJDIS1efq1OpYgcA9DlEjQSLF+f4/2wE50gBtfCmaJHK88n5ja8Cbo05UebmfOk5Qpgyx8T2558UJUtXWuH9zFLKpCsvWF1GSH4ug/lhChZnDWebtIct64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wPoO9OlU; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-607dec82853so38314477b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 06:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708354426; x=1708959226; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uHNd0ZyJA4gTbxBaC9YDXwkG/RiI5KMLPKGCG7+Wzlo=;
        b=wPoO9OlUVufnAf15roXstTKVzMAu1tMpxJ9G7/TfjFY+zenB/R5GIxdFNmUPiTBQQc
         hZ6TTce2WQZs0gTrX/tD3FURpVVNgXQsW3qGCbFsRmYmFhS8thhbcz+fceb9nXx1zsD5
         Zr9RSbKWq8X60QPHrKGCAEyRp0pzgYkUfG7z5axKU+bzIoUkZzkyQG8rnf2LnQhRL7OV
         IRSMFmxxruv4xTnrHEkT0ybTOKD/GKLAYxShmC3DeXKifv2J0jgD27Oy35/GAITsNXCy
         ajw43y1MenblC4WRwNMEhfJpwR1bShRS4HeLwRbyslzuYStTD8/wseZeH92JO5jLhnPJ
         /ofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354426; x=1708959226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uHNd0ZyJA4gTbxBaC9YDXwkG/RiI5KMLPKGCG7+Wzlo=;
        b=Ec7+fdfsNo4+m/TBMea9ccAliP8/H5zRu24a3Suj+qHbz8UVNnuJ0st2GNZZJIkXe3
         icBLVyI0N5AjKLsQiNQTFoEj0DpZe9jCvRzLWJ8FsJetFrH03odnJt4Jz7KY+lEJih79
         k99D5v9XR+LL1v7etn4pu79gi/53TvKDQHvWQ/ZzshN6btmCX1R0zNNGyVxgCF7d9ULH
         WuZFcTMOK5fg0n1KjbFvJT2vbVDU8NgKtUfvs7+LRxdqjb2fN/47Ff0XXNF79a/9jOQU
         BVL2CSCO0pJvUAKhqYsORpfmluIwvpIa/QBYru+x6zTC/ObQpzVEllU1uc09O2PN/0G3
         xgZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2xb6jGQqFvvfqexEgrXpdShG5YwAqSvcvR29NXB02rDMMgx1xNSk8n43eJB7/n/S4Wqc7b6JIW838Ti0Pw5hmp5/+XV1HACrojwuLmw==
X-Gm-Message-State: AOJu0YzvD8Qhj55tDcrbCkzpTg2yb6QUo9Uyry0RoTTk015RxYjZE1Gw
	RPmRI14edz9NDW/6Kj4rc7eUTz/tMbmXWAMEWIOp/hedGFRCV4UaqpBEdi+nA7F5zd+ZXn85gE1
	Fh+F5V05Y+AuM4l5Df+mb5aCsoD8dbQJYad0azQ==
X-Google-Smtp-Source: AGHT+IHY/le6C7LNc0DIav/5O65P9EcFeh1YIyPzIjc+EV5s2EcaI1Ea6U5pWMuSdfWLBVIgW0qC8w2mR4a/yKRxOBo=
X-Received: by 2002:a81:5287:0:b0:607:9d63:f5f5 with SMTP id
 g129-20020a815287000000b006079d63f5f5mr12422677ywb.12.1708354426245; Mon, 19
 Feb 2024 06:53:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org> <20240219-topic-rb1_gpu-v1-3-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-3-d260fa854707@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 16:53:35 +0200
Message-ID: <CAA8EJpq8XvQm9B3RZq9PNMqA5VAqKUyVn5qt8-WEYMQMWniDZA@mail.gmail.com>
Subject: Re: [PATCH 3/8] clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Feb 2024 at 15:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Commit 134b55b7e19f ("clk: qcom: support Huayra type Alpha PLL")
> introduced an entry to the alpha offsets array, but diving into QCM2290
> downstream and some documentation, it turned out that the name Huayra
> apparently has been used quite liberally across many chips, even with
> noticeably different hardware.
>
> Introduce another set of offsets and a new configure function for the
> Huayra PLL found on QCM2290. This is required e.g. for the consumers
> of GPUCC_PLL0 to properly start.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 45 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  3 +++
>  2 files changed, 48 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 8a412ef47e16..61b5abd13782 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -244,6 +244,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>                 [PLL_OFF_OPMODE] = 0x30,
>                 [PLL_OFF_STATUS] = 0x3c,
>         },
> +       [CLK_ALPHA_PLL_TYPE_HUAYRA_2290] =  {
> +               [PLL_OFF_L_VAL] = 0x04,
> +               [PLL_OFF_ALPHA_VAL] = 0x08,
> +               [PLL_OFF_USER_CTL] = 0x0c,
> +               [PLL_OFF_CONFIG_CTL] = 0x10,
> +               [PLL_OFF_CONFIG_CTL_U] = 0x14,
> +               [PLL_OFF_CONFIG_CTL_U1] = 0x18,
> +               [PLL_OFF_TEST_CTL] = 0x1c,
> +               [PLL_OFF_TEST_CTL_U] = 0x20,
> +               [PLL_OFF_TEST_CTL_U1] = 0x24,
> +               [PLL_OFF_OPMODE] = 0x28,
> +               [PLL_OFF_STATUS] = 0x38,
> +       },

Can you please move them next to the standard huayra PLL regs?

>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>
> @@ -779,6 +792,38 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>         return clamp(rate, min_freq, max_freq);
>  }
>
> +void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +                                  const struct alpha_pll_config *config)
> +{
> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
> +       clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
> +       clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
> +       clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
> +
> +       /* Set PLL_BYPASSNL */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_BYPASSNL, PLL_BYPASSNL);
> +
> +       /* Wait 5 us between setting BYPASS and deasserting reset */
> +       mb();
> +       udelay(5);
> +
> +       /* Take PLL out from reset state */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
> +
> +       /* Wait 50us for PLL_LOCK_DET bit to go high */
> +       mb();
> +       usleep_range(50, 55);
> +
> +       /* Enable PLL output */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
> +}
> +EXPORT_SYMBOL(clk_huayra_2290_pll_configure);
> +
>  static unsigned long
>  alpha_huayra_pll_calc_rate(u64 prate, u32 l, u32 a)
>  {
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index fb6d50263bb9..91d3d6f19eae 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -29,6 +29,7 @@ enum {
>         CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
>         CLK_ALPHA_PLL_TYPE_STROMER,
>         CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
> +       CLK_ALPHA_PLL_TYPE_HUAYRA_2290,

Also next to standard huayra PLL, please.

>         CLK_ALPHA_PLL_TYPE_MAX,
>  };
>
> @@ -191,6 +192,8 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
>
>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>                              const struct alpha_pll_config *config);
> +void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +                                  const struct alpha_pll_config *config);
>  void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>                                 const struct alpha_pll_config *config);
>  void clk_trion_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>
> --
> 2.43.2
>


-- 
With best wishes
Dmitry

