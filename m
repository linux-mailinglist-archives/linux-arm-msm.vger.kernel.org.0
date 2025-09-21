Return-Path: <linux-arm-msm+bounces-74311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF17B8D33D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 04:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D497C7B322A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 02:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBCB155C82;
	Sun, 21 Sep 2025 02:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aGzHDFr7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394E62AD1F
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 02:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758420147; cv=none; b=WlRGmpTAokIoXFQvt+vjhYCCROWeXWCIIve2Ds5sx1/TgX9yieb19JZZM816CrfArvflx4UCQ96FBZ6q7A/KeP3KmQ9Cimf8tDkdMEvaKg4oD/0xFjoglQqRt6xcRqVVj7LGc0E/KBLfQ/+eaB9TlAu+7fAlzrblBaxtC0wcxX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758420147; c=relaxed/simple;
	bh=Dfj37Sftvqia1c23oR0KQMdwAxSQc1SLZbmSxYfQvmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fm3hGKHM1ndW9zmWLnHwIJ8LZJLn/KjTvpU07/UbYkgRRHJhmJO9KSseJVRm7C/LMHMNQdwcao1Z6vNvtqZfk/p6yTv37u/JWyLwkkypzSJiooagtq8PaqG/71ULXgCbX5Bcr81sSx0peg1jIcQqn83fr1LIUsTN/aGDUuQ4Gc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aGzHDFr7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331D6C4CEEB;
	Sun, 21 Sep 2025 02:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758420146;
	bh=Dfj37Sftvqia1c23oR0KQMdwAxSQc1SLZbmSxYfQvmA=;
	h=From:To:Cc:Subject:Date:From;
	b=aGzHDFr7rErCH6cQma6Tt7rVt9RCdESjDxLkeeX/+dYalAuyZyjM1ScWJkPUGiAbx
	 QvEgeRJy7syQ8w6OFzAp/Tdljn96Qp86kq5WSRICioUlAbZgRNrTZIKY5nhmMmON+C
	 Lr1V29qMSYNz88KJ8j9wn7e9hDskVFZt7Z0nWZXPMs8bRuY3kuNy0Qocrd0GTiIKdt
	 zwa/IzdzSWqtCKIZUBG/8kC8r4wJk4iSVEmP555KpCEo24crRoRrxUp8L0xYGQZEuB
	 V8pO3wPsJjTzhHiCO81J3xU1SmPqC7r0bStEMU9VwNQyO9xCJAEFwZLlFNbppVxXT1
	 NbcwZTPg+8BXw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm device driver updates for v6.18
Date: Sat, 20 Sep 2025 21:02:24 -0500
Message-ID: <20250921020225.595403-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 3cc9a8cadaf66e1a53e5fee48f8bcdb0a3fd5075:

  firmware: qcom: tzmem: disable sc7180 platform (2025-09-11 16:38:33 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.18-2

for you to fetch changes up to 3f1707306b79cafc5a11350befd5a4081b807760:

  serial: qcom-geni: Load UART qup Firmware from linux side (2025-09-17 13:51:08 -0500)

----------------------------------------------------------------
More Qualcomm device driver updates for v6.18

Introduce support for loading firmware into the QUP serial engines from
Linux, which allows deferring selection of which protocol (uart, i2c,
spi, etc) a given SE should have until the OS loads.

Also introduce the "object invoke" interface in the SCM driver, to
provide interface to the Qualcomm TEE driver.

----------------------------------------------------------------
Amirreza Zarrabi (2):
      firmware: qcom: tzmem: export shm_bridge create/delete
      firmware: qcom: scm: add support for object invocation

Bjorn Andersson (1):
      Merge branch '20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-2-17f07a942b8d@oss.qualcomm.com' into drivers-for-6.18

Viken Dadhaniya (6):
      dt-bindings: qcom: se-common: Add QUP Peripheral-specific properties for I2C, SPI, and SERIAL bus
      soc: qcom: geni-se: Cleanup register defines and update copyright
      soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem
      i2c: qcom-geni: Load i2c qup Firmware from linux side
      spi: geni-qcom: Load spi qup Firmware from linux side
      serial: qcom-geni: Load UART qup Firmware from linux side

 .../bindings/i2c/qcom,i2c-geni-qcom.yaml           |   1 +
 .../bindings/serial/qcom,serial-geni-qcom.yaml     |   1 +
 .../bindings/soc/qcom/qcom,se-common-props.yaml    |  26 ++
 .../bindings/spi/qcom,spi-geni-qcom.yaml           |   1 +
 drivers/firmware/qcom/qcom_scm.c                   | 119 +++++
 drivers/firmware/qcom/qcom_scm.h                   |   7 +
 drivers/firmware/qcom/qcom_tzmem.c                 |  63 ++-
 drivers/i2c/busses/i2c-qcom-geni.c                 |   8 +-
 drivers/soc/qcom/qcom-geni-se.c                    | 506 ++++++++++++++++++++-
 drivers/spi/spi-geni-qcom.c                        |   6 +
 drivers/tty/serial/qcom_geni_serial.c              |   8 +-
 include/linux/firmware/qcom/qcom_scm.h             |   6 +
 include/linux/firmware/qcom/qcom_tzmem.h           |  15 +
 include/linux/soc/qcom/geni-se.h                   |   4 +
 14 files changed, 739 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,se-common-props.yaml

