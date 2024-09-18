Return-Path: <linux-arm-msm+bounces-31985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF40297C21B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 01:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8572D1F22971
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 23:00:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2131CCEC7;
	Wed, 18 Sep 2024 22:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pl+/Wge8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034781CCEC4;
	Wed, 18 Sep 2024 22:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726700306; cv=none; b=owz5+SpLaE2euRZM/w0FtBfO6M2Dg1FsepMmun2UxPIMKsAdYNkcnY8VJ1NS2AWy0y3B7aWj5nP2k5yBkO1RMWJuwvjqOwCcQYFkaQRBAY6g9yD0rkpM4JoR6KtcVOfjgqdI6dySFC9XjrDYRJ0G4++oyRrRfnhQoG5ubxl5eEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726700306; c=relaxed/simple;
	bh=ZcAFn2XSRIW73riEtufmOHMyBIaaTuxA2BmJWLS6aMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWWednfCDZRnCqDEYAVdi3xwXYC4RpjX+yrttylpiujJPG4yeTKEJSpg6+fR/DwKjSkHQf9V5BsQIZwgDSmYEjImfrNKRDpa71DAVtZQwfaKBFBu1h0XpHdSvJUBZNRVNXmt7LeBTDU7AQdlmcKnE6zINqUV1Ta8Hc2Lo2JdCRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pl+/Wge8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8CBC4CEC2;
	Wed, 18 Sep 2024 22:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726700305;
	bh=ZcAFn2XSRIW73riEtufmOHMyBIaaTuxA2BmJWLS6aMA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pl+/Wge8stfTkbXUv7jeJ7MYCicj7dHcskhgSmrrETEsPvzBM4iNPWShsbcm4+sJf
	 7FZquLMwQ/jjco8GV4Rz4YS39ZySNd3UttxN682eFaebEwxODWSG8GlFWlb8rLp3gZ
	 Iy8QQTIIMk0N+JJ8OqPndLnmQcAgUtsanW4QsCznFBBMdor29TK0XRoxFd2kEQgs+y
	 95He8oUUdujdcgiWIfYIhf6ZSj8Ul25weS60B1FOGiPg79tJ3e1GgSwmT1fi8aUvtp
	 eUtGXZH3sDUCnaB65RgVLtJn7LY4imUI6KV0rabpDwzNlnL2nydjbwYVBcWECtCLjy
	 jKgdi0PiVq0PQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 19 Sep 2024 00:57:23 +0200
Subject: [PATCH RFC 10/11] arm64: dts: qcom: sm8450: Affirm IDR0.CCTW on
 apps_smmu
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240919-topic-apps_smmu_coherent-v1-10-5b3a8662403d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726700267; l=999;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=7lG88rwMoxIAeoJSLU9mOYtSapn72lOPZLltuZ/GUsY=;
 b=Q1yrT3u0v4bzdrFXFTSFStWb/zZ0SBZaFefbJ1Dtf6FP5qbqRUEKLdsaMPMcp2KTVZ24Z/Nfz
 BW/A4nD0r2TB0LmuNDTURwj5rOiToeQN6tUQyMIr4514eLMqcmadg2o
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
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 9bafb3b350ff627277514be83910b72a283c1935..a22112cb4bb5ba2f20e45f8136d9ec2d75dd7571 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4257,6 +4257,7 @@ apps_smmu: iommu@15000000 {
 				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>;
+			dma-coherent;
 		};
 
 		intc: interrupt-controller@17100000 {

-- 
2.46.1


