Return-Path: <linux-arm-msm+bounces-66355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B00B0FBC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 234C8565A0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 20:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E4823BD1A;
	Wed, 23 Jul 2025 20:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djZqBtod"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555C11DE2DE;
	Wed, 23 Jul 2025 20:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753303140; cv=none; b=Yg1SpOTanY3kmYcoGXSfvAAsB1Mu0o0YqUjiZbD6pUBcRa8wOvoQ2kOZHeJ+Ova8zsDmpALU4GUgIs7pZdw4hJm3btQbD2qD2zcztE5UOufcnohvQdhKQ+6iaNsqg1JGlxDAx3kx0UTe6FaaMsUnYSs3hwYsa7NlxDTw9iIBiIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753303140; c=relaxed/simple;
	bh=53iMllV/QMtR2Pz6h6pQ/XW3ZnbjJ2SxLIO1nHjBr5o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gfA54lsVz1PCm7EPoaAoJ8vAyNVlrDCSzGXi6BdZu3UKMyiWRY8RV4l2EMueFncCemT4H0MzlMBRcSxHLrXueKQVX0DGy4XoN/CauA141H0is57zJSU+UscIrZhm0efouuPl8ZXHoUsdl0cLJzW2FJqAHQWzVpDSk2lR3t5I+6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djZqBtod; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D7BC4CEE7;
	Wed, 23 Jul 2025 20:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753303139;
	bh=53iMllV/QMtR2Pz6h6pQ/XW3ZnbjJ2SxLIO1nHjBr5o=;
	h=From:Subject:Date:To:Cc:From;
	b=djZqBtodvFgywZUYqeix7oD77SVKjKXsm3QywmGf9OyDzrFv6WZTAQAnHAordDRqE
	 FWwNhi4+hzeCnVMW4jpM7j0hpN674zBqShLviyFD5aPJsmaz6QcJ3z668difzDG7GJ
	 eJofQDZgybNecu4Yi5t8gxr8dxBdzlHWfJVKzAqWXxa6myfcTNB1WE1rvG0RLQ8smt
	 yJNL1RVjTIFA6OyCkLepu7h6rvrvIQ1RULNXuGs+KY3SyzTf7/a+y87/4TN7e02zZ4
	 aFne0lcj1se6SD3KKSjCLsynnd9FNEupsLysCZHRSRsriXYTSujD2arSoYV/h+2KBH
	 sZ5tNboxAY3Vw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/3] SM8750 GPU clocks
Date: Wed, 23 Jul 2025 22:38:47 +0200
Message-Id: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdIgWgC/32NQQqDMBREryJ/3UhMjQld9R5Fik2++qGaNFFpk
 dy9qQfoZuANzJsdIgbCCJdih4AbRXJzBnEqwIzdPCAjmxkEF5IrrtniPBmmleT3wa/GMIGNttg
 /hLJnyDMfsKf3oby1mUeKiwuf42Grfu0f2VYxznRjdNNJXttaXV2M5WvtnsZNU5kD2pTSF2H2d
 LO3AAAA
X-Change-ID: 20250708-topic-8750_gpucc-2e68defb27d3
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753303136; l=1345;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=53iMllV/QMtR2Pz6h6pQ/XW3ZnbjJ2SxLIO1nHjBr5o=;
 b=C+q3jN9k8nHgP1TIffskP0Vur6QDfx12IpRagkT3acNFPG0HPygmy/1t3GUeRNXfUFHSA0UXH
 QaziLnOlEKTDZqYuKIu5nhTZa/aJ9t/b2H2DXP4kQCdK6zuqDf+8jCk
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This series brings a driver for GPU clock controllers (there are two
now, but that's almost a cosmetic change) on 8750 and wires up the GPU
SMMU instance.

No external dependencies to the best of my knowledge.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v2:
- gxcc bindings: remove double colon & list the names for power-domains
- Link to v1: https://lore.kernel.org/r/20250708-topic-8750_gpucc-v1-0-86c86a504d47@oss.qualcomm.com

---
Konrad Dybcio (3):
      dt-bindings: clock: qcom: Add SM8750 GPU clocks
      clk: qcom: Add a driver for SM8750 GPU clocks
      arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes

 .../bindings/clock/qcom,sm8450-gpucc.yaml          |   5 +
 .../bindings/clock/qcom,sm8750-gxcc.yaml           |  61 +++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  63 +++
 drivers/clk/qcom/Kconfig                           |   9 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-sm8750.c                    | 524 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8750-gpucc.h      |  53 +++
 7 files changed, 716 insertions(+)
---
base-commit: 0be23810e32e6d0a17df7c0ebad895ba2c210fc4
change-id: 20250708-topic-8750_gpucc-2e68defb27d3

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


