Return-Path: <linux-arm-msm+bounces-4665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B82808128CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 08:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B7681F21747
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 07:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3BF9DDC2;
	Thu, 14 Dec 2023 07:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jrg0onkE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EDD7F5
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 23:09:17 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dbcd9af2428so243179276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 23:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702537756; x=1703142556; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9O1GnUq4pw6hl4a/GhVKNLNjzNzEUMAMJcd0utEyLiE=;
        b=Jrg0onkEW7cZmLkXpgpixdbps3bf+3816C8u1ryDdu8/S6ggiSXCSaFC6mMW8w0mRq
         UCcapzzEQkiotnyscr46KOGVMADBNQB8Lk0O4I3sPvYR42qwV2NiiTCYUHIyDSOcTj5J
         KX67eBXfhmTtxwdOYnl58EhYT6avc+qjXpC8Lc6lidtfiTh31pPeBoZSAeblwtB8ienX
         D7n7IPRZXu3ERL9Ux/PnxTgMeiQKctPlssDqgCrNd80J91KRbtFFuEjbnPOEHugVglUe
         SPoqk+sChWeCYtEb89exiKxuTfeNxPHlG/ZNy83rxHQUcsWUPgu+fbnKQtjyMoLrYAO/
         cqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702537756; x=1703142556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9O1GnUq4pw6hl4a/GhVKNLNjzNzEUMAMJcd0utEyLiE=;
        b=kDB5tYUdFwkoA427bOPiF+/QhELuD14hkz0GFaO32nDpR6S9w+XWHm0IGDJTGG34P5
         G7YdBwCB+fmMUFle072vy+5NEzYlqHLFSNpRXYq8W6MzrBGembJeJbaIvsBE22k+TjBy
         LuYojNakEU9KkGbpuAD7YinUwOSOKR7TX8+sHOAp1okM77vEWAQli8ALHl8YKaqRXeSu
         5g5kxFss/Pda3+zJexOv7xGu4PlDBIDSzXqX0GfY/OBB3P3ezJS5pMBjsp0cvVitjLLN
         Di4AWqurUPH7ADqNOzdzWrCkk9bCUhRvt0riSH8sBjHwgwA5ysepnca3YZaX2lXaiFFs
         FK1g==
X-Gm-Message-State: AOJu0Yx7QnZz1n8YlAkKCKtxfN0SxTk2NKPxNhtEc+KXeDJiB2YUP8E8
	Mx2jaSRRRbJjj5eszoz6UalcBQJcJjVlzRQT4jCNZDw+cyC0oXLIZfU=
X-Google-Smtp-Source: AGHT+IG078aMdmbmisgdnRLiC9BHttQaRKTw1dmngc8Uzuyuor0vsPrA1eyS3c5KPIlT0ZUu4886PyAXYBHaW+v9aKM=
X-Received: by 2002:a25:8041:0:b0:dbc:ddf4:4b14 with SMTP id
 a1-20020a258041000000b00dbcddf44b14mr1157789ybn.50.1702537756642; Wed, 13 Dec
 2023 23:09:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214062847.2215542-1-quic_ipkumar@quicinc.com> <20231214062847.2215542-3-quic_ipkumar@quicinc.com>
In-Reply-To: <20231214062847.2215542-3-quic_ipkumar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 09:09:05 +0200
Message-ID: <CAA8EJpr61JuznqfdMG96mjrqquf2Qbfe=potB5vzk43XexWj2w@mail.gmail.com>
Subject: Re: [PATCH 02/10] clk: qcom: ipq5332: Add separate clocks for PCIe
 and USB for Combo PHY
To: Praveenkumar I <quic_ipkumar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, bhelgaas@google.com, 
	lpieralisi@kernel.org, kw@linux.com, vkoul@kernel.org, kishon@kernel.org, 
	mani@kernel.org, quic_nsekar@quicinc.com, quic_srichara@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	quic_varada@quicinc.com, quic_devipriy@quicinc.com, quic_kathirav@quicinc.com, 
	quic_anusha@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Dec 2023 at 08:29, Praveenkumar I <quic_ipkumar@quicinc.com> wrote:
>
> Qualcomm IPQ5332 has a combo PHY for PCIe and USB. Either one of the
> interface (PCIe/USB) can use this combo PHY and the PHY drivers are
> different for PCIe and USB. Hence separate the PCIe and USB pipe clock
> source from DT, and individual driver node can be used as a clock source
> separately in the gcc. Add separate enum for PCIe and USB pipe clock and
> change the parent in corresponding structures.
>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>

Please use your full name for the git authorship and or the S-o-B
tags. This applies to the whole series.

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/clk/qcom/gcc-ipq5332.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/qcom/gcc-ipq5332.c b/drivers/clk/qcom/gcc-ipq5332.c
> index f98591148a97..aa0f616c3b1b 100644
> --- a/drivers/clk/qcom/gcc-ipq5332.c
> +++ b/drivers/clk/qcom/gcc-ipq5332.c
> @@ -25,7 +25,8 @@ enum {
>         DT_SLEEP_CLK,
>         DT_PCIE_2LANE_PHY_PIPE_CLK,
>         DT_PCIE_2LANE_PHY_PIPE_CLK_X1,
> -       DT_USB_PCIE_WRAPPER_PIPE_CLK,
> +       DT_PCIE_WRAPPER_PIPE_CLK,
> +       DT_USB_WRAPPER_PIPE_CLK,
>  };
>
>  enum {
> @@ -728,7 +729,7 @@ static struct clk_regmap_phy_mux gcc_pcie3x1_0_pipe_clk_src = {
>                 .hw.init = &(struct clk_init_data) {
>                         .name = "gcc_pcie3x1_0_pipe_clk_src",
>                         .parent_data = &(const struct clk_parent_data) {
> -                               .index = DT_USB_PCIE_WRAPPER_PIPE_CLK,
> +                               .index = DT_PCIE_WRAPPER_PIPE_CLK,
>                         },
>                         .num_parents = 1,
>                         .ops = &clk_regmap_phy_mux_ops,
> @@ -1072,7 +1073,7 @@ static struct clk_regmap_phy_mux gcc_usb0_pipe_clk_src = {
>                 .hw.init = &(struct clk_init_data) {
>                         .name = "gcc_usb0_pipe_clk_src",
>                         .parent_data = &(const struct clk_parent_data) {
> -                               .index = DT_USB_PCIE_WRAPPER_PIPE_CLK,
> +                               .index = DT_USB_WRAPPER_PIPE_CLK,
>                         },
>                         .num_parents = 1,
>                         .ops = &clk_regmap_phy_mux_ops,
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

