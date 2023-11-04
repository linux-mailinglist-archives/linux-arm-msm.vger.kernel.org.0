Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C21F27E0D0A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Nov 2023 02:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjKDBYy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Nov 2023 21:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjKDBYx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Nov 2023 21:24:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF42D5F;
        Fri,  3 Nov 2023 18:24:50 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ABF8C433C8;
        Sat,  4 Nov 2023 01:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699061090;
        bh=kES0qfVWNXA43mUOzfx7bbZfhya/EhlrolZFrykp/mk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=uiqLKjYYNdmn9eRRgg1sV/bdBbBEGo6kR9BtlHOgm4sPEfDKN/bdzPjgCyQ+pytcO
         AVUYlz0R4eEumAiwR3YKnModEZTCSaTZ7MyInyoMivC/F90PTJhampMCXVjSgXsZiw
         3qt3uuDxFlA4cpqjpXmDDRfyLblDXAfDAsMj+AsW56whv7M0BAIIzhFIM/TlJZXxaw
         2oTYNPCCbGWHdNJviWbTtvBOBDwZXwq08iYqqo0k8fJytX8EaZCe4ZQ597AnWg1EVw
         4PqYoxYGp3xdNQnOu9nU6ROkqAkX7Va/gHaTr0AGcQrtfiYHAWrBia6azuwBQOd62h
         KK86xLUwE7+gQ==
Message-ID: <2346f541be5b8528ad1a16df256a2f50.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231004012308.2305273-3-dmitry.baryshkov@linaro.org>
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org> <20231004012308.2305273-3-dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH v2 2/3] clk: qcom: implement RCG2 'parked' clock support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Fri, 03 Nov 2023 18:24:47 -0700
User-Agent: alot/0.10
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-10-03 18:23:07)
> clk_rcg2_shared_ops implements support for the case of the RCG which
> must not be completely turned off. However its design has one major
> drawback: it doesn't allow us to properly implement the is_enabled
> callback, which causes different kinds of misbehaviour from the CCF.
>=20
> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
> switched off (and shared most of the implementation with
> clk_rcg2_shared_ops). The major difference is that it requires that the
> parent map doesn't conain the safe (parked) clock source. Instead if the
> CFG_REG register points to the safe source, the clock is considered to
> be disabled.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-rcg.h  |  1 +
>  drivers/clk/qcom/clk-rcg2.c | 56 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
>=20
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index e6d84c8c7989..9fbbf1251564 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -176,6 +176,7 @@ extern const struct clk_ops clk_byte2_ops;
>  extern const struct clk_ops clk_pixel_ops;
>  extern const struct clk_ops clk_gfx3d_ops;
>  extern const struct clk_ops clk_rcg2_shared_ops;
> +extern const struct clk_ops clk_rcg2_parked_ops;
>  extern const struct clk_ops clk_dp_ops;
> =20
>  struct clk_rcg_dfs_data {
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 5183c74b074f..fc75e2bc2d70 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -5,6 +5,7 @@
> =20
>  #include <linux/kernel.h>
>  #include <linux/bitops.h>
> +#include <linux/bitfield.h>
>  #include <linux/err.h>
>  #include <linux/bug.h>
>  #include <linux/export.h>
> @@ -1150,6 +1151,61 @@ const struct clk_ops clk_rcg2_shared_ops =3D {
>  };
>  EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
> =20
> +static int clk_rcg2_parked_is_enabled(struct clk_hw *hw)
> +{
> +       struct clk_rcg2 *rcg =3D to_clk_rcg2(hw);
> +       u32 cmd, cfg;
> +       int ret;
> +
> +       ret =3D regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG, &c=
md);
> +       if (ret)
> +               return ret;
> +
> +       if ((cmd & CMD_ROOT_EN) =3D=3D 0)
> +               return false;

return 0?

CMD_ROOT_OFF can be 0 and CMD_ROOT_EN can also be 0 at the same time.
When that happens, some branch child clk is enabled and the rcg is
actually enabled. There's a hardware feedback mechanism from the
branches to the rcg so the rcg is guaranteed enabled. I'm trying to say
that this bit is unreliable on its own, so we need to take care here. In
fact, this bit is only used as a software override to make sure the
branches don't turn off the rcg inadvertently.

What if a branch is enabled, but the rcg root_en bit isn't set, and XO
is used? In that case, this will report the clk as disabled when it's
really enabled. That will look confusing to the clk framework because a
child will be enabled without the parent being enabled. Things will
probably still work though, because this only matters during disabling
unused clks.

Maybe it's better to not implement an is_enabled() callback for this clk
and simply call a function to see which parent the hardware is using (XO
or not). Basically don't go through clk_hw_is_enabled() and just call
clk_rcg2_parked_is_enabled() directly wherever the clk_hw API is used.
Then the framework doesn't get confused about enabled children with
disabled parents, but the downside is that the framework doesn't know if
the rcg is enabled. This is most likely fine though because an enabled
rcg doesn't really make a difference. The important thing is knowing
which branches are enabled at the framework level. Furthermore, the
framework doesn't currently handle propagating up the enable state at
boot to parents, so if say we have a child branch that is enabled, the
enable state of the parent _must_ be enabled as well, or the branch is
wedged and the only way to unwedge that is to enable the parent. It's
quite a mess!

Long story short, I question why we need to implement is_enabled() for
this clk. What's the benefit? The branches being off is more important
if we're concerned about saving power. There's the problem of handing
off enable state from when the driver probes, but that's not so easy to
solve given that a branch could be enabled (or a branch could be enabled
that isn't even known to linux). And it also sort of doesn't matter
because we know XO is practically always enabled and what really matters
is making sure the driver can't wedge the RCG by changing the source to
something that isn't enabled if it thinks the RCG is disabled when it is
really enabled.

That's sort of the only rule here, don't write the hardware when the
current parent isn't enabled or the new parent isn't enabled. We don't
know if the rcg is ever enabled, so we can only write the "go bit"
(CMD_UPDATE) when we're 100% certain that the parent (or next parent
when switching) is enabled. XO we know is always enabled, but otherwise
we don't know unless the framework has enabled the clk (and therefore
implicitly enabled the parent). The set_rate op could be called from
either enabled or disabled state, same for the set_parent op. And we
want the other clk APIs to report the state of the clk (like the parent
or rate) even if the hardware hasn't been changed.

> +
> +       ret =3D regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &c=
fg);
> +       if (ret)
> +               return ret;
> +
> +       return FIELD_GET(CFG_SRC_SEL_MASK, cfg) !=3D rcg->safe_src_index;
> +}
> +
> +static int clk_rcg2_parked_init(struct clk_hw *hw)
> +{
> +       struct clk_rcg2 *rcg =3D to_clk_rcg2(hw);
> +       const struct freq_tbl *f =3D rcg->freq_tbl;
> +
> +       regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &rcg->parked_c=
fg);

I need this part today to fix a stuck clk problem I see on trogdor.lazor
where during registration a call to clk_ops::get_parent() sees the clk
isn't enabled at boot (because there isn't a clk_ops::is_enabled()
function) so clk_rcg2_shared_get_parent() reads the parent from the
'parked_cfg' value, which is zero. If the hardware actually has non-zero
for the parent then the framework will get the wrong parent, which is
what happens on trogdor when the devmode screen is shown. The parent is
the display PLL instead of XO. I haven't dug far enough to understand
why disabling unused clks wedges the branch when we try to enable it
again, but not disabling unused clks fixes the problem or reading the
config register at registration to get the proper parent also fixes it.
I guess the problem is that we're switching the RCG value when we
shouldn't be doing that.

> +
> +       if (FIELD_GET(CFG_SRC_SEL_MASK, rcg->parked_cfg) !=3D rcg->safe_s=
rc_index)
> +               return 0;
> +
> +       if (WARN_ON(!f) ||
> +           WARN_ON(qcom_find_src_cfg(hw, rcg->parent_map, f->src) =3D=3D=
 rcg->safe_src_index))
> +               return -EINVAL;
> +
> +       return __clk_rcg2_configure(rcg, f, &rcg->parked_cfg);

It would be good to have a comment above this like

	/*
	 * Dirty the rcg registers to point at the first frequency table
	 * entry which is guaranteed to not use the safe_src_index.
	 * Setting the rate of the clk with rcg registers containing the
	 * safe_src_index will confuse clk_rcg2_parked_is_enabled() as
	 * to the enable state and lead to actually changing the rate of
	 * the clk when it isn't enabled.
	 */

> +}
> +
> +/*
> + * Unlike clk_rcg2_shared_ops, the safe_src_index aka XO must NOT be pre=
sent in
> + * parent_map. This allows us to implement proper is_enabled callback.

We could also modify clk_ops::set_rate() and clk_ops::determine_rate()
to ignore frequency table entries with the safe_src_index, so that no
driver can change the frequency to be XO. Then XO is still "reserved",
and it still means the clk is disabled when the parent is XO, but we
don't have to change the RCG registers during clk_rcg2_parked_init() to
move off the safe_src/XO parent. We also have to prevent the parent from
being set to XO with clk_set_parent(). That should be doable by failing
the clk_ops::set_parent() op when the parent is XO.

I'd actually prefer that approach if it's workable, so that we don't
dirty the RCG registers during clk registration. I think qcom folks were
unhappy with the rcg registers being dirty for a long time
(CMD_DIRTY_CFG), because the other entity (the gdsc?) was triggering the
rcg switch (CMD_UPDATE) and that was causing the wrong parent to be
used.

I still come back to the why question though. What are we gaining by
implementing is_enabled for this clk?

> + */
> +const struct clk_ops clk_rcg2_parked_ops =3D {
> +       .init =3D clk_rcg2_parked_init,
> +       .is_enabled =3D clk_rcg2_parked_is_enabled,
> +       .enable =3D clk_rcg2_shared_enable,
> +       .disable =3D clk_rcg2_shared_disable,
> +       .get_parent =3D clk_rcg2_shared_get_parent,
> +       .set_parent =3D clk_rcg2_shared_set_parent,
> +       .recalc_rate =3D clk_rcg2_shared_recalc_rate,
> +       .determine_rate =3D clk_rcg2_determine_rate,
> +       .set_rate =3D clk_rcg2_shared_set_rate,
> +       .set_rate_and_parent =3D clk_rcg2_shared_set_rate_and_parent,
> +};
> +EXPORT_SYMBOL_GPL(clk_rcg2_parked_ops);
