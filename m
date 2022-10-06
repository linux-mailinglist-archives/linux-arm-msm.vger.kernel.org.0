Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00FFC5F5E2E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 03:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbiJFBG5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Oct 2022 21:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbiJFBGz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Oct 2022 21:06:55 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8369B70E5D;
        Wed,  5 Oct 2022 18:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1665018414; x=1696554414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=qkPByYWqYWJvCMPmFcb+WFV+Ww8M1pFZUIas0akgteA=;
  b=Vwtl85gCXQMsv/o3tvAwSFisMEcjd2DuVh1VbhrspWiu4jgtSpg0X4na
   /nGvizbGHI/kQG1dexUSM3aFs4V/hTpkf4Isbi9TySwWPVtTk8hz+u/wO
   kuXTZy9xXVQY1fQdSlQiOKGDoNRy45H+55tyaFkRerhdO56ZxKNEkdyuH
   4=;
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
Subject: [PATCH v2 13/17] ufs: core: Prepare for completion in mcq
Date:   Wed, 5 Oct 2022 18:06:12 -0700
Message-ID: <627ab3a2c626d458af12904d34a086b0a5189509.1665017636.git.quic_asutoshd@quicinc.com>
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

Modifies completion path APIs and adds completion queue
entry.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
---
 drivers/ufs/core/ufshcd-priv.h |  2 ++
 drivers/ufs/core/ufshcd.c      | 80 ++++++++++++++++++++++++++----------------
 2 files changed, 52 insertions(+), 30 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 44ef266..62ae7e51 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -50,6 +50,8 @@ int ufshcd_query_attr(struct ufs_hba *hba, enum query_opcode opcode,
 int ufshcd_query_flag(struct ufs_hba *hba, enum query_opcode opcode,
 	enum flag_idn idn, u8 index, bool *flag_res);
 void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit);
+void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
+			  struct cq_entry *cqe);
 int ufshcd_mcq_init(struct ufs_hba *hba);
 u32 ufshcd_mcq_decide_queue_depth(struct ufs_hba *hba);
 int ufshcd_mcq_memory_alloc(struct ufs_hba *hba);
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index e514c20..ac3b498 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -752,12 +752,17 @@ static inline bool ufshcd_is_device_present(struct ufs_hba *hba)
 /**
  * ufshcd_get_tr_ocs - Get the UTRD Overall Command Status
  * @lrbp: pointer to local command reference block
+ * @cqe: pointer to the completion queue entry
  *
  * This function is used to get the OCS field from UTRD
  * Returns the OCS field in the UTRD
  */
-static enum utp_ocs ufshcd_get_tr_ocs(struct ufshcd_lrb *lrbp)
+static enum utp_ocs ufshcd_get_tr_ocs(struct ufshcd_lrb *lrbp,
+				      struct cq_entry *cqe)
 {
+	if (cqe)
+		return le32_to_cpu(cqe->status) & MASK_OCS;
+
 	return le32_to_cpu(lrbp->utr_descriptor_ptr->header.dword_2) & MASK_OCS;
 }
 
@@ -3009,7 +3014,7 @@ static int ufshcd_wait_for_dev_cmd(struct ufs_hba *hba,
 	spin_lock_irqsave(hba->host->host_lock, flags);
 	hba->dev_cmd.complete = NULL;
 	if (likely(time_left)) {
-		err = ufshcd_get_tr_ocs(lrbp);
+		err = ufshcd_get_tr_ocs(lrbp, hba->dev_cmd.cqe);
 		if (!err)
 			err = ufshcd_dev_cmd_completion(hba, lrbp);
 	}
@@ -5199,18 +5204,20 @@ ufshcd_scsi_cmd_status(struct ufshcd_lrb *lrbp, int scsi_status)
  * ufshcd_transfer_rsp_status - Get overall status of the response
  * @hba: per adapter instance
  * @lrbp: pointer to local reference block of completed command
+ * @cqe: pointer to the completion queue entry
  *
  * Returns result of the command to notify SCSI midlayer
  */
 static inline int
-ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp)
+ufshcd_transfer_rsp_status(struct ufs_hba *hba, struct ufshcd_lrb *lrbp,
+			   struct cq_entry *cqe)
 {
 	int result = 0;
 	int scsi_status;
 	enum utp_ocs ocs;
 
 	/* overall command status of utrd */
-	ocs = ufshcd_get_tr_ocs(lrbp);
+	ocs = ufshcd_get_tr_ocs(lrbp, cqe);
 
 	if (hba->quirks & UFSHCD_QUIRK_BROKEN_OCS_FATAL_ERROR) {
 		if (be32_to_cpu(lrbp->ucd_rsp_ptr->header.dword_1) &
@@ -5375,41 +5382,54 @@ static void ufshcd_release_scsi_cmd(struct ufs_hba *hba,
 }
 
 /**
- * __ufshcd_transfer_req_compl - handle SCSI and query command completion
+ * ufshcd_compl_one_cqe - handle a completion queue entry
  * @hba: per adapter instance
- * @completed_reqs: bitmask that indicates which requests to complete
+ * @task_tag: the task tag of the request to be completed
+ * @cqe: pointer to the completion queue entry
  */
-static void __ufshcd_transfer_req_compl(struct ufs_hba *hba,
-					unsigned long completed_reqs)
+void ufshcd_compl_one_cqe(struct ufs_hba *hba, int task_tag,
+			  struct cq_entry *cqe)
 {
 	struct ufshcd_lrb *lrbp;
 	struct scsi_cmnd *cmd;
-	int index;
-
-	for_each_set_bit(index, &completed_reqs, hba->nutrs) {
-		lrbp = &hba->lrb[index];
-		lrbp->compl_time_stamp = ktime_get();
-		cmd = lrbp->cmd;
-		if (cmd) {
-			if (unlikely(ufshcd_should_inform_monitor(hba, lrbp)))
-				ufshcd_update_monitor(hba, lrbp);
-			ufshcd_add_command_trace(hba, index, UFS_CMD_COMP);
-			cmd->result = ufshcd_transfer_rsp_status(hba, lrbp);
-			ufshcd_release_scsi_cmd(hba, lrbp);
-			/* Do not touch lrbp after scsi done */
-			scsi_done(cmd);
-		} else if (lrbp->command_type == UTP_CMD_TYPE_DEV_MANAGE ||
-			lrbp->command_type == UTP_CMD_TYPE_UFS_STORAGE) {
-			if (hba->dev_cmd.complete) {
-				ufshcd_add_command_trace(hba, index,
-							 UFS_DEV_COMP);
-				complete(hba->dev_cmd.complete);
-				ufshcd_clk_scaling_update_busy(hba);
-			}
+
+	lrbp = &hba->lrb[task_tag];
+	lrbp->compl_time_stamp = ktime_get();
+	cmd = lrbp->cmd;
+	if (cmd) {
+		if (unlikely(ufshcd_should_inform_monitor(hba, lrbp)))
+			ufshcd_update_monitor(hba, lrbp);
+		ufshcd_add_command_trace(hba, task_tag, UFS_CMD_COMP);
+		cmd->result = ufshcd_transfer_rsp_status(hba, lrbp, cqe);
+		ufshcd_release_scsi_cmd(hba, lrbp);
+		/* Do not touch lrbp after scsi done */
+		scsi_done(cmd);
+	} else if (lrbp->command_type == UTP_CMD_TYPE_DEV_MANAGE ||
+		   lrbp->command_type == UTP_CMD_TYPE_UFS_STORAGE) {
+		if (hba->dev_cmd.complete) {
+			hba->dev_cmd.cqe = cqe;
+			ufshcd_add_command_trace(hba, task_tag, UFS_DEV_COMP);
+			complete(hba->dev_cmd.complete);
+			ufshcd_clk_scaling_update_busy(hba);
 		}
 	}
 }
 
+
+/**
+ * __ufshcd_transfer_req_compl - handle SCSI and query command completion
+ * @hba: per adapter instance
+ * @completed_reqs: bitmask that indicates which requests to complete
+ */
+static void __ufshcd_transfer_req_compl(struct ufs_hba *hba,
+					unsigned long completed_reqs)
+{
+	int tag;
+
+	for_each_set_bit(tag, &completed_reqs, hba->nutrs)
+		ufshcd_compl_one_cqe(hba, tag, NULL);
+}
+
 /*
  * Returns > 0 if one or more commands have been completed or 0 if no
  * requests have been completed.
-- 
2.7.4

