Return-Path: <linux-arm-msm+bounces-97719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNtpMcrdtmlMJwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 17:26:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B629291671
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 17:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FDEC300C03D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 16:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C924372EE8;
	Sun, 15 Mar 2026 16:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="pWeNRe/v";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="lHfOVred"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3C52F2914;
	Sun, 15 Mar 2026 16:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773592001; cv=none; b=MMeAGgUykB8UxfOctDM16rGP8OcNzA+eub2ES/Cr3r+1yGUkWgZaudzvGq9IMyKr5V7TVPUdUzVys5YUpS6/lWXzC3ekU836D9FV/D1aoCs7rxMRQkJgO9MyNFncJA+Wn/CcFeyhtcm0AtNKC/tviLreAAvUlfYTJwwtP6RjABs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773592001; c=relaxed/simple;
	bh=rIvMLM3QhOkRWka2LjBZdqA8Vls7l42V9OAFy0VFsUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CRDkPUDOccWC+2JnnsB8BzQ9Af1xQnFZq4SHFWmMJNO+YKaxhGlbqUi9Po0G/hEtHg2kkbPnBPhUXamn4ArRfqHCER9jAGegsTw9/EJ1DPlDy+R+fVPD2B1i4ESacfYqDdrrUlXjKG9iND+ZlGfqcjyfg4jGwTKrXYyl0vFt4Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=pWeNRe/v; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=lHfOVred; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773591985; bh=IOuUqF1xVNBeTgp+udPGJtI
	usAfDxF3I4S3OS3Dua3I=; b=pWeNRe/vznvjPfoHDk4Us+3cgyrxDP5rGDzc0WAdB/593qKaNG
	NSbFzvlkI6ULkaxyd2qMrT+AKID/pAXphnlYILnwQaPe3+hXCo7X8Oxpm6E7bXORWlRx5IwFCMz
	HhSmJJJGveBaImjNtIU8I1UTYj/MnbgTIX/FRAsxznSDTWKdxI4GRmKTJ8FVJRKZlFBjdYP/P5Y
	CukZTja6k6IOM56uvgofC5b4Bh0pnRVlGynoZZt1sc4SDasSdJ8Jaj7DPfjjJTUVr63SPDWZlVM
	u2V/nJg4gvDsec3NacPEsVO3WjYzbfE0xAuZxyr2KMn4sDEsramhcTU0emVXSqVpVnA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773591985; bh=IOuUqF1xVNBeTgp+udPGJtI
	usAfDxF3I4S3OS3Dua3I=; b=lHfOVred7eUp1Hm/m9OISmR+R+3evJdT/9t1hhofP5ZrQYt1To
	rQ36MWxOOnZmjSbFaqsixJGgrC+koKmoeFCQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sun, 15 Mar 2026 17:26:21 +0100
Subject: [PATCH v3 3/6] arm64: dts: qcom: msm8917-xiaomi-wingtech: Add
 goodix touch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260315-riva-common-v3-3-897f130786ed@mainlining.org>
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
In-Reply-To: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773591982; l=1255;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=rIvMLM3QhOkRWka2LjBZdqA8Vls7l42V9OAFy0VFsUQ=;
 b=7JWUTg02Xj0tCu1okIipCekGa5IiN31p0DdmDDzLcaKfy9QeQDTOTqXsqgaO4Zqwbz8FYL+bT
 xkWrF/c2baPB/nf5VfDIIjNYF/HV0IGmxglkEBTjmYtXYS5BVavVFPj
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Spamd-Result: default: False [0.28 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.94)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97719-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,5d:email,0.0.0.38:email]
X-Rspamd-Queue-Id: 6B629291671
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There are variants from MSM8917 wingtech xiaomis what
are using goodix touch controller instead of focaltech.
Add goodix node for make it able to use touch on all
variants.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
index 714e75de014b..69eda5f42c06 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
@@ -102,6 +102,22 @@ edt_ft5306: touchscreen@38 {
 
 		status = "disabled";
 	};
+
+	goodix_gt911: touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
+		irq-gpios = <&tlmm 65 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&tsp_int_rst_default>;
+		pinctrl-names = "default";
+		AVDD28-supply = <&pm8937_l10>;
+		VDDIO-supply = <&pm8937_l5>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+
+		status = "disabled";
+	};
 };
 
 &pm8937_gpios {

-- 
2.53.0


