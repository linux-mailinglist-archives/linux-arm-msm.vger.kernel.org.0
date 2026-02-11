Return-Path: <linux-arm-msm+bounces-92628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cDeTMzcEjWlVxAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 23:35:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6577B128244
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 23:35:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B8B830D98F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 22:35:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FB03563F1;
	Wed, 11 Feb 2026 22:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AX/JiXWO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349BC303A30;
	Wed, 11 Feb 2026 22:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770849332; cv=none; b=IORkaHXG3gIKbkvMboi+LE5tSscIKI7pyfLAORic0CgvmisFujsK0FD8V8Q2C8OrfeTAI8uPJrs8BNyQregiY7hjQvkoZwHeW04T/VBQF48bXop+Z/iZBADPSOLPchC1wNI8vOaFf3oGg/4P7+z9qLcFTgQ6uB+YFpuTnoU57wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770849332; c=relaxed/simple;
	bh=fRzd5C1m1KWnj9sN3omOYm7Eno2jrTo72iTwE+EhFO8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WWe2e8CcaBEFnByP1F8xv158Os/ibStrwrENvmUjp428saRUITYIstsJrLNb8erD1pHF36tW1+zccpptIYX1Pt9lBtFl6B/jn51li+OydvuiFJWMgST76URuKmvtb48/npJaGH+eCcRODzpcdgrIQLuJX3TmmAn+k2aotw2kZNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AX/JiXWO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC753C4CEF7;
	Wed, 11 Feb 2026 22:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770849331;
	bh=fRzd5C1m1KWnj9sN3omOYm7Eno2jrTo72iTwE+EhFO8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=AX/JiXWOpYqGXHWExudlFDOmtX9oXAm7pOLiOlDhydmIfVh/rTQBBMG0J9njynaZa
	 6ig+h0BgDCGVXqZK0V0Sf75Gyh5bE5hsmVJXg7BapOOMw+ziinWuoj8HfWHhnNUJYA
	 H7bD4DD7PjFuNG9/bMs331oEo9fdxtdpOfvbNbkUSy117MN5/ZTUfO/rN+0Ll9ClA7
	 UeybticEes5Zv/zHC2XXBhq/QirO3+IaFQ8eaGOQAenil14ycKZPBDlwuUG92yMGNL
	 LFZtYhQ8FPXMY5O0JtxdbUkQf45FKo0sG4QDi0HiKNNoP13YGXBJV8/1ceNNfj+26M
	 TPpYERZpUJUEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFFFECD6D6;
	Wed, 11 Feb 2026 22:35:31 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Wed, 11 Feb 2026 16:35:30 -0600
Subject: [PATCH v2] arm64: dts: qcom: sm8550: Add UART15
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-sm8550-uart15-v2-1-bd23a0de18bc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XMQQ7CIBRF0a00fywGCBR05D5MBxRo+xMpBirRN
 Oxd7Nzhfck7O2Sf0Ge4djskXzBjXFvwUwd2MevsCbrWwCnvKaeK5KClpORl0sYkuYxqdEJ7JZS
 D9nkmP+H78O5D6wXzFtPn4Av7rf+kwggjTls7KdE7RvltDgYfZxsDDLXWL8VlWHKqAAAA
X-Change-ID: 20260207-sm8550-uart15-9b7bd48e747d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <wuxilin123@gmail.com>, 
 Molly Sophia <mollysophia379@gmail.com>, 
 Aaron Kling <webgeek1234@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770849331; l=2448;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=1UeX34r1RbR0E20rmrtQKnc42GyRjfpe4HlrJ/o9flA=;
 b=5X6HlHiTEI4PYvujt7jJ7TJ+8sYjeLR0vqBFWgtbFjmxOuk7vDHkTigGtboTYYYNUzfNxdNM/
 IazaswrC8YKDQqzE2RIr4W2CgOHncIQmtgJOwSWluK7WvzCPQEFOTAp
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92628-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,9c0000:email,linaro.org:email,89c000:email]
X-Rspamd-Queue-Id: 6577B128244
X-Rspamd-Action: no action

From: Xilin Wu <wuxilin123@gmail.com>

Add uart15 node for UART bus present on sm8550 SoC.

Signed-off-by: Molly Sophia <mollysophia379@gmail.com>
Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
This patch was originally submitted as part of a series to support the
AYN Odin 2 [0]. That series stalled, so submitting separately.

[0] https://lore.kernel.org/all/20240424-ayn-odin2-initial-v1-0-e0aa05c991fd@gmail.com/
---
Changes in v2:
- Use QCOM_ICC_TAG_ define in interconnect paths phandle third argument
- Link to v1: https://lore.kernel.org/r/20260207-sm8550-uart15-v1-1-d8ccf746d102@gmail.com
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..a54f375f7f041a193a4396e4aa911abb42e3e6dc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -1251,6 +1251,22 @@ &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 				#size-cells = <0>;
 				status = "disabled";
 			};
+
+			uart15: serial@89c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x89c000 0 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&qup_uart15_default>;
+				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+				interconnect-names = "qup-core", "qup-config";
+				status = "disabled";
+			};
 		};
 
 		i2c_master_hub_0: geniqup@9c0000 {
@@ -5095,6 +5111,14 @@ qup_uart14_cts_rts: qup-uart14-cts-rts-state {
 				bias-pull-down;
 			};
 
+			qup_uart15_default: qup-uart15-default-state {
+				/* TX, RX */
+				pins = "gpio74", "gpio75";
+				function = "qup2_se7";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			sdc2_sleep: sdc2-sleep-state {
 				clk-pins {
 					pins = "sdc2_clk";

---
base-commit: 9845cf73f7db6094c0d8419d6adb848028f4a921
change-id: 20260207-sm8550-uart15-9b7bd48e747d

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



