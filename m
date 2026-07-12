Return-Path: <linux-arm-msm+bounces-118530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id THTZN/AFU2p9WAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 05:11:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED39743A8F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 05:11:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=VuBH2UwP;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118530-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118530-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00171301ECD4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 03:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D87366553;
	Sun, 12 Jul 2026 03:11:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753452DCC1F;
	Sun, 12 Jul 2026 03:11:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783825893; cv=none; b=d7n+cEUYX/cavx9ttuPNKBTP1d9OfQQl5PWvx7px41a0wKYsioOqwb8tEN3P65hJpRfWhnfjkdGhI/uk3YgIKS3sT2GGVz+1rB94/HcKekEw/MbXRV8iphoguG+SZde4PDVHASDGVUvZylVoi5pN4LSV2oFOwMX4H7bbb0O+b9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783825893; c=relaxed/simple;
	bh=OfkIYbB3usR2r/HeTYEeAnKhUpEXwsYjhvtLM/7J64k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sA86ZlwWRseLpoQlczFbC8DKNs/2D4W4+2wYsYuUTt0zy5a2derOMUUIVwXZILIVyyUV9k5Gf7lkGBbn9U2C61+9nIwtgyx88z2E4gOLsgVkEp7e4Mu4LYUxiNYie0x/FejNmdN0NrAJ66hWbk1qJAyyZk3zX/OubYPv2621P04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuBH2UwP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39C6FC2BCF7;
	Sun, 12 Jul 2026 03:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783825893;
	bh=OfkIYbB3usR2r/HeTYEeAnKhUpEXwsYjhvtLM/7J64k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VuBH2UwPv1PWf/EhqCk+Y09qEbIZisCdNYg88abphO8MCI+Cl7xEZS+BVe3NWDcWB
	 svF/4iAKoGMGFfipjPwOo1BbXfsP71y90VjNaRlypbnKdgC3wA88NkkTC+Pi5aMm4u
	 zl9nn+fId0YWBqCOfH9j2KgwXeXWMbF3bL2Bs++3+LFeSCic7HL8dlhmhdKrCT9Faw
	 d9348ko+6SggTTX9vHwfaqHwhiels2Wphkw57tJZOYFfwhfyqAGc/69qRZXIQWqRYF
	 E0mUL76kgRk2MCxbGUmNnjjEb90OC/OdNoqUUS+Ow1FsmwB3cqELrU6YuAlAeyCzne
	 XwpNmqPtaEfYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C427C44508;
	Sun, 12 Jul 2026 03:11:33 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Sat, 11 Jul 2026 23:10:37 -0400
Subject: [PATCH v2 3/3] clk: qcom: dispcc-sm8450: Keep pll types as is for
 SM8475
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-sm8450-qol-dispcc-v2-3-fc1a07ac5601@proton.me>
References: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
In-Reply-To: <20260711-sm8450-qol-dispcc-v2-0-fc1a07ac5601@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783825891; l=1363;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=t+lNjNa2t6HZO8sfj5j22+PtdnnFFxNblbhbO/qadd0=;
 b=Bj9RlBDSAQxg8KVWCWBDlK+W6DILMgAvBoBCOjSG+SkJQ/cXRWofqsgfJAT3JPEDb+hlrE1ui
 eAx32OOZCQZAnrSdhZglC3MU5gEL+tXYESGra/ckMRRMsugNEG8+xWV
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118530-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:lumag@kernel.org,m:danila@jiaxyga.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:esteuwu@proton.me,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,proton.me:replyto,proton.me:mid,proton.me:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7ED39743A8F

From: Esteban Urrutia <esteuwu@proton.me>

While using an OLE PLL type is correct according to downstream code, this
results in the display flickering at boot for SM8475 because downstream
uses EVO type configurations for both clocks, while, for some reason,
upstream uses EVO type configurations for SM8450 and OLE type
configurations for SM8475.
So far, no regressions have been observed and the display no longer
flickers.

Fixes: 7c0e8764dc33 ("clk: qcom: dispcc-sm8450: Add SM8475 support")
Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 drivers/clk/qcom/dispcc-sm8450.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8450.c b/drivers/clk/qcom/dispcc-sm8450.c
index 07f22b5b5ee5..2c0edc23eeb1 100644
--- a/drivers/clk/qcom/dispcc-sm8450.c
+++ b/drivers/clk/qcom/dispcc-sm8450.c
@@ -1833,11 +1833,9 @@ static int disp_cc_sm8450_probe(struct platform_device *pdev)
 
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-dispcc")) {
 		/* Update DISPCC PLL0 */
-		disp_cc_pll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
 		disp_cc_pll0.clkr.hw.init = &sm8475_disp_cc_pll0_init;
 
 		/* Update DISPCC PLL1 */
-		disp_cc_pll1.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
 		disp_cc_pll1.clkr.hw.init = &sm8475_disp_cc_pll1_init;
 
 		disp_cc_pll0.config = &sm8475_disp_cc_pll0_config;

-- 
2.55.0



