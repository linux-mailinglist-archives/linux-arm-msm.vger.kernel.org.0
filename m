Return-Path: <linux-arm-msm+bounces-51721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF890A67452
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C41D189CA99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 12:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2713120897F;
	Tue, 18 Mar 2025 12:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esLyZ/j5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC3D290F;
	Tue, 18 Mar 2025 12:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742302288; cv=none; b=sgU7CvkAkqA/vBzUFdAVcwrhaZAE3NKiV1+8wWIAjWvgJc//1LswXPUqdDQKjUX8OjRFK5Fa+L/PL+Ta85IG8AzvjANQeHk0/ZOs8VGCHZ41xRV5n3AToBxU5MRtNPXXf+RAxs0L+VaCfIzxCSpuaHfFdILT7iWHLbiB7GMXppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742302288; c=relaxed/simple;
	bh=lXPHguphpS7R16tkHqKSnZ+MhJWUh9DyfVKToAF8ioM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JQx7r1RCQGHz1Uo/OqF+sXLZeEPuxlHA2eQHz508DA7zl8ogjwfOH3av5UcRIJXJJfVtRHF1xRAvVX+jfyfimeBJlRz3KR8/e9RCJUt6mom051oIKaPb5zVDA+s9K9Ty33+//BMhbXu9SunS2gItUDM7dU8PZzWql2BviB5QZYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esLyZ/j5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C201CC4CEE3;
	Tue, 18 Mar 2025 12:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742302287;
	bh=lXPHguphpS7R16tkHqKSnZ+MhJWUh9DyfVKToAF8ioM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=esLyZ/j5XyJYh2fL21OQZNj2KbTzFHnSsi9rllu7U5qnhKw7lJPL9Mwg467I0Lb8I
	 sqWa7GxjGDU0z5BlwyFdqj3KwePPkDmhEdyTaGJ7G9mUXfzuVmR3abf/HtW0PYBv9B
	 jvN/pxAz6W1cBK82B9zioM7wZlH/iMI25Wd40JWQPUIpgA5t2d83/D0VpHl8GmDT2A
	 wKySILeWCv2iGHelQHwRAj7WznoCR7EEKrNfaZHwFXsOQ7kAvNBXSc5efNZap69ri2
	 oOo07zc/FY2tlZo9KD/no7fzJrcTO9XyjV9HqyloVATivb1vt61cnGxFENc7U+bCgU
	 b8k2CHw7GwVmQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B47BFC282EC;
	Tue, 18 Mar 2025 12:51:27 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Mar 2025 13:51:21 +0100
Subject: [PATCH] ARM: dts: qcom: apq8064-lg-nexus4-mako: Enable WiFi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-lg-nexus4-mako-enable-wifi-v1-1-e3b4a09d9f68@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAEhs2WcC/x3MQQqDMBAF0KvIrDtgbCLaqxQXaf3RQY0lQRsQ7
 25w+TbvoIggiPQqDgrYJcrqM9SjoO9o/QCWPpuqsjLlUzU8D+yRtqh5sdPK8PYzg//ihF2ttOp
 hnDYt5eAX4CTd+bs7zwvgKhRMbAAAAA==
X-Change-ID: 20250318-lg-nexus4-mako-enable-wifi-f6141de5f459
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=oABHqPk0qYz8RHZ1DC5dvgMY1GAwB6itVi5XXv+ltKE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn2WxNl/rCFHhm/Y68tSJ93r3SbPWxEGpVqZXRR
 VidrDnbnHuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ9lsTQAKCRBgAj/E00kg
 cpydD/kB9AOtHCkPb46KSrycSfDhrrEVqRYmu8HiNksmTk8E2eiz1vddb3eTx4YlwDlsxG1VlsM
 tK8s1tSAPcJvHS5bmpf9XNyXyUypW9CpX0r0Anqe08gAtN6tqc7yfArpDoIpD/QbNC6cEnb93wH
 6RutXonQxADYkZ/qhsUQfksMKJ6fSsJlKdrStbnLorr4g1T9hgH3kjn6AWBkvL30nQC/MT4bdsG
 /Ed/JT036EfrjgNFQSDiWPz9rwIkoB0k0bi4Lad9CZ0lBZTH0I67RgE+kPpNPblPzwP+sFs6oJM
 geEssK7HXyerGA3H/ztyPFFacgjh+zm2Hz7ZxtpKYEJ6dxksMjuz9NtnZb8/WEZDS+6PsfpBtr4
 XmTYJ385uTZQ3h2sh4RTQz1GxDuqPVu1PHo0Elt3953Jiq/676z5oVmvYWrHEmcKhedprglbjtZ
 jI2qF9AeIyFxfnGpBMD/Nph+cyT9zMGIL8i4giMiWw2iDW6G7Ui+gM7Je8XEVCh18fhtyuKsirJ
 PUtZCzW12geS25rvorGisoG2yqDTPI9qm228SwWiaBn7p8BGxRXwEncEmDO6GIlSn6OezuHbpf1
 sKQFdRbj08flbkdVHr7b7mIW8CaxdaxEJB1ZR3NYAJHoc3IR9RPlz3H8CneAEKZPm70L1tje1Z8
 xyeM7n0xjPQKWKg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

The Wi-Fi setup is identical to that of the Sony Xperia Z (Yuga).

Verified against the legacy kernel configuration inside
 arch/arm/mach-msm/board-8064-regulator.c
using LineageOS 14.1 kernel sources.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
index 5710450faabf34fa5991d8803a2369cfbb09e4ea..c187c6875bc69d6ad711b52d519fe6a2660f09be 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
@@ -86,6 +86,24 @@ MATRIX_KEY(0, 1, KEY_VOLUMEUP)
 	status = "okay";
 };
 
+&riva {
+	pinctrl-names = "default";
+	pinctrl-0 = <&riva_wlan_pin_a>, <&riva_bt_pin_a>, <&riva_fm_pin_a>;
+
+	vddcx-supply = <&pm8921_s3>;
+	vddmx-supply = <&pm8921_l24>;
+	vddpx-supply = <&pm8921_s4>;
+
+	status = "okay";
+
+	iris {
+		vddxo-supply = <&pm8921_l4>;
+		vddrfa-supply = <&pm8921_s2>;
+		vddpa-supply = <&pm8921_l10>;
+		vdddig-supply = <&pm8921_lvs2>;
+	};
+};
+
 &rpm {
 	regulators {
 		compatible = "qcom,rpm-pm8921-regulators";

---
base-commit: c4d4884b67802c41fd67399747165d65c770621a
change-id: 20250318-lg-nexus4-mako-enable-wifi-f6141de5f459

Best regards,
-- 
David Heidelberg <david@ixit.cz>



