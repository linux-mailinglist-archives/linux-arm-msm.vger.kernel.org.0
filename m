Return-Path: <linux-arm-msm+bounces-73828-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48640B7CDBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F32F11620D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 01:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6E022E004;
	Wed, 17 Sep 2025 01:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="rByKNAjH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1807121CC64;
	Wed, 17 Sep 2025 01:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071433; cv=none; b=Icm8vtxnxwkajRuONwgP4iyr+9nD/Z6m2xGcrAUUOoWRY+SL7fh8TvyWBz1oFS78wilPeosafXLIRthtvUBeh/D+1FVbgAF07ktT1XEAb1cNZFfxqZH+Y33a+W4c2sO31YRNlWF0piAy/XYgAR0Qk4Ew/DpNK401eZV6YcWuZSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071433; c=relaxed/simple;
	bh=83hlTojNpMHUMhNQlSYHxajM36tMhM0Trd8zSojDxFA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bKPcflSVpvnGRhuEuXzfIeBZcj90SbpZbsY3yDanCTA4nIk/UFTIE9ZcaSNStiTNNYiEnPO9VxqhrPx7l7Y5KWJResFX/xjFh/RWV6rsNDPf6uThyV1QuZXKDcaXOyWCJkvmQJW2l1Ik2a/uHwa7kY3j/xGXizJEWf0F2K7zB/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=rByKNAjH; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1758071420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nGEaWmxy+OrwGhatLDdMArPdkkpGy3vthm4epzwHO1Y=;
	b=rByKNAjHmpq181LQG1zlOYpLWxF/snRF6a6mwqMbZAgmRMvLRBLgdg6RTcRSMpG5PQ0k4v
	QllJD4oSzhSYzB3lKIgKChoaFoPVRD4/AI1KGYSMtUN0JwddGHnJilSI06DwXGB7gHK2L6
	EUjIoKtfEnV91tM5++bUn6tfqQ82bZ1Tnv/u/xSPEKiAUG/KNKVMVhLcIjmfxTc7s3ceRw
	7G2ysqTkew3CJZuAorjM/utT/8bR+6NsWfLXbW1LlMkCNzI3n9cwTeHBwkWFTVz/CIiN2b
	Cc3lLemLicRgy9aA9JAwlNHNkcgJDIQVpBAUG3Jg+oSFzn2PfVuZOlgIZ4nOrQ==
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH v2 00/13] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
Date: Tue, 16 Sep 2025 18:09:46 -0700
Message-Id: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFsKymgC/2XO0QqCMBTG8VeRc91im4opEb1HdOG2k63U2c6SI
 nz3lhUEXf4PnB/fAwi9RYIqeYDH0ZJ1fQy5SEAf675BZk1skFzmvBSCna7m3vbMBGKi0JnAvDS
 aHyA+DB4P9jZju/27PV6u0QzvI3RIVM9mlaw/JP+SQ91jy0bBBFvJXBdZxlOl1HZwFLranzE4W
 jrfbOCFHy0F5+/z8FHM+gdMfzdGjjOZqkwVRcmNxj8O9tM0PQEStQDVCAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758071415; l=2827;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=83hlTojNpMHUMhNQlSYHxajM36tMhM0Trd8zSojDxFA=;
 b=KfxKLPGB1FMZwZ+v6MCQ7koPkTwUCKP70sPR06U0BdyQCmKKwigxluK6151GzMz0GEToL7q5Z
 hfqEGe5L8oxBaJt6cHqE5JA3YnOg6+KLFlu4eDoxaIBB/eIKt43lJTH
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

Paul Sajna (11):
      arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
      arm64: dts: qcom: sdm845-lg-common: Add uarts and Bluetooth
      arm64: dts: qcom: sdm845-lg-judyln: Add display panel
      arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes
      arm64: dts: qcom: sdm845-lg-{common, judyln}: Add wifi node
      arm64: dts: qcom: sdm845-lg-common: Add chassis-type
      arm64: dts: qcom: sdm845-lg-judyln: Add fb_panel dimensions
      arm64: dts: qcom: sdm845-lg-common: Add camera flash
      arm64: dts: qcom: sdm845-lg-common: Add bootloader-compatible board and MSM IDs
      arm64: dts: qcom: sdm845-judyln-common: Remove framebuffer reserved-mem
      arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb

 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 222 ++++++++++++++++++-------
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 136 ++++++++++++++-
 2 files changed, 296 insertions(+), 62 deletions(-)
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


