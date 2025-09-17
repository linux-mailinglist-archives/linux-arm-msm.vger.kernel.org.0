Return-Path: <linux-arm-msm+bounces-73910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8DFB7C88C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1960348426E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 11:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875EC309EE3;
	Wed, 17 Sep 2025 11:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QP2YoTQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58731284886;
	Wed, 17 Sep 2025 11:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758109756; cv=none; b=L6vK08AkznmciEH2vz8lRq7UpAKR/Qzs49bIILtjsCeQQhyGoIUmE5/ufCxuKKPg+oxgkNMy/dfwCGrsm/t4SoVUwiaZxO4dAdDQZ35/MJ325FWeOUkOddUQyx3Drx4FG+NKGDMdLHui7zdDWiZsc3WUvaPRpa7R5aaV+3uEY0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758109756; c=relaxed/simple;
	bh=2VBJNSP8fXo+EzchoAha0gc1J5Zxa0OZ9HgKOI0/mRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kg6AcvvfZRWyzfeyPBHhIJuOAxgAVNZnBpkDECpEvCMdGv8Rv36vSRSFk15hndq3h9Qzo+NZZqrL9rvuGQYb8rGbx2VTNJxEg9wQl+D0yjksHMhlEo9S4n1UF+0iIh0gxPVbsp0+2f5HTowxjXoxh50VDZ8kedrmXj6xPUaosvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QP2YoTQO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D403CC4CEF0;
	Wed, 17 Sep 2025 11:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758109755;
	bh=2VBJNSP8fXo+EzchoAha0gc1J5Zxa0OZ9HgKOI0/mRs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=QP2YoTQOJNFJtDfu8Ul5D4kvle8TkW5FFGNF7WSqpJcqM4duo5X8rcbGYwIOJahb4
	 iODhrnKxSDVqhWScztYcgbCc/0iPHHEOfZ4upHrpvMKsfVQhCT2B9Bz+ifu5k/kmF3
	 GahjKKximAaWXiq8kXchMeCdMngUVOPwqrp0v+XIt6O0c1ISm7AadJe19iu6HmyNpG
	 w4w7afNBwMmzkSHwXvb9qN0sFM3XzPf+Evgzj3OnlupLJHAiffUeVRJyZxXxhO0rAR
	 pG+5wKLzqUi4skWJTW3CPxqwH/+nM9zKzcqKEWIy4dGV9SO5ClG+6YcukCJ0LM6Xj4
	 vXjRBW1A6QmZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC982CAC59A;
	Wed, 17 Sep 2025 11:49:15 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Wed, 17 Sep 2025 15:49:00 +0400
Subject: [PATCH] arm64: dts: qcom: ipq5018: add QUP1 UART2 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-ipq5018-uart2-v1-1-f8680bbf947f@outlook.com>
X-B4-Tracking: v=1; b=H4sIACugymgC/x3MQQqAIBBA0avErBNGKdSuEi3EppqNmVYE0t2Tl
 m/xf4FMiSnD0BRIdHPmPVTItgG/ubCS4LkaFKoerdSC49GjNOJy6VTCWtsZRYhee6hNTLTw8//
 G6X0/WLnqal8AAAA=
X-Change-ID: 20250917-ipq5018-uart2-999482e00c7c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758109754; l=1271;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=HM/nI43DAlY/zjakfQ1WPfyIyi8Yd5G24Lox3W+bASA=;
 b=tSA+wVVKSl7EQVIcar1wFpLWcYt4BMzrg8snAh1odR53zMJiIUMHLsb+W8lUSw7iKwSczqR2y
 BNZTG48ItJxDzNo5VATpWWHiuOBBvnjpKsG3jmVzkgh+zt+wQhmOEmM
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Add node to support the second UART node controller in IPQ5018.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index e88b52006566fd39c0690e6fb53be743eb56d11b..52840eb00a262a05fe2e7cbe5b77c47ff5937222 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -490,6 +490,16 @@ blsp1_uart1: serial@78af000 {
 			status = "disabled";
 		};
 
+		blsp1_uart2: serial@78b0000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x078b0000 0x200>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
+				 <&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+			status = "disabled";
+		};
+
 		blsp1_spi1: spi@78b5000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			#address-cells = <1>;

---
base-commit: 05af764719214d6568adb55c8749dec295228da8
change-id: 20250917-ipq5018-uart2-999482e00c7c

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



