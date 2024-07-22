Return-Path: <linux-arm-msm+bounces-26744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62240938C3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 11:45:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EE4C1C213A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19BFC16D9A9;
	Mon, 22 Jul 2024 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j2hYAFdp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEBE16D4EF;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721641425; cv=none; b=snSSY8i+DU5MrIxZ1Na+MI7U6CTjoWjz0lfe6xQs3lWmnuxpw2drmClcrI2VF3Bv4uXOiNMgGNyyZhQ1tiylixTfXyx/R9I7t8JcG4aoOrcUxGh9YrQt3lMNkgVnMdGrgAsw6D50dcbvw2Sm3cD48rwlmZslFzarMvhWwy2+9wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721641425; c=relaxed/simple;
	bh=rbCdFrpUVOqWgTpBFACmBQDW9GDjMmTwAnryiL78IxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iRTOiBByxoEzt10eunpBxNOL3EnPvhh8Oa0X2VFsyP2IzQi5il4oFK6kpGhweIu1uDHZEk24GtUPq2zuwY38J56c4KOBY77tMNHkZiRVDA2T3S6D9LjvxXxN4vcPX6s0kuipuu1Zizs41g3dpqejCiayqDju29i/Q/SYXGjr6DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j2hYAFdp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76091C116B1;
	Mon, 22 Jul 2024 09:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721641425;
	bh=rbCdFrpUVOqWgTpBFACmBQDW9GDjMmTwAnryiL78IxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j2hYAFdpX9JxPaj6t/4uWqzvhaGEWcTJ0PKcBrKqk/BetW9RzR7lgRbqRLPWyo8+t
	 C2m3nfQv7Dl/GKBFeAl1KyQuX54ba9VqXgaA7oSyED+pxxRcgquVTT3Wf1SlNAoovC
	 UgQHhZ35AHq6tAdqPfoBFkvdkkqvtyQvvtdYNLoHqwVzeEJ/oXAIQVySO26CmG5qpC
	 oP73wtdCdFWedHwf17pb7bdig4kvvs09UwyhhmGlvqO4jhl/L1LDY1E3sd6y+tyYUg
	 rBnKhIt07EHRGHY7OaNzqhjELL5/wRfy/E4veqMymm6OHd5aMXHeaXKvaVID19xfVT
	 zqUMBUT8Jb3kg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sVpa4-000000006uH-1cIK;
	Mon, 22 Jul 2024 11:43:44 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/8] arm64: dts: qcom: x1e80100: fix PCIe domain numbers
Date: Mon, 22 Jul 2024 11:42:43 +0200
Message-ID: <20240722094249.26471-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240722094249.26471-1-johan+linaro@kernel.org>
References: <20240722094249.26471-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current PCIe domain numbers are off by one and do not match the
numbers that the UEFI firmware (and Windows) uses.

Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
Cc: stable@vger.kernel.org	# 6.9
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index c7aec564a318..07e00f1d1768 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2916,7 +2916,7 @@ pcie6a: pci@1bf8000 {
 
 			dma-coherent;
 
-			linux,pci-domain = <7>;
+			linux,pci-domain = <6>;
 			num-lanes = <2>;
 
 			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
@@ -3037,7 +3037,7 @@ pcie4: pci@1c08000 {
 
 			dma-coherent;
 
-			linux,pci-domain = <5>;
+			linux,pci-domain = <4>;
 			num-lanes = <2>;
 
 			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.44.2


