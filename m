Return-Path: <linux-arm-msm+bounces-59948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AD5AC9AFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 14:28:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 286731BA0E29
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 12:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A747A23C4F5;
	Sat, 31 May 2025 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sCddSc3b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA7E23C4EF;
	Sat, 31 May 2025 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694470; cv=none; b=f6DW3mVUvPxUtwHIzZdwbxKprVd7PigU/T9jX4c5tb4ZqPg2BBwZ4N6OlHPvBRR+Hm8esky3gKyVWV2jTVpisLV8yeTmH3eIG9x6vnMHxk4MJjQoU85fjoD/e/mVXMpyCvtCdRZL10Uj+d9ezDDrR/5cA32QSXiMa/ilx3HPGA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694470; c=relaxed/simple;
	bh=NNrpnLzrjqyBK5HogKnQfc9bVsaZZJIlyxM6FkVWPC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M+Xdt4Dr6r6Sx2+03n45SODpE0wTunsBDoAvH90ROPYBwQs0jCisjL/w0qsGZmlHrSPKaEuO5O6GgpPYV2VOumeA4wF7tiTrG2ZsLVVu3hSCuAFWSZKkf/GVHUV10yIcA/WFdidmWylWxYJ/klWiQUR/9I5R0rfCru9VQ9jsk2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sCddSc3b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15ED7C4AF0B;
	Sat, 31 May 2025 12:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748694469;
	bh=NNrpnLzrjqyBK5HogKnQfc9bVsaZZJIlyxM6FkVWPC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sCddSc3baoBdsDCphGOTD6swrPmrBx5ctKzhwANr+CGLjRgIH3k8bKs/aPE/mfGSp
	 WMS6ekfmTHlk2FajL4CtiZyqD6xCW9+4SNrkyni6hdQX5ulw1Rtu4PG6GcK7AGfm9l
	 3SmX8g8hB2mzfdblLcHUmdDi0QhZC55Dx034W932x0QV8NcSXaftnms5LONS0TId9g
	 fp4f/GNlJWNsBwplb/9J/PKAUhY0DG2mdb6GSIm9zKb0jU7tO7+Jbz3BMlSqE9uqJU
	 ckRkBwL1QVBbsJqbdTWIvjS78jaql1RYuhAGYRnHYMQegDkfVuzOH0OKAzKnzlGkan
	 pQyyRDwiRvtfQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 31 May 2025 14:27:22 +0200
Subject: [PATCH 4/5] arm64: dts: qcom: sdm630: Add Venus OPP table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250531-topic-venus_opp_arm64-v1-4-54c6c417839f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748694448; l=1637;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=1U9ZJUS3BmSW1Kc5ga+UWTJHqsCyjs3M7onX7ZP5lv8=;
 b=SmfGcrT4LgvkfySM9TZl03GI3yTj1IMZZNLZv6pQQhGFioAjErhd/ez/Xzdfbtzb5bEtyeDRr
 ih18JGNGv8jCCdf82O8GmnA2OzMQKMba7Bef3gKd28rxsf8GSTomeS/
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Describe the DVFS levels explicitly.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8b1a45a4e56ed1ae02e5bb6e78ca6255d87add1c..445cab2ddb12ebb572788030a7913cb77e9f7f78 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2202,8 +2202,43 @@ venus: video-codec@cc00000 {
 				 <&mmss_smmu 0x431>;
 			memory-region = <&venus_region>;
 			power-domains = <&mmcc VENUS_GDSC>;
+			operating-points-v2 = <&venus_opp_table>;
 			status = "disabled";
 
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-133330000 {
+					opp-hz = /bits/ 64 <133330000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+				};
+
+				opp-269330000 {
+					opp-hz = /bits/ 64 <269330000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-320000000 {
+					opp-hz = /bits/ 64 <320000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-404000000 {
+					opp-hz = /bits/ 64 <404000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-441600000 {
+					opp-hz = /bits/ 64 <441600000>;
+					required-opps = <&rpmpd_opp_nom_plus>;
+				};
+
+				opp-518400000 {
+					opp-hz = /bits/ 64 <518400000>;
+					required-opps = <&rpmpd_opp_turbo>;
+				};
+			};
+
 			video-decoder {
 				compatible = "venus-decoder";
 				clocks = <&mmcc VIDEO_SUBCORE0_CLK>;

-- 
2.49.0


