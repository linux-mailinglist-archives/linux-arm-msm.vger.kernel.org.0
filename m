Return-Path: <linux-arm-msm+bounces-145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 608E37E5038
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 07:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CBAC1C20AA9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 06:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F08CA64;
	Wed,  8 Nov 2023 06:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsUdkLgX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8F1CA61;
	Wed,  8 Nov 2023 06:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFA9EC433C7;
	Wed,  8 Nov 2023 06:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699423519;
	bh=jPf+EyCFsnTuZYFqVKcAr8GvhtDbrpKc2fnaZTnUvME=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=dsUdkLgXcLrmh02Wvi3sYoRj3QXSGKjbTy5O9sfKJu915lnSE64zSOMamWChmkJsJ
	 V1M9C7f3DZCtiVDCGzlIkVoMEEViIrrN/tTHMwgbKSZhayjjHpaqXqk6wCbdTb9F/L
	 PtrWFJwUHTkVhqT5AZVaj7AiORHK5AGQmOoqXg2LtaPL0op+KgmHEGi2wtOhvLJEZL
	 kEv1fHnZhSqJAHuuVpep8R+UnMVkLMePZ+zflqLkwAqVUCl7ZnOt3aFxIDzesjHYXJ
	 f5Yf80lJGO0dN8EdCTycDzo3OAMrIZ4QfaOq6fDqOX9WMJ1ZzFnV4abvo6YvmcGh6V
	 1y2RTtSCtX1qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96238C4332F;
	Wed,  8 Nov 2023 06:05:19 +0000 (UTC)
From: Hui Liu via B4 Relay <devnull+quic_huliu.quicinc.com@kernel.org>
Date: Wed, 08 Nov 2023 14:05:12 +0800
Subject: [PATCH] ARM: dts: qcom: Add LPG LED device description
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231108-qcom_leds-v1-1-c3e1c8572cb0@quicinc.com>
X-B4-Tracking: v=1; b=H4sIABklS2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDQwML3cLk/Nz4nNSUYt1k4ySDJHMDI0sDAwsloPqCotS0zAqwWdGxtbU
 AJTBULVsAAAA=
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, quic_fenglinw@quicinc.com, 
 quic_uchheda@quicinc.com, kamalw@qti.qualcomm.com, 
 Hui Liu <quic_huliu@quicinc.com>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699423518; l=1242;
 i=quic_huliu@quicinc.com; s=20230823; h=from:subject:message-id;
 bh=NDo+ug2xivotbN/xsmZgwuX6Kewv3ppT7LsFeWs76Jw=;
 b=RljxyHRNT45DJuHIAuZuGUdPAx1iNvdE50l+UdUDEOalLsuw49dIGrF8fUhBac0Cgpic77vmG
 QPJ6QM17/SDC1A5fMZ8TeAn2e9q1TxYc5bOQbl0TZutUnDGAKgrX2Hw
X-Developer-Key: i=quic_huliu@quicinc.com; a=ed25519;
 pk=1z+A50UnTuKe/FdQv2c0W3ajDsJOYddwIHo2iivhTTA=
X-Endpoint-Received:
 by B4 Relay for quic_huliu@quicinc.com/20230823 with auth_id=80
X-Original-From: Hui Liu <quic_huliu@quicinc.com>
Reply-To: <quic_huliu@quicinc.com>

From: Hui Liu <quic_huliu@quicinc.com>

Add LPG LED device description.

Signed-off-by: Hui Liu <quic_huliu@quicinc.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index f28e71487d5c..11b9f384d99c 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/spmi/spmi.h>
 
 &spmi_bus {
@@ -34,6 +35,27 @@ pm8350c_pwm: pwm {
 			compatible = "qcom,pm8350c-pwm";
 			#pwm-cells = <2>;
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_RED>;
+				label = "red";
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_GREEN>;
+				label = "green";
+			};
+
+			led@3 {
+				reg = <3>;
+				color = <LED_COLOR_ID_BLUE>;
+				label = "blue";
+			};
 		};
 	};
 };

---
base-commit: b9604be241587fb29c0f40450e53d0a37dc611b5
change-id: 20231108-qcom_leds-c3b0b7029008

Best regards,
-- 
Hui Liu <quic_huliu@quicinc.com>


