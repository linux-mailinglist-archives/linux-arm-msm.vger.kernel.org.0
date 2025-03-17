Return-Path: <linux-arm-msm+bounces-51655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01020A66013
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 22:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86C0D16598C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 21:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46476204597;
	Mon, 17 Mar 2025 21:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vB0uk86B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A381A238A
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 21:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742245320; cv=none; b=CQSF8xbiYtmy5G127k8Uqd18sx9hHvIs8ckwtATIcmhRjedGSY/E8P62OmXWG/0YIi4sNeQzotnE1RyeCVEsZjZWongVw9YPKlGVyraJo1KFHcYYU7kAuJFjwla9NQnLeUFwSHtvSZlbh0snPj2kZVnzKrB7YTVcxxutRpgrgbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742245320; c=relaxed/simple;
	bh=zG2hpe1DsFIm3tM39WuYACGLDuIt+zLz8Q5ndylkIiU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aQoNp3ucTUaeMFGBzHQGyRWwTs9ex3M00xQ7gLYpkZsEhdpMteQoUGLwKiVSZjUmSE5DUx2iOihsvnUMOAUwGnYLUMJgIGIJvhTBKVIAlV6OtTvNSJO50Ftdu+5jtkktbgUaMecnFUuKCFSeM+ZD1nHQFCmkVRvhF0ySb7PiFBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vB0uk86B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21405C4CEE3;
	Mon, 17 Mar 2025 21:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742245319;
	bh=zG2hpe1DsFIm3tM39WuYACGLDuIt+zLz8Q5ndylkIiU=;
	h=From:To:Cc:Subject:Date:From;
	b=vB0uk86By9PGAa8OADRimQRl8EEWP7ka9vW+7+jF6qQv9BKUxAJFZtY0vzHdKwfeP
	 uZ2Jw5b/Q6Edx/PBSOGC4BJETJcMzBho761WkgxkLoUD3lmk9fII/lqNIReS33aog2
	 hpQwE83SeAeZ17z1aKUPtG70CtnRC4AaNsl2/tFWiATPLAo1m0XMZwKlKxkFMJE8nK
	 Fbbw3PPTyZO286yKKjg8gPBh7XSoD66UR4uu3zUzoVP/831WzFfs229RDY+HZsJ36A
	 wHh3Ozeb5Tu48YuGGkQqJ4AHKMjiBQzOQCdzjNGPSfq8Bj7R1BNeZlgkqVOJ+ipIew
	 ah6yZMYsrPUAg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: [GIT PULL] Qualcomm driver updates for v6.15
Date: Mon, 17 Mar 2025 16:01:57 -0500
Message-ID: <20250317210158.2025380-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.15

for you to fetch changes up to 2e14c17a2e3d697bef6b5bf49b253d6e52f3d186:

  soc: qcom: Do not expose internal servreg_location_entry_ei array (2025-02-14 11:37:30 -0600)

----------------------------------------------------------------
Qualcomm driver updates for v6.15

Improve the client interface for the Qualcomm ICE driver to avoid
leaking references, including fixing the client drivers to call the new
function.

Adopt str_on_off() helper in AOSS driver and mark non-global servreg QMI
element info array in the PDR driver static.

----------------------------------------------------------------
Jishnu Prakash (1):
      dt-bindings: soc: qcom: qcom,pmic-glink: Document SM8750 compatible

Krzysztof Kozlowski (2):
      soc: qcom: Use str_enable_disable-like helpers
      soc: qcom: Do not expose internal servreg_location_entry_ei array

Tudor Ambarus (4):
      soc: qcom: ice: introduce devm_of_qcom_ice_get
      mmc: sdhci-msm: fix dev reference leaked through of_qcom_ice_get
      scsi: ufs: qcom: fix dev reference leaked through of_qcom_ice_get
      soc: qcom: ice: make of_qcom_ice_get() static

 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |  1 +
 drivers/mmc/host/sdhci-msm.c                       |  2 +-
 drivers/soc/qcom/ice.c                             | 51 +++++++++++++++++++++-
 drivers/soc/qcom/pdr_internal.h                    |  1 -
 drivers/soc/qcom/qcom_aoss.c                       |  3 +-
 drivers/soc/qcom/qcom_pdr_msg.c                    |  3 +-
 drivers/ufs/host/ufs-qcom.c                        |  2 +-
 include/soc/qcom/ice.h                             |  3 +-
 8 files changed, 57 insertions(+), 9 deletions(-)

