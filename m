Return-Path: <linux-arm-msm+bounces-77933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC94BEEA06
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 18:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE964189B92E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 16:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898E62ED154;
	Sun, 19 Oct 2025 16:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="quII/I8W";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="SsNsrm1c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C3A38F80;
	Sun, 19 Oct 2025 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760891246; cv=none; b=u2dTOYWSZ4TLXUMqpsAWAqEa/TUAF3a2GMAarAkJDkV4RUSUdOmLLuF1iXDyxX+dSDJ0LPYo7t9Oy6RAHt1OPHYBWahfY3SYuLqNjZwS12zDE3/Qt5gzkJ+7Fv+/5Df1NFnCAEfdVMObh1Ixhoob+9OLRP2Aq32gkEUX4Apc6eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760891246; c=relaxed/simple;
	bh=gvzql2bTV8SYhn9R991aVWWFpHJeBNeGZXGgR2zVwCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NLckzll5aXrwmCJF2n3SgAs6llXgumUdh0gcN2b55HdtiPEzVeUBfbvIyOUk37/ie7/g+7UHxtlD/eGFmN1rvMbc5hzeEws8e4m7cJ0ZmRtp3Xq0JVMxYyAqgVjjsld1l4rJ+TA14wQEccPmQFo6R5lezHOOslLwWh6qNk1Kq4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=quII/I8W; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=SsNsrm1c; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760891235; bh=DjOGkHv09MNig9lChj2MRHO
	fB6H7BBMERm2AgemVQTY=; b=quII/I8Wnd6OTa+0kA0k35jiyDgT4W7RBKV/vXL6XzYnUvURg/
	8OJOqXpgGVjH6N98oSC3APZbB2aIhyAD0BH+F2mxkD5YcX7L0/IzVrbe3/kQMeZuGseLb+kQIJ9
	5xo1kEMdKCHlCFGIj6Eh0QxrUxUTuYH7FsOaLLhgNv1C3yZvnB4ZMB9NeZobCNMWPlDEYqGpNds
	WYqdi+CWvvupLy77+KBAAuOTtB+QazovlHNNKHN4uEjXKhMO0nAD0xDJJaZ4iTFJbX5roSdxA6t
	WLtd6ITOd6arZRzTn8iJrU+rJRNtT5eelH9JyMlmLpIAE5jcqKDj/o8t+QxzKtoFFtQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1760891235; bh=DjOGkHv09MNig9lChj2MRHO
	fB6H7BBMERm2AgemVQTY=; b=SsNsrm1cjB5vctcc4S5gHzjxq9IkKYp0+4iDPzol1HsVKLelGR
	+6UHbV2SChPA83W3ssoXpxlhcwXd8zC+ngCw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sun, 19 Oct 2025 19:27:07 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-2-9ab5f2865a6e@mainlining.org>
References: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-0-9ab5f2865a6e@mainlining.org>
In-Reply-To: <20251019-qcom-sdm660-cdsp-adsp-dts-v1-0-9ab5f2865a6e@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, Nickolay Goppen <setotau@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760891233; l=1756;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=gvzql2bTV8SYhn9R991aVWWFpHJeBNeGZXGgR2zVwCo=;
 b=noeZpMdGgzrzNxxH4/uOt6Ae+w3JkFPhdUIiP9khF0M3lLIkkFkv1umLxaBJEhNZcOucrj7lW
 dBv5zbkMkRgBd7tGaHyEGHxK7k8irtp5qbXc7/dZqKSgnfVt7qe+haD
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

This includes:
 * Add missing vote clock and GDSC to lpass_smmu
 * Add FastRPC subnode with compute-cb subnodes to ADSP node

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 38 ++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index a6a1933229b9..2764666714e6 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1217,6 +1217,11 @@ lpass_smmu: iommu@5100000 {
 			reg = <0x05100000 0x40000>;
 			#iommu-cells = <1>;
 
+			clocks = <&gcc GCC_HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
+			clock-names = "bus";
+
+			power-domains = <&gcc HLOS1_VOTE_LPASS_ADSP_GDSC>;
+
 			#global-interrupts = <2>;
 			interrupts =
 				<GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>,
@@ -2337,6 +2342,39 @@ q6routing: routing {
 						};
 					};
 				};
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "adsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&lpass_smmu 3>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&lpass_smmu 7>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&lpass_smmu 8>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&lpass_smmu 9>;
+					};
+				};
 			};
 		};
 

-- 
2.51.1


