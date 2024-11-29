Return-Path: <linux-arm-msm+bounces-39639-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD129DED25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 23:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D42761638D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2024 22:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB981A725C;
	Fri, 29 Nov 2024 22:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1flsD/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBE51A4F09;
	Fri, 29 Nov 2024 22:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732918392; cv=none; b=fbGxyvNgvHIYgJ3mozshEt1zPB9YxAkKYVMy2eW4u1EfcuYNL6tb+wCj7aHswed7ARczHv5YmfB7VLn6654vzFlNvmyHH2mshBRr2gqCocEOD4GeL0aWkOl8N8M9ZFnYQHbmLbZwLva97TZwRqJJkjRJ3C0ZKm0PERaG7L2HHkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732918392; c=relaxed/simple;
	bh=jMK6epEz5EBY7sijolgFqoyp01hNxpOBbKNL9dshfg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pJ/MM8/KrQHZvdkn01Xw8bylE55hxBf+k04nMEPPPpRyES+eQBdZBan47ZLR9c5EBOSIYw6oOHOr1MUQYk4Cm/wXCeK+VUFbeqEjtVoTHT5/PqIwVliiRQQfXTVQNViuT7fj12NXTBWKDZHHZyD0qVjU1ZuHhmb+06C5TMOqX/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1flsD/2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4677C4CECF;
	Fri, 29 Nov 2024 22:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732918392;
	bh=jMK6epEz5EBY7sijolgFqoyp01hNxpOBbKNL9dshfg0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=g1flsD/2BzmJ+3o/dvKJ0PqX50PMTusC9gTvAIEjn0pWGOh7z8Aevt9ATTSwGyKBi
	 fiet0bI+VVixoIn4V8a5kWRA0/OrBKZU/RlVtTbg3OkRo3MJPw/YetDP8+tCAcPCGt
	 uA/nkdAJKRrACKrRiauc6VXI/pWsJgMK/BzpgRH3ooyaW6+Y+tM/2zHI68Y6un3KI0
	 h1q6iVTELpPtvzlV0dGYk4PiwRf730AlT6wWMqQe0YMRmt0cyr6Tbw9jS/QLPyw/rr
	 gXwLbLvzXtkhFOXHC37QPaw8ITpya78rJ9ujxVhEUcJx/Q0ZADojBItUEaSQ1tOzbs
	 2EgfE6S2Dxb0w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 29 Nov 2024 23:12:47 +0100
Subject: [PATCH RFT 3/4] arm64: dts: qcom: msm8996: Fix up USB3 interrupts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241129-topic-qcom_usb_dtb_fixup-v1-3-cba24120c058@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732918371; l=1317;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=MgNMkEjMNVsQXDCdVbGV7gJ6cNNdJLmEyymYhE0Z+7s=;
 b=JgrH1FomxoumLnG/GwbIyhv0UZTzruFH2EvRkgnZWsA0EbSOIavbhVtwjbzMfA3OoD5SMBX2V
 FVtN6fNb7rQD78wYenKLf3VgaEoL4nZDaH8erYPX/Mu7bF2lhaEGOlp
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add the missing interrupt lines and fix qusb2_phy being an impostor
of hs_phy_irq.

This happens to also fix warnings such as:

usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short

Fixes: 4753492de9df ("arm64: dts: qcom: msm8996: Add usb3 interrupts")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index b379623c1b8a0844c9de5255c4647fe3490bd2aa..4719e1fc70d2cb15a6a63d3e28622ae078a367ef 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3065,9 +3065,14 @@ usb3: usb@6af8800 {
 			#size-cells = <1>;
 			ranges;
 
-			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hs_phy_irq", "ss_phy_irq";
+			interrupt-names = "pwr_event",
+					  "qusb2_phy",
+					  "hs_phy_irq",
+					  "ss_phy_irq";
 
 			clocks = <&gcc GCC_SYS_NOC_USB3_AXI_CLK>,
 				 <&gcc GCC_USB30_MASTER_CLK>,

-- 
2.47.1


