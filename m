Return-Path: <linux-arm-msm+bounces-17848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 766208A99D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 14:30:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1551D1F21C14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 12:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D52160887;
	Thu, 18 Apr 2024 12:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="2qaVtIMS";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="CXp0RPkO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from e3i51.smtp2go.com (e3i51.smtp2go.com [158.120.84.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB7D16079C
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713443376; cv=none; b=t77DFv4VWIHQ6IzIf4KqOIpu5/KL1VKciAQrxP8GvwcmQ4F1taYp5ErUYbe3UENi54QFc8is7AyKh6mN+SrZa6wPI5FWoQ0OTbUWfwowt8DEqrTk178Lw0X6TByGcIFKkJB37sLLLY4AMtpPjb6qLJMj1H3jPtyUkQq7BQqJpeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713443376; c=relaxed/simple;
	bh=7YaaphZZMBLHKh0x7dUPDPqq2nvh8VeZ8PMGp6jM9vA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DmCX4E1jj2XHeO2PFmejUIjGDA3oXSswaaFDLv7C+1BT8AzzY/guz6GCoHKLZ24KstB0PMZh+Gz6gomhI6xDRMHDcI/o4crYwyRs/q2XwVDoc4uja514MtDBhlZugRJzAWdaPBUlqhf/DsM5sMRFyjND5jacVHFsz4mUbTBJyVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=2qaVtIMS; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=CXp0RPkO; arc=none smtp.client-ip=158.120.84.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rxQtK-wSFvR6-1O;
	Thu, 18 Apr 2024 12:29:26 +0000
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
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx8mp-verdin: remove tx-sched-sp property
Date: Thu, 18 Apr 2024 14:28:57 +0200
Message-Id: <20240418122859.2079099-4-f.suligoi@asem.it>
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
X-OriginalArrivalTime: 18 Apr 2024 12:29:23.0767 (UTC) FILETIME=[0BA51C70:01DA918C]
X-smtpcorp-track: 1rxQtKwSFvR61O.mcm_ue4mZclHu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1713443368; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=xB6lptXkbDQjGZizWOcUacyiIPjTOrnbOEU8DAe0Dnc=;
 b=2qaVtIMSc//8O8/kfQkazDo/Ly5OKc2D4smH6N7UK2pKFWaoBpE20QPX7ECdDhYWmynYZ
 AUpVnDFCTMfGmFvg6ssRMlew+hiOq67izdbDC7czbpIefaDhjXaFcb8ySOQ7UnJr6fRxugY
 rAtRim20n2dUsdiLkzl/R43tUKtJgLtW+hltrHkT0/RcbyUbrUwtr8JYzbfYogWdOuKjqOK
 4FEJfZ6mkp4zoB4OIDVcdzK16WE73jEjBVpUuZUIYPMmLF/SOq7d9Y/UW+ISU2b5n1NAnLq
 3rwSoVqEbEXfIYkGKakD38nR1FXA0T+78pOh8U7NBnAlLufLooYCRPjO1bHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1713443368; h=from : subject : to
 : message-id : date; bh=xB6lptXkbDQjGZizWOcUacyiIPjTOrnbOEU8DAe0Dnc=;
 b=CXp0RPkO/tupCCZs2L5g9FWimVcXBjaMaXgnZk/QsscnjqUATZr415ZNZTuha4JK5YBAB
 ouqoebG4PR2HL2Ck4Eysj25z18KnqkRPuQFkZ2ZvBaDHExdSI+iP5X5F4P/rGuo653AlnxU
 mq0+jOFWIdWMHlLSSwLTG3ApcVoY0cMDOYUiTMVGr/PHV4WGVnxWAUMAOyNuE34MxJi0S4R
 /zPWqKTT+6tHGK5Hgwp6xOCbWIzX/CCsK+qeOvayl4aN4mgz3CYlW2uXyLGbTeq9Y6IVx/5
 1ElwlFQt853Xspn4X7GKDPF6M0fBHafO/FWBkAdYDBsnNgidEeMqNocELEtQ==

Strict priority for the tx scheduler is by default in Linux driver, so the
tx-sched-sp property was removed in commit aed6864035b1 ("net: stmmac:
platform: Delete a redundant condition branch").

So we can safely remove this property from this device-tree.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index faa17cbbe2fd..21d4b6a9a1af 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -260,7 +260,6 @@ queue4 {
 
 	mtl_tx_setup: tx-queues-config {
 		snps,tx-queues-to-use = <5>;
-		snps,tx-sched-sp;
 
 		queue0 {
 			snps,dcb-algorithm;
-- 
2.34.1


