Return-Path: <linux-arm-msm+bounces-60864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 133C6AD41FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 20:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 827D13A48A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 18:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD4A2472B7;
	Tue, 10 Jun 2025 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="eoCZxRd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA4A2459E5;
	Tue, 10 Jun 2025 18:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749580556; cv=none; b=Qn1OeJynJEDiy5Yl/cf3uGIf95lAt10L1VhnwzTASTxasbdpWOSc4cwwuEe3MOgeBr2i3DypMI5SdRsKigZJhko7rnu6xCL4RuVkv+lSwiTCUi0DbG6RUapHoIs6gH1/DwMqtLwMmIS9mUiYXELrndQezA7uqKcbdqlKZiMJZJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749580556; c=relaxed/simple;
	bh=6CL6EBCe6hQQbrc8yKgPqExIyIbxxxaXl+gAADiR3bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HtRlafTxlFlJ/36euDoo3XnHJ76Zn0Mx7arDql/B+VS73WsR4sJgZCtCV2Ce1mUynkrVK+JqFV6r8p6P24w74Esm5VgOB3ZwalLLC6OPxOpA71vO1pRbhOqYAsRbKEmZbsEa9WXLMB71BRw3xlP2dUPUp1ytWIcGB6xcoGOcSbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=eoCZxRd0; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1749580552; bh=6CL6EBCe6hQQbrc8yKgPqExIyIbxxxaXl+gAADiR3bs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eoCZxRd0A7nElkXGQdtJlTomNMkQ3EZsiRwHWGs2r2avwFVEszUILl0uInJGgVw8e
	 hCABvZ3Rngs2QdIJN6hTbJ9wx7yX9K1W6QwlkmVSNlcYM67sP0dq0o/y7uslcml4iX
	 vIH607tYhRJ62V94Eq6Xhv7Gw7zBABHzrwXJ/UZY=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Tue, 10 Jun 2025 20:34:53 +0200
Subject: [PATCH v2 2/4] ARM: dts: qcom: msm8974-sony-xperia-rhine: Move
 camera buttons to amami & honami
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-togari-v2-2-10e7b53b87c1@lucaweiss.eu>
References: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
In-Reply-To: <20250610-togari-v2-0-10e7b53b87c1@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Widjaja <kevin.widjaja21@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3378; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=iVl3UueI2T38LKspxtaDL3hoDYy9Wa1gzTEtqLhQpMg=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBoSHsFAzvs1gEXBXmp9oyRHdGEi06LwNx+QemLe
 kXK3mIJ/JmJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaEh7BQAKCRBy2EO4nU3X
 VhFmEACpkAzeLQ1cGJkUf1bO1MdRijuOC58NZElA6kFWP0dcmHopfCr/WAPfvhAS0qsu9R1iMv0
 QQivvrka7QaerWlCawWzjpktnf1NkLX1IWB94cu0yaqftmu0vGyGql4WzYcoZglgWfVKiMExqpl
 DiuuRqi44kmVeonM1upnncwGSQyJVe5l/IbX/6noWpfZ5tGjnJlZKumaKtxSGFQ4+63dLzgLdmk
 1UZO5yF2xqLjqeQcobMEwVWoCBGtrvzuwLsCscXf9P5TstrxmA3m/mVlwiCTcrLkX2TksLBzmg9
 bawc8591kmmHMjBiCx/1svprotoLFrwLkNv23JQiovZW0Wy+KomM+7KF5qNN4i4PkQhpud5RYq/
 i+7MRcapRV9S1aWz5DVyL4oWt/djP/1Rplg9XavDpn9AUAQdSDJubuGuFWXFAJCruQQl0Gaxp2Q
 qKFr31kZbzsBZwPeUIPGeTcsaEmf8AoV4Qw+6aRRtceBk4fQ0tKzUmelM6QCFwgcyoHYwkvV/qd
 VI1Lp+bpATSo3y1FlvxCnvszSktolT0HqaCb5OP++Qeajjp9+BeoGF0/oe5l6BQqXwfls0DEYo+
 kC/jOYQKn7NDKC6KGxC1V6qsZo2d2Qq3qmd9paakdLkpHNvifstfx8pyCyQFQPOaggi0JM5MgI5
 zDIaykTL8iMXnMQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Kevin Widjaja <kevin.widjaja21@gmail.com>

An upcoming board in the sony-xperia-rhine family (sony-togari) does not
have dedicated camera buttons, so move those from common rhine dtsi to
amami and honami dts files.

Signed-off-by: Kevin Widjaja <kevin.widjaja21@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
index 1dc9fa7f3ca00a13f4a33989cbdfc715176e3307..bf539e741ec060de67e7cb656a597abbc16650fe 100644
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


