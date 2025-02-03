Return-Path: <linux-arm-msm+bounces-46782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5679DA25D82
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6544F3B2738
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7234220ADE3;
	Mon,  3 Feb 2025 14:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZ6mUGf/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45557209689;
	Mon,  3 Feb 2025 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593810; cv=none; b=Ye9RnYw0Q+ULlJNKiemy3rXPrH53VbXrYDA3fgCBXqbluFzunztUBfYIM3s1fx2Y6NXss6QItwEUg1Mes6CIs2lBlXvpgczxDrq/nS15+Y04zJKkoAvgN08r5UyxlnQ3a+yf2p/dCtHKu1wKtVt5lXWZYWmMZyWk52Od5tgReMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593810; c=relaxed/simple;
	bh=qeocwwPQ5C2IAncuVyNvqD8hw5pRTw0+xfHPcXFs1Fo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uPNqFtAV6uE83ahxYtI9HfgoYS63hA9V9ad09lMIHDb7GeYOXuuWXlstKqsbnxVg0im6ehegXINZQNfzkXWnVExoDizydPZ6sZ0ZBt116Z5f7PVtsmYPRWwLeqodb87lWXOPckReDTfS9mKrU/8stqntpCyhK8rLMvgizFxl420=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZ6mUGf/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 887CAC4CED2;
	Mon,  3 Feb 2025 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738593809;
	bh=qeocwwPQ5C2IAncuVyNvqD8hw5pRTw0+xfHPcXFs1Fo=;
	h=From:Subject:Date:To:Cc:From;
	b=EZ6mUGf/ikBQDK2tWMhmKXhJQ5y9OFWZas7OSgQjZ7tcunuYFmeX2PDBDd/3mueJz
	 hD/GKwcW1o1lBchUgV8knMgY/M74jNE+k5meFOPMXgO3T4g/AzgI4OzdQv2h5+7yKB
	 d8wFBbeUIrWWrP1fp3M6SqWG0WkjPSAe0x8KQAjbZtLC3uwOMEdDBllsX+6d16hRAh
	 hBOVgFpaadfzxyg8ZW8w2OgByUu+PB3OY9k0L03F4DvbiKFjKY29+9oDQUpewVDUxR
	 olyhco9OhV+3QF0SJEA52A7e+x94/5xGPGqacnqF6aow9MrwXVRinBUHY0Pytkg1uQ
	 mR/vtWbvJS4Mw==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/6] X1P42100 DT and PCIe PHY bits
Date: Mon, 03 Feb 2025 15:43:19 +0100
Message-Id: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAfWoGcC/3XOQQ6CMBAF0KuQri2ZlpaIK+5hDCl11CbSYqcix
 nB3K6xd/kn+m/9hhNEhsUPxYREnRy74HOSuYPZm/BW5O+fMJEgNQmqewugsn8WounMiXvWNhqa
 3WJmK5dIY8eLmFTyethzx8cxu2o5sQCKzuvnNpgpolFBQKoB6D4ILnhu2e6Hv3ya0v+C8LW0Y2
 M+8OUohvtfNk1jRf/MmwYGDrHVjYN+DUm0gKh9Pc8/YsInLsnwB6DajOgcBAAA=
X-Change-ID: 20250125-topic-x1p4_dts-3b9509bce3a3
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738593805; l=2201;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=qeocwwPQ5C2IAncuVyNvqD8hw5pRTw0+xfHPcXFs1Fo=;
 b=kJumrNR4zm4z+AtZTE9nm30T1JkuijLsJAKHRh5QX3iyDydnGCglXhGBM3ipLePNTKJVOJBOQ
 lysZRrbHsCqCFEF/JGw46THXwJ40adSrHnEEv65nh0hGc4G0OXzbfOw
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
Changes in v2:
- pick up tags (added Jens's t-b where it made sense)
- don't add & instantly delete a line in patches 2->3
- make patch 2 do what its commit message says
- Link to v1: https://lore.kernel.org/r/20250125-topic-x1p4_dts-v1-0-02659a08b044@oss.qualcomm.com

---
Konrad Dybcio (6):
      dt-bindings: phy: qcom,qmp-pcie: Add X1P42100 PCIe Gen4x4 PHY
      dt-bindings: phy: qcom,qmp-pcie: Drop reset number constraints
      phy: qcom: qmp-pcie: Add X1P42100 Gen4x4 PHY
      arm64: dts: qcom: x1e80100: Wire up PCIe PHY NOCSR resets
      arm64: dts: qcom: Commonize X1 CRD DTSI
      arm64: dts: qcom: Add X1P42100 SoC and CRD

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |    9 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../dts/qcom/{x1e80100-crd.dts => x1-crd.dtsi}     |    7 -
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 1270 +-------------------
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   44 +-
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   17 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             |   81 ++
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           |   18 +
 9 files changed, 148 insertions(+), 1301 deletions(-)
---
base-commit: e2ed2f6a484c2779f1f4fa873cd67f8baa10fc9c
change-id: 20250125-topic-x1p4_dts-3b9509bce3a3
prerequisite-message-id: 20250121094140.4006801-1-quic_wenbyao@quicinc.com
prerequisite-patch-id: 719a1c1319a8f25be57f1e9bc68887684ff0d7cd
prerequisite-patch-id: 44ff71b8033fc91867a83a2f8f063fd0d9951d5e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


