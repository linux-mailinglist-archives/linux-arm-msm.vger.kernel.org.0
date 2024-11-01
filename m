Return-Path: <linux-arm-msm+bounces-36754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8901D9B9342
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 15:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CB9C1F22E9F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 14:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFC74156F4C;
	Fri,  1 Nov 2024 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgIZvRn8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0149620
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 14:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471528; cv=none; b=pnJ2xbPiPMyKwZKSHPgICiHxYmeP5O13QXcpugjkfb/skXeWqxmehYQ3H/UFVKeR9/pehLnGIzmfyIYFcooEq+spVfoH5QNQ1/APPpjUpc9y0oWhEprzIZYeE8cDt3vwBX8ZlYyq+gzth3y5zyW1FQYgbWSKXChza5XIClBwoMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471528; c=relaxed/simple;
	bh=QkWKnBsAHTldTBGGifsX0KtIWA5PIk3Dk4/LyfzY414=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lz+rUr3riWDM+afcPUrDqcgBkwFMtSgIl9qWdfXjOJEDv6thzuKVEtmSYDgV7YR7taVLxykx56+QfdYQaMyBNLK+AJCLUCv9ekJ1znBLbcVQR8KRZ2lu0xSmk5vLS+XBOO8rfTP4hL2Ke0aapXqaoE88jdreCzeFxuvnk0nmTpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgIZvRn8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 870BAC4CECD;
	Fri,  1 Nov 2024 14:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730471528;
	bh=QkWKnBsAHTldTBGGifsX0KtIWA5PIk3Dk4/LyfzY414=;
	h=From:To:Cc:Subject:Date:From;
	b=HgIZvRn8R8dJPQqs23jKUno8Euzdg3MJUjF2PThFtuAyTIIReX4VRZ2L+gudQNc6b
	 PMJiO4ZKelQSI3JxbrvLmh6Ulp1qozlxu+jPXkgiOZxQUVE2DvkseVQxFh1FI/qUwL
	 0aKxpeyZ46Rbqvui9qquQe0uj8YHdERaLiAuLjQb9MQ3h4HQQUGR1scy/eUcv/MraO
	 lX695GGOfYco7FF/V5Z2JE2KfCHz7buYFDZOA+GuBkZt0EYAaEpwecdvCb72Ri+uiZ
	 F7nPsuSHfZU4Jzmf0A35aQpKoHK0SbWHHRx6c8q9HqE5TjhUQegj7/c8yIDqEJlF0D
	 6i+5vGT1Yn7Pw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Maya Matuszczyk <maccraft123mc@gmail.com>
Subject: [GIT PULL] More Qualcomm Arm64 DeviceTree fixes for v6.12
Date: Fri,  1 Nov 2024 09:32:05 -0500
Message-ID: <20241101143206.738617-1-andersson@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.12-2

for you to fetch changes up to 54376fe116ef69c9e58794589c044abb2555169e:

  arm64: dts: qcom: x1e80100: fix PCIe5 interconnect (2024-10-24 12:36:36 -0500)

----------------------------------------------------------------
More Qualcomm Arm64 DeviceTree fixes for v6.12

Bring a range of PCIe fixes across the X Elite platform, as well as
marking the NVMe power supply boot-on to avoid glitching the power
supply during boot.

The X Elite CRD audio configuration sees a spelling mistake corrected.

On SM8450 the PCIe 1 PIPE clock definition is corrected, to fix a
regression where this isn't able to acquire it's clocks.

----------------------------------------------------------------
Abel Vesa (2):
      arm64: dts: qcom: x1e80100: Add Broadcast_AND region in LLCC block
      arm64: dts: qcom: x1e80100: Fix PCIe 6a lanes description

Dmitry Baryshkov (1):
      arm64: dts: qcom: sm8450 fix PIPE clock specification for pcie1

Johan Hovold (10):
      arm64: dts: qcom: x1e80100: fix PCIe4 and PCIe6a PHY clocks
      arm64: dts: qcom: x1e80100: fix PCIe5 PHY clocks
      arm64: dts: qcom: x1e78100-t14s: fix nvme regulator boot glitch
      arm64: dts: qcom: x1e80100-crd: fix nvme regulator boot glitch
      arm64: dts: qcom: x1e80100-vivobook-s15: fix nvme regulator boot glitch
      arm64: dts: qcom: x1e80100-yoga-slim7x: fix nvme regulator boot glitch
      arm64: dts: qcom: x1e80100-microsoft-romulus: fix nvme regulator boot glitch
      arm64: dts: qcom: x1e80100-qcp: fix nvme regulator boot glitch
      arm64: dts: qcom: x1e80100: fix PCIe4 interconnect
      arm64: dts: qcom: x1e80100: fix PCIe5 interconnect

Konrad Dybcio (1):
      arm64: dts: qcom: x1e80100: Fix up BAR spaces

Maya Matuszczyk (1):
      arm64: dts: qcom: x1e80100-crd Rename "Twitter" to "Tweeter"

 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  2 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     |  2 +
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |  2 +
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 10 ++--
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  2 +
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  2 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  2 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 53 +++++++++++++---------
 8 files changed, 49 insertions(+), 26 deletions(-)

