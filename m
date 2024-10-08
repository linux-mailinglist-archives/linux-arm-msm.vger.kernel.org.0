Return-Path: <linux-arm-msm+bounces-33469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC11C993D29
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 04:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29D811C22216
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 02:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90C322F1C;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kS9n5eLw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7AD3A1CD;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728356390; cv=none; b=pmCubpivifpNIkqkUNm9/GC7MKWAWcZZg87vEOVEJx9AHlDMf4iiNHrjodCtyIdIx6j9qO04EsbltkOBU7VFMe0VJE8ACP7SXTgrbKccuPwXjCHKa8kUtLybh+NVquvmnOhL22vHiHZtGcd4nlK9cNEmMPZqgCCqcfsuwQYel20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728356390; c=relaxed/simple;
	bh=j1h/zlDXsUjF3gl4eUYy7OwSAA+oRwyR4xNia1Iq4DE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HlDL0ufEQXU4RVWqD+K7nAW58x6TUnEGR+m3tNadRJdFmGYOL1CLaVY+nSXjuRIVINHP6CWfm/SBxl0BVDNImPLUQRHsGDNNGcsQPX1ugMYs1fn7I957YqldCpxuDoMyjd7kcUG5nZnGPX55m+yXK2Dx5njlEsFFsGxCbWbjbN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kS9n5eLw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 608E5C4CECF;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728356390;
	bh=j1h/zlDXsUjF3gl4eUYy7OwSAA+oRwyR4xNia1Iq4DE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kS9n5eLwpcFOG9J9otMf9QwbOeJYHQyoCYQ1qHM7xAp+jJSbS25/DL6LDyjH5YMHc
	 drudwLFrzJY7IjHh5LEhQxAzwjIDhQFJkysKXP3tQ2GXywAhxjKWhCUkV+ca3ocQq6
	 oEGAgnCWseVKsWddtKouiyi7eCadoous1XcjcNdtN0KXjaQUBgWIYZ2TrzlCf7E11k
	 g6/Eq3fdJi7HcJ+5o8afy1v06OqzgM2pM4uyRkqHRbZvRyxpAl1j3zwoLraFbi1QMq
	 k7HoMtj7Vpc9bYHDoJb5qmNpYSJPFQXzGJGJ4c1cp96/dLjNefLBS36hEn5wqZbq6C
	 4LlpBdbayJACA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE99CED25C;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Mon, 07 Oct 2024 21:59:26 -0500
Subject: [PATCH 1/3] arm64: dts: qcom: sdm845-xiaomi-beryllium-common: add
 touchscreen related nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-pocof1-touchscreen-support-v1-1-db31b21818c5@joelselvaraj.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728356389; l=1967;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=OYp/nYB2IJ5VumglL1GrGkflGQE9p9BC44JCei9fRv8=;
 b=5oyFeLTwnMTMWmNzcTNV0Lb3qErbswiPCMWsKOhQ+e88pqYvS5MIxlvU6JKBSoZ+2AnPQUcDP
 Hf8CRxy+9QZDI4+5p1XDDOygPfchikA4f56CTyv0giOu/LgSUhjpXgh
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20241007 with
 auth_id=238
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

From: Joel Selvaraj <joelselvaraj.oss@gmail.com>

Enable qupv3_id_1 and gpi_dma1 as they are required for configuring
touchscreen. Also add pinctrl configurations needed for touchscreen.
These are common for both the tianma and ebbg touchscreen variant.
In the subsequent patches, we will enable support for the Novatek NT36672a
touchscreen and FocalTech FT8719 touchscreen that are used in the Poco F1
Tianma and EBBG panel variant respectively. This is done in preparation
for that.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 617b17b2d7d9d..6773a7ddb9a33 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -243,6 +243,10 @@ &gmu {
 	status = "okay";
 };
 
+&gpi_dma1 {
+	status = "okay";
+};
+
 &gpu {
 	status = "okay";
 
@@ -408,6 +412,10 @@ &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	status = "okay";
 
@@ -513,6 +521,37 @@ sdc2_card_det_n: sd-card-det-n-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	ts_int_default: ts-int-default-state {
+		pins = "gpio31";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-down;
+		input-enable;
+	};
+
+	ts_reset_default: ts-reset-default-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <16>;
+		output-high;
+	};
+
+	ts_int_sleep: ts-int-sleep-state {
+		pins = "gpio31";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		input-enable;
+	};
+
+	ts_reset_sleep: ts-reset-sleep-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
 };
 
 &uart6 {

-- 
2.46.2



