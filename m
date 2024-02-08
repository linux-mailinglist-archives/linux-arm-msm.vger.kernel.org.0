Return-Path: <linux-arm-msm+bounces-10146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BF484DA99
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 08:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5AEA28723E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 07:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5B5692EE;
	Thu,  8 Feb 2024 07:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i8382Vt/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A837C6A32D
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 07:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707376496; cv=none; b=Im81bAj6x5FYh5Es7/UHHYnF8eVfCH2UjLt9mr7hpICbTHvTfJh/3hiL5Skc65m7DGgoRvfs4P6b2F4l1WLR8SL1QJ2Mxy8IZBK+T2M/CZO/5FLrNnu70fXeB6uaoqzKaEJPP3/0ep3rYJ36gGdvFecZxGzRIwHh00+KcR0zuVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707376496; c=relaxed/simple;
	bh=/U5Gh8XoGRX9cNmLIUe79+ixUsV1OLqHzdIOkGn2IV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=em+oF+MHiNkJMZHWllYbPIb9j8I8ZKkIGzTxVZM3aWiRJY2uEm3Fl0mAo5bTA27oEMgZ98EhJpfz+giE0+lu1v/ZOIBFbcf/mVWuE8avscxl6YcLBmlBlbQUXAD1S9jelorynbY96Nar66ClmXUtpg2BKJwrUhAvDnRFTKZH9WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i8382Vt/; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60491b1fdeaso15490287b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Feb 2024 23:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707376492; x=1707981292; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7kOHHtSmI0tD6nUlCqLdvQWTYUnQ0nQol6M7u3YWTJA=;
        b=i8382Vt/5pVJP4CHJZMnVd3vt9b72pok4cNtmitaR3JgoXnONeAThvh8M3dXbk/qCb
         7sAF2aRHG61CiUHh5e8onFLi+FRsjDD2+9jeLRHvLgx/XB1qPJQJQXRddS4Uw7oykeKr
         ZNhqkBUzgR+LCO5w9B6swFlyBpnk1bO6R6o6qsIJd7xevMQzY+Dwgs4MM3tCm0G/C6bT
         +3nRVnp/tuMVOZhkfJCON3PmSbiUM+MYShawXAmPUZqFwfi6H1WxjFG0MbIhZEOaUBim
         XpxsDDdw6Ex2S/ik2v+iT83MGZ+rfJQlo5QbEzAsHM+7tmS194/suDZTBF4BaU2iKcm7
         PZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707376492; x=1707981292;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7kOHHtSmI0tD6nUlCqLdvQWTYUnQ0nQol6M7u3YWTJA=;
        b=sw0sPAiXFOEjo63ahJOapRmEjufC53bJtyUDj4uSLiBnVVUmRQb+b5YR3oAZcGx7m7
         LiaLhX4tdOWDoKknXI2QOkBzGokAOTNPdbMZU4FBtYMpAvFuvwzUFYyz9riQ1ANlJLhM
         NkXCBxdj9R4IiNYsxDYrqClzwnLt3MP/3xK84weDe2nafBWvxQdA/f/ekTMa9anrOuZO
         G4T3tlA0C2JwZv3gy9+DUVn9PVrTn0vIK3tdPkAd2V6CQFS9+hWq16pugFv1AMmzL2KN
         uY0jtswWNCThRXyBOkFro+/Gx0D8ngGxyVRygqZmn9Zwg/ehY1pUKNCShenGtguEs0Ov
         cjJg==
X-Forwarded-Encrypted: i=1; AJvYcCVUI7oWGbw2VZBx8CPEXBYk/uJv96FHh5STlW9VhQC4JcbcqAZXEWa8bRhm9QQ2lX2c6tm/9kEtOqNOR19Q14voLto6r/hbruK/0fQr3A==
X-Gm-Message-State: AOJu0YzLRkTczvbw4RivfqPI9ILcRnEdo0PUk82J+Qmn7ZcHt4mqgKwb
	3KnU9VT/eJIEfGxpdi+Za3pudbxZgUSGePGCx2auZOvrdd7Qil5nDWibOJKXo2XC/yeOaezbxRZ
	Cutb7npmsdo1O32zCR15TaUVnbCqHHO9hglx5pA==
X-Google-Smtp-Source: AGHT+IHQohtdW+YcJ87TpigyepftuZfJ5M1HQOClm4+SzilT3k1paJp/TGcqro32Y2eO5/4ahWJ08ZnwJWc95siQiMI=
X-Received: by 2002:a81:4f17:0:b0:604:9e94:7c2a with SMTP id
 d23-20020a814f17000000b006049e947c2amr2656450ywb.49.1707376492572; Wed, 07
 Feb 2024 23:14:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208062836.19767-1-quic_tdas@quicinc.com> <20240208062836.19767-6-quic_tdas@quicinc.com>
In-Reply-To: <20240208062836.19767-6-quic_tdas@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Feb 2024 09:14:41 +0200
Message-ID: <CAA8EJpq4YfX+1mYBS3AMWFp+7pYGdY6bvTUGsvYeqfNOo1KbAg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Update protected clocks list for
 qcm6490 variants
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Feb 2024 at 08:29, Taniya Das <quic_tdas@quicinc.com> wrote:
>
> Certain clocks are not accessible on QCM6490-IDP and QCS6490-RB3GEN2 boards
> thus require them to be marked protected.
>
> Also disable the LPASS nodes which are not to be used.
>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 54 +++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 50 +++++++++++++++++-
>  2 files changed, 102 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 03e97e27d16d..425e4b87490b 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: BSD-3-Clause
>  /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>
>  /dts-v1/;
> @@ -415,6 +415,58 @@
>         };
>  };
>
> +&gcc {
> +       protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
> +                       <GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
> +                       <GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
> +                       <GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
> +                       <GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> +                       <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
> +                       <GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
> +                       <GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
> +                       <GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
> +                       <GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
> +                       <GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
> +                       <GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
> +                       <GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
> +                       <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
> +                       <GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
> +                       <GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> +                       <GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
> +                       <GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;

This looks like a huge variety of clocks. Are they really not
accessible or are you trying to make Linux stay away from all those
clocks to keep bootloader settings?

> +};
> +
> +&lpasscc {
> +       status = "disabled";
> +};
> +
> +&lpass_audiocc {
> +       qcom,adsp-skip-pll;
> +       protected-clocks = <LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC>,
> +               <LPASS_AUDIO_CC_CODEC_MEM0_CLK>, <LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
> +               <LPASS_AUDIO_CC_CODEC_MEM2_CLK>, <LPASS_AUDIO_CC_CODEC_MEM_CLK>,
> +               <LPASS_AUDIO_CC_EXT_MCLK0_CLK>, <LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC>,
> +               <LPASS_AUDIO_CC_EXT_MCLK1_CLK>, <LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC>,
> +               <LPASS_AUDIO_CC_PLL>, <LPASS_AUDIO_CC_PLL_OUT_AUX2>,
> +               <LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC>,
> +               <LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC>,
> +               <LPASS_AUDIO_CC_RX_MCLK_2X_CLK>, <LPASS_AUDIO_CC_RX_MCLK_CLK>,
> +               <LPASS_AUDIO_CC_RX_MCLK_CLK_SRC>;

This almost looks like a separate compatible.

> +       /delete-property/ power-domains;
> +};
> +
> +&lpass_aon {
> +       status = "disabled";

Should this be "reserved", controlled by ADSP? See how this was
implemented in sc7180.dtsi / sc7180-trogdor.dtsi.
Please consider inverting the logic. Generic ADSP implementation
should be present in sc7280.dtsi and then the non-default ChromeOS
implementation should be a part of sc7280-chrome-common.dtsi.

> +};
> +
> +&lpass_core {
> +       status = "disabled";
> +};
> +
> +&lpass_hm {
> +       status = "disabled";
> +};
> +
>  &qupv3_id_0 {
>         status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 8bb7d13d85f6..1398b84634c3 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: BSD-3-Clause
>  /*
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>
>  /dts-v1/;
> @@ -413,6 +413,54 @@
>         };
>  };
>
> +&gcc {
> +       protected-clocks = <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
> +                       <GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
> +                       <GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
> +                       <GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
> +                       <GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
> +                       <GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
> +                       <GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
> +                       <GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
> +                       <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
> +                       <GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
> +                       <GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> +                       <GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
> +                       <GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
> +};
> +
> +&lpasscc {
> +       status = "disabled";
> +};
> +
> +&lpass_audiocc {
> +       qcom,adsp-skip-pll;
> +       protected-clocks = <LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC>,
> +               <LPASS_AUDIO_CC_CODEC_MEM0_CLK>, <LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
> +               <LPASS_AUDIO_CC_CODEC_MEM2_CLK>, <LPASS_AUDIO_CC_CODEC_MEM_CLK>,
> +               <LPASS_AUDIO_CC_EXT_MCLK0_CLK>, <LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC>,
> +               <LPASS_AUDIO_CC_EXT_MCLK1_CLK>, <LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC>,
> +               <LPASS_AUDIO_CC_PLL>, <LPASS_AUDIO_CC_PLL_OUT_AUX2>,
> +               <LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC>,
> +               <LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC>,
> +               <LPASS_AUDIO_CC_RX_MCLK_2X_CLK>, <LPASS_AUDIO_CC_RX_MCLK_CLK>,
> +               <LPASS_AUDIO_CC_RX_MCLK_CLK_SRC>;
> +       /delete-property/ power-domains;
> +};
> +
> +&lpass_aon {
> +       status = "disabled";
> +};
> +
> +&lpass_core {
> +       status = "disabled";
> +};
> +
> +&lpass_hm {
> +       status = "disabled";
> +};
> +
> +
>  &qupv3_id_0 {
>         status = "okay";
>  };
> --
> 2.17.1
>
>


-- 
With best wishes
Dmitry

