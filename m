Return-Path: <linux-arm-msm+bounces-54793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4CCA9426A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 11:01:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40ACD18940A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Apr 2025 09:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B8F1C6FFD;
	Sat, 19 Apr 2025 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="R8iu/eTR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B28318DB29;
	Sat, 19 Apr 2025 09:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053262; cv=none; b=Z2yNlf8whGy4Ffs+5HWMJCCkS1f9kgkULOLAnkn5MOD5pk+x+WAPPbsxSmYuvm3meYYAQ94PtlTYgDvA3K9GFYE2/DpDenzut7442Q6JXat9DaVHhvGl6X80PqeBU2w3M2gb42kGLauQJlzYiUyyAAFMC8WiDLwKeFLbHWd6QUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053262; c=relaxed/simple;
	bh=lt5Tbb7yoGzLnlkdrJgHcDdnT2gzIVPFvz4u8klWAPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BOiTaMSFHSEQG1WDdQxK/NvFzKI1oONPAAyf/3Z0HR0toHVfLgIYspphefrU0VbAqHo5HLtLjniVpFIO7mizji6/DbrWzQ5eMLKxgs8JrBYPm1/7JzaONfH/foeByEOmUuvVbLDH0uLChYgm/MPJ/mq0GHDfTxFo9KzKqe5ZGHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=R8iu/eTR; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1745053251; bh=lt5Tbb7yoGzLnlkdrJgHcDdnT2gzIVPFvz4u8klWAPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=R8iu/eTRX/MmerwguGS08M9WfDX+G/VYDazv9Pw3E7q+bvI1LhVhBs+/4ZoRvNUNc
	 EsAO0inN8pwxVXmLDu0FgYtXzx1U1gFctlgsHffTh0XfGlHpnIcWzP6bnJ6/+nIEk/
	 vc1VegCvPLx1awY6macwle9TYXyVM/RBodLW0uDA=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sat, 19 Apr 2025 11:00:39 +0200
Subject: [PATCH 2/4] ARM: dts: qcom: sony-xperia-rhine: Move camera buttons
 to amami & honami
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250419-togari-v1-2-45840c677364@lucaweiss.eu>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3311; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=3yIOYaj6eDb54x1obIXLMDmJ4v5EeAK4/3bjSDAvUfc=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBoA2Y869gNBIHttSK6pGTsPUmzbKp6D87awvAEH
 KGDN+C2iYiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaANmPAAKCRBy2EO4nU3X
 VhKgEACZqGsO3DP2YqyFJaWIT0ZPaxwH92XBlLkVtXw+/wM9R/iJpvxa2W7W2hyuOhmgbw2VaCf
 25HM6jy0uf8DJnGfXKC6KBtkibel/r2akbgSWI3vsJgKISzubLTMP0Qx2fZc+rdEFAJ1hdj5DFJ
 2bVG/tUKY0eHNjKmb7+dX5SR21l1IKG2L4nVY2dfm/ijR8ab3s/+EFdFY4QOQwcRngfDYFspQOh
 Q7VO9qvl2C855MtjLcKk/PTKjg2jBvGdh5tAmfN4vPNSVkJaZULW6s2ufODvyYruzIFaESAi7VE
 qbCTJQWYSYRf3WdcFZU0S3HY4yeYfXoW82eXCQ8M5PdrQ2lQzrurXnxgIP8ba73y77avkQalZFy
 pRmNRBEgoQIY/KTh0zN2noaevQIts7WwLswFSW+wtRpfS2SXirDgQ1Gw1JRLxzX/4b1wJf1GdgD
 TE5eJLxhjitUhrxJDmb7lZacNGkBbypwYOPh1y/9uDOefsRL9T4WK3/1Wjxpk0vw6XQxIUU11IZ
 vszewwvtbbcZQZncuAyEYmvdSbPB+fGV0x4dxvWUZiWEHKQjRdu+XiVq+IX5gVnvAqySkqJZCFd
 faoRE+c7uJ1K25rNHYRV7+rcIwISPOWCpElponw4wVwxDVtB0SSx233keHQEiIFn5MNek13zTzS
 XnztfwsjLex5uvA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Kevin Widjaja <kevin.widjaja21@gmail.com>

An upcoming board in the sony-xperia-rhine family (sony-togari) does not
have dedicated camera buttons, so move those from common rhine dtsi to
amami and honami dts files.

Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dts    | 16 ++++++++++++++++
 .../dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dts   | 16 ++++++++++++++++
 .../boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi    | 14 --------------
 3 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dts
index 9f2ab5c122d0b89e0ce343bec4d47ce238ade4f4..472a45408add20ccb685c4f3255e1b895e722ab1 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dts
@@ -5,6 +5,22 @@ / {
 	model = "Sony Xperia Z1 Compact";
 	compatible = "sony,xperia-amami", "qcom,msm8974";
 	chassis-type = "handset";
+
+	gpio-keys {
+		key-camera-snapshot {
+			label = "camera_snapshot";
+			gpios = <&pm8941_gpios 3 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_CAMERA>;
+		};
+
+		key-camera-focus {
+			label = "camera_focus";
+			gpios = <&pm8941_gpios 4 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_CAMERA_FOCUS>;
+		};
+	};
 };
 
 &smbb {
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dts
index 9028f17e5c4a76e3d381eec0356591ab245b4569..c3d69641fc1da971dc34885e66c6cb05bc727ddd 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dts
@@ -5,4 +5,20 @@ / {
 	model = "Sony Xperia Z1";
 	compatible = "sony,xperia-honami", "qcom,msm8974";
 	chassis-type = "handset";
+
+	gpio-keys {
+		key-camera-snapshot {
+			label = "camera_snapshot";
+			gpios = <&pm8941_gpios 3 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_CAMERA>;
+		};
+
+		key-camera-focus {
+			label = "camera_focus";
+			gpios = <&pm8941_gpios 4 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_CAMERA_FOCUS>;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
index 915221e00ff348309b62bd9b637ae9771d213f1e..667b3aaa52ea030ac9d2c92cdf75633ff878f34d 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
@@ -28,20 +28,6 @@ key-volume-down {
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
-		key-camera-snapshot {
-			label = "camera_snapshot";
-			gpios = <&pm8941_gpios 3 GPIO_ACTIVE_LOW>;
-			linux,input-type = <1>;
-			linux,code = <KEY_CAMERA>;
-		};
-
-		key-camera-focus {
-			label = "camera_focus";
-			gpios = <&pm8941_gpios 4 GPIO_ACTIVE_LOW>;
-			linux,input-type = <1>;
-			linux,code = <KEY_CAMERA_FOCUS>;
-		};
-
 		key-volume-up {
 			label = "volume_up";
 			gpios = <&pm8941_gpios 5 GPIO_ACTIVE_LOW>;

-- 
2.49.0


