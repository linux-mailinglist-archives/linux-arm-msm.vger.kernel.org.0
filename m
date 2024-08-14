Return-Path: <linux-arm-msm+bounces-28528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF724951FCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 18:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98BB41F21379
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 16:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17D0A1C4622;
	Wed, 14 Aug 2024 16:20:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBBCF1C3F22;
	Wed, 14 Aug 2024 16:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652431; cv=none; b=c2ALF65sSyRfS3mcjRIG4lbWXEEhksL3jc/gvvYtoBMOJesRLjTqVVEK9kLKNVhdc75R5c08kvNJhBntNRuBePq0kTPo1UfhRkLz4mZ/W8bAYZxeyzntL5Tjq5LDEa9mh8E6mNObEnO3CO7DG7lsQM87NzNX9jRU05xfogR0ibA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652431; c=relaxed/simple;
	bh=QmZQnfYTrkssDENkZeV/XZG6MA+NpkYRKIZCy7vT1iU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D1mWGb7Lqy5H/Qo3+q4Gtg9aCKTJreFPa5osrzxlAWwf26gzdhzX6LJQ7xJlF4Cb7WbVb3F5UdCbxvbsRwxpG2C3gQuacMgmlU44j8gvUjXArJibU9DcCTYnQxD5N03xwC0y4Q20tVQCgZgKZgK1IF/GszlNHkDfJa7FJIe287k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 06F6D20906;
	Wed, 14 Aug 2024 18:20:25 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id DBDB02099D;
	Wed, 14 Aug 2024 18:20:24 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Date: Wed, 14 Aug 2024 18:20:24 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: msm8998: Add disabled support for
 LPASS iommu for Q6
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-lpass-v1-3-a5bb8f9dfa8b@freebox.fr>
References: <20240814-lpass-v1-0-a5bb8f9dfa8b@freebox.fr>
In-Reply-To: <20240814-lpass-v1-0-a5bb8f9dfa8b@freebox.fr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0

From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Add support for the LPASS (Q6) SMMU and keep it disabled as this is
used only when the audio DSP is present and used, which is not
mandatory to have.

It is expected for board-specific device-trees to enable this node
if supported.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 111930c73ab8f..1537e42fa03ca 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1615,6 +1615,33 @@ gpucc: clock-controller@5065000 {
 				      "gpll0";
 		};
 
+		lpass_q6_smmu: iommu@5100000 {
+			compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
+			reg = <0x05100000 0x40000>;
+			clocks = <&gcc HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
+			clock-names = "iface";
+
+			#global-interrupts = <0>;
+			#iommu-cells = <1>;
+			interrupts =
+				<GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&gcc LPASS_ADSP_GDSC>;
+			status = "disabled";
+		};
+
 		remoteproc_slpi: remoteproc@5800000 {
 			compatible = "qcom,msm8998-slpi-pas";
 			reg = <0x05800000 0x4040>;

-- 
2.34.1


