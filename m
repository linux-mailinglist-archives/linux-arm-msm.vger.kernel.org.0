Return-Path: <linux-arm-msm+bounces-32931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7743098D2C5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 14:10:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AB47B226A3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 12:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 641581CF5FC;
	Wed,  2 Oct 2024 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="IyQRNNuI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E2B1CF5F7;
	Wed,  2 Oct 2024 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727870989; cv=none; b=NsyDFWfy17kf7+aYOD1sDR5IkW5CkPB2nPpcgZAR3p3Pzklec9tHSBTQK7KRGv20CbH9cNIaCKWgYPjkcLtR5fs67MjhxLVRJfhUCGbs1rX9GJQ0Atz7nJpP8z7MkRaQnmAHAsCxhd3ObcYyU5dZ5A1/70bbq+QKTzt2DkdL+CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727870989; c=relaxed/simple;
	bh=EPmgFw92fTKQ5diVPlWlAhmnnLM2wgqsSmictvQL4oI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l/MgbkfSBFEipiGBgzsOzm6VA3Qnkz/huKHq1oAU+JJmaQKI5h0eBiSvzNeCeouXiL8vKhXBikMlDM6fopM7e6cRLHe1XCGZmTu0tfDav4kMmzWx5+rk/eN7cidbT/0EmSteXVjG0LoQ3IJsSOUTOG1EQ4d7OPsDVvGeDJKG/Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=IyQRNNuI; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4DDE12384D;
	Wed,  2 Oct 2024 14:09:43 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VbS-Q465ScLS; Wed,  2 Oct 2024 14:09:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727870982;
	bh=EPmgFw92fTKQ5diVPlWlAhmnnLM2wgqsSmictvQL4oI=;
	h=From:To:Cc:Subject:Date;
	b=IyQRNNuIrsRy6vBCCASFARvPQEERBTODWY75iY1FSL/MZsE6U/KRJIqMbyZV7l5Fi
	 mbx7L2WtABetZ42EBfjPXisKyU2YLZRX4FnlpM4qaQSR+r/+AceJqjg2rpkFKwUmaO
	 fLZ6x3obYtNNmTEji/mMnBNRCbpwGEX+tzw5wTZTBMHn1EmpNolqHnqexNHIfkPXbs
	 O5ZrJ52YauEsK1Uwp6vSc5QXWyL6hQ1eN92iamDugoL9n/vunW8ABSYkDV6hQUh9Z2
	 R/IU3waa7E+a1RBIoAuCDThPXYDUt0o0EyY5z1krpkyEhFaW527Slr6kquKdQJ2aZP
	 Kz4wqXejbmW2Q==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH 0/3] Initial for Linksys EA9350 V3 (linksys-jamaica)
Date: Wed,  2 Oct 2024 20:08:01 +0800
Message-ID: <20241002120804.25068-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree source for Linksys EA9350 V3 which is a WiFi router based on the IPQ5018 SoC.

As of now , only the UART,USB,USB LED,buttons is working.The front PWM LED require the IPQ PWM driver.Therefore the PWM LED isn't configed in the tree.

Also The original firmware from Linksys can only boot ARM32 kernels.

As of now There seems to be no way to boot ARM64 kernels on those device.

However, it is possible to use this device tree by compiling an ARM32 kernel instead.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
Karl Chan (3):
  arm64: dts: qcom: add Linksys EA9350 V3
  dt-bindings: arm: qcom: add Linksys EA9350 V3
  arm: dts: qcom-ipq5018-linksys-jamaica: Include dts from arm64 Build
    the Linksys EA9350 V3 device trees from the arm64 tree together with
    the ARM32 include to allow booting this device on ARM32.

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm/boot/dts/qcom/Makefile               |   1 +
 .../dts/qcom/qcom-ipq5018-linksys-jamaica.dts |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/ipq5018-linksys-jamaica.dts | 114 ++++++++++++++++++
 5 files changed, 119 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-linksys-jamaica.dts

-- 
2.46.1


