Return-Path: <linux-arm-msm+bounces-6169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DB81C8209A3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 04:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C92281C2142F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 03:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264D3EB8;
	Sun, 31 Dec 2023 03:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orhQV+Mh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6A4ECE
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 03:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5613C433C8;
	Sun, 31 Dec 2023 03:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703994163;
	bh=k16z8NhMWoR8zexqYjVSe/mqReISHeOyU7vDvoR+52Y=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=orhQV+MhHRidMSo3MNGEDVomG0YCfomHl+f7qj2fXmVF6u8t+o44022DD1mikPKCi
	 Vpwu3nPcwmKfIY8zHhWDIw83ZF11QMAUlwQO4+YMTtaKqy3VAMIQfAV83IoslD3vQt
	 Aexh+BSvaXwptegt4Z8XlZTPiK2lyoOTuSWujvm4FaOEl81LrQWiJuPCfL0XfqbzRR
	 mxTsU93T515uPHhZ+EjzD4NJUuDaOV5L6jNWvdu2GeGCmIqhjOA652gGquMd6jzSOv
	 1p1r34/zfDJBwuEneaq57VjIcRVg/EDrjKdgbRgpsouI5VXTxukJoTN3PEJSMC/wS4
	 UeBriFZCAH/vQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: [GIT PULL] A few more Qualcomm Arm64 defconfig updates for v6.8
Date: Sat, 30 Dec 2023 19:46:47 -0800
Message-ID: <20231231034648.3262882-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 48a9ba5eb4d720c6e21c6e4d2a6fb6e1a97f5f2a:

  arm64: defconfig: enable Qualcomm WSA884x driver (2023-12-17 15:03:06 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.8-2

for you to fetch changes up to 191fcf77e304392cc330fc19595cb90fd52d595f:

  arm64: defconfig: Enable Qualcomm SC8280XP camera clock controller (2023-12-22 21:22:17 -0600)

----------------------------------------------------------------
A few more Qualcomm Arm64 defconfig updates for v6.8

This enables the base drivers necessary to boot devices on the X1E
platform.
The GPU clock controller for SM8450/SM8550 is enabled and the SC8280XP
camera clock controller is enabled, to enable respective functionality
on these platforms.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm SC8280XP camera clock controller

Neil Armstrong (1):
      arm64: defconfig: enable GPU clock controller for SM8[45]50

Rajendra Nayak (1):
      arm64: defconfig: Enable X1E80100 SoC base configs

 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

