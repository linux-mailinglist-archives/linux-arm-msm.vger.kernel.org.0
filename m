Return-Path: <linux-arm-msm+bounces-35772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DA89AF821
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 05:24:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2F33B21945
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 03:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5677218B467;
	Fri, 25 Oct 2024 03:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jia.je header.i=@jia.je header.b="iMJhITyj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7513C0B;
	Fri, 25 Oct 2024 03:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.82.102.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729826671; cv=none; b=I4rQG46LLnxJ9Ln7888kkZnJKbKnH4pkVtvEHobVuUBVrc5dkvNHmOHAuGr0Pssp86gICZLH9TvD9AZ/JQ9AoUg0Cd4JBH/eKyd+N0ROlqhW9G7enXHXOXFDkKjq6N6CtE8h2AfR2udfLiXyPVx1HQzaCDLCzdEiC+1BanzFlEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729826671; c=relaxed/simple;
	bh=5B5yHEqRYZvOF0oOdUTY0HcCuT4zGt0F0ZnfEylnR0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hWW9OenUwLmpxKkniyApCBrzPtI6kErBhUJJbVQC4PA0rWtKvB8gvBcMi8pokv+Pb0VuRWeDGU3jrTxXA/x64WzTV+wResGhHtFTmczITr3bPjI3jd15VYiepRY/UnHGgOiMvKefy/c6JFAI8KU/ANJDXj1IAz6CuSU+6CEPfUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jia.je; spf=pass smtp.mailfrom=jia.je; dkim=pass (1024-bit key) header.d=jia.je header.i=@jia.je header.b=iMJhITyj; arc=none smtp.client-ip=35.82.102.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=jia.je
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jia.je
Received: from surface.. (unknown [36.112.207.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: c@jia.je)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id EF92B4761A;
	Fri, 25 Oct 2024 03:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jia.je; s=default;
	t=1729826097; bh=Munf2DdvvJ419IY4CNm4OcZuDK3up+bIQf1SAwyAKRA=;
	h=From:To:Cc:Subject:Date;
	b=iMJhITyjGOqPxQpcE/nmSM9THIII7ecoCmmN/7I2KPLo93EuFZ1xaGGk4Owg3G7Ih
	 ddXwQWLQ232HQtrFtvqyceZlPPky8rxuc+S3csoow3Gt354kjaOnCqd94sLcuOhJpk
	 ZDWYKERZ5o5+cXOIYp0UUzFNVS7m79SLNjn1iF18=
From: Jiajie Chen <c@jia.je>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: c@jia.je
Subject: [PATCH] arm64: dts: qcom: x1e80100: Add performance hint for boost clock
Date: Fri, 25 Oct 2024 11:12:58 +0800
Message-ID: <20241025031257.6284-2-c@jia.je>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The x1e80100 CPU can have up to two cores running at 4.0 GHz, with one
core in the second cluster (cores 4-7) and the other in the third
cluster (cores 8-11). However, the scheduler is currently unaware of
this, leading to scenarios where a single core benchmark might run at
3.4 GHz when scheduled to the first cluster.

This patch introduces capacity-dmips-mhz nodes to each CPU node in the
DTS. For cores numbered 4 and 8, the capacities are set to 1200, while
others are set to 1024. This ensures that the two cores can be
prioritized for scheduling. The value 1200 is derived from approximately
`1024/3.4*4.0`.

Note that capacity-dmips-mhz is not ideally suited for this purpose, as
it was designed to differentiate between performance and efficient
cores, not for core boosting. According to its definition, DMIPS/MHz
actually decreases with higher frequencies. However, since the CPU does
not support AMU, and no elegant solution was found, this approach is
used as a workaround.

With this patch, we observe two cores running at full 4.0 GHz without
core binding. The single core score of Geekbench 6 increases from 2452
to 2892, both without core binding. Tested on Surface Laptop 7.

Signed-off-by: Jiajie Chen <c@jia.je>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index cd732ef88cd8..c9c559d956c2 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -69,6 +69,7 @@ CPU0: cpu@0 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_0>;
 			power-domains = <&CPU_PD0>;
 			power-domain-names = "psci";
@@ -86,6 +87,7 @@ CPU1: cpu@100 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_0>;
 			power-domains = <&CPU_PD1>;
 			power-domain-names = "psci";
@@ -97,6 +99,7 @@ CPU2: cpu@200 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_0>;
 			power-domains = <&CPU_PD2>;
 			power-domain-names = "psci";
@@ -108,6 +111,7 @@ CPU3: cpu@300 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_0>;
 			power-domains = <&CPU_PD3>;
 			power-domain-names = "psci";
@@ -119,6 +123,7 @@ CPU4: cpu@10000 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1200>;
 			next-level-cache = <&L2_1>;
 			power-domains = <&CPU_PD4>;
 			power-domain-names = "psci";
@@ -136,6 +141,7 @@ CPU5: cpu@10100 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_1>;
 			power-domains = <&CPU_PD5>;
 			power-domain-names = "psci";
@@ -147,6 +153,7 @@ CPU6: cpu@10200 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10200>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_1>;
 			power-domains = <&CPU_PD6>;
 			power-domain-names = "psci";
@@ -158,6 +165,7 @@ CPU7: cpu@10300 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10300>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_1>;
 			power-domains = <&CPU_PD7>;
 			power-domain-names = "psci";
@@ -169,6 +177,7 @@ CPU8: cpu@20000 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20000>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1200>;
 			next-level-cache = <&L2_2>;
 			power-domains = <&CPU_PD8>;
 			power-domain-names = "psci";
@@ -186,6 +195,7 @@ CPU9: cpu@20100 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20100>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_2>;
 			power-domains = <&CPU_PD9>;
 			power-domain-names = "psci";
@@ -197,6 +207,7 @@ CPU10: cpu@20200 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20200>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_2>;
 			power-domains = <&CPU_PD10>;
 			power-domain-names = "psci";
@@ -208,6 +219,7 @@ CPU11: cpu@20300 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20300>;
 			enable-method = "psci";
+			capacity-dmips-mhz = <1024>;
 			next-level-cache = <&L2_2>;
 			power-domains = <&CPU_PD11>;
 			power-domain-names = "psci";
-- 
2.45.2


