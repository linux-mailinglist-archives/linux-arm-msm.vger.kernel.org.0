Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6804350C2D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 04:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbhDACAr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 22:00:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:52122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229515AbhDACAk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 22:00:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C0EF961004;
        Thu,  1 Apr 2021 02:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617242439;
        bh=DP7y/JRUF4mcBfBS6SRruTh9Ug6t6JDCxi5MMJPTpu0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hR2lngcGVCdWTzd6tshvj0e4NCpH1GAW7zXrl7ebl+AmUA5+IxjWg0APhjfRrmv0N
         UghJuB1JLMJY6jZ7YyLjo/yUNckIbnhZW39nk/hgypM4U7tZz3RvbdfTOWFBcUKN13
         0zOG6TS4BnnX7FAbI22s7jIudJLe7dxHkUA7VhwN/qXrgSpXHUBW8/Ekf1BUTumDis
         UzohSUtRMR5UP2b6Ucy9vG6GetxrGUp3PZwnXGb0klkTLsV2oMlWlM40909LOBpAch
         /QZt/bEwG3BDJ+liZWQiYc88yYjyCSDFn4ISADnRsBCCj/BLlFv7cHNZAATc9CI/C7
         kO4itTPIRHgCQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210225201845.109670-2-konrad.dybcio@somainline.org>
References: <20210225201845.109670-1-konrad.dybcio@somainline.org> <20210225201845.109670-2-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 2/2] clk: qcom: Add MSM8976/56 Global Clock Controller (GCC) driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        phone-devel@vger.kernel.org
Date:   Wed, 31 Mar 2021 19:00:38 -0700
Message-ID: <161724243841.2260335.10536109464664209719@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-02-25 12:18:43)
> diff --git a/drivers/clk/qcom/gcc-msm8976.c b/drivers/clk/qcom/gcc-msm897=
6.c
> new file mode 100644
> index 000000000000..5478612cd1b3
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-msm8976.c
> @@ -0,0 +1,4181 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Qualcomm Global Clock Controller driver for MSM8956/76
> + *
> + * Copyright (c) 2016-2021, AngeloGioacchino Del Regno
> + *                     <angelogioacchino.delregno@somainline.org>
> + *
> + * Driver cleanup and modernization
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + *
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +
[....]
> +
> +static struct clk_pll gpll0 =3D {
> +       .l_reg =3D 0x21004,
> +       .m_reg =3D 0x21008,
> +       .n_reg =3D 0x2100c,
> +       .config_reg =3D 0x21014,
> +       .mode_reg =3D 0x21000,
> +       .status_reg =3D 0x2101c,
> +       .status_bit =3D 17,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll0",
> +               .parent_data =3D &(const struct clk_parent_data){
> +                       .fw_name =3D "xo",
> +                       .name =3D "xo_board",
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_pll_ops,
> +       },
> +};
> +
> +static struct clk_regmap gpll0_vote =3D {
> +       .enable_reg =3D 0x45000,
> +       .enable_mask =3D BIT(0),
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll0_vote",
> +               .parent_hws =3D (const struct clk_hw *[]) {
> +                       &gpll0.clkr.hw,
> +               },
> +               .num_parents =3D 1,
> +               .flags =3D CLK_IS_CRITICAL,

Please add a comment why it is critical. I guess because the CPU is
using it?

> +               .ops =3D &clk_pll_vote_ops,
> +       },
> +};
> +
[...]
> +
> +static struct clk_rcg2 apss_ahb_clk_src =3D {
> +       .cmd_rcgr =3D 0x46000,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8_a,
> +       .freq_tbl =3D ftbl_apss_ahb_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "apss_ahb_clk_src",
> +               .parent_data =3D gcc_parent_data_8_a,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_8_a),
> +               .ops =3D &clk_rcg2_ops,
> +               /*
> +                * This clock allows the CPUs to communicate with
> +                * the rest of the SoC. Without it, the brain will
> +                * operate without the rest of the body.
> +                */
> +               .flags =3D CLK_IS_CRITICAL,
> +       },
> +};

Please remove this clk and set the bit to enable it at driver probe
instead.

> +
> +static const struct freq_tbl ftbl_blsp_i2c_apps_clk_src[] =3D {
> +       F(19200000, P_XO, 1, 0, 0),
> +       F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x200c,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_i2c_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp1_qup1_i2c_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_blsp_spi_apps_clk_src[] =3D {
> +       F(960000, P_XO, 10, 1, 2),
> +       F(4800000, P_XO, 4, 0, 0),
> +       F(9600000, P_XO, 2, 0, 0),
> +       F(16000000, P_GPLL0_OUT_MAIN, 10, 1, 5),
> +       F(19200000, P_XO, 1, 0, 0),
> +       F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
> +       F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x2024,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_spi_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp1_qup1_spi_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x3000,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_i2c_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp1_qup2_i2c_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x3014,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_spi_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp1_qup2_spi_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x4000,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_i2c_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp1_qup3_i2c_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x4024,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_spi_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp1_qup3_spi_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x5000,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_i2c_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp1_qup4_i2c_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x5024,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_spi_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp1_qup4_spi_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_blsp_uart_apps_clk_src[] =3D {
> +       F(3686400, P_GPLL0_OUT_MAIN, 1, 72, 15625),
> +       F(7372800, P_GPLL0_OUT_MAIN, 1, 144, 15625),
> +       F(14745600, P_GPLL0_OUT_MAIN, 1, 288, 15625),
> +       F(16000000, P_GPLL0_OUT_MAIN, 10, 1, 5),
> +       F(19200000, P_XO, 1, 0, 0),
> +       F(24000000, P_GPLL0_OUT_MAIN, 1, 3, 100),
> +       F(25000000, P_GPLL0_OUT_MAIN, 16, 1, 2),
> +       F(32000000, P_GPLL0_OUT_MAIN, 1, 1, 25),
> +       F(40000000, P_GPLL0_OUT_MAIN, 1, 1, 20),
> +       F(46400000, P_GPLL0_OUT_MAIN, 1, 29, 500),
> +       F(48000000, P_GPLL0_OUT_MAIN, 1, 3, 50),
> +       F(51200000, P_GPLL0_OUT_MAIN, 1, 8, 125),
> +       F(56000000, P_GPLL0_OUT_MAIN, 1, 7, 100),
> +       F(58982400, P_GPLL0_OUT_MAIN, 1, 1152, 15625),
> +       F(60000000, P_GPLL0_OUT_MAIN, 1, 3, 40),
> +       F(64000000, P_GPLL0_OUT_MAIN, 1, 2, 25),
> +       { }
> +};
> +
> +static struct clk_rcg2 blsp1_uart1_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x2044,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_uart_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp1_uart1_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp1_uart2_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x3034,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_uart_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp1_uart2_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0xc00c,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_i2c_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp2_qup1_i2c_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0xc024,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_spi_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp2_qup1_spi_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0xd000,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_i2c_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp2_qup2_i2c_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0xd014,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_spi_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp2_qup2_spi_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0xf000,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_i2c_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp2_qup3_i2c_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0xf024,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_spi_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp2_qup3_spi_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x18000,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_i2c_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp2_qup4_i2c_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0x18024,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_spi_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp2_qup4_spi_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp2_uart1_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0xc044,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_uart_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp2_uart1_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 blsp2_uart2_apps_clk_src =3D {
> +       .cmd_rcgr =3D 0xd034,
> +       .mnd_width =3D 16,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_blsp_uart_apps_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "blsp2_uart2_apps_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_cci_clk_src[] =3D {
> +       F(19200000, P_XO, 1, 0, 0),
> +       F(37500000, P_GPLL0_AUX, 1, 3, 64),
> +       { }
> +};
> +
> +static struct clk_rcg2 cci_clk_src =3D {
> +       .cmd_rcgr =3D 0x51000,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_cci,
> +       .freq_tbl =3D ftbl_cci_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "cci_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_cpp_clk_src[] =3D {
> +       F(160000000, P_GPLL0_OUT_MAIN, 5, 0, 0),
> +       F(240000000, P_GPLL4_AUX, 5, 0, 0),
> +       F(320000000, P_GPLL0_OUT_MAIN, 2.5, 0, 0),
> +       F(400000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
> +       F(480000000, P_GPLL4_AUX, 2.5, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 cpp_clk_src =3D {
> +       .cmd_rcgr =3D 0x58018,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_cpp,
> +       .freq_tbl =3D ftbl_cpp_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "cpp_clk_src",
> +               .parent_data =3D gcc_parent_data_6,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_6),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_csi0_clk_src[] =3D {
> +       F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +       F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> +       F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 csi0_clk_src =3D {
> +       .cmd_rcgr =3D 0x4e020,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_csi0_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "csi0_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_csi1_clk_src[] =3D {
> +       F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +       F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> +       F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 csi1_clk_src =3D {
> +       .cmd_rcgr =3D 0x4f020,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_csi1_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "csi1_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_csi2_clk_src[] =3D {
> +       F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +       F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> +       F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 csi2_clk_src =3D {
> +       .cmd_rcgr =3D 0x3c020,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_csi2_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "csi2_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_camss_gp0_clk_src[] =3D {
> +       F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +       F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> +       F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 camss_gp0_clk_src =3D {
> +       .cmd_rcgr =3D 0x54000,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8_gp,
> +       .freq_tbl =3D ftbl_camss_gp0_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "camss_gp0_clk_src",
> +               .parent_data =3D gcc_parent_data_8_gp,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_8_gp),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_camss_gp1_clk_src[] =3D {
> +       F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +       F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> +       F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 camss_gp1_clk_src =3D {
> +       .cmd_rcgr =3D 0x55000,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8_gp,
> +       .freq_tbl =3D ftbl_camss_gp1_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "camss_gp1_clk_src",
> +               .parent_data =3D gcc_parent_data_8_gp,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_8_gp),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_jpeg0_clk_src[] =3D {
> +       F(133330000, P_GPLL0_OUT_MAIN, 6, 0, 0),
> +       F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> +       F(266666667, P_GPLL0_OUT_MAIN, 3, 0, 0),
> +       F(320000000, P_GPLL0_OUT_MAIN, 2.5, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 jpeg0_clk_src =3D {
> +       .cmd_rcgr =3D 0x57000,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_6,
> +       .freq_tbl =3D ftbl_jpeg0_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "jpeg0_clk_src",
> +               .parent_data =3D gcc_parent_data_6,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_6),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_mclk_clk_src[] =3D {
> +       F(8000000, P_GPLL0_OUT_MAIN, 1, 1, 100),
> +       F(24000000, P_GPLL6_OUT, 1, 1, 45),
> +       F(66670000, P_GPLL0_OUT_MAIN, 12, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 mclk0_clk_src =3D {
> +       .cmd_rcgr =3D 0x52000,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_7,
> +       .freq_tbl =3D ftbl_mclk_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "mclk0_clk_src",
> +               .parent_data =3D gcc_parent_data_7,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_7),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 mclk1_clk_src =3D {
> +       .cmd_rcgr =3D 0x53000,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_7,
> +       .freq_tbl =3D ftbl_mclk_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "mclk1_clk_src",
> +               .parent_data =3D gcc_parent_data_7,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_7),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 mclk2_clk_src =3D {
> +       .cmd_rcgr =3D 0x5c000,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_7,
> +       .freq_tbl =3D ftbl_mclk_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "mclk2_clk_src",
> +               .parent_data =3D gcc_parent_data_7,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_7),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_csi0phytimer_clk_src[] =3D {
> +       F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +       F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> +       F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 csi0phytimer_clk_src =3D {
> +       .cmd_rcgr =3D 0x4e000,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_csi0phytimer_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "csi0phytimer_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_csi1phytimer_clk_src[] =3D {
> +       F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +       F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> +       F(266670000, P_GPLL0_OUT_MAIN, 3, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 csi1phytimer_clk_src =3D {
> +       .cmd_rcgr =3D 0x4f000,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_csi1phytimer_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "csi1phytimer_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_camss_top_ahb_clk_src[] =3D {
> +       F(40000000, P_GPLL0_OUT_MAIN, 10, 1, 2),
> +       F(80000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 camss_top_ahb_clk_src =3D {
> +       .cmd_rcgr =3D 0x5a000,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_camss_top_ahb_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "camss_top_ahb_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_vfe0_clk_src[] =3D {
> +       F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
> +       F(80000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
> +       F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +       F(133333333, P_GPLL0_OUT_MAIN, 6, 0, 0),
> +       F(160000000, P_GPLL0_OUT_MAIN, 5, 0, 0),
> +       F(177777778, P_GPLL0_OUT_MAIN, 4.5, 0, 0),
> +       F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> +       F(266666667, P_GPLL0_OUT_MAIN, 3, 0, 0),
> +       F(300000000, P_GPLL4_OUT, 4, 0, 0),
> +       F(320000000, P_GPLL0_OUT_MAIN, 2.5, 0, 0),
> +       F(466000000, P_GPLL2_AUX, 2, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 vfe0_clk_src =3D {
> +       .cmd_rcgr =3D 0x58000,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_2,
> +       .freq_tbl =3D ftbl_vfe0_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "vfe0_clk_src",
> +               .parent_data =3D gcc_parent_data_2,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_2),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_vfe1_clk_src[] =3D {
> +       F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
> +       F(80000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
> +       F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +       F(133333333, P_GPLL0_OUT_MAIN, 6, 0, 0),
> +       F(160000000, P_GPLL0_OUT_MAIN, 5, 0, 0),
> +       F(177777778, P_GPLL0_OUT_MAIN, 4.5, 0, 0),
> +       F(200000000, P_GPLL0_OUT_MAIN, 4, 0, 0),
> +       F(266666667, P_GPLL0_OUT_MAIN, 3, 0, 0),
> +       F(300000000, P_GPLL4_OUT, 4, 0, 0),
> +       F(320000000, P_GPLL0_OUT_MAIN, 2.5, 0, 0),
> +       F(466000000, P_GPLL2_AUX, 2, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 vfe1_clk_src =3D {
> +       .cmd_rcgr =3D 0x58054,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_2,
> +       .freq_tbl =3D ftbl_vfe1_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "vfe1_clk_src",
> +               .parent_data =3D gcc_parent_data_2,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_2),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_crypto_clk_src[] =3D {
> +       F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
> +       F(80000000, P_GPLL0_OUT_MAIN, 10, 0, 0),
> +       F(100000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
> +       F(160000000, P_GPLL0_OUT_MAIN, 5, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 crypto_clk_src =3D {
> +       .cmd_rcgr =3D 0x16004,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8,
> +       .freq_tbl =3D ftbl_crypto_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "crypto_clk_src",
> +               .parent_data =3D gcc_parent_data_4_8,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_4_8),
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gp1_clk_src[] =3D {
> +       F(19200000, P_XO, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gp1_clk_src =3D {
> +       .cmd_rcgr =3D 0x8004,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8_gp,
> +       .freq_tbl =3D ftbl_gp1_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gp1_clk_src",
> +               .parent_hws =3D (const struct clk_hw *[]) {
> +                       &gpll0_vote.hw,
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gp2_clk_src[] =3D {
> +       F(19200000, P_XO, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gp2_clk_src =3D {
> +       .cmd_rcgr =3D 0x9004,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8_gp,
> +       .freq_tbl =3D ftbl_gp2_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gp2_clk_src",
> +               .parent_hws =3D (const struct clk_hw *[]) {
> +                       &gpll0_vote.hw,
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_gp3_clk_src[] =3D {
> +       F(19200000, P_XO, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 gp3_clk_src =3D {
> +       .cmd_rcgr =3D 0xa004,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_8_gp,
> +       .freq_tbl =3D ftbl_gp3_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gp3_clk_src",
> +               .parent_hws =3D (const struct clk_hw *[]) {
> +                       &gpll0_vote.hw,
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 byte0_clk_src =3D {
> +       .cmd_rcgr =3D 0x4d044,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_parent_map_mdss_byte0,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "byte0_clk_src",
> +               .parent_data =3D gcc_parent_data_mdss_byte0,
> +               .num_parents =3D ARRAY_SIZE(gcc_parent_data_mdss_byte0),
> +               .ops =3D &clk_byte2_ops,
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,

Can CLK_GET_RATE_NOCACHE be removed? If not, can you add a comment on
why it is needed that describes what it is fixing? Sometimes other qcom
clk drivers can get away without having this flag.
