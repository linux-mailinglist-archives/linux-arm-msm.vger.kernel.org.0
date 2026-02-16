Return-Path: <linux-arm-msm+bounces-93019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCHDIIiqk2lV7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:38:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F131481CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 490DE301455F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 23:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81AD82F1FEA;
	Mon, 16 Feb 2026 23:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="IP4sEnXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF2326F2B0
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771285122; cv=none; b=jHIdOtKQof9+x6oTYPoUZFwcuBonJMae9pQyyAeoxMkxk0pG38E8tuvqeVHyGR2/6o/p8266XN3LU4snlCCQtJoxmlT/VMJBJ7VXgdhgQKvP/C50pOMrxxJwEbZD17VDqrw4dSIKiUrD6qMk5vW+sPP/6rG3O0tda/7N+UjEbqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771285122; c=relaxed/simple;
	bh=OMRlCPZ0qEsHQmJTvMNnWe15UorBiHbpB3WG68YnfuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qoqGeudPKz72mBt4GPpr6YiF3hloplsfJs4KYRjQf7Lq16tUItckzDdrIQI2l18eUNIpnxiQwxrKHHSY817wy3CnI0Ibi4ut2QvWLBl8jWUawDRCBX0ooqx8k578yJq3XInNPejDeLj4Y80QcXexNycZGO09oR7A9ag03jdOaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=IP4sEnXg; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771285119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eQuQSiGO+iS/wZyw+tk5yrutgULYwUrgwsAfbZSdAiQ=;
	b=IP4sEnXgqOFc/6LA/A4W+MyzXKJTYAUjOYF6oICmlthJIabh0uKfDlAqvx3iFznDO/kHHb
	NhwcT2QksYVC0i7JebM5fgfeS8TPUsF4WjCiS3bsipkSq7jAYsaXSpMGyaIbZbrUZM4yeo
	WvLdlg4AGBSKv/X+hIv8KAehjZlbhW5W37kl9xhqugSS7QDajelvB8GAxJYP4sgSykXPeh
	7+avHkYYoN4dNe2wpp0a7qM9L05SWfkMhkBnjdeGWiFnFOUl275XH5PZ63wLNCCNEQ2VAM
	Sw1+JsFmFSYUlMMxUctnYhePFxhYXRlpqerLPfy1giIkv3G74ygNg/OFHr2thw==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Val Packett <val@packett.cool>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
Date: Mon, 16 Feb 2026 20:25:20 -0300
Message-ID: <20260216233600.13098-4-val@packett.cool>
In-Reply-To: <20260216233600.13098-2-val@packett.cool>
References: <20260216233600.13098-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93019-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D1F131481CB
X-Rspamd-Action: no action

Add the missing defines for MDSS resets.
While here, align comment style with other SoCs.

Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
Signed-off-by: Val Packett <val@packett.cool>
---
 include/dt-bindings/clock/qcom,dispcc-sm6125.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sm6125.h b/include/dt-bindings/clock/qcom,dispcc-sm6125.h
index 4ff974f4fcc3..f58b85d2c814 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sm6125.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sm6125.h
@@ -6,6 +6,7 @@
 #ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM6125_H
 #define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM6125_H
 
+/* Clocks */
 #define DISP_CC_PLL0			0
 #define DISP_CC_MDSS_AHB_CLK		1
 #define DISP_CC_MDSS_AHB_CLK_SRC	2
@@ -35,7 +36,10 @@
 #define DISP_CC_MDSS_VSYNC_CLK_SRC	26
 #define DISP_CC_XO_CLK			27
 
-/* DISP_CC GDSCR */
+/* Resets */
+#define DISP_CC_MDSS_CORE_BCR			0
+
+/* GDSCs */
 #define MDSS_GDSC			0
 
 #endif
-- 
2.52.0


