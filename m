Return-Path: <linux-arm-msm+bounces-58213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A5DAB9C32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 14:36:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B95C6A21D1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 12:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DF623F404;
	Fri, 16 May 2025 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOw4moov"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC03D1D6DBB;
	Fri, 16 May 2025 12:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747398971; cv=none; b=GEm8jZlOkUGrQcFKgIqa+OH1vyo3EDTTlIoZY/UN7rI0pJSASvu5ssgviaSHoP0JvORWtOuGScOZ9DIYnrZtbbAQoVwdV2MzkK/rSfGHQXobYY5dkakOsHBmS1R5DjBbqisoEAhuiWhKXAohhSuh/P37jdcT77OWotrSgzvUNWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747398971; c=relaxed/simple;
	bh=rJpXVxnBUus4bk7EUo2JlBe6LQiEcnBeH8nz+pXrakQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qP3VQSZRhZsD05QvOMjP6jtJNPVnGV40eAkNQeRyw6TVy7NTgu5nO39fhWsJ2bpPekljLM1r3wckv0ExRFidq69HrkAzk67rYtBWSLeEkJumJy2qyUa3aikpjfbrq0p7YUgyDxO3Jn2CPfylCsA3rOXgH+OvvJQkscl9NeAtHko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOw4moov; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49A79C4CEE4;
	Fri, 16 May 2025 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747398970;
	bh=rJpXVxnBUus4bk7EUo2JlBe6LQiEcnBeH8nz+pXrakQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=aOw4moovYuu2URtOxLmJIAC857uquZx8/OGFqk1N4LqilDPsnckWWU0BvUa7G3VAu
	 hd8K/Qh3FMFVrJ8TZgjMo9JrOUrVegxtIftlmz3gcAYUCzfBFpNwLn/yag1O3Ss/aa
	 vytx4w3aU6ZeL302ynajEuWP7M9ODY9fJ37+PVt3iNtcVoHW/RXdCbnnn0S5W46Dqu
	 8J4DDNzZ1wPHiWWjQR6/QzaVNRLDE7mojZwDYGWg35VgFaQnEmL6DEDFCt+RLHViVw
	 esQPjpe5NVc7uYoLZbMLirt9SMYYhkjoD216Ozz3iIwITQS9nXhrj1Xlq+vF+ArRJw
	 hL14ra2zI7c4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE68C3ABC9;
	Fri, 16 May 2025 12:36:10 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v4 0/5] Add CMN PLL clock controller support for IPQ5018
Date: Fri, 16 May 2025 16:36:07 +0400
Message-Id: <20250516-ipq5018-cmn-pll-v4-0-389a6b30e504@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADcxJ2gC/23P207EIBCA4VdpuBYDw7G98j2M2SAdXGJbetpGs
 +m7S7te1NQrMiR8/HMnE44RJ1IVdzLiEqeYujzIp4L4q+s+kMY6zwQYKKYYp7Ef8mGpbzvaNw2
 1qLip0RoRLMmv+hFD/NrF17fHPOJwy/D8uCTvbkLqU9vGuSqsg1oJj8KrYEFb4WpRh9KVTikLY
 LkOqCUacgyqij1Hck6HDF22Jgnykpu2pFIzZ4MqDROiWoBsGdc4zWn83vdc+N7xuxKcVlo4ZRR
 MycBzL5nhL+k2Nyl9PufPdi2jB0GfBciCZ64M3mPNuTwL4iDwfwSRhSCsNl45YEb/FdZ1/QF3W
 Ql4uwEAAA==
X-Change-ID: 20250501-ipq5018-cmn-pll-8e517de873f8
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, 
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747398968; l=3223;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=rJpXVxnBUus4bk7EUo2JlBe6LQiEcnBeH8nz+pXrakQ=;
 b=pKS14h5cIqFL3O7chlnYPrt4EAhFndx8NMyqGPpq9twY7tnGDTTLFIa79fBe6nG6AgkkEVfOY
 5JaWJxFXKHSAJqwh82GMkV8fUC+1epTSwpa9X6Up18uV503oclsV7E6
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

The CMN PLL block of IPQ5018 supplies output clocks for XO at 24 MHZ,
sleep at 32KHZ, and the ethernet block at 50MHZ.

This patch series extends the CMN PLL driver to support IPQ5018. It also
adds the SoC specific header file to export the CMN PLL output clock
specifiers for IPQ5018. A new table of output clocks is added for the
CMN PLL of IPQ5018, which is acquired from the device according to the
compatible.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
Changes in v4:
- Re-add missing CMN PLL node after git pull and rebase on linux-next
- Link to v3: https://lore.kernel.org/r/20250516-ipq5018-cmn-pll-v3-0-f3867c5a2076@outlook.com

Changes in v3:
- After further testing and evaluating different solutions, reverted to
  marking the XO clock in the GCC as critical as agreed with Konrad
- Moved kernel traces out of commit message of patch 1 to under the
  diffstat separator and updated commit message accordingly
- Updated commit message of patch 3
- Link to v2: https://lore.kernel.org/r/20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com

Changes in v2:
- Moved up commit documenting ipq5018 in qcom,tcsr bindings
- Fixed binding issues reported by Rob's bot
- Undone accidental deletion of reg property in cmn pll bindings
- Fixed register address and size based on address and size cells of 1
- Removed XO and XO_SRC clock structs from GCC and enabled them as
  always-on as suggested by Konrad
- Removed bindings for XO and XO_SRC clocks
- Removed qcom,tscr-cmn-pll-eth-enable property from bindings and will 
  move logic to ipq5018 internal phy driver as per Jie's recommendation.
- Removed addition of tcsr node and its bindings from this patch set
- Corrected spelling mistakes
- Link to v1: https://lore.kernel.org/r/20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com

---
George Moussalem (5):
      clk: qcom: ipq5018: keep XO clock always on
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5018 SoC
      clk: qcom: ipq-cmn-pll: Add IPQ5018 SoC support
      arm64: dts: ipq5018: Add CMN PLL node
      arm64: dts: qcom: Update IPQ5018 xo_board_clk to use fixed factor clock

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |  3 +-
 .../dts/qcom/ipq5018-tplink-archer-ax55-v1.dts     |  3 +-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              | 34 ++++++++++++++++++--
 drivers/clk/qcom/gcc-ipq5018.c                     |  2 +-
 drivers/clk/qcom/ipq-cmn-pll.c                     | 37 ++++++++++++++--------
 include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h   | 16 ++++++++++
 7 files changed, 77 insertions(+), 19 deletions(-)
---
base-commit: 8a2d53ce3c5f82683ad3df9a9a55822816fe64e7
change-id: 20250501-ipq5018-cmn-pll-8e517de873f8
prerequisite-change-id: 20250411-qcom_ipq5424_cmnpll-960a8f597033:v2
prerequisite-patch-id: dc3949e10baf58f8c28d24bb3ffd347a78a1a2ee
prerequisite-patch-id: da645619780de3186a3cccf25beedd4fefab36df
prerequisite-patch-id: 4b5d81954f1f43d450a775bcabc1a18429933aaa
prerequisite-patch-id: 541f835fb279f83e6eb2405c531bd7da9aacf4bd

Best regards,
-- 
George Moussalem <george.moussalem@outlook.com>



