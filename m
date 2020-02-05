Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD138153938
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 20:40:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727149AbgBETkY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 14:40:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:42794 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727104AbgBETkY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 14:40:24 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5E8C20730;
        Wed,  5 Feb 2020 19:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580931622;
        bh=zl2SX9JfsFFdzL3bneKhbUUQTtvwFKOgYGRjoAZSOiI=;
        h=In-Reply-To:References:From:Subject:To:Date:From;
        b=ZWfQjPxHdJNmOJnoCInZQCzgfU75XT7u8TgGiNZI7si5dphN64Zv6Lz5Kccr1uAm/
         LhG1ld3db3jET6iHgBqms5oceR9/DOuiq0sukSSY+s6P+ezAgtVsEeLcmrpKOf3VHw
         4WlXOS55Rsxzb3f3EftJLOh1MDZnj7rV8SXtb9us=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1579905147-12142-7-git-send-email-vnkgutta@codeaurora.org>
References: <1579905147-12142-1-git-send-email-vnkgutta@codeaurora.org> <1579905147-12142-7-git-send-email-vnkgutta@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 6/7] clk: qcom: gcc: Add global clock controller driver for SM8250
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, jshriram@codeaurora.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, psodagud@codeaurora.org,
        robh+dt@kernel.org, tdas@codeaurora.org, tsoni@codeaurora.org,
        vinod.koul@linaro.org, vnkgutta@codeaurora.org
User-Agent: alot/0.8.1
Date:   Wed, 05 Feb 2020 11:40:21 -0800
Message-Id: <20200205194022.C5E8C20730@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Venkata Narendra Kumar Gutta (2020-01-24 14:32:26)
> diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
> new file mode 100644
> index 0000000..300187e
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm8250.c
> @@ -0,0 +1,3720 @@
[...]
> +
> +static const struct parent_map gcc_parent_map_0[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GPLL0_OUT_MAIN, 1 },
> +       { P_GPLL0_OUT_EVEN, 6 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_0[] =3D {
> +       { .fw_name =3D "bi_tcxo" },
> +       { .hw =3D &gpll0.clkr.hw },
> +       { .hw =3D &gpll0_out_even.clkr.hw },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_0_ao[] =3D {
> +       { .fw_name =3D "bi_tcxo_ao" },
> +       { .hw =3D &gpll0.clkr.hw },
> +       { .hw =3D &gpll0_out_even.clkr.hw },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static const struct parent_map gcc_parent_map_1[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GPLL0_OUT_MAIN, 1 },
> +       { P_SLEEP_CLK, 5 },
> +       { P_GPLL0_OUT_EVEN, 6 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_1[] =3D {
> +       { .fw_name =3D "bi_tcxo" },
> +       { .hw =3D &gpll0.clkr.hw },
> +       { .fw_name =3D "sleep_clk", .name =3D "sleep_clk" },

Please drop .name

> +       { .hw =3D &gpll0_out_even.clkr.hw },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
> +static const struct parent_map gcc_parent_map_2[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_SLEEP_CLK, 5 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_2[] =3D {
> +       { .fw_name =3D "bi_tcxo" },
> +       { .fw_name =3D "sleep_clk", .name =3D "sleep_clk" },

Please drop .name

> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },
> +};
> +
[...]
> +static const struct clk_parent_data gcc_parent_data_5[] =3D {
> +       { .fw_name =3D "bi_tcxo" },
> +       { .hw =3D &gpll0.clkr.hw },
> +       { .fw_name =3D "aud_ref_clk", .name =3D "aud_ref_clk" },

Why have .name? Pleas remove it.

> +       { .hw =3D &gpll0_out_even.clkr.hw },
> +       { .fw_name =3D "core_bi_pll_test_se", .name =3D "core_bi_pll_test=
_se" },

Please drop these test inputs. I don't see any reason why they're listed.

> +};
> +
> +static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] =3D {
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_branch gcc_sys_noc_cpuss_ahb_clk =3D {
> +       .halt_reg =3D 0x48198,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .clkr =3D {
> +               .enable_reg =3D 0x52000,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_sys_noc_cpuss_ahb_clk",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &gcc_cpuss_ahb_postdiv_clk_src.cl=
kr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};

Is there a need for this clk to be exposed? Why can't we just turn the
bit on in probe and ignore it after that? I'd prefer to not have
CLK_IS_CRITICAL in this driver unless necessary.

> +
> +static struct clk_branch gcc_tsif_ahb_clk =3D {
> +       .halt_reg =3D 0x36004,
> +       .halt_check =3D BRANCH_HALT_VOTED,
> +       .clkr =3D {
> +               .enable_reg =3D 0x36004,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_tsif_ahb_clk",
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
[...]
> +
> +
> +static int gcc_sm8250_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +       int ret;
> +
> +       regmap =3D qcom_cc_map(pdev, &gcc_sm8250_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       /*
> +        * Disable the GPLL0 active input to NPU and GPU
> +        * via MISC registers.
> +        */
> +       regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
> +       regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
> +
> +       /*
> +        * Keep the clocks always-ON
> +        * GCC_VIDEO_AHB_CLK, GCC_CAMERA_AHB_CLK, GCC_DISP_AHB_CLK,
> +        * GCC_CPUSS_DVM_BUS_CLK, GCC_GPU_CFG_AHB_CLK
> +        */
> +       regmap_update_bits(regmap, 0x0b004, BIT(0), BIT(0));
> +       regmap_update_bits(regmap, 0x0b008, BIT(0), BIT(0));
> +       regmap_update_bits(regmap, 0x0b00c, BIT(0), BIT(0));
> +       regmap_update_bits(regmap, 0x4818c, BIT(0), BIT(0));
> +       regmap_update_bits(regmap, 0x71004, BIT(0), BIT(0));

These look like the AHB clks above that we just enabled and then ignore.

> +
> +       ret =3D qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
> +                                      ARRAY_SIZE(gcc_dfs_clocks));
> +       if (ret)
> +               return ret;
> +
> +       return qcom_cc_really_probe(pdev, &gcc_sm8250_desc, regmap);
> +}
