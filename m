Return-Path: <linux-arm-msm+bounces-118909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uYblI++sVWpwrgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:28:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA0F750A2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:28:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="p/ODHIJu";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118909-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118909-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D48EF3041B9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 03:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63B63BCD29;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB97739F162;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783999718; cv=none; b=uUwAaQTH5NoWUSH5cEumrPSTxU+O5zLxlyIkFeXsklqitQcKcclozYBw2J9qcHhX4pBprqL0D19AkseJ1+g44lPxAIANq3bCGGkKpvCM2/jxphAzm3SIEoX4eDPBfsUhZay6svJ5OEClhLJgDeKd82iehUfoyrD8DwhSRGyuDm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783999718; c=relaxed/simple;
	bh=tQ+NiSln41kIEiTdEZzg096lDi2b4x36FAPAdGwm71A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NaSuYSeumRb932dFUMcV0z39Ausvi+2TpfdEMP2CPrWNSXCXMJpWhJ7aQVNkETh3uMCv2u5IN1nAiXZvrhBTnsroHymOVWn0d6TqzF+bHFtG0zzO0cK9L4Et1BCH1Hpdx1Rs7XrekG1zpctl46heXzRq1LDCdlrfijT7rYpQveQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p/ODHIJu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81D58C2BCFB;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783999718;
	bh=tQ+NiSln41kIEiTdEZzg096lDi2b4x36FAPAdGwm71A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=p/ODHIJuW9lDcltRCdOxpyZtyidMFwf4a46OOI2eByC7CWVRMmyNok2H/EyzeIi/V
	 VMbe/b4mrSmkmTQ5dioyj92HHHi/syV0cnzdOipDysyKjF24cLM5TMMXJaDdN2MY8g
	 fh+/5Iq22YlMt+rvg6sojJFk820mvsjXYycvbif7b97BcZzmKKyqGvD+YyCMNrJE6o
	 7Pqkj0WbJ6b5S19LKs9rePnRYDM6TsjMP2oEvrkO5E6IbrknFA/T1rzrWp2N+0a5WA
	 h2NTaopA7ixkmEK7SZNjqxOz1jmS4j3kcXHye9G4npJmScZ3/w8QIEHlXOJZ8GWlHW
	 3eyIiLyJeABJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65566C43458;
	Tue, 14 Jul 2026 03:28:38 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Mon, 13 Jul 2026 23:28:19 -0400
Subject: [PATCH v3 3/3] clk: qcom: alpha-pll: Check Lucid Ole PLL status
 before configuring
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-sm8450-qol-dispcc-v3-3-56fd05822270@proton.me>
References: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
In-Reply-To: <20260713-sm8450-qol-dispcc-v3-0-56fd05822270@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783999716; l=1223;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=GhaCSfwi+m8HFFTiT0PN4OP31ZAcFq2cbK1k4hgXMNo=;
 b=1PrS4k9a3/d4gCxJxTpsPJ2dM9iDEe0p3/63VdlkKQKp5Dzm13w416iuD2rPKLOdP+eTtx8T1
 VDP1KW19Bv4B1rW2BNv7g9EAmuueSsKUuRvsQtCATcNhuxWuHX0DrlR
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118909-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:lumag@kernel.org,m:quic_jkona@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:esteuwu@proton.me,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[esteuwu@proton.me];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AA0F750A2A

From: Esteban Urrutia <esteuwu@proton.me>

On some platforms such as SM8475, not doing this may result in graphical
glitches when the mdss driver takes over.
This fixes the aforementioned issue.

Fixes: 3132a9a11e57 ("clk: qcom: clk-alpha-pll: Add support for lucid ole pll configure")
Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/clk/qcom/clk-alpha-pll.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index f8313f9d0e30..60173b076cc5 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2373,6 +2373,15 @@ void clk_lucid_ole_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 {
 	u32 lval = config->l;
 
+	/*
+	 * If the bootloader left the PLL enabled it's likely that there are
+	 * RCGs that will lock up if we disable the PLL below.
+	 */
+	if (trion_pll_is_enabled(pll, regmap)) {
+		pr_debug("Lucid Ole PLL is already enabled, skipping configuration\n");
+		return;
+	}
+
 	lval |= TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT;
 	lval |= TRION_PLL_CAL_VAL << LUCID_OLE_PLL_RINGOSC_CAL_L_VAL_SHIFT;
 	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), lval);

-- 
2.55.0



