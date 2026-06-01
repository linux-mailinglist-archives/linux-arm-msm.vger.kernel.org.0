Return-Path: <linux-arm-msm+bounces-110646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CAUxNXy5HWrKdAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:55:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCFF622E05
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:55:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 953453046DDA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 16:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5055D3BED37;
	Mon,  1 Jun 2026 16:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uMgY85mO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDC53806D2;
	Mon,  1 Jun 2026 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332854; cv=none; b=T1ISyt6bUUgWJNbtLKZ7qLvKJFc5put/NDtlINsZfi4vPwFmca0Lp4pfw6YBeanHmvNSPsZq+3pQQY0pyiVlL9k2QaME6BMb6wlspxThi/e8hmC2r8tW2JXizFoefqV76ybb0cVsSwjrVxVcirMciFwfhHRDCsNiuznVpEMadIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332854; c=relaxed/simple;
	bh=qOPRaA04OQBwxTfCCBMSrtnzLkctTAwJqxopuRojPL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arUJ4KEmTLyZ/ZU4Oib70SHIXMZl4vPtvsUUv+frDzVpD5QK4clzhGd4X7uUX0iZ/GAGjJfzzzI1+feNoVCDKvose4XFXnKT4rWfQOujlWON4cZRqnIe6QnCID0MUNQz0x2u3oPtzGw3ij80+/PltXcOjUzQlik2h4GVCEKL4CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uMgY85mO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC852C2BCF4;
	Mon,  1 Jun 2026 16:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780332853;
	bh=qOPRaA04OQBwxTfCCBMSrtnzLkctTAwJqxopuRojPL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uMgY85mOo7fhKwElg+CbzVUy23e+TD/tW99iA//Pu4hACwR3uGPdMRMqCtkFozvE8
	 /voJSxtqmJCBPx9cG8nFlaeMGA5WIm607qSwmWlGSLWMqZT4OcA0l/3unlkKg7jnqD
	 2usVuR2FLhCy4VyNrzElry/qiKDaVyUXRZNCko8ErHyXAZYD5q+HXZh6rdndqq2/dR
	 U8H3bGOd4e4OJd4PbUNACMMqr1PSqZH291VRw63eYOFhPj0o5aUPwPyaWUE8FlURnz
	 pc8X02lRIJh5uR/20obFYeoR8oR9JkL3pgUDR5zGQnm7jjkSzCAYa6Nc57nf/qF4bY
	 zzdrzsUboVvoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAA7BCD5BD1;
	Mon,  1 Jun 2026 16:54:13 +0000 (UTC)
From: =?utf-8?q?Pablo_Correa_G=C3=B3mez_via_B4_Relay?= <devnull+pabloyoyoista.postmarketos.org@kernel.org>
Date: Mon, 01 Jun 2026 18:54:02 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: sdm670-google-common: enable
 debug uart
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v3-3-6fdcd669364e@postmarketos.org>
References: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v3-0-6fdcd669364e@postmarketos.org>
In-Reply-To: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v3-0-6fdcd669364e@postmarketos.org>
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
 bh=sDlGpWG4oSXHkFM0Uy4CwwkhUF4Wja0JdBSYWu4Qm+A=;
 b=owEBbQKS/ZANAwAKAXo0JWX/Y195AcsmYgBqHbk0aUupqcJ76Jj+5ygapbtSikJWiSsQHmW6v
 oQ26QNTHEeJAjMEAAEKAB0WIQS9CheUSi6o/ykTCaJ6NCVl/2NfeQUCah25NAAKCRB6NCVl/2Nf
 eZtzD/9rfIOSt0VxsAPVWHYWB1YolQUoA2I8/SH0weLNEC3qcG5ykfhuGI6l019AphyJlV78tJ+
 a/vn2pmnu9HTtFaUPc3jYOREQ64ktBdkfpsyYYLojxjRiu1byfUl8XVoRs9eww7b+HHokHEzKYm
 rt1eYS1LZMEytOlOyzv/end7+pNb0x7+zcPqxw2GvVrs3XpdYOI3Xz5aWqyJTHFRGp0Oap3v0BK
 iAFK1O0CV3QGU6tToafGuRCdgpghYZ+2unAMakhrStnDXS7Gvykc55H6j3DQqM5Kh0ezdFlYBk1
 YUAnEvdEtRZV87Fzu/6DDqv9save7LruZnuybXBCyNLYbG6jbfLzouZk2khDD/22Q+p7toTWtLb
 A26N2N8ElasnnH4srHugLHwoW7wdaxC44kb0UjrZd8i/BLTHbAeR/fFZEs53y+wGEtOQ8jGNtNB
 IsYwmETZ3mDwTJZDE4/qaw3ZC4oQOszJWfPFB9OAbb8wahkP2Npmi+JRfZcJ1O/AaYr4AuYsuKo
 1WeHuOw5MxUhz6by9IWajlm11MC/qUohpvky8JC1VxfDjyPbjDBNKIjZNRn4lmPouiiNMQ5JFin
 juNZeyVp7WHIPPZb98/F1haErtgBWzLdOVtLcnrTPVZGBru33+LbX+S8NiqYfRzPZtQeC/mPu1P
 52WSCokLY7XMDvA==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110646-lists,linux-arm-msm=lfdr.de,pabloyoyoista.postmarketos.org];
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
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[pabloyoyoista@postmarketos.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:replyto,postmarketos.org:mid,postmarketos.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6DCFF622E05
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
index 0f57b915186b..711664c83b5f 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -26,7 +26,9 @@
 /delete-node/ &gpu_mem;
 
 / {
-	aliases { };
+	aliases {
+		serial0 = &uart12;
+	};
 
 	battery: battery {
 		compatible = "simple-battery";
@@ -622,6 +624,16 @@ &qupv3_id_1 {
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
@@ -688,6 +700,10 @@ ts-switch-pins {
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
2.54.0



