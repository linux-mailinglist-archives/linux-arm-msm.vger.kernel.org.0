Return-Path: <linux-arm-msm+bounces-59153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B8AAC1792
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A72C250761A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 139102D3216;
	Thu, 22 May 2025 23:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1IKEPY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAD12D3212;
	Thu, 22 May 2025 23:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955947; cv=none; b=jqleKWVxaGofVyZDbvNM7KA3+v7a4SQtzJFVGwP2bXq5y42dtShq4Djp5OZcOXJJ+PYLMVFwgKbdrcp9aVmu2lQCvp91WaSGskMNprmY5bfzT8Pcs46VB7cFwuN6Gq7LT/Xzx1cT3B23fsey9lYZbnZvn29oQ7FGl5ipxt+nykQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955947; c=relaxed/simple;
	bh=06UkQVjhVRHi/0uZ5JsqtS/MqpXw9ER/Vy71bt1OaC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pl3vOQ2A32fl+m8siGgtm93NtpsAi4xYKUwHifZnZEV+pu9nOsv0ue9GhCmhiIAbM4hk2JQiMV3d8G7FFHBYk3rNYvMpiu/AmTiCi/5KaUfOS32uPhRU+84FCKV87HNAgwNjKpFWfJO1qg/M94HxCBLuft146BnMRmQ1c87ldPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1IKEPY1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6505C4CEEB;
	Thu, 22 May 2025 23:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955946;
	bh=06UkQVjhVRHi/0uZ5JsqtS/MqpXw9ER/Vy71bt1OaC4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S1IKEPY1SmexC0LIuGTvUC7XDA6n12batXlKNR52FCO+KpYEPpCeRjDztW43w9znf
	 nDsz+hB/3Y3nHVObbgIoSOnUSwHugTuUKDQu5xKjgh2yT0A5Y+/K+c/5+UGHBehbsm
	 vXy7sC7QUZdCBv26hzjQE2oDJi+SNb3hkQ6cZwi4xtlvDlSINGEHwBWsMTnwLqo3eZ
	 9RgiNDxcHMZ4WYIPOJaWjM58/tFZiT2003QEtPG9NqpITQTUxsSgocuKR5+lPNMMI9
	 oRdCm072yoCIB1cnf0WAfBnY3d1Oj35q+RtJ4vtekCwCxhxaWDYMlo8Vgn2qN0m6Te
	 xy294ZyxZ3eHQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 23 May 2025 01:18:22 +0200
Subject: [PATCH 07/10] arm64: dts: qcom: sm6350: Explicitly describe the
 IPA IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-topic-ipa_mem_dts-v1-7-f7aa94fac1ab@oss.qualcomm.com>
References: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
In-Reply-To: <20250523-topic-ipa_mem_dts-v1-0-f7aa94fac1ab@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955915; l=1313;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Vp22pzZPWpKCxKqSl8loqdlr6xYcYSBJMGuJq/JxmGs=;
 b=LU17V+JBem84o6r4uzk2Q0/XOgHSXkFtm3NGjnbw2ru0G6B7AnNv1ZZn29nVPJl8SYYbTLDCz
 Vp1sMIbWVa2DC2Shb8piip3fpsndCuRkbLF9dsHa/HrsNjWqMKzrN5A
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As part of stepping away from crazy hardcoding in the driver, move
define the slice explicitly and pass it to the IPA node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index f80b21d28a929619fc91b4e9d659acce40a0957b..257bda19060936f4cb7c1f7aa9b481e77545f395 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1273,6 +1273,8 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
 		};
 
@@ -2603,6 +2605,20 @@ qup_uart1_tx: qup-uart1-tx-default-state {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,sm6350-imem", "syscon", "simple-mfd";
+			reg = <0 0x14680000 0 0x2e000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0 0x14680000 0x2e000>;
+
+			ipa_modem_tables: modem-tables@28000 {
+				reg = <0x28000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm6350-smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.49.0


