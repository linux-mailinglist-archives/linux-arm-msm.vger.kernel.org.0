Return-Path: <linux-arm-msm+bounces-54488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E049EA8B731
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 12:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3DDAB189F6B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 10:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A41236A77;
	Wed, 16 Apr 2025 10:55:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE87A2356DC;
	Wed, 16 Apr 2025 10:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800924; cv=none; b=LSkKcGt1WmmVYQcxSEi+YBGJ7ceypI8jqVhwDTTXWsbxTUtzcY4Uf2lOl/dGisuI/r9rGixX4qgTLTPJlisfThyWxqQna5ObN7fc9NhygXk5y0DYUNCMUmsOjXWZoTe3HrdVQyTmhlKktHVUxsVkKwUe4mxTCIKI2kb+6HEIKFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800924; c=relaxed/simple;
	bh=tqJqFIE1T+kTlNY9bfQiUE33Vv4WO3vQtJdDUu1iyY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ph73kqn+TlqPqG3dz4QiEwJxUXR183HcAf3xjAY87buS+Ys+0eRSZyuSmQuY6ylAY/EeKRL6lW0Pf8Xjf0//JIPZyIsZIaXRWxc6tOF7r/Sa2COhbPcZWFOzAthBf8ZEtTe7RndCseXQIg6DvyWPfes+jpGTja4GMO7NFAUg5e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpsz2t1744800883ta33297fe
X-QQ-Originating-IP: iTLQjDQAIaI4xnuMOQgJReKtXdpzN9jKj9Ql7mESqS4=
Received: from [192.168.30.36] ( [116.234.96.50])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 16 Apr 2025 18:54:41 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8155109911631512638
EX-QQ-RecipientCnt: 10
From: Xilin Wu <sophon@radxa.com>
Date: Wed, 16 Apr 2025 18:54:18 +0800
Subject: [PATCH] arm64: dts: qcom: sc7280: Mark FastRPC context banks as
 dma-coherent
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-sc7280-fastrpc-dma-v1-1-60ca91116b1e@radxa.com>
X-B4-Tracking: v=1; b=H4sIAFmM/2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0Mz3eJkcyMLA920xOKSooJk3ZTcRF0LizRjE3PDRBNDQ2MloMaCotS
 0zAqwodGxtbUAJwkTzGQAAAA=
X-Change-ID: 20250416-sc7280-fastrpc-dma-88f3471a4113
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744800882; l=3697;
 i=sophon@radxa.com; s=20240424; h=from:subject:message-id;
 bh=tqJqFIE1T+kTlNY9bfQiUE33Vv4WO3vQtJdDUu1iyY8=;
 b=kti0l6NZjikO+LCzT7UT8cSInLNABxO0QD+3/1hilVlpmEOHantorIiPkSQI9goXzLpZWPXBN
 V4uAxh2VrIiBcXb72BwWu0goyoK+vCSdYFMeJgu/pItdMPJrBRHalEy
X-Developer-Key: i=sophon@radxa.com; a=ed25519;
 pk=vPnxeJnlD/PfEbyQPZzaay5ezxI/lMrke7qXy31lSM8=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OFht7H3FD1FnP+kk9wX05mc9f/VC9/v8eO5pU20rC+OuVnHiptVzvcVj
	RPmMmZkpe0DDgK0c05B0+yjtjhEV7g5Z7897ux/ffrvbp11ijRc4yubKoPTavmHNIgvtFUg
	D+fq9vQnyL7/hCnLU3ejQN7Ho2fsxcFWgfYyMbmd+3a/rYM/5rmRths4G+SUzzi7nZ5vsaJ
	SJGHOpsYvyK2iEl4o9DzafsHYdWOIL7GZWnIMjt3vqRjDmkvv59fwMLI8wOXxilPrwjCfoK
	gISIV7dfVPLpTmW6cFlO4EdIq5qSWPryTvCtOz9jfk4jm9CxIGRWZ1qOVxs74l4DhC6CLmc
	db6OmW+yWkrLW7ds4fTUbTAnvTt8ZZWnwRnFuBK/vhF+6o2pw/O6ex+P54V4wq5Tya0uqLa
	z52JThtgiDfEojKU1kWO2m52ufBViIjQxA7Pgha0EpqN9R7UHYU95/vEDxTZlZln/RX5s2S
	fGtcuaqr3JSPJestt59tavNUJX6+XT7HY4g2j7CXWq1QQ1yk0k5+XdYdCg4wNFrs6KOtV7u
	rtmvylGv2D2yvAxENv+zy8JTUrKxHbk1Wr+FUxVeSx700kqLPytyRbB8S3bkh8X6ebSqylz
	nsb6gTj3R4tmwHGH+Eh3bpUcqASswol354rYpj1zjMAbYh/CaIA3LzCg6w7tZ0X0LeoTbW7
	4672UHFm151W5nuvCpX3A2FrynZeiEC3R6Qfu4Picep+y5pvhrukG779C3A1ZHfIDped+mO
	XclQ6fumAqChcp1w4GWdWpNdBF6yURFrXP+qmWUdVCL6H3FZJz5cA6F0+5EPPKDj09CFhth
	vvNNVWavB87ZPWxLdp7XARkd/x5xU6re7jEBurPlpqaFFS7ttizCPucmG8kk5m+V6bLLuJd
	PjAaGQZS36QLPomAnL5+hb6dhVSmGwFBXFx4J9dsuec8D3bmmS/jhIk3cmhGGJNXnLFwCdv
	WcJwhw2I72gt6fZQoSKC4EFAB/3CAJWhig3FxJouTNqjr8LxRBr+0gVTRjm8wGTRkAFMkpa
	ebnAlpPpzHHNLRpXS8MPEwrAtiJGWUKX5HRBZLrg==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0

The FastRPC context banks are DMA-coherent on sc7280 platform. Mark them
as such.

This allows LLM inferencing on the CDSP using Qualcomm AI Engine Direct
SDK on the qcs6490 platform.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index ec96c917b56b4a077b45ac0186da6aaedb899dbe..bb5092bc2bbe97ece31ad84a22f87738b1289682 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -3869,18 +3869,21 @@ compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <3>;
 						iommus = <&apps_smmu 0x1803 0x0>;
+						dma-coherent;
 					};
 
 					compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <4>;
 						iommus = <&apps_smmu 0x1804 0x0>;
+						dma-coherent;
 					};
 
 					compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
 						reg = <5>;
 						iommus = <&apps_smmu 0x1805 0x0>;
+						dma-coherent;
 					};
 				};
 			};
@@ -4108,6 +4111,7 @@ compute-cb@1 {
 						reg = <1>;
 						iommus = <&apps_smmu 0x11a1 0x0420>,
 							 <&apps_smmu 0x1181 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@2 {
@@ -4115,6 +4119,7 @@ compute-cb@2 {
 						reg = <2>;
 						iommus = <&apps_smmu 0x11a2 0x0420>,
 							 <&apps_smmu 0x1182 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@3 {
@@ -4122,6 +4127,7 @@ compute-cb@3 {
 						reg = <3>;
 						iommus = <&apps_smmu 0x11a3 0x0420>,
 							 <&apps_smmu 0x1183 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@4 {
@@ -4129,6 +4135,7 @@ compute-cb@4 {
 						reg = <4>;
 						iommus = <&apps_smmu 0x11a4 0x0420>,
 							 <&apps_smmu 0x1184 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@5 {
@@ -4136,6 +4143,7 @@ compute-cb@5 {
 						reg = <5>;
 						iommus = <&apps_smmu 0x11a5 0x0420>,
 							 <&apps_smmu 0x1185 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@6 {
@@ -4143,6 +4151,7 @@ compute-cb@6 {
 						reg = <6>;
 						iommus = <&apps_smmu 0x11a6 0x0420>,
 							 <&apps_smmu 0x1186 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@7 {
@@ -4150,6 +4159,7 @@ compute-cb@7 {
 						reg = <7>;
 						iommus = <&apps_smmu 0x11a7 0x0420>,
 							 <&apps_smmu 0x1187 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@8 {
@@ -4157,6 +4167,7 @@ compute-cb@8 {
 						reg = <8>;
 						iommus = <&apps_smmu 0x11a8 0x0420>,
 							 <&apps_smmu 0x1188 0x0420>;
+						dma-coherent;
 					};
 
 					/* note: secure cb9 in downstream */
@@ -4166,6 +4177,7 @@ compute-cb@11 {
 						reg = <11>;
 						iommus = <&apps_smmu 0x11ab 0x0420>,
 							 <&apps_smmu 0x118b 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@12 {
@@ -4173,6 +4185,7 @@ compute-cb@12 {
 						reg = <12>;
 						iommus = <&apps_smmu 0x11ac 0x0420>,
 							 <&apps_smmu 0x118c 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@13 {
@@ -4180,6 +4193,7 @@ compute-cb@13 {
 						reg = <13>;
 						iommus = <&apps_smmu 0x11ad 0x0420>,
 							 <&apps_smmu 0x118d 0x0420>;
+						dma-coherent;
 					};
 
 					compute-cb@14 {
@@ -4187,6 +4201,7 @@ compute-cb@14 {
 						reg = <14>;
 						iommus = <&apps_smmu 0x11ae 0x0420>,
 							 <&apps_smmu 0x118e 0x0420>;
+						dma-coherent;
 					};
 				};
 			};

---
base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
change-id: 20250416-sc7280-fastrpc-dma-88f3471a4113

Best regards,
-- 
Xilin Wu <sophon@radxa.com>


