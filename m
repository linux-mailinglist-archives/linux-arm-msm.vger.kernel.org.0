Return-Path: <linux-arm-msm+bounces-67305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DE4B17E24
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 10:21:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1B66A82E6B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 08:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796F920F087;
	Fri,  1 Aug 2025 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q5aTIvhD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7A8154BE2;
	Fri,  1 Aug 2025 08:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754036500; cv=none; b=VrY/o9Qc0J6GnoBToRzbvHfAPtO6lMg5fZV50UQgRirzFQgBCgF/rkZycQdquNgXGNnBbYteRE2bKxZ76zuXeemfdsgG83zPHVABKarzIV/wQvRkWQew2lLqlqVXDQqA2uNHuR3/hwEuBWAkL/gHDz64FnKL/iHW7OP8NOkt8YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754036500; c=relaxed/simple;
	bh=fXMyKeDQRcI0dBE/H7t2HmaCMu1z9ifV/CUMNieM9WE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YBd9Nij10UwUsul2uSeaTuae5BYSv/UeOqAMwl4ALwbUol7NZkudPF5+A5kv2jl8gwWmbJWp1iR85umHd8BZTL7/uBu76Eh6ZfAV0ydAkLDYB8bvEsRDxFMLuwMbs6jO5ECKqjwu+YHBh1E+jm8bvc3CkD2SbjdWZt529UliXFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q5aTIvhD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7020C4CEF7;
	Fri,  1 Aug 2025 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754036499;
	bh=fXMyKeDQRcI0dBE/H7t2HmaCMu1z9ifV/CUMNieM9WE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q5aTIvhDq+/QYphekfOvYGCvCsWD+TrcbwJD+91W+hyskpZgjewBYPZrqLg+i1uxq
	 d3YTD73NnTEfE7P5o03R0JJ+/9615iWqVk4HR6XrBl9KpziNgnzHckEFlJs4quEmul
	 r/9/1WSGzdbUBEWCE5asGCPUwgTuL74Nv4CtJcJMISRjzd2+F9pTAo6Hcna1cNlnl5
	 yceJfEVyKrMW1UP7/b+jv+4ktytvkWX0T22a0YS3EvZFeUWpr6rzpM2IWcqqdcfeIh
	 1cGucI39QDWBsxQGHv7iDdKdj+JpOwmhwT6EAfYXnIQNgaoQlyKBGJ56S8CWtdUeeG
	 WpNGbSVKDsz3g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAA8C87FCB;
	Fri,  1 Aug 2025 08:21:39 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 01 Aug 2025 10:21:39 +0200
Subject: [PATCH v2 1/2] arm64: dts: qcom: sdm845*: Use definition for
 msm-id
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-sdm845-msmid-v2-1-9f44d125ee44@ixit.cz>
References: <20250801-sdm845-msmid-v2-0-9f44d125ee44@ixit.cz>
In-Reply-To: <20250801-sdm845-msmid-v2-0-9f44d125ee44@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4578; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=X/vOL90lSbwy+L7Tlmg3WDYSYe+pE/aoCMFhkFnrXYs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBojHkSqmJCQ6aLJAcWMbGkEljwHWEtqxLqG10LO
 doEh+J+oR6JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaIx5EgAKCRBgAj/E00kg
 ckjFD/90/OlUW8BjOkHL9DOLswM5vXO1PY309hXbC9ooPkPdmvApU/8NBLAlV0bDJH5ff4wsPvR
 SvwfA33HY5yd180lzNyU++U3u5VHWnMZ8Z8jVZsIgetVBrUWRSkq69Q4QWY0s1DxAJoV/puFSjE
 sbJMzXW0PipXWmbgZCA1JG1MwsZ2dIU4ZD4oJyWzkErjOdu2zvzGDDiRJPbDf6jDM0iwbliA5Ad
 HUDAv37pXvAm6JbeQEZHIAWyZNrRRaSyMDhd4V/sMvPTHfOaoVoRu8jVRJOmgVBqcIot4xT2N3d
 cPeO5AFnV+tsltKOribubUaoNTutRGARv7lf8XHg73O7FHIuSJSH0yEZYmBcdOymP3RX9d20jF/
 N+vhAkhOWUmkZdjgZap+O1qpnGORGMHhPtHrbm4rhxN07C+t82VmJjU4jeHRuI1IIm6eVKhbJgu
 aVBtISzn1xm2DjtwSeKlQQhAkmkwxdBD9R1pJrwSmg8oy0GJVmPDRd12OsT/s8amDAN6+u6TJRI
 fNdovC8awBXheIoxTilBm1+T1+aGhnVFZOcfDgb9K6436d8zdpNu7L1oxyfNq+V6g09zRwHeUuN
 DycfWtdY2JLxJgDUjugGhS0H+KfdmxsrsDS+ERnl9I9DOxCylIM8JzIccdy3YXc/dMXWDLM7J3A
 tW1grjcak7xbmyw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

For all boards it's QCOM_ID_SDM845 except Dragonboard, where it's
QCOM_ID_SDA845.

Except for OnePlus 6 / 6T, which is handled in following commit.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   | 3 ++-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            | 3 ++-
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        | 3 ++-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 3 ++-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           | 3 ++-
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
index b5c63fa0365d28fdc4a61dfe67ab6a184e748473..3ec2c7864f1ebb596f1ac2644de58d2f7a2b6faa 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -18,7 +19,7 @@
 / {
 	model = "Thundercomm Dragonboard 845c";
 	compatible = "thundercomm,db845c", "qcom,sdm845";
-	qcom,msm-id = <341 0x20001>;
+	qcom,msm-id = <QCOM_ID_SDA845 0x20001>;
 	qcom,board-id = <8 0>;
 
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 2cf7b5e1243caca6a6a0b0beebf52d5f354fe56f..87e913343cbbe7b0d7e0c5b96775b8e759a3a2c6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -17,7 +18,7 @@
 / {
 	model = "SHIFT SHIFT6mq";
 	compatible = "shift,axolotl", "qcom,sdm845";
-	qcom,msm-id = <321 0x20001>;
+	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
 	qcom,board-id = <11 0>;
 
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index a3a304e1ac8737ea2330bfe0ba92008e9fbba6af..f3f4c0900572a85ec173539f09074ae9c1025591 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
  */
 
+#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -12,7 +13,7 @@
 #include "pmi8998.dtsi"
 
 / {
-	qcom,msm-id = <321 0x20001>; /* SDM845 v2.1 */
+	qcom,msm-id = <QCOM_ID_SDM845 0x20001>; /* SDM845 v2.1 */
 	qcom,board-id = <8 0>;
 
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 7810b0ce7591ecc29e62116a859dcc6b93185b0c..7480c8d7ac5b7f84a742dc6c77943c547c49fafb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -2,6 +2,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -32,7 +33,7 @@ / {
 
 	/* required for bootloader to select correct board */
 	qcom,board-id = <69 0>;
-	qcom,msm-id = <321 0x20001>;
+	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
 
 	aliases {
 		serial1 = &uart6;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index 63cf879a7a297e161c57ba5256d52c9d6cfe9767..1c50a0563bc4728e67fa2dca76bdb6a503ebf102 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -38,7 +39,7 @@ / {
 	chassis-type = "handset";
 
 	/* required for bootloader to select correct board */
-	qcom,msm-id = <0x141 0x20001>;
+	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;
 	qcom,board-id = <0x2a 0x0>;
 
 	aliases {

-- 
2.50.1



