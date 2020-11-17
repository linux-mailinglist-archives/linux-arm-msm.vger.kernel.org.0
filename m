Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38D32B59C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 07:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbgKQGaq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 01:30:46 -0500
Received: from mail-eopbgr1320071.outbound.protection.outlook.com ([40.107.132.71]:19170
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725355AbgKQGap (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 01:30:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yf0pjqzk5tqSXgnf+nRLlQfAYDPccjmY4rW65HL7dqwDcbovDUWCopQbhEZVnHrWuiE4vp3rhD5ht/6E3SRSW6hJq3NIz3mYSVChr1bizvSPse/rSGqxaLBR5Mg3zmA9vOpAgaZSovh1LEHSqIZ02ZO6DIqEJrdjSasBUiyx6tFrIw9dY/WitBw4voNZBANd2esx40FO5gTbML7IzX3PHA4yVBD9+s+f+dNYoM5CgZO7ZXTet8zkO8MUVAVHLLoBy9ys2aVD2LjT1CEtMe/HpTiUO1HegMlxgcffb1NggHpzv37HQKZyXFfoe9fndmvRm4FiUzL7xqvUg82sw84MmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h015o2PplFdJianjN82Rvof+518WDVLBKrn0e9YwiiQ=;
 b=QlqDd5OxU1kpRn/5SDWsWS1C0HWtPKyBX1AaASEg9KbaDdEczUJmXz8qjKTDzY5nZCuch3MBb6LGFhlXFUnVZ9WVlgEYg36B5oloIHSw4kbClr8vjgbfI7MFjDoTfL9aJ2YOq22EYMqOrJZQe85ZI8SoVkWN3738OWcVQGFncGgIEn2J1jf6yXSEtO304AlIFLZaF/CRnWavfvxmzqavExNGZJs2KBbXEdbILIMQWBQC1paYrV/XLoWw2GIX9ShkNJZvjr7BeXsLOOAHEbzBPPbhWsFUhodgsaO0SlWpifnZ7yRuQ4qNsAWjAfMVZG0dnMdB2VoMFUU2MuT8JD9IdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quectel.com; dmarc=pass action=none header.from=quectel.com;
 dkim=pass header.d=quectel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quectel.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h015o2PplFdJianjN82Rvof+518WDVLBKrn0e9YwiiQ=;
 b=GZkzt+CAea4wOXVDfW2/30wNgvz/zEJwVBXUr/7/OK9uApDMrvjVHI100E6SPyTWnWCKz3+mq2yBECclI4kLMHcrTFENpgGbJUuyY3TfAkNiOSwNw4kyuuHWmKaLH7xfruhFFWrCcv5GzF8VynITRYcHKJyQWnNK/l4BXBsRO6U=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quectel.com;
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com (2603:1096:202:3e::14)
 by HK0PR06MB2161.apcprd06.prod.outlook.com (2603:1096:203:4b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 06:30:39 +0000
Received: from HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4]) by HK2PR06MB3507.apcprd06.prod.outlook.com
 ([fe80::94f:c55a:f9c8:22f4%5]) with mapi id 15.20.3564.025; Tue, 17 Nov 2020
 06:30:39 +0000
From:   carl.yin@quectel.com
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        sfr@canb.auug.org.au
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        carl.yin@quectel.com, naveen.kumar@quectel.com
Subject: [PATCH] bus: mhi: core: manager all mhi ctrl data in one segment
Date:   Tue, 17 Nov 2020 14:30:30 +0800
Message-Id: <20201117063030.12004-1-carl.yin@quectel.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [203.93.254.85]
X-ClientProxiedBy: HK2PR03CA0053.apcprd03.prod.outlook.com
 (2603:1096:202:17::23) To HK2PR06MB3507.apcprd06.prod.outlook.com
 (2603:1096:202:3e::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (203.93.254.85) by HK2PR03CA0053.apcprd03.prod.outlook.com (2603:1096:202:17::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend Transport; Tue, 17 Nov 2020 06:30:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 791b74e1-e76c-492b-2fc2-08d88ac24cbe
X-MS-TrafficTypeDiagnostic: HK0PR06MB2161:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR06MB21611EFD4B1FE8D7A2BA90B286E20@HK0PR06MB2161.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VSuTkg/PXXbIvXk/5UqqnshPR2Np7Y5GvqSU3DTJ7tu466RpLbugvq/piFaPXhyuwdEejR9yM8IwJGyTuWtjHCeAV9T0N3OQGVGFQyMBL2e+nhw2S1NKO18PmHiGyYEq+ss1f8wUFzuKmtSpxAzE7Uyp5C0S9Ra0JgibGt/Tervf2qFpLCctDdOz/52HEpHi1FvV/Iw1mIPJxjdgbfzdlPq9hZXq3n5aJp1vWDJFfPpkJjl1sBe6RCp1tzfeziv/P5TjXrjNeHuT1LmlrYcW2UXGYxI7gjAX01xpgMGR/E7X4y/ZDzd2nCsZa12yiMwPpmW+B1anZUQwjNx4rQim7kVtLG9akdmnv55xJTDVRBllEFYfZvQ+oEU56LiFcGGy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK2PR06MB3507.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(376002)(396003)(346002)(136003)(39860400002)(9686003)(66476007)(6512007)(6486002)(66946007)(66556008)(4326008)(36756003)(107886003)(69590400008)(86362001)(5660300002)(30864003)(83380400001)(1076003)(2616005)(956004)(26005)(186003)(8676002)(19627235002)(2906002)(16526019)(6506007)(316002)(8936002)(52116002)(6666004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: Cvispz4OcPwxBEw5p8dQmwpwEI4hkK2Q9GJtz2olbPw60Wey9DmP2qn/BsolMy1KcdtwRcbB4vRwDQw0wCh2X3Qk1IMy33OMy1esniswuQOgkRzM4s3R+E1SuJkffZ0Q2wfKXVbR5BV7NE62eMUKoGs+Dw8V/D963f8x1iZPh5MLgULkSBH8ldCrG8ErDPMXE+zsmr4g+EB6DQEBAUUsP4xpNBeOgSS94yHhJezO+OAy9VqjX4GUBKQPYI1pcnMCIFKTyvuJCHjqXW0eaUKuu9OMPwcKpqwU/CEOW08dy6VxAdUF4ez2SrtYFLouYkWty0HzH647Yuc4nwR5SAMlmJdtvPrtu9eRFr2fs/jYJq+gbNEn/zr2j+wckemttG6NdojlkuZv9K/nftIckvOZ6O8XMDW4xJ+XxPZtaVwkNNweq5ZbJsRxcTrqdCv0hceRpw+jM44NmFPa8ppFkPqJnmUKpadKliel6eKP+Osruaa+f5EYbhj62Hn0kW6EY7r5zfxlOhijp3dh7FExHv1xgOttN0guqUnccIPFpMXW0IWN15FEY3yIF2ms8RtVseZfTyjZrUUoWSf+dp5YFmNT2ztze+Jj7CL6t0ziI/DtBFov+XbEnFPXYmHC/XEpMOhlehMSeZ+kkXe7jqRjpbpD1sL+Oj+ZCnYTPaM5F7+Of5N7AbwECTu9hJdEeWRl7QC6ijvvZ7Gt6LZBYdeBWdzNMhDvtSZnmhnv4kxKjKn1bp3BaPL2BBRHxKYhlwlEat5a0hLKC7R22k5DDVZ9rU8z1SkmxxaMHUIgg2SBGdIIcButtlepy6oxYKAFfV9KOXDsdQxhFTJmXa7PvRNuGcQPW9ozgRcQSYv2nRnKp64+7+afDyOqxGwnZda1uzqLUzEcuL7K2eZbdibMIjJcbqAkcA==
X-OriginatorOrg: quectel.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 791b74e1-e76c-492b-2fc2-08d88ac24cbe
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3507.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 06:30:39.2523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7730d043-e129-480c-b1ba-e5b6a9f476aa
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgUU1puAOTurSUdX9ix36Dyfm5RkOVp3DzCvUddYZQZpZtf4gta6123s+Bw6ssE07oYWoEiEG6ABto7CSWU5fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2161
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Carl Yin <carl.yin@quectel.com>

I test SDX24 and SDX55 modems on Dell-OptiPlex-7060 has 16GB memory.
So I set dma_data_width in mhi/pci_generic.c to 37,
then get next error:

[  538.338317] mhi 0000:03:00.0: Requested to power ON
[  538.338441] mhi 0000:03:00.0: Power on setup success
[  538.338519] mhi 0000:03:00.0: Handling state transition: PBL
[  543.383661] mhi 0000:03:00.0: Device in READY State
[  543.383667] mhi 0000:03:00.0: Initializing MHI registers
[  545.612647] mhi 0000:03:00.0: local ee:AMSS device ee:PASS THRU dev_state:READY
[  545.646114] mhi 0000:03:00.0: Unhandled event type: 0
[  545.646150] mhi 0000:03:00.0: tre: 0, 0, 0
[  545.656697] mhi 0000:03:00.0: Unhandled event type: 0
[  545.656733] mhi 0000:03:00.0: tre: 0, 0, 0

I refer to the QUALLCOMM Windows MHI driver,
manager all mhi ctrl data in one segment, above error can be solved.

Signed-off-by: Carl Yin <carl.yin@quectel.com>
---
 drivers/bus/mhi/core/init.c     | 251 +++++++++++++++-----------------
 drivers/bus/mhi/core/internal.h |   6 +-
 2 files changed, 123 insertions(+), 134 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 655d539c6808..996b0f61920b 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -112,23 +112,6 @@ static struct attribute *mhi_dev_attrs[] = {
 };
 ATTRIBUTE_GROUPS(mhi_dev);
 
-/* MHI protocol requires the transfer ring to be aligned with ring length */
-static int mhi_alloc_aligned_ring(struct mhi_controller *mhi_cntrl,
-				  struct mhi_ring *ring,
-				  u64 len)
-{
-	ring->alloc_size = len + (len - 1);
-	ring->pre_aligned = mhi_alloc_coherent(mhi_cntrl, ring->alloc_size,
-					       &ring->dma_handle, GFP_KERNEL);
-	if (!ring->pre_aligned)
-		return -ENOMEM;
-
-	ring->iommu_base = (ring->dma_handle + (len - 1)) & ~(len - 1);
-	ring->base = ring->pre_aligned + (ring->iommu_base - ring->dma_handle);
-
-	return 0;
-}
-
 void mhi_deinit_free_irq(struct mhi_controller *mhi_cntrl)
 {
 	int i;
@@ -205,40 +188,136 @@ void mhi_deinit_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	mhi_cmd = mhi_cntrl->mhi_cmd;
 	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++) {
 		ring = &mhi_cmd->ring;
-		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
-				  ring->pre_aligned, ring->dma_handle);
 		ring->base = NULL;
 		ring->iommu_base = 0;
 	}
 
-	mhi_free_coherent(mhi_cntrl,
-			  sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS,
-			  mhi_ctxt->cmd_ctxt, mhi_ctxt->cmd_ctxt_addr);
-
 	mhi_event = mhi_cntrl->mhi_event;
 	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
 		if (mhi_event->offload_ev)
 			continue;
 
 		ring = &mhi_event->ring;
-		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
-				  ring->pre_aligned, ring->dma_handle);
 		ring->base = NULL;
 		ring->iommu_base = 0;
 	}
 
-	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->er_ctxt) *
-			  mhi_cntrl->total_ev_rings, mhi_ctxt->er_ctxt,
-			  mhi_ctxt->er_ctxt_addr);
-
-	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->chan_ctxt) *
-			  mhi_cntrl->max_chan, mhi_ctxt->chan_ctxt,
-			  mhi_ctxt->chan_ctxt_addr);
+	mhi_free_coherent(mhi_cntrl,
+			  mhi_ctxt->ctrl_seg_len,
+			  mhi_ctxt->ctrl_seg,
+			  mhi_ctxt->ctrl_seg_addr);
 
 	kfree(mhi_ctxt);
 	mhi_cntrl->mhi_ctxt = NULL;
 }
 
+static struct mhi_ctxt *mhi_alloc_dev_ctxt(struct mhi_controller *mhi_cntrl)
+{
+	struct mhi_ctxt *mhi_ctxt;
+	struct mhi_chan *mhi_chan;
+	struct mhi_event *mhi_event;
+	struct mhi_cmd *mhi_cmd;
+	struct mhi_ring *ring;
+	int i;
+
+	mhi_ctxt = kzalloc(sizeof(*mhi_ctxt), GFP_KERNEL);
+	if (!mhi_ctxt)
+		return NULL;
+
+	mhi_ctxt->chan_ctxt_addr = mhi_ctxt->ctrl_seg_len;
+	mhi_ctxt->ctrl_seg_len += (sizeof(*mhi_ctxt->chan_ctxt) * mhi_cntrl->max_chan);
+
+	mhi_ctxt->er_ctxt_addr = mhi_ctxt->ctrl_seg_len;
+	mhi_ctxt->ctrl_seg_len += (sizeof(*mhi_ctxt->er_ctxt) * mhi_cntrl->total_ev_rings);
+
+	mhi_ctxt->cmd_ctxt_addr = mhi_ctxt->ctrl_seg_len;
+	mhi_ctxt->ctrl_seg_len += (sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS);
+
+/* MHI protocol requires the transfer ring to be aligned with ring length */
+#define mhi_aligned_ring(mhi_ctxt, ring) \
+	do { \
+		ring->el_size = sizeof(struct mhi_tre); \
+		ring->len = ring->el_size * ring->elements; \
+		mhi_ctxt->ctrl_seg_len = ALIGN(mhi_ctxt->ctrl_seg_len, ring->len); \
+		ring->iommu_base = mhi_ctxt->ctrl_seg_len; \
+		mhi_ctxt->ctrl_seg_len += ring->len; \
+	} while (0)
+
+	mhi_chan = mhi_cntrl->mhi_chan;
+	for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
+		/* Skip if it is an invalid or offload channel */
+		if (!mhi_chan->name || mhi_chan->offload_ch)
+			continue;
+
+		ring = &mhi_chan->tre_ring;
+		mhi_aligned_ring(mhi_ctxt, ring);
+	}
+
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		/* Skip if it is an offload event */
+		if (mhi_event->offload_ev)
+			continue;
+
+		ring = &mhi_event->ring;
+		mhi_aligned_ring(mhi_ctxt, ring);
+	}
+
+	mhi_cmd = mhi_cntrl->mhi_cmd;
+	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++) {
+		ring = &mhi_cmd->ring;
+		ring->elements = CMD_EL_PER_RING;
+		mhi_aligned_ring(mhi_ctxt, ring);
+	}
+
+	mhi_ctxt->ctrl_seg = mhi_alloc_coherent(mhi_cntrl,
+						 mhi_ctxt->ctrl_seg_len,
+						 &mhi_ctxt->ctrl_seg_addr,
+						 GFP_KERNEL);
+	if (!mhi_ctxt->ctrl_seg) {
+		kfree(mhi_ctxt);
+		return NULL;
+	}
+
+	mhi_ctxt->chan_ctxt = mhi_ctxt->ctrl_seg + mhi_ctxt->chan_ctxt_addr;
+	mhi_ctxt->chan_ctxt_addr += mhi_ctxt->ctrl_seg_addr;
+	mhi_ctxt->er_ctxt = mhi_ctxt->ctrl_seg + mhi_ctxt->er_ctxt_addr;
+	mhi_ctxt->er_ctxt_addr += mhi_ctxt->ctrl_seg_addr;
+	mhi_ctxt->cmd_ctxt = mhi_ctxt->ctrl_seg + mhi_ctxt->cmd_ctxt_addr;
+	mhi_ctxt->cmd_ctxt_addr += mhi_ctxt->ctrl_seg_addr;
+
+	mhi_chan = mhi_cntrl->mhi_chan;
+	for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
+		/* Skip if it is an invalid or offload channel */
+		if (!mhi_chan->name || mhi_chan->offload_ch)
+			continue;
+
+		ring = &mhi_chan->tre_ring;
+		ring->base = mhi_ctxt->ctrl_seg + ring->iommu_base;
+		ring->iommu_base += mhi_ctxt->ctrl_seg_addr;
+	}
+
+	mhi_event = mhi_cntrl->mhi_event;
+	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
+		/* Skip if it is an offload event */
+		if (mhi_event->offload_ev)
+			continue;
+
+		ring = &mhi_event->ring;
+		ring->base = mhi_ctxt->ctrl_seg + ring->iommu_base;
+		ring->iommu_base += mhi_ctxt->ctrl_seg_addr;
+	}
+
+	mhi_cmd = mhi_cntrl->mhi_cmd;
+	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++) {
+		ring = &mhi_cmd->ring;
+		ring->base = mhi_ctxt->ctrl_seg + ring->iommu_base;
+		ring->iommu_base += mhi_ctxt->ctrl_seg_addr;
+	}
+
+	return mhi_ctxt;
+}
+
 int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 {
 	struct mhi_ctxt *mhi_ctxt;
@@ -249,24 +328,16 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	struct mhi_event *mhi_event;
 	struct mhi_cmd *mhi_cmd;
 	u32 tmp;
-	int ret = -ENOMEM, i;
+	int i;
 
 	atomic_set(&mhi_cntrl->dev_wake, 0);
 	atomic_set(&mhi_cntrl->pending_pkts, 0);
 
-	mhi_ctxt = kzalloc(sizeof(*mhi_ctxt), GFP_KERNEL);
+	mhi_ctxt = mhi_alloc_dev_ctxt(mhi_cntrl);
 	if (!mhi_ctxt)
 		return -ENOMEM;
 
 	/* Setup channel ctxt */
-	mhi_ctxt->chan_ctxt = mhi_alloc_coherent(mhi_cntrl,
-						 sizeof(*mhi_ctxt->chan_ctxt) *
-						 mhi_cntrl->max_chan,
-						 &mhi_ctxt->chan_ctxt_addr,
-						 GFP_KERNEL);
-	if (!mhi_ctxt->chan_ctxt)
-		goto error_alloc_chan_ctxt;
-
 	mhi_chan = mhi_cntrl->mhi_chan;
 	chan_ctxt = mhi_ctxt->chan_ctxt;
 	for (i = 0; i < mhi_cntrl->max_chan; i++, chan_ctxt++, mhi_chan++) {
@@ -291,14 +362,6 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	}
 
 	/* Setup event context */
-	mhi_ctxt->er_ctxt = mhi_alloc_coherent(mhi_cntrl,
-					       sizeof(*mhi_ctxt->er_ctxt) *
-					       mhi_cntrl->total_ev_rings,
-					       &mhi_ctxt->er_ctxt_addr,
-					       GFP_KERNEL);
-	if (!mhi_ctxt->er_ctxt)
-		goto error_alloc_er_ctxt;
-
 	er_ctxt = mhi_ctxt->er_ctxt;
 	mhi_event = mhi_cntrl->mhi_event;
 	for (i = 0; i < mhi_cntrl->total_ev_rings; i++, er_ctxt++,
@@ -319,12 +382,6 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 		er_ctxt->msivec = mhi_event->irq;
 		mhi_event->db_cfg.db_mode = true;
 
-		ring->el_size = sizeof(struct mhi_tre);
-		ring->len = ring->el_size * ring->elements;
-		ret = mhi_alloc_aligned_ring(mhi_cntrl, ring, ring->len);
-		if (ret)
-			goto error_alloc_er;
-
 		/*
 		 * If the read pointer equals to the write pointer, then the
 		 * ring is empty
@@ -337,27 +394,11 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	}
 
 	/* Setup cmd context */
-	ret = -ENOMEM;
-	mhi_ctxt->cmd_ctxt = mhi_alloc_coherent(mhi_cntrl,
-						sizeof(*mhi_ctxt->cmd_ctxt) *
-						NR_OF_CMD_RINGS,
-						&mhi_ctxt->cmd_ctxt_addr,
-						GFP_KERNEL);
-	if (!mhi_ctxt->cmd_ctxt)
-		goto error_alloc_er;
-
 	mhi_cmd = mhi_cntrl->mhi_cmd;
 	cmd_ctxt = mhi_ctxt->cmd_ctxt;
 	for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++, cmd_ctxt++) {
 		struct mhi_ring *ring = &mhi_cmd->ring;
 
-		ring->el_size = sizeof(struct mhi_tre);
-		ring->elements = CMD_EL_PER_RING;
-		ring->len = ring->el_size * ring->elements;
-		ret = mhi_alloc_aligned_ring(mhi_cntrl, ring, ring->len);
-		if (ret)
-			goto error_alloc_cmd;
-
 		ring->rp = ring->wp = ring->base;
 		cmd_ctxt->rbase = ring->iommu_base;
 		cmd_ctxt->rp = cmd_ctxt->wp = cmd_ctxt->rbase;
@@ -368,43 +409,6 @@ int mhi_init_dev_ctxt(struct mhi_controller *mhi_cntrl)
 	mhi_cntrl->mhi_ctxt = mhi_ctxt;
 
 	return 0;
-
-error_alloc_cmd:
-	for (--i, --mhi_cmd; i >= 0; i--, mhi_cmd--) {
-		struct mhi_ring *ring = &mhi_cmd->ring;
-
-		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
-				  ring->pre_aligned, ring->dma_handle);
-	}
-	mhi_free_coherent(mhi_cntrl,
-			  sizeof(*mhi_ctxt->cmd_ctxt) * NR_OF_CMD_RINGS,
-			  mhi_ctxt->cmd_ctxt, mhi_ctxt->cmd_ctxt_addr);
-	i = mhi_cntrl->total_ev_rings;
-	mhi_event = mhi_cntrl->mhi_event + i;
-
-error_alloc_er:
-	for (--i, --mhi_event; i >= 0; i--, mhi_event--) {
-		struct mhi_ring *ring = &mhi_event->ring;
-
-		if (mhi_event->offload_ev)
-			continue;
-
-		mhi_free_coherent(mhi_cntrl, ring->alloc_size,
-				  ring->pre_aligned, ring->dma_handle);
-	}
-	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->er_ctxt) *
-			  mhi_cntrl->total_ev_rings, mhi_ctxt->er_ctxt,
-			  mhi_ctxt->er_ctxt_addr);
-
-error_alloc_er_ctxt:
-	mhi_free_coherent(mhi_cntrl, sizeof(*mhi_ctxt->chan_ctxt) *
-			  mhi_cntrl->max_chan, mhi_ctxt->chan_ctxt,
-			  mhi_ctxt->chan_ctxt_addr);
-
-error_alloc_chan_ctxt:
-	kfree(mhi_ctxt);
-
-	return ret;
 }
 
 int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
@@ -455,11 +459,11 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 		},
 		{
 			MHICTRLBASE_HIGHER, U32_MAX, 0,
-			upper_32_bits(mhi_cntrl->iova_start),
+			upper_32_bits(mhi_cntrl->mhi_ctxt->ctrl_seg_addr),
 		},
 		{
 			MHICTRLBASE_LOWER, U32_MAX, 0,
-			lower_32_bits(mhi_cntrl->iova_start),
+			lower_32_bits(mhi_cntrl->mhi_ctxt->ctrl_seg_addr),
 		},
 		{
 			MHIDATABASE_HIGHER, U32_MAX, 0,
@@ -471,11 +475,13 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 		},
 		{
 			MHICTRLLIMIT_HIGHER, U32_MAX, 0,
-			upper_32_bits(mhi_cntrl->iova_stop),
+			upper_32_bits(mhi_cntrl->mhi_ctxt->ctrl_seg_addr
+							+ mhi_cntrl->mhi_ctxt->ctrl_seg_len),
 		},
 		{
 			MHICTRLLIMIT_LOWER, U32_MAX, 0,
-			lower_32_bits(mhi_cntrl->iova_stop),
+			lower_32_bits(mhi_cntrl->mhi_ctxt->ctrl_seg_addr
+							+ mhi_cntrl->mhi_ctxt->ctrl_seg_len),
 		},
 		{
 			MHIDATALIMIT_HIGHER, U32_MAX, 0,
@@ -542,19 +548,10 @@ void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
 			  struct mhi_chan *mhi_chan)
 {
 	struct mhi_ring *buf_ring;
-	struct mhi_ring *tre_ring;
-	struct mhi_chan_ctxt *chan_ctxt;
 
 	buf_ring = &mhi_chan->buf_ring;
-	tre_ring = &mhi_chan->tre_ring;
-	chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
-
-	mhi_free_coherent(mhi_cntrl, tre_ring->alloc_size,
-			  tre_ring->pre_aligned, tre_ring->dma_handle);
 	vfree(buf_ring->base);
-
-	buf_ring->base = tre_ring->base = NULL;
-	chan_ctxt->rbase = 0;
+	buf_ring->base = NULL;
 }
 
 int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
@@ -564,24 +561,16 @@ int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
 	struct mhi_ring *tre_ring;
 	struct mhi_chan_ctxt *chan_ctxt;
 	u32 tmp;
-	int ret;
 
 	buf_ring = &mhi_chan->buf_ring;
 	tre_ring = &mhi_chan->tre_ring;
-	tre_ring->el_size = sizeof(struct mhi_tre);
-	tre_ring->len = tre_ring->el_size * tre_ring->elements;
 	chan_ctxt = &mhi_cntrl->mhi_ctxt->chan_ctxt[mhi_chan->chan];
-	ret = mhi_alloc_aligned_ring(mhi_cntrl, tre_ring, tre_ring->len);
-	if (ret)
-		return -ENOMEM;
 
 	buf_ring->el_size = sizeof(struct mhi_buf_info);
 	buf_ring->len = buf_ring->el_size * buf_ring->elements;
 	buf_ring->base = vzalloc(buf_ring->len);
 
 	if (!buf_ring->base) {
-		mhi_free_coherent(mhi_cntrl, tre_ring->alloc_size,
-				  tre_ring->pre_aligned, tre_ring->dma_handle);
 		return -ENOMEM;
 	}
 
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 6f80ec30c0cd..546997d1a390 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -255,6 +255,9 @@ struct mhi_ctxt {
 	dma_addr_t er_ctxt_addr;
 	dma_addr_t chan_ctxt_addr;
 	dma_addr_t cmd_ctxt_addr;
+	void *ctrl_seg;
+	dma_addr_t ctrl_seg_addr;
+	size_t ctrl_seg_len;
 };
 
 struct mhi_tre {
@@ -483,17 +486,14 @@ struct state_transition {
 };
 
 struct mhi_ring {
-	dma_addr_t dma_handle;
 	dma_addr_t iommu_base;
 	u64 *ctxt_wp; /* point to ctxt wp */
-	void *pre_aligned;
 	void *base;
 	void *rp;
 	void *wp;
 	size_t el_size;
 	size_t len;
 	size_t elements;
-	size_t alloc_size;
 	void __iomem *db_addr;
 };
 
-- 
2.25.1

