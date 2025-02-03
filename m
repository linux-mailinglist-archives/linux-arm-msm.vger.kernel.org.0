Return-Path: <linux-arm-msm+bounces-46786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE39A25D71
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1060416BF7F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 14:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A21620E6FC;
	Mon,  3 Feb 2025 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jf5e8gaV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F44D2080E7;
	Mon,  3 Feb 2025 14:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738593829; cv=none; b=ddPqkDzq0QVMKxF8FzipjGpSFZso4tEY0P4jFk79M3c1lWZsjfXXtG+LFHsVPwMCfk5CjKaZHAQp7wlVb+G04YLHVmRvnIiq6KhRiy1PjiAQo2NVC8Xh902n7TZSCP4qnKNO6YkMX2xfXqW68Z6wziPzI0U98V2ob6W61Oi2NCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738593829; c=relaxed/simple;
	bh=UHYEfUn2qhmIXT18tYacKBPDofusSIz5M5HE7dAuWYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlRNZqrF06PFVeLYuGPmNaAjXPreATEv3oZM7Ssdg4pCWXCwIiM7aX2WAb8v7OBVsuV3rWeLjveokZiDANq1+IzEr8otL3zJ0EeIV2nULpHNibrkM2uXJYzghhC3TuQuoy4kMnRR8h+3NkV3nyzf43hWsfzDPRg/FkastU+CcAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jf5e8gaV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 789E9C4CEE0;
	Mon,  3 Feb 2025 14:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738593828;
	bh=UHYEfUn2qhmIXT18tYacKBPDofusSIz5M5HE7dAuWYY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jf5e8gaVTVs6LEwHHEKTUUuzVmA6lKbbJK+sR/+R9HRN6CmCLepeNg3J4c+EBLUj5
	 AbXTc++Ofl5Cm+AjryT8OF25y6cd0DHbEF5YZgjRvNGQCTw7ZGHcVYhzYWEbngz007
	 BjWF7zbY+svUsnVFhSw5ZBX2X67IdRnZC3WjKSAXGPqvL/opddoFrtNZjaXAc1u4BD
	 FUWIpGqlN7ECGC/jGqNHGzvpsQPavg5K0iqSwgZdQrZAaMPUjtDn3ADaSrNuwm2dxA
	 Wekqaom987nyjfXK13xEPZWllRDuuR/owb3zqxsxYbd32/IGZLXEyWjZPNNSxNIBcd
	 Jjm4zn7dLPsIw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 03 Feb 2025 15:43:23 +0100
Subject: [PATCH v2 4/6] arm64: dts: qcom: x1e80100: Wire up PCIe PHY NOCSR
 resets
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-x1p4_dts-v2-4-72cd4cdc767b@oss.qualcomm.com>
References: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
In-Reply-To: <20250203-topic-x1p4_dts-v2-0-72cd4cdc767b@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738593805; l=1565;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=J3M8FRjRLnkmaJdQ5qdzAR5tqB/PHYVIRwtTFuq9kkA=;
 b=gIITl1WzVXDqoxOQByahHKG/DcaRtgfr4KndYBfPbExOlgsxu1UIJKa+eMwjt58y43wUFgTZB
 lVMpYpIs8oSBOsf8CqTyhPCt/3anl27nhug0ZAllG+mnsFuFb5S/CHU
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Asserting the NOCSR reset line keeps the PHY registers in tact.
This allows us to avoid programming long tables of magic values in the
operating system.

Wire up these resets to PCIe PHY4 and 5 (it's there on the others).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 9d38436763432892ceef95daf0335d4cf446357c..a244cbb84aecc23ce11414c41f2e5d0905f455ee 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3558,8 +3558,10 @@ pcie5_phy: phy@1c06000 {
 				      "pipe",
 				      "pipediv2";
 
-			resets = <&gcc GCC_PCIE_5_PHY_BCR>;
-			reset-names = "phy";
+			resets = <&gcc GCC_PCIE_5_PHY_BCR>,
+				 <&gcc GCC_PCIE_5_NOCSR_COM_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_nocsr";
 
 			assigned-clocks = <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>;
 			assigned-clock-rates = <100000000>;
@@ -3692,8 +3694,10 @@ pcie4_phy: phy@1c0e000 {
 				      "pipe",
 				      "pipediv2";
 
-			resets = <&gcc GCC_PCIE_4_PHY_BCR>;
-			reset-names = "phy";
+			resets = <&gcc GCC_PCIE_4_PHY_BCR>,
+				 <&gcc GCC_PCIE_4_NOCSR_COM_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_nocsr";
 
 			assigned-clocks = <&gcc GCC_PCIE_4_PHY_RCHNG_CLK>;
 			assigned-clock-rates = <100000000>;

-- 
2.48.1


