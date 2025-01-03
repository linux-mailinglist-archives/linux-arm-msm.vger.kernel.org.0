Return-Path: <linux-arm-msm+bounces-43810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDB6A002DD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 03:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9980B3A33A8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 02:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C331149C41;
	Fri,  3 Jan 2025 02:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scbIK8eT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0637ABA3F
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jan 2025 02:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735872589; cv=none; b=g03QCzWOvRfcjmGfQBu+mjGhXxbUGG377tBYL9mJsM9NkP2Dj4EgBYrXEhvLWaWClYmw0tsM9Dwxeg906W5YjtpusmGEKu2MRPSHq2r1kIFL3tnXmyHtQNjbfd4YYLd/mePzMD1YgLGdP5c+NGx0yGv1PLJObpr8aXP1d26eKck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735872589; c=relaxed/simple;
	bh=Ka1T8Z+8lX/trH3ErYbgl/v6NF3bsDw/cx4eBxax2oU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mWuxjKGlYKSdj2mEQB5nZWUFJNwmbB1pvuXbYhGtbDnwN1+KGbF66F59p1lG7t+vwUExvyBQ4ZUXljmWgYWPe+jk0Wqpai8Z0av6Edocw3JZwsPemkGLdr9kNGijS4iTw8XZWz2vf1s9oQg2YyAu3irh/6+Chgm7WrbpDpbirAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scbIK8eT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FD5C4CED0;
	Fri,  3 Jan 2025 02:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735872588;
	bh=Ka1T8Z+8lX/trH3ErYbgl/v6NF3bsDw/cx4eBxax2oU=;
	h=From:To:Cc:Subject:Date:From;
	b=scbIK8eTminIMtmXYnHqG7NFNMBX5oc7gyzYwhzoq++7XIc5VgtaPjnwXxMQtmeUT
	 Tl8Pvyv5UmmcEKcLRTi/Dj4UFHwqVgLg5+frHoNTS0mrKZu74rYl4VHxietpZja7sG
	 9L3oxVMkRRASC3a1HRyqEntF4vEcKqGwwe/12X0H56QZSuVG2W1MLDd/hwW/RYWh22
	 MJbc9EZ1agBpYjtmhpDD84MV4WUgKJSXNVP1bpPsyoJqsdh3Hr3iauNZTCm0U7ebFr
	 Nxl7M8sVbwUCapYlrcA7O8P/FGlHZK2vQVH4Cuax6qTCPX9INcjiOA5lxoKMFFe2n1
	 sOpjIj6VisUlw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Qiang Yu <quic_qianyu@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v6.13
Date: Thu,  2 Jan 2025 20:49:44 -0600
Message-ID: <20250103024945.4649-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.13

for you to fetch changes up to 8a6442ec3437083348f32a6159b9a67bf66417bc:

  arm64: dts: qcom: sa8775p: fix the secure device bootup issue (2024-12-25 22:05:40 -0600)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for v6.13

Revert the enablement of OTG support on primary and secondary USB Type-C
controllers of X1 Elite, for now, as this broke support for USB hotplug.

Disable the TPDM DCC device on SA8775P, as this is inaccessible per
current firmware configuration. Also correct the PCIe "addr_space"
region to enable larger BAR sizes.

Also fix the address space of PCIe6a found in X1 Elite.

----------------------------------------------------------------
Jie Gan (1):
      arm64: dts: qcom: sa8775p: fix the secure device bootup issue

Johan Hovold (3):
      Revert "arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports"
      Revert "arm64: dts: qcom: x1e80100-crd: enable otg on usb ports"
      Revert "arm64: dts: qcom: x1e80100: enable OTG on USB-C controllers"

Manivannan Sadhasivam (1):
      arm64: dts: qcom: sa8775p: Fix the size of 'addr_space' regions

Qiang Yu (1):
      arm64: dts: qcom: x1e80100: Fix up BAR space size for PCIe6a

 arch/arm64/boot/dts/qcom/sa8775p.dtsi                      |  5 +++--
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts |  8 ++++++++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts                  | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                     |  8 +-------
 4 files changed, 24 insertions(+), 9 deletions(-)

