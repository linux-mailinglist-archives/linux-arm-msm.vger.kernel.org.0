Return-Path: <linux-arm-msm+bounces-16551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3A089A129
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 17:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24414B25EBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 15:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674A016FF33;
	Fri,  5 Apr 2024 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="VSM3dqFM";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="Orq6cwdG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C366C171E57
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 15:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330969; cv=none; b=M0RvHhyGbqxqSjdzakItWwGTxOZaqzo4NZcmfPmA9F292TE1TdJpPaObr17j03jaBxzN97s2KSpwEG0UK9Q50pr1oTkOFVvYV16kFaMvlgVb7IV77bz0ShQ/qg4ntfh0vDaBkzoti+NmvAJaii0ujdFcVMKnrGExTvK5HFryRWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330969; c=relaxed/simple;
	bh=/85FrgtiGyeXI3NXKIEzWRrmclnbRTUZJ58KJVorq4k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=szZlX23xcKc5qncT2flx5csQD7JTAWiwvlpEFTl8udPWIToEXhohEo6WALFtMePx546k1zJSMdV7H4D6OA2j/MPdolUaXca8hoNQF2ud8brfEL09tdoNRZU+qgapRGjdQK2jHLotNFFF3hBPk+QCYxulLK0TAK+IyZyF1u0FKuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=VSM3dqFM; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=Orq6cwdG; arc=none smtp.client-ip=158.120.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rslV2-04gIYl-0v;
	Fri, 05 Apr 2024 15:29:04 +0000
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
Subject: [PATCH 3/6] arm64: dts: imx8mp-evk: remove tx-sched-sp property
Date: Fri,  5 Apr 2024 17:27:57 +0200
Message-Id: <20240405152800.638461-4-f.suligoi@asem.it>
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
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0558 (UTC) FILETIME=[FC56C160:01DA876D]
X-smtpcorp-track: 1rs_V204gmY_0v.EuMDjfTIexFrF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330945; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=oi48LbG1I/VP5W3WKG7O4Eeo5cePw11MKZR9VfWSCRk=;
 b=VSM3dqFMrtoBD4TjqRv8K5fTxb44wTPB8/qjf1F1d5Eju87RhPpTj2U6Vm3Drz2ZpXt6O
 OYJpfxddWJSXp9EfeMpwWZaxoegy1Zfc2XSszg7fW+GKS93LCPTiKtimGdS0xrWWb+aJcjN
 E4zGeRvlus4QTDaoNd3hLFk/z5wYLt9pgNqC6JiVTosfAyRV7hzzg9v5t/jR6vDvJaVEBsx
 ed+nro0WcklnZaZFI39gPVHul93V0VA5Mth2KZ6EMcOpK1/gonz2ftcEHoUm8q4WMFbAXj/
 bwt1DvObQPBs6MHhvvscicFaetlAEouIqsdXdCk4bLckXXX22UNIGv+eIOmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330945; h=from : subject : to
 : message-id : date; bh=oi48LbG1I/VP5W3WKG7O4Eeo5cePw11MKZR9VfWSCRk=;
 b=Orq6cwdGEcL3tsaomIIB6os9r5JC399o/9/SBbA9qpy4lS+aDWF/oRBIeiZ7uetNCzOLI
 0OEgIvtwTNz1OBXdeq2iZRyD9KDoCiw8RzcJnJhslKLbNiqz7Tp2x27p9FMiftgxXfIt+1S
 RXLjtCZJCmV4OFWH5Ybg313J1LF06gTm49R8Iv7DZ/GCjobDSQO6y7mJIN1VWZT8ftd3mcz
 tTsc9C+5YCnL1QS/Gx7v2a8pVtZ2PGVuvLEUu4TlE/eKQ8VLr3mXIjN4onDfetrCu+AiZvN
 8812Hho5z+9WXsPIK8IhrDnFEqXGhMkgpzFGo/3Fh4vVUA2tDMMCSwsidO8A==

The property "tx-sched-sp" no longer exists, as it was removed from the
file:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

by the commit:

commit aed6864035b1 ("net: stmmac: platform: Delete a redundant condition
branch")

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 8be5b2a57f27..bb1003363e3e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -251,7 +251,6 @@ ethphy0: ethernet-phy@1 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <5>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1


