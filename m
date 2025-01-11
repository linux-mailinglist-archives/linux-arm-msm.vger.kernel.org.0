Return-Path: <linux-arm-msm+bounces-44804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0F3A0A4E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 17:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C62CF3A8657
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 16:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 926351B414B;
	Sat, 11 Jan 2025 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzlyUes4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A7A10F1;
	Sat, 11 Jan 2025 16:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736614486; cv=none; b=AOKh0Xpjf/2Kx2UrW0BvDdP2a9DQszCNkLbAoPNDXX4ZNgBAAnYX3BxByhmXhuTzF6R52eTC92pf71ZNIn21JeQ3AAmrIP9Q6o65KRZhhcUkI0PMj6rFJe7atEOYOQdbatOfHcJq6JkjmhHJL9tGTJ/vGPoc7X6ZWvG1kwXPKZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736614486; c=relaxed/simple;
	bh=TXwe4AGMg500Pf5WQjlVnR7F8OrmQb4fx8CjlnXOJLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5TO3jB5SecGnbNGoZTsjJZ1FCjOlm0VoH/1DGLaVQXnsMQJOgaWW0ipnTBQfandJuG53bMb1srUWAS81aA+X4MxTuB6FDK4BVGqsQ2DaSTSVSDjtTlNPV2tnLo188Nfshrg+vsM5GAzjpSKTLhq3K2JfdpNvm7vstV4C6z6Jso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzlyUes4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8ECC4CED2;
	Sat, 11 Jan 2025 16:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736614486;
	bh=TXwe4AGMg500Pf5WQjlVnR7F8OrmQb4fx8CjlnXOJLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lzlyUes4Uxo1gym748nZVtJH5F7zmrErESGgmHgZ0xz43du3uHXxm9g+I+UOKJDHN
	 SmzN+dQwvfL3fniBovcojxAlK50TFn/6lCdpjdtWdgG3I+qodOp5y8LjoVQz4eLJkm
	 f4owKa03NxbdLQxy3E8vmVCYhX87+ESsIWE2ntPiETEC7K+hASfjEE4fO1vMiRl3qw
	 yc13aM/YS5XbSe4vfgeJGxf5TEW1qtvmPpGv8nDETB//Ei4tm0NeFbOHK0/zpv+vJi
	 vXjGbNbMRbJ1XbxI43FnZE0ANBhWqxUpLpAp8TECvyIA4cFFdYnF56buWx1g+OPnzg
	 FesxAi1dHszOA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 11 Jan 2025 17:54:19 +0100
Subject: [PATCH 2/2] arm64: dts: qcom: x1e80100: Set CPU interconnect paths
 as ACTIVE_ONLY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-topic-x1e_fixups-v1-2-77dc39237c12@oss.qualcomm.com>
References: <20250111-topic-x1e_fixups-v1-0-77dc39237c12@oss.qualcomm.com>
In-Reply-To: <20250111-topic-x1e_fixups-v1-0-77dc39237c12@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736614468; l=32489;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=FT00uvjAac7IQlMIZOFcdGaYBpLijEndzW+Vr4TlmuU=;
 b=7sMRuQkWy7H00r4jhtRk8Vg3lYosk6FkhPg1Y/wHmBMlbaxXYwYHbP1MSCZULO2juCFupZcT8
 8XcNB+1ZUpeD6lWmsDzmCWvwEUjsCxxDQpjacbSM1ppsmlBuMxZSAtU
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

There is no use wasting power on keeping the links between the CPU and
something else online when the CPUs are online. Change the interconnect
tag for such paths, so that RPMh is requested to automatically
clock-gate those when possible.

Keeping these paths online is also a potential power collapse blocker,
however this commit alone doesn't magically fix all the remaining
TODOs related to suspend.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 236 ++++++++++++++++-----------------
 1 file changed, 118 insertions(+), 118 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 4936fa5b98ff7a9a009e3106f4dba90131251971..9d38436763432892ceef95daf0335d4cf446357c 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -863,8 +863,8 @@ i2c16: i2c@880000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -899,8 +899,8 @@ spi16: spi@880000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -935,8 +935,8 @@ i2c17: i2c@884000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -971,8 +971,8 @@ spi17: spi@884000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1007,8 +1007,8 @@ i2c18: i2c@888000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1043,8 +1043,8 @@ spi18: spi@888000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1079,8 +1079,8 @@ i2c19: i2c@88c000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1115,8 +1115,8 @@ spi19: spi@88c000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1151,8 +1151,8 @@ i2c20: i2c@890000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1187,8 +1187,8 @@ spi20: spi@890000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1223,8 +1223,8 @@ i2c21: i2c@894000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1259,8 +1259,8 @@ spi21: spi@894000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1295,8 +1295,8 @@ uart21: serial@894000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 
@@ -1320,8 +1320,8 @@ i2c22: i2c@898000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1356,8 +1356,8 @@ spi22: spi@898000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1392,8 +1392,8 @@ i2c23: i2c@89c000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1428,8 +1428,8 @@ spi23: spi@89c000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1508,8 +1508,8 @@ i2c8: i2c@a80000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1544,8 +1544,8 @@ spi8: spi@a80000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1580,8 +1580,8 @@ i2c9: i2c@a84000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1616,8 +1616,8 @@ spi9: spi@a84000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1652,8 +1652,8 @@ i2c10: i2c@a88000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1688,8 +1688,8 @@ spi10: spi@a88000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1724,8 +1724,8 @@ i2c11: i2c@a8c000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1760,8 +1760,8 @@ spi11: spi@a8c000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1796,8 +1796,8 @@ i2c12: i2c@a90000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1832,8 +1832,8 @@ spi12: spi@a90000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1868,8 +1868,8 @@ i2c13: i2c@a94000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1904,8 +1904,8 @@ spi13: spi@a94000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1940,8 +1940,8 @@ i2c14: i2c@a98000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -1976,8 +1976,8 @@ spi14: spi@a98000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2012,8 +2012,8 @@ uart14: serial@a98000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 
@@ -2037,8 +2037,8 @@ i2c15: i2c@a9c000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2073,8 +2073,8 @@ spi15: spi@a9c000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2152,8 +2152,8 @@ i2c0: i2c@b80000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2188,8 +2188,8 @@ spi0: spi@b80000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2224,8 +2224,8 @@ i2c1: i2c@b84000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2260,8 +2260,8 @@ spi1: spi@b84000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2296,8 +2296,8 @@ i2c2: i2c@b88000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2332,8 +2332,8 @@ uart2: serial@b88000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core",
 						     "qup-config";
 
@@ -2357,8 +2357,8 @@ spi2: spi@b88000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2393,8 +2393,8 @@ i2c3: i2c@b8c000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2429,8 +2429,8 @@ spi3: spi@b8c000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2465,8 +2465,8 @@ i2c4: i2c@b90000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2501,8 +2501,8 @@ spi4: spi@b90000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2537,8 +2537,8 @@ i2c5: i2c@b94000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2573,8 +2573,8 @@ spi5: spi@b94000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2609,8 +2609,8 @@ i2c6: i2c@b98000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2645,8 +2645,8 @@ spi6: spi@b98000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2681,8 +2681,8 @@ i2c7: i2c@b9c000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -2717,8 +2717,8 @@ spi7: spi@b9c000 {
 
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core",
@@ -3194,8 +3194,8 @@ pcie3: pcie@1bd0000 {
 
 			interconnects = <&pcie_north_anoc MASTER_PCIE_3 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &cnoc_main SLAVE_PCIE_3 QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_PCIE_3 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "pcie-mem",
 					     "cpu-pcie";
 
@@ -3395,8 +3395,8 @@ pcie6a: pci@1bf8000 {
 
 			interconnects = <&pcie_south_anoc MASTER_PCIE_6A QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &cnoc_main SLAVE_PCIE_6A QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_PCIE_6A QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "pcie-mem",
 					     "cpu-pcie";
 
@@ -3522,8 +3522,8 @@ pcie5: pci@1c00000 {
 
 			interconnects = <&pcie_north_anoc MASTER_PCIE_5 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &cnoc_main SLAVE_PCIE_5 QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_PCIE_5 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "pcie-mem",
 					     "cpu-pcie";
 
@@ -3646,8 +3646,8 @@ pcie4: pci@1c08000 {
 
 			interconnects = <&pcie_north_anoc MASTER_PCIE_4 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &cnoc_main SLAVE_PCIE_4 QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_PCIE_4 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "pcie-mem",
 					     "cpu-pcie";
 
@@ -4694,8 +4694,8 @@ usb_1_ss2: usb@a0f8800 {
 
 			interconnects = <&usb_south_anoc MASTER_USB3_2 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_USB3_2 QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "usb-ddr",
 					     "apps-usb";
 
@@ -4794,8 +4794,8 @@ usb_2: usb@a2f8800 {
 
 			interconnects = <&usb_north_anoc MASTER_USB2 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "usb-ddr",
 					     "apps-usb";
 
@@ -4879,8 +4879,8 @@ usb_mp: usb@a4f8800 {
 
 			interconnects = <&usb_north_anoc MASTER_USB3_MP QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_USB3_MP QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_MP QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "usb-ddr",
 					     "apps-usb";
 
@@ -5053,8 +5053,8 @@ usb_1_ss1: usb@a8f8800 {
 
 			interconnects = <&usb_south_anoc MASTER_USB3_1 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_USB3_1 QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "usb-ddr",
 					     "apps-usb";
 

-- 
2.47.1


