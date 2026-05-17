Return-Path: <linux-arm-msm+bounces-108034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uzd1Bzq/CWrDnwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108034-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 15:14:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A90DA561228
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 15:14:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0E7AB3004D33
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 13:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A8F391E7E;
	Sun, 17 May 2026 13:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUKCW9Lv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC0838F929;
	Sun, 17 May 2026 13:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779023665; cv=none; b=mPzaMWSFzoMxWpZn9yR/xLuCQ0Ih9pSFwS3MXBiSUzbmn8GMAnjTsYzNoap/fyqQ9aoy8N5jEdUokx6Yw+6CGJaAMVQBPhMXmneoUijAVlpBlCzIGO3+7InvjJIpvFRngmy8G/BWPWKiv26i+1+7oF1udS1V9nK7MnxrnKJdezU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779023665; c=relaxed/simple;
	bh=sgYaZc2jrbgHscXICpyw9V4m4a+P3iP44DuYc5/fTJA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oLXTALg5biWSYBhqGc5IAkgsycdyfsDdCM1rlFzMOQt8rOzbCtT8OslyXln3ssTzAuXdfrXmFwnQCj+ULRqID8DKDsO3jmMx9iuDEmSBdMBeJn094k94cXCvgL2m6KV1Hf/muN/pUFgchVAiZY81WF1IQPNRwRQvrP/f6D2rhZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUKCW9Lv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEF4CC2BCC6;
	Sun, 17 May 2026 13:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779023663;
	bh=sgYaZc2jrbgHscXICpyw9V4m4a+P3iP44DuYc5/fTJA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oUKCW9Lv+0iBC4b2XSuOL6a/ypq3tE8dZFTJfC+JBgp+xqFRT1mVlJX9JlR4KRzOV
	 Y3Af4oduk7at0HRF0UPLUirJIHAU2ETFrzkozmKOOmHpOGvVBbszs221KlM2+hxkvQ
	 dMaK8NqdrqAirGfVQltP3TUeivRKswhVGjzavWivLSGOqQUYaOUUHhCdxTjnFjrsCG
	 SuN7uaE41CuahINhfF6vxCbn8YHuWL99Wa3ZaxCI3Oxrz666MEq/xa9hbuSqOwA2ny
	 HoYcKDa2GvMW0jI0VwFL0Ll4QMrGygurDPv/2neqT1UbLF4GQ7OYMCFEnfaqRk9fsj
	 V/XuimuB9uXnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD8ECCD4F3D;
	Sun, 17 May 2026 13:14:22 +0000 (UTC)
From: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>
Subject: [PATCH v3 0/4] arm64: qcom: add Ayaneo Pocket DS gaming console
Date: Sun, 17 May 2026 20:14:19 +0700
Message-Id: <20260517-pocketds-v3-0-d5910c801756@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw7CIBQFf6VhLYbSV3DlfxgX9HJpUVsaqETT9
 N+FuqmJy0nOzFmIR2fQk1O2EIfBeGPHCMUhI9DLsUNqVGTCGa9ZlTM6WbjjrDxFhk0rBOiiFiT
 OJ4favLbU5fpl/2xvCHPy06I3frbuvX2FPO3+ZENOGQXNKgkIrJb63A3SPI5gB5Kyge/FfCfyK
 HIhlCp52Wj+I67r+gEwPo0H6wAAAA==
X-Change-ID: 20260510-pocketds-e0e7b99cf369
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Alexandre Hamamdjian <azkali.limited@gmail.com>, 
 Teguh Sobirin <teguh@sobir.in>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779023659; l=3953;
 i=azkali.limited@gmail.com; s=20260510; h=from:subject:message-id;
 bh=sgYaZc2jrbgHscXICpyw9V4m4a+P3iP44DuYc5/fTJA=;
 b=FLHTQYk6KJTQIcyIF9YexupL/BpiCdbWDZybfo8Ryk9D4LP/0GYu/vJ4T35bZNOLmOJ1hBV9R
 s/OcadF+wQyD1DFQTMhqPOZjmMudncENJvDhZwS5bLVgawKc0ghBjLc
X-Developer-Key: i=azkali.limited@gmail.com; a=ed25519;
 pk=I0Z0IdCdQJqNGX+FQUnXhrHg950u3cM6Xzz3YT6JOyQ=
X-Endpoint-Received: by B4 Relay for azkali.limited@gmail.com/20260510 with
 auth_id=774
X-Original-From: Alexandre Hamamdjian <azkali.limited@gmail.com>
Reply-To: azkali.limited@gmail.com
X-Rspamd-Queue-Id: A90DA561228
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108034-lists,linux-arm-msm=lfdr.de,azkali.limited.gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sobir.in];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_PROHIBIT(0.00)[0.0.0.20:email];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	HAS_REPLYTO(0.00)[azkali.limited@gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Action: no action

This series adds initial support for the Ayaneo Pocket DS, a handheld
gaming console built around the Qualcomm QCS8550 SoC. It has UFS
storage, WiFi/Bluetooth, gaming buttons, microSD, dual displays, and
USB-C with DisplayPort. Game controls are exposed through a Renesas
uPD720201 PCIe USB 3.0 host controller hung off PCIe1, while a
dedicated gamepad MCU is reached over UART11.

The series is structured as:

  1. dt-bindings entry for the new qcom,qcs8550-ayaneo-pocketds
     compatible.
  2. sm8550.dtsi: add labels for the cpuss/cpu/gpuss thermal zones so
     the board can extend them with trip points and cooling maps via
     &label overrides instead of redeclaring zones by path.
  3. The Pocket DS board device tree itself, with the root-level
     nodes alphabetised and the fixed regulators named per the
     "<name>-regulator" convention.
  4. sm8550.dtsi: add the QUP2 SE3 (UART11) controller node and its
     default pinctrl, so the board can enable it as &uart11 instead
     of open-coding the controller in the board dts.

Only the basics are wired up at this stage (boot to console, core
peripherals, USB-C and DP); the display panel will follow in a later
submission.

Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
---
Changes in v3:
- New prerequisite patch adding the QUP2 SE3 (UART11) controller node
  and the qup_uart11_default pinctrl state to sm8550.dtsi, so the
  board can enable the gamepad MCU UART via &uart11 instead of
  duplicating the controller node in the board dts.
- Alphabetised the root-level nodes in the board dts and renamed the
  fixed regulators to the "<name>-regulator" node-name convention.
- Link to v2: https://patch.msgid.link/20260511-pocketds-v2-0-299dd4247f2f@gmail.com

Changes in v2:
- Inlined the board into a single qcs8550-ayaneo-pocketds.dts, matching
  the sm8650-ayaneo-pocket-s2 layout
- Added qcom,qcs8550 to the compatible chain
- Prerequisite patch labelling the sm8550 thermal zones so the board
  can extend them via &label overrides (and refactored the board's
  thermal-zones to use them)
- Added the Renesas uPD720201 USB 3.0 controller as a child of pcie1
  with proper avdd33 / vdd10 / vdd33 regulators
- Moved gamepad_pwr_en off &pcie1's pinctrl-0 and onto the
  usb-controller node
- Split the lumped upd720201_active pinctrl into per-regulator states
- Fixed mdss_dp0_out data-lanes to <0 1 2 3> (all four wired)
- Fixed gpio-reserved-ranges to <32 4> (gpio 38-39 drive the Goodix
  touchscreen)
- Renamed nodes with underscores (llcc-lpi-region, splash-region,
  gpio@20) per DT conventions
- Reordered pinctrl-names after pinctrl-N file-wide
- Dropped the unused cont_splash_region label
- Link to v1: https://patch.msgid.link/20260510-pocketds-v1-0-cf05acec06af@gmail.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Alexandre Hamamdjian (3):
      dt-bindings: arm: qcom: document the Ayaneo Pocket DS
      arm64: dts: qcom: sm8550: add labels for thermal zones
      arm64: dts: qcom: sm8550: add UART11 node

Teguh Sobirin (1):
      arm64: dts: qcom: add basic devicetree for Ayaneo Pocket DS gaming console

 Documentation/devicetree/bindings/arm/qcom.yaml    |    6 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../boot/dts/qcom/qcs8550-ayaneo-pocketds.dts      | 1883 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   52 +-
 4 files changed, 1929 insertions(+), 13 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260510-pocketds-e0e7b99cf369

Best regards,
--  
Alexandre Hamamdjian <azkali.limited@gmail.com>



