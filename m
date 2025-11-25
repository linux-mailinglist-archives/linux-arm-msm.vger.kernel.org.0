Return-Path: <linux-arm-msm+bounces-83188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE967C83E6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B51C04E4D58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B885D2D7DD0;
	Tue, 25 Nov 2025 08:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="g9TrEqs1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FDA2D5C67
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058380; cv=none; b=QayB5Y9sae67dHoeVgHlaOY0W34OZKFZMVNdyN9k7qTjOExCsuDeDp2KPl2IoeJoDda6NXpjn5a5Ty7NJhzSSemH5393tldQ0noE8QkqJaIxuseM5L+v2xk+0p0F01hkMUx2/t+vLor+gHd4RE91Ql+uEOw36yBKCQzyibefMdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058380; c=relaxed/simple;
	bh=9cLcnFOPcevSiD/xtZlMDjmp7ybUya8RPh3beYLpMoM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RZuKZYgC3vhErdmpF5smwd7OnbG+rHsQYB6BBcPVCCqe3ds7zIq53PfPk3lPdD+FNbbFm/zlvG4Z+kupDPx3wbPKBztd2FGlYnKVsSk8ZknfAbI+pdV/Zp3OdabW1Porqts7CAaaJQG8ZLjL8AcS/ZYVO3QhbzyOiYY+DHO5JX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=g9TrEqs1; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/67o22VdavwNLwmALNwq89ZpO+d02TvLTyPxrMzpZnY=;
	b=g9TrEqs12j82k1mnhCAVErnVbUrEdWFsgYNquqjvXUNGLOBljGkkheN/t0Q3YOUXd1lLRh
	arutb6fHqpSmZluNYYPOfU6OrfjMsLt7fLXKd30I07NKWr1mHOPLxszmU0bGWzSNJ8xMcb
	9tsEmdCVERyqSi/4+8OtriHlz5nTFoXVBiqqBfa7/uqMwmxnH/lq0E34YE/WvP0f05ErVC
	mNig8oGte9fXJKT1g73tIWKMo1x+yI3kbS/SAVByESOhUrvs5qRdPIFyX55ReHZryohSxX
	Pkt2lqamMhMpo8x/u1DXSJo3qhyDIv6AE3i7nlTm8vi9VQb8LG3Nem2Bp0Amyw==
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH v4 00/12] arm64: dts: qcom: sdm845-lg-{common, judyln}:
 Improve HW support in dts
Date: Tue, 25 Nov 2025 00:12:30 -0800
Message-Id: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQW2/CIBTA8a9ieN4x3HrBLMbvseyBwqll2otQG
 53pdx+tLqlxezwUfvzpjQT0DgPZrG7E4+CCa5s4yLcVMZVu9gjOxplwyhOqGIOvs70eG7B9AJY
 ZyTBR1tCSxAOdx9JdZuzj8z57PJ2j2d8XSY0h6NncrN4fJP0lO93gEQYGDHKemExKKoqi2HVt6
 GvtD9i3Yd36/Xa660ViLErh4Dqo4n4wuoZT7SAGwMCBArW6lHmiVZ7pnbu4fm2+t2TKrFzoW3+
 df8HA5s5Hmli+NoZR4KKQRZYpag2+hM3awJdC+iRMHQmyFFPKU6HLfwSxEHj+JIgoFEyaUqHS8
 eMfwjiOP8g1FWHWAQAA
X-Change-ID: 20250911-judyln-dts-17c41e59dc0f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Pavel Machek <pavel@ucw.cz>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058372; l=4025;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=9cLcnFOPcevSiD/xtZlMDjmp7ybUya8RPh3beYLpMoM=;
 b=5U7QLWgFKcaBeUZiq5oEr1sngUkNJQ/JlhJ+IW1L7BAa7BPO9ZQZUi0BLF7Mkx5rZO6dnZueO
 3oDMiIkoNt6ACB/0ji3mjuikbYceYJclFmrLWAwzG/6CfUCdRR5wq0E
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

Depends upon qcom,snoc-host-cap-skip-quirk https://lore.kernel.org/all/20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz/T/

Co-developed-by: Amir Dahan <system64fumo@protonmail.com>
Co-developed-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
Signed-off-by: Christopher Brown <crispybrown@gmail.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Changes in v4:
- add panel identifier in addition to ddic
- make sde_te pull-down
- fixup flash current
- remove framebuffer reserved-mem 
- remove manual lower guard
- depend upon https://lore.kernel.org/all/20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz/T
- reword commits
- Link to v3: https://lore.kernel.org/r/20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org

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
      arm64: dts: qcom: sdm845-lg-common: Add LEDs

Christopher Brown (1):
      arm64: dts: qcom: sdm845-lg-judyln: Add battery and charger

Paul Sajna (10):
      arm64: dts: qcom: sdm845-lg-common: Sort nodes and properties
      arm64: dts: qcom: sdm845-lg-common: Add uarts and Bluetooth
      arm64: dts: qcom: sdm845-lg-judyln: Add display panel
      arm64: dts: qcom: sdm845-lg-judyln: Add firmware nodes, change path
      arm64: dts: qcom: sdm845-lg-{common, judyln}: Add wifi node
      arm64: dts: qcom: sdm845-lg-common: Add chassis-type
      arm64: dts: qcom: sdm845-lg-common: Add camera flash
      arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
      arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self'
      arm64: dts: qcom: sdm845-lg-common: remove framebuffer reserved-mem

 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 238 ++++++++++++++++++-------
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts  | 138 ++++++++++++--
 2 files changed, 296 insertions(+), 80 deletions(-)
---
base-commit: 3d53f9ca24dd7492fe88fd0f1a418e3dc8b03515
change-id: 20250911-judyln-dts-17c41e59dc0f
prerequisite-message-id: <20250910-judyln-panel-v1-1-825c74403bbb@postmarketos.org>
prerequisite-patch-id: e51151ea7f8fdad6ad7d90713febc5c6b6fc4f9c
prerequisite-patch-id: b3dd44250da9cd12bc5b2d0d7e865dbe19ceed92
prerequisite-patch-id: fd6c8077806cb03fcf37d0e0d730314c2760e334
prerequisite-message-id: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
prerequisite-patch-id: 32934e043aa82e7dccdcb962037e78663eae24a6
prerequisite-patch-id: 9c69ab29256c15a0e8ac1c3b9ef64b27661c7815
prerequisite-patch-id: 8fce59716f5d0d873c3407937e4f852eb18c75f0

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>


