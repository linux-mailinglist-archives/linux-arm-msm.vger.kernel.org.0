Return-Path: <linux-arm-msm+bounces-80457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACB6C3698D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 17:12:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A95C862353F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 15:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9747E33DEC5;
	Wed,  5 Nov 2025 15:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="BogqQXXt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE43133C50B;
	Wed,  5 Nov 2025 15:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357342; cv=none; b=B6YwA1MvH9N/rWrgYUCQ4TY53jZWXEQaHJ/5ZJw+0yrrzLD2ZmhPb1bU/P/DsgWYsbquXyozPDYA03PIf4s0seynwy/72+QdQu3USV6k9PykX16PbaJznUpezBRoskdGCjohdRcJxO7A2oE52WQyFIDsvz3geOM6WTCwtiRByS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357342; c=relaxed/simple;
	bh=icGdVmSP3VOlJ5okplGqkHHasUa6gpmE3xun840pMJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WzYS2E2h1D9JuEy9ONJL1KcinEttV6nLL94XgWUUEY2QYdJE/JKqHBm8QAC/vnGFvMGn6C6sxJhep7dMCJjzFvjqf/Gv2X90mBWlBW637+rVH4k9emXGJCCle6dtajWNStrWrxWK0/TwWVgSTZAphU30qxm65h535WWgsI6aYqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=BogqQXXt; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.fritz.box (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 471272FC0057;
	Wed,  5 Nov 2025 16:42:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1762357330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iFxXYD/lX7n57hEwDGxK0I/hDR6mi+5CJE2ZOXgzngg=;
	b=BogqQXXtJn6rM3s0LevUqwdi0ZXLKsOYUmn50EkEr3Fs1fLVAqgoN73mX7amoRvSlY3/hX
	slrkUVpMeUqYYnpdGLuk8Sl2XhwFvt/uqr8y57SY4hIPPZhfwntj8UwSU+Top/jl1lF3r3
	JDBQpwryNlW9iFN3+I9cqG+D66pgGZE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com smtp.mailfrom=ggo@tuxedocomputers.com
From: Georg Gottleuber <ggo@tuxedocomputers.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ettore Chimenti <ettore.chimenti@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	stefan.schmidt@linaro.org,
	stephan.gerhold@linaro.org,
	wse@tuxedocomputers.com,
	cs@tuxedo.de,
	Georg Gottleuber <ggo@tuxedocomputers.com>
Subject: [PATCH v2 0/7] Add TUXEDO Elite 14 Gen1 (X1E78100)
Date: Wed,  5 Nov 2025 16:41:00 +0100
Message-ID: <20251105154107.148187-1-ggo@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initial support for TUXEDO Elite 14 Gen1 laptop. It is based on Qualcomm
Snapdragon X Elite SoC (X1E78100).

Changes in v2:
- Rebase to v6.18-rc4/master
- Add support for accelerated video decoding
- Add support for audio (speakers, microphones, headset)
- Add support for Bluetooth
- Add support for camera
- Add support for fingerprint reader
- Add support for HDMI-A port
- Add support for QSEECOM
- Add support for USB Type-A
- Add support for USB-C DP altmode
- Add ASL Xiamen Technology Co. Ltd. vendor prefix
- Add TUXEDO vendor prefix
- Add cover letter
- Removal of pointless comments
- Coding style fixes
- Spell check

The device tree uses the dtschema from Linaro qcom-laptops [1].
ALSA UCM and Audioreach topology patches are available at [2] and [3].
The fingerprint reader requires USB IDs to be patched into libfprint.
WiFi requires a firmware patch [4].

[1]: https://gitlab.com/Linaro/arm64-laptops/linux/-/commit/3d106a8ac261f81e48e4ee2a31b7484d863e0a4a
[2]: https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/x1e80100-tuxedo
[3]: https://github.com/Srinivas-Kandagatla/audioreach-topology/tree/tuxedo-fixes
[4]: https://lore.kernel.org/linux-wireless/59ed6306-28f8-478e-90fe-4a1b73ae3051@tuxedocomputers.com/

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>

Ettore Chimenti (4):
  dt-bindings: vendor-prefixes: Add ASL Xiamen Technology
  dt-bindings: display: bridge: simple: document the ASL CS5263
    DP-to-HDMI bridge
  drm/bridge: simple: add ASL CS5263 DP-to-HDMI bridge
  firmware: qcom: scm: Allow QSEECOM on Tuxedo Elite 14 Gen1

Georg Gottleuber (3):
  dt-bindings: vendor-prefixes: Add prefix for TUXEDO Computers GmbH
  dt-bindings: arm: qcom: Add TUXEDO Computers device
  arm64: dts: qcom: Add device tree for TUXEDO Elite 14 Gen1

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 .../display/bridge/simple-bridge.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    4 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../qcom/x1e80100-tuxedo-elite-14-gen1.dts    | 1486 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 drivers/gpu/drm/bridge/simple-bridge.c        |    5 +
 7 files changed, 1500 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts

-- 
2.43.0


