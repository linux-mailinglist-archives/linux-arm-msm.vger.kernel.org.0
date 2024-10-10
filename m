Return-Path: <linux-arm-msm+bounces-33796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEA1997F53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57A7628326D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A73F1E282B;
	Thu, 10 Oct 2024 07:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHcH6rkB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CF21E1A16;
	Thu, 10 Oct 2024 07:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728544949; cv=none; b=NgF1Frj1gxBC06Nq1W4AzOPbMvrp7xPry+ol6sPNU+4/aQbEUqO5YD4LbSXT4q01VkBUOCHQtFkmgu91vaYBqRItlf7+pFgPOxjPBskMVVlnltM5aDiWXvaA33id2wu0R161u+JyQBTRXSroPB79+4Yf7r7s78fW3ln/b5kcX4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728544949; c=relaxed/simple;
	bh=hwGEak4KIJ11eUuNaEq87hocGnQxvDOhCJ9VphQmOaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OndLIAAzq5fq6bsC0eChM8RL3CtM8APQZBFIT9c3JR+zSgJuxfiYrWqoY//e8pG2jePN8x/kMLYaA6fxpX7G2Okt3/qzxTzpwmXVfooT5pn2KY8D5NK2RQ0cCjMOjD48vJVY34WRZ16EzLnOYCz8Hk2GI7a42qNXXK+O4lb8AmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHcH6rkB; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c8b557f91so1720915ad.2;
        Thu, 10 Oct 2024 00:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728544947; x=1729149747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fAZN9C/GFdXF6RdMc8O3pl7Hwn2h+nafu8g8plyOOA0=;
        b=LHcH6rkBaLb9wVkigMocXBN+sCpNsgrKTEE8P1jg78LlTb+Qxfk87yikPNP5q31wXF
         gWligxz1Q+9yCp/I79nWL1rbbYTBBhWakt2UU89/lHmWXclZX+Or1IhCEK+b8k5sIUxq
         Ad7EPyHOoQx2wEwSfIsBXu8ZVXSzepLirhMVttlI8Uo35DBS6IUcg7I9dy/DdfUnglLX
         4hbcf0lD0UfMo2Q3rMvjnQmlpEv98ozydmBVB7JcxqqV6gw2stsgUOt0BhQfOmJOGdWS
         tZ6DDMFe7OcEH1hO7C+IiFlOYyp45YGYmPLgjOBP5zGQ89IU7SGiRAdgqDuBrebV5Adz
         3P5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728544947; x=1729149747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fAZN9C/GFdXF6RdMc8O3pl7Hwn2h+nafu8g8plyOOA0=;
        b=cEQ0jIQYKAnltHdSIIXNU4U9CxaFYvf6MIe5gu0GRzr5g341YQIkws53uyLMCtXGuL
         zosI25KFyc2/R6QLyW7fiVqynJr3+j5MGb3jFiXZNLdLA4VWtm5CKFYIHb5FUxS7GSfI
         1NbU8Au91hl6ArJYY3lNWYg41wDR1e4fb2DPN/X37fAMGb+4ujlOgWtOYWkFd7Vspik+
         1/8nl8uhlQv7dwGvwJCuQ0xlTysR+VqUymM4jjIhGQgGaUJq4+s84lS5J2sGqyC6yV4P
         bELadqsMci1XzPHjtXUOTtsTtb0Sxc7cMiD8FY0spkpFK/gmqWTWrGGiUcM8M8KwI9To
         /VDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqIjhuhcsco1NbISVQPC9E1ft69bQqHu+hncwS60xppI4j9OP599BvCFq0rj8JKLJDAL++6DDyBBHm@vger.kernel.org, AJvYcCX9gIrpkz5WtQtTROfBA+FVNDt/9TB8M4cwysSI50SX3nGvWg8S/O8/Hye3Z9rb9GNuRURnN89z6RXoHA4O@vger.kernel.org
X-Gm-Message-State: AOJu0YyT7OofHkfaRZ1MNe8EkGyti3s5hpTLk49G7P5+lwRPP0sLI+rX
	87a8FGUJUgHZMOW8j2+ru5q8x4a2IBFGmnsN6ZCoIweY2BOCdQsS
X-Google-Smtp-Source: AGHT+IGun9eCRZcpSJMPC1tFvuB8ARPLpuejb55VSsC6xFiZnGFpWUrfZe4+TzhboBaOJ0IQkXJifw==
X-Received: by 2002:a17:902:d4c1:b0:20c:774b:5ae5 with SMTP id d9443c01a7336-20c774b5cfemr60270875ad.9.1728544946915;
        Thu, 10 Oct 2024 00:22:26 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c21616csm4413865ad.224.2024.10.10.00.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 00:22:26 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH v3 1/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add qca6390-pmu node
Date: Thu, 10 Oct 2024 15:22:41 +0800
Message-ID: <20241010072243.10227-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add qca6390-pmu node, which is used to manage power supply sequence for wifi and
bluetooth on sm8250 soc based devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
No changes in v3.

changes in v2:
1. pick up Dmitry Baryshkov's Reviewed-by

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 3596dd328c31..ebea283f56ea 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -97,6 +97,67 @@ key-vol-up {
 		};
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s6a_0p95>;
+		vddrfa0p95-supply = <&vreg_s6a_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p35>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p35>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -701,6 +762,22 @@ &slpi {
 
 &tlmm {
 	gpio-reserved-ranges = <40 4>;
+
+	bt_en_state: bt-default-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-up;
+	};
+
+	wlan_en_state: wlan-default-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		output-low;
+		bias-pull-up;
+	};
 };
 
 &usb_1 {
-- 
2.46.1


