Return-Path: <linux-arm-msm+bounces-36862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA54E9BAB9F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 04:57:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A502281AD1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 03:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224571667DA;
	Mon,  4 Nov 2024 03:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQeq8t+B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A3F165F04
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 03:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730692632; cv=none; b=H66iABEz/xdI60KYDdLbhopX0Hh2Povy8O/SQAHbzStB4CPRbR+RYZOJZLwizqt4vN3dHcDrKWAa7a8Er7gFRo8T+mrtfK7ZFFMe39GMif5gcwUkYrqyDm1cHqxK+yWLtixIweeE13SE+S015qo0yzkzWqilPXkWVz5eCaGuy60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730692632; c=relaxed/simple;
	bh=mA+q+8QPE2k8hM9ZLaMOj/rQw3D4xoupILk2RpZ7enM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WpaI8QRN69jh4WXJBrWQmfoYElD36BGi0HGmL3PafVvXGHdBGZB90J6Nx7SRXWGG50BNsklNweh7J4woh20VLng6lmpMIf+Nmj/5oJuDx+IhMVdhvFlQJGNLg+tdGjUbRvGA8lYMy/AGVJ9opaTXLmcKZptGugd/LZ1BmJDxXAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQeq8t+B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8ED8C4CECE;
	Mon,  4 Nov 2024 03:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730692631;
	bh=mA+q+8QPE2k8hM9ZLaMOj/rQw3D4xoupILk2RpZ7enM=;
	h=From:To:Cc:Subject:Date:From;
	b=SQeq8t+BSTkTGs+E0cEy83bRdGF1lZxagBmo9IDH4sigRZ0V1ocfaZnynwcoiL0SN
	 0NYS12R9LvreAT6Bzaepm1haPQpvtROFDWl8bbQzgv6zSDDh/ABLmV1I5s1IOWWe2w
	 fK6R+jNfzoRT2WhtKDXvvU7YRDDtgWziuCh193RSgIYidsw2uxAuxKE3ue+x1KMnOh
	 V0cL2KU0CQ0QmiRfm1C2pFJ5QTRuEW49oLpGsGH0Mjn7NtCgqulsCE9CVcvCEm+7Ru
	 q0dsRGej7hu/0AEoPfEsLZQv79X9rWNQ+h+5Ey2DNCepDbbOYs5IMz3vv+JQkMPnOp
	 VWTh3dH8NpmAw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.13
Date: Sun,  3 Nov 2024 21:57:09 -0600
Message-ID: <20241104035709.19094-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.0
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.13

for you to fetch changes up to 9c957ebbcdd131a890cf163875d4493414f84eca:

  arm64: defconfig: Enable sc7280 clock controllers (2024-10-15 11:04:50 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig updates for v6.13

This enables multimedia clock controllers used by SC7280-based devices,
such as the QCS6490 RB3Gen2.

----------------------------------------------------------------
Taniya Das (1):
      arm64: defconfig: Enable sc7280 clock controllers

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

