Return-Path: <linux-arm-msm+bounces-39640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 061829DED2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 23:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7967AB21F5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 22:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDCA1AAE05;
	Fri, 29 Nov 2024 22:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dv/4ynHx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACFB1A76B4;
	Fri, 29 Nov 2024 22:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732918397; cv=none; b=lqqvF2HqeUbcvmxsltUxTEctFu0KRTlyIi1JshFyiK8CGG3BNZuXA3eS8Cn/SzPEKF9eyHLaOf05nGundoQtohpGue8dXTeGOvX33jBfjKS/R0wAfdo/AEUysk++hBtfVGJVpXmsp9WrzuTPvvJAJRwcUkD1ZVtAy1hQElMFY3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732918397; c=relaxed/simple;
	bh=iZuHh0qmlhp7nBKTZhAq4K1DmkSeYSGdGSXOMOcypds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lepooe5/7d6Dym0ikbDLbCgCniXjr69BNnFWXZYvth5fRhPMMMk/wooJ6Z77rJDH3eWHloSkfhyPVSEGAZBa0gomWg8vSD68kBpxLWrYP4+HFwc7Pz+Jq/YJpqlud3AAzXmfN6HSnIKbQ3zDA/zVtoeD2XRDnKcAtsqI0tkL+p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dv/4ynHx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B40C4CED2;
	Fri, 29 Nov 2024 22:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732918397;
	bh=iZuHh0qmlhp7nBKTZhAq4K1DmkSeYSGdGSXOMOcypds=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dv/4ynHxDSfiQ5KuDrGG30WJD572vSjD2T0ETqvX9R8doeqa1dxuo7C8qEFzujIxw
	 5QPJfYusOh1syFqp5mzODiplJ3aGQ6vpx8fQBYnFIA/E4t7XY7MrPKWUvi2AO0XBg9
	 TKKAnRsrFefTHRXXwEbrsFxqI63GpziwM4U+dkNceuHR/wb3YvlD0uOKpmUZnfIATh
	 nJJBcQdSmbvgvr05bhkNsEkTrbbXWjg4CBfHTlYC6plW1bzeEF1OWJNr5FJ2Lr2qIT
	 YHrNlT/e+x3xar7p6Of+8fUAhW2JAk4LCnJCsvOad5scJIqGec2oBhi4ETaXNGdO3N
	 QlNloVog45yew==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 29 Nov 2024 23:12:48 +0100
Subject: [PATCH RFT 4/4] arm64: dts: qcom: msm8994: Describe USB interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-topic-qcom_usb_dtb_fixup-v1-4-cba24120c058@oss.qualcomm.com>
References: <20241129-topic-qcom_usb_dtb_fixup-v1-0-cba24120c058@oss.qualcomm.com>
In-Reply-To: <20241129-topic-qcom_usb_dtb_fixup-v1-0-cba24120c058@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@gmail.com>, Petr Vorel <pvorel@suse.cz>, 
 =?utf-8?q?Kry=C5=A1tof_=C4=8Cern=C3=BD?= <cleverline1mc@gmail.com>, 
 Alexander Reimelt <alexander.reimelt@posteo.de>, 
 Dominik Kobinski <dominikkobinski314@gmail.com>, 
 Harry Austen <hpausten@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732918371; l=1083;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ggFSofStu2hb+odSjXYHGLmfWkGwq+R+HVQUq3UcrLk=;
 b=jlnIYIkCI7glVYcqtTe96QHdKjj5Zxt8uG4lLGzDCilPAYriqS7pNBHeJ58VO67ev+ngi3Xeq
 M4Dt80+LTDNCtwuXjlKN2Mndmr2Z+S8iVszpBVjSFdeKgKLPA+Wjq3F
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Previously the interrupt lanes were not described, fix that.

Fixes: d9be0bc95f25 ("arm64: dts: qcom: msm8994: Add USB support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index 1acb0f159511996db07bc7543cf4f194a4ebd0fa..8c0b1e3a99a767e7c28bcaf3b9687501cc15cd58 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -437,6 +437,15 @@ usb3: usb@f92f8800 {
 			#size-cells = <1>;
 			ranges;
 
+			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
+
 			clocks = <&gcc GCC_USB30_MASTER_CLK>,
 				 <&gcc GCC_SYS_NOC_USB3_AXI_CLK>,
 				 <&gcc GCC_USB30_SLEEP_CLK>,

-- 
2.47.1


