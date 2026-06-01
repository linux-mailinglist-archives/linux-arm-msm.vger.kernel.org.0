Return-Path: <linux-arm-msm+bounces-110535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCbgE4RJHWo2YgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:57:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C16D561BE8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 10:57:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18B60304A843
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 08:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C892537C0FF;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6xPG+WG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6A3363C62;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780304029; cv=none; b=nrDh4niMkaR5B6V6ZnXlAjSX61mwneLln4M3dejyvPAZgUSkGitv99ISPLXGKi8EGc9a6cI8YBzlkhGeOsgkqzDsOBi08i3RWZp1XTv3B6CAaY91SthipB3lE9Kx0P2sc4VU7XPEl6LbAN5PiyR7eMQRQ4nFrqCJivFq2DtmFDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780304029; c=relaxed/simple;
	bh=imDz6p80dCh3VtmVa0YE/zlu1TE/BKPaeKtmZOiuRqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+g1E/4rJ1BTty3MOZdOBlvBkRSt/e0xfg5wS11DeTq39wciAkkZd/7ZpFiZE4GRm9O3flQJZgrcl76L4eLjvvw8a16It2k/ZFdV1vbePly6BNje5K76EOuGs8ZY1rv7hAGQ+PTyXcSa2Wl+Pr0i/8tOd/tVnCT/hwhHtbTSpMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6xPG+WG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B676C4AF0C;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780304029;
	bh=imDz6p80dCh3VtmVa0YE/zlu1TE/BKPaeKtmZOiuRqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=F6xPG+WGbrc1uw9TBykxTouSGkM1WKGj3n3ZFtT24RUQX9EKcYdqKTY9WrM6zQQ1z
	 HWHDfOuIDb++A8vXfgszVghyn90DYG9A9a6DeaLEiMcIhT3ICR+kBoz/DpDL5+tfRA
	 Q2XbewEZfLNzbzvELRKdYqyMIfYS13CWX7NO7z+/fSQGiBgXjbr0EuxNw5ajLnxGVG
	 mshEjaRIuxttm985GKq5DhxJJ3jOF1rS8qd0uprXcgUDxfOIli8eIKirTUh/d2rY8l
	 nUr9XyKTVhDKZDSh+b10zZ/YejYrZ4gbPhHW3kv8jUaXJJLtkCfCpSuccJKcPWrCVy
	 /4NfElSCQq/hA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BA0CD6E63;
	Mon,  1 Jun 2026 08:53:49 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Mon, 01 Jun 2026 15:51:17 +0700
Subject: [PATCH v3 04/10] clk: qcom: clk-rpm: add msm8960 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-msm8960-wifi-v3-4-fec6ac8dba02@smankusors.com>
References: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
In-Reply-To: <20260601-msm8960-wifi-v3-0-fec6ac8dba02@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780304027; l=1065;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=lm6L9ISuVUk452Tk3hf1nHmfNzhGhKGjXfsugz6Twlw=;
 b=ow1l7b52Ct6t4kTpM8zNEEWEQ5edgKWE3lVCE/rpwIj9w/1Fz1IuACy6TBojKF+/ZWcoJpBqZ
 dJ1UDh2a4e8AHbtvx801SavZVTue+aDgEc5pLKq911knGztLVgWeGAR
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110535-lists,linux-arm-msm=lfdr.de,linux.smankusors.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com,smankusors.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[linux@smankusors.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:replyto,smankusors.com:mid,smankusors.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: C16D561BE8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add support for the "qcom,rpmcc-msm8960" compatible string to the
RPM clock driver.

msm8960 uses the same RPM clock descriptions as apq8064, so reuse
rpm_clk_apq8064 for this compatible.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 drivers/clk/qcom/clk-rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
index be0145631197..601f60274113 100644
--- a/drivers/clk/qcom/clk-rpm.c
+++ b/drivers/clk/qcom/clk-rpm.c
@@ -502,6 +502,7 @@ static const struct rpm_clk_desc rpm_clk_ipq806x = {
 static const struct of_device_id rpm_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8660", .data = &rpm_clk_msm8660 },
 	{ .compatible = "qcom,rpmcc-apq8060", .data = &rpm_clk_msm8660 },
+	{ .compatible = "qcom,rpmcc-msm8960", .data = &rpm_clk_apq8064 },
 	{ .compatible = "qcom,rpmcc-apq8064", .data = &rpm_clk_apq8064 },
 	{ .compatible = "qcom,rpmcc-ipq806x", .data = &rpm_clk_ipq806x },
 	{ }

-- 
2.34.1



