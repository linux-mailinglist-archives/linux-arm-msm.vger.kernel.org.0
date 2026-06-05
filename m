Return-Path: <linux-arm-msm+bounces-111461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TAnMM5FSI2papQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 00:49:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 287D564BB6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 06 Jun 2026 00:49:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=dN9Rt3nF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111461-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111461-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B85E6300B9D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 22:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394E73F413B;
	Fri,  5 Jun 2026 22:49:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1502F14883F;
	Fri,  5 Jun 2026 22:49:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780699790; cv=none; b=UH/YBSj4p2EUcOXWPBIOpvFvi9PvpFlkBZFG28bfzsNq754c/Y5zdzBNdTbRizTpi6jeCUrhcYcovDmCHMFLoENGknPRwfaPUG6bGhAuKw7I0b/HkqAWKMgBu2mZsWDoHhFVt5+RC+9e63H8I12GXCYF4oUrvc4ssGTbcL1NN34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780699790; c=relaxed/simple;
	bh=sDCKE9eSkIGYSAz6jCq1raSQ3l07ooG0KR4VQCm+6Ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=b7Hg4L9HxU5geXKlhFmHFYfxThFF877Am6kWcvuyBp2skzbwffsS2E+4EuTXC28V5CO0/mFnQ6ZA6S8lfSelibILaz32NY9XVEAUyCmckcbbZ8UcgOAxJBuo4SCmrEmhWedE21fZJyCp56hdVhtZjXSm8zaRamjG+4IxPbVO0QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dN9Rt3nF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 929B0C2BCB4;
	Fri,  5 Jun 2026 22:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780699789;
	bh=sDCKE9eSkIGYSAz6jCq1raSQ3l07ooG0KR4VQCm+6Ns=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=dN9Rt3nFvJi2B6tE46Eus9Ja+vQ0/JTu+xYjzXgLNiOP6+EZLX8NV2xiX2kY9ohFj
	 q74xkkvoeDUVimyHMD/oWc/nGOdv5ZyGeMK4qHfJnVtUDfImohKkgmxURvlse8Gv9k
	 5zLWxoLRQgtQXSYjEf2XalbSgiEEcrHZSo2M3wh5oxw0a0YWUOF4nRfrfDa+0gMkpO
	 VRePFMlD6nkDBgkNBeu8BYzgHZK9ZLZwy91C0XuB6JtmOBd/h87kJTBsXu4Tmd9eeF
	 /NSUL0sGRrEGvx6fGlAha4Wwsx4PdKdqwlilsxQVp2vpV8iRwlN0uxrl+2bZDlhuw/
	 AU8hHJzfK3qZQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75955CD6E7E;
	Fri,  5 Jun 2026 22:49:49 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 05 Jun 2026 17:49:39 -0500
Subject: [PATCH] arm64: dts: qcom: sm8750: Add UART15
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-sm8750-uart15-v1-1-93e660722e61@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNT3eJcC3NTA93SxKISQ1PdVIsk41QDi9Q0c+NkJaCegqLUtMwKsHn
 RsbW1AOmha7RfAAAA
X-Change-ID: 20260605-sm8750-uart15-e8b3e08ef73c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780699788; l=1912;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=cnBDgWatb+kdVa9LW2HFaAdpkUIfcK/vxUADNmoNfHU=;
 b=QoVvI1ABaISVQU2ftzSbF0cIwLI2Ra8zvNpyX3GCxMWG+S/D/GizN1QTg1ySudIsGE5O9fmF0
 79SPeJapK0pDz3lnRGFk4x5AmM2U6TLDCrCXZ93dzcCkivY8yTNi2nM
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111461-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:teguh@sobir.in,m:webgeek1234@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,sobir.in,gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sobir.in:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 287D564BB6D

From: Teguh Sobirin <teguh@sobir.in>

Add uart15 node for the UART bus present on the sm8750 SoC.

Signed-off-by: Teguh Sobirin <teguh@sobir.in>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
arm64: dts: qcom: sm8750: Add UART15
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66fc2..7591ebb7086f91 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -1218,6 +1218,28 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
 
 				status = "disabled";
 			};
+
+			uart15: serial@89c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x0089c000 0x0 0x4000>;
+
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart15_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
 		};
 
 		i2c_master_hub_0: geniqup@9c0000 {
@@ -4055,6 +4077,14 @@ qup_uart14_cts_rts: qup-uart14-cts-rts-state {
 				bias-pull-down;
 			};
 
+			qup_uart15_default: qup-uart15-default-state {
+				/* TX, RX */
+				pins = "gpio30", "gpio31";
+				function = "qup2_se7";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			sdc2_sleep: sdc2-sleep-state {
 				clk-pins {
 					pins = "sdc2_clk";

---
base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
change-id: 20260605-sm8750-uart15-e8b3e08ef73c

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



