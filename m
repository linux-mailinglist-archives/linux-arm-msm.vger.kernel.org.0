Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F4C390EEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 05:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhEZDhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 23:37:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:50922 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231519AbhEZDhg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 23:37:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7723613BF;
        Wed, 26 May 2021 03:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622000166;
        bh=M1Id63aaB1aallh3019UiD0//S980+aU2GCI7HZMGsk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=twXQwn2ovA5RExg8oiNnUvhD68HF6CcrEwLyVavCd1MHms+I5p6IUY/eyrSCGqOqO
         5juzuyno1xNfZNiGj3XordRCg3KlW8Q0yKA+Imj3JfWqqD/f2UGXUMzbGCCW5rVEVF
         pGbEVT3FpqyoS9bst4GHWkrIKMTdWnTvlymRLqKrdUutQyseLv6KZmuwYHDJxJAmIr
         BhqppZCIvKrYfRdUtki2MeUmVcGWDJn9GOrJSKS5egXo0sE6FI3H6Cb6dkimItEPcr
         JIZSHPHT2aXOJCOM9DH0PRdOt6NKjWEaUl5OdkMO/BmHBmZN/v8Cbrgutt6RL9jQSB
         DVQ5EjSp1j/Ew==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1619334502-9880-2-git-send-email-tdas@codeaurora.org>
References: <1619334502-9880-1-git-send-email-tdas@codeaurora.org> <1619334502-9880-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v3] clk: qcom: clk-rcg2: Add support for duty-cycle for RCG
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Tue, 25 May 2021 20:36:04 -0700
Message-ID: <162200016458.4130789.5041222615667409232@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-04-25 00:08:22)
> The root clock generators with MND divider has the capability to support
> change in duty-cycle by updating the 'D'. Add the clock ops which would
> check all the boundary conditions and enable setting the desired duty-cyc=
le
> as per the consumer.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---

Applied to clk-next with '_val' removed everywhere as it made it super
hard to read. I also don't like the (d / 2) stuff but I can live with
it.

---8<---

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index aa03e315d891..e1b1b426fae4 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -360,7 +360,7 @@ static int clk_rcg2_set_floor_rate_and_parent(struct cl=
k_hw *hw,
 static int clk_rcg2_get_duty_cycle(struct clk_hw *hw, struct clk_duty *dut=
y)
 {
 	struct clk_rcg2 *rcg =3D to_clk_rcg2(hw);
-	u32 notn_m_val, n_val, m_val, d_val, not2d_val, mask;
+	u32 notn_m, n, m, d, not2d, mask;
=20
 	if (!rcg->mnd_width) {
 		/* 50 % duty-cycle for Non-MND RCGs */
@@ -369,11 +369,11 @@ static int clk_rcg2_get_duty_cycle(struct clk_hw *hw,=
 struct clk_duty *duty)
 		return 0;
 	}
=20
-	regmap_read(rcg->clkr.regmap, RCG_D_OFFSET(rcg), &not2d_val);
-	regmap_read(rcg->clkr.regmap, RCG_M_OFFSET(rcg), &m_val);
-	regmap_read(rcg->clkr.regmap, RCG_N_OFFSET(rcg), &notn_m_val);
+	regmap_read(rcg->clkr.regmap, RCG_D_OFFSET(rcg), &not2d);
+	regmap_read(rcg->clkr.regmap, RCG_M_OFFSET(rcg), &m);
+	regmap_read(rcg->clkr.regmap, RCG_N_OFFSET(rcg), &notn_m);
=20
-	if (!not2d_val && !m_val && !notn_m_val) {
+	if (!not2d && !m && !notn_m) {
 		/* 50 % duty-cycle always */
 		duty->num =3D 1;
 		duty->den =3D 2;
@@ -382,13 +382,13 @@ static int clk_rcg2_get_duty_cycle(struct clk_hw *hw,=
 struct clk_duty *duty)
=20
 	mask =3D BIT(rcg->mnd_width) - 1;
=20
-	d_val =3D ~(not2d_val) & mask;
-	d_val =3D DIV_ROUND_CLOSEST(d_val, 2);
+	d =3D ~(not2d) & mask;
+	d =3D DIV_ROUND_CLOSEST(d, 2);
=20
-	n_val =3D (~(notn_m_val) + m_val) & mask;
+	n =3D (~(notn_m) + m) & mask;
=20
-	duty->num =3D d_val;
-	duty->den =3D n_val;
+	duty->num =3D d;
+	duty->den =3D n;
=20
 	return 0;
 }
@@ -396,7 +396,7 @@ static int clk_rcg2_get_duty_cycle(struct clk_hw *hw, s=
truct clk_duty *duty)
 static int clk_rcg2_set_duty_cycle(struct clk_hw *hw, struct clk_duty *dut=
y)
 {
 	struct clk_rcg2 *rcg =3D to_clk_rcg2(hw);
-	u32 notn_m_val, n_val, m_val, d_val, not2d_val, mask, duty_per;
+	u32 notn_m, n, m, d, not2d, mask, duty_per;
 	int ret;
=20
 	/* Duty-cycle cannot be modified for non-MND RCGs */
@@ -405,29 +405,29 @@ static int clk_rcg2_set_duty_cycle(struct clk_hw *hw,=
 struct clk_duty *duty)
=20
 	mask =3D BIT(rcg->mnd_width) - 1;
=20
-	regmap_read(rcg->clkr.regmap, RCG_N_OFFSET(rcg), &notn_m_val);
-	regmap_read(rcg->clkr.regmap, RCG_M_OFFSET(rcg), &m_val);
+	regmap_read(rcg->clkr.regmap, RCG_N_OFFSET(rcg), &notn_m);
+	regmap_read(rcg->clkr.regmap, RCG_M_OFFSET(rcg), &m);
=20
-	n_val =3D (~(notn_m_val) + m_val) & mask;
+	n =3D (~(notn_m) + m) & mask;
=20
 	duty_per =3D (duty->num * 100) / duty->den;
=20
 	/* Calculate 2d value */
-	d_val =3D DIV_ROUND_CLOSEST(n_val * duty_per * 2, 100);
+	d =3D DIV_ROUND_CLOSEST(n * duty_per * 2, 100);
=20
 	 /* Check bit widths of 2d. If D is too big reduce duty cycle. */
-	if (d_val > mask)
-		d_val =3D mask;
+	if (d > mask)
+		d =3D mask;
=20
-	if ((d_val / 2) > (n_val - m_val))
-		d_val =3D (n_val - m_val) * 2;
-	else if ((d_val / 2) < (m_val / 2))
-		d_val =3D m_val;
+	if ((d / 2) > (n - m))
+		d =3D (n - m) * 2;
+	else if ((d / 2) < (m / 2))
+		d =3D m;
=20
-	not2d_val =3D ~d_val & mask;
+	not2d =3D ~d & mask;
=20
 	ret =3D regmap_update_bits(rcg->clkr.regmap, RCG_D_OFFSET(rcg), mask,
-				 not2d_val);
+				 not2d);
 	if (ret)
 		return ret;
