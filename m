Return-Path: <linux-arm-msm+bounces-16548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEAA89A124
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 17:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72F7B1F24601
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 15:30:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C42217167A;
	Fri,  5 Apr 2024 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="YMH2uOJu";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="O+hRziHF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90C917164F
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330965; cv=none; b=q3CwLITcZ9Q9cw/GjQhiBcIvE25cWJTS85QIPzWiez4GE7+0aqkxf2ahtFMtEc4BKCfHzGwRjyp1XUG/Pc28LFMtGVIwbQFtYzOOuXFWhwDgBqmiuulPz5pLQ9ZcqZY//YH/VjGjeBH8qjUzfZqfJRuV2UZKd+K/jAk5BVZlZFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330965; c=relaxed/simple;
	bh=eTkke8cTaQuTil9Qf4Y1E+o+QFAi4UuM4kJMCq08Ef8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ax82gNExOPHAD4Qe9UlO2otKOPYMuuLBDgmd2pdks5EYYiZr43O7Z/+Wz9tTQgUxZ3HqBL/EKHxbqQnWz9cOxnQgujzZwZfBbyyVFmkfdS478XjEqtkjdolsE20/ORsd4bHIq+93pJJ0q9t/iP05UavaEti0TncY1408LSovYxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=YMH2uOJu; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=O+hRziHF; arc=none smtp.client-ip=158.120.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rslV1-04gIYl-2G;
	Fri, 05 Apr 2024 15:29:03 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.4169);
	 Fri, 5 Apr 2024 17:29:01 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH 2/6] arm64: dts: imx8mp-beacon: remove tx-sched-sp property
Date: Fri,  5 Apr 2024 17:27:56 +0200
Message-Id: <20240405152800.638461-3-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405152800.638461-1-f.suligoi@asem.it>
References: <20240405152800.638461-1-f.suligoi@asem.it>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0479 (UTC) FILETIME=[FC4AB370:01DA876D]
X-smtpcorp-track: 1rs_V104gmY_2G.Eui8jfSRrOLWE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330945; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=2+Mlo/B8JEt+9O2DNgOncVR4IzdOkeJ/dXwp0ZpjBmA=;
 b=YMH2uOJuKcpLj433qxeIZeUgokJ1uo+8BOxdjA/ZPwgweLHSumYO77hjZHFPb4xJSMoB5
 1pOsGXRfB8/JdTcHaL2VOwC9rkpl6PvZg5LPOwM9whDG3AoV6dW+RAElBg4e/fLzwehvl5H
 2oykClQ9cIXFPFEAAUPtLjS9DOuAQ/plArggnWER7epj1y2JIFGODboitlRpOhm9/EoRBKB
 GM3Iewwg7zEh8xBFOZkbjQpRIjLFlhra/MbKFEpXYi0IwlhBkYZWNFuMWSXplfmv6HD35Kt
 SjkGTrQOdX9dyzKGaDmXUFGJV+AkHP/6yXHjxK0yhvU/BGVz9vk5Lo78oAbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330945; h=from : subject : to
 : message-id : date; bh=2+Mlo/B8JEt+9O2DNgOncVR4IzdOkeJ/dXwp0ZpjBmA=;
 b=O+hRziHFk+r8XzkKSqCFsGe5sMyHGERNRI2IQJsy2C/T/yO2/eT2fLUeIQXb3CrZI2Smo
 oK7xyeprfynl3QPFYoBqJIKKN6IruOmRNaDeppqDXi6zQ6LsQfZlDeDaeorfRpAquUG1wVH
 RAx2LirVwklutCyMEu5EcjvzwWhVtFwvRuQ2OuWzGB7YypBuRSMPd2B8PwEaV5r8GJvyFbG
 tS11xFuwC6sXOcvgHnD5ILF8gTTZM+cXA/YEKOCX0MaBLsoIhBxt6F3kO28KfqtkrrFF4i8
 NHRzzL7bU8IvPEUyu1ynxjcdx/H7mhdJkqrdypdsQn2mJ4dC/oG5PJdc6q9Q==

The property "tx-sched-sp" no longer exists, as it was removed from the
file:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

by the commit:

commit aed6864035b1 ("net: stmmac: platform: Delete a redundant condition
branch")

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 8be251b69378..34339dc4a635 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -106,7 +106,6 @@ queue4 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <5>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1


