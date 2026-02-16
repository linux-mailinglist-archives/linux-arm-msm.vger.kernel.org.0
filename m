Return-Path: <linux-arm-msm+bounces-93018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ58Enyqk2lV7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:38:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B70F1481C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 381A4301B148
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 23:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688D01F7569;
	Mon, 16 Feb 2026 23:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Dk+62Vat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0112144D7
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 23:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771285106; cv=none; b=sR2j1ayCa/rIjes4wzrUXz8Arfnk9vjmH1O6b1ow73WdzzzuB1BEp0Vfia0Dg4TrztYqDTOzU/pI9T09YWBPewmAxN1kDwuaVi51hBU/xD2BgL9MFsQRaBa0eKlrZ+2wo4U4l6weHGcp8zL5p81zp+X8RvreCoA3mp7YGrOPCdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771285106; c=relaxed/simple;
	bh=kCuopfLu7Oi0EzM4wixJtyFkRBVwm7HLABObJtpowC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=brdDRQDQhvtnV8u0kOA/iyKG/6q6pH9c+z5+t1whI/Y2RXQz+ZEHD41WI9ZRh1Fp8augRFh1zbbAlfgmOkyfCzcOv2YJ8Pggjdptf0DnpN+ig6HRUc6kQTZ8XL3EaN7Tfc7h8nJa2MX2IWzgknIspJjqAuGoBSZEo/zFsCtWe1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Dk+62Vat; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771285102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NWnN6+c5xsBb3tOefcLzO1lu0M8RbBtdH+rnfm5Rppk=;
	b=Dk+62VatWm82DrmIg6ZI12X5VxYgb087vuPYvLrZSrcT5plDzZLXdtJJQi20LKPASPxzqi
	WdwmO0UWXPCzX7G8v08Lr05w/ha9vlA9lVAlDCeTyZDLSYMctyL5GMFO18ahJat6WjOAjp
	UkwoXxjSWcx/hjsjisTCTHj4vNGZFUMAPqZ4sRtjmHrWeRWmshmtaeCVYgrBOVlscAKfKJ
	sAs0IS1584FoeWW9rkCgrbUs6lmkmfL3AcshcMGSh6y+PsLtBc9iwN1v27lE10QzWkSoB1
	kX+R11gbHb2fJyjtelxChxRmMDxcdqEBTtm5C3bzpHJIm+QHXrjauBuQoT0lUA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adam Skladowski <a39.skl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Val Packett <val@packett.cool>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: clock: qcom,sm6115-dispcc: Define MDSS resets
Date: Mon, 16 Feb 2026 20:25:19 -0300
Message-ID: <20260216233600.13098-3-val@packett.cool>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93018-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[packett.cool:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B70F1481C3
X-Rspamd-Action: no action

Add the missing defines for MDSS resets.
While here, align comment style with other SoCs.

Fixes: 38557c6fc077 ("dt-bindings: clock: add QCOM SM6115 display clock bindings")
Signed-off-by: Val Packett <val@packett.cool>
---
 include/dt-bindings/clock/qcom,sm6115-dispcc.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/clock/qcom,sm6115-dispcc.h b/include/dt-bindings/clock/qcom,sm6115-dispcc.h
index d1a6c45b5029..ab8d312ade37 100644
--- a/include/dt-bindings/clock/qcom,sm6115-dispcc.h
+++ b/include/dt-bindings/clock/qcom,sm6115-dispcc.h
@@ -6,7 +6,7 @@
 #ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM6115_H
 #define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM6115_H
 
-/* DISP_CC clocks */
+/* Clocks */
 #define DISP_CC_PLL0			0
 #define DISP_CC_PLL0_OUT_MAIN		1
 #define DISP_CC_MDSS_AHB_CLK		2
@@ -30,7 +30,10 @@
 #define DISP_CC_SLEEP_CLK		20
 #define DISP_CC_SLEEP_CLK_SRC		21
 
-/* DISP_CC GDSCR */
+/* Resets */
+#define DISP_CC_MDSS_CORE_BCR			0
+
+/* GDSCs */
 #define MDSS_GDSC			0
 
 #endif
-- 
2.52.0


