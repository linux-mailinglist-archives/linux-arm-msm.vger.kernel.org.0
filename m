Return-Path: <linux-arm-msm+bounces-56473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCFFAA6F31
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EE064C17F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 10:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A657D23AE83;
	Fri,  2 May 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M6OUgtrU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B8022E3F1;
	Fri,  2 May 2025 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180949; cv=none; b=l6bR9wIP1Wpcvl+mW/QVtHJauHBSaEgyMFaEF/MphMfix9hUNoCEpr2yS7eCbBJH8pA639gHHg8H8s0YmZ/n/Ls8e2CGFesnqV5Kg39+WfSmJajASuEAVW+a9DDCLpgFAWnqmkYqCOFzWXHbl2z7V4yHWb4AOFFGQcbFut5v7gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180949; c=relaxed/simple;
	bh=3c3+5z27CJFct2aKCPDEIOAcWESjT7K/nmpBVR7j1XA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hr8FKn051iuw+2JAfNshyBGfbgNCpfF7WfXYjQqfc7gPhVy1LH9lxV9XJc2GI10RUU6oK96jnc9s636mBj/F38avm3mhGiGPm7F5trbV67L+AvJCwfztwob8KscPi+cP3LL1RKemya7rIpvC7ntcWb4VVNoLzdEZoS1NE4BgorU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M6OUgtrU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E36E5C4CEE4;
	Fri,  2 May 2025 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746180949;
	bh=3c3+5z27CJFct2aKCPDEIOAcWESjT7K/nmpBVR7j1XA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=M6OUgtrUlHVua3jtsjavMsPBHBhayoY9AEcU5jKX5fWPK3EEa7jKlDE9Uf160GV97
	 B39HpHULYqA1acYVn5g0P/2fUr6VC/jFn2k/WozJ1qhplc//mC/onm1vy/UXHj4H/F
	 2c6q5aesy7ox299X2b58BnChFO01FsRqDSs9sI7/fRXkbjFTtvz+QBTjykPuKQP4lI
	 L4619phjP4zvgf+BOv5ZlTbHG1C5vk60nAgPLIv6Tv3knf3zfd/5sSlsuCxME8oiR8
	 aRgfuR7j+xIUuzJ7/aTNoDLm5sqviDkZ36gSaMZ1DS+INXHohPXg++GfR0BKu9MJ30
	 ILdiri8OjhxLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF73AC3ABAA;
	Fri,  2 May 2025 10:15:48 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Subject: [PATCH 0/6] Add CMN PLL clock controller support for IPQ5018
Date: Fri, 02 May 2025 14:15:42 +0400
Message-Id: <20250502-ipq5018-cmn-pll-v1-0-27902c1c4071@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE6bFGgC/02OXQqDMBAGryL73EB+jK5epYikyaYNqNVopSDev
 VFf+rTMwjfMBjPFQDPU2QaR1jCH95BA3DKwLzM8iQWXGCSXmmsuWBindJDZfmBj1zEkLUpHWCq
 PkFZjJB++p/HeXBxp+iTxcj3hYWZi9t33YakzNNJpZUlZ7VEWqIxTzlemMlqjlCgKT0VOJfwH1
 dmZkwvBpiRqj6Zc5m1qOpKqghv0uiq5UvUqodn3H/kC1FroAAAA
X-Change-ID: 20250501-ipq5018-cmn-pll-8e517de873f8
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luo Jie <quic_luoj@quicinc.com>, 
 Lee Jones <lee@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746180945; l=1972;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=3c3+5z27CJFct2aKCPDEIOAcWESjT7K/nmpBVR7j1XA=;
 b=4vvd5Svjyxb5OLpkhk7VVUVphoiGh7arQX79G3tzygL39SN53iPp0e+3DY/IKAX/+oN2XMX94
 tommmv5sfSDB2awRhaeCYC55VYwNSQN/DLfIO8IgljvxL9sa5tfb7Di
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
George Moussalem (6):
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5018 SoC
      clk: qcom: ipq5018: mark XO clock as critical
      clk: qcom: ipq-cmn-pll: Add IPQ5018 SoC support
      dt-bindings: mfd: qcom,tcsr: Add compatible for IPQ5018
      arm64: dts: ipq5018: Add CMN PLL node
      arm64: dts: qcom: Update IPQ5018 xo_board_clk to use fixed factor clock

 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 11 +++-
 .../devicetree/bindings/mfd/qcom,tcsr.yaml         |  1 +
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |  3 +-
 .../dts/qcom/ipq5018-tplink-archer-ax55-v1.dts     |  3 +-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              | 40 +++++++++++-
 drivers/clk/qcom/gcc-ipq5018.c                     |  2 +-
 drivers/clk/qcom/ipq-cmn-pll.c                     | 72 ++++++++++++++++++----
 include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h   | 16 +++++
 8 files changed, 129 insertions(+), 19 deletions(-)
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



