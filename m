Return-Path: <linux-arm-msm+bounces-45770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E70A18C39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 07:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E07D13A4EA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 06:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A0C19259F;
	Wed, 22 Jan 2025 06:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KcVa3c2y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DD9F9FE;
	Wed, 22 Jan 2025 06:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737528118; cv=none; b=BDRIOnJFAFLImIkb+1m/VQolfueiMAH4SsvEqdYYq1m2+ZlRWKG5Tjtfpbq7lnWMh+mG1x0+YMzTtWv3LyNVj5fC3NuN/cPUXT/gzKYa6zjeyirX1Ud1V6DEoPk5GycddJsbe/UT4FVyVyQDn5hlXTcDIk0J2+u75c3V6S4MDNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737528118; c=relaxed/simple;
	bh=o2Ds8W/m2InNF3M1j5TAYTwXIjtOUpiFdJKz7QS6PlQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LOPm4q8nW9JqmfzO9pDuv/unColnZTo0VEbKaNqIM7ulFM08rHtLmKLmBvpQc/5i10PAvWp9oIG9yf46BZFvOPvWheDzTzx2lsTxRware93isbVEqK/Lna80TLHmpv24ceQHvvCEOZ7oUNxhBluROqWF87VuHJCxuYXwaXbQ7BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KcVa3c2y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2C66C4CED6;
	Wed, 22 Jan 2025 06:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737528117;
	bh=o2Ds8W/m2InNF3M1j5TAYTwXIjtOUpiFdJKz7QS6PlQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=KcVa3c2yGSKQDbe+yEjuw76b45wqFurRz7gXOCAGFHn/Sj1HlrcaxrEcytgy11VFn
	 2OWMd3Ug6i6rtonFsaChHJBGrLIqZOXbZQzYR8qg04Z6lFL6NsiLtZJeRtVFR3oG8c
	 bGo/o2K8X03CTsZ2zCiJr/vI+s4T/B8hQaBvp2fYBTBSrC7sd7CVxjL+wienDS1arW
	 l45G2ABtejeFdZia20h/AhDYb4JcnZ3aKkqwCyRiJ4TAFidWxpetpFEGjmOTcC1MfB
	 RhZWvM0l//yhPa2EBw8uuYGeeUkCuNDVv964L5CaY0OGV/V0m6DYtMCo5FOx/wE62R
	 dzCWvYXXZ+LVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E657C02181;
	Wed, 22 Jan 2025 06:41:57 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Wed, 22 Jan 2025 07:41:56 +0100
Subject: [PATCH] arm64: dts: qcom: sc8280xp-blackrock: switch to uefi rtc
 offset
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-jg-blackrock-rtc-v1-1-3b05cd85bdfa@oldschoolsolutions.biz>
X-B4-Tracking: v=1; b=H4sIADOTkGcC/x3M3QpAQBBA4VfRXJva3fzEq8iFHYNBaFZS8u42l
 9/FOQ8EVuEAdfKA8iVB9i3CpgnQ1G0jo/TR4IzLjXUG5xH92tGiOy2oJ6HPKlty4YmrDGJ2KA9
 y/8umfd8PgwYjlWIAAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737528116; l=1921;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=4fIfQMa3HqpPjSmfIw1qUNksE48aZP+ZpYp1h1ftNbI=;
 b=5uy6wYE1C3rG3cAXw5pTu1FPBjpNikCW0xrJ5P6YbdxkwJh8AxZZy2TMeo9WLBW8OOfSYOgCn
 +AFQlqZvYe5AOARybBO1c+h/mfAwyx0Ud0ZF6xd2g1H2D0x9aaEMnYf
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

On many Qualcomm platforms the PMIC RTC control and time registers are
read-only so that the RTC time can not be updated. Instead an offset
needs be stored in some machine-specific non-volatile memory, which a
driver can take into account.

Switch to using the Qualcomm specific UEFI variable that is used by the
UEFI firmware (and Windows) to store the RTC offset.

This specifically means that the RTC time will be synchronised between
the UEFI firmware setup (or UEFI shell), Windows and Linux.

Note however that Windows stores the RTC time in local time by default,
while Linux typically uses UTC (i.e. as on X86).

Based on a patch by Johan Hovold. [1]

Link: https://lore.kernel.org/all/20250120144152.11949-7-johan+linaro@kernel.org/ # [1]
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
This is a patch to switch the Windows Dev Kit 2023 over to
using the UEFI offset.
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index fa9d941050522..aaea2fa3c6c0a 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -762,20 +762,11 @@ &pmk8280_pon_resin {
 };
 
 &pmk8280_rtc {
-	nvmem-cells = <&rtc_offset>;
-	nvmem-cell-names = "offset";
+	qcom,uefi-rtc-info;
 
 	status = "okay";
 };
 
-&pmk8280_sdam_6 {
-	status = "okay";
-
-	rtc_offset: rtc-offset@bc {
-		reg = <0xbc 0x4>;
-	};
-};
-
 &pmk8280_vadc {
 	channel@144 {
 		reg = <PM8350_ADC7_AMUX_THM1_100K_PU(1)>;

---
base-commit: 232f121837ad8b1c21cc80f2c8842a4090c5a2a0
change-id: 20250120-jg-blackrock-rtc-b4917e6bce94

Best regards,
-- 
Jens Glathe <jens.glathe@oldschoolsolutions.biz>



