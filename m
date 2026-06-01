Return-Path: <linux-arm-msm+bounces-110649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHmXF1a6HWoidQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:59:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CC95C622ED7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 18:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22E57302F43B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 16:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8869E399CFD;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PUQxRjRU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FAF36A023;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332950; cv=none; b=TV76HftRF5jXZaKBEK77aMp5VsdYll48+lfWcB8h1yXIB1JkbHknGbw2dxziCeuVJVBhqDH0xpWA0rtjEN1jWcQrJAFRzoA91+7K17CUxrPVk6NdV0LvhHX7W7sfCfSUz8wNXdLhfr337PK4cZyagNdlHv4aaOfmfvMEG25fY4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332950; c=relaxed/simple;
	bh=pcXsxP4PYk7iPgPnNq3O7JW++OaxXAlshcFnAw5oheo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eblvOhqdSEwh3kEGnvW91N8A1ZWXVIubojXAo4szvBohsQfUiqLU7h0559RlAeOmfIe/BaWvgETeu4dThG/VOHJZ723nGTpjW6qyzav+U9zxWzoOAP6OP0/tIuwo0Yr8Z3viZbdpP9ec6eKOfUZ4VwLR2iWSBHlL9A/liGaSHUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PUQxRjRU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3692AC2BCFA;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780332950;
	bh=pcXsxP4PYk7iPgPnNq3O7JW++OaxXAlshcFnAw5oheo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PUQxRjRUbtKJEFEtB6XHk5ZdpFNUU8CMFl9pHFec9+UhFp064Nq/NkfPb0SZTRsau
	 w5seO8DS/mpYv5fpYslZAKRT5yVk58ofTDDkuMGLT2KZelcFAV+tgrBF6h2bmB6DbC
	 LyMoltDsm0KPsuU4fRSm2Inros3q+RzG/j66uGICWRbmcJT7LXP5ACRlB8Eurg9r4M
	 JYAM1fWWC7u8AhvNnyYSeJe8VaEotkT5zNecaHrA9OtudjHCkOkjaIBQqXo0o6klOy
	 pxfeXV1tlg8xvE66z4xcHKeNy241yrOtyDE/+eytG1p7HmY+W6k6RkgD+OQ+KevdBb
	 OgrEOkHElScNw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E18ECD6E5D;
	Mon,  1 Jun 2026 16:55:50 +0000 (UTC)
From: =?utf-8?q?Pablo_Correa_G=C3=B3mez_via_B4_Relay?= <devnull+pabloyoyoista.postmarketos.org@kernel.org>
Date: Mon, 01 Jun 2026 18:55:38 +0200
Subject: [PATCH v4 3/3] arm64: dts: qcom: sdm670-google-common: enable
 debug uart
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-3-c5d51dd96ca0@postmarketos.org>
References: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-0-c5d51dd96ca0@postmarketos.org>
In-Reply-To: <20260601-pabloyoyoista-debug-uart-on-rdacayan-next-v4-0-c5d51dd96ca0@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Richard Acayan <mailingradian@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Pablo_Correa_G=C3=B3mez?= <pabloyoyoista@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1380;
 i=pabloyoyoista@postmarketos.org; h=from:subject:message-id;
 bh=4SCoeppOpCMNCW9QJaC0akZ1S9kuDZvEwTxAmO1MfSw=;
 b=owEBbQKS/ZANAwAKAXo0JWX/Y195AcsmYgBqHbmU3k/6IGECCjmflfHZE/w7gi0Do/A89M1wk
 X0BiEzlKV6JAjMEAAEKAB0WIQS9CheUSi6o/ykTCaJ6NCVl/2NfeQUCah25lAAKCRB6NCVl/2Nf
 eQWQD/4r65jyRvzbZVAsy2CIKafE6k1sNmU1l4dLeOIQvK1OftMoxYlTT3xFcSdretQVlpuW8vJ
 fOUY/6IZRLc+5FI/sycKyxURLi1qb9mIdkI5+QxIJULzlreZEn9ZHspZZ077IK1zlsajYBDYbkB
 9fvvcH+QZAx/WE3gWELmV2ZCLIsSYV+vFdGfGrYnRkjuKUaAps9Y5yT7kyUmJZGuFdfbud0Dl0G
 XT0X8PlX7eg1L7x9oS8OJjGI8wvYGGOOiIvC+SkpHFfc/kgyPifAvdQ4DfWsgLByWt64D+I/Ktu
 39FksOmDglSb3q1lhJ70QbIZcTGRIHafT9BiYtG7V3riJoGY2yLJpoEHP1P5rZWjEodqItWgUdE
 al1IYpJE6wXYidEZols4gODJTGUfZvvgFi6G02R8trJTSDwWnQxi+wxnsIm00b9+4cQPNcpDoP6
 VYaqbjzg0Ac7WJ+ARV1PHmNmW40LqdHYKKIJHrOj0jn0sAOMoJe4o+YtbEfEmd3SxPPfnmQQnzc
 HBSZABfwEX6CrE+/5YlMuCskEoWz6lKRM21/wjqJ9p6RiU45W02VH7pKspW1Er13ld2Xb7+0Nf+
 C6jODEuPcWVrs5FjqQP0/aIwM8s/ah59JhVSaTXXQuLH+L/R8zs2YuO7yWPvID7UhMvncJUXzBQ
 LEthcwKJ9DcO9SA==
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110649-lists,linux-arm-msm=lfdr.de,pabloyoyoista.postmarketos.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.sr.ht,postmarketos.org,oss.qualcomm.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[pabloyoyoista@postmarketos.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:replyto,postmarketos.org:mid,postmarketos.org:email,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: CC95C622ED7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Pablo Correa Gómez <pabloyoyoista@postmarketos.org>

This has been tested on the Pixel 3a with USB Cereal board

Depends on
https://lore.kernel.org/all/20260310002606.16413-5-mailingradian@gmail.com/

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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



