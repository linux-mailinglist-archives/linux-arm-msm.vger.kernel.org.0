Return-Path: <linux-arm-msm+bounces-30923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4DE96DA71
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 15:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 680391F23BCE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 13:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C0A19D8AD;
	Thu,  5 Sep 2024 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ygMpv68A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C2019AD87
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Sep 2024 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725543235; cv=none; b=Po0scnr5BhJ54MNr8WHb+58ACgQn45iuluwOP0ok8vxyn/eJMVJE+Q/akQURTcin8tWwpdZzzBxv4DJGd5VZ7Hmeq9Mumzfs5d4Wgw3dlPKg6ulIe5XgZUPMmbbnekP+1VHlxIemhjRibELqGpHKNLre3JixdNb19yhXvPjoo4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725543235; c=relaxed/simple;
	bh=S7qtaq6/z53wH1nxOmASZXHiQysK1+AvLzQi0Fea+AE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwZkTpknKUhvlun8nSG9PAfoXZBoh/DTFXZYetS8i6n/Hf+9croXLIOTgVg0lb7AKmUmJCuf4aRk+hbryxL0KFDmGi3DpN8HtsxlvDcEs7maEqPF3n6XaLRcpVaPhZroziaakRolA36UJICx1kA0JU9XJ6VoLO1xDGDfyVQPR74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ygMpv68A; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5356ab89665so937390e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Sep 2024 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725543231; x=1726148031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fQJPfi0Wh2Io+0o0IYUBFYdp9QWUTF9dW8Pyx0M1VL4=;
        b=ygMpv68A5zpUk/bVUlBH8/ZrkLNVUtkPUYGJxYVKLjQt1Ydok/PqXOzcDyaiA52WQ9
         ViEQC9FbIs+bRjofiGLIp3kfEJMOIsROwc12cg7j1xA9NcWPBpMxEogyUu2yv7nf9z0U
         oR9gFeJ0dT/4/tnv/FdQXnN+LHlzo/6S4OA2Z2nTja4yWWXKyMNqL72OU+2MEAkZfdO4
         nEqrxqE2UdB+gd/aEJUyHcJwiDMMM1mnlA+7D1QtH8zruKVpS0avWDlXH4tFNV08xmJB
         va3onXb+hBONOcZMX36ZM8kE8lzx5CFAUNer0iypwQyidkuUXLOBciXGmbFQkcdB0eJ3
         ryew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725543231; x=1726148031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQJPfi0Wh2Io+0o0IYUBFYdp9QWUTF9dW8Pyx0M1VL4=;
        b=Q6To1AeedsjBQplNvp6qvU13Qgv3ZKxptW//56F+YD4kB0C7lh1dN566eDdLgT5gld
         Vx2FDVPBNZ/cb0Yi2nGMjOm9Xa+oyoj+synpO9c9DgcIDMKvdfDPtTvhv2e6oAei2cBk
         xtJgL7iUm3jc4/zOlrD2JoQ5kHD/toTW20X6SnLBc8mVNiQYVmxv1Jh3BM/yJSLsgD0I
         3ggeKSXmIkzVzdsoDphFp+dJ5AlykRqFZK7gWAszHozevYQnW9PxrJ2ahyETr8qnZAyW
         tH2tNtGelxkHIryzTFUTzplDnbuy1Hn2qKx5Ft3M6jHR+Gj3vDlPr66r3wdxADhJBhUO
         PHuw==
X-Forwarded-Encrypted: i=1; AJvYcCXwtXKwvHy5wUZ5oZxo7Fjpr0sEf5Fmat0vy5JIAkrmrrjDH54qHi8IezvPbSwuYtNsA2f0VnUKibe0Yh5w@vger.kernel.org
X-Gm-Message-State: AOJu0YxpdkT6ZgiIy+Dvo673WKUO1ZSCRTxy7RJiBw2Iz/rsWB8hKwAI
	8xY/nbfxrULEkYN92kP5LY53VI6Hn6jBqooVMy1XBHQYv53hHGVtVFdS/BSMydA=
X-Google-Smtp-Source: AGHT+IEiduL9zN28vCoINNVnT6AswQ/sFJPqrAcmtcaqXKaMp2l4Do9mDayY9B6pEfod1Bn+teKNoQ==
X-Received: by 2002:a05:6512:2285:b0:535:63a3:c7d1 with SMTP id 2adb3069b0e04-53563a3c9d2mr5460921e87.48.1725543230385;
        Thu, 05 Sep 2024 06:33:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53540853630sm2633522e87.290.2024.09.05.06.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 06:33:49 -0700 (PDT)
Date: Thu, 5 Sep 2024 16:33:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: srinivas.kandagatla@linaro.org
Cc: andersson@kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: drop sm8250 lpass gfm driver
Message-ID: <u56bph63zl5bu7qrkuwg5gocb3ht56mnbqaa45fl3tnjrvwnl2@gkzarffyucmj>
References: <20240902145203.72628-1-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902145203.72628-1-srinivas.kandagatla@linaro.org>

On Mon, Sep 02, 2024 at 03:52:03PM GMT, srinivas.kandagatla@linaro.org wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> There is no real use for this driver on this platform for below reasons.
> 
> - codec drivers can directly use dsp clocks using the static mux setting.
> - none of the consumers really switch parents and do not handle low power usecases.
> - all users of this drivers are now removed in next

This means that we are going to break compatibility with existing DT
files, which can be deployed or handled in other ways.

We _can_ _not_ drop support for existing compatibles. At least give
a grace time of one LTS release.

> 
> Remove this driver and associated device tree bindings to aviod any
> confusion.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../bindings/clock/qcom,aoncc-sm8250.yaml     |  61 ----
>  .../bindings/clock/qcom,audiocc-sm8250.yaml   |  61 ----
>  drivers/clk/qcom/Kconfig                      |   7 -
>  drivers/clk/qcom/Makefile                     |   1 -
>  drivers/clk/qcom/lpass-gfm-sm8250.c           | 318 ------------------
>  .../clock/qcom,sm8250-lpass-aoncc.h           |  11 -
>  .../clock/qcom,sm8250-lpass-audiocc.h         |  13 -
>  7 files changed, 472 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
>  delete mode 100644 drivers/clk/qcom/lpass-gfm-sm8250.c
>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
>  delete mode 100644 include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
> deleted file mode 100644
> index 8b8932bd5a92..000000000000
> --- a/Documentation/devicetree/bindings/clock/qcom,aoncc-sm8250.yaml
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/clock/qcom,aoncc-sm8250.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: LPASS Always ON Clock Controller on SM8250 SoCs
> -
> -maintainers:
> -  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> -
> -description: |
> -  The clock consumer should specify the desired clock by having the clock
> -  ID in its "clocks" phandle cell.
> -  See include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h for the full list
> -  of Audio Clock controller clock IDs.
> -
> -properties:
> -  compatible:
> -    const: qcom,sm8250-lpass-aoncc
> -
> -  reg:
> -    maxItems: 1
> -
> -  '#clock-cells':
> -    const: 1
> -
> -  clocks:
> -    items:
> -      - description: LPASS Core voting clock
> -      - description: LPASS Audio codec voting clock
> -      - description: Glitch Free Mux register clock
> -
> -  clock-names:
> -    items:
> -      - const: core
> -      - const: audio
> -      - const: bus
> -
> -required:
> -  - compatible
> -  - reg
> -  - '#clock-cells'
> -  - clocks
> -  - clock-names
> -
> -additionalProperties: false
> -
> -examples:
> -  - |
> -    #include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
> -    #include <dt-bindings/sound/qcom,q6afe.h>
> -    clock-controller@3800000 {
> -      #clock-cells = <1>;
> -      compatible = "qcom,sm8250-lpass-aoncc";
> -      reg = <0x03380000 0x40000>;
> -      clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> -               <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> -               <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> -      clock-names = "core", "audio", "bus";
> -    };
> diff --git a/Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
> deleted file mode 100644
> index cfca888f6014..000000000000
> --- a/Documentation/devicetree/bindings/clock/qcom,audiocc-sm8250.yaml
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/clock/qcom,audiocc-sm8250.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: LPASS Audio Clock Controller on SM8250 SoCs
> -
> -maintainers:
> -  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> -
> -description: |
> -  The clock consumer should specify the desired clock by having the clock
> -  ID in its "clocks" phandle cell.
> -  See include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h for the full list
> -  of Audio Clock controller clock IDs.
> -
> -properties:
> -  compatible:
> -    const: qcom,sm8250-lpass-audiocc
> -
> -  reg:
> -    maxItems: 1
> -
> -  '#clock-cells':
> -    const: 1
> -
> -  clocks:
> -    items:
> -      - description: LPASS Core voting clock
> -      - description: LPASS Audio codec voting clock
> -      - description: Glitch Free Mux register clock
> -
> -  clock-names:
> -    items:
> -      - const: core
> -      - const: audio
> -      - const: bus
> -
> -required:
> -  - compatible
> -  - reg
> -  - '#clock-cells'
> -  - clocks
> -  - clock-names
> -
> -additionalProperties: false
> -
> -examples:
> -  - |
> -    #include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
> -    #include <dt-bindings/sound/qcom,q6afe.h>
> -    clock-controller@3300000 {
> -      #clock-cells = <1>;
> -      compatible = "qcom,sm8250-lpass-audiocc";
> -      reg = <0x03300000 0x30000>;
> -      clocks = <&q6afecc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> -               <&q6afecc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
> -               <&q6afecc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> -      clock-names = "core", "audio", "bus";
> -    };
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index a3e2a09e2105..ce970fe5cf0b 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1269,13 +1269,6 @@ config KRAITCC
>  	  Support for the Krait CPU clocks on Qualcomm devices.
>  	  Say Y if you want to support CPU frequency scaling.
>  
> -config CLK_GFM_LPASS_SM8250
> -	tristate "SM8250 GFM LPASS Clocks"
> -	depends on ARM64 || COMPILE_TEST
> -	help
> -	  Support for the Glitch Free Mux (GFM) Low power audio
> -          subsystem (LPASS) clocks found on SM8250 SoCs.
> -
>  config SM_VIDEOCC_8450
>  	tristate "SM8450 Video Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 2b378667a63f..a4751f6dd3b0 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -20,7 +20,6 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
>  # Keep alphabetically sorted by config
>  obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
>  obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
> -obj-$(CONFIG_CLK_GFM_LPASS_SM8250) += lpass-gfm-sm8250.o
>  obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
>  obj-$(CONFIG_CLK_X1E80100_GCC) += gcc-x1e80100.o
> diff --git a/drivers/clk/qcom/lpass-gfm-sm8250.c b/drivers/clk/qcom/lpass-gfm-sm8250.c
> deleted file mode 100644
> index 65d380e30eed..000000000000
> --- a/drivers/clk/qcom/lpass-gfm-sm8250.c
> +++ /dev/null
> @@ -1,318 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * LPASS Audio CC and Always ON CC Glitch Free Mux clock driver
> - *
> - * Copyright (c) 2020 Linaro Ltd.
> - * Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/clk-provider.h>
> -#include <linux/io.h>
> -#include <linux/slab.h>
> -#include <linux/err.h>
> -#include <linux/pm_clock.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/device.h>
> -#include <linux/of.h>
> -#include <linux/platform_device.h>
> -#include <dt-bindings/clock/qcom,sm8250-lpass-audiocc.h>
> -#include <dt-bindings/clock/qcom,sm8250-lpass-aoncc.h>
> -
> -struct lpass_gfm {
> -	struct device *dev;
> -	void __iomem *base;
> -};
> -
> -struct clk_gfm {
> -	unsigned int mux_reg;
> -	unsigned int mux_mask;
> -	struct clk_hw	hw;
> -	struct lpass_gfm *priv;
> -	void __iomem *gfm_mux;
> -};
> -
> -#define to_clk_gfm(_hw) container_of(_hw, struct clk_gfm, hw)
> -
> -static u8 clk_gfm_get_parent(struct clk_hw *hw)
> -{
> -	struct clk_gfm *clk = to_clk_gfm(hw);
> -
> -	return readl(clk->gfm_mux) & clk->mux_mask;
> -}
> -
> -static int clk_gfm_set_parent(struct clk_hw *hw, u8 index)
> -{
> -	struct clk_gfm *clk = to_clk_gfm(hw);
> -	unsigned int val;
> -
> -	val = readl(clk->gfm_mux);
> -
> -	if (index)
> -		val |= clk->mux_mask;
> -	else
> -		val &= ~clk->mux_mask;
> -
> -
> -	writel(val, clk->gfm_mux);
> -
> -	return 0;
> -}
> -
> -static const struct clk_ops clk_gfm_ops = {
> -	.get_parent = clk_gfm_get_parent,
> -	.set_parent = clk_gfm_set_parent,
> -	.determine_rate = __clk_mux_determine_rate,
> -};
> -
> -static struct clk_gfm lpass_gfm_va_mclk = {
> -	.mux_reg = 0x20000,
> -	.mux_mask = BIT(0),
> -	.hw.init = &(struct clk_init_data) {
> -		.name = "VA_MCLK",
> -		.ops = &clk_gfm_ops,
> -		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> -		.num_parents = 2,
> -		.parent_data = (const struct clk_parent_data[]){
> -			{
> -				.index = 0,
> -				.fw_name = "LPASS_CLK_ID_TX_CORE_MCLK",
> -			}, {
> -				.index = 1,
> -				.fw_name = "LPASS_CLK_ID_VA_CORE_MCLK",
> -			},
> -		},
> -	},
> -};
> -
> -static struct clk_gfm lpass_gfm_tx_npl = {
> -	.mux_reg = 0x20000,
> -	.mux_mask = BIT(0),
> -	.hw.init = &(struct clk_init_data) {
> -		.name = "TX_NPL",
> -		.ops = &clk_gfm_ops,
> -		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> -		.parent_data = (const struct clk_parent_data[]){
> -			{
> -				.index = 0,
> -				.fw_name = "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
> -			}, {
> -				.index = 1,
> -				.fw_name = "LPASS_CLK_ID_VA_CORE_2X_MCLK",
> -			},
> -		},
> -		.num_parents = 2,
> -	},
> -};
> -
> -static struct clk_gfm lpass_gfm_wsa_mclk = {
> -	.mux_reg = 0x220d8,
> -	.mux_mask = BIT(0),
> -	.hw.init = &(struct clk_init_data) {
> -		.name = "WSA_MCLK",
> -		.ops = &clk_gfm_ops,
> -		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> -		.parent_data = (const struct clk_parent_data[]){
> -			{
> -				.index = 0,
> -				.fw_name = "LPASS_CLK_ID_TX_CORE_MCLK",
> -			}, {
> -				.index = 1,
> -				.fw_name = "LPASS_CLK_ID_WSA_CORE_MCLK",
> -			},
> -		},
> -		.num_parents = 2,
> -	},
> -};
> -
> -static struct clk_gfm lpass_gfm_wsa_npl = {
> -	.mux_reg = 0x220d8,
> -	.mux_mask = BIT(0),
> -	.hw.init = &(struct clk_init_data) {
> -		.name = "WSA_NPL",
> -		.ops = &clk_gfm_ops,
> -		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> -		.parent_data = (const struct clk_parent_data[]){
> -			{
> -				.index = 0,
> -				.fw_name = "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
> -			}, {
> -				.index = 1,
> -				.fw_name = "LPASS_CLK_ID_WSA_CORE_NPL_MCLK",
> -			},
> -		},
> -		.num_parents = 2,
> -	},
> -};
> -
> -static struct clk_gfm lpass_gfm_rx_mclk_mclk2 = {
> -	.mux_reg = 0x240d8,
> -	.mux_mask = BIT(0),
> -	.hw.init = &(struct clk_init_data) {
> -		.name = "RX_MCLK_MCLK2",
> -		.ops = &clk_gfm_ops,
> -		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> -		.parent_data = (const struct clk_parent_data[]){
> -			{
> -				.index = 0,
> -				.fw_name = "LPASS_CLK_ID_TX_CORE_MCLK",
> -			}, {
> -				.index = 1,
> -				.fw_name = "LPASS_CLK_ID_RX_CORE_MCLK",
> -			},
> -		},
> -		.num_parents = 2,
> -	},
> -};
> -
> -static struct clk_gfm lpass_gfm_rx_npl = {
> -	.mux_reg = 0x240d8,
> -	.mux_mask = BIT(0),
> -	.hw.init = &(struct clk_init_data) {
> -		.name = "RX_NPL",
> -		.ops = &clk_gfm_ops,
> -		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> -		.parent_data = (const struct clk_parent_data[]){
> -			{
> -				.index = 0,
> -				.fw_name = "LPASS_CLK_ID_TX_CORE_NPL_MCLK",
> -			}, {
> -				.index = 1,
> -				.fw_name = "LPASS_CLK_ID_RX_CORE_NPL_MCLK",
> -			},
> -		},
> -		.num_parents = 2,
> -	},
> -};
> -
> -static struct clk_gfm *aoncc_gfm_clks[] = {
> -	[LPASS_CDC_VA_MCLK]		= &lpass_gfm_va_mclk,
> -	[LPASS_CDC_TX_NPL]		= &lpass_gfm_tx_npl,
> -};
> -
> -static struct clk_hw_onecell_data aoncc_hw_onecell_data = {
> -	.hws = {
> -		[LPASS_CDC_VA_MCLK]	= &lpass_gfm_va_mclk.hw,
> -		[LPASS_CDC_TX_NPL]	= &lpass_gfm_tx_npl.hw,
> -	},
> -	.num = ARRAY_SIZE(aoncc_gfm_clks),
> -};
> -
> -static struct clk_gfm *audiocc_gfm_clks[] = {
> -	[LPASS_CDC_WSA_NPL]		= &lpass_gfm_wsa_npl,
> -	[LPASS_CDC_WSA_MCLK]		= &lpass_gfm_wsa_mclk,
> -	[LPASS_CDC_RX_NPL]		= &lpass_gfm_rx_npl,
> -	[LPASS_CDC_RX_MCLK_MCLK2]	= &lpass_gfm_rx_mclk_mclk2,
> -};
> -
> -static struct clk_hw_onecell_data audiocc_hw_onecell_data = {
> -	.hws = {
> -		[LPASS_CDC_WSA_NPL]	= &lpass_gfm_wsa_npl.hw,
> -		[LPASS_CDC_WSA_MCLK]	= &lpass_gfm_wsa_mclk.hw,
> -		[LPASS_CDC_RX_NPL]	= &lpass_gfm_rx_npl.hw,
> -		[LPASS_CDC_RX_MCLK_MCLK2] = &lpass_gfm_rx_mclk_mclk2.hw,
> -	},
> -	.num = ARRAY_SIZE(audiocc_gfm_clks),
> -};
> -
> -struct lpass_gfm_data {
> -	struct clk_hw_onecell_data *onecell_data;
> -	struct clk_gfm **gfm_clks;
> -};
> -
> -static struct lpass_gfm_data audiocc_data = {
> -	.onecell_data = &audiocc_hw_onecell_data,
> -	.gfm_clks = audiocc_gfm_clks,
> -};
> -
> -static struct lpass_gfm_data aoncc_data = {
> -	.onecell_data = &aoncc_hw_onecell_data,
> -	.gfm_clks = aoncc_gfm_clks,
> -};
> -
> -static int lpass_gfm_clk_driver_probe(struct platform_device *pdev)
> -{
> -	const struct lpass_gfm_data *data;
> -	struct device *dev = &pdev->dev;
> -	struct clk_gfm *gfm;
> -	struct lpass_gfm *cc;
> -	int err, i;
> -
> -	data = of_device_get_match_data(dev);
> -	if (!data)
> -		return -EINVAL;
> -
> -	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
> -	if (!cc)
> -		return -ENOMEM;
> -
> -	cc->base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(cc->base))
> -		return PTR_ERR(cc->base);
> -
> -	err = devm_pm_runtime_enable(dev);
> -	if (err)
> -		return err;
> -
> -	err = devm_pm_clk_create(dev);
> -	if (err)
> -		return err;
> -
> -	err = of_pm_clk_add_clks(dev);
> -	if (err < 0) {
> -		dev_dbg(dev, "Failed to get lpass core voting clocks\n");
> -		return err;
> -	}
> -
> -	for (i = 0; i < data->onecell_data->num; i++) {
> -		if (!data->gfm_clks[i])
> -			continue;
> -
> -		gfm = data->gfm_clks[i];
> -		gfm->priv = cc;
> -		gfm->gfm_mux = cc->base;
> -		gfm->gfm_mux = gfm->gfm_mux + data->gfm_clks[i]->mux_reg;
> -
> -		err = devm_clk_hw_register(dev, &data->gfm_clks[i]->hw);
> -		if (err)
> -			return err;
> -
> -	}
> -
> -	err = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> -					  data->onecell_data);
> -	if (err)
> -		return err;
> -
> -	return 0;
> -}
> -
> -static const struct of_device_id lpass_gfm_clk_match_table[] = {
> -	{
> -		.compatible = "qcom,sm8250-lpass-aoncc",
> -		.data = &aoncc_data,
> -	},
> -	{
> -		.compatible = "qcom,sm8250-lpass-audiocc",
> -		.data = &audiocc_data,
> -	},
> -	{ }
> -};
> -MODULE_DEVICE_TABLE(of, lpass_gfm_clk_match_table);
> -
> -static const struct dev_pm_ops lpass_gfm_pm_ops = {
> -	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
> -};
> -
> -static struct platform_driver lpass_gfm_clk_driver = {
> -	.probe		= lpass_gfm_clk_driver_probe,
> -	.driver		= {
> -		.name	= "lpass-gfm-clk",
> -		.of_match_table = lpass_gfm_clk_match_table,
> -		.pm = &lpass_gfm_pm_ops,
> -	},
> -};
> -module_platform_driver(lpass_gfm_clk_driver);
> -MODULE_LICENSE("GPL v2");
> -MODULE_DESCRIPTION("QTI SM8250 LPASS Glitch Free Mux clock driver");
> diff --git a/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h b/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
> deleted file mode 100644
> index f5a1cfac8612..000000000000
> --- a/include/dt-bindings/clock/qcom,sm8250-lpass-aoncc.h
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -
> -#ifndef _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H
> -#define _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H
> -
> -/* from AOCC */
> -#define LPASS_CDC_VA_MCLK				0
> -#define LPASS_CDC_TX_NPL				1
> -#define LPASS_CDC_TX_MCLK				2
> -
> -#endif /* _DT_BINDINGS_CLK_LPASS_AONCC_SM8250_H */
> diff --git a/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h b/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
> deleted file mode 100644
> index a1aa6cb5d840..000000000000
> --- a/include/dt-bindings/clock/qcom,sm8250-lpass-audiocc.h
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -
> -#ifndef _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H
> -#define _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H
> -
> -/* From AudioCC */
> -#define LPASS_CDC_WSA_NPL				0
> -#define LPASS_CDC_WSA_MCLK				1
> -#define LPASS_CDC_RX_MCLK				2
> -#define LPASS_CDC_RX_NPL				3
> -#define LPASS_CDC_RX_MCLK_MCLK2				4
> -
> -#endif /* _DT_BINDINGS_CLK_LPASS_AUDIOCC_SM8250_H */
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

