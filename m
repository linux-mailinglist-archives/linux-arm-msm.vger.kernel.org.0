Return-Path: <linux-arm-msm+bounces-52578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AEED3A72855
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 02:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB7F67A1975
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 01:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E9485260;
	Thu, 27 Mar 2025 01:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvlbDZkP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1421581EE;
	Thu, 27 Mar 2025 01:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743040097; cv=none; b=OjMLCpNCgyNIWRaQw7fEJFJhnsNJfxqN0Jb4uHxpPKdpBZUapYzfX0CmJv7/7Br3l5D8c7ighF/meKjVQEd4REK7tc/9KPnTYFNSVVVKrUVeeX2ffDDU72DM1LNKLPi6C5ZCN/eQM7qy7Bmj7wfvdgg0XtukRgQreWuXUN9wu7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743040097; c=relaxed/simple;
	bh=B4rlNYI/TlMi8E2r+5AAZGMuPbzHcx8khyl4TDY4AbA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=doJT/bRRlx91bNSV2csBIwwLgMY5IczINGBTNuJ2nl/xvX9V9kJhFeHM3TPJK6Pn+N8mrjIidopM4iKMd7CUFP5HpbqLz1FOagn1v4clL+Kl3M/tBZN354E+zgNonwx//iLXvf1RC5qZ52IHhAtFl0UgrtL9dI6lhCE62uEm6i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvlbDZkP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29AE5C4CEE8;
	Thu, 27 Mar 2025 01:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743040097;
	bh=B4rlNYI/TlMi8E2r+5AAZGMuPbzHcx8khyl4TDY4AbA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cvlbDZkPCqgV1CUBtj+U3KrMX2zztiw9L1/p8/bRNGuVKNSjebv8Sckvk03iYa32X
	 zanRAULs9TE04m+GizvOWQR8yb1CCbWXTojkaszyRjDzAyp+1D9KZEZv2grRNNQFoN
	 FfXAgeBohuyw+9IQXsFlEhBR4SqmIp8A+rAr3zdGSiBQT2/OUJ80uNJluMBCn6W7jo
	 05GXEim1uBYCkO0BXXozhHgadqoNoouwMkE9ztD2TUq46eo54cbEUr6zRtczB5YM75
	 l/fXRB+XGUs0WSmDcIxAxhFSG51VjcbDHCdjlfg9SnVPmJh5VdItVrlL9THP8WtX+n
	 UY58Y8omMXnZw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 27 Mar 2025 02:47:14 +0100
Subject: [PATCH v2 12/12] arm64: dts: qcom: qcs615: Fix up UFS clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-topic-more_dt_bindings_fixes-v2-12-b763d958545f@oss.qualcomm.com>
References: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
In-Reply-To: <20250327-topic-more_dt_bindings_fixes-v2-0-b763d958545f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 Marc Gonzalez <mgonzalez@freebox.fr>, Dmitry Baryshkov <lumag@kernel.org>, 
 Arnaud Vrac <avrac@freebox.fr>, Sayali Lokhande <quic_sayalil@quicinc.com>, 
 Xin Liu <quic_liuxin@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743040027; l=2029;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=6fIPlfmQGBAPT7tnjcnxtmbjB2VukAd6upZhk+62720=;
 b=oCMOlcwQcBZCrN7m6ST6xMJEh8GSvo9dRo/ywt2lXSa+aKei8rolyagG40UqXOzqVm34zjDkf
 UDC+2EMaEgQDH4PWaf67sLtn0acgSsw+pkmsnH3pHXMddpsqQltxa9L
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The clocks are out of order with the bindings' expectations.

Reorder them to resolve the errors.

Fixes: a6a9d10e7969 ("arm64: dts: qcom: qcs615: add UFS node")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 757b45a142136c01ac74bfa456f90374c3a7acfb..06ddeacc48baa1e04d3ada4b0808f4bf29ae9f80 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1033,10 +1033,10 @@ ufs_mem_hc: ufshc@1d84000 {
 				      "bus_aggr_clk",
 				      "iface_clk",
 				      "core_clk_unipro",
-				      "core_clk_ice",
 				      "ref_clk",
 				      "tx_lane0_sync_clk",
-				      "rx_lane0_sync_clk";
+				      "rx_lane0_sync_clk",
+				      "ice_core_clk";
 
 			resets = <&gcc GCC_UFS_PHY_BCR>;
 			reset-names = "rst";
@@ -1071,10 +1071,10 @@ opp-50000000 {
 						 /bits/ 64 <0>,
 						 /bits/ 64 <0>,
 						 /bits/ 64 <37500000>,
-						 /bits/ 64 <75000000>,
 						 /bits/ 64 <0>,
 						 /bits/ 64 <0>,
-						 /bits/ 64 <0>;
+						 /bits/ 64 <0>,
+						 /bits/ 64 <75000000>;
 					required-opps = <&rpmhpd_opp_low_svs>;
 				};
 
@@ -1083,10 +1083,10 @@ opp-100000000 {
 						 /bits/ 64 <0>,
 						 /bits/ 64 <0>,
 						 /bits/ 64 <75000000>,
-						 /bits/ 64 <150000000>,
 						 /bits/ 64 <0>,
 						 /bits/ 64 <0>,
-						 /bits/ 64 <0>;
+						 /bits/ 64 <0>,
+						 /bits/ 64 <150000000>;
 					required-opps = <&rpmhpd_opp_svs>;
 				};
 
@@ -1095,10 +1095,10 @@ opp-200000000 {
 						 /bits/ 64 <0>,
 						 /bits/ 64 <0>,
 						 /bits/ 64 <150000000>,
-						 /bits/ 64 <300000000>,
 						 /bits/ 64 <0>,
 						 /bits/ 64 <0>,
-						 /bits/ 64 <0>;
+						 /bits/ 64 <0>,
+						 /bits/ 64 <300000000>;
 					required-opps = <&rpmhpd_opp_nom>;
 				};
 			};

-- 
2.49.0


