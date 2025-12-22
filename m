Return-Path: <linux-arm-msm+bounces-86258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 778B9CD6EB0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 20:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DCEA1301142A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 19:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399543375DC;
	Mon, 22 Dec 2025 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLMqDcxc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B2924A069;
	Mon, 22 Dec 2025 19:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766430342; cv=none; b=ZAcP5MA7XuDR/pgqD9Hb2USSNL/sInSfL8lHHtLU0oXUvZgn81fGqp58M9nexwqv1VPS+zmzvx1x6A3CDVDEFhHAdEiK1yjKe5p599k2LtCP1qvyrvDFyurIZWRq+JMTsFfZrH5gxm1w+c5yRJIRkrSZk7MH+tjxDszO1MH1b98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766430342; c=relaxed/simple;
	bh=o26w5pfKVbjm0ZYKjIGLGWKxaKtGDeW/QKaFs+H+Vac=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JBGsvmcAWUFjygFbXsd86ZHuk3WyZR5ulncQFBr98yCSa7x2eRLZ1mtXSf8un2kgecbcX0YfmL64p0y6CWQra5YxNYgjUx3ciMaI04iD215mQP5jAGcND4tWzzoz4DiYFYw/LCllbMenueABDxXbO2V5umzJPStqGva4tFMz9rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aLMqDcxc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E907C16AAE;
	Mon, 22 Dec 2025 19:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766430341;
	bh=o26w5pfKVbjm0ZYKjIGLGWKxaKtGDeW/QKaFs+H+Vac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aLMqDcxcYDN1M3QoAgg0Swc5jtsDgv9EmB4936UwpSKAlN7NaWZv7AFCnq+xXuwkd
	 RGqXVaI3UFB2TQUag278rv/OHZGfk4I6P16qa+cj4t0s8fyJMeGJN8XxwNgsOfnbCX
	 loI5DMj6dgBGB2yZ7tB6w/q5XIDGDoF6h7ZeOx5KkJfr0NmfOFOKlMKPSSbyt8mU+I
	 yfeY4tPzdfjWTuKUu9KSnz6FJwblZf6RR8SrqMXirC0PYlzEE9x+pvJ0UJI+LqmLYI
	 lKAZlOGO9vXCp6MJSOrb5dUUzp/LJGQ8ex/MT4XxoufcYkUp2cCHkNX/UoYvtCUnT0
	 XEQ5/AE98q8mw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91202E67810;
	Mon, 22 Dec 2025 19:05:41 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 22 Dec 2025 20:05:37 +0100
Subject: [PATCH 1/4] arm64: dts: qcom: sdm845-oneplus: Update firmware
 paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-oneplus6-new-fw-path-v1-1-a2d366f9eb89@ixit.cz>
References: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
In-Reply-To: <20251222-oneplus6-new-fw-path-v1-0-a2d366f9eb89@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2531; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vp0zUfKVDYHpsWqgWOnL5t1xkywRwF2t5wwVa5hJJj4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpSZaDkU1MP1d4SggMLqFvBmPmynCNuTEu2YSgs
 k6JwICpAeKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaUmWgwAKCRBgAj/E00kg
 cvIdD/9V4moFgFLiu3e8rcdeBm1XWnRCng+u9y9ej6V0sHoqbevqpDpEzkIbPCr1SgSXMKGnKOT
 Vdjy8RQVt9qcEsL+mZdrGnN8Wcs9aNnoqV9coM/YACMihPgsjsAl7IW1UV2Umk/LNgV95BXFpPQ
 saln0tpZB60F4Pvxu9Dzg1z0sYyJUorfTXs/rTdFda1hadsWpZFzvkRZEg2rra/xeylqNzui7V8
 ehZUaVdzmzpaNfkk51l12GKMtN3rvOPQ6xNOldzrl9uzcM0JErJaetMG6nmK87bhfNSDJfc9t5X
 3T2eJZ5oAvitZFtKjA8OwnbF1Sk/IvMKYGY9JfOb9G9QMKnJ8bL1VmygwueQAhzTnqz6BfkazWE
 bEn+bAQYLNL9jCirYBof+gfLR7V9rTAhsd1ygWNzc+DT6ZczQGjP/SIi2/OpLRJyZ898fnMlk7p
 EbYuj2JrnA7OWJ947aVFBL9ZVnXxtRWTX4QkvJvRC2AtKkjIo8exX6SZxbeWDJ0+MVfIBXhKAWm
 cAinA6hLMpn2UFlw8LW7Vc6VSW1+gJua0S9ZiMwLwx1Om3QW4urm7wrkr/SvpLafDuGH2q+u6Fb
 AvzhQrtmfhZHZdpiXXt6AEKttsTk2YGpohwwt4YeMp7cs3W9e1R/ldv7ZsCAoiVWsxrTYePcsj6
 6eO8nBaIjF7br9g==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Conform to the new firmware path scheme.
Includes cosmetic cleanups.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 23 ++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index db6dd04c51bb5..f1c63794db979 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -181,8 +181,9 @@ panel_vddi_poc_1p8: panel-vddi-poc-regulator {
 };
 
 &adsp_pas {
+	firmware-name = "qcom/sdm845/OnePlus/enchilada/adsp.mbn";
+
 	status = "okay";
-	firmware-name = "qcom/sdm845/oneplus6/adsp.mbn";
 };
 
 &apps_rsc {
@@ -353,8 +354,9 @@ vreg_s3c_0p6: smps3 {
 };
 
 &cdsp_pas {
+	firmware-name = "qcom/sdm845/OnePlus/enchilada/cdsp.mbn";
+
 	status = "okay";
-	firmware-name = "qcom/sdm845/oneplus6/cdsp.mbn";
 };
 
 &gcc {
@@ -370,7 +372,7 @@ &gpu {
 };
 
 &gpu_zap_shader {
-	firmware-name = "qcom/sdm845/oneplus6/a630_zap.mbn";
+	firmware-name = "qcom/sdm845/OnePlus/enchilada/a630_zap.mbn";
 };
 
 &i2c10 {
@@ -422,7 +424,8 @@ rmi4_f12: rmi4-f12@12 {
 &ipa {
 	qcom,gsi-loader = "self";
 	memory-region = <&ipa_fw_mem>;
-	firmware-name = "qcom/sdm845/oneplus6/ipa_fws.mbn";
+	firmware-name = "qcom/sdm845/OnePlus/enchilada/ipa_fws.mbn";
+
 	status = "okay";
 };
 
@@ -474,8 +477,10 @@ &mdss_dsi0_phy {
 
 /* Modem/wifi */
 &mss_pil {
+	firmware-name = "qcom/sdm845/OnePlus/enchilada/mba.mbn",
+			"qcom/sdm845/OnePlus/enchilada/modem.mbn";
+
 	status = "okay";
-	firmware-name = "qcom/sdm845/oneplus6/mba.mbn", "qcom/sdm845/oneplus6/modem.mbn";
 };
 
 &pm8998_gpios {
@@ -593,7 +598,8 @@ &qup_uart9_tx {
 };
 
 &slpi_pas {
-	firmware-name = "qcom/sdm845/oneplus6/slpi.mbn";
+	firmware-name = "qcom/sdm845/OnePlus/enchilada/slpi.mbn";
+
 	status = "okay";
 };
 
@@ -744,7 +750,7 @@ bluetooth {
 		 * This path is relative to the qca/
 		 * subdir under lib/firmware.
 		 */
-		firmware-name = "oneplus6/crnv21.bin";
+		firmware-name = "OnePlus/enchilada/crnv21.bin";
 
 		vddio-supply = <&vreg_s4a_1p8>;
 		vddxo-supply = <&vreg_l7a_1p8>;
@@ -906,8 +912,9 @@ speaker_default: speaker-default-state {
 };
 
 &venus {
+	firmware-name = "qcom/sdm845/OnePlus/enchilada/venus.mbn";
+
 	status = "okay";
-	firmware-name = "qcom/sdm845/oneplus6/venus.mbn";
 };
 
 &wcd9340 {

-- 
2.51.0



