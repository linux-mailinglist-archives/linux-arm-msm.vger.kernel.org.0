Return-Path: <linux-arm-msm+bounces-100117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCmQAbs4xWn/8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:46:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F124336371
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:46:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 76DEC30F211F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 13:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B3D2C08AB;
	Thu, 26 Mar 2026 13:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZKwT8K7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A201A01C6
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532329; cv=none; b=jsJgYk7EIsxn3DLaxmEBCRx7/7tNDR4yI5Zbd0aLolXzgGAZz/lBLBGTktz5JpSbXHoxEMauki6/CvEXsXj6DBzhLRQpCrWec5wHjaSFEAAXuTGYmgBm8wrQoxIbujg7n0wpIrP4FY21uuuJPFflhxt6IYYxa0QfPM173qyimy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532329; c=relaxed/simple;
	bh=sXJKLR6Xugtxmj7WhI7mlr1ILFb05U6FcPvNWJU2J3U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uD4MAcPAufa9v67/hYsSvp2aqXOiLxcloBug35E1xwplsyk+0JLwQHYe25zMEe+PUvDda5Qf1l6VpFPQvXTrEST/FLD5k96i7jQ9xPcvT4edOhOLbUd7ZdlTV+p/BtWwTmpgQqcpWdYzeeJyC+0InTGstaDMXg52MqQ3epUegs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZKwT8K7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78E4C116C6;
	Thu, 26 Mar 2026 13:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774532328;
	bh=sXJKLR6Xugtxmj7WhI7mlr1ILFb05U6FcPvNWJU2J3U=;
	h=From:To:Cc:Subject:Date:From;
	b=sZKwT8K7/taa0s4nQQZLmnw8eRbCl10F795xkaBGsdFfyvn5vbI3Y+vH0ZaalyENK
	 7BpAa6fFaoxz64X4hNik3FCnM2LwTI2327k+Mv+UL2/HaP8d7bayzADwAb4rSX2MPo
	 J01yNYjnmbtBDk7YmAalzMEolfpcboJk2xOTXBpUau1Hkc8at5PfJtr9czqUPaX+v5
	 CygfV9Vgv+uFqjOmjoqqPcUdNs2uFNRwzsTgtK4sYkP/Uy3a/IGnkSsVju6oYoEpPl
	 yRZIn+ioALx7ELzq+qFOfAmfk8tB8iX2ClXYq+lRtsutp+Lz6aEOu5lWkOdBwMmhZI
	 kDswIHn+DzZzg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Daniel J Blueman <daniel@quora.org>,
	Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v7.0
Date: Thu, 26 Mar 2026 08:38:45 -0500
Message-ID: <20260326133845.66761-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100117-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6F124336371
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.0

for you to fetch changes up to 2c409e03fc04b5cded81b7add9ce509706c922e3:

  arm64: dts: qcom: agatti: Fix IOMMU DT properties (2026-03-23 22:31:40 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree fixes for v7.0

Fix the idle exit latency numbers on Hamoa, to resolve the issue that
Linux points out that the numbers are incorrect.

Fix the WCD9370 reset polarity on QCM6490 IDP.

Correct the Monaco UART10 pinconf, to apply to the correct pins.

Add reserved-memory region for Gunyah in Monaco, as the entry in UEFI
memory map is incomplete.

Fix the iommu stream specifiers for display, GPU, and video codec as the
current values aren't accepted on systems with Gunyah.

----------------------------------------------------------------
Daniel J Blueman (1):
      arm64: dts: qcom: hamoa/x1: fix idle exit latency

Loic Poulain (2):
      arm64: dts: qcom: monaco: Fix UART10 pinconf
      arm64: dts: qcom: monaco: Reserve full Gunyah metadata region

Ravi Hothi (1):
      arm64: dts: qcom: qcm6490-idp: Fix WCD9370 reset GPIO polarity

Sumit Garg (3):
      dt-bindings: display: msm: qcm2290-mdss: Fix iommus property
      dt-bindings: media: venus: Fix iommus property
      arm64: dts: qcom: agatti: Fix IOMMU DT properties

 .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml    |  6 ++----
 .../devicetree/bindings/media/qcom,qcm2290-venus.yaml         |  7 ++-----
 arch/arm64/boot/dts/qcom/agatti.dtsi                          | 11 +++--------
 arch/arm64/boot/dts/qcom/hamoa.dtsi                           |  2 +-
 arch/arm64/boot/dts/qcom/monaco.dtsi                          |  9 +++++++--
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts                      |  2 +-
 6 files changed, 16 insertions(+), 21 deletions(-)

