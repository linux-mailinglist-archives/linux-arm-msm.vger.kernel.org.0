Return-Path: <linux-arm-msm+bounces-64456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E1B00AED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 19:58:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E66E54E68CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 17:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 357082F1FE4;
	Thu, 10 Jul 2025 17:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IuhbQXoI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F3E2F19B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 17:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752170297; cv=none; b=MN/G8SdlLdmNvjZKnrLTQuIbPzmzV+JDqLn+1ww+MxwIoR3EpWvN217V51PxFzU6nGuC0KM8xDWQCDOzbuDnk3cJYUDTe3f+lGYze+iSq1gV8TFkE3iDt8Cf2WwXM5K8VhLGV+oZ7T9BBhwVfoz6DE998iu9vRMG+Um+yE9YUFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752170297; c=relaxed/simple;
	bh=k6LS5lbNC+oc98XASinvjgEjc5c1xSROedbasnLwM9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hPr/vGSP+HTxre9jajdUZ9eCh+Anfjefwx4dX56sTYw092vbApL6Mp0F3ya8kA9Msjr6BfnXisijdN2Nv4XDI3VHoRr/5zfh2wDvyChalPsr2AE16PxVzck8VzFcwwdDNdz9iDm1YkJLdCrTCvW1akBtwkFGwaorZHbXOVpEaE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IuhbQXoI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AB40C4CEE3;
	Thu, 10 Jul 2025 17:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752170296;
	bh=k6LS5lbNC+oc98XASinvjgEjc5c1xSROedbasnLwM9Y=;
	h=From:To:Cc:Subject:Date:From;
	b=IuhbQXoIAJ3e8QF1KzrDMjcxey2lhro3ejsOBDwYiEs4cMGQAhDtYrn1/CjJlJwmk
	 STPqSs4Qb/22CJddWme0gsrzoxTQigLOesDYEjDaHPPwHpHhSabGxxnHj/Zs/vP5Vi
	 yvDn1WczXx1hXcKfsIufYZlTqFQD6wTU5Ht8QHGHaCujvo4CO524txaXf3+uOflFVx
	 fNIGRdfysqKImLk1rjAyrHhkjGyQbEH5RdbJKEMYIIkGnuKG1P/zUh05I9Bz2V7sSh
	 kJvsgS2tG0pDqNclRaUIBrzltN4eLIbnv8wXS/FoE15OYvboI7mcfyUoBhkkltz8cB
	 y2RwvcV2LLWLw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig fixes for v6.16
Date: Thu, 10 Jul 2025 12:58:14 -0500
Message-ID: <20250710175815.6504-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-6.16

for you to fetch changes up to 3871b51a684275e3a47fbebf93c0a0e7a05d7f9f:

  arm64: defconfig: Enable Qualcomm CPUCP mailbox driver (2025-06-09 21:14:40 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig fixes for v6.16

The v6.16 driver and DeviceTree updates described and implemented CPU
frequency scaling for the Qualcomm X Elite platform. But the necessary
CPUCP mailbox driver was not enabled, resulting in a series of error
messages being logged during boot (and no CPU frequency scaling).

Enable the missing drivers to silence the errors, and enable CPU
frequency scaling on this platform.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm CPUCP mailbox driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

