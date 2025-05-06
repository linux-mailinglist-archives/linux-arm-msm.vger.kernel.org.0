Return-Path: <linux-arm-msm+bounces-56896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F5FAABB00
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 09:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0810546385D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 07:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBBD2957A4;
	Tue,  6 May 2025 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkaFPmWP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4099729550A;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510261; cv=none; b=XdcvIzOMBhR9KT6KOlv6MZEtO/v/L2PhXSut8UacjiNML4/PCVNp7JacBwOvu7KcbMYiovTg1mJliSpk+BR6T8X4RxoMNaMHkPdzHkR0DG4xRpYHgedvgGirZCBJpmbAkiFz3rItdQ+dMMILUiEqrRQ7mz1/zZi+Y0umJEqgwDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510261; c=relaxed/simple;
	bh=2NkLnqttrZXSf8SWaugytk/+yucbZgZWEFVhTkqXWZk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XyXfrkCKdWMad6p0FLnkjYcFs05pOugo3HVr1u1swaxyDTe0X1NJ0zzlgcRIqmaJ5Pq9EdG6gj8RFcfvFDv0KuQuzPH3gCderncLrAP7zuArVCdtiU59WXo5PhemfhvVUe3oqnrvt4IEQwx1Dp6ZlBcOvOgfEkoDbVbYQT3b0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pkaFPmWP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1C1CC4CEE4;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746510260;
	bh=2NkLnqttrZXSf8SWaugytk/+yucbZgZWEFVhTkqXWZk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pkaFPmWP45QejUNzeWjr3sZ460/aUiyLX2Lwt4hxk008bZ4JmX5swwf05HXzIpciC
	 CTiwQo9tPu3xP2OG2PiwZA14G0tx3uYazdWydjjJGmRuo/+xNFUz4wGcsvWPaAJefB
	 NHS1pTT+pZ6MsEzsO1VCQTHbCgrvsdlB3VR4p1/i4H804LodFRmawcmJPsNEQbTbmn
	 dEXaAgCR/aLaXBenLTQCiTzt+IWmbhdfPtT8RSZ/QuMGh0gEE8B2ecDBc3H3DPy1GU
	 061cG0NabF/AUrQ/Ig1TWlAFfFNO96dZQAgb4dHiT5YmzxxXwk90bQ1VNfmeNZdbyJ
	 fgWH0aNnZRJcg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B1DC3ABBC;
	Tue,  6 May 2025 05:44:20 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH v2 0/6] Add CMN PLL clock controller support for IPQ5018
Date: Tue, 06 May 2025 09:43:32 +0400
Message-Id: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIahGWgC/2XPTW7DIBQE4KtYrEsFDzDgVe5RRRGBR4NqG//Fa
 hT57sVOF5W6QoPE8M2TzDglnElTPcmEa5pT7kuAt4r4m+s/kaZQMgEGiinGaRrGchjqu54ObUs
 NKq4DGi2iIeXVMGFM30fjx/mVJxzvpXh5XZKrm5H63HVpaSrjICjhUXgVDdRGuCBCtM46pQyA4
 XXEWqImf0HFt3Mk53QsRZfdJEFeimkn2Zo5E5XVTIhmBbIzbmle8vQ4dq78cPxOgn+TVk4ZBW0
 ZeO4l0/yU70ub89d7+Yyct237Ac1IXig3AQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746510258; l=2754;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=2NkLnqttrZXSf8SWaugytk/+yucbZgZWEFVhTkqXWZk=;
 b=KT8bfCZpRZG0yAxDIuRdyr+wR3RoqYQJbOGdRL9x0F0FBYHbXUB0138ML0E+Js0krTXKqME0Q
 mmxMW3dy65/A6EsWUXObFqZZLWNqMYAImd0c759EgmQJOXSs9TJTXVN
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

The CMN PLL block of IPQ5018 supplies output clocks for XO at 24 MHZ,
sleep at 32KHZ, and the ethernet block at 50MHZ.

This patch series extends the CMN PLL driver to support IPQ5018.
It also adds the SoC specific header file to export the CMN PLL
output clock specifiers for IPQ5018. The new table of output
clocks is added for the CMN PLL of IPQ5018, which is acquired
from the device according to the compatible.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
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
George Moussalem (6):
      clk: qcom: ipq5018: keep XO clock always on
      dt-bindings: clock: qcom: ipq5018: remove bindings for XO clock
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5018 SoC
      clk: qcom: ipq-cmn-pll: Add IPQ5018 SoC support
      arm64: dts: ipq5018: Add CMN PLL node
      arm64: dts: qcom: Update IPQ5018 xo_board_clk to use fixed factor clock

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |  3 +-
 .../dts/qcom/ipq5018-tplink-archer-ax55-v1.dts     |  3 +-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              | 34 ++++++++++++++-
 drivers/clk/qcom/gcc-ipq5018.c                     | 50 +++-------------------
 drivers/clk/qcom/ipq-cmn-pll.c                     | 37 ++++++++++------
 include/dt-bindings/clock/qcom,gcc-ipq5018.h       |  2 -
 include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h   | 16 +++++++
 8 files changed, 82 insertions(+), 64 deletions(-)
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



