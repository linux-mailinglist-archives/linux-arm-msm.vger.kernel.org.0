Return-Path: <linux-arm-msm+bounces-31978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F897C205
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 00:58:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 100C11C213B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 22:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9671CBE8D;
	Wed, 18 Sep 2024 22:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UdeHZIn5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65A1CBE8C;
	Wed, 18 Sep 2024 22:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700282; cv=none; b=Uc2M3dwzwLn3dca8CMwYD3KfLyLne6MSY1bMv8Cocln/jO/15mkpgPlhnkjDtF14ymdA8tudA/LjQ7ywhxOgjh7RM1tl3586l9sIvVc8/xeJOmY1rQb0TgrEcoEaA9RC909F9qRt95eWncoJy8ZedS7dsuZCgnG9BWdibzs/IB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700282; c=relaxed/simple;
	bh=RxoVMorh+hK91OedQ3oJtU04SwGPUyhRyw7jRuHQqKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ODgm/hkO3d1tOkj+OwkQdlT1cXMUsz76BIrbuZkM4889goDmQpgPE60g7K+zkCTl9ueMAa1pShKFzBEIVy6c73vWW2kR3aGLZfs8Mymk3iGkJBvflyeqmBP5fSTPSdOBcEFcNlzQNfA5w5Plx/8/cnLfbnhz+8ec/gGCXx4VeJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UdeHZIn5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512EBC4CEC3;
	Wed, 18 Sep 2024 22:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726700281;
	bh=RxoVMorh+hK91OedQ3oJtU04SwGPUyhRyw7jRuHQqKQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UdeHZIn5om9zcpLGa1kawQoowfgE+DNwuRPuNxxfDdmQP4oAkaiQkRH56UmKCK8qS
	 LG1YwD3UxuOq+nQtMblSYjZJ1YjZvjvN7fWxTo/RBOP62QbnaL1pFU0hCZiKCPiYPu
	 1YEF8xISljWIeTfICJ9VSYanOA66u4uP1qLcDzvzHTok3BF/0Jv/B+pOyIle5DwnXt
	 Wtkv7XgWC8DpcHTbF+RhbKCe+V9GKuDLYWIJYW4F70YuBT7VGLOr0eXvctqzy8Fpo9
	 2InSNlDD2MthJAoH6IgjYVyUy3TFtASqKbG6/3i3MOARKCvwdHzhj7CnY7SYbIRCz8
	 lSxFPgMbgquTA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Sep 2024 00:57:16 +0200
Subject: [PATCH RFC 03/11] arm64: dts: qcom: sc8180x: Affirm IDR0.CCTW on
 apps_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-topic-apps_smmu_coherent-v1-3-5b3a8662403d@quicinc.com>
References: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com>
In-Reply-To: <20240919-topic-apps_smmu_coherent-v1-0-5b3a8662403d@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726700267; l=1024;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=nZa/xUmq3r52HYMY7fxYqAZh4cZqvM5bkwdh/Dv0esI=;
 b=x74CW9FDZ7H/Frno3aNJqG3Y37LNH9IC5pnp4Qw5Tp+iStzd7Eok5hHkR0zPHcOmX3LUmiwPH
 giQlaM8Og/8DISBBroxypKNW59frB7w5Yi/Wn81Y15fBlI0NM4+BQoq
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

On RPMh-based SoCs, the APPS SMMU advertizes support for cache-coherent
pagetable walk via the IDR0 register. This however is not respected by
the arm-smmu driver unless dma-coherent is set.

Mark the node as dma-coherent to ensure this (and other) implementations
take this coherency into account.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
index 0e9429684dd97bc2d93185815b29e9db0fad892b..e80e0d3b77329836ec3c97e707c5659b9ad83325 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
@@ -3662,7 +3662,7 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 775 IRQ_TYPE_LEVEL_HIGH>;
-
+			dma-coherent;
 		};
 
 		remoteproc_adsp: remoteproc@17300000 {

-- 
2.46.1


