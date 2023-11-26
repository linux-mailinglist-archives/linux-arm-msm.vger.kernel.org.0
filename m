Return-Path: <linux-arm-msm+bounces-2022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE0C7F90F6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Nov 2023 03:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6832D2813FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Nov 2023 02:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEA3138F;
	Sun, 26 Nov 2023 02:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4bWSvjj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D362127;
	Sat, 25 Nov 2023 18:29:06 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6bd32d1a040so3019888b3a.3;
        Sat, 25 Nov 2023 18:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700965745; x=1701570545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1u8RnYufqQNrSSEpBJB5j2w/wLYGiG0sRTQz3GvAHk=;
        b=h4bWSvjjYER/qXlYgrb3P+sCiDWumsBL1lbT0He1DoxdLi1TcZls5FjAlUJ/eorPIz
         ux90/fWqdJxDyFWvH013QLdxr9ebzrc7JhHFePkBCrFyZu5xGSeTizBsw4JGWAoFPxr5
         674SlGfOCoaHup5wPCGuT1/zkFcOHVA1lKPTvZOAk5DVOCxEmwiw0KL/zzrGvMrr7YVd
         10azQLKQIW1OzDzbhAg7/d3fSqYxnBnQG6qtnbAgLHFA+yDIB+KO3VG/TijZoBzalVa7
         PXeQXwg9N2N5ehTAjP1017/pgk0yi8PtmOzGm3oCw9hUSRSwfJWHW3LO/KtLpn6/Ija+
         ftTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700965745; x=1701570545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P1u8RnYufqQNrSSEpBJB5j2w/wLYGiG0sRTQz3GvAHk=;
        b=M2SuSqmFCZsZsIFnBClKZx2H0B5xd3JxHT5VpsgvAiK9CJI46iBFJS8YDqfwYe2b58
         tSXRZWLRO56ah4YDOilPXUW3bZe8OBOGMPzXCbl0QbIC1Nkt0SKPG0ZnDA8sPznXf0mx
         7LeObcEmnmprdMHLFLltnih3dXjPtFY+Pc9awRE3y56biMQ6D8pPFnETaDjCiT3IizGp
         v3SqLMLp8WQzEn63CeXIWKlZpaGlEj+OoYHeJdHn+VgRXRJ8/qr1PQbbFu7uyS2HNPaz
         RNe3/4oseRl/wm0/sb3xqi3yPIP2CNi9Pu7iUAB+I/LQIxnOISqkQijt1GSt/66eudWD
         7k8Q==
X-Gm-Message-State: AOJu0YzUVZg1lIVyvhwYJdxa2kPmeBlN6umCvGPHv6Kc4fHbqCIS/ohR
	Gec46/JtrZdI4huc9BzvCCs=
X-Google-Smtp-Source: AGHT+IGv6qQUhlwklgkmfzLhvCVpf3TXWWtE2sCfhPyVABtBpSAdcQMopN9XevGjmBaGO05EyoXonQ==
X-Received: by 2002:a05:6a00:1d83:b0:6cb:8d97:3df3 with SMTP id z3-20020a056a001d8300b006cb8d973df3mr9496862pfw.5.1700965745448;
        Sat, 25 Nov 2023 18:29:05 -0800 (PST)
Received: from localhost.localdomain ([192.166.114.90])
        by smtp.gmail.com with ESMTPSA id x18-20020aa793b2000000b00688435a9915sm4961821pff.189.2023.11.25.18.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 18:29:05 -0800 (PST)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH v3 2/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8150b type-c node and enable usb otg
Date: Sun, 26 Nov 2023 10:28:49 +0800
Message-ID: <20231126022849.14273-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231126022849.14273-1-lujianhua000@gmail.com>
References: <20231126022849.14273-1-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add type-c node to feature otg function and set usb-role-switch property
for usb_1_dwc3 to enable usb otg.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
Changes in v3:
  1. squash patch[3/3].
  2. update commit message.
  3. add pm8150b_vbus node.

No changes in v2:

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index 3d4ea428e4cb..946365f15a59 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -627,6 +628,41 @@ vol_up_n: vol-up-n-state {
 	};
 };
 
+&pm8150b_typec {
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "source";
+		data-role = "dual";
+		self-powered;
+
+		source-pdos = <PDO_FIXED(5000, 3000,
+					 PDO_FIXED_DUAL_ROLE |
+					 PDO_FIXED_USB_COMM |
+					 PDO_FIXED_DATA_SWAP)>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm8150b_role_switch_in: endpoint {
+					remote-endpoint = <&usb_1_role_switch_out>;
+				};
+			};
+		};
+	};
+};
+
+&pm8150b_vbus {
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -664,11 +700,12 @@ &usb_1 {
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
 	maximum-speed = "high-speed";
 	/* Remove USB3 phy */
 	phys = <&usb_1_hsphy>;
 	phy-names = "usb2-phy";
+	usb-role-switch;
 };
 
 &usb_1_hsphy {
@@ -678,6 +715,10 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
+&usb_1_role_switch_out {
+	remote-endpoint = <&pm8150b_role_switch_in>;
+};
+
 &ufs_mem_hc {
 	vcc-supply = <&vreg_l17a_3p0>;
 	vcc-max-microamp = <800000>;
-- 
2.41.0


