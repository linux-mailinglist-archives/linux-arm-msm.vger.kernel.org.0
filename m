Return-Path: <linux-arm-msm+bounces-94636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ID/OXBUo2nW/AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 21:47:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E51C8880
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 21:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FAD9301C564
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Feb 2026 20:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D392FFDD6;
	Sat, 28 Feb 2026 20:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="p0kA8oKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F077B3009EE
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Feb 2026 20:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772311649; cv=none; b=JWpaxytHhCmjW1XaHuZX+AhmeLv31w1VdKRXPc1QDQvrhgE0O2FdOAU9PyPGXB5BsMt2744rbzm8Nyhc6UgkNJ6F5Cppj5D0oe8IaNC10jNwVwmrrplCkVCVQi98zzev5Y6/shbbpwOn673KVspJigUThBM31UVs8/99k66+wbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772311649; c=relaxed/simple;
	bh=XUGN+GnOejal3C8oiuZa9mM7ZV/xkp7Jj6M5/UwS7M4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8AzyaMKo/g6CZHnfpaIBI4tdcrsqi74sqaFypi9EWjPk5MCjXh/kzDbH3KuOAXL1IrDa3UsjhWZj/7SDH89DvocHBRUt3ebPuXr2peM9wlCyHlBMOw/j17Lo8zp/SJqKudvmt5NPkHxhWcpSOvafY0MB7lwzT6vxST2KdIop6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=p0kA8oKH; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772311645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GjzkTi2eTl1DSbdR7B9YM2t9btgxa+XI7HMUFcZbvJ8=;
	b=p0kA8oKHfIvc3UHi9pPildv1J/1dXlYpiJdj1JSxwmhNB+YLHPu69PbJNLW9GCV5LqJKY2
	dUtlV1prEWtrak8ucrD3gDkkoxRfHadowT5U04JPSb84Bckk08upj54jMbRyYcFNdrbdy+
	xoSKBn+hTUAtPUXcekid2x3Y191E0PFiQZjTmAQoVkauSe3j6DLBa/THamEQCbBgk9JEW/
	GtC2nm3ps67XqvbKoJO3NAQ0Hr8Aw0UMzoOOoxkb4hUuHA6YazBSwg8ko96f7Nw9f4R2v2
	DyJ15/Jh90rKqghJrg73spOLpNMqE3olmHZwDpqb2TclVGut2goD8ksXSNV4uw==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Martin Botka <martin.botka@somainline.org>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 2/6] dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
Date: Sat, 28 Feb 2026 17:41:28 -0300
Message-ID: <20260228204638.11705-3-val@packett.cool>
In-Reply-To: <20260228204638.11705-1-val@packett.cool>
References: <20260228204638.11705-1-val@packett.cool>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94636-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[packett.cool:+];
	NEURAL_HAM(-0.00)[-0.931];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,packett.cool:mid,packett.cool:dkim,packett.cool:email]
X-Rspamd-Queue-Id: 835E51C8880
X-Rspamd-Action: no action

Add the missing defines for MDSS resets, which are necessary to reset
the display subsystem in order to avoid issues caused by state left over
from the bootloader.

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


