Return-Path: <linux-arm-msm+bounces-82990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2834C7DC5E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 07:44:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81BEB3AAB2E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Nov 2025 06:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B12285CAD;
	Sun, 23 Nov 2025 06:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fudVBSS8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C530E284670;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763880284; cv=none; b=GQuCk/O09Hiuxz3SLkbES1YbSE9QQQMccvHLVrUoEzQgE8P1rJMRr2qTxUkiejIdEHh8+UIRUjBC2pUjRD+vkWbj+kK+fDLP7g7uHyX4qdXpwwpyoDUJyMCJyDOHSApg5YF92fMnd1Crk1ZKidMKt6iUtHhMWvymzCKbvPZTVlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763880284; c=relaxed/simple;
	bh=4s39l/QafgDyne7Fk0MupeREU7/ycQbXTGHYHcfkGAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddHb/weUL3dPxmz6k40SGR82tqlvfZ4sqK568FBqsrmt0louqOxl3v5sqfGuB12zvFcC1uM56Lb0nXgh0iMTB2vQ9GV6npKOD4NkbxwOdqOu33rkfZ98Z7wKTKHVTbdPHpVKvYjAB3wn7Sm0QvjI/8EbF8NnELwOIF7kiK3HE/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fudVBSS8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A1DEC19424;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763880284;
	bh=4s39l/QafgDyne7Fk0MupeREU7/ycQbXTGHYHcfkGAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fudVBSS8xw6IVBsPC5PnJGsb3nb7uzQXRVwYvjmiTRkd6mOklXnVYB0az9mjKYst1
	 vFCVNIHq1XMWSL/TWmggJhpAk0D6oEUEzXkzpBLnqztBQRy7PjtMA7+qkxk4yESXAs
	 lwKdNmttplrDbECrhIGkCxxCX/NkkROmXyrFU6nCTcxBENN2I+U+p6d2cP8y0b332b
	 i1qCnNgcs87tqlOhbL6K4KB5rhn1HbCYdhYsIjZ1Gpuog5i0S6AnY+SB+gJgNaIbav
	 RFUGbHb7K+o/QnXULlWJ5jySGxIK31FTAKqlDlRHFJwocZeOgHMHtvtSsckLvKLExq
	 2KiIVJVtdVO1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 505AFCFD318;
	Sun, 23 Nov 2025 06:44:44 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Date: Sat, 22 Nov 2025 22:44:45 -0800
Subject: [PATCH v3 4/5] ARM: dts: qcom: msm8960: expressatt: Add
 Magnetometer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-expressatt_nfc_accel_magn_light-v3-4-78d198632360@gmail.com>
References: <20251122-expressatt_nfc_accel_magn_light-v3-0-78d198632360@gmail.com>
In-Reply-To: <20251122-expressatt_nfc_accel_magn_light-v3-0-78d198632360@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763880283; l=1006;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=7jrbiFxqBdAClrq/n9H3dJIomUxZ8Xc6QvLk/kgFMvE=;
 b=wbS+WSnGl/oI+NymG4Y8ZNfeWCqCSE9EKuaivOoI9gIV39oVhM4/VQW7BvNKpHcmJ6AKAxF6u
 AvIaItD9rEJC6mB/GoVv2fksPA4rgxIKOFu1QY4n9InwbXoOP2NDcpq
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
Reply-To: guptarud@gmail.com

From: Rudraksha Gupta <guptarud@gmail.com>

Add the Yamaha magnetometer. Mount Matrix is left as a TODO.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
 .../boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
index 4f9b59db7bc3..d32461fc58e9 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dts
@@ -487,3 +487,22 @@ nfc@2b {
 		pinctrl-names = "default";
 	};
 };
+
+&gsbi12 {
+	qcom,mode = <GSBI_PROT_I2C>;
+
+	status = "okay";
+};
+
+&gsbi12_i2c {
+	status = "okay";
+
+	magnetometer@2e {
+		compatible = "yamaha,yas532";
+		reg = <0x2e>;
+		vdd-supply = <&pm8921_l9>;
+		iovdd-supply = <&pm8921_lvs4>;
+
+		/* TODO: Figure out Mount Matrix */
+	};
+};

-- 
2.52.0



