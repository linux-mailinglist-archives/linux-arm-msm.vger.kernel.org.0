Return-Path: <linux-arm-msm+bounces-88382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D1ED0E6AD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 09:59:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EE7F301AD0C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 08:59:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC6123AB95;
	Sun, 11 Jan 2026 08:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="E07blotx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C24D318B93
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 08:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768121954; cv=none; b=EARWrzJe4l1y3KqKRucM97XuxrsxtFDUI3tuTmgmcHNdnOgrv9lNd28mLbBNxvoLx0ELPFSa61lMCuZ5ctCg6WHRFZD+XbYP6gKUtPva4sEHFxLGt3zBe9vUq/MlqqM0uy3X3Fih21/W4wwJhBCyAw736WK7rb9HguKaxSuP34w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768121954; c=relaxed/simple;
	bh=huXrWfJLHwXJ9pMyzdZWCRtT1vrqbakmOp4a2dkTJD8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pEJp7Sf/Gw4XLykOx1iPxqWGE3mh6WcIzpRQCawvQxdv3p195dk8jFjOAdNPXb6P6jyNQLT5qA7vc+lrSSD4V9/ZjBjBepWokxysE3x5uWbPEv3XW9p6iIkaN61LqcQy/U2n5CzY26hOCXTwq8PJ7YjLyr6d8ZeP58YvBAPtrAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=E07blotx; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768121937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rDuhyU0dnYyhTLvMGvg0HDvCDvM31Is17flRLtU88Zw=;
	b=E07blotxokCBK/d/eOh4e8N6MSQtsVx3HkrXxeKmy+wv1f1fopKIA1hldHfY9d5FCqWyZj
	QGcwJCB7SV0pHPLB/MN00U472NOcXEd0+BXtrWNQFZvC2PaCWf4RzaIyXsVZNXfwXvTH0N
	8HJfc7tOnRIXekmaEexX1ENv0NOGmXE1d68mvGE4W5bbHJ6wjeczmOVbz8rxCLS5e9oTbe
	UQN/32zZneyMbSYBFExblmCVJTQFSlGCE9/agR2iyiRRHLV0AZRcV1O6KLW5r4SyONTzC3
	BHPX61UQ/PHsG8qpeEm7a817qLJfDVwvEgr4b69fOnCImuQ+8KELCiLnPhtCgA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Val Packett <val@packett.cool>
Subject: [PATCH 0/5] Add support for ECS LIVA QC710 mini PC/devkit
Date: Sun, 11 Jan 2026 05:35:08 -0300
Message-ID: <20260111085726.634091-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This piece of Arm history was an early Windows dev kit before Volterra..
(Though it holds the brand of its manufacturer Elitegroup, not Microsoft's).
It's also a cheap device that can be used wherever you need a mini PC.
Now with Linux ^_^

Most things work, including Wi-Fi, Bluetooth, USB, eMMC, microSD, GPU.

The device tree is mostly based on Aspire1, with most things deleted :)
and the "fun" USB/DP setup added (the QMPPHY is permanently in 2+2 mode,
2 lanes are routed to a USB-A SuperSpeed port, and the other 2 to a
DP-to-HDMI bridge, which is permanently enabled).

The HDMI display does work.. though I'm seeing flickering artifacts in the
top part of the screen. I was told it also happens with DP on other sc7180
devices. A "disp_cc_mdss_dp_pixel_clk_src: rcg didn't update its configuration."
is logged once on boot, but seems to be a red herring, just due to trying
too early (the clock actually updates fine later, changes on mode switch etc.)
But then, I see this fault spammed constantly when display is working:
arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x9bc00000, fsynr=0x10021, cbfrsynra=0x800, cb=8
Suspiciously, 0x9bc00000 is the PA for the framebuffer provided by EFI!
Though the issue doesn't go away if efifb is completely disabled in Linux.

As for HDMI audio, it does work on Windows so there must be some way to get it
working, I've tried configuring DP audio and I'm seeing the *exact* same errors
as https://lore.kernel.org/linux-arm-msm/DD8RLVPWQQ7O.1B3E1P6VNMWV1@fairphone.com/
(DSP returned error[9], AFE enable for port 0x6020 failed -22) but that fix
of course has long been applied so it's a different issue with the same symptom
(I checked with prints, it's *not* DP not being ready).

~val

Val Packett (5):
  dt-bindings: arm: qcom: Add ECS LIVA QC710
  dt-bindings: display: bridge: simple: document the Algoltek AG6311
    DP-to-HDMI bridge
  drm/bridge: simple: add the Algoltek AG6311 DP-to-HDMI bridge
  arm64: dts: qcom: Add support for ECS LIVA QC710
  firmware: qcom: scm: Allow QSEECOM on ECS LIVA QC710

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 .../display/bridge/simple-bridge.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   2 +
 .../boot/dts/qcom/sc7180-ecs-liva-qc710.dts   | 625 ++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |   1 +
 drivers/gpu/drm/bridge/simple-bridge.c        |   5 +
 6 files changed, 635 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts

-- 
2.51.2


