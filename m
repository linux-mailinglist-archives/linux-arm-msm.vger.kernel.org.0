Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FC53D7DBF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 20:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhG0Sds (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 14:33:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:35228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229453AbhG0Sds (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 14:33:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DB0360E08;
        Tue, 27 Jul 2021 18:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627410828;
        bh=IoOC+f1m/YhQqNhVUFsH6+csX5fiqfZsvIU8e2BPats=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=I+ocGSufKazh8ZWpBPK2NYgfV15CZu1lN7aB7iX5rdq/oG245Q9cPh7r+PqFTF1IN
         5zJQIt/S+A9KaOP3u9WZenlj5LIQf+fPc9dWewKAO4WKvLdwa5TEGvMpisR/ZdniC9
         HoKT8IVkSjL/0i1kNskDZTkao/4Rtt5cXyoxyiytToHv3Alm8xwyaZOwUJKCA6y5SS
         y+tctTnQ42+QHitTpj3oBkc2JaYarLOTW5Q4hmMbkNaYWmeP1Cxi5ExUhptgnk1xa7
         bnlnwGUsyiUdQPka0I+bJIM0e/flrc4w46vrFT6nARv6V2DLoxNAB6Wf/AoCjQQ2dV
         cD60pwL9n38BQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210627185538.690277-3-iskren.chernev@gmail.com>
References: <20210627185538.690277-1-iskren.chernev@gmail.com> <20210627185538.690277-3-iskren.chernev@gmail.com>
Subject: Re: [PATCH v2 2/2] clk: qcom: Add Global Clock controller (GCC) driver for SM6115
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Iskren Chernev <iskren.chernev@gmail.com>
Date:   Tue, 27 Jul 2021 11:33:46 -0700
Message-ID: <162741082663.2368309.12852214008454271169@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Iskren Chernev (2021-06-27 11:55:38)
> diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
> new file mode 100644
> index 000000000000..e3c830b33dec
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm6115.c
> @@ -0,0 +1,3623 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>

Should be clk-provider.h in this list as well.

> +
> +#include <dt-bindings/clock/qcom,gcc-sm6115.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +       P_BI_TCXO,
> +       P_CORE_BI_PLL_TEST_SE,
> +       P_GPLL0_OUT_AUX2,
> +       P_GPLL0_OUT_EARLY,
> +       P_GPLL10_OUT_MAIN,
> +       P_GPLL11_OUT_AUX,
> +       P_GPLL11_OUT_AUX2,
> +       P_GPLL11_OUT_MAIN,
> +       P_GPLL3_OUT_EARLY,
> +       P_GPLL3_OUT_MAIN,
> +       P_GPLL4_OUT_MAIN,
> +       P_GPLL6_OUT_EARLY,
> +       P_GPLL6_OUT_MAIN,
> +       P_GPLL7_OUT_MAIN,
> +       P_GPLL8_OUT_EARLY,
> +       P_GPLL8_OUT_MAIN,
> +       P_GPLL9_OUT_EARLY,
> +       P_GPLL9_OUT_MAIN,
> +       P_SLEEP_CLK,
> +};
> +
> +static const struct parent_map gcc_parent_map_0[] =3D {
> +       { P_BI_TCXO, 0 },
> +       { P_GPLL0_OUT_EARLY, 1 },
> +       { P_GPLL0_OUT_AUX2, 2 },
> +       { P_CORE_BI_PLL_TEST_SE, 7 },
> +};
> +
> +static const char * const gcc_parent_names_0[] =3D {

Please use struct clk_parent_data instead of these arrays of strings.

> +       "bi_tcxo",
> +       "gpll0",
> +       "gpll0_out_aux2",
> +       "core_bi_pll_test_se",
> +};

And add newlines between structs.

> +static const char * const gcc_parent_names_0_ao[] =3D {
> +       "bi_tcxo_ao",
> +       "gpll0",
> +       "gpll0_out_aux2",
> +       "core_bi_pll_test_se",
> +};
> +
