Return-Path: <linux-arm-msm+bounces-26631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5E6937845
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 15:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0043B2155D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 13:17:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832331448C3;
	Fri, 19 Jul 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V1PoICdo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407FA13D53F;
	Fri, 19 Jul 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721395049; cv=none; b=r2AZ88DQMjhKPVMTRQritfPum9PH8miQNJ4N5w64lgN6gqD9ocN8+g3NbKl4pDZ3w+aLVRXhiU+qFZ9H/fgmFNBgI9fJaLMb1F9EX/TlT4pRYERH9EMAMJipm9dBZAyCmrVN9FGvRyJ3QRRQlWCD4rtPx8fDZtVV0LyvDWOTMh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721395049; c=relaxed/simple;
	bh=zBpjR/Cxt0PHaLcizd15DuclWPxULFRLAbv0OxnCwEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoiiRd3xmUe1zjlHVJO1fAoiarUDFcm4isZXrTrrR6CHJOcqFU0oNCdSniaQltX+TRvy+dbNOjAlHatU8s9nOsJ/kYfiOHGus6hp7KrdDYdyB0Q3Yy2MGv0wAP+kZe8UVTTJGytDiqU/Xo6B9zxcMq2qFH1YQc9nu2764tHmOL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V1PoICdo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9B8C4AF0A;
	Fri, 19 Jul 2024 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721395048;
	bh=zBpjR/Cxt0PHaLcizd15DuclWPxULFRLAbv0OxnCwEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V1PoICdouBuc7v2+kCp+r4l1bD257WsRkzNwBBKJmSSa25QWzJMnDChn4R5pssVbA
	 wspolb3rwyLWId8jh8qUycc+6qIlRTLZIFwS9quI4PZzrOJhkISrmB3Najw7l1WB2+
	 TBxJ4X/w+hM2+1br43Y7/tOlw18Uk8iz4BPWyrDK2es5XcdWu1tCPTCIsketrghj3b
	 JKb+wruAmGSg8nu5ZD0TL/KHu2ggmwRUpW7Yl/QZel9IjGcYHwuZ0IoNaH6glanxxE
	 k7gP2xzPE95Cne+rDSwNg5XIwTen9HQrkRL0YHblnef0sCj9HMRiBzqBEbcv3sY0dX
	 xByJl5Nh9En5w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sUnUO-000000002BE-2AT9;
	Fri, 19 Jul 2024 15:17:36 +0200
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
Subject: [PATCH 2/7] arm64: dts: qcom: x1e80100: fix PCIe domain numbers
Date: Fri, 19 Jul 2024 15:17:17 +0200
Message-ID: <20240719131722.8343-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240719131722.8343-1-johan+linaro@kernel.org>
References: <20240719131722.8343-1-johan+linaro@kernel.org>
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


