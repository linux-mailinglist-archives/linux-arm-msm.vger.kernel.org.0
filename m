Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC0215F5E33
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 03:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbiJFBHA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Oct 2022 21:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229769AbiJFBGy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Oct 2022 21:06:54 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2305463FFB;
        Wed,  5 Oct 2022 18:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1665018413; x=1696554413;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=eDJg+5bwMi8gDLrsXaveXT1WtrVe9UrqDqZ0d4YYhDQ=;
  b=AjYl64ZsHUCczZA1V2OL4FrPHx9HsflFMrvPEdD0zKPSdEtvs6Mv/sDY
   vwEM+iw4Q7OPa77Rc0ve0nbi3c2iEf2f/BkQDqAzmwaKdRUC96Vl3GCjS
   wRwV+Nq6WzsNtwJd/fDRYpLRufu3ZNe9rifr4xXlleEmhhbxfeWy3Dpxm
   o=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 05 Oct 2022 18:06:53 -0700
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 18:06:52 -0700
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 5 Oct 2022 18:06:52 -0700
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_richardp@quicinc.com>, <linux-scsi@vger.kernel.org>
CC:     Asutosh Das <quic_asutoshd@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>
Subject: [PATCH v2 11/17] ufs: core: Prepare ufshcd_send_command for mcq
Date:   Wed, 5 Oct 2022 18:06:10 -0700
Message-ID: <447c12255025c83ff2b9c0bc3c7b696cf3f0c441.1665017636.git.quic_asutoshd@quicinc.com>
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

Add support to send commands using multiple submission
queues in MCQ mode.
Modify the functions that use ufshcd_send_command().

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
---
 drivers/ufs/core/ufs-mcq.c     |  1 +
 drivers/ufs/core/ufshcd-priv.h | 10 ++++++++++
 drivers/ufs/core/ufshcd.c      | 36 ++++++++++++++++++++++++++----------
 include/ufs/ufshcd.h           |  5 +++++
 4 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 4302722..9c4fd78 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -391,6 +391,7 @@ int ufshcd_mcq_init(struct ufs_hba *hba)
 	for (i = 0; i < hba->nr_hw_queues; i++) {
 		hwq = &hba->uhq[i];
 		hwq->max_entries = hba->nutrs;
+		spin_lock_init(&hwq->sq_lock);
 	}
 
 	/* The very first HW queue is to serve device command */
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 01026e3..7df2d92 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -317,4 +317,14 @@ static inline bool ufs_is_valid_unit_desc_lun(struct ufs_dev_info *dev_info,
 	return lun == UFS_UPIU_RPMB_WLUN || (lun < dev_info->max_lu_supported);
 }
 
+static inline void ufshcd_inc_sq_tail(struct ufs_hw_queue *q)
+{
+	u32 mask = q->max_entries - 1;
+	u32 val;
+
+	q->sq_tail_slot = (q->sq_tail_slot + 1) & mask;
+	val = q->sq_tail_slot * sizeof(struct utp_transfer_req_desc);
+	writel(val, q->mcq_sq_tail);
+}
+
 #endif /* _UFSHCD_PRIV_H_ */
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 93bb931..04a36a6 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2149,9 +2149,11 @@ static void ufshcd_update_monitor(struct ufs_hba *hba, const struct ufshcd_lrb *
  * ufshcd_send_command - Send SCSI or device management commands
  * @hba: per adapter instance
  * @task_tag: Task tag of the command
+ * @hwq: pointer to hardware queue instance
  */
 static inline
-void ufshcd_send_command(struct ufs_hba *hba, unsigned int task_tag)
+void ufshcd_send_command(struct ufs_hba *hba, unsigned int task_tag,
+			 struct ufs_hw_queue *hwq)
 {
 	struct ufshcd_lrb *lrbp = &hba->lrb[task_tag];
 	unsigned long flags;
@@ -2163,12 +2165,24 @@ void ufshcd_send_command(struct ufs_hba *hba, unsigned int task_tag)
 	if (unlikely(ufshcd_should_inform_monitor(hba, lrbp)))
 		ufshcd_start_monitor(hba, lrbp);
 
-	spin_lock_irqsave(&hba->outstanding_lock, flags);
-	if (hba->vops && hba->vops->setup_xfer_req)
-		hba->vops->setup_xfer_req(hba, task_tag, !!lrbp->cmd);
-	__set_bit(task_tag, &hba->outstanding_reqs);
-	ufshcd_writel(hba, 1 << task_tag, REG_UTP_TRANSFER_REQ_DOOR_BELL);
-	spin_unlock_irqrestore(&hba->outstanding_lock, flags);
+	if (is_mcq_enabled(hba)) {
+		int utrd_size = sizeof(struct utp_transfer_req_desc);
+
+		spin_lock(&hwq->sq_lock);
+		memcpy(hwq->sqe_base_addr + (hwq->sq_tail_slot * utrd_size),
+		       lrbp->utr_descriptor_ptr, utrd_size);
+		ufshcd_inc_sq_tail(hwq);
+		spin_unlock(&hwq->sq_lock);
+	} else {
+		spin_lock_irqsave(&hba->outstanding_lock, flags);
+		if (hba->vops && hba->vops->setup_xfer_req)
+			hba->vops->setup_xfer_req(hba, lrbp->task_tag,
+						  !!lrbp->cmd);
+		__set_bit(lrbp->task_tag, &hba->outstanding_reqs);
+		ufshcd_writel(hba, 1 << lrbp->task_tag,
+			      REG_UTP_TRANSFER_REQ_DOOR_BELL);
+		spin_unlock_irqrestore(&hba->outstanding_lock, flags);
+	}
 }
 
 /**
@@ -2789,6 +2803,7 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 	int tag = scsi_cmd_to_rq(cmd)->tag;
 	struct ufshcd_lrb *lrbp;
 	int err = 0;
+	struct ufs_hw_queue *hwq = NULL;
 
 	WARN_ONCE(tag < 0 || tag >= hba->nutrs, "Invalid tag %d\n", tag);
 
@@ -2873,7 +2888,7 @@ static int ufshcd_queuecommand(struct Scsi_Host *host, struct scsi_cmnd *cmd)
 		goto out;
 	}
 
-	ufshcd_send_command(hba, tag);
+	ufshcd_send_command(hba, tag, hwq);
 
 out:
 	rcu_read_unlock();
@@ -3046,10 +3061,11 @@ static int ufshcd_exec_dev_cmd(struct ufs_hba *hba,
 		goto out;
 
 	hba->dev_cmd.complete = &wait;
+	hba->dev_cmd.cqe = NULL;
 
 	ufshcd_add_query_upiu_trace(hba, UFS_QUERY_SEND, lrbp->ucd_req_ptr);
 
-	ufshcd_send_command(hba, tag);
+	ufshcd_send_command(hba, tag, hba->dev_cmd_queue);
 	err = ufshcd_wait_for_dev_cmd(hba, lrbp, timeout);
 	ufshcd_add_query_upiu_trace(hba, err ? UFS_QUERY_ERR : UFS_QUERY_COMP,
 				    (struct utp_upiu_req *)lrbp->ucd_rsp_ptr);
@@ -6904,7 +6920,7 @@ static int ufshcd_issue_devman_upiu_cmd(struct ufs_hba *hba,
 
 	ufshcd_add_query_upiu_trace(hba, UFS_QUERY_SEND, lrbp->ucd_req_ptr);
 
-	ufshcd_send_command(hba, tag);
+	ufshcd_send_command(hba, tag, hba->dev_cmd_queue);
 	/*
 	 * ignore the returning value here - ufshcd_check_query_response is
 	 * bound to fail since dev_cmd.query and dev_cmd.type were left empty.
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 8bbea23..2625b4c 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -218,6 +218,7 @@ struct ufs_dev_cmd {
 	struct mutex lock;
 	struct completion *complete;
 	struct ufs_query query;
+	struct cq_entry *cqe;
 };
 
 /**
@@ -1054,6 +1055,8 @@ struct ufs_hba {
  * @cqe_dma_addr: completion queue dma address
  * @max_entries: max number of slots in this hardware queue
  * @id: hardware queue ID
+ * @sq_tp_slot: current slot to which SQ tail pointer is pointing
+ * @sq_lock: serialize submission queue access
  */
 struct ufs_hw_queue {
 	void __iomem *mcq_sq_head;
@@ -1067,6 +1070,8 @@ struct ufs_hw_queue {
 	dma_addr_t cqe_dma_addr;
 	u32 max_entries;
 	u32 id;
+	u32 sq_tail_slot;
+	spinlock_t sq_lock;
 };
 
 static inline bool is_mcq_enabled(struct ufs_hba *hba)
-- 
2.7.4

