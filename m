Return-Path: <linux-arm-msm+bounces-64454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4F2B00ADD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 19:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5FCD761FA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 17:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0402F1FF3;
	Thu, 10 Jul 2025 17:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3LbuAwo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5C432C8B
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752170075; cv=none; b=SlteLSMJnrDJ2jdQJ1LAdltgM8Uk0gkiV+Mcx6m1NfEoH0oe1TGiRZWMugKAHDM+9JfiXtv/TjEvCnp47nkuv+WZFeBbrF5UWK5l2ByDGvk6rT1FT8h9pXBYXhtRaF3wLgxdq5EdtjGSa/b04iCcxDVdEVMoTIPnH2rwMOsQPx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752170075; c=relaxed/simple;
	bh=F05HSydP5BNA2szlMLXA5Y3OXlzOycAxUT/KLRoTscg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I8qr6Qf8KQX8tkZd1Gkx1fcthX6adk9K4ikIwkeKT4aJ9ZlArdA8it950YwEPmzRRm0d4+0WFTmYjh76hUiBBRln937Tr/iTX1U38G14eKQmXXKBNFMvyFNAtpMbn6+HaX/zitlUwwYZtSTlt/q8zPijFSu8t9h0jvFfUGYuR30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q3LbuAwo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AE3C4CEE3;
	Thu, 10 Jul 2025 17:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752170075;
	bh=F05HSydP5BNA2szlMLXA5Y3OXlzOycAxUT/KLRoTscg=;
	h=From:To:Cc:Subject:Date:From;
	b=Q3LbuAwoJH303RGl9w6tdCBvhbsnhmPEP1AoD7Zgvxr3jjKZZEahWEn5kfOOgRzg3
	 uXNvRxochNO5B4GWmiMekfeS4CLN+yXxAPOX7ovTZL6bS9ov8knLtjm2ugiMGlkwhE
	 TjsvhqYunKmc+jjG9i5jJ+YlQRmRj7ZUp061kz/G1B30yKB40HtcYzy7hfxMYwYVgC
	 z+Hua1xqkR1JkYjiNJn/QjvHd1jIXid87P61P8w56wV9ZV6WCY0Oig9CQCkI0KB37a
	 Ra/jSRojD49hb2W6qdNOKWUw2ujO9pXCXhu+vUPsYpp0GDiNgLrq9dtqN6Zi17Qxb2
	 U0ZzgQmulJUeQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [GIT PULL] Qualcomm DeviceTree fixes for v6.16
Date: Thu, 10 Jul 2025 12:54:33 -0500
Message-ID: <20250710175434.6201-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.16

for you to fetch changes up to e8d3dc45f2d3b0fea089e0e6e351d1287a5a2a29:

  arm64: dts: qcom: x1e80100: describe uefi rtc offset (2025-06-10 09:14:58 -0500)

----------------------------------------------------------------
Qualcomm DeviceTree fixes for v6.16

The RTC DeviceTree binding was changed in v6.16, to require an explicit
flag indicating that we store RTC offset in in an UEFI variable.

The result sent X Elite and Lenovo Thinkpad X13s users back to 1970, add
the flag to explicitly select the correct configuration for these
devices.

----------------------------------------------------------------
Johan Hovold (2):
      arm64: dts: qcom: sc8280xp-x13s: describe uefi rtc offset
      arm64: dts: qcom: x1e80100: describe uefi rtc offset

 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 2 ++
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi               | 1 +
 2 files changed, 3 insertions(+)

