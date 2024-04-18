Return-Path: <linux-arm-msm+bounces-17849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0EA8A99D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 14:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9B5228160D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 12:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82CCE16130A;
	Thu, 18 Apr 2024 12:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="FPpR68fG";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="lb8KLTx3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from e3i51.smtp2go.com (e3i51.smtp2go.com [158.120.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DBB1607BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 12:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713443377; cv=none; b=VP+ZXC4GD2DGzrnghxzLUz6EoQB5XOkQXBV85WX2ZKiMWIZlJh9HQusNi6uFVOFlxn5Qkor9l0QMklff9Ff7ixDbWDejxiQd4nLDNYRFUhZpk5c/MgwWWgbJo2RzNm/+CO1XURm0DAYCml8bi1uKWD4iAWPFdYipUKX8XPU77AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713443377; c=relaxed/simple;
	bh=NL31cErW6LI9swDiDlefCuluc3s0/yO0eHrCdufFRzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SKsMoYpxo6KT9xp/rDGSKiXiSqC1r/dvIW+UupHEdljHBEdjFkMCmGQ+VYO452oeWFZs9vNaq9fCde5uIrEO/cfqFTZfPt97ZYrx+pQ5datsDXocR/S1b/Eqo+yqYgZf61CDVzvsqFhitGe3CeEGDSdJbKTKFcRhzh0SOze8ztw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=FPpR68fG; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=lb8KLTx3; arc=none smtp.client-ip=158.120.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rxQtJ-wSFvR6-13;
	Thu, 18 Apr 2024 12:29:25 +0000
Received: from flavio-x.asem.intra ([172.16.18.47]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 18 Apr 2024 14:29:23 +0200
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
	Flavio Suligoi <f.suligoi@asem.it>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 1/5] arm64: dts: freescale: imx8mp-beacon: remove tx-sched-sp property
Date: Thu, 18 Apr 2024 14:28:55 +0200
Message-Id: <20240418122859.2079099-2-f.suligoi@asem.it>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240418122859.2079099-1-f.suligoi@asem.it>
References: <20240418122859.2079099-1-f.suligoi@asem.it>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 18 Apr 2024 12:29:23.0610 (UTC) FILETIME=[0B8D27A0:01DA918C]
X-smtpcorp-track: 1rxQtJwSFvR613.mcmXue4LbgI6G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1713443367; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=beW9HQTGOr0BFT9gN6HwTnSdPZIL/FVSpOfiqm6uGb4=;
 b=FPpR68fGd3IW8k7CavcfP4fxzVNzoubrPTBU/kfIfz2BRhuniq9S38mjP31GJf3sNa+vZ
 cESa9Veq3ykx8qBNa2G/E/hkP6BSOpRH4Vk1MPbjxHdDvjX0AiVZR2A6/GSF9H9kRMTV2hS
 nnSNBHVRegx/n41gtjBTxLLPxoWo/B+b5SaZcyH0eFM2BYqCGGwbzLOGaXotBhKTqybsqaZ
 uvvvvT6pk1RFfUQg+J7K/PPDNrvddHaXl3EC3RmB0p1KiV2aFiatCV4Z8DVWo5MSUDyAENK
 KQArwDtInDFJdFQSQ+SPeYei04dlbIko3+zPeDutqEvNlNJ5Y+2H+Z+rrvVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1713443367; h=from : subject : to
 : message-id : date; bh=beW9HQTGOr0BFT9gN6HwTnSdPZIL/FVSpOfiqm6uGb4=;
 b=lb8KLTx39E97sb8t6hr0Qwyr5m/N+RBxt9fe+FUa9HKtSmXcn2N+SykvK6ehEu8CQ7pRO
 rKUULHCITUI4QwxGpumXb188dqs1+gucNpFpT/JrIEHFq8SgtB2AFGhYYKfOtgQd57t+pZo
 ammkzSjAoulQMtTdo8/8/QV6Q2+xQfA04ALdnOK/mNpVONgkypSnj7oXRcWRzdqx5QBTTK5
 llk8awDZlqjn92gAsIhIGM46qhdxbzhLW4jzCgDJsOpX/iXKtetxQRFovl9RkXIpn1aom7p
 8a3vaS8bwA91lNfc6vImFFqHlfEREJH9shlX1Bhk/KuhvbPVr7TEwJlipm+Q==

Strict priority for the tx scheduler is by default in Linux driver, so the
tx-sched-sp property was removed in commit aed6864035b1 ("net: stmmac:
platform: Delete a redundant condition branch").

So we can safely remove this property from this device-tree.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
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


