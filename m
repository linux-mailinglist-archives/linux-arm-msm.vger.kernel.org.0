Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF8869F1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 00:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732174AbfGOWnq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Jul 2019 18:43:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:45838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731225AbfGOWnq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Jul 2019 18:43:46 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 938B02080A;
        Mon, 15 Jul 2019 22:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563230625;
        bh=oA1+Tj7pTrStuCnnAL4++T0Ct31fVHClZgSfb/a1hrA=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=g7BqFShg1xmSefFgjVHok8zvbIDgYJIc7gvgpnaCeJtE2v79GHhYjATu/RqQwCwnn
         FZwCD/gZPRqJmydwXKpG5o91ZUA2SuxN7+kBUMc/zB8aAekRzQjdq2D8uQ8VH/wU7S
         3l2ngKpd+sxyM56iAyjiXHE/VHR1wCOAQ+bYcYf4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1557894039-31835-2-git-send-email-tdas@codeaurora.org>
References: <1557894039-31835-1-git-send-email-tdas@codeaurora.org> <1557894039-31835-2-git-send-email-tdas@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v2 1/2] clk: qcom: rcg2: Add support for display port clock ops
User-Agent: alot/0.8.1
Date:   Mon, 15 Jul 2019 15:43:44 -0700
Message-Id: <20190715224345.938B02080A@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2019-05-14 21:20:38)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 18bdf34..0de080f 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -15,6 +15,7 @@ menuconfig COMMON_CLK_QCOM
>         depends on ARCH_QCOM || COMPILE_TEST
>         select REGMAP_MMIO
>         select RESET_CONTROLLER
> +       select RATIONAL

Make this an alphabetical list of selects please.

>=20
>  if COMMON_CLK_QCOM
>=20
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 8c02bff..98071c0 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -1128,3 +1129,81 @@ int qcom_cc_register_rcg_dfs(struct regmap *regmap,
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(qcom_cc_register_rcg_dfs);
> +
> +static int clk_rcg2_dp_set_rate(struct clk_hw *hw, unsigned long rate,
> +                       unsigned long parent_rate)
> +{
> +       struct clk_rcg2 *rcg =3D to_clk_rcg2(hw);
> +       struct freq_tbl f =3D { 0 };
> +       u32 mask =3D BIT(rcg->hid_width) - 1;
> +       u32 hid_div, cfg;
> +       int i, num_parents =3D clk_hw_get_num_parents(hw);
> +       unsigned long num, den;
> +
> +       rational_best_approximation(parent_rate, rate,
> +                       GENMASK(rcg->mnd_width - 1, 0),
> +                       GENMASK(rcg->mnd_width - 1, 0), &den, &num);
> +
> +       if (!num || !den) {
> +               pr_err("Invalid MN values derived for requested rate %lu\=
n",

Does this ever happen? I worry that this printk could happen many times
if a driver gets into a bad state and starts selecting invalid
frequencies over and over again for each frame (every 16ms). Maybe just
return -EINVAL instead of printing anything.

> +                                                       rate);
> +               return -EINVAL;
> +       }
> +
> +       regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
> +       hid_div =3D cfg;
> +       cfg &=3D CFG_SRC_SEL_MASK;
> +       cfg >>=3D CFG_SRC_SEL_SHIFT;
> +
> +       for (i =3D 0; i < num_parents; i++)
> +               if (cfg =3D=3D rcg->parent_map[i].cfg) {
> +                       f.src =3D rcg->parent_map[i].src;
> +                       break;
> +       }

Weird indent for this brace. Please fix and put a brace on the for
statement too.

> +
> +       f.pre_div =3D hid_div;
> +       f.pre_div >>=3D CFG_SRC_DIV_SHIFT;
> +       f.pre_div &=3D mask;
> +
> +       if (num =3D=3D den) {
> +               f.m =3D 0;
> +               f.n =3D 0;

Isn't this the default? So just have if (num !=3D den) here.

> +       } else {
> +               f.m =3D num;
> +               f.n =3D den;
> +       }
> +
> +       return clk_rcg2_configure(rcg, &f);
> +}
> +
> +static int clk_rcg2_dp_set_rate_and_parent(struct clk_hw *hw,
> +               unsigned long rate, unsigned long parent_rate, u8 index)
> +{
> +       return clk_rcg2_dp_set_rate(hw, rate, parent_rate);
> +}

Does this need to be implemented? The parent index isn't passed to
clk_rcg2_dp_set_rate() so I suspect the parent index doesn't matter?
Does the parent change?

> +
> +static int clk_rcg2_dp_determine_rate(struct clk_hw *hw,
> +                               struct clk_rate_request *req)
> +{
> +       struct clk_rate_request parent_req =3D *req;
> +       int ret;
> +
> +       ret =3D __clk_determine_rate(clk_hw_get_parent(hw), &parent_req);
> +       if (ret)
> +               return ret;
> +
> +       req->best_parent_rate =3D parent_req.rate;
> +
> +       return 0;
> +}

Do you need this op? It's just calling determine rate on the parent, so
we already do that if the proper flag is set. I'm confused about this
function.

