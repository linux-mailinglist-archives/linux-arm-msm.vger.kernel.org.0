Return-Path: <linux-arm-msm+bounces-58587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B10ABCD63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 04:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30C2A189F36E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 02:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8579E21A92F;
	Tue, 20 May 2025 02:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u410h3Wo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 615B420110B
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 02:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747709238; cv=none; b=T6Cqq0mbXk52nMf6yZF53ozHXzWkaOUK7mYwr9S9CY4QlN0fCfGSWi0IA5WEfdqxEtfgl5X+5RmmdS3BaGkzfLIRdjysyTXDfaiIZ67PaIN8rV3dHqQOywambDIXbV9qkjeF7y2RxyXpl3kGky0qazoRKRsX83aet8wSyQjbKLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747709238; c=relaxed/simple;
	bh=bRSWeSF5IC9AgzEPcvUNyYRCBX/EO3Fvj60XVxbDLH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PYL8pEV2uJ45pNtYbwBmAC8QWOCBvUFk3uLwJ21cXbwfYROtv9vlqhVGbgjGHLTROi9/qpPuT34VW6ldZNKjKnXvdoDK1u8vB51VklQIoUssboKwwpD38AuowcW01ljuL5nV8JWKEgnCTz7RlMowhicloirGo/bRr/ZiJk0lrUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u410h3Wo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0C4C4CEE4;
	Tue, 20 May 2025 02:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747709237;
	bh=bRSWeSF5IC9AgzEPcvUNyYRCBX/EO3Fvj60XVxbDLH0=;
	h=From:To:Cc:Subject:Date:From;
	b=u410h3WojVBxNfioA2Y9cSjgexGbulubu8V4lxWnMwUJHxpuyIQPl3zqv3Qt0OQpm
	 IrNPEMRPBi0ikIBIEHhTcKxT/RmIu3sQCnxI5Mu/hyMNHEpsc+nz2CoMKyrxglaQpI
	 AGEvUQ73IbkHs0o+jtLxtXfbIk0donxI7KUCZ6rcPhufPMz3If5X+2hUN4SMC3t70a
	 pOiN4UuX1f5CsUsNVDunM8p6f4tpfR/sVzY/mHT2eW+DzFWI7YLu56OBBjQYokeE5i
	 7Xcw7PHvttOFx7sevvHbgoL6FoH4FCO6g08SC8Jn6BWgKXuBWVJz3i9kl6HXWW/IA0
	 GYDnn0oHlXTAw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rudraksha Gupta <guptarud@gmail.com>
Subject: [GIT PULL] More Arm32 DeviceTree updates for v6.16
Date: Mon, 19 May 2025 21:47:14 -0500
Message-ID: <20250520024716.39418-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit f2420037d90a8354594b3da541e19dcbb60c75e1:

  ARM: dts: qcom: apq8064: move replicator out of soc node (2025-05-13 17:00:59 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.16-2

for you to fetch changes up to b2c547cffe2f67e18a3a276905649cc95aa7f293:

  ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD GPIO (2025-05-17 17:32:35 -0500)

----------------------------------------------------------------
More Arm32 DeviceTree updates for v6.16

This adds missing LVDS clocks to APQ8064 display controller. The unused HDMI HPD
gpio on ifc6410 is dropped (chip uses pinmuxed hpd function).

Missing timer clocks are added to MSM8960 to address bindings warning.

----------------------------------------------------------------
Dmitry Baryshkov (2):
      ARM: dts: qcom: apq8064: link LVDS clocks
      ARM: dts: qcom: apq8064-ifc6410: drop HDMI HPD GPIO

Rudraksha Gupta (1):
      ARM: dts: qcom-msm8960: add missing clocks to the timer node

 arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts |  1 -
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi        | 16 ++++++++++++----
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi        |  2 ++
 3 files changed, 14 insertions(+), 5 deletions(-)

