Return-Path: <linux-arm-msm+bounces-46118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 126D0A1C0AC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 04:31:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 620477A1CD9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Jan 2025 03:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788AF78F29;
	Sat, 25 Jan 2025 03:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPogy25u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6A13595E;
	Sat, 25 Jan 2025 03:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737775888; cv=none; b=uXUnT2y1JcTYnFnIYuMgYyiHGjLcXd0h2/Q9gAQEqBb+5QoXfnGyhv42BYLaNW7toEI9Hg/EsZLl2kijOjPNvY2nLLFInQc3HJft8hY5+H4H4w7lLMgJNAPGCv/IoZEDN/2W+HhpXyUA0UVCleK/yEr87CTh2n2TO5JRjnntWIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737775888; c=relaxed/simple;
	bh=nHAa6+rhzIVq14iE10KQE5p5M0mnRnXUn1tLmXTmSdk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=llw89PRmvr+BZctA3m0M5WKWtP7IJ6Zwd2YM1fvlxhh0mS7K93hs/gUN/7sRWiGytrNdAZJBqMv3I3ZkIHVVzGOlTH11ce4/9YPWX5D3NR1u8KkH0ChCl//HYLTk7pq15DUjCZbUM0NQQU/LTRYVUS9WGKgItRiHUL3cfcSyB8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPogy25u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F291BC4CED6;
	Sat, 25 Jan 2025 03:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737775887;
	bh=nHAa6+rhzIVq14iE10KQE5p5M0mnRnXUn1tLmXTmSdk=;
	h=From:Subject:Date:To:Cc:From;
	b=VPogy25uS77IvsADujpnifvP++TAZMuYb3hPV6QtmVMNcdH6agDKBjx5bpbCS18y1
	 odpA8LcHLuN9hsmKsrpU3x5N1cc0jlplEik7T/XbCuPc68yfqHjzOXyYaSrGzzI0NI
	 8nPrpPlTSqG2LVLpWo+bsc52SqsLf/ryPiTD/a5JriXOSdGPWDcJh4mS24lxSUEfTH
	 N+piMsMTtQr3k3kWl84fAhblNzb1hLHqgzqBfra91PoOf3vUDgocJNxDLGItnKZCgS
	 hJ7xoCRx5l4/GPMifqqjEpZ+Rvjh2NR5jfSJVagnuhxD2ilUH7gfy0gcHndnUK4OaC
	 sYTT5wY5YJPtQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH 0/6] X1P42100 DT and PCIe PHY bits
Date: Sat, 25 Jan 2025 04:31:16 +0100
Message-Id: <20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAARblGcC/y3MQQ6CMBCF4auQWVsyA8UIK+9hCGnLqF3QYouKI
 dzdCi6/l7x/gcjBcoQmWyDwy0brXQIdMjB35W4sbJ8MBRYVUlGJyY/WiJlG2fVTFKWuK6y14VK
 VkE5j4Kudt+Cl3R348UzdaR9h4BjV1m2yf5WwliQxl4jHE5IgkR6me7PTH+XPP1hncuMHaNf1C
 zjVeMC0AAAA
X-Change-ID: 20250125-topic-x1p4_dts-3b9509bce3a3
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737775883; l=1920;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=nHAa6+rhzIVq14iE10KQE5p5M0mnRnXUn1tLmXTmSdk=;
 b=tBeB11e5HhKgSjY7rEwh++eL5F089B+hv6/Ba3RS89nWuoek2723N/UidWaFKmE7/cSC679HZ
 NDNCV9SXrnuDdjJyB2JOq1UQF2r+wNrajVvDUCVHaKQhjqSlYyl7XH9
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

X1P42100 is a(n indirect) derivative of X1E80100 - the silicon is
actually different and it's not a fused down part.

Introduce the DTS bits required to support it by mostly reusing the
X1E SoC and CRD DTSIs. The most notable differences from our software
PoV are a different GPU (support for which will be added later), 4
less CPUs and some nuances in the PCIe hardware.

This series very strictly depends on the NOCSR PCIe PHY reset patches.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (6):
      dt-bindings: phy: qcom,qmp-pcie: Add X1P42100 PCIe Gen4x4 PHY
      dt-bindings: phy: qcom,qmp-pcie: Drop reset number constraints
      phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY
      arm64: dts: qcom: x1e80100: Wire up PCIe PHY NOCSR resets
      arm64: dts: qcom: Commonize X1 CRD DTSI
      arm64: dts: qcom: Add X1P42100 SoC and CRD

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |   26 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../dts/qcom/{x1e80100-crd.dts => x1-crd.dtsi}     |    7 -
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 1270 +-------------------
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   44 +-
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   17 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             |   81 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |   18 +
 9 files changed, 148 insertions(+), 1318 deletions(-)
---
base-commit: d7dfdec72fb32629d1affc32ff37a66a7fd1fb53
change-id: 20250125-topic-x1p4_dts-3b9509bce3a3
prerequisite-message-id: 20250121094140.4006801-1-quic_wenbyao@quicinc.com
prerequisite-patch-id: 719a1c1319a8f25be57f1e9bc68887684ff0d7cd
prerequisite-patch-id: 44ff71b8033fc91867a83a2f8f063fd0d9951d5e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


