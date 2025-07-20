Return-Path: <linux-arm-msm+bounces-65757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFCAB0B340
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 05:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB80B17908A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 03:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9878943164;
	Sun, 20 Jul 2025 03:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmd+oZN3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F8EEEBD
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 03:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752980865; cv=none; b=ut7zXSriA0ij/2rrlW5A+mHb6d1aFZjNYcmpUjL0iFIQX9Pv4/TdSzcmh9OJ24EMOXUTqzxjyPOnRqtiVLAh1DmCWuGFvvYEMHkZZJ7tajSHc0LebGavGdNCX2uJ76WqkcqayObmESRUJoxanis5lq6YPf6GYzjwufY/Us2adAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752980865; c=relaxed/simple;
	bh=noUq5QeP6M5pVXcgC2Y/bXEJ5fNxp/pT0yKbZKkLxek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ms47ckSb3fBrWIiUM05kmDDoljP8KJvlZnKO287NLIbMKXvdv+ZZh3cd/GNTfYAdOI6F7dlU9XMgEYhL+WPayiGJPqkS3K+2HXPjGSJRY9iqk7Uj06pJgAbp06XvHQTjE/qVD+TT80LMG6WTDytB+mNYxEcJ9ufERERm6eLRCf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmd+oZN3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394C1C4CEF4;
	Sun, 20 Jul 2025 03:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752980865;
	bh=noUq5QeP6M5pVXcgC2Y/bXEJ5fNxp/pT0yKbZKkLxek=;
	h=From:To:Cc:Subject:Date:From;
	b=lmd+oZN39JkMHWmfn0BijZDP9B6AOQn7+Bm9XP72IxkiaZbsVtMVJjUuTUcd8z6oC
	 Opg0wy8jjDOyBfVN+yVWgKiDfyBTiTN7SkhhgU/m6W3YzTnlJOfgX12oz6EuDU+jMO
	 GAyv8pxWZla5unXYwXo16thsHQ8HWzTWfeeBJkvpE4Rs2nhzTGpMseeuQefGb8bceb
	 Gcz6dp1efBCu0TjI7nSf3HKi1a1EAmUTSPz6FPf0fwasfK7rlKxHKMm6+9JW6Fy1IL
	 zhcuBg9NkIXB+JF8CJKb0z6xqGXHvcVrON4xJxH0Cy0BbnZrjCY0DWfI4B6S7YrZsS
	 6tJ+hky7iK4ZQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Johan Hovold <johan@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm driver updates for v6.17
Date: Sat, 19 Jul 2025 22:07:41 -0500
Message-ID: <20250720030743.285440-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 9f35ab0e53ccbea57bb9cbad8065e0406d516195:

  soc: qcom: mdt_loader: Fix error return values in mdt_header_valid() (2025-06-25 14:31:31 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.17-2

for you to fetch changes up to 4587d3910f805ac74348e6c320071a9b65be035e:

  dt-bindings: soc: qcom: qcom,pmic-glink: document Milos compatible (2025-07-16 22:59:58 -0500)

----------------------------------------------------------------
More Qualcomm driver updates for v6.17

Fix race condition during SCM driver initialization, in relation to
tzmem and waitqueue irq handling,

Make the rpmh RSC driver support version 4 of the IP block.

Add SM7635 family and related PMICs to the socinfo driver. Also add
support for retrieving the bootloader build details.

----------------------------------------------------------------
Bartosz Golaszewski (4):
      firmware: qcom: scm: remove unused arguments from SHM bridge routines
      firmware: qcom: scm: take struct device as argument in SHM bridge enable
      firmware: qcom: scm: initialize tzmem before marking SCM as available
      firmware: qcom: scm: request the waitqueue irq *after* initializing SCM

Johan Hovold (1):
      soc: qcom: pmic_glink: fix OF node leak

Kathiravan Thirumoorthy (1):
      soc: qcom: socinfo: Add support to retrieve APPSBL build details

Luca Weiss (6):
      dt-bindings: arm: qcom,ids: Add SoC IDs for SM7635 family
      soc: qcom: socinfo: Add SoC IDs for SM7635 family
      soc: qcom: socinfo: Add PM7550 & PMIV0108 PMICs
      dt-bindings: firmware: qcom,scm: document Milos SCM Firmware Interface
      dt-bindings: soc: qcom,aoss-qmp: document the Milos Always-On Subsystem side channel
      dt-bindings: soc: qcom: qcom,pmic-glink: document Milos compatible

Maulik Shah (1):
      soc: qcom: rpmh-rsc: Add RSC version 4 support

Rakesh Kota (1):
      soc: qcom: spmi-pmic: add more PMIC SUBTYPE IDs

 .../devicetree/bindings/firmware/qcom,scm.yaml     |  2 +
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml           |  1 +
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |  1 +
 drivers/firmware/qcom/qcom_scm.c                   | 95 +++++++++++-----------
 drivers/firmware/qcom/qcom_scm.h                   |  1 +
 drivers/firmware/qcom/qcom_tzmem.c                 | 11 +--
 drivers/soc/qcom/pmic_glink.c                      |  9 +-
 drivers/soc/qcom/rpmh-rsc.c                        |  2 +-
 drivers/soc/qcom/socinfo.c                         | 11 +++
 include/dt-bindings/arm/qcom,ids.h                 |  5 ++
 include/linux/firmware/qcom/qcom_scm.h             |  5 +-
 include/soc/qcom/qcom-spmi-pmic.h                  |  2 +
 12 files changed, 85 insertions(+), 60 deletions(-)

