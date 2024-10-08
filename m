Return-Path: <linux-arm-msm+bounces-33470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECD7993D2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 04:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC05F285964
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 02:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D64273F9;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nH9WiOoo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8493BBCB;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728356390; cv=none; b=dKgXaJnqn/9M0O/YG90UUEFdEIMvaJ/SQanZ2Ua4TltCGJl2k4lMT1liIurHds65Di9c3tzpopGSBEIoLmogDa390qrWa34p3VlhvefOtDygqz6OQn/eeCg7cDiHQxI8H5DIUwHsjdFeDH0TpjzGuNF+XF6UhB+UXOlS1TA78Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728356390; c=relaxed/simple;
	bh=ZcKDowProDmhu5b83EBqZxpmpVmwkoG/PgPBMcVpNfE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oQBmLww+R1Rqnu65at4KIFEajmhEesBJvpwHkiJmVMcBghEAOfn0sBABkFPBWAl6nwilHBEsF5gAGyMfLNumH3MLgwIXA8cimqH8MZN5JUabFejoEftjCgU4Eh/g1hOYJFTKfdB3NEybksiJIs3xHK4AcXKB1tv2NLFOY7dJrCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nH9WiOoo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76E6CC4CECC;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728356390;
	bh=ZcKDowProDmhu5b83EBqZxpmpVmwkoG/PgPBMcVpNfE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nH9WiOoohQycLBVD3GCPLQDJm43732R4DyWc8Ok+S3s43cuoll5xKk9TZMHJsf0hV
	 oATVRIa6aPnz28dpKSetwIREZv5lj0EXbXGsrScMNmgN1ZrlRbyChoOCP97lmgKF6T
	 rKqjsNXI/AnRQ6uO9sgZ0GbiCJPhS1OgGKE88H5475QJcNSVyfTuqrybT6WxOFCU9C
	 kDTxOERV7nA8eQOfJmfLlmTzEml1bKYL+M3ENPfvSofPR1Fl/bz/EXW42/me8ltVtz
	 A8lwrQOMBHoIC9W+6/iouod5dPTXYIXJ22jdEBk+8WHUJlQnt2yVBFivbFiYkle/OQ
	 5iXIRLMH23MZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66465CED25B;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Mon, 07 Oct 2024 21:59:28 -0500
Subject: [PATCH 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg:
 introduce touchscreen support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-pocof1-touchscreen-support-v1-3-db31b21818c5@joelselvaraj.com>
References: <20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com>
In-Reply-To: <20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728356389; l=1227;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=LzIMPE3ViRJU1UTWVo3cnkkmA8lzQjLUoj4fs+6HbJc=;
 b=vpIT0gb6NjMD35qJacElRqjhRkTb4LgFehg394RPiCDic/cixjr3COAQuciI1N2Ec1tD21HXn
 OuX2PUajRe6CpenCVaqj2T9oJyJ5e17mb+eMeiGAco+vV2NF20a++5b
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20241007 with
 auth_id=238
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Enable the Focaltech FT8719 touchscreen controller used in the Poco F1
(EBBG) panel variant.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
index 76931ebad065e..2d6f0e382a6cb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
@@ -13,3 +13,26 @@ &display_panel {
 	compatible = "ebbg,ft8719";
 	status = "okay";
 };
+
+&i2c14 {
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "focaltech,ft8719";
+		reg = <0x38>;
+
+		interrupts-extended = <&tlmm 31 IRQ_TYPE_EDGE_RISING>;
+		reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+		panel = <&display_panel>;
+
+		iovcc-supply = <&vreg_l14a_1p8>;
+		vcc-supply = <&lab>;
+
+		pinctrl-0 = <&ts_int_default &ts_reset_default>;
+		pinctrl-1 = <&ts_int_sleep &ts_reset_sleep>;
+		pinctrl-names = "default", "sleep";
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2246>;
+	};
+};

-- 
2.46.2



