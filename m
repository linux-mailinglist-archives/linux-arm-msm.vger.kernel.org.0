Return-Path: <linux-arm-msm+bounces-18733-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 791CA8B4716
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 18:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A205A1C20A2C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 16:20:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6458A94A;
	Sat, 27 Apr 2024 16:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+lWHNbz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9D0A938
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Apr 2024 16:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714234839; cv=none; b=PPw64hVzgn5LokkZEDoNh3vWUHMArzWSdgMId8A9KdgoEwrCPoHmlryw4KCJmgK8DOsCXOABMY8tQ7ZzNOUu/SyYvOuuVfOzSXoXGgNpWJi7lfkFCUlZ8Zbl88JYh3GF8GlK8ChKt4+rFtBEmQdNxmk7zUfsxD+mtrDGrgdzm/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714234839; c=relaxed/simple;
	bh=kos90uBrimAOQFmD4FLvN83LV4tdVGIk36CbXsKMd/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKg42thdMUa2WuvdkEFpG1zJ3cNLNiq4QNaFQdHFCQhlecqV409OkoDho27i2C38hxiFvPO9E90NPo55gAeR6tTbBCN4mYmu0LRdpzdYMteUJV6fkfiwHKUqXVxLt2BZcs8Ps2I0SmUIt4zyJaEf1jpM1JYftUh0/udwkJk4ZKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+lWHNbz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23252C113CE;
	Sat, 27 Apr 2024 16:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714234839;
	bh=kos90uBrimAOQFmD4FLvN83LV4tdVGIk36CbXsKMd/I=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=c+lWHNbzAjZg5e6HkIcf6SdG7n1o7K1F2SQ6j00gyBHM2y3xr561Jj8ruD1AbrTut
	 lsouJaNPX1h1awpP8tHq+aaN3r6lQ1teKvM4cxuCrgWTC+NT8njGdmgxur/8n8gh4I
	 fUu6A4nyPtGxpDOqiY+WQ7LBOpVW/08+Lsr38CaBTwVzjZRBWXx1Lt8z/EXIbhHplk
	 K8zKXCD1KeQhEroocFvvPSuUUDhV9pJKUogD8J0CT3/01jiM7ZgcLuZMgBxUfOKUjY
	 rjY6X5nurE3lLeD49TBA5+wL2MO+LFdPtGWc9nTtFPCyEnAQgvsqKGFzMhhdGawlja
	 Z4AaKWWA5rLdg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Ritesh Kumar <quic_riteshk@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 Defconfig updates for v6.10
Date: Sat, 27 Apr 2024 11:20:36 -0500
Message-ID: <20240427162037.1431822-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.10

for you to fetch changes up to fefda685ec0846a1f1c2b13af2cce4cea580a768:

  arm64: defconfig: enable REGULATOR_QCOM_USB_VBUS (2024-04-23 14:09:14 -0500)

----------------------------------------------------------------
Qualcomm Arm64 Defconfig updates for v6.10

Ext4 security labels are enabled, as the expectation of setcap being
functional is widespread.

SC7280 display and GPU clock controllers are enabled, to make available
related functionality. The driver for the Novatek display panel found in
QCM6490 IDP is enabled.  The X1E80100 sound card and reset-gpio drivers
are enabled to provide the necessary drivers for this. The regulator
driver providing VBUS power on a few different platforms is enabled.
ath12k is present on several recent platforms, so this is enabled as
well.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      arm64: defconfig: build ath12k as a module

Bjorn Andersson (2):
      Merge branch 'arm64-defconfig-for-6.10' onto 'v6.9-rc1'
      arm64: defconfig: Enable sc7280 display and gpu clock controllers

Dmitry Baryshkov (1):
      arm64: defconfig: enable REGULATOR_QCOM_USB_VBUS

Johan Hovold (1):
      arm64: defconfig: enable ext4 security labels

Krzysztof Kozlowski (2):
      arm64: defconfig: enable reset-gpio driver as module
      arm64: defconfig: qcom: enable X1E80100 sound card

Ritesh Kumar (1):
      arm64: defconfig: enable Novatek NT36672E DSI Panel driver

 arch/arm64/configs/defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

