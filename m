Return-Path: <linux-arm-msm+bounces-110703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENBjEaBhHmrCiwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 06:52:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBEE628377
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 06:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A04E0303AAAB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 04:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C2C62DB78C;
	Tue,  2 Jun 2026 04:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b="TJ5162gP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound9.mail.transip.nl (outbound9.mail.transip.nl [136.144.136.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ECD2D6E5A;
	Tue,  2 Jun 2026 04:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.136.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780375810; cv=none; b=Zeju44FQiGgT9JV9fTniORU8LQcC9aLtsRVNDaadCs5HBYTnH7WyIneQzCRAMtS3XI7SL7v7XnKZ+6jtxCIVu1/s9UHxdqXypYZkSwhnCfJcXQg/6Nrp4mrUcbPVtm1oPsKkrO9N9rb1VXC920L3K84sXHycrDKSEthK6NPUA94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780375810; c=relaxed/simple;
	bh=R4VTXctIlULcoTQnMTBq/IVV5C6hzgc3xt6CcQdqqbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ocbe7TGEzGITtAQOZ9KuB4iR+8MxrH1/mWQToAL00/zeAGTQmRsX4Y0Xw3U0WsFEOBMApzv07ZcHP1IPR+tfqvMbIl6cPuFAF49P7GpUpH7hqwjuOlUQa21z8iutOHyjEReDPbMrQ/oAYiiiOp4CGU74WOQ3ujHkcm2pfP4sgJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org; spf=pass smtp.mailfrom=herrie.org; dkim=pass (2048-bit key) header.d=herrie.org header.i=@herrie.org header.b=TJ5162gP; arc=none smtp.client-ip=136.144.136.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=herrie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=herrie.org
Received: from submission4.mail.transip.nl (unknown [10.103.8.155])
	by outbound9.mail.transip.nl (Postfix) with ESMTP id 4gTz0D2j0ZzTPSNS;
	Tue,  2 Jun 2026 06:50:04 +0200 (CEST)
Received: from herrie-desktop.. (180-93-184-31.ftth.glasoperator.nl [31.184.93.180])
	by submission4.mail.transip.nl (Postfix) with ESMTPA id 4gTz0C5j07z3R3nyZ;
	Tue,  2 Jun 2026 06:50:03 +0200 (CEST)
From: Herman van Hazendonk <github.com@herrie.org>
To: sboyd@kernel.org
Cc: Herman van Hazendonk <github.com@herrie.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] clk: qcom: lcc-msm8960: check regmap_read/regmap_write return values in probe
Date: Tue,  2 Jun 2026 06:49:59 +0200
Message-ID: <20260602045002.290918-2-github.com@herrie.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602045002.290918-1-github.com@herrie.org>
References: <20260602045002.290918-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: ClueGetter at submission4.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=herrie.org; t=1780375803; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=OTxApEMQv4b/2Vnk7vrBLcIiwZ9gDFBPee9ze+2Y1rQ=;
 b=TJ5162gP2A0OtdHiNXPU4dvWPXZSiyQlzxjsAw7CJZfoS1hpEyxrzQ3aY8uvSZsVxmoBkB
 0irj8Ghy6IdB0767n4ZtI1tpz9Ev/SobeN0cZS5d29NZ5sVOZRFaCuVtxZvtEiXVQedKSw
 MfZ0ITUHLNIoBr8iq7hjTCcRU985ua+ziFQMsuI1kKddKxCso+hTHLPkWYVJWa1qIwLtZV
 tu08GNCo/nqSV5U7SijJkegtqveKLMVlw6ysNAuDtoFKQMawGmE4WPk/UJ5/v3bVnAvtE8
 H6CmUX9gJfImdHEaCcY6U6UPdMcH5cQw+mX1tW3fU7iy2P6IGukkprEjGsoATQ==
X-Report-Abuse-To: abuse@transip.nl
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[herrie.org:s=transip-a];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110703-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DMARC_NA(0.00)[herrie.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github.com@herrie.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[herrie.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: AFBEE628377
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The PLL4 L-register read in probe was used to select between the 393 MHz
and 492 MHz frequency plans without checking whether the underlying
regmap operation succeeded; a silent failure would leave the rcg
structures pointing at whatever default they had at startup (the 393
MHz plan) and the chosen plan could be wrong for the running PLL,
producing incorrect audio clock rates without any diagnostic.

The unconditional write to register 0xc4 that arms the LPASS Primary
PLL mux on PLL4 had the same problem: a bus-level failure would leave
the mux at its default (PXO) and every downstream LCC clock would be
sourced from the wrong parent without a warning.

Use dev_err_probe() in both spots so the error is surfaced (and the
deferred-probe state machine handles the EPROBE_DEFER-from-bus-arbiter
case correctly) and the driver does not bind in a known-bad
configuration.

Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
---
 drivers/clk/qcom/lcc-msm8960.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/lcc-msm8960.c b/drivers/clk/qcom/lcc-msm8960.c
index 7cba2ce3e408..44321c01f957 100644
--- a/drivers/clk/qcom/lcc-msm8960.c
+++ b/drivers/clk/qcom/lcc-msm8960.c
@@ -453,6 +453,7 @@ MODULE_DEVICE_TABLE(of, lcc_msm8960_match_table);
 static int lcc_msm8960_probe(struct platform_device *pdev)
 {
 	u32 val;
+	int ret;
 	struct regmap *regmap;
 
 	/* patch for the cxo <-> pxo difference */
@@ -468,7 +469,10 @@ static int lcc_msm8960_probe(struct platform_device *pdev)
 		return PTR_ERR(regmap);
 
 	/* Use the correct frequency plan depending on speed of PLL4 */
-	regmap_read(regmap, 0x4, &val);
+	ret = regmap_read(regmap, 0x4, &val);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to read PLL4 L register\n");
 	if (val == 0x12) {
 		slimbus_src.freq_tbl = clk_tbl_aif_osr_492;
 		mi2s_osr_src.freq_tbl = clk_tbl_aif_osr_492;
@@ -479,7 +483,10 @@ static int lcc_msm8960_probe(struct platform_device *pdev)
 		pcm_src.freq_tbl = clk_tbl_pcm_492;
 	}
 	/* Enable PLL4 source on the LPASS Primary PLL Mux */
-	regmap_write(regmap, 0xc4, 0x1);
+	ret = regmap_write(regmap, 0xc4, 0x1);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to select PLL4 on LPASS Primary PLL Mux\n");
 
 	return qcom_cc_really_probe(&pdev->dev, &lcc_msm8960_desc, regmap);
 }
-- 
2.43.0


