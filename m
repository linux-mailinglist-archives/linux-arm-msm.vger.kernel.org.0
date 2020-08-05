Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2AC023D2EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Aug 2020 22:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgHEUYy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Aug 2020 16:24:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:56516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbgHEUYy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Aug 2020 16:24:54 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F33422CAD;
        Wed,  5 Aug 2020 20:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596659093;
        bh=1pc0m+mor7fcXCDG3jZxLB2PnEuA2MfsacFWqfeX5CE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=0tekPfO+EVNWpUVU8saTzhp7fiPLfF9kbHOizjy+L15rLvnb6b3s3nlXQnVEDDgYT
         B1SuZTMBnHya1XTdBAzrMnM2eNxYmFxdUtddGL6uv1FieXSYDaRFbeyufRdcMQbJAE
         Z5itMJrGoMtlgH7dbgdPFIrzDN6AupUqmVeAMLAU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1595606878-2664-5-git-send-email-tdas@codeaurora.org>
References: <1595606878-2664-1-git-send-email-tdas@codeaurora.org> <1595606878-2664-5-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v5 4/4] clk: qcom: lpass: Add support for LPASS clock controller for SC7180
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 05 Aug 2020 13:24:52 -0700
Message-ID: <159665909245.1360974.10366839079633595523@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-07-24 09:07:58)
> +
> +static struct clk_rcg2 core_clk_src =3D {
> +       .cmd_rcgr =3D 0x1d000,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D lpass_core_cc_parent_map_2,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "core_clk_src",

Any chance this can get a better name? Something with LPASS prefix?

> +               .parent_data =3D &(const struct clk_parent_data){
> +                       .fw_name =3D "bi_tcxo",
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
[...]
> +
> +static struct clk_branch lpass_audio_core_sysnoc_mport_core_clk =3D {
> +       .halt_reg =3D 0x23000,
> +       .halt_check =3D BRANCH_HALT,
> +       .hwcg_reg =3D 0x23000,
> +       .hwcg_bit =3D 1,
> +       .clkr =3D {
> +               .enable_reg =3D 0x23000,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "lpass_audio_core_sysnoc_mport_core_clk=
",
> +                       .parent_data =3D &(const struct clk_parent_data){
> +                               .hw =3D &core_clk_src.clkr.hw,
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_regmap *lpass_core_cc_sc7180_clocks[] =3D {
> +       [EXT_MCLK0_CLK_SRC] =3D &ext_mclk0_clk_src.clkr,
> +       [LPAIF_PRI_CLK_SRC] =3D &lpaif_pri_clk_src.clkr,
> +       [LPAIF_SEC_CLK_SRC] =3D &lpaif_sec_clk_src.clkr,
> +       [CORE_CLK_SRC] =3D &core_clk_src.clkr,

And all of these, can they have LPASS_ prefix on the defines? Seems
like we're missing a namespace otherwise.

> +       [LPASS_AUDIO_CORE_EXT_MCLK0_CLK] =3D &lpass_audio_core_ext_mclk0_=
clk.clkr,
> +       [LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK] =3D
> +               &lpass_audio_core_lpaif_pri_ibit_clk.clkr,
> +       [LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK] =3D
> +               &lpass_audio_core_lpaif_sec_ibit_clk.clkr,
> +       [LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK] =3D
> +               &lpass_audio_core_sysnoc_mport_core_clk.clkr,
> +       [LPASS_LPAAUDIO_DIG_PLL] =3D &lpass_lpaaudio_dig_pll.clkr,
> +       [LPASS_LPAAUDIO_DIG_PLL_OUT_ODD] =3D &lpass_lpaaudio_dig_pll_out_=
odd.clkr,
> +};
> +
