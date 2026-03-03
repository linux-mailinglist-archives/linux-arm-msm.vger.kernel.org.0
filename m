Return-Path: <linux-arm-msm+bounces-95037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFY8FlhapmnMOQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 04:49:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AFB1E88E5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 04:49:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B90F30721A7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 03:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1527B37DE89;
	Tue,  3 Mar 2026 03:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="E7Kmu9yX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCE9374E53
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 03:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772509761; cv=none; b=hwFXkgDhjxnKKX/ywuM1vr7q5r1XqvDUNo9B0dtooUdAiGkp6cx54+Rfxbo0GUl3iMLLzOa7sKAUoIflgs48laWEep1vp3RFmeuP8rnt54Dm7PBkO4quuKI0ITCqXtnZNJgDWYS5I1imIQLyPvZckDPN8R0GRWmZBvAZgtsznmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772509761; c=relaxed/simple;
	bh=PihsNO0K+58AmyOvT+8NT63epKHoVK+kCgGzUQhRDgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bcmbk0ilpapAAvFCFI263Z4aRHONz04XwhIukdoV7pRFyNw293o8EYquzfJkvvnaJUNTD7mt6pMppi9FhOnrA5TS2QMJ3b9LW80nmGWHivBda4gLIVvIscyRue/5nOjKpOO+AycrhH7jPfNUHEEWmOrxrddSXEyg8XjVD923bkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=E7Kmu9yX; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1772509757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jsfisfPitjxmyl+3oICy+Pnnbsp+I1m60qBMNOzfFBM=;
	b=E7Kmu9yXP8JO+NWJaYd/kWZnUOVdnJxlWLlP8p0dYkWghZucboiCEzUh6hc/UzHdrx2HuS
	XAObRZe3Mh7ihE4SNo0gQgX++4+GgfIoq6OcHfeTXmf3LeglYJAiBH7rhCGVw+ZnMvrBsV
	HjvUEF640qRlbTsSf1e8XpVZxnO7fcwEOX+V0bhu6HvsCfIQqwQ70+McsDqdDKscZt68Lg
	8MS9WpYFu38NeOmIXgpXE+arWWJol0x9miyD+glk8xZb/R2sr3oyiteIgz+U4EqztOF17i
	gQsWIO3fWPECs8CzdBCtwhERTdOmKYxUPOsLLUMpgmiwsccetsQnM6ks0WXigw==
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
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/6] dt-bindings: clock: qcom,sm6115-dispcc: Define MDSS resets
Date: Tue,  3 Mar 2026 00:41:20 -0300
Message-ID: <20260303034847.13870-2-val@packett.cool>
In-Reply-To: <20260303034847.13870-1-val@packett.cool>
References: <20260303034847.13870-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: B4AFB1E88E5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[packett.cool,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95037-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add the missing defines for MDSS resets, which are necessary to reset
the display subsystem in order to avoid issues caused by state left over
from the bootloader.

While here, align comment style with other SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


