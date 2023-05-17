Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDDDE70723F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 May 2023 21:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbjEQTgX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 May 2023 15:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjEQTgV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 May 2023 15:36:21 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24468E4;
        Wed, 17 May 2023 12:36:19 -0700 (PDT)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34HJ85C7009230;
        Wed, 17 May 2023 19:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=3CvJjTFDBBGbjsEpRMixb/b2QnSDoZ7DAlJA0PNNj9k=;
 b=ct4i+An4RBTDJfLoS8lzW8CV2g8uquwYWUx2O+rgtI3DUbOdpLrKTc/ESQzYgwAIfzKc
 vDq42VdhTuDwhxgnj6qMxJWKCMMjeIKAacwGj9CpZvu+kJCHfpew7mdpttABPCiMSVzv
 nSfMpK+2YBMwn0QQdt+Os/zsaYCWBYCBI1mYCLwHiNrmLAD3dYuqPZDQvHMSVMGslarU
 VC0NF97dCeFRLxbdG8QFQNY/ui6omI8eB2QoYF6rVpZTpDP4DQfyRwxXk0c8Xr1WA3b+
 H8Y1lhhFqlrlAJZHJ8xj7aq+hV4ZQ+VyhMHKo6WnGhplRvKYJrZ82A4bevExc5FjUNnB RQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qmxyp10gr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 19:36:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 34HJaDtW031222
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 May 2023 19:36:13 GMT
Received: from jhugo-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 17 May 2023 12:36:12 -0700
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
To:     <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
        <quic_pkanojiy@quicinc.com>, <stanislaw.gruszka@linux.intel.com>,
        <quic_carlv@quicinc.com>, <quic_ajitpals@quicinc.com>
CC:     <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: [PATCH 5/5] accel/qaic: Fix NNC message corruption
Date:   Wed, 17 May 2023 13:35:40 -0600
Message-ID: <20230517193540.14323-6-quic_jhugo@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230517193540.14323-1-quic_jhugo@quicinc.com>
References: <20230517193540.14323-1-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8NB7hlq_CWI09biYXn4AEfAZpFEat7bf
X-Proofpoint-GUID: 8NB7hlq_CWI09biYXn4AEfAZpFEat7bf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-17_04,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305170162
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If msg_xfer() is unable to queue part of a NNC message because the MHI ring
is full, it will attempt to give the QSM some time to drain the queue.
However, if QSM fails to make any room, msg_xfer() will fail and tell the
caller to try again.  This is problematic because part of the message may
have been committed to the ring and there is no mechanism to revoke that
content.  This will cause QSM to receive a corrupt message.

The better way to do this is to check if the ring has enough space for the
entire message before committing any of the message.  Since msg_xfer() is
under the cntl_mutex no one else can come in and consume the space.

Fixes: 129776ac2e38 ("accel/qaic: Add control path")
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
---
 drivers/accel/qaic/qaic_control.c | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 9e39b1a324f7..5c57f7b4494e 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -997,14 +997,34 @@ static void *msg_xfer(struct qaic_device *qdev, struct wrapper_list *wrappers, u
 	struct xfer_queue_elem elem;
 	struct wire_msg *out_buf;
 	struct wrapper_msg *w;
+	long ret = -EAGAIN;
+	int xfer_count = 0;
 	int retry_count;
-	long ret;
 
 	if (qdev->in_reset) {
 		mutex_unlock(&qdev->cntl_mutex);
 		return ERR_PTR(-ENODEV);
 	}
 
+	/* Attempt to avoid a partial commit of a message */
+	list_for_each_entry(w, &wrappers->list, list)
+		xfer_count++;
+
+	for (retry_count = 0; retry_count < QAIC_MHI_RETRY_MAX; retry_count++) {
+		if (xfer_count <= mhi_get_free_desc_count(qdev->cntl_ch, DMA_TO_DEVICE)) {
+			ret = 0;
+			break;
+		}
+		msleep_interruptible(QAIC_MHI_RETRY_WAIT_MS);
+		if (signal_pending(current))
+			break;
+	}
+
+	if (ret) {
+		mutex_unlock(&qdev->cntl_mutex);
+		return ERR_PTR(ret);
+	}
+
 	elem.seq_num = seq_num;
 	elem.buf = NULL;
 	init_completion(&elem.xfer_done);
@@ -1038,16 +1058,9 @@ static void *msg_xfer(struct qaic_device *qdev, struct wrapper_list *wrappers, u
 	list_for_each_entry(w, &wrappers->list, list) {
 		kref_get(&w->ref_count);
 		retry_count = 0;
-retry:
 		ret = mhi_queue_buf(qdev->cntl_ch, DMA_TO_DEVICE, &w->msg, w->len,
 				    list_is_last(&w->list, &wrappers->list) ? MHI_EOT : MHI_CHAIN);
 		if (ret) {
-			if (ret == -EAGAIN && retry_count++ < QAIC_MHI_RETRY_MAX) {
-				msleep_interruptible(QAIC_MHI_RETRY_WAIT_MS);
-				if (!signal_pending(current))
-					goto retry;
-			}
-
 			qdev->cntl_lost_buf = true;
 			kref_put(&w->ref_count, free_wrapper);
 			mutex_unlock(&qdev->cntl_mutex);
-- 
2.40.1

