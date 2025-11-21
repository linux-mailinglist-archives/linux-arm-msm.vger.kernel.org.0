Return-Path: <linux-arm-msm+bounces-82861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35315C7A387
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 15:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2B8E7384E2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 14:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B5F34F494;
	Fri, 21 Nov 2025 14:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="sc4oL13Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085F134EF15;
	Fri, 21 Nov 2025 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763735249; cv=none; b=G5HH7VdbBpekao5A6b5v01vLqlibHfQyV+DeldjmGJ9mbdt0a6zztjB5+PsHSDMZ7fPkWp7rMTT7ZIARYU+qwLBLcQ8/zHedolFZjp2p6X2otio8FXqVyRL7TyceE2gM4qjhF0BPfoUffs+ERXTeDESeSGQyhyRDFLlrTQhWjWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763735249; c=relaxed/simple;
	bh=XP25VKsgFcrrSvqB7wbdkCXVyoOaG//TieAtJc5OOis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R9aLzTS4Ud9lmNwLF50EfSTuo8yASYlq3aEictK79GByDQPOLFTRDoD/3RZtDKmiim7TsbcvMwBJslv2ScLaS8xnMilC4FvNqRNsbA5JvQKYyEkrlRhAKgGayWxLfwmtqHW2CgNvpmOo86w5kRNZIbExO2nSeiyuJQbxnmJlFpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=sc4oL13Z; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.fritz.box (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 06A8E2FC0055;
	Fri, 21 Nov 2025 15:27:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763735243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ize2ZXyYjaxCMCpJ8FslcySkYmH53fwSH7t1OF//cU8=;
	b=sc4oL13Zf69fDppEm/k7qiqV0Vfez8TiF/zD7uvuyyrcCPlZ8DSIEbeIaANYLVZ8lrvzrm
	2xjEhnBoqoTCzkOyLpN0j7ZmKpBy5fKDEvpL6JdfT8BuKrinxP3DDiBdTiX66Xdqkg9CVA
	I9p0VjOiAMsSUTBHIW2j5mxOXe9sZYU=
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
Subject: [PATCH v3 0/7] Add TUXEDO Elite 14 Gen1 (X1E78100)
Date: Fri, 21 Nov 2025 15:26:12 +0100
Message-ID: <20251121142623.251118-1-ggo@tuxedocomputers.com>
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

Changes in v3:
- add DisplayPort audio to dts
- add el2.dtb to Makefile
- change dts firmware paths
- fix dt-binding (x1e78100 instead of x1e80100)
- improve commit message for elite14gen1 dt-bindings
- remove smb2360_1 from dts (only one USB-C port is present)
- remove "VA MIC BIAS1" from dts
- remove regulator-always-on from vreg_edp_3p3 (display) in dts
- rename vendor prefix of ASL Xiamen Technology to asl-tek
- sort dts

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

The device tree uses the dtschema from Linaro DisplayPort PHY patch [1].
ALSA UCM and Audioreach topology patches are available at [2] and [3].
The fingerprint reader requires USB IDs to be patched into libfprint.
WiFi requires a firmware patch [4].

Announcement and request for comments:
Because the SoC is now outdated and some functions still do not work as
well as customers would expect from the TUXEDO brand, TUXEDO Elite 14 Gen1
will not be offered for sale. We would still like to submit our device
tree to the mainline kernel and thus contribute to Linux support for a
compatible device sold by Medion (SPRCHRGD 14 S1 Elite). At least in
Germany, this device was sold in many large stores. (An official press
statement will follow on our website.)

Do you think it would make sense to implement this in a similar way to the
X1E ThinkPad T14s and Thinkpad T14s OLED (with a common dtsi)?

[1]: https://lore.kernel.org/all/20251006-topic-x1e80100-hdmi-v5-1-c006311d59d7@linaro.org/
[2]: https://github.com/ektor5/alsa-ucm-conf/tree/x1e80100-tuxedo-dp
[3]: https://github.com/ektor5/audioreach-topology/tree/tuxedo-display-port
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

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../display/bridge/simple-bridge.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    4 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../qcom/x1e80100-tuxedo-elite-14-gen1.dts    | 1515 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 drivers/gpu/drm/bridge/simple-bridge.c        |    5 +
 7 files changed, 1534 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-tuxedo-elite-14-gen1.dts

-- 
2.43.0


