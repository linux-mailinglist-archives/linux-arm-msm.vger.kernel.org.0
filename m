Return-Path: <linux-arm-msm+bounces-59946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB72AC9AF3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 14:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF1AF9E317C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 12:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 224CA23BD1F;
	Sat, 31 May 2025 12:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XY2kD4IA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E958D1EDA02;
	Sat, 31 May 2025 12:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694463; cv=none; b=n9NoY9d0LHbG/m17kxHWRasPSIisN0VP4k/EcztMdJtXw3LefnWC8g9UvCEnQMfGh2E8h2tyoxrJ4F/LwPvGPOd06RjK1ekmgsqULWeWHtW6UXyBv0UVaT5AYwwctaeCPEpl8e9OZ8Bhukq8MLPxUJ6bRTLPCzMiF0A6FnLu6Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694463; c=relaxed/simple;
	bh=Pao8pnOWWyQ6agK8/F33FMjbR7zODvlIga6VAVYclV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AKoljcdTt0OR4o6tXfIUaxKpHYG3e8eUpv+8/HO6mAteDKDEhw4IlHj4UXJUlfLbMCvOA7NB7HOwTxUq1LC6vRMVp/pOcMrXxWXBx1zCCvHlnWHlUXjFsMgC6kKWUY999LiIe1RCG7xFzoUc7n+4wi/1fJvjKkzvuCVmRanEQpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XY2kD4IA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D0EC4CEE3;
	Sat, 31 May 2025 12:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748694461;
	bh=Pao8pnOWWyQ6agK8/F33FMjbR7zODvlIga6VAVYclV0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XY2kD4IAtY53KEZbBbozmWiODOwUHekrsIo8l0wxlJLYBsJk4hWmHlUsd+y4zZC23
	 K6zB0NXvlif1yUWRdUUWTk5NjJCIGRB4JElYXY1Ahf/dmiN5Igf+aFu4rxUK8nEjvV
	 e4Pb8C9GF3gUUMVUqxZNDeBMxXQnBJLohaWpFe6HjfWvjgHsVBH5LNGymeIxF5JbGk
	 UiOfSmYcGhQIEBfMdRDHPAMTgJ8EZZ+J/yHb2JELG7QQkzgypuhfMqtUvrt9OdlfUU
	 Jl82MRkIdmM5b/sXz0V4AfHoXMhPpDVO+Pli9TZAYdbj6phfrTVy82gQDIbYTdjR1j
	 bW6dUbCCo8ctQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 31 May 2025 14:27:20 +0200
Subject: [PATCH 2/5] arm64: dts: qcom: msm8996: Add Venus OPP table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250531-topic-venus_opp_arm64-v1-2-54c6c417839f@oss.qualcomm.com>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748694448; l=2366;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=wRKMjzoSK2kOMrjP81qDbuzf9F50OOX/SsUs3T315ns=;
 b=oF5nj0bYXC5XV+A2js3jCohUl2RTIpUDAEijxRQE4JlKFDlIVuL7URG77ZMQItHHE2nHqN/6c
 C6D4TNpP0HYBjGIh3Bfg0tEruei98IHFSbtkSqVD+ZxLiOma8sI7UPt
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Describe the DVFS levels explicitly.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 39 ++++++++++++++++++++++++++++-------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index ede851fbf628428f5740ca8add65ffc05360cc62..7bb34e60739b2e561ff5fd9e19a6e617fb601a60 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -491,27 +491,25 @@ rpmpd: power-controller {
 					rpmpd_opp_table: opp-table {
 						compatible = "operating-points-v2";
 
-						rpmpd_opp1: opp1 {
+						rpmpd_opp_ret: opp1 {
 							opp-level = <1>;
 						};
 
-						rpmpd_opp2: opp2 {
-							opp-level = <2>;
-						};
+						/* No SVS_KRAIT/SVS_LOW */
 
-						rpmpd_opp3: opp3 {
+						rpmpd_opp_svs_soc: opp3 {
 							opp-level = <3>;
 						};
 
-						rpmpd_opp4: opp4 {
+						rpmpd_opp_nom: opp4 {
 							opp-level = <4>;
 						};
 
-						rpmpd_opp5: opp5 {
+						rpmpd_opp_turbo: opp5 {
 							opp-level = <5>;
 						};
 
-						rpmpd_opp6: opp6 {
+						rpmpd_opp_super_turbo: opp6 {
 							opp-level = <6>;
 						};
 					};
@@ -2333,6 +2331,7 @@ venus: video-codec@c00000 {
 			reg = <0x00c00000 0xff000>;
 			interrupts = <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&mmcc VENUS_GDSC>;
+			operating-points-v2 = <&venus_opp_table>;
 			clocks = <&mmcc VIDEO_CORE_CLK>,
 				 <&mmcc VIDEO_AHB_CLK>,
 				 <&mmcc VIDEO_AXI_CLK>,
@@ -2364,6 +2363,30 @@ venus: video-codec@c00000 {
 			memory-region = <&venus_mem>;
 			status = "disabled";
 
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmpd_opp_svs_soc>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmpd_opp_svs_soc>;
+				};
+
+				opp-346666667 {
+					opp-hz = /bits/ 64 <346666667>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-520000000 {
+					opp-hz = /bits/ 64 <520000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+				};
+			};
+
 			video-decoder {
 				compatible = "venus-decoder";
 				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;

-- 
2.49.0


