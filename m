Return-Path: <linux-arm-msm+bounces-72063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B44B43DEF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 16:01:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1B277A595F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 13:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C02A30147F;
	Thu,  4 Sep 2025 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b="VahYKXGO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551B322172D;
	Thu,  4 Sep 2025 14:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.112.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756994467; cv=none; b=BSiVQzqBYvbpA0PbwNusFiS1fTcgmskg8/mvvtyW3VUq74FkJT36z708a/1ypz7xHUsg6cb8tpCB6vHN7WlVlO+lEO9WtgTVpac0HTRQfZSYlWkP6nJNjhyJ2VdMZy58VZdnboRoWJUx+vCBtMvq44Sj/HU58bz6f5iPalfEoCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756994467; c=relaxed/simple;
	bh=qzYVr1AScfIpsKVS6LA/O8RwzKoLaaMQIo5FdZ86WtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=J9K+7SlYMMmP5ruPEI6Dj7rDrCzMx6oYVFfmCCepzBFKrgqyWjfZC/WEW8BNyFTY90D9wwuCE5Pbfet7fs70svKxWamwFsnG02cfew2jyzWqosSR2jXd7YGwdLGLdsWhxxjOJayuHjLy/QokjuwjX/pOfD2WtQKQT9gO4vu4HNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz; spf=pass smtp.mailfrom=ixit.cz; dkim=pass (1024-bit key) header.d=ixit.cz header.i=@ixit.cz header.b=VahYKXGO; arc=none smtp.client-ip=94.112.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ixit.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ixit.cz
Received: from [127.0.1.1] (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 4E1AB5341097;
	Thu, 04 Sep 2025 15:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1756994095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T9W4Iww9vZA6Ui66WUPdSDjtf5WWHN/INIoEfaMNDTE=;
	b=VahYKXGOyZtgwiZhAqu62HUHZNKUZ1EDFnDSydV+pDi8PuSG0nxso/xt88yKjMb+PxzX/3
	KZMglG+cGJc88xvCaJRtoWLqZdhRmUlRtm4NvReFOGxvP4S3Fp/Bym40n5ZM0/x4dtPrRe
	Fe//mWweKU5Bz1CA6BYeepWpGov1gRw=
From: David Heidelberg <david@ixit.cz>
Date: Thu, 04 Sep 2025 15:54:54 +0200
Subject: [PATCH] arm64: dts: qcom: sdm845-enchilada: Add notification LED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-enchilada-led-v1-1-dcf936ea7795@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAC2auWgC/x3MQQqAIBBA0avIrBNUFLGrRAvRKQfEQiEC8e5Jy
 7f4v0PDSthgZR0qPtToKhNyYRCSLydyitOghDLCCc2xhETZR88zRu60Fs5qb6ORMJu74kHv/9v
 2MT6GgSs9XwAAAA==
X-Change-ID: 20250904-enchilada-led-9440974a7d51
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Antonio Rische <nt8r@protonmail.com>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1575; i=david@ixit.cz;
 h=from:subject:message-id; bh=knNvZzc7dgOOqg2VjmBKpuXtS6yDiSJg4Q7BytFj8Cs=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBouZoveMPOv/rNORmi26Lhl/DBsKlHx/8o+f5zU
 unYYpwJeaaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaLmaLwAKCRBgAj/E00kg
 cqWxD/4nCdRbC4EIotgVzDk/aG+zeBjaQEzIDv1eWeZsmCC78LSwwvjcRr3mGCk1UOszcFkPDEs
 rePv4w+dbG0D2qhSQfSEUnsSvXHqcvnO7bok/rwGK1d+lDYWJ1i9ZNngd8eXOE+WB6Q8FqXXc/Z
 MUMz6MOL3+/75S68Fn/CoiKvnnvs4XDwf3gtI4rwrnAMd1CzEM/zkVQ+fE8bL4khPyFrwyv7mgp
 2bwyWJWPk9prg8ZQA21loD9vLNWfCDa5lwCovtOxs2IO41+GfPTEK22v1F002Et4Qea+kQAaQ68
 dnx/iP6J5zaUsJDN2DQAy94BABkG0csMZWaisZsEFCmWLU5LkFrurRZ2NE3jciTlNJT+MsfZZh0
 +mq+z3W5bXoRS84ACu8mnDzpAS0bwbvqzjI6AdkWkel4bnKDPJMW68CwX5Oz1Vs41tftx8Y50e/
 qSpfAo2wosq4Am61L4CRjh8lsi4/Srv5v3dIncqXT3snwcoNZd5ZTRPja2egWCtPL90O0nqp8oW
 qd1EpKoCUL4dmxsgz0j8jhYItA1PkAq/JT0AS4JUu9gMPwkqMmYRXHq2N2rtMsb14kGS8mbMcg8
 YwnlNtpgBXSkPMLxJpy3xBGwQbMdRdwFJrh71UUYs7Xk5zHkkUpWfhspuv+xjt9isqSbxkf2WRz
 DgPzlAqgXVIRvbg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072

From: Antonio Rische <nt8r@protonmail.com>

Add the notification LED for the device.
The R/G/B channels are controlled by the PMI8998 LPG.

Signed-off-by: Antonio Rische <nt8r@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index bfbc3e6e71bb5dc846f84260d2effe0b8af628c6..a259eb9d45ae07497d4ed31c643871eebe970200 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -5,6 +5,7 @@
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  */
 
+#include <dt-bindings/leds/common.h>
 #include "sdm845-oneplus-common.dtsi"
 
 / {
@@ -61,6 +62,33 @@ &pmi8998_charger {
 	monitored-battery = <&battery>;
 };
 
+&pmi8998_lpg {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+
+		led@4 {
+			reg = <4>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@5 {
+			reg = <5>;
+			color = <LED_COLOR_ID_RED>;
+		};
+	};
+};
+
 &sound {
 	model = "OnePlus 6";
 	audio-routing = "RX_BIAS", "MCLK",

---
base-commit: 4ac65880ebca1b68495bd8704263b26c050ac010
change-id: 20250904-enchilada-led-9440974a7d51

Best regards,
-- 
David Heidelberg <david@ixit.cz>


