Return-Path: <linux-arm-msm+bounces-84472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAED9CA7B44
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 14:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71594323D933
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 13:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB75433B6F5;
	Fri,  5 Dec 2025 13:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kkw4sTxd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B5F33A715;
	Fri,  5 Dec 2025 13:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764939656; cv=none; b=C46th7U9dhZnHGxO+bmvGZiXnIs4UpRcJUL5yAP+Fq11TQjHvOHgilwdOcFmG5YA7+AJQt4WbU4KQowV5q5vJXZPQIDqPsqYKWEgZ1t6fIns6G3JkycZR3M+iSVOPrd2hTINS+X+uKne9rc/GBsEcKO29ojr+Ad/4Pv9eW36vAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764939656; c=relaxed/simple;
	bh=Hjh2q7YGF3G7TKCnljODy8o4LA7T6Xj3FX5bucukiG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJ3J4WsTGj/Dl6gMGdlS4vQggay0/Pco1Q95QikCnwMd1rhpOYd0HLklPX0phGKox1w1mcwgnP4LzpqDsLPQxIxEYwl46GlSseTySRaedJKMDKIYOrS5X23m7kYV1ZPqBl+N+cKuwVguWxjUeUoTgtMzRZl/vHRxgkyLCkMv1wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kkw4sTxd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B21FCC2BC86;
	Fri,  5 Dec 2025 13:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764939655;
	bh=Hjh2q7YGF3G7TKCnljODy8o4LA7T6Xj3FX5bucukiG4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Kkw4sTxd2ZlZl1Ioj2PV4GFspqRQKXr+0HDEX6g4KAxW73wEHLEBltbZXYO/ZJVVl
	 RZz5yfPRBCRB7DwuHena76iRWBQe2xtJ+cDNiwYp7ccgHgdbzc2eF+ycJNGgP0m75h
	 vz00QYjQLraW3TIZ0tU1uaMbmGUbwGB83JEL1TsjODCp2AsOVzvt2PgAQRKxXljsUP
	 3PPl9g7WzDnALpXBATOk2XYErMLU3KuZ2mqKYaOH9bHNnetYJ0AWmLvi3Mgwh4fWW6
	 6R7afG6n3SHzgeG3eGZu4Zng0caPpjamvJbeXIW75qbnk/nWX5ccwSBKCaweMl0bCL
	 FTHQjO37ZXqgA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A38BDD2F7EF;
	Fri,  5 Dec 2025 13:00:55 +0000 (UTC)
From: Robert Eckelmann via B4 Relay <devnull+longnoserob.gmail.com@kernel.org>
Date: Fri, 05 Dec 2025 22:00:06 +0900
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm845-xiaomi-beryllium: Add
 placeholders and sort
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-slpi-v2-3-dfe0b106cf1a@gmail.com>
References: <20251205-slpi-v2-0-dfe0b106cf1a@gmail.com>
In-Reply-To: <20251205-slpi-v2-0-dfe0b106cf1a@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org, david@ixit.cz, 
 Robert Eckelmann <longnoserob@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758;
 i=longnoserob@gmail.com; h=from:subject:message-id;
 bh=NKSrjVKl6hmHb40HZ/gBpdJQQYkkXd4Osh0NjPVYeDk=;
 b=owGbwMvMwCVmcOAq9/vk/SGMp9WSGDKNrrel/Z8mJPmG95tYyxzte84mbnz3TI4Fb3og4f3rX
 OxZpVc5HaUsDGJcDLJiiiw73I7pZLoujdi4e38ZzBxWJpAhDFycAjAR636GP9w3VXXeOR7udg6b
 zvys0H256rzZO3lfc7vtb40s/lZ9LIXhf9KeOoHZf9bzpnFFfX18lLl6l5ax7kWJjfGul8SCJKS
 7GQE=
X-Developer-Key: i=longnoserob@gmail.com; a=openpgp;
 fpr=B846C62C6945A558B1BBBF7630C0D50BEF63BF54
X-Endpoint-Received: by B4 Relay for longnoserob@gmail.com/default with
 auth_id=569
X-Original-From: Robert Eckelmann <longnoserob@gmail.com>
Reply-To: longnoserob@gmail.com

From: Robert Eckelmann <longnoserob@gmail.com>

We know these devices are present, most of them are supported by
downstream and close to the mainline kernels.

This is very handy when rebasing the integration tree with the support.

No functional changes.

Reviewed-by: David Heidelberg <david@ixit.cz>
Signed-off-by: Robert Eckelmann <longnoserob@gmail.com>
---
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   | 29 ++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 8ce592cabd35..8df5311f4afd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -227,6 +227,12 @@ vreg_l26a_1p2: ldo26 {
 	};
 };
 
+&cci_i2c0 {
+	status = "okay";
+
+	/* IMX363 @ 10 */
+};
+
 &cdsp_pas {
 	status = "okay";
 	firmware-name = "qcom/sdm845/Xiaomi/beryllium/cdsp.mbn";
@@ -261,6 +267,22 @@ &ibb {
 	qcom,discharge-resistor-kohms = <300>;
 };
 
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sdm845/beryllium/ipa_fws.mbn";
+
+	status = "okay";
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	/* TAS2559 @ 4C */
+};
+
 &lab {
 	regulator-min-microvolt = <4600000>;
 	regulator-max-microvolt = <6000000>;
@@ -312,13 +334,6 @@ &mss_pil {
 	"qcom/sdm845/Xiaomi/beryllium/modem.mbn";
 };
 
-&ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
-	firmware-name = "qcom/sdm845/Xiaomi/beryllium/ipa_fws.mbn";
-	status = "okay";
-};
-
 &pm8998_gpios {
 	vol_up_pin_a: vol-up-active-state {
 		pins = "gpio6";

-- 
2.52.0



