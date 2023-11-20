Return-Path: <linux-arm-msm+bounces-1174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9DC7F1534
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 15:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44119B21952
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB75F1C29C;
	Mon, 20 Nov 2023 14:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="NetaeWoS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [194.87.146.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6FFA10EF;
	Mon, 20 Nov 2023 06:03:46 -0800 (PST)
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id CE14641C8C;
	Mon, 20 Nov 2023 19:03:40 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1700489021; bh=cGxQVt+NVbaQIsSjfqmJUKIMf/PR6FSgo/FLAfIdsik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NetaeWoSzy6hx0ThcsqTyd88xLdda1hsW7QjBpdxRda1PiaGgxi41LfXu6DEJ7cio
	 2eoiOAJFn89bUyp/ryBAEq0pBhpkY7juzPRV9302C/pqG/el1jw/B0wmIDJs96bxls
	 rZdVZp/Ku7geSgkr0Q1C0TEurdqhmkw91nmVJYdtrGYdsunMieRuaS2d8Y7tPP9KDP
	 pY5VDKn3/uLSA7ThX5xoAMedNdzEZdjLcG3dK4bJSFKUz1jYEiHs8e39NQuNfj5xsB
	 RlevYlZGDKOk2ivUbg2m53TE22ysCC6779U4V4kZM3VRVz5yr/qDoWmk/kwNhpL7Og
	 OKzbeTpSrFiHA==
From: Nikita Travkin <nikita@trvn.ru>
Date: Mon, 20 Nov 2023 19:03:04 +0500
Subject: [PATCH v4 2/3] arm64: dts: qcom: pm8916: Add BMS and charger
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231120-pm8916-dtsi-bms-lbc-v4-2-4f91056c8252@trvn.ru>
References: <20231120-pm8916-dtsi-bms-lbc-v4-0-4f91056c8252@trvn.ru>
In-Reply-To: <20231120-pm8916-dtsi-bms-lbc-v4-0-4f91056c8252@trvn.ru>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2360; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=cGxQVt+NVbaQIsSjfqmJUKIMf/PR6FSgo/FLAfIdsik=;
 b=owEBbQKS/ZANAwAIAUMc7O4oGb91AcsmYgBlW2c6wY2c6XqAiTk2FnLRWhwUtpSFzC7/q00Nq
 OUIcnOCodOJAjMEAAEIAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCZVtnOgAKCRBDHOzuKBm/
 dafFD/9F1dMePHKR/saUSqP6doyBMFABCcvg46qy03xY3VWDQF/6/hefPTC7sINYtptOf0YXuzN
 5Ez25j+mAz+H2Qpt086020crP5NrNAJBxOeWlVLakJKK/L2+b9SKkrfQ6bQZ8Q7kYXtTw62sc3/
 Q0aEHN/DTvpsJ6mZCP94HPzfKdkUWs1Eo3RrRzkvptPmXeDtSTzHbM1P/2XWYrejzCbyuTCqL9i
 mnnlVIamdAM+wYkVO3Fi/uOyfPIIDELvaNdkIf2GPHqxxTx1yusTskYtGPOptKaL5xiOsM2vd5D
 S750NWieowEX+xds7B2Er4f1kjgz1mD3bBQTq4oHZ2bB1zTd/FWZSKE/OcGWYWdmKchwQrkqwTQ
 PY3cvyWnoUVrbuM0LtU0dEZ6/EU7FKd7ITTbx4L/FlDmdb8miW3iuYb/mzjrrTYteDt/MKJWNa9
 /HcwCd4TkmIqjWh7EpK9spCUG56e8G8H/Ld4+xyPxU1vzIhHu8nQ3VEnAjKn24LC0b8GeAZ+bE+
 TX703tEQJNxIhZQb8cttY4mYVRvZ4T5YOvYaeEjwzYac89Yd9w/MLHe+4DxE+tnEXmimW6MTERz
 hpH3AzVEyo+10AvBXcP4s6lpobMFHiOGTw/UrrIAIPnpbbIUSQaXu6fCJaqjL/yCiE0LhNYv6lc
 cs+Cz3/xXZzEsCA==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

pm8916 contains some hardware blocks for battery powered devices:

- VM-BMS: Battery voltage monitoring block.
- LBC: Linear battery charger.

Add them to the pmic dtsi so the devices that make use of those blocks
can enable them.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 arch/arm64/boot/dts/qcom/pm8916.dtsi | 48 ++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index f4de86787743..4b2e8fb47d2d 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -41,6 +41,35 @@ watchdog {
 			};
 		};
 
+		pm8916_charger: charger@1000 {
+			compatible = "qcom,pm8916-lbc";
+			reg = <0x1000>, <0x1200>, <0x1300>, <0x1600>;
+			reg-names = "chgr", "bat_if", "usb", "misc";
+
+			interrupts = <0x0 0x10 0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x10 5 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x10 6 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x10 7 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x12 0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x12 1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x13 0 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x13 1 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x13 2 IRQ_TYPE_EDGE_BOTH>,
+				     <0x0 0x13 4 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "vbat_det",
+					  "fast_chg",
+					  "chg_fail",
+					  "chg_done",
+					  "bat_pres",
+					  "temp_ok",
+					  "coarse_det",
+					  "usb_vbus",
+					  "chg_gone",
+					  "overtemp";
+
+			status = "disabled";
+		};
+
 		pm8916_usbin: usb-detect@1300 {
 			compatible = "qcom,pm8941-misc";
 			reg = <0x1300>;
@@ -91,6 +120,25 @@ channel@f {
 			};
 		};
 
+		pm8916_bms: battery@4000 {
+			compatible = "qcom,pm8916-bms-vm";
+			reg = <0x4000>;
+			interrupts = <0x0 0x40 0 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x40 1 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x40 2 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x40 3 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x40 4 IRQ_TYPE_EDGE_RISING>,
+				     <0x0 0x40 5 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "cv_leave",
+					  "cv_enter",
+					  "ocv_good",
+					  "ocv_thr",
+					  "fifo",
+					  "state_chg";
+
+			status = "disabled";
+		};
+
 		rtc@6000 {
 			compatible = "qcom,pm8941-rtc";
 			reg = <0x6000>, <0x6100>;

-- 
2.41.0


