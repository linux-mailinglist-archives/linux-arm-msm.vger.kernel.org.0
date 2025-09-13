Return-Path: <linux-arm-msm+bounces-73406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9622FB563C3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Sep 2025 01:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C589C17BEA5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Sep 2025 23:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3239A2C11C8;
	Sat, 13 Sep 2025 23:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="F1ZWOoN7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852351D5CC6
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Sep 2025 23:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757807851; cv=none; b=eCBCuOauvA4j6EmIVD/o8hKJ3eVA1MuQGMmWgv5iHcKLD1e/M2U+FCouMWE5xesTWfmaKoSLCDtxTV2hKfZMWR3NGPMvdq+Fb101DwJ8vVRu7mnHH2AAW8XEDTH4y4WshJF6orHFQ0+YUkfG2vHM8X8CXeZaHNW+uxfiEsX5uc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757807851; c=relaxed/simple;
	bh=U9L7Av1dGipaVCMuUJ1WoAF4Zwc+C5x5D0BSxA1MpYM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p5A6JyHsGE6HWVtl1jvPncMhH3uhJthIVOtxI7ZDUaswMlS1FFsdI9l+jxVUSvCMVCvbyYtyGVRslR66E3PJSutHg8LMpZkGBbPCs1u/yucp6obFe2E+oWBMNNixt/2Mwkad6u73C+rmT0KTxVuiYqfV8jwx58opanl9xYCqW2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=F1ZWOoN7; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1757807842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IMss5r+w/R/pRKm1q2pYvSfr5zbK/SNjjO1apqATu/M=;
	b=F1ZWOoN7PtnQH+7UnHB97+XMgBv/AMZn05aypOMEahLqXMhcOqT8MwTjfUvVYKMDcpbc+0
	3ayO5FT4kkyb5PaLz9QQg0Xa76x+7RW/XMwusRJz8jn3gV+9fv877YncsLIpJbufJRJTVX
	faVSuOVnKK0nNSZBzRUnOgzfT2j1/CzMg0TB3niqYtL60Hw7gA6X+2X5tjU8tfuiaOobBI
	v1TF/fg+VsQFou5tqPmOqWpleMrm3RrFoBWxDYL+8cSs/QUL4Gea4bF5Icn4P+c7VDCdbp
	2tgHXSk4XLJcDCTdyNbQhHj19u6oKczlwm4GNT/UmOXvPsu44X//HuQzo7TqIw==
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH 00/11] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
Date: Sat, 13 Sep 2025 16:56:33 -0700
Message-Id: <20250913-judyln-dts-v1-0-23b4b7790dce@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALEExmgC/zXMQQ6CMBCF4auQWVvTIgQxxngPw6K0A1ahxU4hG
 sLdbUCX/0veNwOhN0hwSmbwOBkyzsYQuwTUXdoWmdGxIeVpzksh2GPUn84yHYiJQmUC81Ir3kA
 8DB4b816xW7W1x9cYzbCN0CORXM1Tcv6R/E8O0mLHJsEEO6a5KrKMH+q6vg6OQi/9E4OjvfPtB
 apl+QKSbrYAuQAAAA==
X-Change-ID: 20250911-judyln-dts-17c41e59dc0f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757807839; l=2159;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=U9L7Av1dGipaVCMuUJ1WoAF4Zwc+C5x5D0BSxA1MpYM=;
 b=f3ltBSJCuc/JcucUM6NJApPNipOb8NWLsJ8xH65H/8hs0Vn/Re3PIyL7L0EdewouxQ2XnMADk
 cUbhjfxgEpGBY2dYNS+Ps+oUeFt+7kDAWzoIkW6DLlZAOMPrJGVwXfa
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

Co-authored-by: Amir Dahan <system64fumo@protonmail.com>
Co-authored-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
Signed-off-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Paul Sajna (11):
      arm64: dts: qcom: sdm845-lg-common: Add uarts and Bluetooth
      arm64: dts: qcom sdm845-lg-judyln: Add battery and charger
      arm64: dts: qcom: sdm845-lg-common: Add leds
      arm64: dts: qcom: sdm845-lg-common: Add camera flash
      arm64: dts: qcom: sdm845-lg-judyln: Add display panel
      arm64: dts: qcom: sdm845-lg-common: Add wifi node
      arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes
      arm64: dts: qcom: sdm845-lg-common: Add qcom id
      arm64: dts: qcom: sdm845-lg-common: Add chassis-type
      arm64: dts: qcom: sdm845-lg-judyln: Sort and cleanup nodes
      arm64: dts: qcom: sdm845-lg-common: Sort and cleanup nodes

 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 238 ++++++++++++++++++-------
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 134 ++++++++++++++
 2 files changed, 310 insertions(+), 62 deletions(-)
---
base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
change-id: 20250911-judyln-dts-17c41e59dc0f
prerequisite-message-id: <20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org>
prerequisite-patch-id: e51151ea7f8fdad6ad7d90713febc5c6b6fc4f9c
prerequisite-patch-id: b3dd44250da9cd12bc5b2d0d7e865dbe19ceed92
prerequisite-patch-id: fd6c8077806cb03fcf37d0e0d730314c2760e334

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>


