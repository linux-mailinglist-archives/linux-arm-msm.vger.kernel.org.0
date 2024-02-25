Return-Path: <linux-arm-msm+bounces-12464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7D48628E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 03:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 348B71F20FBE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 02:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 240B08BF6;
	Sun, 25 Feb 2024 02:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hwcWXWh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22768BF2
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 02:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708829528; cv=none; b=Xhj3q1JiK7DqUTdY5GFA8NuKwXrBilYivM4daVfwgJV5u0673PZx3ICJZJtfOJAmcl9q5jBzXdKsfyccxwRqcn5zYSuQbD7HEls9tBwt1tGHAMI3QqR7vZo0xE9aYJPTuq1XN2lNkyrlb0aoMSjxAf0d52L8YSRtk0KBl18I190=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708829528; c=relaxed/simple;
	bh=adKQk8IQu/VzxOGNCArekvRYJ/UhLYvCr94PFG2f6vA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KRIM2TiA13uLsHHBDPwYgArRUdAaVmGxpUpx4zhKgP3KsCN9do6GEdL984xAph+0e3Dvzj9xVVS0hz6YkUoVMSNOQWxw7lEDGrYndtPAfi8JqSBqerfMrKD72LdcYxyiTtzFGMouAqtUf88FtiJxlYcVAt0qel4SPbz10dO8hbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hwcWXWh3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE2FC433C7;
	Sun, 25 Feb 2024 02:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708829527;
	bh=adKQk8IQu/VzxOGNCArekvRYJ/UhLYvCr94PFG2f6vA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=hwcWXWh3vD3mfUrXoVMF+MO8ZOTFHsrzqUzK4RKW1novQ2RLz75hh18lqCPKXhTh6
	 W31RSdSErEbe8qkVpAhmPOjHWqfmMcsTqcKFRdHJgg8qIJEXN1UM+azm8CtPZvjIcY
	 KY25+nZDXIQBM7nXgCLNL9Scpt+vbtDxZU1O90buNFr520Zir9BEFgXeiQx5yIeGpB
	 L9Q+wBW9KC7R0mrXPw2VK0maRABVFXTgRyQwwlGs1l+KlUG+lUvkzzdJzGL52Vn/+U
	 CoQ/7SGF8KzIv87JQ8l0X5ZBEeIfkRA8UD5hrgTWgK5Xwed7Wq7GTfUtbBUklBMuOE
	 ty2Tn7BEPrNCQ==
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
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 DeviceTree fixes for 6.8
Date: Sat, 24 Feb 2024 20:52:04 -0600
Message-ID: <20240225025205.479589-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.8

for you to fetch changes up to cb0bbdc4cc327ee91ba21ff744adbe07885db2b8:

  arm64: dts: qcom: sm6115: Fix missing interconnect-names (2024-02-03 11:37:47 -0600)

----------------------------------------------------------------
Qualcomm ARM64 DeviceTree fixes for 6.8

This marks an additional GPIO as protected on SM8650 devices, to avoid
a system reset caused by a security violation with some firmware
versions.

It also adds the missing interconnect-names, which resolves a regression
where one of the I2C busses on SM6115 devices would no longer probe in
Linux.

----------------------------------------------------------------
Konrad Dybcio (1):
      arm64: dts: qcom: sm6115: Fix missing interconnect-names

Neil Armstrong (2):
      arm64: dts: qcom: sm8650-qrd: add gpio74 as reserved gpio
      arm64: dts: qcom: sm8650-mtp: add gpio74 as reserved gpio

 arch/arm64/boot/dts/qcom/sm6115.dtsi    | 3 +++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts | 2 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

