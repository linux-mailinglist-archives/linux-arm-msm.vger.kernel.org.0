Return-Path: <linux-arm-msm+bounces-103121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK0iEFom3mmMoAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:34:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 421B13F966E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 13:34:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 03CAB30091D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:34:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1BE311C01;
	Tue, 14 Apr 2026 11:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="U1wX3Fk5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F197939A040
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776166475; cv=none; b=VBmzLDH+eWfdURwMdVlLGZEwEGo9TXOd0hus/fYWwMp/2GuwKmknx015jSzigX3Y2DyTGotmATOOhPCuGOqobnGYihCfXRG2SwicOmP34U7u3/m0rVNgXyveGl1w5FjglVkMaY0IpfVhB1kiY/LrnK1kWED7Oy1YrUqqtxZJnJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776166475; c=relaxed/simple;
	bh=IPuuAZ3QUI3kISr5bIPWEgCRk/JGcfrG69DwgS20bhA=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DcmdhiXo9z4wxcItRBYdBeax3OPytAQW8UYFPw9Az7Pjc7HwL7A6xJj4SJsVhTILjpdP26xkG6gu2O2tYs4iP/wDvsOuGFDBOtdClmHRelELnG0MgTeX5VJ7st4JT3yMnY3LGMxQyyYe9MMeZQ1RFHsdk8DLWhamfcgJsP3IrMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=U1wX3Fk5; arc=none smtp.client-ip=109.224.244.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776166465; x=1776425665;
	bh=1kT/8BpbyfAuxwonp0SoeLu9NuLOa9DfbsfgXCmDFiA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=U1wX3Fk5zR4MoPp0rbZHCO81exOXxDkrYxLNmZaj1n8odp8jCugS+WrqT1yl6CUvo
	 g6vZvc5MlAThMwrb26r5xsf74vXE9ZzExIr61aVsOmUm5PD/W8wu5V11ewAb0HfEpW
	 Nuw3+jgkoquec09ujq5PDycIb7oUR/bT6VwWen+/jdP12OUwehH0EhfDKSbEF+PX0n
	 /6iTHFsZZOffFdGW2dLtv77CCfkm1L3iXS0o11acC/O0IKGbVgVdz6n/Njrkddvlhv
	 1S/p8m3djUDh9CAAl8P89kaaVW8HVIeD5jYty/uSzOPrY/FqcgbfVkD8PM6f5B3FdY
	 SoKYUO6Is2/WA==
Date: Tue, 14 Apr 2026 11:34:18 +0000
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v2] clk: qcom: clk-rpmh: Make all VRMs optional
Message-ID: <20260414-clk-rpmh-vrm-opt-v2-1-43c1073d109c@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: add7ccb1faf82968a2ac848ba218a272aaf978bf
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103121-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[pm.me:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,pm.me:dkim,pm.me:email,pm.me:mid]
X-Rspamd-Queue-Id: 421B13F966E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some VRMs aren't present on all boards, so mark them as optional. This
prevents probe failures on boards where not all VRMs are present.

This resolves an issue seen on the Nothing Phone (4a) (Eliza) where
probe fails due to RPMH_RF_CLK5 not being present on the board, this is
due to this device having a slightly different PMIC configuration from
the Eliza MTP.

This matches the downstream approach of marking all VRMs as optional
and makes the previous clka_optional handling redundant.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v2:
- Squashed clka_optional revert into patch (Dmitry)
- Simplified patch by just checking if CLK_RPMH_VRM_EN_OFFSET (Konrad)
- Squashed cover into patch commit message and expanded on background
- Link to v1: https://lore.kernel.org/r/20260412-clk-rpmh-vrm-opt-v1-0-37c8=
90c420ff@pm.me
---
 drivers/clk/qcom/clk-rpmh.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..269a884645b4 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -66,8 +66,6 @@ struct clk_rpmh {
 struct clk_rpmh_desc {
 =09struct clk_hw **clks;
 =09size_t num_clks;
-=09/* RPMh clock clkaN are optional for this platform */
-=09bool clka_optional;
 };
=20
 static DEFINE_MUTEX(rpmh_clk_lock);
@@ -691,7 +689,6 @@ static struct clk_hw *sm8550_rpmh_clocks[] =3D {
 static const struct clk_rpmh_desc clk_rpmh_sm8550 =3D {
 =09.clks =3D sm8550_rpmh_clocks,
 =09.num_clks =3D ARRAY_SIZE(sm8550_rpmh_clocks),
-=09.clka_optional =3D true,
 };
=20
 static struct clk_hw *sm8650_rpmh_clocks[] =3D {
@@ -723,7 +720,6 @@ static struct clk_hw *sm8650_rpmh_clocks[] =3D {
 static const struct clk_rpmh_desc clk_rpmh_sm8650 =3D {
 =09.clks =3D sm8650_rpmh_clocks,
 =09.num_clks =3D ARRAY_SIZE(sm8650_rpmh_clocks),
-=09.clka_optional =3D true,
 };
=20
 static struct clk_hw *sc7280_rpmh_clocks[] =3D {
@@ -893,7 +889,6 @@ static struct clk_hw *sm8750_rpmh_clocks[] =3D {
 static const struct clk_rpmh_desc clk_rpmh_sm8750 =3D {
 =09.clks =3D sm8750_rpmh_clocks,
 =09.num_clks =3D ARRAY_SIZE(sm8750_rpmh_clocks),
-=09.clka_optional =3D true,
 };
=20
 static struct clk_hw *glymur_rpmh_clocks[] =3D {
@@ -951,6 +946,9 @@ static struct clk_hw *of_clk_rpmh_hw_get(struct of_phan=
dle_args *clkspec,
 =09=09return ERR_PTR(-EINVAL);
 =09}
=20
+=09if (!rpmh->clks[idx])
+=09=09return ERR_PTR(-ENOENT);
+
 =09return rpmh->clks[idx];
 }
=20
@@ -983,8 +981,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 =09=09if (!res_addr) {
 =09=09=09hw_clks[i] =3D NULL;
=20
-=09=09=09if (desc->clka_optional &&
-=09=09=09    !strncmp(rpmh_clk->res_name, "clka", sizeof("clka") - 1))
+=09=09=09if (rpmh_clk->res_addr =3D=3D CLK_RPMH_VRM_EN_OFFSET)
 =09=09=09=09continue;
=20
 =09=09=09dev_err(&pdev->dev, "missing RPMh resource address for %s\n",

---
base-commit: 591cd656a1bf5ea94a222af5ef2ee76df029c1d2
change-id: 20260412-clk-rpmh-vrm-opt-78b97cf451ba

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



