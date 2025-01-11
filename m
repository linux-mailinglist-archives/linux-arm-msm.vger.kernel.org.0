Return-Path: <linux-arm-msm+bounces-44808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C22A0A51A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 18:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0313E169586
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 17:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F061A8F6E;
	Sat, 11 Jan 2025 17:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IaF4wjVN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1CA18CBFE
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 17:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736616788; cv=none; b=XA6sabzS/eh152GEftOGNEcHLpZLIy3LUx89LE3HCXuTmw8jUbrl3pSg9PibsoLthms+SQs1pd/soPup4EZqMuN+nSUZFIMoi/85DXu2CV8oVvJKEtXgx3TV572yP0Cer6WA0UlqnCjZ1qWbi+SyVmErQOE7O0frtt7a621Gznk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736616788; c=relaxed/simple;
	bh=3FHm1o2a77cyqAtNnb+6A0yOHRJWuUqqYK8pCZPQ9ZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rD53JUwFhTSWEhx3+egtUPKIoJXZ89ofgQjjyPWdBaJe7F9AKvhSeXJY2V5Hbz5C9Cm0jgSUKKi0ocQ0y9v9GeNRQAbWT3DouaLZfk7GP6lVOyqXHiyKsKktFyT+hhZ01WMWARAmFxZF52Q8bmUFLu/pM+EazV0wXlyHUz7XcQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IaF4wjVN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345E3C4CED2;
	Sat, 11 Jan 2025 17:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736616788;
	bh=3FHm1o2a77cyqAtNnb+6A0yOHRJWuUqqYK8pCZPQ9ZI=;
	h=From:To:Cc:Subject:Date:From;
	b=IaF4wjVNrWiQW/9e8Vy7NQhtbSMqlMP14L/b0C/ICbRDHh/iCRnGUcagr9dnRxLxU
	 2k3bT57btrU9QSVq37KNIDVTK72EDPjd1DQAgxQTtGbfb/q/QPkOUVg66Yyg05V/1P
	 XgWO6NSWK5RtNdtf4MTXdv5AAf+vmlB59PJIRYhANOk+SfE3FEIEobI4pAq3sLqeZp
	 oP72qOEBD2qZnVxzacLh9yh0VkTRXis4MprSAJYL5Lx8H+s7bAcr/4tzPeZw3+re3j
	 0u+ucjmE/Ez5lxs3HRYG17kjyt763plfSJszgfVtAoLpGJPnLjlD80efRV2CTNrZza
	 r+JlSzOSHec6A==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Jingyi Wang <quic_jingyw@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lijuan Gao <quic_lijuang@quicinc.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Ross Burton <ross.burton@arm.com>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.14
Date: Sat, 11 Jan 2025 11:33:05 -0600
Message-ID: <20250111173306.392204-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.14

for you to fetch changes up to 1fe6c70fec8fd8c823afee66467f85f028b0d22c:

  arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock controller (2025-01-07 21:08:21 -0600)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.14

Enable core drivers for SM8750, QCS8300, SA8775P, and QCS615. Enable the
IPQ CMD PLL driver. Drop the 8650 display clock option, now that the
driver has been consolidated with 8550.

----------------------------------------------------------------
Jingyi Wang (1):
      arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS8300

Krzysztof Kozlowski (1):
      arm64: defconfig: Enable basic Qualcomm SM8750 SoC drivers

Lijuan Gao (1):
      arm64: defconfig: enable clock controller, interconnect and pinctrl for QCS615

Luo Jie (1):
      arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock controller

Ross Burton (1):
      arm64: defconfig: remove obsolete CONFIG_SM_DISPCC_8650

Taniya Das (1):
      arm64: defconfig: Enable sa8775p clock controllers

 arch/arm64/configs/defconfig | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

