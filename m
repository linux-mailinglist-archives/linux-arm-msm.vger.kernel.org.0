Return-Path: <linux-arm-msm+bounces-33472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D39993D30
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 05:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF1A6B22EEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 02:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089752AE77;
	Tue,  8 Oct 2024 02:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nbg2MylP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7EA3B182;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728356390; cv=none; b=f3Em1+W0tpg/T6qdeBe0aFCTb1OF8ECMtN2pfJ8IGg3OLcDszZP8mxhAsnBPB5A7jb8/fUbOIHDBtdRtcGxh9fRp1dhooCcmLiBH1OxBbBatqyFU9QUYY+vfD+lkRjW44ovwtvJmPG4k9B84eR8KRpE3tlOC0e/B5jQ48sty+TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728356390; c=relaxed/simple;
	bh=Gg2t36kJUPM7IbLtV7FR1UYavb8zaoCYmeo2qH3S3C4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BR2dU8WRh29HBy0/Gkf656iv+0vTh3vhrU7XR3LqD+ClCR4hbpHqV/AV7lXnzN/+vz0KaHfMzSkoVabh0lcDPv06MbrXF2KLlyc3YhTc8+Uk92rP3YVPB7VdgyYWHCXBYZlwzGZv4L/A4bj3qEB4iLGIIWc0jdwxyEkFUpTaVdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nbg2MylP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 68F60C4CED0;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728356390;
	bh=Gg2t36kJUPM7IbLtV7FR1UYavb8zaoCYmeo2qH3S3C4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Nbg2MylP6NnFAs11Otom2lyUN9Bjzo+T46mCONurxSZG2OTPFbptiuTNgMFi0jArS
	 Nek/w7DlfF/EVriShZZR9eq0pI1Hkv/LZmzBKm0rOPydAhrqMFW+h/aTvFabglEO6q
	 TS48Qr2HCGb8WjwQVA6+W+NueJUZRnW5f7gAZpI4qliIoXMacaH99SXpioTMRe0ygP
	 sUVJ0YVMEbm2xZn1TEOwse+LPyk9vkwsd7MgWc63/xpGCrV8pQiX5/BESo9CfHmEKc
	 JjvNqHckA01hbWA6wE8eYMlTSFIeuNQ8y5W295MpZu5QQfnhNFlPqXzwZD1jLzGE8t
	 XAx5RMm/iFJnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58166CED25F;
	Tue,  8 Oct 2024 02:59:50 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Mon, 07 Oct 2024 21:59:27 -0500
Subject: [PATCH 2/3] arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma:
 introduce touchscreen support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241007-pocof1-touchscreen-support-v1-2-db31b21818c5@joelselvaraj.com>
References: <20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com>
In-Reply-To: <20241007-pocof1-touchscreen-support-v1-0-db31b21818c5@joelselvaraj.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>, 
 Joel Selvaraj <jo@jsfamily.in>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728356389; l=1264;
 i=foss@joelselvaraj.com; s=20241007; h=from:subject:message-id;
 bh=jsPJLUWq/vBFphtf8UWaN9f9WgcApMbEqSyFwH4fNxE=;
 b=XYAUtC0pDbAZmlgefJffGMvkIeCgyvL8jCEQQbz6KxxlD6/Ydec0aIqZSaH3GSaUAoYer/P6T
 JOvY+5XAcXrCrnKyM8WYgCH5PAucvlkZAjjmITzf4Q5q3JuotJr7bX7
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=pqYvzJftxCPloaoUbVsfQE7Gwv8bynZPy8mjYohwMCc=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20241007 with
 auth_id=238
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

From: Joel Selvaraj <jo@jsfamily.in>

Enable the Novatek NT36672A touchscreen controller used in the Poco F1
(Tianma) panel variant.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
index e9427851ebaae..b58964cde8342 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-tianma.dts
@@ -13,3 +13,26 @@ &display_panel {
 	compatible = "tianma,fhd-video", "novatek,nt36672a";
 	status = "okay";
 };
+
+&i2c14 {
+	status = "okay";
+
+	touchscreen@1 {
+		compatible = "novatek,nt36672a-ts";
+		reg = <0x01>;
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



