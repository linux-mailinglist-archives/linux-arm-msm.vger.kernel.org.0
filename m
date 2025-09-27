Return-Path: <linux-arm-msm+bounces-75386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA59BA5F99
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 15:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5536D189C14E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 13:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74ABA2D94AA;
	Sat, 27 Sep 2025 13:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="XBxqlojz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC24828935C
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 13:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758979349; cv=none; b=tB2oM140tHWgbn6OMMJngj+Gg3KRUA6oUALrlwPxf4MVTXFPx7dJlCgbGvSjMOpkjoadPPxeZfZMJ7GVgxPE+k6UB45rg35OeCL4brDhPdnW4LSy9Tv2BBZTPMJwJncFHj75XxPtNBt60jYWoq9ARNrXCscukZvzU1cpaRT69NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758979349; c=relaxed/simple;
	bh=pNQkxRuoV5p9AQKFSJNbjGjphy8yw5GtPAAkqP6I1tE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Ey/J5I/BBLcjO8C6RnDj4WRO4LlFIawnJjpCqv6VWelnxQzO4ij35LCM0CNMxoSth48lQTbMoM7s+jXFeiZM+SWGoX4SUA+ALA1CXyuByMCzDs90olSX7OJihY7qAXazJFf8HodvTZ/i3MQG1C5qqlB7m7/rjOgGCcK+vhkuQsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=XBxqlojz; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1758979338; x=1759238538;
	bh=kxMBpWVoAHeEECcguI0CWGFFU3AtS6snnN6CYVaI0Vg=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XBxqlojzsE2EgW5F9TTDtE/rBS1pg9NpuVKw5k4gY+cE46esDiEQH9TsBdF37u6zG
	 HfW6c6HecbgjleAQ4ZEvVdHnhhliv+Htp9n2yU/ZE/utYfZmQkTtG0E3/lxq4R+m0R
	 q4j9VoWVDR6tm712yeoUcfS2dpQFCFHlWBa6g6nHEUamyMlFO+sqOK9b+LeYypVWGZ
	 hW8r+0u0iypzXgLvxxojURbhGEQsDZiWwnIuB0sBWPU0peKtBIKw8rxRlf73+HXP9K
	 ain+C0vKO8pFJeG2WqPxcQpiD9TnajMfNFwXbAqceIisLQAgZtA/XkNkqBaNhNtx4l
	 HEe7dntE64CUQ==
X-Pm-Submission-Id: 4cYp5g6kXfz1DF4J
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: x1-asus-zenbook-a14: LCD, WiFi
 for X1E support
Date: Sat, 27 Sep 2025 15:21:34 +0200
Message-Id: <20250927-zenbook-improvements-v3-0-d46c7368dc70@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN7k12gC/4XNywrCMBCF4VcpWRvJpVdXvoe46MSpHUqTkpSgl
 r67aVciiMv/wHyzsICeMLBTtjCPkQI5m0IfMmb61t6R0y01U0IVohE1f6EF5wZO4+RdxBHtHLi
 sZV6BrpWugaXTyWNHj529XFP3FGbnn/uXKLf1DxglFzzXaAA63ZhSnCPZ1oeBwtG4kW1oVB+QK
 n9AKkFGQCFVCyUU1Te0rusbsOpuHgUBAAA=
X-Change-ID: 20250908-zenbook-improvements-18147b38238b
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2436; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=pNQkxRuoV5p9AQKFSJNbjGjphy8yw5GtPAAkqP6I1tE=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBnXn7K2+7MJvlep49vjd6/q2UGW5WZrFTs+zNCcd3//2
 i9pG/tfdZSyMIhxMciKKbJ0//ma1rVo7lqG6xrfYOawMoEMYeDiFICJSBkyMsyvf/ggrtk8oePk
 rV2qjVut+vhdziw93DztLtMKPp3a9A6Gf4q2XLt3HDj59HL3/a0W9gwG77cnrDffX+Yzy23qz4+
 18pwA
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
Changes in v3:
- Fixed order of Sign-off-by
- Fixed ath11k/ath12k (driver name) to wcn6855/wcn7850 (IC name)
- Picked R-by from Konrad
- Link to v2: https://lore.kernel.org/r/20250926-zenbook-improvements-v2-0-c0b512ab6b57@vinarskis.com

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


