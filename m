Return-Path: <linux-arm-msm+bounces-54795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 254CFA94273
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 11:02:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA3728A699C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 09:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0681D61AA;
	Sat, 19 Apr 2025 09:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="axiEZ4SU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4BA1C5D7A;
	Sat, 19 Apr 2025 09:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053265; cv=none; b=H7MZHvWdJUGZ9zyzwekd1lJmk/CwbA3iaM3vmDeeJIUxiybnZJEyyI+KSwoNX8zC9vCUO74PqL16nAXEw7AcdETXbzxVs4YTrsOmfSsrSXmlhWJVUm0rAN5Lp/vE7U12rhw7upE4PLVdnVu3/6Pdhio7d0nJEy3Z8UT/rwNKYAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053265; c=relaxed/simple;
	bh=g700F99MjVU+rSl33Myklqzcz/DbVPqJAv8Kw6yjkq8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HvxQO6QrtIRLi9w2t9Cia5I8fUHABrDGhHBw5durACQjTALTaenOf1Jo0DXJZbhvhhlNf7Vmz6D3iwLC3tyEBk6tunufGvbg2+rivscmHdrT0kH/zz1X9wNgcGj+NWeGH2k3sUmQTIkGvBZFWKNPvKU9FGKCYXYI25fMRWvi18o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=axiEZ4SU; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745053254; bh=g700F99MjVU+rSl33Myklqzcz/DbVPqJAv8Kw6yjkq8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=axiEZ4SUEnn0pvca7blIJ6p/UdvRrVoPkWxXsKREUHouzzGRa0EUP5gx0n9VE6QMG
	 fWDj0ZkOAVx528gsigKVxII3nh5qRv3R6MckNrlvIuFIlr7ihbHrcf9VK9qFB4wLCM
	 +6vVykjLIqNLUAOSit2j0f8JyRQ+2hnwGJWe7eUw=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 19 Apr 2025 11:00:41 +0200
Subject: [PATCH 4/4] ARM: dts: qcom: Add initial support for Sony Xperia Z
 Ultra (togari)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-togari-v1-4-45840c677364@lucaweiss.eu>
References: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
In-Reply-To: <20250419-togari-v1-0-45840c677364@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2537; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=/7hR7DixqOgS4KZb6hJUlWRSv2ZNfu7+shwQXIzUjYw=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBoA2Y9h089Bx4G08ky0bXQWsmU0gbfg2HeX6Qyf
 AnWVlCdAv2JAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaANmPQAKCRBy2EO4nU3X
 VkguD/9p9P1ohv09/j3YVNceheZnbEC6Ut8ynOEt4NnGDiOmDuwACuY51txgOIroA/9bnEoavxs
 pw924TI8HRSbUri6ZBdpbAxxQ0IMzYbR1qRFExMAy8vcEenxqKDvxZ67zTUvn7jsSRCtPdrBbDv
 jHduqV/ijCtwIKEvL04p2CL6wLENYy79wUVc3d4SfEAXS4uv3ajrphryq2BbE5d5Y0Eqr9B/PKu
 bGP2k/iZLpOtL2CspOyyrd750M3Gi0UJUmluHcT4rEQ3IJaMq9fNLdafyJqmVIpwsBrC+9WE2r5
 8xvYTGvHDMnGD0U1M2pf76vl0DH1/W35nsY94/mJhsysxItWBoQTxnfa+02N5cWFe6mJaxev8Nm
 GtFLSLMrqY+I+H85MJlcbgRyMD4IZSXhUS3yLb4160c5YaqPJzlj5UjnHiphSZ7Da4Tm8PQeIIj
 NNfHemOm5fkdtQJZ/6LRVx3aNfJrklHDiDBvchlL+I0PnXPXeabwfPx3Mjat8EsgICO+oSkLyjY
 0u2FOkxuQ3MoQ5d6b7hOeFPk2s3GgxT6hCuCdgDMbddD3FQtt1II5AwGGfT8VmRl74ROjpy7dgH
 PJL61/l58Dgd7MlvgCulGaxYL9SYoFb7DlPt+3pa3x/Ewnh4h42yaT8qd8IV1nyteJV1j0Jm15L
 yu6kcUijPEaVQ4g==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Kevin Widjaja <kevin.widjaja21@gmail.com>

Add the dts for the Z Ultra. This is currently almost the same as Z1
Compact (amami) and Z1 (honami) as they share almost the same hardware.

Only USB Networking and volume button are confirmed working.

Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm/boot/dts/qcom/Makefile                          |  1 +
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts   | 16 ++++++++++++++++
 .../boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi    |  2 +-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index f06c6d425e91dd73c2b453d15543d95bd32383b9..597aa98bb2273619b10c3f97dac515e8fda5eeda 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -46,6 +46,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-msm8974-samsung-hlte.dtb \
 	qcom-msm8974-sony-xperia-rhine-amami.dtb \
 	qcom-msm8974-sony-xperia-rhine-honami.dtb \
+	qcom-msm8974-sony-xperia-rhine-togari.dtb \
 	qcom-msm8974pro-fairphone-fp2.dtb \
 	qcom-msm8974pro-htc-m8.dtb \
 	qcom-msm8974pro-oneplus-bacon.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts
new file mode 100644
index 0000000000000000000000000000000000000000..f60f7304d35e1e534bb350078dae900ec54700d4
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "qcom-msm8974-sony-xperia-rhine.dtsi"
+
+/* Togari uses a different touchscreen compared to other rhine devices */
+/delete-node/ &touchscreen;
+
+/ {
+	model = "Sony Xperia Z Ultra";
+	compatible = "sony,xperia-togari", "qcom,msm8974";
+	chassis-type = "handset";
+};
+
+&pm8941_l23 {
+	regulator-min-microvolt = <2600000>;
+	regulator-max-microvolt = <2600000>;
+};
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
index 667b3aaa52ea030ac9d2c92cdf75633ff878f34d..dca7b5f9f21148beb921d224b0b2257f22884024 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -84,7 +84,7 @@ &blsp1_i2c2 {
 	status = "okay";
 	clock-frequency = <355000>;
 
-	synaptics@2c {
+	touchscreen: synaptics@2c {
 		compatible = "syna,rmi4-i2c";
 		reg = <0x2c>;
 

-- 
2.49.0


