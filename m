Return-Path: <linux-arm-msm+bounces-82165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D446C66246
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 21:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3774E4E15E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 20:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06773093AE;
	Mon, 17 Nov 2025 20:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jEFgoRav"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A583009F6
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 20:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763412538; cv=none; b=batNsGxu8hgC1XdOP49rKiITCrYy0d+pEk2IxoWKAGj7KTzpWshdahc0US7kzTi4DKTQnnzTBZP5ZRsMOIkcMIOdMZjo33ATVDnVIpiMpk1x4YuVucsD9T//PrhnzklRAk5zDgMfyXDy5ICtV8ViydcVHoOLsS+jwliemZmRbPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763412538; c=relaxed/simple;
	bh=LNX/MUXct3+YGTpPeyt0DAy4pLb/SDYVq6fjd8A1QSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M9PPb3MdT5iBT+y+AErTIDi/wvbrbx0apzTRw2J71itY3EvSFAjZXzHJW81I7GsHR/6jTk5zUYa29pGJkdLlPcy3QW1ABttFGcKR51O0kuvMRPrS6qtMskYQxtKAPQMqtFHq5BtL3mZskWNjCG9fFksO1HY8BsHxxVH/cBanOqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jEFgoRav; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D83C4CEF1;
	Mon, 17 Nov 2025 20:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763412538;
	bh=LNX/MUXct3+YGTpPeyt0DAy4pLb/SDYVq6fjd8A1QSM=;
	h=From:To:Cc:Subject:Date:From;
	b=jEFgoRav+0aRb13RQ/u6NPNSfk0KDo0YHUQx3q6BvZxTkLrQY8Vaj/Fp2v6QxbUp+
	 jy2JeOn/kjl+ycvGYSO2Kk4SoSYpUEizC8aYv9cC2JP/6ZTCTosPbWzI4IYukSF1h6
	 XA9OwJf1X9xRVxPY04g/uDhUY9KKVn2Be6COTV3r5zFavDCVUmKcrl615Z9WGs5wpd
	 ig2OcAcimaLo86Yx+Pf0YDekkaFjVB3ynFfjgHSxN/kSrt4hXGDGlXd+nRTE6E4n/Y
	 EkUb/tV3fG9cR6uchObtn2dLFjBTrauXNmIp6qkwn92R/wLdBatr8OcgFhk0QrwpYJ
	 tZmUo8iYH9hXA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Fange Zhang <fange.zhang@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.19
Date: Mon, 17 Nov 2025 14:53:39 -0600
Message-ID: <20251117205341.3177221-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.19

for you to fetch changes up to fdc7da1733d9d57c466e386d4242864d9e75c6f3:

  arm64: defconfig: Enable SX150x GPIO expander driver (2025-11-12 14:49:45 -0600)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.19

Enable config options for the hardare used across Fairphone 3, 4, and 5.
Then enable Novatek display panels founds on Xiaomi Pocophone F1, and
the SM8750 MTP, eUSB2 PHY found in SM8750, NSS clock controller found in
IPQ5424, the SX150x gpio expander used in QCS615 reference device, and
the support for UFS inline crypto.

----------------------------------------------------------------
Fange Zhang (1):
      arm64: defconfig: Enable SX150x GPIO expander driver

Krzysztof Kozlowski (1):
      arm64: defconfig: Enable two Novatek display panels for MTP8750 and Tianma

Luca Weiss (1):
      arm64: defconfig: Enable configs for Fairphone 3, 4, 5 smartphones

Luo Jie (1):
      arm64: defconfig: Build NSS clock controller driver for IPQ5424

Manivannan Sadhasivam (1):
      arm64: defconfig: Enable SCSI UFS Crypto and Block Inline encryption drivers

Melody Olvera (1):
      arm64: defconfig: Add M31 eUSB2 PHY config

 arch/arm64/configs/defconfig | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

