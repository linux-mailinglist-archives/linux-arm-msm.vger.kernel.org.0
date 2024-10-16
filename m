Return-Path: <linux-arm-msm+bounces-34576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC6D9A06D9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 12:16:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E2311C20FBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 10:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C563206069;
	Wed, 16 Oct 2024 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T3eEXEFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D7C21E3CB
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 10:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729073781; cv=none; b=GQD9uXDf7EuRUcCu4rwxM/JYZ6yMFSKfAiRvo2dlX2MAZyOHIncLBKGHRQIIC9ZD+PSf20fctxVwgwmtZKvGBbaxA+LZuyPkwbqsc4iLRZrDiQsyQNPA/UspyZklLyIBJ3s4tEiwypeLR4mgNTYHpAbm8YOi4H44o73DyrOnSqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729073781; c=relaxed/simple;
	bh=Vxrwc30rWnHIG4x6zu/VVm3JNxQbP839V/4GlsL7Pc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYSj5h8z2MlPylZ6JJRaOidv5rrRCyTwNRkXgLVxOgOVi9wcR3y8RoAKTCsL2gextKH7XTT6eeHp3Y19J5Vr9/WYhzsQWHf1lbKdBcqNg3b7r+Tbp5+JKPWky9BT8wKxBG2Ydyi7wewnkZPOYcfQmPYqmbTGZNpiB9TI6Tyt9Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T3eEXEFR; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so42767501fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2024 03:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729073777; x=1729678577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B5PX9JhNPdcypoppol4bDUPGtn9GjAXkYOU05FEkE6Q=;
        b=T3eEXEFRh3xmuOSraPRGE8UXOdsN6eGKuZhABQTpCyyS+xC7vWdzGPSdfIqjCpeeYs
         xLBLpr+RqIZC40ISkSs6Ew80M5k+fLrzxVFiheEIYp9YMxFEU0jNeBWbQ4x66h8G2FNs
         lTWQxx5L6oGmLcrTglHvg7AiFtS5fr6qgzgCLHOwa2F/51FBlU0Rw+tGlJjEj7aiQKAl
         6CL+Ti349kCG2pb8Otk57TdZ9m28Wv3Bc0ECoJt56itCKsoD2Ttf+uLvsT/8CuNXPI6u
         a+BROkbkuO8zjwTUyuH3RaAQ3YzUYEBCx2VvKPgBt1SRCz1kbzbx2QrJIL+w4TVnNtvS
         OCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729073777; x=1729678577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B5PX9JhNPdcypoppol4bDUPGtn9GjAXkYOU05FEkE6Q=;
        b=LEUv67oHfBq3PuaWLMEAX0HoCowPgPPSKn/VuGYvcu7Y0TL+B9F0qDaPngYoTbsCg0
         cIRHL+l1PJmCVTfucZ/seCWWHEM5cBiT/L8hQqcOb3is38dDMUOJZCUAHmIoabkxZXlh
         mqRkuBMiM/MeB0KCrxdV75PcqXjNnFxn1G+MWI3DSqigGN4ZGlnjO+NB7XqmGwNsS3A/
         UjDZi0khtmpLwkcUVh61Qc+KEIrbyQi9nVZlJE/PKvqfwsTsq9aBK+s4kg5CZ9+04aT9
         0F1G/iWDF5rINqimKE+wl+MAi1trGMb3oY+zrOkxItHvYznQi3jieZtiXNi7Lw7+tDzU
         tuwg==
X-Forwarded-Encrypted: i=1; AJvYcCUnX8653+EHKUin1Oi8wX+WkDSQazt/9niVJYJGQdiWsYBTWtGOhYtE00c7yoDBC3hOEzkvKeygqo687yfF@vger.kernel.org
X-Gm-Message-State: AOJu0YwvMtt34Op7ZFcxLTbhXVY+eh2tUwmlNiShfenKHb8gYyRaYb76
	o1QtYUvhKVLZxms7AgZ65BUWsXbxML9gqCiPN1MV1sN7c2FlVT1Dvu10a8/HDMc=
X-Google-Smtp-Source: AGHT+IFCZhyg28Rf7C+kKKqe/84tcU45w6D9xE1GvvB5WsL02qX5wHksYGsHHYUK+MBnWV/hjZEM5A==
X-Received: by 2002:ac2:4c4a:0:b0:539:901c:e2e with SMTP id 2adb3069b0e04-539e5728283mr8802185e87.58.1729073776681;
        Wed, 16 Oct 2024 03:16:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ffff37efsm405431e87.159.2024.10.16.03.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 03:16:15 -0700 (PDT)
Date: Wed, 16 Oct 2024 13:16:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] clk: qcom: gcc: Add support for QCS615 GCC clocks
Message-ID: <kgtg7seem6jhidn4svxttobwvs44uwezsj2f6hydjm7er4qt5d@kehfmwi437wg>
References: <20240920-qcs615-clock-driver-v2-0-2f6de44eb2aa@quicinc.com>
 <20240920-qcs615-clock-driver-v2-4-2f6de44eb2aa@quicinc.com>
 <gokgyvnunjswjdjmbhfvjzvdc6ag7r3dztj2hqk3cglwyz5f5a@aarbe4rrifme>
 <f1080f46-ed96-4360-ae91-0d5b7aa138ce@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1080f46-ed96-4360-ae91-0d5b7aa138ce@quicinc.com>

On Wed, Oct 16, 2024 at 09:40:07AM +0530, Taniya Das wrote:
> 
> 
> On 9/20/2024 4:33 PM, Dmitry Baryshkov wrote:
> > On Fri, Sep 20, 2024 at 04:08:18PM GMT, Taniya Das wrote:
> > > Add the global clock controller support for QCS615 SoC.
> > > 
> > > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > > ---
> > >   drivers/clk/qcom/Kconfig      |    9 +
> > >   drivers/clk/qcom/Makefile     |    1 +
> > >   drivers/clk/qcom/gcc-qcs615.c | 3035 +++++++++++++++++++++++++++++++++++++++++
> > >   3 files changed, 3045 insertions(+)
> > > 
> > > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > > index a3e2a09e2105..52a7ba6d4cbf 100644
> > > --- a/drivers/clk/qcom/Kconfig
> > > +++ b/drivers/clk/qcom/Kconfig
> > > @@ -467,6 +467,15 @@ config QCS_GCC_404
> > >   	  Say Y if you want to use multimedia devices or peripheral
> > >   	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
> > > +config QCS_GCC_615
> > > +	tristate "QCS615 Global Clock Controller"
> > > +	depends on ARM64 || COMPILE_TEST
> > > +	select QCOM_GDSC
> > > +	help
> > > +	  Support for the global clock controller on QCS615 devices.
> > > +	  Say Y if you want to use multimedia devices or peripheral
> > > +	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.
> > > +
> > >   config SC_CAMCC_7180
> > >   	tristate "SC7180 Camera Clock Controller"
> > >   	depends on ARM64 || COMPILE_TEST
> > > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > > index 2b378667a63f..a46ce0723602 100644
> > > --- a/drivers/clk/qcom/Makefile
> > > +++ b/drivers/clk/qcom/Makefile
> > > @@ -70,6 +70,7 @@ obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
> > >   obj-$(CONFIG_QCM_GCC_2290) += gcc-qcm2290.o
> > >   obj-$(CONFIG_QCM_DISPCC_2290) += dispcc-qcm2290.o
> > >   obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
> > > +obj-$(CONFIG_QCS_GCC_615) += gcc-qcs615.o
> > >   obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
> > >   obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
> > >   obj-$(CONFIG_QDU_ECPRICC_1000) += ecpricc-qdu1000.o
> > > diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
> > > new file mode 100644
> > > index 000000000000..7db55a5d8e80
> > > --- /dev/null
> > > +++ b/drivers/clk/qcom/gcc-qcs615.c
> > > @@ -0,0 +1,3035 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > + */
> > > +
> > > +#include <linux/clk-provider.h>
> > > +#include <linux/module.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/of.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/regmap.h>
> > > +
> > > +#include <dt-bindings/clock/qcom,qcs615-gcc.h>
> > > +
> > > +#include "clk-alpha-pll.h"
> > > +#include "clk-branch.h"
> > > +#include "clk-rcg.h"
> > > +#include "clk-regmap.h"
> > > +#include "clk-regmap-divider.h"
> > > +#include "clk-regmap-mux.h"
> > > +#include "common.h"
> > > +#include "gdsc.h"
> > > +#include "reset.h"
> > > +
> > > +enum {
> > > +	DT_BI_TCXO,
> > > +	DT_BI_TCXO_AO,
> > > +	DT_SLEEP_CLK,
> > > +};
> > > +
> > > +enum {
> > > +	P_BI_TCXO,
> > > +	P_GPLL0_OUT_AUX2_DIV,
> > > +	P_GPLL0_OUT_MAIN,
> > > +	P_GPLL3_OUT_MAIN,
> > > +	P_GPLL3_OUT_MAIN_DIV,
> > > +	P_GPLL4_OUT_MAIN,
> > > +	P_GPLL6_OUT_MAIN,
> > > +	P_GPLL7_OUT_MAIN,
> > > +	P_GPLL8_OUT_MAIN,
> > > +	P_SLEEP_CLK,
> > > +};
> > > +
> > > +static struct clk_alpha_pll gpll0 = {
> > > +	.offset = 0x0,
> > > +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> > > +	.clkr = {
> > > +		.enable_reg = 0x52000,
> > > +		.enable_mask = BIT(0),
> > > +		.hw.init = &(const struct clk_init_data) {
> > > +			.name = "gpll0",
> > > +			.parent_data = &(const struct clk_parent_data) {
> > > +				.index = DT_BI_TCXO,
> > > +			},
> > > +			.num_parents = 1,
> > > +			.ops = &clk_alpha_pll_ops,
> > > +		},
> > > +	},
> > > +};
> > > +
> > > +static struct clk_fixed_factor gpll0_out_aux2_div = {
> > > +	.mult = 1,
> > > +	.div = 2,
> > > +	.hw.init = &(struct clk_init_data) {
> > > +		.name = "gpll0_out_aux2_div",
> > > +		.parent_data = &(const struct clk_parent_data) {
> > > +			.hw = &gpll0.clkr.hw,
> > > +		},
> > > +		.num_parents = 1,
> > > +		.ops = &clk_fixed_factor_ops,
> > > +	},
> > > +};
> > 
> > Should it be clk_alpha_pll_postdiv_foo_ops ?
> > 
> 
> This is not the PLL output, but it is a fixed divider which is placed as
> input to the RCG.
> That is the reason to use the fixed factor.

Usually OUT_AUX2 is the PLL output, isn't it? Even by its name. See
gcc-qcm2290 / gcc-sm6115 and most of other clock controller drivers,
except gcc-sm6125. Maybe I don't understand the difference between the
two usecases. Is there a difference in the GCC / PLL design?

> > > +
> > > +static struct clk_alpha_pll gpll3 = {
> > > +	.offset = 0x3000,
> > > +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> > > +	.clkr = {
> > > +		.enable_reg = 0x52000,
> > > +		.enable_mask = BIT(3),
> > > +		.hw.init = &(const struct clk_init_data) {
> > > +			.name = "gpll3",
> > > +			.parent_data = &(const struct clk_parent_data) {
> > > +				.index = DT_BI_TCXO,
> > > +			},
> > > +			.num_parents = 1,
> > > +			.ops = &clk_alpha_pll_ops,
> > > +		},
> > > +	},
> > > +};
> > > +
> > > +static struct clk_fixed_factor gpll3_out_aux2_div = {
> > > +	.mult = 1,
> > > +	.div = 2,
> > > +	.hw.init = &(struct clk_init_data) {
> > > +		.name = "gpll3_out_aux2_div",
> > > +		.parent_data = &(const struct clk_parent_data) {
> > > +			.hw = &gpll3.clkr.hw,
> > > +		},
> > > +		.num_parents = 1,
> > > +		.ops = &clk_fixed_factor_ops,
> > > +	},
> > > +};
> > 
> > Should it be clk_alpha_pll_postdiv_foo_ops ?
> > 
> 
> Same is the case here as well. This is not the PLL output, but it is a fixed
> divider which is placed as input to the RCG.
> That is the reason to use the fixed factor.
> 
> > > +
> > > +static struct clk_alpha_pll gpll4 = {
> > > +	.offset = 0x76000,
> > > +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> > > +	.clkr = {
> > > +		.enable_reg = 0x52000,
> > > +		.enable_mask = BIT(4),
> > > +		.hw.init = &(const struct clk_init_data) {
> > > +			.name = "gpll4",
> > > +			.parent_data = &(const struct clk_parent_data) {
> > > +				.index = DT_BI_TCXO,
> > > +			},
> > > +			.num_parents = 1,
> > > +			.ops = &clk_alpha_pll_ops,
> > > +		},
> > > +	},
> > > +};
> > > +
> > > +static struct clk_alpha_pll gpll6 = {
> > > +	.offset = 0x13000,
> > > +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> > > +	.clkr = {
> > > +		.enable_reg = 0x52000,
> > > +		.enable_mask = BIT(6),
> > > +		.hw.init = &(const struct clk_init_data) {
> > > +			.name = "gpll6",
> > > +			.parent_data = &(const struct clk_parent_data) {
> > > +				.index = DT_BI_TCXO,
> > > +			},
> > > +			.num_parents = 1,
> > > +			.ops = &clk_alpha_pll_ops,
> > > +		},
> > > +	},
> > > +};
> > > +
> > > +static const struct clk_div_table post_div_table_gpll6_out_main[] = {
> > > +	{ 0x1, 2 },
> > > +	{ }
> > > +};
> > > +
> > > +static struct clk_alpha_pll_postdiv gpll6_out_main = {
> > > +	.offset = 0x13000,
> > > +	.post_div_shift = 8,
> > > +	.post_div_table = post_div_table_gpll6_out_main,
> > > +	.num_post_div = ARRAY_SIZE(post_div_table_gpll6_out_main),
> > > +	.width = 4,
> > > +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> > > +	.clkr.hw.init = &(const struct clk_init_data) {
> > > +		.name = "gpll6_out_main",
> > > +		.parent_hws = (const struct clk_hw*[]) {
> > > +			&gpll6.clkr.hw,
> > > +		},
> > > +		.num_parents = 1,
> > > +		.ops = &clk_alpha_pll_postdiv_ops,
> > > +	},
> > > +};
> > > +
> > > +static struct clk_alpha_pll gpll7 = {
> > > +	.offset = 0x1a000,
> > > +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> > > +	.clkr = {
> > > +		.enable_reg = 0x52000,
> > > +		.enable_mask = BIT(7),
> > > +		.hw.init = &(const struct clk_init_data) {
> > > +			.name = "gpll7",
> > > +			.parent_data = &(const struct clk_parent_data) {
> > > +				.index = DT_BI_TCXO,
> > > +			},
> > > +			.num_parents = 1,
> > > +			.ops = &clk_alpha_pll_ops,
> > > +		},
> > > +	},
> > > +};
> > > +
> > > +static struct clk_alpha_pll gpll8 = {
> > > +	.offset = 0x1b000,
> > > +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> > > +	.clkr = {
> > > +		.enable_reg = 0x52000,
> > > +		.enable_mask = BIT(8),
> > > +		.hw.init = &(const struct clk_init_data) {
> > > +			.name = "gpll8",
> > > +			.parent_data = &(const struct clk_parent_data) {
> > > +				.index = DT_BI_TCXO,
> > > +			},
> > > +			.num_parents = 1,
> > > +			.ops = &clk_alpha_pll_ops,
> > > +		},
> > > +	},
> > > +};
> > > +
> > > +static const struct clk_div_table post_div_table_gpll8_out_main[] = {
> > > +	{ 0x1, 2 },
> > > +	{ }
> > > +};
> > > +
> > > +static struct clk_alpha_pll_postdiv gpll8_out_main = {
> > > +	.offset = 0x1b000,
> > > +	.post_div_shift = 8,
> > > +	.post_div_table = post_div_table_gpll8_out_main,
> > > +	.num_post_div = ARRAY_SIZE(post_div_table_gpll8_out_main),
> > > +	.width = 4,
> > > +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> > > +	.clkr.hw.init = &(const struct clk_init_data) {
> > > +		.name = "gpll8_out_main",
> > > +		.parent_hws = (const struct clk_hw*[]) {
> > > +			&gpll8.clkr.hw,
> > > +		},
> > > +		.num_parents = 1,
> > > +		.ops = &clk_alpha_pll_postdiv_ops,
> > > +	},
> > > +};
> > > +
> > > +static const struct parent_map gcc_parent_map_0[] = {
> > > +	{ P_BI_TCXO, 0 },
> > > +	{ P_GPLL0_OUT_MAIN, 1 },
> > > +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
> > > +};
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_0[] = {
> > > +	{ .index = DT_BI_TCXO },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +	{ .hw = &gpll0_out_aux2_div.hw },
> > > +};
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_0_ao[] = {
> > > +	{ .index = DT_BI_TCXO_AO },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +};
> > > +
> > > +static const struct parent_map gcc_parent_map_1[] = {
> > > +	{ P_BI_TCXO, 0 },
> > > +	{ P_GPLL0_OUT_MAIN, 1 },
> > > +	{ P_GPLL6_OUT_MAIN, 2 },
> > > +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
> > > +};
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_1[] = {
> > > +	{ .index = DT_BI_TCXO },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +	{ .hw = &gpll6_out_main.clkr.hw },
> > > +	{ .hw = &gpll0_out_aux2_div.hw },
> > > +};
> > > +
> > > +static const struct parent_map gcc_parent_map_2[] = {
> > > +	{ P_BI_TCXO, 0 },
> > > +	{ P_GPLL0_OUT_MAIN, 1 },
> > > +	{ P_SLEEP_CLK, 5 },
> > > +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
> > > +};
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_2[] = {
> > > +	{ .index = DT_BI_TCXO },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +	{ .index = DT_SLEEP_CLK },
> > > +	{ .hw = &gpll0_out_aux2_div.hw },
> > > +};
> > > +
> > > +static const struct parent_map gcc_parent_map_3[] = {
> > > +	{ P_BI_TCXO, 0 },
> > > +	{ P_SLEEP_CLK, 5 },
> > > +};
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_3[] = {
> > > +	{ .index = DT_BI_TCXO },
> > > +	{ .index = DT_SLEEP_CLK },
> > > +};
> > > +
> > > +static const struct parent_map gcc_parent_map_4[] = {
> > > +	{ P_BI_TCXO, 0 },
> > > +};
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_4[] = {
> > > +	{ .index = DT_BI_TCXO },
> > > +};
> > > +
> > > +static const struct parent_map gcc_parent_map_5[] = {
> > > +	{ P_BI_TCXO, 0 },
> > > +	{ P_GPLL0_OUT_MAIN, 1 },
> > > +	{ P_GPLL7_OUT_MAIN, 3 },
> > > +	{ P_GPLL4_OUT_MAIN, 5 },
> > > +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
> > > +};
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_5[] = {
> > > +	{ .index = DT_BI_TCXO },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +	{ .hw = &gpll7.clkr.hw },
> > > +	{ .hw = &gpll4.clkr.hw },
> > > +	{ .hw = &gpll0_out_aux2_div.hw },
> > > +};
> > > +
> > > +static const struct parent_map gcc_parent_map_6[] = {
> > > +	{ P_BI_TCXO, 0 },
> > > +	{ P_GPLL0_OUT_MAIN, 1 },
> > > +	{ P_GPLL7_OUT_MAIN, 3 },
> > > +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
> > > +};
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_6[] = {
> > > +	{ .index = DT_BI_TCXO },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +	{ .hw = &gpll7.clkr.hw },
> > > +	{ .hw = &gpll0_out_aux2_div.hw },
> > > +};
> > > +
> > > +static const struct parent_map gcc_parent_map_7[] = {
> > > +	{ P_BI_TCXO, 0 },
> > > +	{ P_GPLL0_OUT_MAIN, 1 },
> > > +	{ P_GPLL3_OUT_MAIN_DIV, 4 },
> > > +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
> > > +};
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_7[] = {
> > > +	{ .index = DT_BI_TCXO },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +	{ .hw = &gpll3_out_aux2_div.hw },
> > > +	{ .hw = &gpll0_out_aux2_div.hw },
> > > +};
> > > +
> > > +static const struct parent_map gcc_parent_map_8[] = {
> > > +	{ P_BI_TCXO, 0 },
> > > +	{ P_GPLL0_OUT_MAIN, 1 },
> > > +	{ P_GPLL8_OUT_MAIN, 2 },
> > > +	{ P_GPLL4_OUT_MAIN, 5 },
> > > +	{ P_GPLL0_OUT_AUX2_DIV, 6 },
> > > +};
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_8[] = {
> > > +	{ .index = DT_BI_TCXO },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +	{ .hw = &gpll8_out_main.clkr.hw },
> > > +	{ .hw = &gpll4.clkr.hw },
> > > +	{ .hw = &gpll0_out_aux2_div.hw },
> > > +};
> > > +
> > > +static const struct parent_map gcc_parent_map_9[] = {
> > > +	{ P_BI_TCXO, 0 },
> > > +	{ P_GPLL0_OUT_MAIN, 1 },
> > > +	{ P_GPLL3_OUT_MAIN, 4 },
> > > +};
> > > +
> > > +static const struct clk_parent_data gcc_parent_data_9[] = {
> > > +	{ .index = DT_BI_TCXO },
> > > +	{ .hw = &gpll0.clkr.hw },
> > > +	{ .hw = &gpll3.clkr.hw },
> > > +};
> > > +
> > > +static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] = {
> > > +	F(19200000, P_BI_TCXO, 1, 0, 0),
> > > +	{ }
> > > +};
> > > +
> > > +static struct clk_rcg2 gcc_cpuss_ahb_clk_src = {
> > > +	.cmd_rcgr = 0x48014,
> > > +	.mnd_width = 0,
> > > +	.hid_width = 5,
> > > +	.parent_map = gcc_parent_map_0,
> > > +	.freq_tbl = ftbl_gcc_cpuss_ahb_clk_src,
> > > +	.clkr.hw.init = &(const struct clk_init_data) {
> > > +		.name = "gcc_cpuss_ahb_clk_src",
> > > +		.parent_data = gcc_parent_data_0_ao,
> > > +		.num_parents = ARRAY_SIZE(gcc_parent_data_0_ao),
> > > +		.ops = &clk_rcg2_ops,
> > > +	},
> > > +};
> > > +
> > > +static const struct freq_tbl ftbl_gcc_emac_ptp_clk_src[] = {
> > > +	F(19200000, P_BI_TCXO, 1, 0, 0),
> > > +	F(50000000, P_GPLL0_OUT_AUX2_DIV, 6, 0, 0),
> > > +	F(75000000, P_GPLL0_OUT_AUX2_DIV, 4, 0, 0),
> > > +	F(125000000, P_GPLL7_OUT_MAIN, 4, 0, 0),
> > > +	F(250000000, P_GPLL7_OUT_MAIN, 2, 0, 0),
> > > +	{ }
> > > +};
> > > +
> > > +static struct clk_rcg2 gcc_emac_ptp_clk_src = {
> > > +	.cmd_rcgr = 0x6038,
> > > +	.mnd_width = 0,
> > > +	.hid_width = 5,
> > > +	.parent_map = gcc_parent_map_5,
> > > +	.freq_tbl = ftbl_gcc_emac_ptp_clk_src,
> > > +	.clkr.hw.init = &(const struct clk_init_data) {
> > > +		.name = "gcc_emac_ptp_clk_src",
> > > +		.parent_data = gcc_parent_data_5,
> > > +		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
> > > +		.ops = &clk_rcg2_ops,
> > > +	},
> > > +};
> > > +
> > > +static const struct freq_tbl ftbl_gcc_emac_rgmii_clk_src[] = {
> > > +	F(2500000, P_BI_TCXO, 1, 25, 192),
> > > +	F(5000000, P_BI_TCXO, 1, 25, 96),
> > > +	F(19200000, P_BI_TCXO, 1, 0, 0),
> > > +	F(25000000, P_GPLL0_OUT_AUX2_DIV, 12, 0, 0),
> > > +	F(50000000, P_GPLL0_OUT_AUX2_DIV, 6, 0, 0),
> > > +	F(75000000, P_GPLL0_OUT_AUX2_DIV, 4, 0, 0),
> > > +	F(125000000, P_GPLL7_OUT_MAIN, 4, 0, 0),
> > > +	F(250000000, P_GPLL7_OUT_MAIN, 2, 0, 0),
> > > +	{ }
> > > +};
> > > +
> > > +static struct clk_rcg2 gcc_emac_rgmii_clk_src = {
> > > +	.cmd_rcgr = 0x601c,
> > > +	.mnd_width = 8,
> > > +	.hid_width = 5,
> > > +	.parent_map = gcc_parent_map_6,
> > > +	.freq_tbl = ftbl_gcc_emac_rgmii_clk_src,
> > > +	.clkr.hw.init = &(const struct clk_init_data) {
> > > +		.name = "gcc_emac_rgmii_clk_src",
> > > +		.parent_data = gcc_parent_data_6,
> > > +		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
> > > +		.ops = &clk_rcg2_ops,
> > > +	},
> > > +};
> > > +
> > > +static const struct freq_tbl ftbl_gcc_gp1_clk_src[] = {
> > > +	F(25000000, P_GPLL0_OUT_AUX2_DIV, 12, 0, 0),
> > > +	F(50000000, P_GPLL0_OUT_AUX2_DIV, 6, 0, 0),
> > > +	F(100000000, P_GPLL0_OUT_MAIN, 6, 0, 0),
> > > +	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
> > > +	{ }
> > > +};
> > > +
> > > +static struct clk_rcg2 gcc_gp1_clk_src = {
> > > +	.cmd_rcgr = 0x64004,
> > > +	.mnd_width = 8,
> > > +	.hid_width = 5,
> > > +	.parent_map = gcc_parent_map_2,
> > > +	.freq_tbl = ftbl_gcc_gp1_clk_src,
> > > +	.clkr.hw.init = &(const struct clk_init_data) {
> > > +		.name = "gcc_gp1_clk_src",
> > > +		.parent_data = gcc_parent_data_2,
> > > +		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
> > > +		.ops = &clk_rcg2_ops,
> > > +	},
> > > +};
> > > +
> > > +static struct clk_rcg2 gcc_gp2_clk_src = {
> > > +	.cmd_rcgr = 0x65004,
> > > +	.mnd_width = 8,
> > > +	.hid_width = 5,
> > > +	.parent_map = gcc_parent_map_2,
> > > +	.freq_tbl = ftbl_gcc_gp1_clk_src,
> > > +	.clkr.hw.init = &(const struct clk_init_data) {
> > > +		.name = "gcc_gp2_clk_src",
> > > +		.parent_data = gcc_parent_data_2,
> > > +		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
> > > +		.ops = &clk_rcg2_ops,
> > > +	},
> > > +};
> > > +
> > > +static struct clk_rcg2 gcc_gp3_clk_src = {
> > > +	.cmd_rcgr = 0x66004,
> > > +	.mnd_width = 8,
> > > +	.hid_width = 5,
> > > +	.parent_map = gcc_parent_map_2,
> > > +	.freq_tbl = ftbl_gcc_gp1_clk_src,
> > > +	.clkr.hw.init = &(const struct clk_init_data) {
> > > +		.name = "gcc_gp3_clk_src",
> > > +		.parent_data = gcc_parent_data_2,
> > > +		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
> > > +		.ops = &clk_rcg2_ops,
> > > +	},
> > > +};
> > > +
> > > +static const struct freq_tbl ftbl_gcc_pcie_0_aux_clk_src[] = {
> > > +	F(9600000, P_BI_TCXO, 2, 0, 0),
> > > +	F(19200000, P_BI_TCXO, 1, 0, 0),
> > > +	{ }
> > > +};
> > > +
> > > +static struct clk_rcg2 gcc_pcie_0_aux_clk_src = {
> > > +	.cmd_rcgr = 0x6b02c,
> > > +	.mnd_width = 16,
> > > +	.hid_width = 5,
> > > +	.parent_map = gcc_parent_map_3,
> > > +	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
> > > +	.clkr.hw.init = &(const struct clk_init_data) {
> > > +		.name = "gcc_pcie_0_aux_clk_src",
> > > +		.parent_data = gcc_parent_data_3,
> > > +		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
> > > +		.ops = &clk_rcg2_ops,
> > 
> > Should it be using shared ops?
> > I think there are other clocks here which are usually
> > clk_rcg2_shared_ops.
> > 
> 
> As the source frequency is derived from 19.2MHz, so I left it as the normal
> RCG ops. I can update it in the next patch.
> 
> > > +	},
> > > +};
> > > +
> > 
> > [...]
> > 
> > > +static struct clk_rcg2 gcc_vsensor_clk_src = {
> > > +	.cmd_rcgr = 0x7a018,
> > > +	.mnd_width = 0,
> > > +	.hid_width = 5,
> > > +	.parent_map = gcc_parent_map_9,
> > > +	.freq_tbl = ftbl_gcc_vsensor_clk_src,
> > > +	.clkr.hw.init = &(const struct clk_init_data) {
> > > +		.name = "gcc_vsensor_clk_src",
> > > +		.parent_data = gcc_parent_data_9,
> > > +		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
> > > +		.ops = &clk_rcg2_ops,
> > > +	},
> > > +};
> > > +
> > > +
> > 
> > Extra empty line
> > 
> Sure, will take care in the next patch.
> 
> 
> > > +static struct clk_branch gcc_aggre_ufs_phy_axi_clk = {
> > > +	.halt_reg = 0x770c0,
> > > +	.halt_check = BRANCH_HALT_VOTED,
> > 
> > [...]
> > 
> > > +
> > > +static struct clk_branch gcc_pcie_0_pipe_clk = {
> > > +	.halt_reg = 0x6b024,
> > > +	.halt_check = BRANCH_HALT_SKIP,
> > > +	.clkr = {
> > > +		.enable_reg = 0x5200c,
> > > +		.enable_mask = BIT(4),
> > > +		.hw.init = &(const struct clk_init_data) {
> > > +			.name = "gcc_pcie_0_pipe_clk",
> > > +			.ops = &clk_branch2_ops,
> > > +		},
> > > +	},
> > > +};
> > 
> > No corresponding gcc_pcie_0_pipe_clk_src?
> > 
> 
> On QCS615 the pipe clock source is not required to be modelled as the mux is
> default Power on reset is set to external pipe clock.

And do we need to toggle the source of the clk_src together with the
GDSC toggling?

> 
> > > +
> > > +static struct clk_branch gcc_pcie_0_slv_axi_clk = {
> > > +	.halt_reg = 0x6b014,
> > > +	.halt_check = BRANCH_HALT_VOTED,
> > > +	.hwcg_reg = 0x6b014,
> > > +	.hwcg_bit = 1,
> > > +	.clkr = {
> > > +		.enable_reg = 0x5200c,
> > > +		.enable_mask = BIT(0),
> > > +		.hw.init = &(const struct clk_init_data) {
> > > +			.name = "gcc_pcie_0_slv_axi_clk",
> > > +			.ops = &clk_branch2_ops,
> > > +		},
> > > +	},
> > > +};
> > > +
> > 
> > [...]
> > 
> 
> -- 
> Thanks & Regards,
> Taniya Das.

-- 
With best wishes
Dmitry

