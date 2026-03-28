Return-Path: <linux-arm-msm+bounces-100556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFpAA/RayGknkwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 23:49:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9D535023B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 23:49:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A8EC30173A8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 22:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4D137104E;
	Sat, 28 Mar 2026 22:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j9hbxwKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845223254A9;
	Sat, 28 Mar 2026 22:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774738157; cv=none; b=c3UR8ZP0u4Uo1eha2Hpb+B5EVQ7YfPls+Ag9ZMxO1N1pHQfVqxg3kTcRakd7RtBupL+cWJvJZEsE5w0peSRksuuVNENjvLxl/GRQqiQfKkT+GMzDjMiaBH3+drcAExgqsKojAvck+iqaLl7+fptZEBHTLNfEuV+9qKY/UCqLs+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774738157; c=relaxed/simple;
	bh=8xdx2HbnXq6Mh5ZvIUF+ZUXZWo/BQLtnb8f+Cdo6Grc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jtqsHPRM7tTj+/u/TCurCUGc+mHjKWm9XsEdXbrtTr0ntKr2J9SODRKEdK3aBibvkkZClCAWTvzKWIshLDfz4S5Xjb8bnzMZuDDoMqz7+DbUnVebYuIdHKDE/TDAo+qQ7O9N9w4IEoCgDp1EfidRu6FLzvWwn8uPT7mu0sq0gt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j9hbxwKg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E1FDC2BCB0;
	Sat, 28 Mar 2026 22:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774738157;
	bh=8xdx2HbnXq6Mh5ZvIUF+ZUXZWo/BQLtnb8f+Cdo6Grc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=j9hbxwKg5TaP3Oz6ZGQK/AX0yfOfQR2d9uov6V6pLTIC84ff4q5lGXd3thCLWYHma
	 9iqIQhmpqCMsbqZhDIEo2WwU8lOqTNzcgrEcWEqHuF4F6Y5Ieto4IOZAngO/Jq9mlo
	 KKWVR6BCxfgtSDo6A8izJ55DiV+YhXQFJ+d+dM8rQ4MFJbu+vmqrCWS3VIfPxL7b+P
	 pYoq43V13uPJO/jahD81KQ8xGI+e9O7K3Qh0DpwHcX33QGRmuY5hfk2FpnElZWiVES
	 2+G+QEY5qw1ZQAtwn0MXkAG2YirhQ9PiMbBRKrdqm5Oaf5JBgytRjEfd6QC8HZ6RmF
	 vqY7E/yxzAgIw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3427210D148E;
	Sat, 28 Mar 2026 22:49:17 +0000 (UTC)
From: =?utf-8?q?Pablo_Correa_G=C3=B3mez_via_B4_Relay?= <devnull+pabloyoyoista.postmarketos.org@kernel.org>
Date: Sat, 28 Mar 2026 23:49:16 +0100
Subject: [PATCH 3/3] arm64: dts: qcom: sdm670-google-common: enabled debug
 uart
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v1-3-0babf584acdb@postmarketos.org>
References: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v1-0-0babf584acdb@postmarketos.org>
In-Reply-To: <20260328-pabloyoyoista-debug-uart-on-rdacayan-next-v1-0-0babf584acdb@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1252;
 i=pabloyoyoista@postmarketos.org; h=from:subject:message-id;
 bh=VHLwmsN4P772ow9/6v2H4OaVcZPfDAQIcntWKTFdTMc=;
 b=owEBbQKS/ZANAwAKAXo0JWX/Y195AcsmYgBpyFrr6yxaCAZfF6nwPfGCllYi9Uwpe8Sh+kyUo
 03w8ZPL/i6JAjMEAAEKAB0WIQS9CheUSi6o/ykTCaJ6NCVl/2NfeQUCacha6wAKCRB6NCVl/2Nf
 eYD4D/456HqecDssmjPOnvmNqZg4/wivHZJPn0rYiFSBup5h9cqKUEjaG96XACKW8V4Dx0O+EQ0
 77HTYNxLV/FUavEB1a43O5visnvFlCJPyE7QlQXXXx0iVB8VeTxb/DAf5wpqHpYaBch/6wHA8Oe
 TVuhoMbFTB/BPl2k3d4NFVtvjpOAajIALBDWoKm3BKNb1shE7ycZjGMQC5bGz8nV9tiFkL4OKBD
 IIJ7CnaSAhtmuhhmx/USxeIO7nl/HJOXjNunEPTU/lLkKWelyqz2vo7wgPSS20GMdwv9ba2FhGt
 NiUhD6f9W5/Imj8tgOFdpIsn6lsk/9JYyFnBWO67nRUk0a3TQ9bCtR+s7DwDdzzqNmPV7peGpEE
 tVE8Ag9HySn3gfSEDqDukzYE+Q+Pq0HzCCrirzocRjjsC8w/1h88nlXRngajpSmaBOCFPXhhhJK
 CYhYTStCtMXS/2v+c2IRVHmmAJkZeKEoO0Pp7Yp0lCHdSmy6nZOE1ng/NgBGUvu9e1ivZTCrwU3
 z7SIeAfOEx4RSaaEliNRNw+Pq1QgjPJR2zd0rL5LinBQXOMqJ5A9CrcIyqttbQEhBIaYApVEnNk
 BTsWshEXSM35BI1xBleJuvWU3cXKO8h9GxEsjw0r7gf6SJT9PEt3Pldk82ohP9y5Fa7+ov17hBS
 LNsKUYn/XKfxXxw==
X-Developer-Key: i=pabloyoyoista@postmarketos.org; a=openpgp;
 fpr=BD0A17944A2EA8FF291309A27A342565FF635F79
X-Endpoint-Received: by B4 Relay for pabloyoyoista@postmarketos.org/default
 with auth_id=698
X-Original-From: =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>
Reply-To: pabloyoyoista@postmarketos.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100556-lists,linux-arm-msm=lfdr.de,pabloyoyoista.postmarketos.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.sr.ht,postmarketos.org];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[pabloyoyoista@postmarketos.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:email,postmarketos.org:replyto,postmarketos.org:mid]
X-Rspamd-Queue-Id: 6A9D535023B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>

This has been tested on the Pixel 3a with USB Cereal board

Depends on
https://lore.kernel.org/all/20260310002606.16413-5-mailingradian@gmail.com/

Signed-off-by: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 32dce1cfdf6f..e8bd5f3861e4 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -27,7 +27,9 @@
 /delete-node/ &gpu_mem;
 
 / {
-	aliases { };
+	aliases {
+		serial0 = &uart12;
+	};
 
 	battery: battery {
 		compatible = "simple-battery";
@@ -683,6 +685,16 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qup_uart12_rx {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
+&qup_uart12_tx {
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &sdhc_1 {
 	supports-cqe;
 	mmc-hs200-1_8v;
@@ -749,6 +761,10 @@ ts-switch-pins {
 	};
 };
 
+&uart12 {
+	status = "okay";
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l1b_0p925>;
 	vdda-pll-supply = <&vreg_l10a_1p8>;

-- 
2.53.0



