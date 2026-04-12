Return-Path: <linux-arm-msm+bounces-102851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPQxCse622mnFwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:31:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A41EF3E483A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 17:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 259D030117BE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 15:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB3F39FD4;
	Sun, 12 Apr 2026 15:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="czrfQYCK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43100.protonmail.ch (mail-43100.protonmail.ch [185.70.43.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE4E14F9FB
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 15:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776007859; cv=none; b=qj6NaDUaPETraECQM2JjXe2AWwYVOaRAj1/sOWGOdVDIVfSyUIUH2UUlnLwZuK3AvtszHxzJnJ2Pe2NYI9SRdMyMdWt2w4oaYgebKHvoZ5mKNJr/Atl9KdEFWrrQWlpEBChJuMo9VIbpltESx7fHY/5zOoV0jc/jV+jv8Aa4IV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776007859; c=relaxed/simple;
	bh=0wfKZ1XsWLq4O8YXlheThr87U+vbrgynfRN59nNik2Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JHTB+L34Ut0KiaIwvmFN7kqD/q3+zxTqclcjkdhiPMU4cTDoWkSTA7b5xZ4kBn5iDQ+KSZoVR2yTq96+YvpTzejjFmnospp/qBkR2RhbAmq5KcYcSo+yy9H7acXbxIK2xB6MO1wH8vBjzPYGuYLT13TBGkQ9o1NtAzv/KaNJi7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=czrfQYCK; arc=none smtp.client-ip=185.70.43.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776007855; x=1776267055;
	bh=EwPgZdkR3n111ITFHye+yYyNnOLCYX9in8OTHGIBdPw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=czrfQYCKjlHuXZsk4b1OFn0OZXtZsiyYXz3tVMypxXELu3oazFgGLuyAmbeBInNbs
	 3dRP0oTzXmrPcFCUrT+pOS2LbUtH+tCRtkknxx9t7zWKBux8QXV0IRuCVo1IPQ7qBP
	 fRJiyHGYA2mON5OZOqHVSDO7oeVYAxCRmUQKfv5TA6jMdXB1NPG/g+ol4zvvZGIAaq
	 YWAQ/9eGJgXOPa61tp0NdoTPvTvOXpYTMfQt91hs/XAn8TLzjKnAK0GTqVZU1UMLjW
	 2lYegFttxmrx0JEvbUCfRHHn3r1AuBOqhurG0eEYcRYNESt1NzRzjiJ7zVYRWwOiSx
	 +CFOpUJDidY+Q==
Date: Sun, 12 Apr 2026 15:30:52 +0000
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 1/2] Revert "clk: qcom: rpmh: make clkaN optional"
Message-ID: <20260412-clk-rpmh-vrm-opt-v1-1-37c890c420ff@pm.me>
In-Reply-To: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me>
References: <20260412-clk-rpmh-vrm-opt-v1-0-37c890c420ff@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 6ce20891b82e63e05c7088087cf76529cfcf18d1
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
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[pm.me:+];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-102851-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A41EF3E483A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This reverts commit 166e65bc6ce317be41368d9340b870edbdbaa2aa.

Reason for revert: Better handled by just marking all VRMs as optional,
instead of needing to mark for each platform, done in follow up change.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 drivers/clk/qcom/clk-rpmh.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 547729b1a8ee..fc99c2c305da 100644
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
@@ -981,12 +976,6 @@ static int clk_rpmh_probe(struct platform_device *pdev=
)
 =09=09rpmh_clk =3D to_clk_rpmh(hw_clks[i]);
 =09=09res_addr =3D cmd_db_read_addr(rpmh_clk->res_name);
 =09=09if (!res_addr) {
-=09=09=09hw_clks[i] =3D NULL;
-
-=09=09=09if (desc->clka_optional &&
-=09=09=09    !strncmp(rpmh_clk->res_name, "clka", sizeof("clka") - 1))
-=09=09=09=09continue;
-
 =09=09=09dev_err(&pdev->dev, "missing RPMh resource address for %s\n",
 =09=09=09=09rpmh_clk->res_name);
 =09=09=09return -ENODEV;

--=20
2.53.0



