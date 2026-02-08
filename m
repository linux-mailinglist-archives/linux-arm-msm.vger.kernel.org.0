Return-Path: <linux-arm-msm+bounces-92133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1NNdJfrjh2mfegQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 02:16:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 147181077EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Feb 2026 02:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C8DB3300C918
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Feb 2026 01:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1754F2C2363;
	Sun,  8 Feb 2026 01:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRx7lg7n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55FD81732;
	Sun,  8 Feb 2026 01:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770513397; cv=none; b=YEAfqL0laM0T+IbkTQeMdO/LbUwjAmf2urhG+oosNP7ErZbf0Ud7qmbkOpz/0DDYo2XrWIuKc36prJmQ/MAyiRgJTNQ0RPqm24vD/6vdoKOecCReEmI1/CXZiMIkmf9M0dNol/PdmSknX7hE4aQvRQKsz0DZCzm21z/TgzAMf1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770513397; c=relaxed/simple;
	bh=Y4kllgXVHw4Tr0oTtwYF95obod+Q02JDIkePhvAo8OU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aX7YA+ShvzlNle+YyzApgkqPk18ZeRaosbdlNF4Nmhlli/W9AQWOl7Tj29RPH/77uuLbM7I7qZZ3Zmk44PxXUEEPSJVtJCAlbIPj8cZ9i05iFZgNpAJY1CYRlN1qLQTVUamYi+sXJv58o2ZWFTBiu2O9eKYvgkCwS+xJaOUEUyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRx7lg7n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80A76C116D0;
	Sun,  8 Feb 2026 01:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770513396;
	bh=Y4kllgXVHw4Tr0oTtwYF95obod+Q02JDIkePhvAo8OU=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=CRx7lg7nap49AWdsgqAb2h6kzcpdt6UjiDm+f0snO4Sz4x2eDRVW0MmBkwRHUacUX
	 pGncGyXn36OSmRORI/n+WQkXrXUSbvIZRhSF2FE9WBcKJPy9Zdanq0wc5hIVUZQFiI
	 yoYtJzbVFXuUX31Fhy8h3p/RpVNtByNsOQg3VnkOXW2DeMLvkv8N0uARLsT5X2JFT+
	 ySYQ/TETiBUdpalEYykeI/GcfdLt2IhQkE/qbZjSPDFnRXUicVHF3ukayWIiZO1I2R
	 v9YZJTcKzVBHS2Q2NDnyi/L2268Xb9amN7hCuN+OVamp2dAhzsltWp1ARzP5/pQ3/E
	 NFJFXXyzwLGMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B502EE0ADD;
	Sun,  8 Feb 2026 01:16:36 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 07 Feb 2026 19:16:03 -0600
Subject: [PATCH v2] arm64: dts: qcom: sm8550: Fix DTBO boot failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-sm8550-abl-dtbo-v2-1-83afaa6f3ce9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XNQQ6DIBCF4auYWZcGEAl21Xs0LkBQJxExYEwbw
 92LJl11+b1k/jkguYguwaM6ILodE4algN8q6Ce9jI6gLQZOuaSMK5K8ahpKtJmJ3UwgreRKyVo
 MlFooV2t0A76v4qsrnjBtIX6uBzs711+r/WvtjJzqdW0cE5SL5+g1zvc+eOhyzl/e1kFcrgAAA
 A==
X-Change-ID: 20260128-sm8550-abl-dtbo-96288634f00d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kumar Sharma <quic_vksharma@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>, 
 Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770513395; l=1988;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=MSt9cy30dkO5MvzrubSqKSonGMw3uBt52RdVxTWvKPc=;
 b=G4vENHVOwE6gA6R07OA3RFFApGCvnwOs8k3qr6VXVEl9LdUXpxPa+DGe/E/teL/EeesV1prVL
 1RTdbO0bnoJBREC3HJW7ea+EUP5is4atVfSSAAPaRoW0JtF/JKnxmfU
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92133-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,gmail.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 147181077EC
X-Rspamd-Action: no action

From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>

ABL requires certain things in the base dtb to apply a dtbo. Namely:

* A label named qcom_tzlog must exist, but doesn't have to contain any
  specific properties
* The timer node must have a label named arch_timer

This aligns the sm8550 soc dtsi with those requirements. Without these
in the base dtb, when ABL attempts to apply any dtbo, it will fail to
the bootloader menu.

Co-authored-by: Aaron Kling <webgeek1234@gmail.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
With a current mainline sm8550 base dtb, ABL will fail to apply any dtbo
and fail back to the bootloader menu. There are two changes needed:

* Add a label named qcom_tzlog
* Add a label named arch_timer to the timer node
---
Changes in v2:
- Drop tz log changes
- Add tz log label to a generic node
- Link to v1: https://lore.kernel.org/r/20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index e3f93f4f412ded9583a6bc9215185a0daf5f1b57..04ea1a4a015aa5a4fd615e068b6f18b7c336607c 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -32,7 +32,8 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	chosen { };
+	// This label is required by ABL to apply a dtbo
+	qcom_tzlog: chosen { };
 
 	clocks {
 		xo_board: xo-board {
@@ -6756,7 +6757,8 @@ trip-point2 {
 		};
 	};
 
-	timer {
+	// This label is required by ABL to apply a dtbo
+	arch_timer: timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,

---
base-commit: 3f24e4edcd1b8981c6b448ea2680726dedd87279
change-id: 20260128-sm8550-abl-dtbo-96288634f00d

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>



