Return-Path: <linux-arm-msm+bounces-89710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09965D3AFC9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:58:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 20514300519F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF20F38BF96;
	Mon, 19 Jan 2026 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivmpN5Bo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C58931E0FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768838336; cv=none; b=K0m62rOWHYbl7jOcJPOH52SpiSnVE8P3wVb/sRS4dEv9QdR9DoY9x8SvehWVKf6LQof4zwnYrlL120bG3s/+YBxWSndlsu0Mh94z14keJRSC+QWSOYf7tidduDxT6vgv61D3ciFLBCmTLRGYazmKXQTnduxmopx7cUr3/wtZ0TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768838336; c=relaxed/simple;
	bh=rTjfClrdU+ZLWQCk1mfy8UYKSZu1dS+xZzI6sXKASqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aU086/8dGN9vnbQWB+Dgw4Izo3uS5T7piS6SoeTGDId8fNX4akwC+Dj+nFW0WxMCvu/ioAHDEcanfAdiQVGK4a6S6kdn4gjHhmzOFftNz4GaQEcLoDHHJrzP6oVBGPWcAvsEFgHMeNt1UZsXBinR/T+A6t7Q0MtzD3leOyC8tMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivmpN5Bo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AC9C116C6;
	Mon, 19 Jan 2026 15:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768838336;
	bh=rTjfClrdU+ZLWQCk1mfy8UYKSZu1dS+xZzI6sXKASqI=;
	h=From:To:Cc:Subject:Date:From;
	b=ivmpN5Bo+s8AMNlXQ+DcLUBz88kVKGUMWfQ9W9flczIIdy+/qh7wKJ8bY7Gj0Ycry
	 3MuCs8TGjuJfLZ6xlSE5VSoxhMLSYBXiW+CfXRHyKtu5enghKK/NnQ/WNOe7iBVpyA
	 MDCk4ufY964HCnKuSj/8LBGw7SbGoz8R2CaZ1O+h82IzJps1ruNsj5SE2Pa1ZKhawS
	 GeUYVkRuVCLLziXV9RbLbaVLRzbUAgiXlE0ZRbqQJ5LLY/X8uB1eS4qwxTohhMhYSo
	 dLyC/7/9xsge5b4FLD9c4Izbroadk0RCwOZkgTXsg30P1NW3UQrEOMLSWF6TlCbSz/
	 otJW5Lr0+8f7w==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v6.19
Date: Mon, 19 Jan 2026 09:58:54 -0600
Message-ID: <20260119155854.839183-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.19

for you to fetch changes up to 1f6ca557088eb96c8c554f853eb7c60862f8a0a8:

  arm64: dts: qcom: sm8650: Fix compile warnings in USB controller node (2025-12-16 15:24:10 -0800)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for v6.19

Add missing power-domains to the SC8280XP RPM power-domain and ensure
these are voted for from the remoteproc instances while powering them
up.

Clear a couple of DeviceTree validation warnings in SM8550 and SM8650
USB controller nodes.

Specify the correct display panel on the OnePlus 6.

Correct the UFS clock mapping on Talos, to ensure UFS is properly
clocked.

Add Abel's old emails address to .mailmap.

----------------------------------------------------------------
Abel Vesa (1):
      mailmap: Update email address for Abel Vesa

David Heidelberg (1):
      arm64: dts qcom: sdm845-oneplus-enchilada: Specify panel name within the compatible

Konrad Dybcio (3):
      dt-bindings: power: qcom,rpmpd: Add SC8280XP_MXC_AO
      pmdomain: qcom: rpmhpd: Add MXC to SC8280XP
      arm64: dts: qcom: sc8280xp: Add missing VDD_MXC links

Krishna Kurapati (2):
      arm64: dts: qcom: sm8550: Fix compile warnings in USB controller node
      arm64: dts: qcom: sm8650: Fix compile warnings in USB controller node

Pradeep P V K (1):
      arm64: dts: qcom: talos: Correct UFS clocks ordering

 .mailmap                                              |  1 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                | 16 ++++++++++++----
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts |  4 ++--
 arch/arm64/boot/dts/qcom/sm8550.dtsi                  |  2 --
 arch/arm64/boot/dts/qcom/sm8650.dtsi                  |  3 ---
 arch/arm64/boot/dts/qcom/talos.dtsi                   |  4 ++--
 drivers/pmdomain/qcom/rpmhpd.c                        |  4 ++++
 include/dt-bindings/power/qcom,rpmhpd.h               |  1 +
 8 files changed, 22 insertions(+), 13 deletions(-)

