Return-Path: <linux-arm-msm+bounces-34354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A1699D482
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 18:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0B1AB23C75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 16:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD97C1AC8A2;
	Mon, 14 Oct 2024 16:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzF7WqaL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD941AB6E6;
	Mon, 14 Oct 2024 16:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728922830; cv=none; b=bFPGyoeDySlV7Ay1WVw29OQk5krAsk+fCgDZOwOPVQY7hQXLhoPGsvu0AOJ/1HEVlYQTKMbtHhZAa/gUA8XrBrGhhHUY+9hf1N6nycNnZzmQciJP68CMY7cscbp05GOfwzeko7D19BUSD89Ro9zlg/HC5+ZUHG/w/mQ9BklfX2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728922830; c=relaxed/simple;
	bh=/CARQhPqBaW4+V9x4ApINwn61E3dQZeQA7x8Xarx6Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C4E2VX6Qjnb0nhVEDTtx0TW6Vnt9GG0QE8HCR883sKuCXj6LFHKwJw//UyVaDKhkpHm/5wPSOYBIQXiBp5bPyZ0mXmcTA1yPuv3OUPiFoE1ZVrEdIM6DqRkh1f6ddMNDPAeBrp0g6ffDyMIf6QwoPmN+AqHRQq6H+h0QNehi54U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzF7WqaL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093C5C4CEC3;
	Mon, 14 Oct 2024 16:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728922830;
	bh=/CARQhPqBaW4+V9x4ApINwn61E3dQZeQA7x8Xarx6Kg=;
	h=From:To:Cc:Subject:Date:From;
	b=DzF7WqaLR2VUgTvY5eKGGRxAkVsiZKOTrWQhfIK/HdIimOGOZeT9wrY4QdWKG42AW
	 T3/AcWgTgAhsbMtyQyX4iLdMM0137DZP4H36c0a6Nf1wG+1pxhwFcNKsDBXDMIb/uG
	 dtkZZuRW4XoEYVrC0G76Laf9iWw5LTyLDVMMIF/Bcf93aRAUt2t7+UVioMT9XPEmcB
	 AflYU0IQKhaFMS7Q7BbknRkrH3LmG3Yojy7uYJbcxvYCPhVjj2WI51LgjASarNhldd
	 PE4S2R4lYd6ZnjrUuz3DNvdFPYfSmPfogIm/tKA0MdrEABnsGRAsjyxt1Fr7WXMDpQ
	 /arce2KKDfm+A==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: cros-qcom-dts-watchers@chromium.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: Drop undocumented domain "idle-state-name"
Date: Mon, 14 Oct 2024 11:16:32 -0500
Message-ID: <20241014161631.1527918-2-robh@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"idle-state-name" is not a valid property for "domain-idle-state"
binding, so drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Alternatively, the property could be added to the binding. In that case, 
the 2 idle state bindings should be refactored with the common 
properties factored out. Since no one seems to have cared despite 
reported warnings on every new board of these platforms, I don't either 
and went with the simple change.

 arch/arm64/boot/dts/qcom/sc7180.dtsi   | 3 ---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 2 --
 2 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index b5ebf8980325..dec25a0d9057 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -357,7 +357,6 @@ BIG_CPU_SLEEP_1: cpu-sleep-1-1 {
 		domain_idle_states: domain-idle-states {
 			CLUSTER_SLEEP_PC: cluster-sleep-0 {
 				compatible = "domain-idle-state";
-				idle-state-name = "cluster-l3-power-collapse";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <3048>;
@@ -366,7 +365,6 @@ CLUSTER_SLEEP_PC: cluster-sleep-0 {
 
 			CLUSTER_SLEEP_CX_RET: cluster-sleep-1 {
 				compatible = "domain-idle-state";
-				idle-state-name = "cluster-cx-retention";
 				arm,psci-suspend-param = <0x41001244>;
 				entry-latency-us = <3638>;
 				exit-latency-us = <4562>;
@@ -375,7 +373,6 @@ CLUSTER_SLEEP_CX_RET: cluster-sleep-1 {
 
 			CLUSTER_AOSS_SLEEP: cluster-sleep-2 {
 				compatible = "domain-idle-state";
-				idle-state-name = "cluster-power-down";
 				arm,psci-suspend-param = <0x4100b244>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index a36076e3c56b..847d6bc39edd 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -287,7 +287,6 @@ CLUSTER_C4: cpu-sleep-0 {
 		domain-idle-states {
 			CLUSTER_CL4: cluster-sleep-0 {
 				compatible = "domain-idle-state";
-				idle-state-name = "l2-ret";
 				arm,psci-suspend-param = <0x01000044>;
 				entry-latency-us = <350>;
 				exit-latency-us = <500>;
@@ -296,7 +295,6 @@ CLUSTER_CL4: cluster-sleep-0 {
 
 			CLUSTER_CL5: cluster-sleep-1 {
 				compatible = "domain-idle-state";
-				idle-state-name = "ret-pll-off";
 				arm,psci-suspend-param = <0x01000054>;
 				entry-latency-us = <2200>;
 				exit-latency-us = <2500>;
-- 
2.45.2


