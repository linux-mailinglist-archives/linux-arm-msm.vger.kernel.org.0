Return-Path: <linux-arm-msm+bounces-113340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SoLRNWATMWr+bAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:12:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E25068D696
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:12:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PtDbgy73;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113340-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113340-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DAD893167856
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0ABD42189B;
	Tue, 16 Jun 2026 09:09:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7514218AC;
	Tue, 16 Jun 2026 09:09:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781600948; cv=none; b=Jrw+njNO78IzEIUV5CNEFoXZxyPxsylUrqL1HOBgH1Q+lrTbVvYb8N3AT9TzrW/bcb1pHOxXseDLfUX/EwQnMGRTx91K9VEg45hwHH/unFHUxvNKESF7BPFPxLnmcla9OHy0PVEYqXJETsjiu97Vof7B89yynbkZw+jdeYiDVBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781600948; c=relaxed/simple;
	bh=vebhRQ4JVx5d1dkWkzDJWbnHnLwIaAWZNO5n0xOY8iQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ls7YNRzlbkHGaoKuaCQr1h8R4uekOxuDUvy/kYNHN9lY0KWSAEfMOOMxj9gy4tcElY6Rnjgu4VQXZIfS2Rm7ywRouk76x8VObib7H/M7q6hGEuG9qz1vdlBXwAN3axBtY/U+Yes8B5SUVSfkdVN5/XnnqBRkphMLfU5XTfJ08l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PtDbgy73; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 213281F00A3A;
	Tue, 16 Jun 2026 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781600947;
	bh=kTC02gixLyjI76t6uFP/9KhZ216P+IxBEX0Si7H/Ubc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=PtDbgy73LF10RntcsafwBzgBaqSREgBkVBPPmkQHwrI5VGK/o45MiXDEOg7Rh438E
	 /58IPD/ak+yQLlrafeUTpyiEmm1AD0WE4iLNROmtPzPbNxnpL1pilndyI9HPKKqWXg
	 LOZdtPs58Sarh3HERuaRZEsN/t/zoIr2Z40keor8kSl20b0DORSD0C3yS/IOu7gL/Z
	 pFbVMgNPL2ZqDBG5o908BEaN41lkaRWYXjZ67LsMloXwpSbctI0rhS9NbHhgJkAG2k
	 jU5jWRIDpEFjw5XdLQZp/6dgGG3NtaUdesBpS/5BcSiS18WJctH721IljpM/N6T+Pz
	 WOa7BgjXX1lBQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 16 Jun 2026 11:08:51 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Rename
 regulator nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-topic-8180_disp_power-v2-3-167785993231@oss.qualcomm.com>
References: <20260616-topic-8180_disp_power-v2-0-167785993231@oss.qualcomm.com>
In-Reply-To: <20260616-topic-8180_disp_power-v2-0-167785993231@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781600932; l=1546;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=XBZeVpQP/lzhjWVpMx7gMsYu9/JWKDtrxr7fKgtXMgM=;
 b=6t6U+cPH9oP39TICiANrSZ3YBkAVt2oWxq7ak2ft9SqkUbg6VBdl90pCuncLmhXmOlEceLcFy
 qfh+ESJWIVCC1wRaSs+OH2aflabOGMsTfa79+0Ugr3TkYq625/U4mSv
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113340-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E25068D696

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Align with the contemporary way of naming regulator nodes (regulator-
prefix) in preparation for adding more of them.

Reorder the renamed entries to match the expectations of the DT coding
style doc.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index d86a31ddede2..0d2cfb830e83 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -157,14 +157,7 @@ cdsp_mem: cdsp-region@98900000 {
 		};
 	};
 
-	vph_pwr: vph-pwr-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-	};
-
-	vreg_s4a_1p8: pm8150-s4-regulator {
+	vreg_s4a_1p8: regulator-pm8150-s4 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s4a_1p8";
 
@@ -177,6 +170,13 @@ vreg_s4a_1p8: pm8150-s4-regulator {
 		vin-supply = <&vph_pwr>;
 	};
 
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
 	usbprim-sbu-mux {
 		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
 

-- 
2.54.0


