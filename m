Return-Path: <linux-arm-msm+bounces-59156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC8CAC179B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 621321C046F1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B6D2D3A72;
	Thu, 22 May 2025 23:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t4xxBfse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0532D190E;
	Thu, 22 May 2025 23:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955958; cv=none; b=UhxuYr71FxPvO3+KL4wZF9a+uyMusVmk/SVFNhOi9Rn3YzXcJBe7i2ZeWPd5BVonJ3izvIiXCUqWtAkIOoIg7NdE+s5l9fDGUXK62JUhmwnrdpPrmUkap5G3Nzc10VT0yaQoa5b0nCyMozJhx1sTLitVXp9stbA0dT1X7BibT4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955958; c=relaxed/simple;
	bh=OB1VuDaJBkdgJNI4JrASaAj7S+zM8SqIbsYk5Ni8T70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b2xmhNo2dBEEYaTlSW4YUKZ7Xi0PiU2XxoOI4l2CdkqttVcPfEyR56cxaymcrQEsyvdc38BhD3WqKqqiSMqefG6M0zSNdGDPab7fwbJYrDPpWPdtI9Urn7fN+H6vf+DWIQgSzH6tddou0BjX617VoHFgpKFhrX4JK9cWlgjNtu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t4xxBfse; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FD6C4CEE4;
	Thu, 22 May 2025 23:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955958;
	bh=OB1VuDaJBkdgJNI4JrASaAj7S+zM8SqIbsYk5Ni8T70=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=t4xxBfseyHwvUieyVoiF79+KyunmoRgV6yuT36sWqWgUDUZxZpH5LqFfnHWQc89sc
	 paFHYoMq1SsNAKUpEvvuq7W/mKqohmJuvKosw2ja792GePk6dVzVvkBqMs+aFqQI7x
	 zjBVCD3zfo9JRMz+jAn2sS+j9HR9tlDPEobjTS7ZDz92ukgPmopJbflwATSTkPZFxG
	 AMJs1Mt7ejeEB1TFGMupNN6Trz+2FBaZD6UsGfT8PTBgdL0Uu+1QWU4AlcAYAs0/aY
	 H8O23BcODtg1LdvojuLLDA7ZfrW6pjkud2nVXqRr3ZK/kk2+JjAXl500xEDyt1GCB+
	 8J1IuZAvUheVw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 23 May 2025 01:18:25 +0200
Subject: [PATCH 10/10] arm64: dts: qcom: sm8650: Explicitly describe the
 IPA IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-topic-ipa_mem_dts-v1-10-f7aa94fac1ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955915; l=1343;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=aVHI2d0zLQRIn5qK1sGtQckKa0kt9KjADJcZ7be0yLY=;
 b=NQHkdR6B+n/xrRlRcUHqRG5khFL6IslSDVuQd5Z13IklUZ8MrpuNQG5d1LXnjU2MncjL49Vtc
 z4FYzUjmdbgDs2x6UVPWZSfqS9kyrQzcoTn3Cnc++tJn6av867tsEQd
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As part of stepping away from crazy hardcoding in the driver, move
define the slice explicitly and pass it to the IPA node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 495ea9bfd008500dd2c9f46ceca94cf5f972beca..7b80d281cac4349ffc2adac0650e07329da461aa 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -4344,6 +4344,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
 		};
 
@@ -6637,6 +6639,20 @@ funnel_apss_out_funnel_in1: endpoint {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,sm8350-imem", "syscon", "simple-mfd";
+			reg = <0 0x14680000 0 0x2c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0 0x14680000 0x2c000>;
+
+			ipa_modem_tables: modem-tables@8000 {
+				reg = <0x8000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,sm8650-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;

-- 
2.49.0


