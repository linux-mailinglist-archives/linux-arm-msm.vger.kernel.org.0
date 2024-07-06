Return-Path: <linux-arm-msm+bounces-25418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AC09294A6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 17:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D6F31F22856
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Jul 2024 15:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9841E877;
	Sat,  6 Jul 2024 15:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fos8gvvr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DDB168DA
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Jul 2024 15:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720281222; cv=none; b=pWfAceSUmfqoQDisBrn+Xpf20cKgJC7r0J4fv4qBz7Hcvt0zUC4/I/txFdeBsEZiA+bbgC295myyHyBy/53447Z1b6XN+DBKIDZtlJu6HoUQ3F0M37xO0wKTIylMq3kMouTHUWwlWp7D0QW9Oy0kYuijk5l8vS6miyHWEYGNwFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720281222; c=relaxed/simple;
	bh=DSgK/uIZsRaqTPO+UbUD+8dlVfjeD6hu7UxOl734TZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpmrVjwjAu0B17fl82OLMyFGNq2dnT/GjOFvhg+us5gCYmt1rPLwXt9MKuU62U1gE0oQJUrXB7dguw7ZJztFjZ1huTZqIMNmZVkyM8CIQ90hzv/FuByCbZT0R8d3xQELR8SVYW2LyW2IfpX32lPBcnQczeYqKA3OOw9xe/7Fjic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fos8gvvr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3498C2BD10;
	Sat,  6 Jul 2024 15:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720281221;
	bh=DSgK/uIZsRaqTPO+UbUD+8dlVfjeD6hu7UxOl734TZE=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=fos8gvvr+UnxrV8EXI8CNej7u350abPDNTsFNVL73V09uUzQuSqgqfzsrZVx7y/RM
	 ORB2E3rvwuxq4/F++jkN6gTZ4rb5V5OLC6BzKzGYx6CPTj707hQXVLRAX6Vxnp+11A
	 ysDhDUpqIkTP5vcWwTlbdKFmxe7tyGrgAmGx04S0eey4VjGaNwPJg9aMBwBk7IWLEG
	 Q/49q8LSe1NdorEb/sezFvs05rU1kZb02WLVkVPFDT8jAYrvLMzFavrPOU5pklvXZd
	 j/tB92JaxEs8HjNk+th8z0cvUzFi5I4w8N/EWkTzMdVROAS18a8rW7fjT3CUANBpWJ
	 m4v1y1EROmA6w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.11
Date: Sat,  6 Jul 2024 10:53:46 -0500
Message-ID: <20240706155347.16207-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.11

for you to fetch changes up to f5a27053293fa027349f8fdfe81b314cc709158a:

  arm64: defconfig: enable SHM Bridge support for the TZ memory allocator (2024-06-23 16:09:37 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.11

This enables the newly introduce Shared Memory Bridge driver which
improves the mechansim with which buffers are shared with TrustZone.

It turns MSM8996, SM8150 and SM8350 interconnect providers to builtin,
as debug UART now depends on these.  The SM8350 GPU clock controller is
enabled.

The secure QFPROM driver is enabled, to provide access to OTP
configuration for the LLCC driver on the QDU1000 platform.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      arm64: defconfig: enable SHM Bridge support for the TZ memory allocator

Dmitry Baryshkov (3):
      arm64: defconfig: enable CONFIG_SM_GPUCC_8350
      arm64: defconfig: make CONFIG_INTERCONNECT_QCOM_SM8350 built-in
      arm64: defconfig: enable several Qualcomm interconnects

Komal Bajaj (1):
      arm64: defconfig: Enable secure QFPROM driver

 arch/arm64/configs/defconfig | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

