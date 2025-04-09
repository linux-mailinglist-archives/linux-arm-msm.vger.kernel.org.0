Return-Path: <linux-arm-msm+bounces-53736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60518A832C8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 22:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654F119E7F2E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 20:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877E8211278;
	Wed,  9 Apr 2025 20:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ij1rG687"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD25202C39;
	Wed,  9 Apr 2025 20:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231798; cv=none; b=kojdA1yqq+DefokNn/2ymi1xZqM6/IWreP4++gWcIdHArGlMiejJbKijAzeQumR9xMMfUau0dA2+h2olVnvsciPVNYIQDtnkGeexj78RFu8ayquoi9upHPj25966g5fc3STVoLKQNJYfQlpTG0jJC9hhvhs3jeyDNQU6CVKWusE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231798; c=relaxed/simple;
	bh=upxJCIerQNn+Pb4XOfmEnVDdSI9k3YpPcXbhGqc/rvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MaKuSWQ2Z2OUs+wmye4o8JUg1+9bWsKKBGH23FmHbtdm2liD0ToX8pLCxvmkNMUE7NAVrO/gOISJUUCLoMCIDmLXrvSZ0sioDUaYfi+avZXI3WDThKuSYdUKlfvfRynHROCvPj9ba2y519meoR0Wk1swLYKlSX4DvDJqmy/oMNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ij1rG687; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DAC1C4CEE2;
	Wed,  9 Apr 2025 20:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744231796;
	bh=upxJCIerQNn+Pb4XOfmEnVDdSI9k3YpPcXbhGqc/rvA=;
	h=From:To:Cc:Subject:Date:From;
	b=ij1rG687XeqKDxUahbHUYaXslHmmmsBtkH8pi6W3fzvWLSLz8zAPefSB5+noeB55I
	 iTEnZtzdIJyvJ4UbTwQG5SeAtgwskae6WEXP161PXOincklayrdRehLtpoUrAvakSq
	 OiSwamawFFQ+wyhOTrcVla+Nr9Xcc+eGOCBAp95c55eaHE+z9086BDc9FEued3lWtY
	 f9FwPfn7C+7OJ7ayy/6rlSJ3tyk+v855DyBZTjix0euyHUByhMTQ+dewLSJuY6v1cy
	 PR8bBDN5sBU5NDQy8QkRVrF16xFe+nomrc9G/69RXUxBfIpm3164++hl1VqHSp2ZcF
	 3W+y0BKih9Tig==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: Drop undocumented "clock-names" for parade,ps8830
Date: Wed,  9 Apr 2025 15:49:49 -0500
Message-ID: <20250409204950.1521733-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove "clock-names" as it is not defined for the parade,ps8830 binding.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts             | 3 ---
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts    | 2 --
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 -
 3 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 5e3970b26e2f..335b0fa174f0 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -777,7 +777,6 @@ typec-mux@8 {
 		reg = <0x08>;
 
 		clocks = <&rpmhcc RPMH_RF_CLK5>;
-		clock-names = "xo";
 
 		vdd-supply = <&vreg_rtmr2_1p15>;
 		vdd33-supply = <&vreg_rtmr2_3p3>;
@@ -832,7 +831,6 @@ typec-mux@8 {
 		reg = <0x08>;
 
 		clocks = <&rpmhcc RPMH_RF_CLK3>;
-		clock-names = "xo";
 
 		vdd-supply = <&vreg_rtmr0_1p15>;
 		vdd33-supply = <&vreg_rtmr0_3p3>;
@@ -887,7 +885,6 @@ typec-mux@8 {
 		reg = <0x8>;
 
 		clocks = <&rpmhcc RPMH_RF_CLK4>;
-		clock-names = "xo";
 
 		vdd-supply = <&vreg_rtmr1_1p15>;
 		vdd33-supply = <&vreg_rtmr1_3p3>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index 86e87f03b0ec..6dc898844cca 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -612,7 +612,6 @@ typec-mux@8 {
 		reg = <0x08>;
 
 		clocks = <&rpmhcc RPMH_RF_CLK3>;
-		clock-names = "xo";
 
 		vdd-supply = <&vreg_rtmr0_1p15>;
 		vdd33-supply = <&vreg_rtmr0_3p3>;
@@ -676,7 +675,6 @@ typec-mux@8 {
 		reg = <0x8>;
 
 		clocks = <&rpmhcc RPMH_RF_CLK4>;
-		clock-names = "xo";
 
 		vdd-supply = <&vreg_rtmr1_1p15>;
 		vdd33-supply = <&vreg_rtmr1_3p3>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 5867953c7356..3949b17353e7 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -792,7 +792,6 @@ typec-mux@8 {
 		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
 
 		clocks = <&rpmhcc RPMH_RF_CLK3>;
-		clock-names = "xo";
 
 		vdd-supply = <&vreg_rtmr0_1p15>;
 		vdd33-supply = <&vreg_rtmr0_3p3>;
-- 
2.47.2


