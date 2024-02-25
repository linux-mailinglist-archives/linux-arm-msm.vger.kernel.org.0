Return-Path: <linux-arm-msm+bounces-12466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A7D862902
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 04:25:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 922DE1C2098C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 03:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E23863C1;
	Sun, 25 Feb 2024 03:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m8wnoc7q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2913D63A5
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 03:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708831499; cv=none; b=uSycKB74jRKuPBFeFYDGJ1JdkBUCZ2jsMKCpWFVs0wJ7UYWQbK23IerqAz20TEUCn6llYasPgsfmcWnqCdfRE8FjRXjSYjgGPaeKs+g/v9VT3kYYveHiw8m0WbOTvZm1SN2QBqaQL/qgIDT5gzU4Ve3sxdnwyHDfIiW3y30G94M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708831499; c=relaxed/simple;
	bh=RaK3e/anGk1htM0EY0CUUPhnTrhudutwaDYAOaD8hLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UDnTWnm7sBM3VoO6EosN3mIszfZy6QVQPxkeOFKlfCRNjm/7puFilqafUPvjYCjbU4RuND7Gl8WHvBRQxBvBDXqX+ZmnrXeUDaficfEx+pSeEn/RD+vR/JNh3oc/vAG52rmSDfVLwJfvaQg2tbh1QUO3hsQfCd7v/le7396WK2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m8wnoc7q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94121C433C7;
	Sun, 25 Feb 2024 03:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708831498;
	bh=RaK3e/anGk1htM0EY0CUUPhnTrhudutwaDYAOaD8hLo=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=m8wnoc7qkYlBi5K9v4OW4u7zDXxWmMCFggKrrk1bqnl/ppNvEbbqEmPQ6gymbjFww
	 B0lo4fQliMIlIq6vx/03MQDIFYjgNI354lcEuD5oSH6s+JDSrb5ZnBhCuWQp/Ibple
	 QeGKQZF1JM21SrseDWl/e6z6kM1cSzLv0Yl6j5pLuHARKzGYpg3V93a/xux6ecMoMq
	 kfYxEfaklhz5qgxz2/6l+7bVQpgdMQ86ZO0Wq22cQseMcPoGNoJ0JDvFqM+S0y5QgW
	 gUrGAy5IWkGtG56hoSdCQF+JLucc5FCH7OhL+rwo5rWXVHSeMlxYEnU+Enks46V+jT
	 XV1Y91hmOg5zA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v6.9
Date: Sat, 24 Feb 2024 21:24:53 -0600
Message-ID: <20240225032456.481112-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.9

for you to fetch changes up to 9c5c14c066f353ac1f4e3b4dd6e19451eac61e0c:

  arm64: defconfig: Enable QCOM PBS (2024-02-16 14:32:49 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v6.9

Enable the Qualcomm PBS driver to resolve the dependency from the Light
Pulse Generator (LED-driver) on modern Qualcomm platforms. Enable the
X1E multimedia clock controllers, to provide clocks for the various
multimedia blocks. Enable Global clock controller and interconnect
drivers for the QDU1000/QRU1000 platforms.

Enable the audio drivers and the Goodi Berlin touchscreen driver, used
on SM8650 QRD.

Enable the MAX20411 regulator driver drive the GPU rail on SA8295P.

Lastly mark the Qualcomm interconnect providers that feeds UART
instances as builtin, to ensure the console exists when userspace is
launched.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: defconfig: Enable X1E80100 multimedia clock controllers configs

Bjorn Andersson (2):
      arm64: defconfig: Enable MAX20411 regulator driver
      arm64: defconfig: Enable Qualcomm interconnect providers

Komal Bajaj (1):
      arm64: defconfig: Enable GCC and interconnect for QDU1000/QRU1000

Luca Weiss (1):
      arm64: defconfig: Enable QCOM PBS

Neil Armstrong (3):
      arm64: defconfig: enable audio drivers for SM8650 QRD board
      arm64: defconfig: enable WCD939x USBSS driver as module
      arm64: deconfig: enable Goodix Berlin SPI touchscreen driver as module

 arch/arm64/configs/defconfig | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

