Return-Path: <linux-arm-msm+bounces-103191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFTJFst63mkHEwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:35:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0423FD1FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 19:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCB633069722
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7B23F075E;
	Tue, 14 Apr 2026 17:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Z1YG22jF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798D617A2EA;
	Tue, 14 Apr 2026 17:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776188085; cv=none; b=ZVao5RT7kqTBL+hCYS7psB4Ke7S+6OUbh31mS1TwrBgDicDwTCnsCLJd10mkiQVLKN/VZZ9VKcntRQadxxOXCxf9Je2Yf6A6J2kJHSllP6bvsCIVDjkQJcxYoPp521NV97BZcSawsNIo9Te64nCxoH4dSIKT937EfxnRmL5++uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776188085; c=relaxed/simple;
	bh=VJ+TAkF39F48iG/YXVuLe0DhjcocAQU2eKi5T9On9yQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m5P5hce5c8WeQBLtH375s0aL6UNxDi5E1s0ySQfoEIx2jPrYHcdbeV0vSAl6fD3vhoKq6HcS9zjBc/kELRxZUcEEFZLTShdpLMQgQXGBe8Mfe/sq5pzmn0im9/U8TQ6k1e/JaECSHKTW+mXodcBzJiHjNPnZVXhbRYhjXgW4zdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Z1YG22jF; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776188074; x=1776447274;
	bh=7V06tulm8mBNi+TMta0rIfp/c2KhObNRHrzAk1IHbMY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Z1YG22jFN7LkGxXugpQRhsAckGm1MMsjTY7jPAaqNZc0mQshm0GDkg4YKG1PcfY3q
	 CTupq8OtdLYDA7m6MsdhjtMnJIo6dpont3Q7tty/Lv0cRedgQc4yFX8sOHzPhRPF7N
	 +0X2xUljS/wt1tFbzxO5omr+uBWo9u3efAUEMCLMghQy9JjkYSGhkBL/ZmPuOHyG6q
	 EAgyQXjETIYkTTVJfLQiR0iYmqHy2XgDAFqIKYfDCWUxLyI4YnvZpZoKrMpcEgGZao
	 TLRfK036hUobAUmCOVQVBKAM6NJiYg7SaXDbmOSb0yLLVOvPZQZeJxCY1ESQrrl9y0
	 VZOlTT97xSSUA==
Date: Tue, 14 Apr 2026 17:34:28 +0000
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH v3] clk: qcom: clk-rpmh: Make all VRMs optional
Message-ID: <20260414-clk-rpmh-vrm-opt-v3-1-8ca21469ffbc@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 1907efc6c483ddce45d4d08946b783e061d0f51c
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103191-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[pm.me:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pm.me:email,pm.me:dkim,pm.me:mid]
X-Rspamd-Queue-Id: BD0423FD1FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some VRMs aren't present on all boards, so mark them as optional. This
prevents probe failures on boards where not all VRMs are present.

This resolves an issue seen on the Nothing Phone (4a) Pro (Eliza) where
probe fails due to RPMH_RF_CLK5 not being present on the board, this is
due to this device having a slightly different PMIC configuration from
the Eliza MTP.

This matches the downstream approach of marking all VRMs as optional
and makes the previous clka_optional handling redundant.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v3:
- Don't return ENOENT in of_clk_rpmh_hw_get (Konrad)
- Link to v2: https://lore.kernel.org/r/20260414-clk-rpmh-vrm-opt-v2-1-43c1=
073d109c@pm.me

Changes in v2:
- Squashed clka_optional revert into patch (Dmitry)
- Simplified patch by just checking if CLK_RPMH_VRM_EN_OFFSET (Konrad)
- Squashed cover into patch commit message and expanded on background
- Link to v1: https://lore.kernel.org/r/20260412-clk-rpmh-vrm-opt-v1-0-37c8=
90c420ff@pm.me
---
 drivers/clk/qcom/clk-rpmh.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..3e0fb33628f4 100644
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
@@ -983,8 +978,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
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



