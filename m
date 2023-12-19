Return-Path: <linux-arm-msm+bounces-5325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F14D381808A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 05:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1E6A28334E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 04:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F34A63D1;
	Tue, 19 Dec 2023 04:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hnixj6Ne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D9A613B
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 04:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A56C433C7;
	Tue, 19 Dec 2023 04:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702960126;
	bh=uxjrGpg8pswGWk/L0+XveZAPi6AT6Hh01Bz8IN8/1Dk=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=Hnixj6NeEw4VoAexiRCU/iHSRkHTjyo4KiXJtXOP62MZzaSOuyzvqoaXkBoNBXDHW
	 qHzOMu1wApm7Lv7yO54zWgiUoGss2K7gluPvOISUOtuLBAFvCMeWFkYfveSS+DjmgK
	 28GkGQa4KOCzkxI3nybkxGjWpUmxybESyqfRhNUVbF5mmCCWgbQroOhuxOpYu39vde
	 6eDrE/SM7VIyhko6oceVkMXkV7RdRP4R3sPxF+WpoN8nti/FmyTea11IfY/CWYYxTR
	 78hg7JSQIBXabZJKtFQO0MfKu+EBOfEUV+z6nnI3rkAzRxQnf0LHtOY6K03trggG/s
	 wk4qx8qyZubkA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v6.8
Date: Mon, 18 Dec 2023 20:33:06 -0800
Message-ID: <20231219043307.732781-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.8

for you to fetch changes up to 48a9ba5eb4d720c6e21c6e4d2a6fb6e1a97f5f2a:

  arm64: defconfig: enable Qualcomm WSA884x driver (2023-12-17 15:03:06 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v6.8

Core platform-specific drivers for SM8650, SM4450, and SDX75 are
enabled. The sound drivers for SC8280XP and SM8650 are enabled.
Lastly the UEFI Secure App driver, providing EFI variable access on some
platforms is enabled.

----------------------------------------------------------------
Johan Hovold (2):
      arm64: defconfig: enable Qualcomm sc8280xp sound drivers
      arm64: defconfig: enable Qualcomm UEFI Secure App driver

Krzysztof Kozlowski (1):
      arm64: defconfig: enable Qualcomm WSA884x driver

Neil Armstrong (1):
      arm64: deconfig: enable Qualcomm SM8650 SoC drivers

Rohit Agarwal (1):
      arm64: defconfig: Enable GCC, pinctrl and interconnect for SDX75

Tengfei Fan (1):
      arm64: defconfig: enable clock controller and pinctrl

 arch/arm64/configs/defconfig | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

