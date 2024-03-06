Return-Path: <linux-arm-msm+bounces-13425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9E7873003
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 08:55:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A16DA1C2197F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 07:55:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737885CDF5;
	Wed,  6 Mar 2024 07:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yj3YcQBw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFA75CDCE
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 07:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709711701; cv=none; b=Ws0BR+TQaaoK/7yhUFjQVV5PBE7Y94uQ4M65+muile/gdmR/NqVgT57v+ysLU2NMtZG/e3LJEEqlUHDh+uN+RBWIhs5NlUAwaBOxtaRbSfHfkv1PVF0Sofq2nr8ax3aIRCGdLZkLo4VINCz07IuKmXM+KtTpqduoHE1vAXUIG00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709711701; c=relaxed/simple;
	bh=aT6s0q5bNZmLH0H67V3Rmd03U6ydDKJGdwsvi8oJU4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VhW6xaBWOISJAEMVV/EO7F9X1oZey9Q3P7lcHwkmOlNeIt+XLkvgtXcmSvUuMLwrbpKwCLDBSTJtzxWggxoMqdfDQkXX4UgeIUwQtKCcWiUXu23JNDQicOnJXZvy1nnt0lQi15nPcGafzWAnEnmP+3+E8V/ZhhFrMdTRAjzDRiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yj3YcQBw; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6099703e530so30286847b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Mar 2024 23:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709711698; x=1710316498; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oaqc2+YsVlkwTXLD92MDRabesdqHp1t+roUWHws0dpU=;
        b=yj3YcQBwTLqn8Fa7NGx2FMKbSAXSOHK7qE79PsFAY/hwfZOXAL1dssqFTWuj5yqaYT
         YwFiRsk/GHCiscbaHwzKiKhveKPzcPZGGPR4P1jeTCvSrubm8hTxCVZXZKtkjD6Qfwyi
         x7yLRLHiHTuHXooNvAryB6mr9t7cBxDFHUK1uQVU+qP8SdmLjTmgL+SMbB+26lG2SKoF
         kMxwYt/uoZHEOEawhVZKypK5dZFrc0g4JvuhX/b26UK/5zvoCEAW7FFy6crWNlvk/428
         IgcIc4Dh0wolFPR0+HNLFw6rT+aE8yJm3tZfjbqoqGUsC8BlFPk0IRY5puIqAiH7vgQT
         8aeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709711698; x=1710316498;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oaqc2+YsVlkwTXLD92MDRabesdqHp1t+roUWHws0dpU=;
        b=soLTR/rygJkDDu9Eb5RxdYigAqtXPr63pS9zyautk6/mqpSLIW4X+w3sFwZAixJ5DP
         mS9I7kbDuhPKxWW+YYOp0zHE8CHbufNoLOYyW5KEDMelqMNWMYdZaABWuyUQ3UPFKxuJ
         2Edwf4GQul5yFF6A2thva1FQMsUAX6MOOTO3wzSxPIqQlclEnRgrknAhHmWEP29/aoJK
         O8U1AqN5JyE5yStmHgPSQaRepM7KAeQtMUmyqfl4ykYSngNsCrorqdRk26MrN6YD+CW4
         rPzT2Q/Mx89Toz20OIoDDNRq/4KKayJVvHPPVPKaLGmIIFYotYis1VpuJIFQHD5hgxD4
         Q+0w==
X-Forwarded-Encrypted: i=1; AJvYcCUI4FsRoD7dDdvvaQ4qTu+1FFnlgO3FJvcAqJBq/QmHrCtJXcGgXB0eePtsK95GY5E0+60bNPBCzt2mtXpKTleOchdLoabq2xcvJGrkdA==
X-Gm-Message-State: AOJu0YxQfZDRl5SLYR/utRFe35xJ9mu0VKeATC2WRjk9ZenGX9Xi2Uxn
	8Ou67osxGotVt76AbZYaafMcUqNOSIl6brcJ8O4znNHfY7hlox0ExtdhhIalatAHffF/uJKXIas
	1HRLOlNsleAzDEmatP/8rVU/qzT/iueLERYQA4Q==
X-Google-Smtp-Source: AGHT+IFf6CQyXJ+whmnzlK1ODq/y1Ys63CxSasCbI+U9PAjJqwXjwr+48Gj5y2n/jtEAXtzENi50bxb8GZluWwdTbu0=
X-Received: by 2002:a81:4c44:0:b0:607:cb4e:eb41 with SMTP id
 z65-20020a814c44000000b00607cb4eeb41mr11946522ywa.35.1709711697939; Tue, 05
 Mar 2024 23:54:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208062836.19767-1-quic_tdas@quicinc.com> <20240208062836.19767-6-quic_tdas@quicinc.com>
 <CAA8EJpq4YfX+1mYBS3AMWFp+7pYGdY6bvTUGsvYeqfNOo1KbAg@mail.gmail.com> <c7ddbb39-a9df-485b-87d3-2ad992f24086@quicinc.com>
In-Reply-To: <c7ddbb39-a9df-485b-87d3-2ad992f24086@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 6 Mar 2024 09:54:46 +0200
Message-ID: <CAA8EJppzv-zk1h5JxGMS41BtJmZ9OULZ_kK_--oZUsjAKNAjZw@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Update protected clocks list for
 qcm6490 variants
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 6 Mar 2024 at 08:54, Taniya Das <quic_tdas@quicinc.com> wrote:
>
> Thanks for your review Dmitry.
>
> On 2/8/2024 12:44 PM, Dmitry Baryshkov wrote:
> > On Thu, 8 Feb 2024 at 08:29, Taniya Das <quic_tdas@quicinc.com> wrote:
> >>
> >> Certain clocks are not accessible on QCM6490-IDP and QCS6490-RB3GEN2 boards
> >> thus require them to be marked protected.
> >>
> >> Also disable the LPASS nodes which are not to be used.
> >>
> >> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/qcm6490-idp.dts     | 54 +++++++++++++++++++-
> >>   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 50 +++++++++++++++++-
> >>   2 files changed, 102 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> >> index 03e97e27d16d..425e4b87490b 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> >> @@ -1,6 +1,6 @@
> >>   // SPDX-License-Identifier: BSD-3-Clause
> >>   /*
> >> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>    */
> >>
> >>   /dts-v1/;
> >> @@ -415,6 +415,58 @@
> >>          };
> >>   };
> >>
> >> +&gcc {
> >> +       protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
> >> +                       <GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
> >> +                       <GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
> >> +                       <GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
> >> +                       <GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> >> +                       <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
> >> +                       <GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
> >> +                       <GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
> >> +                       <GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
> >> +                       <GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
> >> +                       <GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
> >> +                       <GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
> >> +                       <GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
> >> +                       <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
> >> +                       <GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
> >> +                       <GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> >> +                       <GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
> >> +                       <GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
> >
> > This looks like a huge variety of clocks. Are they really not
> > accessible or are you trying to make Linux stay away from all those
> > clocks to keep bootloader settings?
> >
>
> These clocks are protected and accessing them from Linux will cause Bus
> error (NoC) and thus this list grows sometimes.
>
> >> +};
> >> +
> >> +&lpasscc {
> >> +       status = "disabled";
> >> +};
> >> +
> >> +&lpass_audiocc {
> >> +       qcom,adsp-skip-pll;
> >> +       protected-clocks = <LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC>,
> >> +               <LPASS_AUDIO_CC_CODEC_MEM0_CLK>, <LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
> >> +               <LPASS_AUDIO_CC_CODEC_MEM2_CLK>, <LPASS_AUDIO_CC_CODEC_MEM_CLK>,
> >> +               <LPASS_AUDIO_CC_EXT_MCLK0_CLK>, <LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC>,
> >> +               <LPASS_AUDIO_CC_EXT_MCLK1_CLK>, <LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC>,
> >> +               <LPASS_AUDIO_CC_PLL>, <LPASS_AUDIO_CC_PLL_OUT_AUX2>,
> >> +               <LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC>,
> >> +               <LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC>,
> >> +               <LPASS_AUDIO_CC_RX_MCLK_2X_CLK>, <LPASS_AUDIO_CC_RX_MCLK_CLK>,
> >> +               <LPASS_AUDIO_CC_RX_MCLK_CLK_SRC>;
> >
> > This almost looks like a separate compatible.
>
> We need to use the reset from this controller, rest all will be
> controlled via the Low Power Audio Firmware.

Not "separate device", but "separate compatible".

>
> >
> >> +       /delete-property/ power-domains;
> >> +};
> >> +
> >> +&lpass_aon {
> >> +       status = "disabled";
> >
> > Should this be "reserved", controlled by ADSP? See how this was
> > implemented in sc7180.dtsi / sc7180-trogdor.dtsi.
> > Please consider inverting the logic. Generic ADSP implementation
> > should be present in sc7280.dtsi and then the non-default ChromeOS
> > implementation should be a part of sc7280-chrome-common.dtsi.
> >
>
> This I will take care in the next series.
>
> >> +};
> >> +
> >> +&lpass_core {
> >> +       status = "disabled";
> >> +};
> >> +
> >> +&lpass_hm {
> >> +       status = "disabled";
> >> +};
> >> +
> >>   &qupv3_id_0 {
> >>          status = "okay";
> >>   };
> >> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >> index 8bb7d13d85f6..1398b84634c3 100644
> >> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> >> @@ -1,6 +1,6 @@
> >>   // SPDX-License-Identifier: BSD-3-Clause
> >>   /*
> >> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> >>    */
> >>
> >>   /dts-v1/;
> >> @@ -413,6 +413,54 @@
> >>          };
> >>   };
> >>
> >> +&gcc {
> >> +       protected-clocks = <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
> >> +                       <GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
> >> +                       <GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
> >> +                       <GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
> >> +                       <GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
> >> +                       <GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
> >> +                       <GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
> >> +                       <GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
> >> +                       <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
> >> +                       <GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
> >> +                       <GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> >> +                       <GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
> >> +                       <GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
> >> +};
> >> +
> >> +&lpasscc {
> >> +       status = "disabled";
> >> +};
> >> +
> >> +&lpass_audiocc {
> >> +       qcom,adsp-skip-pll;
> >> +       protected-clocks = <LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC>,
> >> +               <LPASS_AUDIO_CC_CODEC_MEM0_CLK>, <LPASS_AUDIO_CC_CODEC_MEM1_CLK>,
> >> +               <LPASS_AUDIO_CC_CODEC_MEM2_CLK>, <LPASS_AUDIO_CC_CODEC_MEM_CLK>,
> >> +               <LPASS_AUDIO_CC_EXT_MCLK0_CLK>, <LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC>,
> >> +               <LPASS_AUDIO_CC_EXT_MCLK1_CLK>, <LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC>,
> >> +               <LPASS_AUDIO_CC_PLL>, <LPASS_AUDIO_CC_PLL_OUT_AUX2>,
> >> +               <LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC>,
> >> +               <LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC>,
> >> +               <LPASS_AUDIO_CC_RX_MCLK_2X_CLK>, <LPASS_AUDIO_CC_RX_MCLK_CLK>,
> >> +               <LPASS_AUDIO_CC_RX_MCLK_CLK_SRC>;
> >> +       /delete-property/ power-domains;
> >> +};
> >> +
> >> +&lpass_aon {
> >> +       status = "disabled";
> >> +};
> >> +
> >> +&lpass_core {
> >> +       status = "disabled";
> >> +};
> >> +
> >> +&lpass_hm {
> >> +       status = "disabled";
> >> +};
> >> +
> >> +
> >>   &qupv3_id_0 {
> >>          status = "okay";
> >>   };
> >> --
> >> 2.17.1
> >>
> >>
> >
> >
>
> --
> Thanks & Regards,
> Taniya Das.



-- 
With best wishes
Dmitry

