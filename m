Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90BB5700090
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 08:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240029AbjELGbV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 02:31:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240042AbjELGbG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 02:31:06 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CC4A83C8;
        Thu, 11 May 2023 23:30:40 -0700 (PDT)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34C3n3A8001930;
        Fri, 12 May 2023 06:30:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=JYRuveHfxiDDn9lriPtHcUMtt96+XzuPPb00kzOgFlA=;
 b=XRjPHsUsZguvQchmXKQ9FE2ebiUHw2Z7kanFVEPQO8UzueB029/mrg04RhLmlhbim3ub
 PjchGS6649A3qoSd7UnGnumv5FUwq62HM4JNlqPk6k9XJv1BMPJMeUrjfQJ1ResxFxOW
 bMdCBPzg7fLMP7RSvVqy+ND9VLVMbDbFbD5Pp8qHq43fZYYdYR2DxTXff6xGVIyeA+ob
 Jo2yg8NQ3K7M+MlJ3KOQslIO00+p4ZL+NJkWb1QpYbwyYQTr8v2lKTuNbrPzt5YL3B0l
 ozvu55UyGpBjw5WfBdve8Qk3JTq2NlNBwd303xOkJt3Q4AB4RUnAIPX8j+kGokFT9qJi nw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qhayt0m0a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 May 2023 06:30:27 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34C6UQAr028463
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 12 May 2023 06:30:26 GMT
Received: from stor-berry.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 11 May 2023 23:30:25 -0700
From:   "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
To:     <quic_asutoshd@quicinc.com>, <quic_cang@quicinc.com>,
        <bvanassche@acm.org>, <mani@kernel.org>,
        <stanley.chu@mediatek.com>, <adrian.hunter@intel.com>,
        <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <martin.petersen@oracle.com>
CC:     <linux-scsi@vger.kernel.org>,
        "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Alice Chao <alice.chao@mediatek.com>,
        Arthur Simchaev <Arthur.Simchaev@wdc.com>,
        "open list" <linux-kernel@vger.kernel.org>,
        "open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..." 
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v5 6/7] ufs: mcq: Use ufshcd_mcq_poll_cqe_lock() in mcq mode
Date:   Thu, 11 May 2023 23:28:53 -0700
Message-ID: <15f2844264a3308347d3986f72e6078bcaca5b55.1683872601.git.quic_nguyenb@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1683872601.git.quic_nguyenb@quicinc.com>
References: <cover.1683872601.git.quic_nguyenb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hx5hNray72V7AAUIQT8lV_K5nG668r2W
X-Proofpoint-GUID: hx5hNray72V7AAUIQT8lV_K5nG668r2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-12_03,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305120056
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation for adding mcq error handler support, update the mcq
code to use the ufshcd_mcq_poll_cqe_lock() in interrupt context
instead of using ufshcd_mcq_poll_cqe_nolock(). This is to keep
synchronization between mcq interrupt and error handler contexts
because both need to access the mcq hardware in separate contexts.

Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
---
 drivers/ufs/core/ufs-mcq.c     | 6 +++---
 drivers/ufs/core/ufshcd-priv.h | 2 --
 drivers/ufs/core/ufshcd.c      | 2 +-
 drivers/ufs/host/ufs-qcom.c    | 2 +-
 include/ufs/ufshcd.h           | 2 +-
 5 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 63db20b..2efa012 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -284,8 +284,8 @@ static void ufshcd_mcq_process_cqe(struct ufs_hba *hba,
 	ufshcd_compl_one_cqe(hba, tag, cqe);
 }
 
-unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
-					 struct ufs_hw_queue *hwq)
+static unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
+						struct ufs_hw_queue *hwq)
 {
 	unsigned long completed_reqs = 0;
 
@@ -301,7 +301,6 @@ unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
 
 	return completed_reqs;
 }
-EXPORT_SYMBOL_GPL(ufshcd_mcq_poll_cqe_nolock);
 
 unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
 				       struct ufs_hw_queue *hwq)
@@ -314,6 +313,7 @@ unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
 
 	return completed_reqs;
 }
+EXPORT_SYMBOL_GPL(ufshcd_mcq_poll_cqe_lock);
 
 void ufshcd_mcq_make_queues_operational(struct ufs_hba *hba)
 {
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 80293fd..339ab51 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -71,8 +71,6 @@ void ufshcd_mcq_config_mac(struct ufs_hba *hba, u32 max_active_cmds);
 void ufshcd_mcq_select_mcq_mode(struct ufs_hba *hba);
 u32 ufshcd_mcq_read_cqis(struct ufs_hba *hba, int i);
 void ufshcd_mcq_write_cqis(struct ufs_hba *hba, u32 val, int i);
-unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
-					 struct ufs_hw_queue *hwq);
 struct ufs_hw_queue *ufshcd_mcq_req_to_hwq(struct ufs_hba *hba,
 					   struct request *req);
 unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index bcc2ae9..ec07e49 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -6811,7 +6811,7 @@ static irqreturn_t ufshcd_handle_mcq_cq_events(struct ufs_hba *hba)
 			ufshcd_mcq_write_cqis(hba, events, i);
 
 		if (events & UFSHCD_MCQ_CQIS_TAIL_ENT_PUSH_STS)
-			ufshcd_mcq_poll_cqe_nolock(hba, hwq);
+			ufshcd_mcq_poll_cqe_lock(hba, hwq);
 	}
 
 	return IRQ_HANDLED;
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 82d02e7..57f5674 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1556,7 +1556,7 @@ static irqreturn_t ufs_qcom_mcq_esi_handler(int irq, void *__hba)
 	struct ufs_hw_queue *hwq = &hba->uhq[id];
 
 	ufshcd_mcq_write_cqis(hba, 0x1, id);
-	ufshcd_mcq_poll_cqe_nolock(hba, hwq);
+	ufshcd_mcq_poll_cqe_lock(hba, hwq);
 
 	return IRQ_HANDLED;
 }
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 3c9ecda..dd74896 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1244,7 +1244,7 @@ void ufshcd_update_evt_hist(struct ufs_hba *hba, u32 id, u32 val);
 void ufshcd_hba_stop(struct ufs_hba *hba);
 void ufshcd_schedule_eh_work(struct ufs_hba *hba);
 void ufshcd_mcq_write_cqis(struct ufs_hba *hba, u32 val, int i);
-unsigned long ufshcd_mcq_poll_cqe_nolock(struct ufs_hba *hba,
+unsigned long ufshcd_mcq_poll_cqe_lock(struct ufs_hba *hba,
 					 struct ufs_hw_queue *hwq);
 void ufshcd_mcq_enable_esi(struct ufs_hba *hba);
 void ufshcd_mcq_config_esi(struct ufs_hba *hba, struct msi_msg *msg);
-- 
2.7.4

