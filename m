Return-Path: <linux-arm-msm+bounces-75452-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F614BA7F50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 928E018971A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98542225402;
	Mon, 29 Sep 2025 05:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="OQO8Bnbn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4B6223323
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759122347; cv=none; b=RLNvkUww7ZRGnebQAJkSSSv/P+MVo8fCDOh2R2l+Fu+QH49///AlQjLIsUNSWSJ8cbj1fsTDwId2+gTxGg6f2dsSg6D98Ng4R03HTGWfARELdwRFVmzXJQVcUhxv7uXiuFj3t/Q7KOUQyXYXJz0893UTctoFopAIoqd0xVKfGKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759122347; c=relaxed/simple;
	bh=fjcFdJgH23VF8JsWbXTLHJaSvRl57I+MqNIoSEc6Lus=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hx8I2llhNQDdn5ay0TdFATRvy6X3fZTfFVd+JAP/2m01cAYbRqjRoFceKeVwSfRKQ3uIfSJzsqOLq3CK8rnVc63ZX1yb32UpSAj0fCYhMiiwkGWagXxlzuVQN9ly31pAnTGiDiM5y4vhvzSQEXCTUyQYthCV+Pi/vKA+DRtKfFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=OQO8Bnbn; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1759122333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j2Ykjpn2M9MUdD7CCOsDxyX4Ug+kRVxSWmRB5xwuvk8=;
	b=OQO8Bnbn2I7/EjHI3H0AqudFKHMxxSIfx6y6huCR1FKsaR9Ttj56MOLOTP4nLXFnIqT2K3
	u0NsmnSlh4bOtBHEzeEl4CDK0uLUIcJMUm8qpesohAHBrtVbtgUu01aQKUvtaRiUt1w9Tj
	NOM5gAthCy7aBHtC6c45hiiCrwSs02aDXO0n5peiZQ5ZxxnqvPHWf+6XacjGe0q9CbddaE
	DEsqXrvGVeNJmSLJKbLaWXk+Wo/thkUuYnm2rUeRECUIuynzCaA/1sDyVFZ1gxgTXfodKa
	b4T4XeHlL3GMkZPIHxG76cFiMAwkF+/LMVrMv1pNP24vf3nD9nnP1awClyVqBg==
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH v3 00/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
Date: Sun, 28 Sep 2025 22:05:23 -0700
Message-Id: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJMT2mgC/23O2W7CMBCF4VeJfI0rL1lIhKq+R9ULLxMwS5x6T
 FSE8u41BiQQXP4jzadzJgjBAZKuOJMAk0PnhxRyURCzUcMaqLOpiWCiYi3ndHu0p/1AbUTKG1N
 yqFprWE/Swxigd38Z+/65doDfYzLj9UgOgKiy2RWrG8nu5KgG2NOJU06XojJNWTKptf4aPcaDC
 juIHj98WH+SC75xGH045eETz/oNlI8bE8eokLrUTdMya+CFy9okHoX6SRBJqIDXUDNRS9W/EeZ
 5/gfn9tfbSgEAAA==
X-Change-ID: 20250911-judyln-dts-17c41e59dc0f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759122330; l=3146;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=fjcFdJgH23VF8JsWbXTLHJaSvRl57I+MqNIoSEc6Lus=;
 b=K3kbXQT2DMDOmbcTGKVUqRQfUhBJZ11f7Bsg37vqNqgupuKd+NR5qgVaSmeGfcViNMvgCsm58
 3APixQTZzpGDkJ5SCEzJeh2rH8kkxGVAxd7/UW6+X9IfvfM4MTutrEx
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

Rollup of improved hardware support via devicetree for LG G7 ThinQ 
(judyln) from sdm845-mainline kernel fork

Notably, this patch-series enables full DRM acceleration and wifi,
among other small improvements in individual commits

after this patch-series the main things that remain to be worked
on include touchscreen, audio, and modem.

Depends upon panel driver patch-series https://lore.kernel.org/all/20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org/T/#r9a976ca01e309b6c03100e984a26a0ffc2fe2002

Co-developed-by: Amir Dahan <system64fumo@protonmail.com>
Co-developed-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
Signed-off-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Changes in v3:
- change firmware paths to lowercase 'lg' (matching dt-bindings)
- fix signoffs
- add wifi dmesg to commit message
- remove regulator-always-on from ibb
- remove framebuffer
- remove msm ids
- don't continue commit subject into commit messages
- split bluetooth node
- add sbu uart details to commit message
- change ipa gsi-loader to self
- Link to v2: https://lore.kernel.org/r/20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org

Changes in v2:
- sort at the start
- drop unnecessary labels
- drop unnecessary gmu
- multi-led
- split fb-panel changes
- expand upon firmware commit message
- use qcom,calibration-variant instead of
  qcom,ath10k-calibration-variant
- change firmware paths to include "LG"
- remove framebuffer reservation
- add lab/ibb

- Link to v1: https://lore.kernel.org/r/20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org

---
Amir Dahan (1):
      arm64: dts: qcom: sdm845-lg-common: Add leds

Christopher Brown (1):
      arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger

Paul Sajna (9):
      arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
      arm64: dts: qcom: sdm845-lg-common: Add uarts and Bluetooth
      arm64: dts: qcom: sdm845-lg-judyln: Add display panel
      arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
      arm64: dts: qcom: sdm845-lg-{common, judyln}: Add wifi node
      arm64: dts: qcom: sdm845-lg-common: Add chassis-type
      arm64: dts: qcom: sdm845-lg-common: Add camera flash
      arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
      arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self'

 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 222 ++++++++++++++++++-------
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 140 ++++++++++++++--
 2 files changed, 289 insertions(+), 73 deletions(-)
---
base-commit: 8394712bc1340df993cb167199568f44013b45d3
change-id: 20250911-judyln-dts-17c41e59dc0f
prerequisite-message-id: <20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org>
prerequisite-patch-id: e51151ea7f8fdad6ad7d90713febc5c6b6fc4f9c
prerequisite-patch-id: b3dd44250da9cd12bc5b2d0d7e865dbe19ceed92
prerequisite-patch-id: fd6c8077806cb03fcf37d0e0d730314c2760e334

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>


