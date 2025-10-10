Return-Path: <linux-arm-msm+bounces-76817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB43BCE70E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 22:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 397A619A5DC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 20:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2799021CC55;
	Fri, 10 Oct 2025 20:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A70/x2nD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF14C1D86D6;
	Fri, 10 Oct 2025 20:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760126545; cv=none; b=DAIUmvOvNtFclFbeARLdqQpq25lQUO32OFoZw1L/K18HbR6wT1ms8ZVKKuQDpumx0VMDAEP8q08DTZqTJ0qxisqGgR13DrNy/knp5AJciBN/WSve08W/lMqlvK0BPApzN0XnOk0f5wCCx5E/CYic3AVhc1o+J6+vs8YTg9uFcq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760126545; c=relaxed/simple;
	bh=mQ/9VMvF6zOXhiLTogPFW/flktBJ9draVEmT3yKQ3OE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fGyU5snbi3q5+U9++4Y60R2C9O+9+9MBD//6kTPucjC5fPPgKV+hQy3yszWnDNt2Ha6Ik1x1SvknX+KrzJoduMigIqJiGTyfBfEXwux6d6zL2+OyCeIyWGmnn865p8+xkyaPRzc/fFfxN8trhIVWRto1Ulwe2abiUDjlca9LH54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A70/x2nD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB61CC4CEF1;
	Fri, 10 Oct 2025 20:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760126544;
	bh=mQ/9VMvF6zOXhiLTogPFW/flktBJ9draVEmT3yKQ3OE=;
	h=From:Date:Subject:To:Cc:From;
	b=A70/x2nD9FIL4094FrnWYnJUqX4bW4ppf6Zzwna7iZVvmgRFWPw+zjdbu0RMsjt4Y
	 ymuWrcsTZ5A9AGFuv84vOO0LBuHqSo5Nn9fFe4RNVs+hJ4wUf7/daeDD8mEacSoNxZ
	 oIY+YfPu6zlgtGvZUbCrtEL4NcFs12C4kLERduEfJJF7PW3y0bBFmFxKUgONVf661N
	 iwNY8WNlXVQ9YCqYBMhEEtZ8v8SVg3OHoDL1cl2xgJJ3iB1JEl1bkGq2yDps+9pkpE
	 wgOBtGM1lBwqk3I7F2K3aUAWnZy8hjbVX1moPoarS7xjiuOPpJ5HKsrws7BB1P+55y
	 QD1D/55jGUx2Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 10 Oct 2025 22:02:18 +0200
Subject: [PATCH] arm64: dts: qcom: x1e80100: Move CPU idle states to their
 respective PSCI PDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-topic-x1e_dt_idle-v1-1-b1c8d558e635@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAElm6WgC/x3MQQqAIBBA0avErBNGS6iuEiGlYw1EhUYE4t2Tl
 m/xf4JIgSnCUCUI9HDk8yiQdQV2m4+VBLtiUKi0RIniPi+24pVk3G3Y7SSwwd632uml6aB0VyD
 P7/8cp5w/T3Lk8mMAAAA=
X-Change-ID: 20251010-topic-x1e_dt_idle-0309f45d5b38
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760126541; l=5642;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=gGRDdmGRbPX60+lPVi1iCvjlDiMusDV4h8zXv075Au4=;
 b=3Eurktm8tc+mnx0XiBo335JzkDla0kd9AgRnbef8bQDAOx1Ftb6ADY2Ctp0HY56/Ssp4GBYDB
 lfxn8Wff8IsC0T07VBEGIdnetQI+lSBBYd8HkR6589xN7QQMz+skmk+
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

To make things uniform with other Qualcomm platforms, move the CPU idle
states under their PSCI power domains. No functional change.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Sorry if you received this twice, I pressed enter too fast before
fixing the subject and cancelled it at some point in the send-email
flow
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 51576d9c935d..6c50edcb3414 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -75,7 +75,6 @@ cpu0: cpu@0 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd0>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
-			cpu-idle-states = <&cluster_c4>;
 
 			l2_0: l2-cache {
 				compatible = "cache";
@@ -92,7 +91,6 @@ cpu1: cpu@100 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd1>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
-			cpu-idle-states = <&cluster_c4>;
 		};
 
 		cpu2: cpu@200 {
@@ -103,7 +101,6 @@ cpu2: cpu@200 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd2>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
-			cpu-idle-states = <&cluster_c4>;
 		};
 
 		cpu3: cpu@300 {
@@ -114,7 +111,6 @@ cpu3: cpu@300 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd3>, <&scmi_dvfs 0>;
 			power-domain-names = "psci", "perf";
-			cpu-idle-states = <&cluster_c4>;
 		};
 
 		cpu4: cpu@10000 {
@@ -125,7 +121,6 @@ cpu4: cpu@10000 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd4>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
-			cpu-idle-states = <&cluster_c4>;
 
 			l2_1: l2-cache {
 				compatible = "cache";
@@ -142,7 +137,6 @@ cpu5: cpu@10100 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd5>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
-			cpu-idle-states = <&cluster_c4>;
 		};
 
 		cpu6: cpu@10200 {
@@ -153,7 +147,6 @@ cpu6: cpu@10200 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd6>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
-			cpu-idle-states = <&cluster_c4>;
 		};
 
 		cpu7: cpu@10300 {
@@ -164,7 +157,6 @@ cpu7: cpu@10300 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd7>, <&scmi_dvfs 1>;
 			power-domain-names = "psci", "perf";
-			cpu-idle-states = <&cluster_c4>;
 		};
 
 		cpu8: cpu@20000 {
@@ -175,7 +167,6 @@ cpu8: cpu@20000 {
 			next-level-cache = <&l2_2>;
 			power-domains = <&cpu_pd8>, <&scmi_dvfs 2>;
 			power-domain-names = "psci", "perf";
-			cpu-idle-states = <&cluster_c4>;
 
 			l2_2: l2-cache {
 				compatible = "cache";
@@ -192,7 +183,6 @@ cpu9: cpu@20100 {
 			next-level-cache = <&l2_2>;
 			power-domains = <&cpu_pd9>, <&scmi_dvfs 2>;
 			power-domain-names = "psci", "perf";
-			cpu-idle-states = <&cluster_c4>;
 		};
 
 		cpu10: cpu@20200 {
@@ -203,7 +193,6 @@ cpu10: cpu@20200 {
 			next-level-cache = <&l2_2>;
 			power-domains = <&cpu_pd10>, <&scmi_dvfs 2>;
 			power-domain-names = "psci", "perf";
-			cpu-idle-states = <&cluster_c4>;
 		};
 
 		cpu11: cpu@20300 {
@@ -214,7 +203,6 @@ cpu11: cpu@20300 {
 			next-level-cache = <&l2_2>;
 			power-domains = <&cpu_pd11>, <&scmi_dvfs 2>;
 			power-domain-names = "psci", "perf";
-			cpu-idle-states = <&cluster_c4>;
 		};
 
 		cpu-map {
@@ -371,61 +359,73 @@ psci {
 		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd0>;
+			domain-idle-states = <&cluster_c4>;
 		};
 
 		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd0>;
+			domain-idle-states = <&cluster_c4>;
 		};
 
 		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd0>;
+			domain-idle-states = <&cluster_c4>;
 		};
 
 		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd0>;
+			domain-idle-states = <&cluster_c4>;
 		};
 
 		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd1>;
+			domain-idle-states = <&cluster_c4>;
 		};
 
 		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd1>;
+			domain-idle-states = <&cluster_c4>;
 		};
 
 		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd1>;
+			domain-idle-states = <&cluster_c4>;
 		};
 
 		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd1>;
+			domain-idle-states = <&cluster_c4>;
 		};
 
 		cpu_pd8: power-domain-cpu8 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd2>;
+			domain-idle-states = <&cluster_c4>;
 		};
 
 		cpu_pd9: power-domain-cpu9 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd2>;
+			domain-idle-states = <&cluster_c4>;
 		};
 
 		cpu_pd10: power-domain-cpu10 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd2>;
+			domain-idle-states = <&cluster_c4>;
 		};
 
 		cpu_pd11: power-domain-cpu11 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd2>;
+			domain-idle-states = <&cluster_c4>;
 		};
 
 		cluster_pd0: power-domain-cpu-cluster0 {

---
base-commit: 0b2f041c47acb45db82b4e847af6e17eb66cd32d
change-id: 20251010-topic-x1e_dt_idle-0309f45d5b38

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


