Return-Path: <linux-arm-msm+bounces-10070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3E084C58A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 08:20:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99D60B21A27
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Feb 2024 07:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92901F614;
	Wed,  7 Feb 2024 07:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mCGiRoXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFC51F608
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Feb 2024 07:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707290394; cv=none; b=M2ENtct/5f8x2K0OEhQ/lQRebjrMkGN9v3oOBu30rAjRtrDh8sk4/kfxAGF9iXeeiCHB42WApNkpySuHvsdTgN2Vf63ut77zaK649/4bbyYxQubIinkTq1kEmKRTma2nYcDhSoModbpS4ee6PANo47Pzms4uNUbAks06lmN3zDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707290394; c=relaxed/simple;
	bh=jOWJZSzWaK4+0VT16VB+v6WWFNJFnRP4dzFsaZYfHvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ym8LqVSKSRdi79C6t3s9ZWHA4ilYoo9l2okV0B3w9uHRgKROjMfcbNOA2gQvwXt16k1T6UgsMVgvtwQRfs2D6/4bMov7ql6AW2Ua8syteNahkydXcZmE6k0UGs5R19HWad+LGL7gCjW4H2p4IbpL9DV2gH8cEBUs1JpOR+Z/e2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mCGiRoXg; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5edfcba97e3so2742687b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 23:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707290392; x=1707895192; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5daENJYj4pUJ4CRHaxq/r43mZVSt748JMtHzHYSnQ7g=;
        b=mCGiRoXgh7v504tWIkNW9bNPgF9ivN/fmM38g03goj9J0u7gxNFUx4uHvYK7D/cPd6
         zoes8ivS2yAEyd8qC2b9f98T8SNJB0FFkQS9MaK6tpcjFXTcRqnVtXXJXtRhG3MC3Fx3
         58AhMD5twCw0CA5/4pNHc+dTGVylkzW2FGuX/qom79Fi34PtAUFzANKGfgxW9iZy3L3x
         ZAR8i+s/yeRuw2Fd6a4FDlwhIpNmkyvoGx3eHxa5cpy0C1Q6Z4n+JJaOU7wfSIXf/sm8
         M+p4GmUHx318B8qD179ihCwP4WHNT0XviPrauYOU8W7A5dWBBHfY+bQwdY+bJD1znQlv
         aNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707290392; x=1707895192;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5daENJYj4pUJ4CRHaxq/r43mZVSt748JMtHzHYSnQ7g=;
        b=IR/r0ZEBGsSRENjYF49IzZPkA2d4x7VcdmMJhmYAcyPadoyVPluOD1OSMyVoLB1U/N
         UCic4L1rcYqa/QafbfZQHyTGDDM03q7ObaAcxTzR9EcpThqsKxXZBdUJ1ayXqllUZdsi
         KN7ol3juottRyKtaxyRgjORZD9dDP/Wmd6MPezgEUFJwUUQlPeSUboU9fjI8L37nU8TB
         KMmwDuz/4Si63VVNxm/6CWFEtYl9bFqIy9s0U7JFJ94N8FSzKPjhLjaDW9wdaPs4tNqf
         GzCVVNhZGzbUJctpZI9v33kKnxelRe7yGLg/zHLL9kHR0XnDFsraa6Ew8oOIXByfjQTE
         9GHg==
X-Gm-Message-State: AOJu0YwEaPrlmNlNPCpK5MXVE3d2mSmZmzIFSdA5fVQoEnohhQcv5Do4
	zIyydu5RyKvx0b5RmHAcLWsrg2ZhlTX+WlTQVdXOO+yDheoaV/DwY/qgdYGWd1JVU0/KbVeEc7/
	qN0CTRtSQmKSSx7iC1JmzWmH3GKA6bgKy+6EEDA==
X-Google-Smtp-Source: AGHT+IGYoBuojf8/TqZbXQjBxCnpK1eP4U/a3FxEXeyfk/eqOz4L4LbF8nuDPAUI6Y/H6Ywp2sg4vHvlhA1PNAHsf1g=
X-Received: by 2002:a81:ee01:0:b0:604:3f5b:550c with SMTP id
 l1-20020a81ee01000000b006043f5b550cmr3767918ywm.17.1707290391890; Tue, 06 Feb
 2024 23:19:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206113145.31096-1-quic_jkona@quicinc.com>
 <20240206113145.31096-3-quic_jkona@quicinc.com> <CAA8EJpqbKQS7Bp28xNZ0twu7BFLdOES9qS5xBvoonux8Ma4q6Q@mail.gmail.com>
 <e90522c1-7a2d-40ff-bf4e-c8f974722ddf@quicinc.com>
In-Reply-To: <e90522c1-7a2d-40ff-bf4e-c8f974722ddf@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 09:19:40 +0200
Message-ID: <CAA8EJpqCDOE_5vg+4ew8H0HbhQM1w8reqU6Pu0MAYJtMw8zXUw@mail.gmail.com>
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

On Wed, 7 Feb 2024 at 08:59, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
>
>
> On 2/6/2024 5:24 PM, Dmitry Baryshkov wrote:
> > On Tue, 6 Feb 2024 at 13:39, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
> >>
> >> Add support to the SM8650 video clock controller by extending the
> >> SM8550 video clock controller, which is mostly identical but SM8650
> >> has few additional clocks and minor differences.
> >
> > In the past we tried merging similar clock controllers. In the end
> > this results in the ugly source code. Please consider submitting a
> > separate driver.
> >
>
> Thanks Dmitry for your review. SM8650 has only few clock additions and
> minor changes compared to SM8550, so I believe it is better to reuse
> this existing driver and extend it.

I'd say, the final decision is on Bjorn and Konrad as maintainers.

>
> >>
> >> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> >> ---
> >>   drivers/clk/qcom/videocc-sm8550.c | 160 +++++++++++++++++++++++++++++-
> >>   1 file changed, 156 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
> >> index f3c9dfaee968..cdc08f5900fc 100644
> >> --- a/drivers/clk/qcom/videocc-sm8550.c
> >> +++ b/drivers/clk/qcom/videocc-sm8550.c
> >> @@ -1,6 +1,6 @@
> >>   // SPDX-License-Identifier: GPL-2.0-only
> >>   /*
> >> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>    */
> >>
> >>   #include <linux/clk-provider.h>
> >
> > [skipping]
> >
> >>   static struct gdsc video_cc_mvs0c_gdsc = {
> >>          .gdscr = 0x804c,
> >>          .en_rest_wait_val = 0x2,
> >> @@ -354,15 +481,20 @@ static struct clk_regmap *video_cc_sm8550_clocks[] = {
> >>          [VIDEO_CC_MVS0_CLK] = &video_cc_mvs0_clk.clkr,
> >>          [VIDEO_CC_MVS0_CLK_SRC] = &video_cc_mvs0_clk_src.clkr,
> >>          [VIDEO_CC_MVS0_DIV_CLK_SRC] = &video_cc_mvs0_div_clk_src.clkr,
> >> +       [VIDEO_CC_MVS0_SHIFT_CLK] = &video_cc_mvs0_shift_clk.clkr,
> >>          [VIDEO_CC_MVS0C_CLK] = &video_cc_mvs0c_clk.clkr,
> >>          [VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC] = &video_cc_mvs0c_div2_div_clk_src.clkr,
> >> +       [VIDEO_CC_MVS0C_SHIFT_CLK] = &video_cc_mvs0c_shift_clk.clkr,
> >>          [VIDEO_CC_MVS1_CLK] = &video_cc_mvs1_clk.clkr,
> >>          [VIDEO_CC_MVS1_CLK_SRC] = &video_cc_mvs1_clk_src.clkr,
> >>          [VIDEO_CC_MVS1_DIV_CLK_SRC] = &video_cc_mvs1_div_clk_src.clkr,
> >> +       [VIDEO_CC_MVS1_SHIFT_CLK] = &video_cc_mvs1_shift_clk.clkr,
> >>          [VIDEO_CC_MVS1C_CLK] = &video_cc_mvs1c_clk.clkr,
> >>          [VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC] = &video_cc_mvs1c_div2_div_clk_src.clkr,
> >> +       [VIDEO_CC_MVS1C_SHIFT_CLK] = &video_cc_mvs1c_shift_clk.clkr,
> >>          [VIDEO_CC_PLL0] = &video_cc_pll0.clkr,
> >>          [VIDEO_CC_PLL1] = &video_cc_pll1.clkr,
> >> +       [VIDEO_CC_XO_CLK_SRC] = &video_cc_xo_clk_src.clkr,
> >>   };
> >>
> >>   static struct gdsc *video_cc_sm8550_gdscs[] = {
> >> @@ -380,6 +512,7 @@ static const struct qcom_reset_map video_cc_sm8550_resets[] = {
> >>          [CVP_VIDEO_CC_MVS1C_BCR] = { 0x8074 },
> >>          [VIDEO_CC_MVS0C_CLK_ARES] = { 0x8064, 2 },
> >>          [VIDEO_CC_MVS1C_CLK_ARES] = { 0x8090, 2 },
> >> +       [VIDEO_CC_XO_CLK_ARES] = { 0x8124, 2 },
> >
> > Is this reset applicable to videocc-sm8550?
> >
>
> SM8550 also has above reset support in hardware, hence it is safe to
> model above reset for both SM8550 and SM8650.

Then, separate commit, Fixes tag.

>
> >>   };
> >>
> >>   static const struct regmap_config video_cc_sm8550_regmap_config = {
> >> @@ -402,6 +535,7 @@ static struct qcom_cc_desc video_cc_sm8550_desc = {
> >>
> >>   static const struct of_device_id video_cc_sm8550_match_table[] = {
> >>          { .compatible = "qcom,sm8550-videocc" },
> >> +       { .compatible = "qcom,sm8650-videocc" },
> >>          { }
> >>   };
> >>   MODULE_DEVICE_TABLE(of, video_cc_sm8550_match_table);
> >> @@ -410,6 +544,7 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
> >>   {
> >>          struct regmap *regmap;
> >>          int ret;
> >> +       u32 offset;
> >>
> >>          ret = devm_pm_runtime_enable(&pdev->dev);
> >>          if (ret)
> >> @@ -425,6 +560,23 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
> >>                  return PTR_ERR(regmap);
> >>          }
> >>
> >> +       if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8550-videocc")) {
> >> +               video_cc_sm8550_clocks[VIDEO_CC_MVS0_SHIFT_CLK] = NULL;
> >> +               video_cc_sm8550_clocks[VIDEO_CC_MVS0C_SHIFT_CLK] = NULL;
> >> +               video_cc_sm8550_clocks[VIDEO_CC_MVS1_SHIFT_CLK] = NULL;
> >> +               video_cc_sm8550_clocks[VIDEO_CC_MVS1C_SHIFT_CLK] = NULL;
> >> +               video_cc_sm8550_clocks[VIDEO_CC_XO_CLK_SRC] = NULL;
> >
> > Please invert the logic. Make video_cc_sm8550_clocks reflect SM8550
> > and patch in new clocks in the SM8650-specific branch below.
> >
>
> Sure, will add these clocks as NULL in video_cc_sm8550_clocks and patch
> in new clocks here for SM8650. Then we can remove above check for SM8550.

No need to set them to NULL, it is the default value. Just add them to
the sm8650 branch.

>
> Thanks,
> Jagadeesh
>
> >> +               offset = 0x8140;
> >> +       } else  if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8650-videocc")) {
> >> +               video_cc_pll0_config.l = 0x1e;
> >> +               video_cc_pll0_config.alpha = 0xa000;
> >> +               video_cc_pll1_config.l = 0x2b;
> >> +               video_cc_pll1_config.alpha = 0xc000;
> >> +               video_cc_mvs0_clk_src.freq_tbl = ftbl_video_cc_mvs0_clk_src_sm8650;
> >> +               video_cc_mvs1_clk_src.freq_tbl = ftbl_video_cc_mvs1_clk_src_sm8650;
> >> +               offset = 0x8150;
> >> +       }
> >> +
> >>          clk_lucid_ole_pll_configure(&video_cc_pll0, regmap, &video_cc_pll0_config);
> >>          clk_lucid_ole_pll_configure(&video_cc_pll1, regmap, &video_cc_pll1_config);
> >>
> >> @@ -435,7 +587,7 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
> >>           *      video_cc_xo_clk
> >>           */
> >>          regmap_update_bits(regmap, 0x80f4, BIT(0), BIT(0));
> >> -       regmap_update_bits(regmap, 0x8140, BIT(0), BIT(0));
> >> +       regmap_update_bits(regmap, offset, BIT(0), BIT(0));
> >>          regmap_update_bits(regmap, 0x8124, BIT(0), BIT(0));
> >>
> >>          ret = qcom_cc_really_probe(pdev, &video_cc_sm8550_desc, regmap);
> >> --
> >> 2.43.0
> >>
> >>
> >
> >



-- 
With best wishes
Dmitry

