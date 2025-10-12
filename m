Return-Path: <linux-arm-msm+bounces-76871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EACA1BD0D5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 01:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E514F1892C47
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Oct 2025 23:01:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568FB2701C0;
	Sun, 12 Oct 2025 23:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="d7BEYUEs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3007026E712;
	Sun, 12 Oct 2025 23:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760310038; cv=none; b=uDqlrXsV+bBUBrNs+mGoyS5iNSTRX8ee6T4kP9Ai0T10GVuUtlGsanr2Bnk0IMfrC0c0neTKovhBkY4CpAkUxaeBTJ9G3Pl4peIPXmcMchfO7llNmR5fX/Pj/nJNyCtyZ/Qo0bf/T0pqVc97cXevnHYUZqqh6vKuNp8MIov1adg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760310038; c=relaxed/simple;
	bh=xBxOL6GSKm0r8z1iwoA7xEGS2FmKZDzoECqzDmPVf3o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nRXwL+qXTiWfAFEZcAcUyYQNnTnUAA7cMFurko/WMyNUyeRGgZYsZPv/exKdvcxxd5VweLq716yRnYVR3u3ZrLcYkXL4z4qNp2Z5bzgQT5SMiLl+8LBMeBgb1EPKTOWKgURfq9UZmQykyJlE5GmEBoOFX7bldLUYE783U4gqXiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=d7BEYUEs; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1760310023;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qIoVkGj2UHyWzPI843jLHd2BzKmlHU2zQ8mu8tlxYAE=;
	b=d7BEYUEsstX8rorULLNw/MCWuvPOTUiNIZwd6jbMbHJ8rAMfCCtPTIEloF5J1u0dKkg0SO
	DD8VpHwX6Km98cF554Y79U8az/OTHUi+4D8NtoLh/J2DoYUiLezgNYk45eSCL9pqacZsoS
	XDH3neFtSuGJR15qalzfg60JdE4G4rd+9eErRHTyNabgp+2gR/jKQg5a3QHQwMeHWN3Ovt
	YmzEDta6g6uXoNsdTdygqlA2vRhIQlrOodG5H75HbPEv6WvnAHodPfBJED0j+P4+gFtT3/
	X935d7EXHw8sI9iGq9Tzpy3BB6R7T5xyxkIGpdwirYWbPTGv1LwFb0mrd1hxFQ==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: x1e80100: add system power domain SS3 state
Date: Sun, 12 Oct 2025 19:54:12 -0300
Message-ID: <20251012225950.15475-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add the same PSCI state as seen on other Oryon-based SoCs like SM8750
and Glymur, seems to work fine on Hamoa as well.

Signed-off-by: Val Packett <val@packett.cool>
---
Tested on a Dell Latitude 7455:

/sys/kernel/debug/pm_genpd/power-domain-system/idle_states:
State          Time Spent(ms) Usage      Rejected   Above      Below
S0             69476          23006      195        21562      0

Seems to mostly be used in system suspend, though I've occasionally seen
the counter increment a little bit during runtime as well.
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 3cf2568def3f..fab8104147bd 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -303,6 +303,14 @@ cluster_cl5: cluster-sleep-1 {
 				exit-latency-us = <4000>;
 				min-residency-us = <7000>;
 			};
+
+			domain_ss3: domain-sleep-0 {
+				compatible = "domain-idle-state";
+				arm,psci-suspend-param = <0x0200c354>;
+				entry-latency-us = <2800>;
+				exit-latency-us = <4400>;
+				min-residency-us = <10150>;
+			};
 		};
 	};
 
@@ -449,7 +457,7 @@ cluster_pd2: power-domain-cpu-cluster2 {
 
 		system_pd: power-domain-system {
 			#power-domain-cells = <0>;
-			/* TODO: system-wide idle states */
+			domain-idle-states = <&domain_ss3>;
 		};
 	};
 
-- 
2.51.0


