Return-Path: <linux-arm-msm+bounces-84391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37185CA45CE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 16:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7064304FFD2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 15:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D182EC563;
	Thu,  4 Dec 2025 15:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="eJTIzS33"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10969286D63;
	Thu,  4 Dec 2025 15:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764863575; cv=none; b=BBAZhwthw8PDTUCFhSXyB4ilDabnSVQlYeDL7fqZi6nDbVr9YMwy88gwiqO5Dx/og7ZP7rsJE3I/o2/8vTBaKqb0XUrPC6diIqoGkyUYVoLaXXQuYfIpE/pW6W5HuGYRNWkQpLFKGPH8Bgw53B20D6DR89HBfG0lhk6uj84Zvv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764863575; c=relaxed/simple;
	bh=4L3S4CFIIzTSGtqgV9oMyHVvPOcD+ziHxoshslgy1w0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=odnc+kAkeC+UPfsWzmOmHgmhi79XVged03jWAaL37H+J+o8YLNrGhzHpEG/fy34GXCLJyD/Nx7aWOxK1hOtG81ijJZb44wWLVD78McKEbDK21gZYx+hjqTsDZ+hmC/d78uFnaaXw7ixYmBcCz/EEWetqdDM95VpM+Yz441+BwbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=eJTIzS33; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.gaeste.augsburg.tuxedo.de (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 117882FC0093;
	Thu,  4 Dec 2025 16:52:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764863569;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=d90EOM/LonCO/ibbEoSh9bXkUWke+qFxLor5VFanJRw=;
	b=eJTIzS33sVat6hrZxAJv7xlVIQnVj6NTvlQEN3PBIsEkr4Kd+sxwVwaA2PsTWNYVeE1RaS
	cb8j+9jAeHdJrtZRUvnUN4NM/20eemPAUDwcPCKy51/VpfDpmZ1rxwm+4oM418L+41j+EI
	gZn/8o7ZW9C673ffBJ4O15zTFxbu2XA=
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
Subject: [PATCH v2 0/6] Add Medion SPRCHRGD 14 S1 (X1E78100)
Date: Thu,  4 Dec 2025 16:52:02 +0100
Message-ID: <20251204155212.230058-1-ggo@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initial support for Medion SPRCHRGD 14 S1 notebook, which is based on
Qualcomm Snapdragon X Elite SoC (X1E78100).

Changes in v2:
- Add patch for tuxedo vendor prefix
- Add patch for tuxedo,elite14gen1 dt binding
- Minor changes to GPIO attributes in dts

These patches are based on the patches for the TUXEDO Elite 14 Gen1
notebook and have almost the same code [1]. I only did a rebase on
linux-next/master and replaced all vendor strings.

The patches for asl-tek vendor prefix have already been accepted [2].
ALSA UCM and Audioreach topology patches are available at [3] and [4].
The fingerprint reader requires USB IDs to be patched into libfprint.
WiFi requires a firmware patch [5].

[1]: https://lore.kernel.org/lkml/20251121142623.251118-1-ggo@tuxedocomputers.com/
[2]: https://lore.kernel.org/lkml/176400350522.514667.5379863973279531790.b4-ty@linaro.org/
[3]: https://github.com/tuxedo-ggo/alsa-ucm-conf/tree/medion-sprchrgd-dp
[4]: https://github.com/tuxedo-ggo/audioreach-topology/tree/medion-display-port
[5]: https://lore.kernel.org/linux-wireless/59ed6306-28f8-478e-90fe-4a1b73ae3051@tuxedocomputers.com/

Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>

Georg Gottleuber (6):
  dt-bindings: vendor-prefixes: Add prefix for TUXEDO Computers GmbH
  dt-bindings: arm: qcom: Add TUXEDO Computers device
  dt-bindings: vendor-prefixes: Add Medion AG
  dt-bindings: arm: qcom: Add Medion SPRCHRGD device
  arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1
  firmware: qcom: scm: QSEECOM on Medion SPRCHRGD 14 S1

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    4 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../qcom/x1e80100-medion-sprchrgd-14-s1.dts   | 1515 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 5 files changed, 1529 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts

-- 
2.43.0


