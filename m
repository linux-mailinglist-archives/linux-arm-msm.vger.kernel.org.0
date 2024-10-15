Return-Path: <linux-arm-msm+bounces-34426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF5799E9BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 14:26:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB59F1C228CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFEB1EF0A8;
	Tue, 15 Oct 2024 12:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2ttCNO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625C31EC009;
	Tue, 15 Oct 2024 12:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728995158; cv=none; b=FJAyh5mXRXMX+HRCiQsaVg+cxgsZvtzn/qSUNFzsUd1+YZvL9DMsxKkSrU4tqq7JOs4+kHNBEiBYyK4hD2Mbso7QzjvDrhZXq1SeexOSJEROOspC8YScyBBurmhcJ1aru6Ru/qPYktfaDz2cIBOmP6jIrq3vMQhD0PX/gyfvHVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728995158; c=relaxed/simple;
	bh=7zldfmMuhDk//2zSd5O20XcO7pAQ8G5PPY70CN0hlIY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s25GnSLmJskOjwXzVIKOkkmsw5ZyJtSeQHDf0iu3mMqJ09rEogDGQ1pDaJyfE8Q/oEqX/lbXgtFo6SiEgBLLwcVymAZR3vAJ59fZvnRuflIfFfuyF2bEF/CgOnvjLw6znLcLXiJ/JMcLioyGrlSB5+pSAaigNw+kD75mCEm4VlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2ttCNO4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBD9C4CEC6;
	Tue, 15 Oct 2024 12:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728995157;
	bh=7zldfmMuhDk//2zSd5O20XcO7pAQ8G5PPY70CN0hlIY=;
	h=From:To:Cc:Subject:Date:From;
	b=R2ttCNO4fiW44N9YTgSROJuqJuJALjyyNgfaRl9hVfVFAAiWxQob+063FPiZZAss9
	 ZSpjJ1PzRdx8MtbezVbKfiK9a3HbMdmUAPAkax0iVgvYGhzFzX7amVA4Sl29+5y2d9
	 9zwbkxTQNHUBxw4u2yBJ/TMXAt2QM46FnoL6yyvxij5aUDiaThW7d7QNDNj2xCkv5l
	 M8Vr89l9LhGM+JopEQMQ5ayIf24mvAm0q3pr8K39j8XXhu1eBKtLVj7UcfW5tVdTOr
	 rj5qosCzfn5h64Kyyz6ElnZISqOUbKur1N6rVqnkn9gXm1W8piVGb1xVb8JyTYQeBh
	 oreCQVnDDS2mg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1t0gcl-000000004CI-0rIa;
	Tue, 15 Oct 2024 14:26:03 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] arm64: dts: qcom: x1e80100: rename vph-pwr regulator nodes
Date: Tue, 15 Oct 2024 14:26:00 +0200
Message-ID: <20241015122601.16127-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the x1e80100 vph-pwr regulator nodes to use "regulator" as a
prefix for consistency with the other fixed regulators.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 .../dts/qcom/x1e80100-asus-vivobook-s15.dts   | 22 +++++++++----------
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts     | 22 +++++++++----------
 .../dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 22 +++++++++----------
 .../dts/qcom/x1e80100-microsoft-romulus.dtsi  | 22 +++++++++----------
 4 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
index 20616bd4aa6c..b1f190a9686f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dts
@@ -94,17 +94,6 @@ linux,cma {
 		};
 	};
 
-	vph_pwr: vph-pwr-regulator {
-		compatible = "regulator-fixed";
-
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
 	vreg_edp_3p3: regulator-edp-3p3 {
 		compatible = "regulator-fixed";
 
@@ -135,6 +124,17 @@ vreg_nvme: regulator-nvme {
 		pinctrl-0 = <&nvme_reg_en>;
 		pinctrl-names = "default";
 	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &apps_rsc {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
index 4ab7078f76e0..4ab9e0ca4591 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
@@ -261,17 +261,6 @@ platform {
 		};
 	};
 
-	vph_pwr: vph-pwr-regulator {
-		compatible = "regulator-fixed";
-
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
 	vreg_edp_3p3: regulator-edp-3p3 {
 		compatible = "regulator-fixed";
 
@@ -319,6 +308,17 @@ vreg_nvme: regulator-nvme {
 		pinctrl-0 = <&nvme_reg_en>;
 	};
 
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_wwan: regulator-wwan {
 		compatible = "regulator-fixed";
 
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index 3c13331a9ef4..10ba934652c3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -166,17 +166,6 @@ platform {
 		};
 	};
 
-	vph_pwr: vph-pwr-regulator {
-		compatible = "regulator-fixed";
-
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
 	vreg_edp_3p3: regulator-edp-3p3 {
 		compatible = "regulator-fixed";
 
@@ -206,6 +195,17 @@ vreg_nvme: regulator-nvme {
 		pinctrl-0 = <&nvme_reg_en>;
 		pinctrl-names = "default";
 	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &apps_rsc {
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 42e02ad6a9c3..c47a63b5c85b 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -125,17 +125,6 @@ linux,cma {
 		};
 	};
 
-	vph_pwr: vph-pwr-regulator {
-		compatible = "regulator-fixed";
-
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
 	vreg_edp_3p3: regulator-edp-3p3 {
 		compatible = "regulator-fixed";
 
@@ -165,6 +154,17 @@ vreg_nvme: regulator-nvme {
 		pinctrl-0 = <&nvme_reg_en>;
 		pinctrl-names = "default";
 	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
 };
 
 &apps_rsc {
-- 
2.45.2


