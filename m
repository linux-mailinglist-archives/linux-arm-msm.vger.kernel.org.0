Return-Path: <linux-arm-msm+bounces-114268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SUNBNNY+O2pnUQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 04:20:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 749516BAE6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 04:20:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=samsung.com header.s=mail20170921 header.b=pW7LR+mE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114268-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114268-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=samsung.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD890302D516
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 02:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAA822F25F3;
	Wed, 24 Jun 2026 02:20:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31303275B03
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 02:19:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782267602; cv=none; b=Kmd1evlCAKwqhSBvz3L0gZoxxv83Iu+Ks1DCMetqvpstxJsITN4YCACBoKWNg9f6ZYJlI0qIcB2EeiEwRT2NSMchb9Os8hX0s5znU/L+Q2pnT+VdZvrqSiDUeIqOwbWBhJjb2Iwv1WGP+rQ1/XvxF3wnrysGz0P/UOcVmX2T7u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782267602; c=relaxed/simple;
	bh=DGJVCnFbCJgisJ9N6u0idYTaKLaz0dHWWhJ9ygzwkQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=b0jvWPtoB87SjKR8NRk6kX/kvm0io5dS64CzyXY/MNkACGthJqPV56flzK2/gGXpEzZuDt+ieRZYl5Ux92gLRnlM75T9mVGA4tu7DyvDXOawpAc9GyuXpFlEB2JDZnbN4WZTv57qp2qpYcZylyAadC+sEFFSRuBUGxCNf14f270=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pW7LR+mE; arc=none smtp.client-ip=203.254.224.24
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260624021957epoutp012d4dbe09054d2a6857647106ed67b084~74u-RLHuj1621116211epoutp01F
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 02:19:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260624021957epoutp012d4dbe09054d2a6857647106ed67b084~74u-RLHuj1621116211epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782267597;
	bh=JqPyZ0aaQVBBC6joV6zD0RbPShi6Y/+SNaCXbd0DQHo=;
	h=From:To:Cc:Subject:Date:References:From;
	b=pW7LR+mEt9uxjtqQhQhCIqCiZDGMgDljh09xK735xGJ/r1/ipAoOYmCgYIWVOO7ar
	 PEVRtYbCmokc7nncENNeUZSrUDcvSo2+V/8AvTdFO3LHZuOrLjiVWc2xA33Oco9/zS
	 /YfL32lVoqXy1DtESSA5ll54PFja2PrDKhGrK+mY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPS id
	20260624021956epcas1p1620b680e9321a3aba8069cada28ee742~74u_kGyTe1547115471epcas1p1J;
	Wed, 24 Jun 2026 02:19:56 +0000 (GMT)
Received: from epcas1p3.samsung.com (unknown [182.195.38.118]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4glQcr1Sxvz6B9mB; Wed, 24 Jun
	2026 02:19:56 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260624021955epcas1p2ba2fa4eb8bd0aafaf7b46bde2cf524be~74u9oMuYh0842908429epcas1p2p;
	Wed, 24 Jun 2026 02:19:55 +0000 (GMT)
Received: from cw9316lee.. (unknown [10.253.101.98]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260624021955epsmtip1ed35129491f5eb1c90636349381c9e79~74u9g6r832095320953epsmtip12;
	Wed, 24 Jun 2026 02:19:55 +0000 (GMT)
From: Chanwoo Lee <cw9316.lee@samsung.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Asutosh Das
	<quic_asutoshd@quicinc.com>, Ritesh Harjani <ritesh.list@gmail.com>, Ulf
	Hansson <ulfh@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Kamal Dasu
	<kamal.dasu@broadcom.com>, Al Cooper <alcooperx@gmail.com>, Broadcom
	internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian
	Fainelli <florian.fainelli@broadcom.com>, Haibo Chen <haibo.chen@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Michal Simek <michal.simek@amd.com>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	linux-mmc@vger.kernel.org (open list:EMMC CMDQ HOST CONTROLLER INTERFACE
	(CQHCI) DRIVER), linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
	support), linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek
	SoC support), linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING
	LIST), linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT)
Cc: Chanwoo Lee <cw9316.lee@samsung.com>
Subject: [PATCH] mmc: cqhci: Remove unused intmask parameter from
 cqhci_irq()
Date: Wed, 24 Jun 2026 11:19:03 +0900
Message-ID: <20260624021912.632627-1-cw9316.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260624021955epcas1p2ba2fa4eb8bd0aafaf7b46bde2cf524be
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
cpgsPolicy: CPGSC10-711,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260624021955epcas1p2ba2fa4eb8bd0aafaf7b46bde2cf524be
References: <CGME20260624021955epcas1p2ba2fa4eb8bd0aafaf7b46bde2cf524be@epcas1p2.samsung.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[samsung.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114268-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[intel.com,quicinc.com,gmail.com,kernel.org,mediatek.com,collabora.com,broadcom.com,nxp.com,pengutronix.de,amd.com,nvidia.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:adrian.hunter@intel.com,m:quic_asutoshd@quicinc.com,m:ritesh.list@gmail.com,m:ulfh@kernel.org,m:chaotian.jing@mediatek.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:kamal.dasu@broadcom.com,m:alcooperx@gmail.com,m:bcm-kernel-feedback-list@broadcom.com,m:florian.fainelli@broadcom.com,m:haibo.chen@nxp.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:michal.simek@amd.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:linux-mmc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:cw9316.lee@samsung.com,m:riteshlist@gmail.com,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[cw9316.lee@samsung.com,linux-arm-msm@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[samsung.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cw9316.lee@samsung.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 749516BAE6C

The intmask parameter of cqhci_irq() is never used within the function
body. The function reads the CQHCI interrupt status directly via
cqhci_readl() and processes interrupts independently of the SDHCI
intmask value passed by callers.

Signed-off-by: Chanwoo Lee <cw9316.lee@samsung.com>
---
 drivers/mmc/host/cqhci-core.c       | 3 +--
 drivers/mmc/host/cqhci.h            | 3 +--
 drivers/mmc/host/mtk-sd.c           | 2 +-
 drivers/mmc/host/sdhci-brcmstb.c    | 2 +-
 drivers/mmc/host/sdhci-esdhc-imx.c  | 2 +-
 drivers/mmc/host/sdhci-msm.c        | 2 +-
 drivers/mmc/host/sdhci-of-arasan.c  | 2 +-
 drivers/mmc/host/sdhci-of-dwcmshc.c | 2 +-
 drivers/mmc/host/sdhci-pci-core.c   | 2 +-
 drivers/mmc/host/sdhci-pci-gli.c    | 2 +-
 drivers/mmc/host/sdhci-tegra.c      | 2 +-
 drivers/mmc/host/sdhci_am654.c      | 2 +-
 12 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/mmc/host/cqhci-core.c b/drivers/mmc/host/cqhci-core.c
index 178277d90c31..98ceb0b9a6d1 100644
--- a/drivers/mmc/host/cqhci-core.c
+++ b/drivers/mmc/host/cqhci-core.c
@@ -819,8 +819,7 @@ static void cqhci_finish_mrq(struct mmc_host *mmc, unsigned int tag)
 	mmc_cqe_request_done(mmc, mrq);
 }
 
-irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
-		      int data_error)
+irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_error)
 {
 	u32 status;
 	unsigned long tag = 0, comp_status;
diff --git a/drivers/mmc/host/cqhci.h b/drivers/mmc/host/cqhci.h
index 3668856531c1..8fbbc48c3f85 100644
--- a/drivers/mmc/host/cqhci.h
+++ b/drivers/mmc/host/cqhci.h
@@ -315,8 +315,7 @@ static inline u32 cqhci_readl(struct cqhci_host *host, int reg)
 
 struct platform_device;
 
-irqreturn_t cqhci_irq(struct mmc_host *mmc, u32 intmask, int cmd_error,
-		      int data_error);
+irqreturn_t cqhci_irq(struct mmc_host *mmc, int cmd_error, int data_error);
 int cqhci_init(struct cqhci_host *cq_host, struct mmc_host *mmc, bool dma64);
 struct cqhci_host *cqhci_pltfm_init(struct platform_device *pdev);
 int cqhci_deactivate(struct mmc_host *mmc);
diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index b2680cc054bd..01ea3adbdf3b 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1805,7 +1805,7 @@ static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
 			cmd_err, dat_err, intsts);
 	}
 
-	return cqhci_irq(mmc, 0, cmd_err, dat_err);
+	return cqhci_irq(mmc, cmd_err, dat_err);
 }
 
 static irqreturn_t msdc_irq(int irq, void *dev_id)
diff --git a/drivers/mmc/host/sdhci-brcmstb.c b/drivers/mmc/host/sdhci-brcmstb.c
index 57e45951644e..1de2f05fd958 100644
--- a/drivers/mmc/host/sdhci-brcmstb.c
+++ b/drivers/mmc/host/sdhci-brcmstb.c
@@ -430,7 +430,7 @@ static u32 sdhci_brcmstb_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 18ecddd6df6f..d0fa83f67a80 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -1503,7 +1503,7 @@ static u32 esdhc_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 0882ce74e0c9..ceed47ccfda8 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2165,7 +2165,7 @@ static u32 sdhci_msm_cqe_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 	return 0;
 }
 
diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-of-arasan.c
index 785d3acb18c5..4ca73e7d799e 100644
--- a/drivers/mmc/host/sdhci-of-arasan.c
+++ b/drivers/mmc/host/sdhci-of-arasan.c
@@ -555,7 +555,7 @@ static u32 sdhci_arasan_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-of-dwcmshc.c b/drivers/mmc/host/sdhci-of-dwcmshc.c
index eef53455b8ee..4c5fa6a6931d 100644
--- a/drivers/mmc/host/sdhci-of-dwcmshc.c
+++ b/drivers/mmc/host/sdhci-of-dwcmshc.c
@@ -624,7 +624,7 @@ static u32 dwcmshc_cqe_irq_handler(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-pci-core.c b/drivers/mmc/host/sdhci-pci-core.c
index c347fac24515..b121d896a804 100644
--- a/drivers/mmc/host/sdhci-pci-core.c
+++ b/drivers/mmc/host/sdhci-pci-core.c
@@ -215,7 +215,7 @@ static u32 sdhci_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-pci-gli.c b/drivers/mmc/host/sdhci-pci-gli.c
index 6e4084407662..b55618566d65 100644
--- a/drivers/mmc/host/sdhci-pci-gli.c
+++ b/drivers/mmc/host/sdhci-pci-gli.c
@@ -1760,7 +1760,7 @@ static u32 sdhci_gl9763e_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
index 820ce4dae58b..221e48b59f48 100644
--- a/drivers/mmc/host/sdhci-tegra.c
+++ b/drivers/mmc/host/sdhci-tegra.c
@@ -1280,7 +1280,7 @@ static u32 sdhci_tegra_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
index d235b0aecfdb..2a27db2f558b 100644
--- a/drivers/mmc/host/sdhci_am654.c
+++ b/drivers/mmc/host/sdhci_am654.c
@@ -462,7 +462,7 @@ static u32 sdhci_am654_cqhci_irq(struct sdhci_host *host, u32 intmask)
 	if (!sdhci_cqe_irq(host, intmask, &cmd_error, &data_error))
 		return intmask;
 
-	cqhci_irq(host->mmc, intmask, cmd_error, data_error);
+	cqhci_irq(host->mmc, cmd_error, data_error);
 
 	return 0;
 }
-- 
2.43.0


