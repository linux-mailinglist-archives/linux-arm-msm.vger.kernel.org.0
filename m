Return-Path: <linux-arm-msm+bounces-13392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F56872D62
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 04:12:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FD481F285F2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Mar 2024 03:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F13C12E68;
	Wed,  6 Mar 2024 03:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9l9fHIq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B10A12E63
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Mar 2024 03:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709694731; cv=none; b=XXfF95SYvcDsBD+9suroFBBkzhhBL1rYLls0Wqv6Bzq2BIpO3sra3LNjJ8vQJ+6NoK1cCrs9499Impj1oJrDqdrRLhsKjq+v8jN6hVjSStmaajYO/PVvyfYhHWloyf2X7MPcM73o4RLQfFUT8ai4rzzbS2Vpu+qOsfEd3mME+yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709694731; c=relaxed/simple;
	bh=02cMmXsDdW1gVgqMD4VAOemGW7i9TpF85kHhYBvLZW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EzH3wmwIEIKz44c8Ojil+8HN7tPMUDDIylPB36YubFw6m+4AedVpc4cu9+hBdY0cpQjySDN40G6Nln9d0pD49AgfjThachDMA+wB4JznCw0WcfecaXuC8VzcYb8c/FtZOBdM0w4b1oDbMUvklPwzUf0EkU6Ndx3/pVIv6dfwdnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9l9fHIq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EABD3C433C7;
	Wed,  6 Mar 2024 03:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709694730;
	bh=02cMmXsDdW1gVgqMD4VAOemGW7i9TpF85kHhYBvLZW8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=S9l9fHIqRPQBv5DCKMAzqnyF7GGcDC8l8BrvRrsc+oIG2wIaUD5AeMPgKoGgQIJoN
	 TwWOHb/QoISsD/AISmlFa+HUv3+scUhWXiNTomIuU/cK/NT/lPBFvLbm199WKQ3tTs
	 YGSWGvI1SEvQ0wXyfDxyKG24Ryaf4LLEyeL+RJh0VHRAumTTU6mq0LAtZnfr07FeKj
	 O0U2D0xJEa3avwAgSCGwuQTmcNEeC6EosK4+gDOqUgCWW2Dsm27YxnwugQHarxc+59
	 dg++15qlXIKgPKfF+eA/wJSAgdE0jd4cyvHDhLv3dPzBI29Z4JCNUFTyzb06TnXPN2
	 4RXa08pxb1+pA==
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [GIT PULL] A few more Qualcomm Arm64 DeviceTree fixes for v6.8
Date: Tue,  5 Mar 2024 21:12:07 -0600
Message-ID: <20240306031208.4218-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit cb0bbdc4cc327ee91ba21ff744adbe07885db2b8:

  arm64: dts: qcom: sm6115: Fix missing interconnect-names (2024-02-03 11:37:47 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.8-2

for you to fetch changes up to 4f423c4cbe26d79d8974936eb01e0d6574c5d2ac:

  Revert "arm64: dts: qcom: msm8996: Hook up MPM" (2024-03-03 19:49:51 -0800)

----------------------------------------------------------------
A few more Qualcomm Arm64 DeviceTree fixes for v6.8

This reduces the link speed of the PCIe bus with WiFi-card connected on the
Lenovo ThinkPad X13s and the Qualcomm Compute Reference Device, avoid
link errors and initialization issues reported by users.

It also reverts the enablement of MPM on MSM8996, which is reported to
prevent boards on this platform from booting for some users.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      Revert "arm64: dts: qcom: msm8996: Hook up MPM"

Johan Hovold (2):
      arm64: dts: qcom: sc8280xp-crd: limit pcie4 link speed
      arm64: dts: qcom: sc8280xp-x13s: limit pcie4 link speed

 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 39 ++++------------------
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  2 ++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  2 ++
 3 files changed, 10 insertions(+), 33 deletions(-)

