Return-Path: <linux-arm-msm+bounces-84096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A0CC9BD68
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 15:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 858763A7B3B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 14:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED02718C933;
	Tue,  2 Dec 2025 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="jxogwyTK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1E12AE70;
	Tue,  2 Dec 2025 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764686770; cv=none; b=mTrFK2mR1jQ4mMKwLEWIMN0T4akIu9fECdL+pOOlcEzhLZtGEz35U3uxjfSRBI92HTPUEJ29XdVp8436X9BJFguq3NaKPPCRJB628CZaa4MfnfLGEwLp4C6fVl6Fl5tKMv1gi+RJrNxe9aWAgDIHYTstUhus26bF1h9UakS1pPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764686770; c=relaxed/simple;
	bh=e99jIHZIJKr3uBuAwNspgstDVg2xBcPJG4DC41GXKZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CDaQjD+6GDkuqn64Yeeg3qtzLT9kD7z9Bd4UAH0czxsXRGzIkxCAtdN6pU8A17oWDJHp2h4TVCUrmV02l0NM2gdAKCDbWaV9Lo2BY/hE76LxTnAZo3Yvw6mAU5yqSZJjHbIM+W9015DUHkOCXexk4PtsRU2RtEoObCCO//0Cn14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=jxogwyTK; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from ggottleuber-tuxedo.gaeste.augsburg.tuxedo.de (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
	(Authenticated sender: g.gottleuber@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 034802FC0052;
	Tue,  2 Dec 2025 15:38:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1764686316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vnAF2uPKeHmjxWZks1/IPFCUtPM6e74TqlFq/UXbEdA=;
	b=jxogwyTKWPZwPxdLM9XmS93ReiDARX+r8eHq6p0DkCEDiSJbw9X7D+KXKLqQ95heIbhCnp
	eI5mCUMF5I5t3e9c+c8MN/rMut7/Jl00Nshq5Th0YI+QMqipomuZAOF4yErZUHNe6cqtD/
	Zg3LCocl0lZnbXitgrRVLzqYY7KKTPs=
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
Subject: [PATCH 0/4] Add Medion SPRCHRGD 14 S1 (X1E78100)
Date: Tue,  2 Dec 2025 15:37:50 +0100
Message-ID: <20251202143757.69817-1-ggo@tuxedocomputers.com>
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

These patches are based on the patches for the TUXEDO Elite 14 Gen1
notebook and have almost the same code [1]. I only did a rebase on
linux-next/master and replaced all vendor stings.

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

Georg Gottleuber (4):
  dt-bindings: vendor-prefixes: Add Medion AG
  dt-bindings: arm: qcom: Add Medion device
  arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1
  firmware: qcom: scm: QSEECOM on Medion SPRCHRGD 14 S1

 .../devicetree/bindings/arm/qcom.yaml         |    6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../qcom/x1e80100-medion-sprchrgd-14-s1.dts   | 1520 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 5 files changed, 1531 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts

-- 
2.43.0


