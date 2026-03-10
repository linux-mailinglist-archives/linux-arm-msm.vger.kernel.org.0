Return-Path: <linux-arm-msm+bounces-96742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CI3VCP5TsGmBiAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 18:25:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC0F255857
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 18:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B24F31E4E72
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 17:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBBF3D3CE6;
	Tue, 10 Mar 2026 17:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="GthlHSWO";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="yWypC0I3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED7F3D47A8;
	Tue, 10 Mar 2026 17:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773163319; cv=none; b=lBfGeF9gBEax/7C30nC126AkAg5UdNB5I+hz0lYLOmeBLl1BCXFMsVKH5kMpcbJFp0C+ctIxnK5rH9NFJ2f5OoeN1VGXE09WnXlB4HUvHmFN0isQVUG+68FQiBRPGrO4EoDqVcd3Qr4EnYOevE6EkECJ9wtnjAoznn+cF0O/UQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773163319; c=relaxed/simple;
	bh=75yNgpTHSdpm51SewqQekfba4A1BwnpCkCriUhft+N4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dK9etJDVL7VeCxQZ2q5aw7qVe/X/6VN1/0bCJBi+KCEx2TFYIbi5v5sDYO54c9JAbhu4i8QwXcjagoWjhNPN3zCLB3hAC/qAGuaKGD60tlO6VtHIwP6YoTkv9pXhqvGTvE71JuhKX15bz9AmxpHzIXueJadzEKjyDCBXzg24fdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=GthlHSWO; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=yWypC0I3; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773163298; bh=unW/x7bYldACcXG/1yX5V7Z
	PJEXf3/Jt8Q4d6JlztnA=; b=GthlHSWOdh94NS8a1B9KdE1n0goNgBrWzblAk+B29Imcm8xhkQ
	Z9KxZo2qqpShsZXEpiGcX/SK4PWDpYpjweAnV0Uau+jokyEEFpyXpaZY6Ik408P5mD2M/RI77FR
	PnmuqZAZRqePcRlYvwJ43QXJcGLZ9zwg4X1JbTILVvXCxoXmZqIRFUnYGEXk44KdP0SPVBlRl3j
	xvg1Kfjma3+fkuXH12PB0SkbnB5ubulue6BF6PdoMd9218sniozklVDgLhNm9CYx2mHSFVb+gy1
	VaAVbGXbjPk2ORWDbMgl16ENBB7UWB85zurTaDAWtgIdOrQxnVvFdL+1sZb+oubjL4Q==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1773163298; bh=unW/x7bYldACcXG/1yX5V7Z
	PJEXf3/Jt8Q4d6JlztnA=; b=yWypC0I35boDmGp0+kpvz1QnBpto7hmz/1vRYL/Y48EJp244D/
	A2q+3uOdvY+eIm0byP2eogjOcP5Y0TcrIoBQ==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Tue, 10 Mar 2026 18:21:33 +0100
Subject: [PATCH v2 3/7] arm64: dts: qcom: msm8917-xiaomi-wingtech: Add
 goodix touch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260310-riva-common-v2-3-3bfc23996857@mainlining.org>
References: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
In-Reply-To: <20260310-riva-common-v2-0-3bfc23996857@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773163296; l=1255;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=75yNgpTHSdpm51SewqQekfba4A1BwnpCkCriUhft+N4=;
 b=+uoHo2iFKaiK9HOu6Vqnx+ELL6nC19qbp0grqxJyKZO+EEAuhYXJu7xfSN982CpUbnFu/AOfz
 3V3DRxRKqkoA0IyF4CYAqQ+zZBQqngNX1iUPGZvpXIU+MLxajY9qnGC
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Queue-Id: 9CC0F255857
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.28 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.94)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96742-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.38:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid,5d:email]
X-Rspamd-Action: no action

There are variants from MSM8917 wingtech xiaomis what
are using goodix touch controller instead of focaltech.
Add goodix node for make it able to use touch on all
variants.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
index f0a534106e11..50868c679693 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
@@ -104,6 +104,22 @@ edt_ft5306: touchscreen@38 {
 
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


