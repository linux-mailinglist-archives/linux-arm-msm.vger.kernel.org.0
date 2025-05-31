Return-Path: <linux-arm-msm+bounces-59949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE89AC9AFE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 14:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C7B117A916
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 12:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BEEB23E344;
	Sat, 31 May 2025 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EESB5qZl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7D423E33F;
	Sat, 31 May 2025 12:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694474; cv=none; b=eZI2zPs8PkejcCuTGa/r9gh416pcmwVENgwoAbqCYPuQaLXngspmI5dkn4y6k+hhJKRNm04w/QzXh/lWG61pmQcp6psAQ5u8UFJIYD3PMtgqaZApZiJ0NrqeKaajVuzofNVdy2PE8hq1k4QxZxs3Jg4DbwydeKC+gcA4JP2MIA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694474; c=relaxed/simple;
	bh=yZCnkZU4ApKN5ABAVzdggfWG88h4Av5rhIP1C5RtxMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yva04WRJjlEN5alwFLEZoT7EF1MlmEsTF8Bu2BxTp2JlkGIG1WhB62WCExonj5v9FyZeYMekvuIhYUVWR7htUVPNOkj/30tU7eeXe9DiKzL97CjkwnFdK5Qb5gK7SSUEJUFvog8Ck6/efnc95QWPxkc67Iwtv0EUYmkzmpvYGwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EESB5qZl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 917EBC4CEE3;
	Sat, 31 May 2025 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748694474;
	bh=yZCnkZU4ApKN5ABAVzdggfWG88h4Av5rhIP1C5RtxMQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EESB5qZlGX7+MBpm+om4DGAc83HtkvRB64LD3wqh543iIpT4+Ekz/x8bdH3OR5yzl
	 oOnJVqCKmEpqIhxkZVpHevrsqN1ImUSUZktNBbiqsTI+Gzyzi4gETpQCgPXMzdTgc9
	 +4T7g0RBdXFSCRSwKckl/v1+EVONXkzvqUtlZUwTd4l5TjLZ7mGWqBubUWvM8OiLpC
	 1VZQI7VC0MELf6eHQuNOZW9uEWszLivLkODWEqQ7IGtREcYZew1xY8g4/z8Xy3Yean
	 fdYsR6xcSm8DeP+CzykO/up0F9mSTfIWjqsIzU3igH5vqpAQ1w11TXoB7/xqgxDar7
	 +bd7qqvRnpfHw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 31 May 2025 14:27:23 +0200
Subject: [PATCH 5/5] arm64: dts: qcom: sdm845: Fix Venus OPP entries
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250531-topic-venus_opp_arm64-v1-5-54c6c417839f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748694448; l=1835;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=JNLJKtc4vkDuPecJfLPup7DizZnsmi2MGVgJWaXnqo0=;
 b=XARFExLx3TQAx3luuiRIL2X52D0ZkWmIdiTAKOCCDzn0XdwPXKy5c19RphKBtigsrpIaqLWNq
 7O1Z+bgivL3A8lspKqYQnFcOYU9lIf4aTZbxXaSR1Vy4d1yJRo6XEZt
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Make them aligned with both the Venus and clock drivers. The existing
ones seem to have been based on data for the non-final SKU.

Take the liberty to move the opp table subnode to retain alphabetical
order while at it.

Fixes: 137154871cf4 ("arm64: dts: qcom: sdm845: Add OPP tables and power-domains for venus")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 3bc8471c658bda987d6fcff3359d63b367148e89..7d22ecb908cd4dd792a36beaee0ede061c5abd0f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4254,14 +4254,6 @@ venus: video-codec@aa00000 {
 
 			status = "disabled";
 
-			video-core0 {
-				compatible = "venus-decoder";
-			};
-
-			video-core1 {
-				compatible = "venus-encoder";
-			};
-
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
@@ -4275,13 +4267,13 @@ opp-200000000 {
 					required-opps = <&rpmhpd_opp_low_svs>;
 				};
 
-				opp-320000000 {
-					opp-hz = /bits/ 64 <320000000>;
+				opp-330000000 {
+					opp-hz = /bits/ 64 <330000000>;
 					required-opps = <&rpmhpd_opp_svs>;
 				};
 
-				opp-380000000 {
-					opp-hz = /bits/ 64 <380000000>;
+				opp-404000000 {
+					opp-hz = /bits/ 64 <404000000>;
 					required-opps = <&rpmhpd_opp_svs_l1>;
 				};
 
@@ -4295,6 +4287,14 @@ opp-533000097 {
 					required-opps = <&rpmhpd_opp_turbo>;
 				};
 			};
+
+			video-core0 {
+				compatible = "venus-decoder";
+			};
+
+			video-core1 {
+				compatible = "venus-encoder";
+			};
 		};
 
 		videocc: clock-controller@ab00000 {

-- 
2.49.0


