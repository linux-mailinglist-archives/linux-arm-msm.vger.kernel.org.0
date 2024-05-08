Return-Path: <linux-arm-msm+bounces-19456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DF18BF462
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 04:18:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E25BB21EAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 02:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D456D8F6A;
	Wed,  8 May 2024 02:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="thgA9ds5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04BC1A2C28
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 02:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715134702; cv=none; b=Z3NGy2H8TGj2Lo0V8BiMc/qkZxvbhwuQ2kcTMvSqXx+7ooM3b/DEjJDL6bllpVCFRJWwRWgvE/iiluVvxP05iDg/CxjNgyBV9MlXKf5FvvwQYDRdWHGxxsNggq9ynnj484A8YtWeiafoyfnsiZwnRnRO5W322ZEQ7teIrR4BYXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715134702; c=relaxed/simple;
	bh=z6N29eTE8KzPYRGBbT3xpC7DEkI5Fo/50aEHfdp+YPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aMVfIUgSl6sWrKaVMQyTjcRYnhowwOEiNQh7n1kHkXwcV0otJ/hgMogUAnfvRZotZ+PY/OpF2QsKB4ZBXmtYRPUVfVqp/NjZ9HU3C0KCbLdWPMgsB2mqiAlvcUl/+ZKIAHE00F17lJ5EoeZF3mpQPxJsMUwPwYBmBMgGFRJ2bzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=thgA9ds5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72440C2BBFC;
	Wed,  8 May 2024 02:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715134702;
	bh=z6N29eTE8KzPYRGBbT3xpC7DEkI5Fo/50aEHfdp+YPA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=thgA9ds5TiE2Go/nWPUhu+anVUopTYriLcd5vWy1w0/GEF0dlWA87oKiKv5wHSBXF
	 KMMeqp1dY7d+elT2AKfwe78sjc2WKaCtj95KyitiXKO/01PmLAV33ijFg5bZcwi6ro
	 i1J4Iakte4CnMwGBm8pQJePAYba0Mf++Fq/cv+SxG6yesygtN99ep/u6EAjuxoqydk
	 sjUJX8S/kXi0YuQkoQr+f8DkBwvA1dYOW1DTy2kacKiUT3e8Xn4d6qRXF9wxPBaW90
	 oVNMZbp99bzgo6cTgzMBVJM0Ahnbi1578LpEVHwN+ZKjL0WKOdDOmD4JwzfQLx9cf3
	 +SOUrcqa+Gcaw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Connor Abbott <cwabbott0@gmail.com>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] A few more Qualcomm Arm64 DeviceTree updates for v6.10
Date: Tue,  7 May 2024 21:18:18 -0500
Message-ID: <20240508021820.206441-1-andersson@kernel.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 873d845a357a4d89700cb1bb5b3da68890756f50:

  dt-bindings: arm: qcom: Add Samsung Galaxy S5 China (kltechn) (2024-04-23 08:00:06 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.10-2

for you to fetch changes up to 0ea3e1d6f31d8aea72d0d0b53919c585a12a593b:

  arm64: dts: qcom: pm6150: correct USB VBUS regulator compatible (2024-05-03 15:30:02 -0500)

----------------------------------------------------------------
A few more Qualcomm Arm64 DeviceTree updates for v6.10

This corrects the obviously broken compatible of the USB VBUS regulator
in PM6150.

It clears the odd-looking default address on QCS404 EVB, with the
expectation that a proper address is provides by other means.

The newly added SM8650 GPU node is corrected with a missing memory
region.

The third DWC3 instance on SC8280XP is added, and enabled on Lenovo
Thinkpad X13s to give working fingerprint sensor.

----------------------------------------------------------------
Connor Abbott (1):
      arm64: dts: qcom: sm8650: Fix GPU cx_mem size

Johan Hovold (2):
      arm64: dts: qcom: sc8280xp-x13s: enable USB MP and fingerprint reader
      arm64: dts: qcom: qcs404: fix bluetooth device address

Krishna Kurapati (1):
      arm64: dts: qcom: sc8280xp: Add USB DWC3 Multiport controller

Krzysztof Kozlowski (1):
      arm64: dts: qcom: pm6150: correct USB VBUS regulator compatible

 arch/arm64/boot/dts/qcom/pm6150.dtsi               |  4 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |  2 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     | 85 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 82 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  2 +-
 5 files changed, 171 insertions(+), 4 deletions(-)

