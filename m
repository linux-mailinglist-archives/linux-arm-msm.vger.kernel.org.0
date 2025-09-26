Return-Path: <linux-arm-msm+bounces-75251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B37DBA2A0D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 09:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 942DC7A9D73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 07:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D53E284B37;
	Fri, 26 Sep 2025 07:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="NsBnupEK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F0727467F;
	Fri, 26 Sep 2025 07:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758870558; cv=none; b=e4kUpXXoBGA0o29QL9EDl5Ar0Zt5kJ56nXyiybpHPfC/k0TvPPJIuEHTTundzt0gG2qXP6swmTzPNByFZ7zrYyXvqbnTMK5hnFM0L266axJTiuDLeAJEyQC7lkoK+DSyD8yQIxsq1jejMdDpP67Tk7m9TjaO3LzkG2OHbXjz4+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758870558; c=relaxed/simple;
	bh=yuayi+GYwtiUGD3ixz8cnMvDjSSen14Um+t30mReDwo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kjmPJccyTpfLwFB/a091YjF77W9c0hoW9GyxhoiXqzc8O6m0QMbEdWj2nkOTlqNebi5QFpApa9jFTDE3pdfVuodHja/5s8PE/OBFrae/Cd79wti7FdZr/MQyXfrfZP/0UwbZpNXcTS1ukb8Bbjn7V9rdEHhaAfo5MmhU0y9Gcxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=NsBnupEK; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1758870545; x=1759129745;
	bh=/MEu/Bit52RHwMkv7G2/glV1N/DgMnV+5F1+CsnFKKA=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NsBnupEK5KiSkiEwi7nddx9GHv+UAGEVqAaOcshftlIFRWbiZI938cNTVilvXRECC
	 ZKyLegkkNdWJUdHMWe8pTbsDZyd/+Jw7Jz8SoDu00H6AGXiKGGu/wqX7t3gRiTHJYx
	 tXiiZ41EYFngFwo+Vp6znyzIS8MmKotbFWFhZAAMp6yaof29ezFZVoP1/h92246eTk
	 HDMLV0Cr6L43v7LEEA4Z+kCbmGTDtnQcAuRo9Iz5/qywoiZy0wal8toeBigTp85J90
	 FKIOCBMD24SaCK/aFFrntCC6C7WIwyUEPBMYIXBTAjcqA0Wv7fO+lgk3Y05ws2YFjU
	 oSywpCTasjTVQ==
X-Pm-Submission-Id: 4cY1sV6kpfz1DDKn
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Subject: [PATCH v2 0/3] arm64: dts: qcom: x1-asus-zenbook-a14: LCD, WiFi
 for X1E support
Date: Fri, 26 Sep 2025 09:08:51 +0200
Message-Id: <20250926-zenbook-improvements-v2-0-c0b512ab6b57@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAM81mgC/4WNTQ6CMBBGr0JmbU1/UIsr72FY0DrIhNCSDmlUw
 t2tXMDle8n3vhUYEyHDtVohYSamGAroQwV+6MITBT0Kg5b6JBtpxQeDi3EUNM0pZpwwLCyUVfX
 FGauNdVCmc8KeXnv23hYeiJeY3vtLVj/7J5iVkKI26J3rTePP8pYpdIlH4qOPE7Tbtn0BNnuYP
 bwAAAA=
X-Change-ID: 20250908-zenbook-improvements-18147b38238b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Aleksandrs Vinarskis <alex@vinarskis.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2192; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=yuayi+GYwtiUGD3ixz8cnMvDjSSen14Um+t30mReDwo=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBnXbDjyZLYa+5a03ta8U7lgQi/Trx0b9ytHzD0cMnO7x
 tyUTN6ajlIWBjEuBlkxRZbuP1/TuhbNXctwXeMbzBxWJpAhDFycAjARbzGGf8q6p7q/5kd2LY2b
 wNG/aOPJUq0nR8InbjuhG9Vw+lnhn8WMDFO/7NOfqF/wrmjPx9L1mt++vNh8yKk6RPLYbONnfL5
 C25kA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Round of improvements for Asus Zenbook A14, two changes:
1. Support LCD option on X1 (UX3407QA) variant. Until now, 'edp-panel'
   was used for both X1/X1E models, for both OLED panels. The lower end
   model also comes with IPS, which unfortunately needs PWM brightness
   controls. Follow example of Lenovo t14s - create a dedicated DT with
   dedicated 'compatible'. To maintain backward compatibility, do not
   rename current devicetree nor the 'model'.

   As this results in 3 DTs for 3 variants of the laptop, change
   OLED variants from 'edp-panel' to respective drivers (it appears both
   panels happily work both in old and new setup). Compatible for the
   panels were added to linux-next some weeks ago.

2. Add WiFi nodes for X1E (UX3407RA) variant. Almost identical to
   UX3407QA but uses ath12k instead of ath11k. Was not addded during
   initial bring-up due to lack of hardware to verify WiFi's operation.

Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
Changes in v2:
- Rebased on latest linux-next
- Dropped 'model', 'compatible' from both .dtsi
- Link to v1: https://lore.kernel.org/r/20250908-zenbook-improvements-v1-0-43ecbbf39c60@vinarskis.com

---
Aleksandrs Vinarskis (3):
      dt-bindings: arm: qcom: Add Asus Zenbook A14 UX3407QA LCD/OLED variants
      arm64: dts: qcom: Rework X1-based Asus Zenbook A14's displays
      arm64: dts: qcom: x1e80100-asus-zenbook-a14: Enable WiFi, Bluetooth

 Documentation/devicetree/bindings/arm/qcom.yaml    |   8 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |   7 +-
 .../boot/dts/qcom/x1e80100-asus-zenbook-a14.dts    | 102 +++++++++++++++
 .../dts/qcom/x1p42100-asus-zenbook-a14-lcd.dts     |  62 +++++++++
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dts    | 133 ++------------------
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   | 138 +++++++++++++++++++++
 7 files changed, 319 insertions(+), 133 deletions(-)
---
base-commit: b5a4da2c459f79a2c87c867398f1c0c315779781
change-id: 20250908-zenbook-improvements-18147b38238b

Best regards,
-- 
Aleksandrs Vinarskis <alex@vinarskis.com>


