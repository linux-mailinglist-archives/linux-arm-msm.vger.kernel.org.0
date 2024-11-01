Return-Path: <linux-arm-msm+bounces-36753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C62A9B9312
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 15:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE96D1C20C97
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 14:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3493F1A0708;
	Fri,  1 Nov 2024 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDT1OGHA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7E119CC29
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 14:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471057; cv=none; b=XJ8CnANhvnq42xd4PHAKUAZtdtmkFs2brU7+8IpL0+I3ovWY3ePULgAEnlKolXLvHj52SHvu3PMLA4p0nU2tusgqBx3Fc1vekDkIQg7TLGhEV5aQrq8BGHAL+2QFIXzcP6XiEl+UUc1gDZbB3NAn1MnIZrDc8bhWlRWAlsVoPYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471057; c=relaxed/simple;
	bh=9eJSBsDX1KEPOrBzjZskYTFJm1CTJz8fA/XLt1OpIv8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XDDTQK6HSjdSv6P8R+E+Ea1RWOBODgxXFPCS1+Q3/34kAL+feo2plsdmRmjKhG+dFbkQCTwgAKySnc2TjgbC/a4mu8j14dpW+BKiOcxj8TRcmMzp2ScaG4oOchXocmtaPoAXme821eePOh+KvaW1Yjf4wdcbepbA6z+l3bgMju0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDT1OGHA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05869C4CECD;
	Fri,  1 Nov 2024 14:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730471056;
	bh=9eJSBsDX1KEPOrBzjZskYTFJm1CTJz8fA/XLt1OpIv8=;
	h=From:To:Cc:Subject:Date:From;
	b=bDT1OGHAuCUOX83geBDrrex/2Wbius8C9uJlBz1UQpqHeZqsUPBIwBpxVqPSHrU9h
	 AIR5lz2JerpzIgrxCc/kcer0CTjgsK2e73bLndAHIi1YA0tHosN2V/ayjwe7sf5PED
	 ScN9b1YIZuUx8aQHJa/+tME+rBj1Iq9LqPE/9qSMPfjwaSafGFXVHwhdevWU/do0Hl
	 E0A6JMTZok+dpFXkOIVpS5HazoP+ipRD/WJsgR6ZV1SSYeslu+ZaA4zBULkdsO8M1U
	 koGS/Eg3/8tdGrAtGs2U3tsUwJh6/bgBO57BfFwvc/Uotui33XyKvqk4YOtlIUqhxu
	 y/ZbpgMIoqVgg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Fabien Parent <fabien.parent@linaro.org>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fix for v6.12
Date: Fri,  1 Nov 2024 09:24:13 -0500
Message-ID: <20241101142414.737828-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit dfbe93f32c12f5628bd83303e10ba63621c259ae:

  arm64: dts: qcom: x1e80100: Fix Adreno SMMU global interrupt (2024-08-14 21:36:45 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.12

for you to fetch changes up to d92e9ea2f0f918d7b01cbacb838288bffccc8954:

  arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM (2024-09-04 15:36:17 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fix for v6.12

This reverts the conversion to use the mailbox binding for RPM IPC
interrupts, as this broke boot on msm8939.

----------------------------------------------------------------
Fabien Parent (1):
      arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM

 arch/arm64/boot/dts/qcom/msm8939.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

