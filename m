Return-Path: <linux-arm-msm+bounces-16546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C6689A114
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 17:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 290BC286780
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Apr 2024 15:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F5AF16FF29;
	Fri,  5 Apr 2024 15:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="T399xN7J";
	dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b="PamySyuJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from e3i57.smtp2go.com (e3i57.smtp2go.com [158.120.84.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E2D16F90D
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Apr 2024 15:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712330952; cv=none; b=PtHyvx7VAttQJenkfmycxDAfO/dc+FpnI2Mb30XrxbAzwqNWdzdrB3bGswAPi5EPUD0Lhs27RhjDtl6gq9EpdAEEsoJbVbOEVG95ELQGY0RB7KYhv7h2tBYu2vTdxCMZ+8aFzAI+RfyX0Z8OVBPb+iLWivHntUZhw3CghgGMcnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712330952; c=relaxed/simple;
	bh=4qwJYpjiE6fWwx3p9TfXqvaGfWov9YXj6SAWVJ99Sgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uRI8zKOUtbIx6qitYZjbEyJKyvNd2MmzPTyX1eIgPsF9jLLMDayLA46/CP6u52GBahYKTvTJl2tMbzTNYt8Dhmm7sDYfi4IVSSK+ORar8LAE1Z66d291CyTiWLWbTM7wnlud60Ff74GYiGErGxamBpalwC6DjXNrIz6mhXjEdGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it; spf=pass smtp.mailfrom=em1174574.asem.it; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=T399xN7J; dkim=pass (2048-bit key) header.d=asem.it header.i=@asem.it header.b=PamySyuJ; arc=none smtp.client-ip=158.120.84.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asem.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174574.asem.it
Received: from [10.86.249.198] (helo=asas054.asem.intra)
	by smtpcorp.com with esmtpa (Exim 4.96.1-S2G)
	(envelope-from <f.suligoi@asem.it>)
	id 1rslV1-04gIYl-0L;
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
Subject: [PATCH 1/6] dt-bindings: net: snps,dwmac: remove tx-sched-sp property
Date: Fri,  5 Apr 2024 17:27:55 +0200
Message-Id: <20240405152800.638461-2-f.suligoi@asem.it>
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
X-OriginalArrivalTime: 05 Apr 2024 15:29:01.0385 (UTC) FILETIME=[FC3C5B90:01DA876D]
X-smtpcorp-track: 1rs_V104gmY_0L.Eui8jfSR887_f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1712330944; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe;
 bh=5jJHGZta+4HpJK5sG35qXkW6G+1lFaAs7ITAMPwZI1s=;
 b=T399xN7JcuGDMJTXSxO+k+fKUK2GcqJZTvKFNCwZPq+tEVAQxIEl+QZwHkT6IQ81Z/v3V
 kxzUK9n0GYpDkc28gBxmXHQFXjq7oLMKir5mliHuaI/fsrtQEiRDLPE1BCoHaC8/a4I4rV2
 zHMhGYAxM+ozdS4HCPhPyDxP8o6KhBSAPEbmA8exS5Vt7MFNCfL7yGKsNfqA88xU8r5G97q
 GJ4XEJm6ArQUgBZzJ8KvOmdoOJkCwSdQjljSvgOSMDu95OZlAoa0/9Ep08QemDE2/0KVOsP
 EGRrjbHvWLJQD8bq60jP+wzzyGwXZV4BpBTYWPnDeAcr63l/gWjlHuiJDprw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it;
 i=@asem.it; q=dns/txt; s=s1174574; t=1712330944; h=from : subject : to
 : message-id : date; bh=5jJHGZta+4HpJK5sG35qXkW6G+1lFaAs7ITAMPwZI1s=;
 b=PamySyuJIONXOv4K4Ic1UV258nObi+3vVPH3HHrsvCzvu/kCGOfkbp769VuM9V72WYvOk
 Bj4VcdCpURakZVpCKAN5d+7TD0a1YldTxUxqVUIxVo0pw9MnZW6jV3FjqmXAAO+6ObHifvp
 eu0beg4Qk4jpL9j0EjlKAvXVNSNEdO2Obua7Je9b0tSS24zlAE9lmi60SC0YKwS6XGbCw7W
 h9RmWpNGc8SNMn8qdiUfo2Pot/1nK32RV+0JDte7Z3tkrUsG0ZX2WuKlmUpobCKtDQeEkuO
 1X6ypvjRO3UsLOzJX3yUCSvTUChMNpHylXOcWNJ0Tekco6RsiKgoDnwSv16w==

The property "tx-sched-sp" no longer exists, as it was removed from the
file:

drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c

by the commit:

commit aed6864035b1 ("net: stmmac: platform: Delete a redundant condition
branch")

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---
 .../devicetree/bindings/net/snps,dwmac.yaml        | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 15073627c53a..21cc27e75f50 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -328,9 +328,6 @@ properties:
       snps,tx-sched-dwrr:
         type: boolean
         description: Deficit Weighted Round Robin
-      snps,tx-sched-sp:
-        type: boolean
-        description: Strict priority
     allOf:
       - if:
           required:
@@ -339,7 +336,6 @@ properties:
           properties:
             snps,tx-sched-wfq: false
             snps,tx-sched-dwrr: false
-            snps,tx-sched-sp: false
       - if:
           required:
             - snps,tx-sched-wfq
@@ -347,7 +343,6 @@ properties:
           properties:
             snps,tx-sched-wrr: false
             snps,tx-sched-dwrr: false
-            snps,tx-sched-sp: false
       - if:
           required:
             - snps,tx-sched-dwrr
@@ -355,15 +350,6 @@ properties:
           properties:
             snps,tx-sched-wrr: false
             snps,tx-sched-wfq: false
-            snps,tx-sched-sp: false
-      - if:
-          required:
-            - snps,tx-sched-sp
-        then:
-          properties:
-            snps,tx-sched-wrr: false
-            snps,tx-sched-wfq: false
-            snps,tx-sched-dwrr: false
     patternProperties:
       "^queue[0-9]$":
         description: Each subnode represents a queue.
-- 
2.34.1


