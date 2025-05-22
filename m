Return-Path: <linux-arm-msm+bounces-59155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA14AC1799
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 01:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 163061C046D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 23:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F6D2D3A66;
	Thu, 22 May 2025 23:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LAEpBcZi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7FB2D190E;
	Thu, 22 May 2025 23:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955954; cv=none; b=pnUwEdWkc2uo050/b0WDs7gBueHGHvNHDu8x4RDpfYNN0MyyhjZlzu/HyAP42DRZjspfsrkdMGFzxfDRwcNlAIc5vOqb1Aftcxu5xzuSi3JyyVRWzd+3OhhhU7cZFj24QoWm0c2Zac7wQMDBlE2NRNJak+ceUsXdU8yflTC6Gqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955954; c=relaxed/simple;
	bh=BEBlAJCqwZ0jmzu9cV8BNKLQ1XURofe0L5MmLovOywI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ooqnPaAHbEuPbr5is2hbc3EteeALylkIlU2fq7Uj1D8qr9rSo6IyskPXXfspY6AHh2Lrc5zYNzpw7SKYIdK6gzpK8bQbZmIswtfwzrjFbsOvhZYR2LvCXcw0WIdZ91MxDb9s8wWZtjSt82/3txK1BrgxFGev6WmBO4BnbblgtTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LAEpBcZi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC98C4CEE4;
	Thu, 22 May 2025 23:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955954;
	bh=BEBlAJCqwZ0jmzu9cV8BNKLQ1XURofe0L5MmLovOywI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LAEpBcZiaMO2KdKskGe1PGoXziU+lvBVVZGQwdvRyKetR/m6EwOwSG4fwiSa/Sqxj
	 xcRoxLxhaBFx5ffaI5WfoocEYa/IiLdR1YhNCYzYdGIyYQ69Fh7zEXKZA28Oeuj/Jl
	 gb4Cc2BpNMu2YvjGE5MZBIri7gUpy/gPAZGuyIwRbCRbOMlnI4fQIl0cRbDYXB+cKt
	 nfR3LgNVKkjZ4zFRW7asS+fvZDuvDLF4O9KtCPFo3VNflda6a3+ucC4Js/wV3W8uP1
	 f4VzCRWiRV6k6t3mULS2p0agDFEJWBtKoz62qPh3hsj5urWLyJi8/EY0V7gIRPJgtm
	 Y6uDL6cEUI5/w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 23 May 2025 01:18:24 +0200
Subject: [PATCH 09/10] arm64: dts: qcom: sm8550: Explicitly describe the
 IPA IMEM slice
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-topic-ipa_mem_dts-v1-9-f7aa94fac1ab@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747955915; l=1316;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=9tMmQwUU3qemY9amlN8aEuUvLP/vpIYRlS5j0FMqUHw=;
 b=+8jP9RWXnUHtQoMtugZxi/fqHZZuturXsbNl9Bnelgj2YiB/SD89DunuWuc/uzKrlnuO/40WS
 c9gGajP8cQPA2DREMXQJ7iF8AXAePRli3eItHxIggl9CDHgGXuere2v
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

As part of stepping away from crazy hardcoding in the driver, move
define the slice explicitly and pass it to the IPA node.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 71a7e3b57ecedd86d798e71b781451fe11f9c1ce..17d755daba4141d3a8716cd6ff4483c34dc0f660 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2659,6 +2659,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			sram = <&ipa_modem_tables>;
+
 			status = "disabled";
 		};
 
@@ -4737,6 +4739,20 @@ data-pins {
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
 			compatible = "qcom,sm8550-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;

-- 
2.49.0


