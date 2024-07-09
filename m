Return-Path: <linux-arm-msm+bounces-25739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E7892C3CF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 21:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D2EC1C21FB2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 19:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F2E17B035;
	Tue,  9 Jul 2024 19:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ssNsR++1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF52B1B86EA
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 19:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720552517; cv=none; b=TwI4qnQHbWCpvxmValVlVprX5Nb1qurXh2GGvoKZ0sJsRsuDllwHDy1v/V7vh/1gTweqazMfwtaP/4B0uOHrrcvOWbzwODpBrMiScB7qzxTYra3A2UB/DpJnUyPdXtsa0F7tIV1uEeFtXJ4gKti24YIgOLc1IgMFtUoATNBfGEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720552517; c=relaxed/simple;
	bh=KBrLhLEYLLooNpL32JyxEFfqPMZZez+JNtnc4LIGG8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TyyVK1RadszmK4+sNCjSvMijZKO4B0OBFhjKl08dPDLJ1yk7wlFCrJVQmYG3VHHVbAxToOIGB479V508dsUfAuuiIHYBbit7UEA7UusFyo8v6GK9W2nDYWb45cKAhM4NNCyb2jSInzD5wNgKq2fJ+dm6HCGzywYGQJiUl4+rirU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ssNsR++1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA072C32782;
	Tue,  9 Jul 2024 19:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720552517;
	bh=KBrLhLEYLLooNpL32JyxEFfqPMZZez+JNtnc4LIGG8E=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=ssNsR++1splSPnzbDDesbqn3t1BrFttbQRLasXKcAQhZsos8Zzd09OI+MUrcUNWlV
	 8gcxtBMWh/VOsyX1pV8Xf6u8vNOt6j5Hc43kx3vcTZI1P7LZ5hEaa9BRIWs7Q6P06Q
	 nYThtWVFm/62BOqhcCcDOZ0orfenXnQxulX/su3IocBzye2QhTTDzCVLw+EKT3rNOg
	 cclxVqPDs5y98cLWIu599b+LNOMahET4DfJ+cEgHk9i6tnm3uweiYPAHmDOnz0dxHK
	 Z/7XD6BwQsInAdIkp0bVvuw2utFbDLyP8GYWw6mPVqdbQ7xP4qHa1jJod+vKy+X6bJ
	 lxxZF4hQcoZ9w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	David Heidelberg <david@ixit.cz>
Subject: [GIT PULL] One more Arm32 DeviceTree update for v6.11
Date: Tue,  9 Jul 2024 14:15:05 -0500
Message-ID: <20240709191506.3285-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 2a5454d0fe5684855581f8ad958afbcdc476fd64:

  ARM: dts: qcom: qcom-msm8226-samsung-ms013g: Add initial device tree (2024-07-02 22:15:57 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.11-2

for you to fetch changes up to c1842643a3df6004d1bc9df74e34d8b72997d886:

  ARM: dts: qcom: msm8960: correct memory base (2024-07-06 17:04:13 -0500)

----------------------------------------------------------------
One more Arm32 DeviceTree update for v6.11

This fixes the DeviceTree validation warning about MSM8960 /memory node
not having a unit address.

----------------------------------------------------------------
David Heidelberg (1):
      ARM: dts: qcom: msm8960: correct memory base

 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

