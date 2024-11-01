Return-Path: <linux-arm-msm+bounces-36768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A689B950F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 17:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B25A1F22CDD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 16:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09A31CB50E;
	Fri,  1 Nov 2024 16:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRGQsaNj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB831CB501
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 16:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730477697; cv=none; b=Z1Rklh2ylSp5CjRP89soL2I2f8GgDXufYgOscW5JGF99Oa2+CuHyXE8lFA/KXKGtbJpMbefylTcAVlW3SQYAolRz+E+xGB7buui7DwFRcChmKbwnlSadRrk/l4pNY1Mxkz+21OOmDxeIpnrYkPUSlm0CZc6Zeu2s8aIYZupYtXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730477697; c=relaxed/simple;
	bh=/KS/SG1ZMGsVtQYssxXqdBZU7mlChx4+IvLbta2AuOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OcjGIFJNz2RrxEf9X11KN5UDS4EQAcMKWVATLVXjQSNVecIolTkMBOd+ATGP4hpS06Sn4Tb5dfkdAY3Fa2mMeAJbpRwsJhOvPDwC0cwYZDw1t+rLQoGhOF84F/Wfv3mS6LioqQGCDKoG7RP8cMwLrpk6BQ+gSzjfo+IrmbrQaYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRGQsaNj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F30C4CED1;
	Fri,  1 Nov 2024 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730477697;
	bh=/KS/SG1ZMGsVtQYssxXqdBZU7mlChx4+IvLbta2AuOc=;
	h=From:To:Cc:Subject:Date:From;
	b=rRGQsaNjDJ9TQc5BqrmRi7jYw5Ye17yE6gqW7dgkuH6/enG83R5PtQgUVfaFR62b6
	 Ecv+BaZ95R8KJqB/8wALea0NBvH4Ebj9x8S94Rkhr/cfeHsZiU81SBZaBWUaii0zqr
	 jWl3ACdhxBKe06nHsvJ4DN9jCaX1fMXMsmG5qdVRYTdla4SDMuyPF1QM5hqa1+Jq2h
	 xaGFXjD5HBJu5MAP6jdDCSf+3PjIjeuRaaq3Xt/QoQphugYIGeD2mP7UfrvsfrCZ4r
	 LhlyFWcfIEiOyr5vAQVkW3KAYkPYTriEJmTZdw8UF0bv7muG0VKEyhDPjFyez5I7my
	 n6bL9jiP//XlA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Charles Han <hanchunchao@inspur.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Qingqing Zhou <quic_qqzhou@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Simon Horman <horms@kernel.org>
Subject: [GIT PULL] Qualcomm driver fixes for v6.12
Date: Fri,  1 Nov 2024 11:14:54 -0500
Message-ID: <20241101161455.746290-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.12

for you to fetch changes up to f8c879192465d9f328cb0df07208ef077c560bb1:

  soc: qcom: pmic_glink: Handle GLINK intent allocation rejections (2024-10-24 13:03:37 -0500)

----------------------------------------------------------------
Qualcomm driver fixes for v6.12

The Qualcomm EDAC driver's configuration of interrupts is made optional,
to avoid violating security constriants on X Elite platform .

The SCM drivers' detection mechanism for the presence of SHM bridge in QTEE,
is corrected to handle the case where firmware successfully returns that
the interface isn't supported.

The GLINK driver and the PMIC GLINK interface is updated to handle
buffer allocation issues during initialization of the communication
channel.

Allocation error handling in the socinfo dirver is corrected, and then
the fix is corrected.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      firmware: qcom: scm: fix a NULL-pointer dereference

Bjorn Andersson (2):
      rpmsg: glink: Handle rejected intent request better
      soc: qcom: pmic_glink: Handle GLINK intent allocation rejections

Charles Han (1):
      soc: qcom: Add check devm_kasprintf() returned value

Johan Hovold (1):
      firmware: qcom: scm: suppress download mode error

Manikanta Mylavarapu (1):
      soc: qcom: socinfo: fix revision check in qcom_socinfo_probe()

Qingqing Zhou (1):
      firmware: qcom: scm: Return -EOPNOTSUPP for unsupported SHM bridge enabling

Rajendra Nayak (1):
      EDAC/qcom: Make irq configuration optional

Simon Horman (1):
      MAINTAINERS: Qualcomm SoC: Match reserved-memory bindings

 MAINTAINERS                        |  2 +-
 drivers/edac/qcom_edac.c           |  8 +++++---
 drivers/firmware/qcom/qcom_scm.c   | 17 ++++++++++++++---
 drivers/rpmsg/qcom_glink_native.c  | 10 +++++++---
 drivers/soc/qcom/llcc-qcom.c       |  3 +++
 drivers/soc/qcom/pmic_glink.c      | 25 ++++++++++++++++++++++---
 drivers/soc/qcom/socinfo.c         |  8 +++++++-
 include/linux/soc/qcom/llcc-qcom.h |  2 ++
 8 files changed, 61 insertions(+), 14 deletions(-)

