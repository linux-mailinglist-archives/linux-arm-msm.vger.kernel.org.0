Return-Path: <linux-arm-msm+bounces-31805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C1F979CB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 10:24:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFE7EB22643
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 08:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6960813DDDD;
	Mon, 16 Sep 2024 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUgM59wJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC104E1CA;
	Mon, 16 Sep 2024 08:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726475072; cv=none; b=ddRFVPB3D416XqqyqEsY1F2UAvTWaxnehiKx4hHieBTuw6a1Yaejysa2GKC0B2baMHCspx5sLVDfwr6kxT16yUUY3p9AZsGtHkEleTgu9SXYHoC+0jEJiw55MlQnNoHbfeBwgb6uDu2eIOBoxbLM0rdXAdlD+KJoLJqy4MwnGHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726475072; c=relaxed/simple;
	bh=Wf9INyT23C7eoSKjjaTEvngtr5T3HeKJz+9JAevCrC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kWU6FrpOEXGNU3ZZYEPUhZ5PgHLxPFqWRuktdyT4L61rYnbaUEWuwNVXQVWL2y3e86h3PKxh88o559m8A3fGNKzmnzYkkttff5i7R35qjXA3CTLL6oJXcFQqPkhdLFvpJn2i36NlTOg8ARN7+CbGgpAT9ImX5wIC3f6Akj5O2b4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUgM59wJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC69C4CEC4;
	Mon, 16 Sep 2024 08:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726475071;
	bh=Wf9INyT23C7eoSKjjaTEvngtr5T3HeKJz+9JAevCrC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OUgM59wJasBz3eLuDLU6O0zMzVv5u1WHPn39kX09el4fFG24DLDi+RqczjlRUYD5x
	 LEKSF/VguDsYKBOc8eZBi0OlqJE7N1Ffp2Qh2Q7R0G8Oth6Gk+dAfj02vBVpBghYF9
	 lLDlr7nv5Zcj3imZjSI2fuTGjAq0pMwZUd5R20sDgWNoJO4eMwovoa6/5pZvoN1yck
	 mIpJzESdvC/q3oL5RI0MU6LmTF09K8zDWxpcEWi6kAmahF6SA1qvb/3nNgYQ8qFY9l
	 kgtqV1U9zAhOSAuNSBO6KBCR3GOhqxHdEHD+XIX6wOzMSulOyO4xyrarbckNG1x8f5
	 zQPdl5M8Mr4Ew==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sq72P-000000007hI-2aFR;
	Mon, 16 Sep 2024 10:24:49 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: x1e80100: fix PCIe4 and PCIe6a PHY clocks
Date: Mon, 16 Sep 2024 10:23:06 +0200
Message-ID: <20240916082307.29393-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240916082307.29393-1-johan+linaro@kernel.org>
References: <20240916082307.29393-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing clkref enable and pipediv2 clocks to the PCIe4 and
PCIe6a PHYs.

Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
Cc: stable@vger.kernel.org	# 6.9
Cc: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 0cf4f3c12428..53e7d1e603cb 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2980,14 +2980,16 @@ pcie6a_phy: phy@1bfc000 {
 
 			clocks = <&gcc GCC_PCIE_6A_PHY_AUX_CLK>,
 				 <&gcc GCC_PCIE_6A_CFG_AHB_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&tcsr TCSR_PCIE_4L_CLKREF_EN>,
 				 <&gcc GCC_PCIE_6A_PHY_RCHNG_CLK>,
-				 <&gcc GCC_PCIE_6A_PIPE_CLK>;
+				 <&gcc GCC_PCIE_6A_PIPE_CLK>,
+				 <&gcc GCC_PCIE_6A_PIPEDIV2_CLK>;
 			clock-names = "aux",
 				      "cfg_ahb",
 				      "ref",
 				      "rchng",
-				      "pipe";
+				      "pipe",
+				      "pipediv2";
 
 			resets = <&gcc GCC_PCIE_6A_PHY_BCR>,
 				 <&gcc GCC_PCIE_6A_NOCSR_COM_PHY_BCR>;
@@ -3232,14 +3234,16 @@ pcie4_phy: phy@1c0e000 {
 
 			clocks = <&gcc GCC_PCIE_4_AUX_CLK>,
 				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
-				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&tcsr TCSR_PCIE_2L_4_CLKREF_EN>,
 				 <&gcc GCC_PCIE_4_PHY_RCHNG_CLK>,
-				 <&gcc GCC_PCIE_4_PIPE_CLK>;
+				 <&gcc GCC_PCIE_4_PIPE_CLK>,
+				 <&gcc GCC_PCIE_4_PIPEDIV2_CLK>;
 			clock-names = "aux",
 				      "cfg_ahb",
 				      "ref",
 				      "rchng",
-				      "pipe";
+				      "pipe",
+				      "pipediv2";
 
 			resets = <&gcc GCC_PCIE_4_PHY_BCR>;
 			reset-names = "phy";
-- 
2.44.2


