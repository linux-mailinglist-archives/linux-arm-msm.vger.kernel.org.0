Return-Path: <linux-arm-msm+bounces-92792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2D+TBOAwj2mhLwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:10:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E51136F3B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4853D3147292
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C7D3612D1;
	Fri, 13 Feb 2026 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="SgLXUf4y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0DA35F8DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770991406; cv=none; b=lqbE9t/JK7RR4bZmje+TU01OxT7E0lMD+0TWT/TNdXS3Q2TYbql+yslh4YcpIgKnG7Ix3QA3CwAx3hWOOqOF6tX5u3eJzB9x9dZPABwJc52OJiitzBrFNUQ15Gz2mkRy7AJ5YVDUAvLJlsv2fSigzGClZJHmJRtOIcD7r5w2+to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770991406; c=relaxed/simple;
	bh=qvo65LanDuFCYnaQEMETeuJDl8/hedGAhke9jmb4ij0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mf0rkOq5ZXDnYlBaqP2wswneAVEVQTWuSY8pT54ggO+sntKfpZPdaO8Rsuu/3LNGypwB4lqtov2i8zVqzcg+oxO5lnubRHuIDnwQsTsCYCUNfblTzbChMMQg9/hKCuXFxRRDseiTZ8Gca3R0UG8/3SHaP7zv5GfbUVx0THrj0J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=SgLXUf4y; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6597a7bd7d6so1344461a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770991404; x=1771596204; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9NrnMRzX4XXiYKxcnmtwGCiL15AjGDqwpnUtoWnjVhk=;
        b=SgLXUf4ymhs96XROJHIlGuHf89cyWwEcctsoZMvcp0fsqWnW//EbbL7rKrVm4UlANz
         4AWOZ9JgFSTXNLKxfA60JFB0sQChipSSnbyjf9gvfcHaoYHNhlCfC9eiAO6x9IP97QA5
         H8kwDVoyVj42GyRP8zOXS7vqqKXSEHSEYSNw+uOKWO8WTuHiFAbGSaeAg0Jq4CfEoeXY
         4uM1DXStrNLLcFq2EI6fIY05a1WS6lh8uhYFImdUImd9lnsn6Z+X07hd0lTcE1rtowiy
         Rnh0OmMUVoqVOMsyVFfBM8JsKL1Uvq6USvwFm8XV5icFyORWJtNrrP6F3XTEuVZmqFXF
         ARZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770991404; x=1771596204;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NrnMRzX4XXiYKxcnmtwGCiL15AjGDqwpnUtoWnjVhk=;
        b=NUubf473lca5P1aWd0kbkW7Ag1n9HV5Sp4QBrxBVD4eojvgaQQlEiXxC1vCLhQIV4t
         Sk5aZ5QsH11/4Ff/3uUCTK11IoRqkktQ2fJ0FpVzlzjajvo+xUTk5LIBp69QMn+n0NbZ
         5AYt4O0OY9BWEGpOVBpCLekLwUeH9KyD1JUkYl76z/tqd+xKImdI4It0L42tpvATDi5b
         UCxYdVaPym4UydVv+Nic6fiidsor4kxT11yXxoAre9SgOA6zmRjOgMiLIyjpDuOxSlkm
         evw2dZwVHvhswp3j02SSGSPEJo+2YoBvjTUfwHWe/LIexNjUEkyDdguxhIB0loMnSU03
         M2jw==
X-Forwarded-Encrypted: i=1; AJvYcCXIc3VBZiIeds4Cn+tsBuIm0CH2HcVPdtNUZ+Kl/ylb7Y653B/qhNI2ChvUXt7Ydnm0+LgkmZakY9Yh5Hvk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7DDp14OsppwX9cQaEPw/eggEIXX4+0n5HedrEA+QnsUiE8J8f
	CgGpTFoVVErUkSg5+xIvU1jy2jsBDGA5lngGYbkyZmlE9m7YrTl4IxsNAAiz/uA8cvQ=
X-Gm-Gg: AZuq6aKih00m+nfjTn3jFeG8nL6/M+NyjjzFaPE/o2bZ/HKwJg3vJxBtTCfeb5rjKxO
	NhVLKkCYqJKoSsCrkYtk8BeTI0x2okbAEbd/PkkRgrURbRepchwr6T7/Uy1iXC581fwv5yroAgq
	bPVppRhmbFxLkktnuRwU69Q1h0OBRKHuMFLhQBr05Y6q+IQ9JrSEej902gyGuxY8692At01k0It
	txdh6JILAwBJ/I+lN/O3NvrmG2POvPlREZuguOaX1u76IGphLIi0mhlZW0A3wV5t8YZ5HBIrvLz
	8nVwNAZ87NYxbP6wTRlDztPLR7jwrRxDfxrs0/twZ2yCBIhX6RuwzmYr9agDG3ccmJvrW8gOJW9
	QFEM8hTM+PlMIq1IeLNXTrquxqZlGAM4At1ePyQPE2A1WZaK97w3crVG415h5op0zaelpQt2Fmj
	LyXkEvnL8/Kl5B0rjBVzcgNKBVUx1OGTNRiKCfs2ho3aogo7k3jVssfyAnEOn+9wzj8XSv+2UAm
	LK5
X-Received: by 2002:a05:6402:2346:b0:659:5c6b:d280 with SMTP id 4fb4d7f45d1cf-65bb115f66amr1018995a12.10.1770991403813;
        Fri, 13 Feb 2026 06:03:23 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19be01sm707871a12.3.2026.02.13.06.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:03:23 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 13 Feb 2026 15:03:19 +0100
Subject: [PATCH] arm64: dts: qcom: milos: Sort pinctrl subnodes by pins
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-milos-pinctrl-sort-v1-1-799bae597074@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MQQrCMBCF4auUWTuQROyiV5Eu0mSqA01SZ6IUS
 u9usC7/B+/bQUmYFIZuB6EPK5fcwl46CE+fH4QcW4MzrjfOXjHxUhRXzqHKglqkou0pmjlON08
 R2nEVmnn7offxbKHXu9n1HGHyShhKSlyHLtNW8e87GI/jC9lSTRqVAAAA
X-Change-ID: 20260213-milos-pinctrl-sort-16ed0fdb5aed
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770991402; l=2900;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=qvo65LanDuFCYnaQEMETeuJDl8/hedGAhke9jmb4ij0=;
 b=CZBNY190SsVciKMMaB0LgDyiYrPLUhYHCWmPpxFYJydne8wUcptpquNJ8SNjVryR8dx6hHrWi
 gspQjrVZmTeAhd6arReTleNLWH5C4PgXZb0T30ziCk9onILE4tdywtT
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92792-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 69E51136F3B
X-Rspamd-Action: no action

As documented in the "Devicetree Sources (DTS) Coding Style" document,
pinctrl subnodes should be sorted by the pins property. Do this once for
milos.dtsi so that future additions can be added at the right places.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 54 ++++++++++++++++++-------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index e1a51d43943f..bd9a11ea703d 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1667,6 +1667,21 @@ tlmm: pinctrl@f100000 {
 
 			wakeup-parent = <&pdc>;
 
+			qup_spi0_data_clk: qup-spi0-data-clk-state {
+				/* MISO, MOSI, CLK */
+				pins = "gpio0", "gpio1", "gpio2";
+				function = "qup0_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
+			qup_spi0_cs: qup-spi0-cs-state {
+				pins = "gpio3";
+				function = "qup0_se0";
+				drive-strength = <6>;
+				bias-disable;
+			};
+
 			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio4", "gpio5";
@@ -1683,29 +1698,6 @@ qup_i2c3_data_clk: qup-i2c3-data-clk-state {
 				bias-pull-up = <2200>;
 			};
 
-			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
-				/* SDA, SCL */
-				pins = "gpio32", "gpio33";
-				function = "qup1_se0";
-				drive-strength = <2>;
-				bias-pull-up;
-			};
-
-			qup_spi0_cs: qup-spi0-cs-state {
-				pins = "gpio3";
-				function = "qup0_se0";
-				drive-strength = <6>;
-				bias-disable;
-			};
-
-			qup_spi0_data_clk: qup-spi0-data-clk-state {
-				/* MISO, MOSI, CLK */
-				pins = "gpio0", "gpio1", "gpio2";
-				function = "qup0_se0";
-				drive-strength = <6>;
-				bias-disable;
-			};
-
 			qup_uart5_default: qup-uart5-default-state {
 				/* TX, RX */
 				pins = "gpio25", "gpio26";
@@ -1714,10 +1706,10 @@ qup_uart5_default: qup-uart5-default-state {
 				bias-disable;
 			};
 
-			qup_uart11_default: qup-uart11-default-state {
-				/* TX, RX */
-				pins = "gpio50", "gpio51";
-				function = "qup1_se4";
+			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
+				/* SDA, SCL */
+				pins = "gpio32", "gpio33";
+				function = "qup1_se0";
 				drive-strength = <2>;
 				bias-pull-up;
 			};
@@ -1730,6 +1722,14 @@ qup_uart11_cts_rts: qup-uart11-cts-rts-state {
 				bias-pull-down;
 			};
 
+			qup_uart11_default: qup-uart11-default-state {
+				/* TX, RX */
+				pins = "gpio50", "gpio51";
+				function = "qup1_se4";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			sdc2_default: sdc2-default-state {
 				clk-pins {
 					pins = "gpio62";

---
base-commit: 3daf23347bb5f4a375d0101ed29c97ce1a99721b
change-id: 20260213-milos-pinctrl-sort-16ed0fdb5aed

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


