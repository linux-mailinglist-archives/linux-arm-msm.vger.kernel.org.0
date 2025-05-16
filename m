Return-Path: <linux-arm-msm+bounces-58209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40904AB9B51
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 13:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C09244E6EB1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 May 2025 11:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2F52397AA;
	Fri, 16 May 2025 11:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Typvw2Qz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A88236445;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747395788; cv=none; b=SY/ccCTDuO/kvEdM7ZXNeelPkp9PQCs+Z09FDhC457ukLIMU8F8aNsf8rh+m6i08xQjx3j9cW0tnbodl0IytfBxg3R7OgHB+OGrwh7Z2DIjWDPdeNfVOQuoJVwjcqIjQ+Vevyg8Xgf/DJwC1fsK5epRfzv/Aia5djlBjjskkn2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747395788; c=relaxed/simple;
	bh=fkyGOBNq4mn02C/tNZBlsJTqqLN8Mw9XQTfp03e3HKs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lwRAVI80g5qcMjPeZxBqVeWCVATdXsTqlkzwkAdiAPtBia/k1ouxGTh8ct65ky6oPh5yM8m71MHSGYv6TrwstzyQ1fyQnKcWi1sB62Wg6+FRCTzzRCkKm3VELmWme6mhpCcmim4iuSzpZZLtghJwEu9w32URuaov/veXgGU7APw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Typvw2Qz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B96BC4CEE4;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747395787;
	bh=fkyGOBNq4mn02C/tNZBlsJTqqLN8Mw9XQTfp03e3HKs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Typvw2Qz1ZvB5T5ie/ouqdjL6FrdOkwabdTpXSEmqCNvqvVP5H+rvdDV/8SF9dO1x
	 1zQF/xZIWME9XM/7FLx/A48qg9N6c3J9DpjP1+r/UMdF48SadWfJkWlVTfWtOLVbRY
	 S2bPDmLbct9nqJgSfH8NWHWHUaz5HvTWmhYaqE9rPc0GV0hUpW8uS2sDRvwrLT4ujj
	 qLJ9ERZAMFtGBMLbI0qDuHGBOD3euRHzs6p9jCPzwSaQFqTKoZo3UFCbC8kDmZy3kp
	 wWHRPO7hU/+aXIyybYOiHk/CCGqA40hS/zgRF8ZlDYOBb+4DGpuavbM348azyGXT0w
	 8vvf0ByAJ2biw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4805FC3ABC9;
	Fri, 16 May 2025 11:43:07 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v3 0/5] Add CMN PLL clock controller support for IPQ5018
Date: Fri, 16 May 2025 15:43:03 +0400
Message-Id: <20250516-ipq5018-cmn-pll-v3-0-f3867c5a2076@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMckJ2gC/2WPy27DIBBFf8ViXSoYwIBX+Y+qiigMDapt/IrVK
 vK/FztdpMpqdEeaM+feyIxTwpk01Y1MuKY55b4E8VIRf3H9J9IUSibAQDHFOE3DWIahvuvp0Lb
 UoOI6oNEiGlKuhglj+j6Ib+/3POF4LeDlviQfbkbqc9elpamMg6CER+FVNFAb4YII0TrrlDIAh
 tcRa4maPAo11aEjOadjAZ13JwnyXJx2JVszZ6KymgnRrEB2jUualzz9HD1Xfnj8VYKnSiunjIK
 2DDz3kml+ytelzfnrtTw7aAX6QKifCVAInjkbvcfAufxP2LbtFx5Mjbt5AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747395784; l=3030;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=fkyGOBNq4mn02C/tNZBlsJTqqLN8Mw9XQTfp03e3HKs=;
 b=GGaR1mCUVxhn4A+yR6h65H9l0PYj+psc2s7YkYAelpgf+aeC/3Ewo5U45pGz/ZFgiOEWib8zg
 ih80VRgzdhLDoJ9C/e0SO5UnSyTKzk6PZqGLwGIWU8E8L7hd08eIk2b
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
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              | 20 ++++++++++--
 drivers/clk/qcom/gcc-ipq5018.c                     |  2 +-
 drivers/clk/qcom/ipq-cmn-pll.c                     | 37 ++++++++++++++--------
 include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h   | 16 ++++++++++
 7 files changed, 63 insertions(+), 19 deletions(-)
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



