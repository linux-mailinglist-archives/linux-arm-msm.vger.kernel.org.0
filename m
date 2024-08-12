Return-Path: <linux-arm-msm+bounces-28334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4856794F643
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 20:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03539282466
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 18:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43C6188CB0;
	Mon, 12 Aug 2024 18:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajhKR5an"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A91C156;
	Mon, 12 Aug 2024 18:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723486097; cv=none; b=XLg0qF2WRp0aOp13HaEQ4p9sVMJeH7Mlrai7UOymNGS0vPPi6WtqYgtEWCzFgrlnZD4w3yGEYEnWR/VvMGHMq9cXmTtm+uuCG82TAJWf8z7/gxeLekp0zuvMOEGKuIEQZcNrc5Qg5T/5k+1x7FaIP4X8wKDALAbE+NeIndqHdJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723486097; c=relaxed/simple;
	bh=HhCHzIAR9FG4oG7uGredizfJ5Xv14d47pjgxLOlLu1Q=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=HnyCd834+Whz2nRap4d4BJmyQzJBz+/QkIc2AhHCxTyKNxrcsiIphCd8Y3FLCCNykNg8vtNWYtWzGd5Q0DiIdJi/wjREWKcqGpNlg54S2Rx9n3oWcCPu4z0do3DkilIgNxSTdRr2BsxJo2b+Gpbnfaa+baV9OeRJZ3fAjtQUwhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajhKR5an; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB34CC4AF0C;
	Mon, 12 Aug 2024 18:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723486097;
	bh=HhCHzIAR9FG4oG7uGredizfJ5Xv14d47pjgxLOlLu1Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ajhKR5anck6h9TkoWqS/XnmmBSJZixhvxKsItF7mp0LpQBwthhmIoZ62Yay8Dt4sZ
	 +J0aEwNy/+Bm2Oghk+31Y6iX/ztDnNkJk+aNpdcXMhB5DKuBIDXxREwnPAHILFQbeO
	 v88BRwGgsa7yPjdDv5AIYJTY7/RuRtMZ00OnENJLt1fHG/leJhpW/ao+A5V/zGnP0L
	 wBU+csr+93BSePD0Pe026RP3CnPKrxPB/Kb5PZYlnkio/WsbWTozrDkCB/AbHZSCit
	 9Qi+E2wyPefE0xd8TnWGqRCF7UMSGXbXtO/BUOjduVMRL5cseogGyqhVwGv0iJOBPU
	 CPayGdD56FUSA==
Message-ID: <8b2c1a23fd55c52e56cc875660d1fba9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240812151606.1996198-1-dsankouski@gmail.com>
References: <n7gvt4e6kt33lpnfivv4t2waro2t4qi4evkrfot3j2en7ubffb@gpzwolihwemr> <20240812151606.1996198-1-dsankouski@gmail.com>
Subject: Re: [PATCH v3 02/23] gcc-sdm845: Add rates to the GP clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: dsankouski@gmail.com, Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Dzmitry Sankouski <dsankouski@gmail.com>
Date: Mon, 12 Aug 2024 11:08:14 -0700
User-Agent: alot/0.10

Quoting Dzmitry Sankouski (2024-08-12 08:16:06)
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 30b19bd39d08..44b257481556 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -32,6 +32,7 @@
> =20
>  #define CFG_REG                        0x4
>  #define CFG_SRC_DIV_SHIFT      0
> +#define CFG_SRC_DIV_LENGTH     8
>  #define CFG_SRC_SEL_SHIFT      8
>  #define CFG_SRC_SEL_MASK       (0x7 << CFG_SRC_SEL_SHIFT)
>  #define CFG_MODE_SHIFT         12
> @@ -393,16 +394,103 @@ static int clk_rcg2_fm_determine_rate(struct clk_h=
w *hw,
>         return _freq_tbl_fm_determine_rate(hw, rcg->freq_multi_tbl, req);
>  }
> =20
> -static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_=
tbl *f,
> -                               u32 *_cfg)
> +static inline u64 find_hcf(u64 a, u64 b)
> +{
> +       while (a !=3D 0 && b !=3D 0) {
> +               if (a > b)
> +                       a %=3D b;
> +               else
> +                       b %=3D a;
> +       }
> +       return a + b;

Is this gcd()?

> +}
> +
> +static int clk_calc_mnd(u64 parent_rate, u64 rate, struct freq_tbl *f)
> +{
> +       u64 hcf;
> +       u64 hid_div =3D 1, n =3D 1;
> +       int i =3D 2, count =3D 0;
> +
> +       hcf =3D find_hcf(parent_rate, rate);
> +       u64 scaled_rate =3D rate / hcf;
> +       u64 scaled_parent_rate =3D parent_rate / hcf;
> +
> +       while (scaled_parent_rate > 1) {
> +               while (scaled_parent_rate % i =3D=3D 0) {
> +                       scaled_parent_rate /=3D i;
> +                       if (count % 2 =3D=3D 0)
> +                               hid_div *=3D i;
> +                       else
> +                               n *=3D i;
> +               }
> +               i++;
> +               count++;
> +       }
> +
> +       f->m =3D scaled_rate;
> +       f->n =3D n;
> +       f->pre_div =3D hid_div;
> +
> +       return 0;
> +}
> +
> +static int clk_rcg2_determine_gp_rate(struct clk_hw *hw,
> +                                  struct clk_rate_request *req)
> +{
> +       struct clk_rcg2 *rcg =3D to_clk_rcg2(hw);
> +       struct freq_tbl *f;
> +       int src =3D clk_rcg2_get_parent(hw);
> +       int mnd_max =3D BIT(rcg->mnd_width) - 1;
> +       int hid_max =3D BIT(rcg->hid_width) - 1;
> +       u64 parent_rate;
> +       int ret;
> +
> +       parent_rate =3D rcg->freq_tbl[src].freq;
> +       f =3D kcalloc(MAX_PERF_LEVEL + 1, sizeof(f), GFP_KERNEL);

When is this freed? Determine rate can be called many times. Is that
supposed to be sizeof(*f)? Why so many frequency entries?


> +
> +       if (!f)
> +               return 0;
> +
> +       ret =3D clk_calc_mnd(parent_rate, req->rate, f);
> +       if (ret)
> +               return 0;
> +
> +
> +       while (f->n - f->m >=3D mnd_max) {
> +               f->m =3D f->m >> 1;
> +               f->n =3D f->n >> 1;
> +       }
> +       while (f->pre_div >=3D hid_max) {
> +               f->pre_div =3D f->pre_div >> 1;
> +               f->m =3D f->m >> 1;
> +       }
> +
> +       req->rate =3D calc_rate(parent_rate, f->m, f->n, f->n, f->pre_div=
);
> +
> +       return 0;
> +}
> +
> +static int __clk_rcg2_configure_parent(struct clk_rcg2 *rcg, int src, u3=
2 *_cfg)

u8 src? Good to keep types consistent.

>  {
> -       u32 cfg, mask, d_val, not2d_val, n_minus_m;
>         struct clk_hw *hw =3D &rcg->clkr.hw;
> -       int ret, index =3D qcom_find_src_index(hw, rcg->parent_map, f->sr=
c);
> +       u32 mask =3D CFG_SRC_SEL_MASK;
> +       int index =3D qcom_find_src_index(hw, rcg->parent_map, src);
> =20
>         if (index < 0)
>                 return index;
> =20
> +       *_cfg &=3D ~mask;
> +       *_cfg |=3D rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
> +
> +       return 0;
> +}
> +
> +static int __clk_rcg2_configure_mnd(struct clk_rcg2 *rcg, const struct f=
req_tbl *f,
> +                               u32 *_cfg)
> +{
> +       u32 cfg, mask, d_val, not2d_val, n_minus_m;
> +       int ret;
> +
>         if (rcg->mnd_width && f->n) {
>                 mask =3D BIT(rcg->mnd_width) - 1;
>                 ret =3D regmap_update_bits(rcg->clkr.regmap,
> @@ -431,9 +519,8 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg,=
 const struct freq_tbl *f,
>         }
> =20
>         mask =3D BIT(rcg->hid_width) - 1;
> -       mask |=3D CFG_SRC_SEL_MASK | CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
> +       mask |=3D CFG_MODE_MASK | CFG_HW_CLK_CTRL_MASK;
>         cfg =3D f->pre_div << CFG_SRC_DIV_SHIFT;
> -       cfg |=3D rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
>         if (rcg->mnd_width && f->n && (f->m !=3D f->n))
>                 cfg |=3D CFG_MODE_DUAL_EDGE;
>         if (rcg->hw_clk_ctrl)
> @@ -445,6 +532,22 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg=
, const struct freq_tbl *f,
>         return 0;
>  }
> =20
> +static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_=
tbl *f,
> +                               u32 *_cfg)
> +{
> +       int ret;
> +
> +       ret =3D __clk_rcg2_configure_parent(rcg, f->src, _cfg);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D __clk_rcg2_configure_mnd(rcg, f, _cfg);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
>  static int clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tb=
l *f)
>  {
>         u32 cfg;
> @@ -465,6 +568,26 @@ static int clk_rcg2_configure(struct clk_rcg2 *rcg, =
const struct freq_tbl *f)
>         return update_config(rcg);
>  }
> =20
> +static int clk_rcg2_configure_gp(struct clk_rcg2 *rcg, const struct freq=
_tbl *f)
> +{
> +       u32 cfg;
> +       int ret;
> +
> +       ret =3D regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &cfg);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D __clk_rcg2_configure_mnd(rcg, f, &cfg);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D regmap_write(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), cfg);
> +       if (ret)
> +               return ret;
> +
> +       return update_config(rcg);
> +}
> +
>  static int __clk_rcg2_set_rate(struct clk_hw *hw, unsigned long rate,
>                                enum freq_policy policy)
>  {
> @@ -518,6 +641,22 @@ static int clk_rcg2_set_rate(struct clk_hw *hw, unsi=
gned long rate,
>         return __clk_rcg2_set_rate(hw, rate, CEIL);
>  }
> =20
> +static int clk_rcg2_set_gp_rate(struct clk_hw *hw, unsigned long rate,
> +                           unsigned long parent_rate)
> +{
> +       struct clk_rcg2 *rcg =3D to_clk_rcg2(hw);
> +       struct freq_tbl *f;
> +
> +       f =3D kcalloc(MAX_PERF_LEVEL + 1, sizeof(*f), GFP_KERNEL);

When is this freed?

> +
> +       if (!f)
> +               return -ENOMEM;
> +
> +       clk_calc_mnd(parent_rate, rate, f);
> +
> +       return clk_rcg2_configure_gp(rcg, f);
> +}
> +
>  static int clk_rcg2_set_floor_rate(struct clk_hw *hw, unsigned long rate,
>                                    unsigned long parent_rate)
>  {
> @@ -645,6 +784,17 @@ const struct clk_ops clk_rcg2_ops =3D {
>  };
>  EXPORT_SYMBOL_GPL(clk_rcg2_ops);
> =20
> +const struct clk_ops clk_rcg2_gp_ops =3D {
> +       .is_enabled =3D clk_rcg2_is_enabled,
> +       .get_parent =3D clk_rcg2_get_parent,
> +       .set_parent =3D clk_rcg2_set_parent,
> +       .determine_rate =3D clk_rcg2_determine_gp_rate,
> +       .set_rate =3D clk_rcg2_set_gp_rate,
> +       .get_duty_cycle =3D clk_rcg2_get_duty_cycle,
> +       .set_duty_cycle =3D clk_rcg2_set_duty_cycle,
> +};
> +EXPORT_SYMBOL_GPL(clk_rcg2_gp_ops);
> +
>  const struct clk_ops clk_rcg2_floor_ops =3D {
>         .is_enabled =3D clk_rcg2_is_enabled,
>         .get_parent =3D clk_rcg2_get_parent,
> diff --git a/drivers/pwm/pwm-clk.c b/drivers/pwm/pwm-clk.c
> index c19a482d7e28..1bfc7870e3aa 100644
> --- a/drivers/pwm/pwm-clk.c
> +++ b/drivers/pwm/pwm-clk.c
> @@ -25,6 +25,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk.h>
> +#include <linux/clk/clk-conf.h>
>  #include <linux/pwm.h>
> =20
>  struct pwm_clk_chip {
> @@ -87,6 +88,10 @@ static int pwm_clk_probe(struct platform_device *pdev)
>         struct pwm_clk_chip *pcchip;
>         int ret;
> =20
> +       ret =3D of_clk_set_defaults(pdev->dev.of_node, false);
> +       if (ret < 0)
> +               return -EINVAL;
> +

What is this? Debug code?

>         chip =3D devm_pwmchip_alloc(&pdev->dev, 1, sizeof(*pcchip));
>         if (IS_ERR(chip))
>                 return PTR_ERR(chip);
> --=20
> 2.39.2
>=20
>

