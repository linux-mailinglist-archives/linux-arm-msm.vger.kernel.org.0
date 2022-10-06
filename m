Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCE05F5E36
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 03:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbiJFBHC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Oct 2022 21:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229930AbiJFBG4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Oct 2022 21:06:56 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B0F71719;
        Wed,  5 Oct 2022 18:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1665018414; x=1696554414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=GQBv0muQd5xZQt6rUVwdAd/VhwblCxqfouB5/wuuN8w=;
  b=x+VyypH5jkUvaEBU2gbi22ZXzXxN5dtuwARtehsil4S72/OsxhedjRVc
   dZC+W430qnP0Be5itIVnuYmPtfAddpnRHJK54DqrwaNDjViUoJU8Ianwb
   nNx5gswqjCVt4g3Ei7yaI5K+ukvjefBtZc0Jn8169G+GyyeLwIBI7FQzA
   w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 05 Oct 2022 18:06:54 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 18:06:54 -0700
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 5 Oct 2022 18:06:53 -0700
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_richardp@quicinc.com>, <linux-scsi@vger.kernel.org>
CC:     Asutosh Das <quic_asutoshd@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>
Subject: [PATCH v2 15/17] ufs: core: mcq: Add completion support in poll
Date:   Wed, 5 Oct 2022 18:06:14 -0700
Message-ID: <fc711671f83372d067c6107abd969c904e87f52f.1665017636.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1665017636.git.quic_asutoshd@quicinc.com>
References: <cover.1665017636.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Complete cqe requests in poll. Assumption is that
several poll completion may happen in different CPUs
for the same Completion Queue. Hence a spin lock
protection is added.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
---
 drivers/ufs/core/ufs-mcq.c     | 13 +++++++++++++
 drivers/ufs/core/ufshcd-priv.h |  2 ++
 drivers/ufs/core/ufshcd.c      |  7 +++++++
 include/ufs/ufshcd.h           |  2 ++
 4 files changed, 24 insertions(+)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 1ae398e..0fb8e7e 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -376,6 +376,18 @@ unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
 	return completed_reqs;
 }
 
+unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
+				       struct ufs_hw_queue *hwq)
+{
+	unsigned long completed_reqs;
+
+	spin_lock(&hwq->cq_lock);
+	completed_reqs = ufshcd_mcq_poll_cqe_nolock(hba, hwq);
+	spin_unlock(&hwq->cq_lock);
+
+	return completed_reqs;
+}
+
 void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba)
 {
 	struct ufs_hw_queue *hwq;
@@ -469,6 +481,7 @@ int ufshcd_mcq_init(struct ufs_hba *hba)
 		hwq = &hba->uhq[i];
 		hwq->max_entries = hba->nutrs;
 		spin_lock_init(&hwq->sq_lock);
+		spin_lock_init(&hwq->cq_lock);
 	}
 
 	/* The very first HW queue is to serve device command */
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 417e2ca..6e9bec6 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -64,6 +64,8 @@ unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
 					 struct ufs_hw_queue *hwq);
 struct ufs_hw_queue *ufshcd_mcq_req_to_hwq(struct ufs_hba *hba,
 					   struct request *req);
+unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
+				       struct ufs_hw_queue *hwq);
 
 #define UFSHCD_MCQ_IO_QUEUE_OFFSET	1
 #define SD_ASCII_STD true
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 908692d..f1a9b26 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -5439,6 +5439,13 @@ static int ufshcd_poll(struct Scsi_Host *shost, unsigned int queue_num)
 	struct ufs_hba *hba = shost_priv(shost);
 	unsigned long completed_reqs, flags;
 	u32 tr_doorbell;
+	struct ufs_hw_queue *hwq;
+
+	if (is_mcq_enabled(hba)) {
+		hwq = &hba->uhq[queue_num + UFSHCD_MCQ_IO_QUEUE_OFFSET];
+
+		return ufshcd_mcq_poll_cqe_lock(hba, hwq);
+	}
 
 	spin_lock_irqsave(&hba->outstanding_lock, flags);
 	tr_doorbell = ufshcd_readl(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL);
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 28b2d12..9bf2c5e 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1062,6 +1062,7 @@ struct ufs_hba {
  * @sq_lock: serialize submission queue access
  * @cq_tail_slot: current slot to which CQ tail pointer is pointing
  * @cq_head_slot: current slot to which CQ head pointer is pointing
+ * @cq_lock: Synchronize between multiple polling instances
  */
 struct ufs_hw_queue {
 	void __iomem *mcq_sq_head;
@@ -1079,6 +1080,7 @@ struct ufs_hw_queue {
 	spinlock_t sq_lock;
 	u32 cq_tail_slot;
 	u32 cq_head_slot;
+	spinlock_t cq_lock;
 };
 
 static inline bool is_mcq_enabled(struct ufs_hba *hba)
-- 
2.7.4

