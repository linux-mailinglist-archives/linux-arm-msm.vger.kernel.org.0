Return-Path: <linux-arm-msm+bounces-100451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHBEH6/lxmnrPwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:16:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6EF34AC30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC72531208C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295FF3921D9;
	Fri, 27 Mar 2026 20:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="KvI6xrBs";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="9g/tiwcO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940FD39150E;
	Fri, 27 Mar 2026 20:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642319; cv=none; b=qGPBdvgNF75km/QUM/o+zmsAN92gnDAbpbjC1Dju4bnCMgQGbbY3pXAMA3hQsY0WxmcFMbEKfQDrQLvE1fzFDKTtVLMfdSjzqLxnpR/QXqmi2kj7GPuxUWH58tMwqj1S4Fm29FennkjpT97nOWOQ/bsi3tDdLvRqFGthwY4bXtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642319; c=relaxed/simple;
	bh=3/njRjwhG4Ct/p6dBBAtVoOUciH+fP/WorRY4spR0d0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OcRjQOfMEhRy2cmnHJCaRQaYkrW+qt+lrK2qF+P/Pwg6gsLAfyYhmnzEYooASlv7jXyHJqKcTqJRk1ij70Lql2jMmRkTVPsKtJKgFKQHUOiVgn4iPypPfS5xrUOtgJgc5UqhK/TE058B2F0bi4LOGIPIrG07SR5H4eABSMqTalc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=KvI6xrBs; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=9g/tiwcO; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1774642308; bh=/qIEMELzEmJ0FxXnAa5WEeJ
	OLYn4btiJ6JhNZhpX8Yg=; b=KvI6xrBsm7LzC1tdNz3ab8UrEAgYrdxqdBLRCPOs7/ctFw2CI8
	s4d58sfvC4VEukXVMLx6HlH80ygM0fzRN2q5Xh63XM7OO3JftpTR4kQtRl8TX1hLYm0ozRrN+Bb
	7hRlH8f3PzLop9RZMnh9FfyAL/OWGqWIcgbL8mAWM844eosf9OibIuzZhX/wmCxDD9+KH+yUrwL
	eID9nYqkNDKC9R41DhXg81lPrBOAsVrxPOALb14bpiIK1bGhqZdrz3kvUD3ansEN3RWHGUBaxiA
	qEwJa300t8/92sZgZ1rASxQfb+0FKAb/sqkjMNIBaF/0qWqfyv1WajcIM5fgi7XH/mw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1774642308; bh=/qIEMELzEmJ0FxXnAa5WEeJ
	OLYn4btiJ6JhNZhpX8Yg=; b=9g/tiwcOln6jeTOSavxpyfVtqqYnck6qpjh+l54IZNjJI3zw7u
	TN166ZigvB+E62SXP1+dqoesr0qnFho54BAQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Fri, 27 Mar 2026 21:11:43 +0100
Subject: [PATCH 1/7] dt-bindings: power: qcom-rpmpd: Split MSM8953 and
 SDM632
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260327-sdm632-rpmpd-v1-1-6098dc997d66@mainlining.org>
References: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
In-Reply-To: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774642307; l=2253;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=3/njRjwhG4Ct/p6dBBAtVoOUciH+fP/WorRY4spR0d0=;
 b=btemSGHr/Y+5B4kikJdwS643w8z7fpHxsxUp2W++ieEoHS6qJBbAkx/TRziCe6NxBL/qogW22
 5ECECYX38NsAYtjGih5+uD+8Kaj9ABPgEuWYkQ7elx7NvrXqOiXmmqK
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100451-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid]
X-Rspamd-Queue-Id: 3E6EF34AC30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove modem related bindings from MSM8953 rpmpd because MSM8953 MSS
is using mss-supply as a regulator usually it is pm8953_s1.
Split SDM632 bindings from MSM8953 because SDM632 is using mss-supply
as a pm domain.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../devicetree/bindings/power/qcom,rpmpd.yaml        |  1 +
 include/dt-bindings/power/qcom-rpmpd.h               | 20 +++++++++++++-------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 8174ceeab572..659936d6a46e 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -48,6 +48,7 @@ properties:
           - qcom,sc7280-rpmhpd
           - qcom,sc8180x-rpmhpd
           - qcom,sc8280xp-rpmhpd
+          - qcom,sdm632-rpmpd
           - qcom,sdm660-rpmpd
           - qcom,sdm670-rpmhpd
           - qcom,sdm845-rpmhpd
diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index 4371ac941f29..2d82434b993c 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -84,13 +84,11 @@
 #define QM215_VDDMX_AO		MSM8917_VDDMX_AO
 
 /* MSM8953 Power Domain Indexes */
-#define MSM8953_VDDMD		0
-#define MSM8953_VDDMD_AO	1
-#define MSM8953_VDDCX		2
-#define MSM8953_VDDCX_AO	3
-#define MSM8953_VDDCX_VFL	4
-#define MSM8953_VDDMX		5
-#define MSM8953_VDDMX_AO	6
+#define MSM8953_VDDCX		RPMPD_VDDCX
+#define MSM8953_VDDCX_AO	RPMPD_VDDCX_AO
+#define MSM8953_VDDCX_VFL	RPMPD_VDDCX_VFL
+#define MSM8953_VDDMX		RPMPD_VDDMX
+#define MSM8953_VDDMX_AO	RPMPD_VDDMX_AO
 
 /* MSM8974 Power Domain Indexes */
 #define MSM8974_VDDCX		0
@@ -156,6 +154,14 @@
 #define QCS404_LPIMX		5
 #define QCS404_LPIMX_VFL	6
 
+/* SDM632 Power Domain Indexes */
+#define SDM632_VDDMD		0
+#define SDM632_VDDCX		1
+#define SDM632_VDDCX_AO		2
+#define SDM632_VDDCX_VFL	3
+#define SDM632_VDDMX		4
+#define SDM632_VDDMX_AO		5
+
 /* SDM660 Power Domains */
 #define SDM660_VDDCX		RPMPD_VDDCX
 #define SDM660_VDDCX_AO		RPMPD_VDDCX_AO

-- 
2.53.0


