Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E68F57798FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 22:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235606AbjHKU7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 16:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233798AbjHKU67 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 16:58:59 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20394E7E;
        Fri, 11 Aug 2023 13:58:57 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37BFv8c5030614;
        Fri, 11 Aug 2023 20:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=rjRUCS76I8CfgS+Dkl3KtXFJE42El+shzDO6P7guxK4=;
 b=kABoSGnWg5EZDiBaxlLu80Wiw/qyfTzbaQFKJJJSSa5QolHIGxIM24WyNOGu86VY0Owf
 dtdDhHdA7pceH//HeT57DCO+0Xpzo/jUE4aqvVFa7y/a09U1aa4fA8YGWAZfp207NPdS
 00rvZi2vk5LqwQnJf6tu51qDolPwDTdL3o5PctHXsrV3h7A0HkHFbrBmhqpVXRw1QynF
 amR8vLTbIksWF5nAhjtGC+d8Y9J1IlS95anKFzfi8X0BszON9QrW0Dk6AM+cj5XfyIem
 rfJRpjDvw1oM+H6+i3E7S3COlNeNId/y2MUx8IP6Rf/9kY9ppjaD/QQ94a8MjhFuvqrO Gg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sd8ybtr2d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Aug 2023 20:58:46 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37BKwkbM008697
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 11 Aug 2023 20:58:46 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 11 Aug 2023 13:58:45 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>
CC:     Alex Elder <elder@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 2/4] soc: qcom: aoss: Add debugfs interface for sending messages
Date:   Fri, 11 Aug 2023 13:58:37 -0700
Message-ID: <20230811205839.727373-3-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230811205839.727373-1-quic_bjorande@quicinc.com>
References: <20230811205839.727373-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GJ_kAZJX-pBjPuBdBOheuX1VWHS2gg32
X-Proofpoint-GUID: GJ_kAZJX-pBjPuBdBOheuX1VWHS2gg32
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-11_12,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308110193
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

In addition to the normal runtime commands, the Always On Processor
(AOP) provides a number of debug commands which can be used during
system debugging for things such as preventing power collapse or placing
floor votes for certain resources. Some of these are documented in the
Robotics RB5 "Debug AOP ADB" linked below.

Provide a debugfs interface for the developer/tester to send these
commands to the AOP.

Link: https://docs.qualcomm.com/bundle/publicresource/topics/80-88500-3/85_Debugging_AOP_ADB.html
Signed-off-by: Chris Lew <clew@codeaurora.org>
[bjorn: Dropped debugfs guards, improve error codes, rewrote commit message]
Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/soc/qcom/qcom_aoss.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 880fe234ca0a..13bf13ab78d6 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2019, Linaro Ltd
  */
 #include <linux/clk-provider.h>
+#include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/mailbox_client.h>
@@ -82,6 +83,7 @@ struct qmp {
 
 	struct clk_hw qdss_clk;
 	struct qmp_cooling_device *cooling_devs;
+	struct dentry *debugfs_file;
 };
 
 static void qmp_kick(struct qmp *qmp)
@@ -475,6 +477,32 @@ void qmp_put(struct qmp *qmp)
 }
 EXPORT_SYMBOL(qmp_put);
 
+static ssize_t qmp_debugfs_write(struct file *file, const char __user *userstr,
+				 size_t len, loff_t *pos)
+{
+	struct qmp *qmp = file->private_data;
+	char buf[QMP_MSG_LEN];
+	int ret;
+
+	if (!len || len >= QMP_MSG_LEN)
+		return -EINVAL;
+
+	if (copy_from_user(buf, userstr, len))
+		return -EFAULT;
+	buf[len] = '\0';
+
+	ret = qmp_send(qmp, buf);
+	if (ret < 0)
+		return ret;
+
+	return len;
+}
+
+static const struct file_operations qmp_debugfs_fops = {
+	.open = simple_open,
+	.write = qmp_debugfs_write,
+};
+
 static int qmp_probe(struct platform_device *pdev)
 {
 	struct qmp *qmp;
@@ -523,6 +551,9 @@ static int qmp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qmp);
 
+	qmp->debugfs_file = debugfs_create_file("aoss_send_message", 0220, NULL,
+						qmp, &qmp_debugfs_fops);
+
 	return 0;
 
 err_close_qmp:
@@ -537,6 +568,8 @@ static int qmp_remove(struct platform_device *pdev)
 {
 	struct qmp *qmp = platform_get_drvdata(pdev);
 
+	debugfs_remove(qmp->debugfs_file);
+
 	qmp_qdss_clk_remove(qmp);
 	qmp_cooling_devices_remove(qmp);
 
-- 
2.25.1

