Return-Path: <linux-arm-msm+bounces-77994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB49BF0F67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 13:58:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3C1D24E3071
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 11:58:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0F0229B36;
	Mon, 20 Oct 2025 11:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="iOkQeLlq";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="To6/l9eK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE65324A058;
	Mon, 20 Oct 2025 11:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=24.134.29.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961522; cv=none; b=AHKap+V6Et9pANkbIaCXpIHCoMcZKuoF+zNPLjqAdGesrin+S29Ct2mR/1qdvaDcetvV+ddkKkFWvGXSBku5+QrcbJrlZRREYGaMbZY03f7gj5cTRAUVT5lZKQP4Ngktpr2fH1C7ZJOILsI1PBHoCy19iqzYFy4nj0ADZJ889/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961522; c=relaxed/simple;
	bh=5ZYpgK4DHkld0Tvb5ZbPmHYNvT3gym/NaPp5l3Exmfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KogxAvrcixG5bS+GQ6NCOid9PqK2TyhanY2bM3oR89dk4eys/wkWxb9LfdQ1cK1sURCF2X1xVsuhn+omA+mbgLCYxAVbPPVypL4uc733CdLdsJikqYwxCeqxEK7Z9N4Ybnq0Ek5uHHARsDy11QbicnhMnYnhWU41C+562QkLE0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org; spf=pass smtp.mailfrom=sigxcpu.org; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=iOkQeLlq; dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b=To6/l9eK; arc=none smtp.client-ip=24.134.29.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigxcpu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigxcpu.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1760961515; bh=5ZYpgK4DHkld0Tvb5ZbPmHYNvT3gym/NaPp5l3Exmfw=;
	h=From:Date:Subject:To:Cc:From;
	b=iOkQeLlqmtzT8mL31pTDtepS5U2vlYUP7ndeQxfh3i+PEKTC8rm9DV5VziSVL+V9e
	 lLz7GM63r7sjTLgQ956ow+vEWOgJzDpi2kFF9dxtxxR5MF0ZRNAl8TrZ2Iinr3WpVq
	 eekRJMimCLGQCIdH8OUryLQirvYalVqI8lZgizmJ2VCr5dFnAnexXVUzbU0P5u/FmH
	 7xJ+uKg2bHFeCtpXv5MiiTLswm8OnCu9KYu92w/P/l19Nwt8ZiWQv7PA5+ITrTAo+S
	 1Ex827D2sqlnqYgxHs3mbJqSWON8fD1UKu0LfL+uRgMvG3Cuyd+YvoMaePoX0MhTvc
	 jkBsGwXWyfvag==
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 0EA2AFB03;
	Mon, 20 Oct 2025 13:58:35 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oHfZoafPnd7X; Mon, 20 Oct 2025 13:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
	t=1760961514; bh=5ZYpgK4DHkld0Tvb5ZbPmHYNvT3gym/NaPp5l3Exmfw=;
	h=From:Date:Subject:To:Cc:From;
	b=To6/l9eKjs+n8I75CZ8dwEcnPStzg9qC/a2FxObMk85/5Y20DQqgvuTG/h5GU52jV
	 bCBXrBpEML+33jPCM6WkwDQLrr2DMa8HLFcnvxwAls2mBtOQMjA5Y1YYjRsXuklbJf
	 uvlsPPtBTIyFHAIQ704o84mcoiYzor0lGFw9ltYECl5udiGiRCqUdRNDvASJx6EGvc
	 vypxu4uq0l/Dkws207lGWBntougEEcPCYyY+nTvmLxBWOAEyR1OKeH7vPmdM8Ayfz/
	 llNhcyQrMnSQeafCCYjTg2Yfkc9QtKSymZ2WhVRYcpSmJsFfIaCiOt5nETyb3PvFsK
	 pnPAVy/r8TFTQ==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Mon, 20 Oct 2025 13:58:24 +0200
Subject: [PATCH v2] arm64: dts: qcom: sdm845-shift-axolotl: Drop address
 and size cells from panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251020-shift6mq-dt-v2-1-d8fc3ec71281@sigxcpu.org>
X-B4-Tracking: v=1; b=H4sIAN8j9mgC/1XMTQ6CMBCG4auQWVvTaRBaV97DsJB2aGchPy0SD
 OHuVuLGzSTvJN+zQaLIlOBabBBp4cRDn0OdCrDh0XsS7HKDkuqCEo1Igbu5ek7CzYLK1lDtbI2
 VgbwYI3W8Htq9yR04zUN8H/iC3+/PUfLPWVCg0DWWMh/Urb4l9qsdX+chemj2ff8AeCa7v6gAA
 AA=
X-Change-ID: 20251019-shift6mq-dt-e4b9e7dc7169
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1320; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=5ZYpgK4DHkld0Tvb5ZbPmHYNvT3gym/NaPp5l3Exmfw=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQm85aVBrNjNaeFo1ckt1Q1g0UkwzSmdnZTF3RzJSCndTYXdxQ25jeis2MEQvS1Vy
 TmlKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYVBZajVBQUt
 DUkFsdjRaU1N2ekI0eFQ1RC93TkxGWVJkQ0hzOVg3SCtSS0wxK25aZmFmbXFFdEZnWmYxUWtxdg
 ovcTR6MDhaeTBSeWxWQTZWKzFDYUJNMkxiV0lNWUZnTmZJVzIwakNxaDAyb0kzRzR3T0RRTUdlW
 kE2WkRsbG9QCjAzTWJBL2FHT1JUdTh2bE9Jbkdvc0FlVUZHTEYrdmR3VlhsVmVCQmVEeDZtU3pP
 cDJVcW5xSXN0a1V5UXlUSU8KQXExTVVGTjlDSDg3ME5SVmJpYlZ3VVdWNnN0UExLaEkzcmV1OUh
 iWXh3TzdCa0g2OUxBOEVReGJZRy81SGgyQgpxVXB5dHZ6ZzhhVUdKNzFuK2V4WWQxS1I5U25DUE
 1aN2tCdDVEcTNtbDZ1bE51N3RwdVpUVGpoUTZBdUJCWkNkClpsZlBUalhBaGhtWEFZajQwVGVxU
 nA2bEIycDgzY2djWEZvQWtTbzJHQ3EwVjdxYW9GODJLVWhuNzJuN3dhazUKQVovUnQ0alRBWjRz
 UFJMLzIyWXlWOWg5ZDZPSVNYYmYzV3RYL2ZVR3pmb3l0RE00N1pUTm85SnVRWHdUL1F1RgpjcFU
 3N3BFZXNEZW16aklFUmJXVE1DbVB3QnovallFT3dTZWpBa1RaNGlyV0xyTFczdjRpY3cveHBqZ1
 I0VUVLCnAvWFNQa2U2aHZqTVJQVXFCYmhCL3puK3M2VlNzdkM4dE5JR1JKc3VnT0laSHdkQmlhc
 UFVeHM3b2ZrT210eFgKbzRwNGdIQi9Gb0VuakpBNGNDOVdFWjI0TjdlWHJZVjAyOUFzb2tVUHJY
 NmJNUjNoQVJreTNmWWwzblhwN3hXRAovc2RJYlM1M0Q5clVka3c2VXBqaGM3c0hqTGNicllNU21
 MRXJabGh4R2VxYzNlTDUvREVvY0tnNC9uUHNIeTBECnhCUEJpdz09Cj1LRDVCCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=agx@sigxcpu.org; a=openpgp;
 fpr=0DB3932762F78E592F6522AFBB5A2C77584122D3

They're set in the parent to describe the panel's reg property already.

Fixes the

linux/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dtb: panel@0 (visionox,rm69299-shift): '#address-cells', '#size-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'

warning.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
Changes in v2:
- Just remove the lines completely, the parent has them already set
  (Thanks Konrad Dybcio)
- Link to v1: https://lore.kernel.org/r/20251020-shift6mq-dt-v1-1-8714087118b8@sigxcpu.org
---
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index 89260fce6513..46ca4a38a9a8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -479,9 +479,6 @@ panel@0 {
 		vdda-supply = <&vreg_l14a_1p88>;
 		vdd3p3-supply = <&vreg_l28a_3p0>;
 
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
 
 		pinctrl-names = "default", "sleep";

---
base-commit: f406055cb18c6e299c4a783fc1effeb16be41803
change-id: 20251019-shift6mq-dt-e4b9e7dc7169

Best regards,
-- 
Guido Günther <agx@sigxcpu.org>


