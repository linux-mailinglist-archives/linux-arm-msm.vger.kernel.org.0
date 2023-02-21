Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0DD69E279
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 15:37:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234488AbjBUOhs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 09:37:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234497AbjBUOhr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 09:37:47 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45AD72A9BB;
        Tue, 21 Feb 2023 06:37:44 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31LAuH6c025097;
        Tue, 21 Feb 2023 14:37:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=II7QEe3Jghj7espYx8lU9xmpQ9Y227R7oAzE/Y6HPWM=;
 b=ZFcT0e2aq8BHMSyTQmbWHCc0gJyN0VHDG9jkcqpmSXXYbJCX7LcrLHCYNh9kHAz0mHPz
 YegK7L09XZ40nfXDn7eYph2si2KMHc5f3gQB9N2lm2wsSAYF6XAcc90NvOnctbUadfFO
 7SpYNwAuIjeaCuzVJr7odJgQEBXv+lV1lEEJo0jO7P4ldSHvK+847mnA4Wufh33l2fN3
 GoP6L66hbCo9wz64lEIqd2wpmOtK6jx+vBlrq06WcTPJmTVqlWNZxe/iYB3iYmc7xrEL
 MD68lX6AaS5pMmZc/zeaIdQXD/rMaOyXGPH/XquQkmfj+wywyIL3qv+5u5alEm7iI7it 0g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3nvp211cba-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Feb 2023 14:37:37 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31LEbapX024650
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Feb 2023 14:37:36 GMT
Received: from sarannya-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 21 Feb 2023 06:37:32 -0800
From:   Sarannya S <quic_sarannya@quicinc.com>
To:     <quic_bjorande@quicinc.com>, <arnaud.pouliquen@foss.st.com>,
        <swboyd@chromium.org>, <quic_clew@quicinc.com>,
        <mathieu.poirier@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        Sarannya S <quic_sarannya@quicinc.com>,
        Deepak Kumar Singh <quic_deesin@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH V5 3/3] rpmsg: char: Add TIOCMGET/TIOCMSET ioctl support
Date:   Tue, 21 Feb 2023 20:05:14 +0530
Message-ID: <1676990114-1369-4-git-send-email-quic_sarannya@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1676990114-1369-1-git-send-email-quic_sarannya@quicinc.com>
References: <1676990114-1369-1-git-send-email-quic_sarannya@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hJWid7dGT5aa8Y7YoMazUmh3cA6d6V_Y
X-Proofpoint-GUID: hJWid7dGT5aa8Y7YoMazUmh3cA6d6V_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_08,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 malwarescore=0 mlxlogscore=931 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302210122
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add TICOMGET and TIOCMSET ioctl support for rpmsg char device nodes
to get/set the low level transport signals.

Signed-off-by: Chris Lew <quic_clew@quicinc.com>
Signed-off-by: Deepak Kumar Singh <quic_deesin@quicinc.com>
Signed-off-by: Sarannya S <quic_sarannya@quicinc.com>
---
 drivers/rpmsg/rpmsg_char.c | 60 +++++++++++++++++++++++++++++++++++++++-------
 include/uapi/linux/rpmsg.h | 11 +++++++++
 2 files changed, 63 insertions(+), 8 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 3e0b8f3..fdcb4ff 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -23,6 +23,7 @@
 #include <linux/rpmsg.h>
 #include <linux/skbuff.h>
 #include <linux/slab.h>
+#include <linux/termios.h>
 #include <linux/uaccess.h>
 #include <uapi/linux/rpmsg.h>
 
@@ -68,6 +69,8 @@ struct rpmsg_eptdev {
 	struct sk_buff_head queue;
 	wait_queue_head_t readq;
 
+	u32 remote_signals;
+	bool flow_control;
 };
 
 int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
@@ -109,7 +112,22 @@ static int rpmsg_ept_cb(struct rpmsg_device *rpdev, void *buf, int len,
 	skb_queue_tail(&eptdev->queue, skb);
 	spin_unlock(&eptdev->queue_lock);
 
-	/* wake up any blocking processes, waiting for new data */
+	wake_up_interruptible(&eptdev->readq);
+
+	return 0;
+}
+
+static int rpmsg_ept_flow_cb(struct rpmsg_device *rpdev, void *priv, bool enable)
+{
+	struct rpmsg_eptdev *eptdev = priv;
+
+	if (enable)
+		eptdev->remote_signals = RPMSG_FLOW_CONTROL_ON;
+	else
+		eptdev->remote_signals = 0;
+
+	eptdev->flow_control = true;
+
 	wake_up_interruptible(&eptdev->readq);
 
 	return 0;
@@ -146,6 +164,7 @@ static int rpmsg_eptdev_open(struct inode *inode, struct file *filp)
 		return -EINVAL;
 	}
 
+	ept->flow_cb = rpmsg_ept_flow_cb;
 	eptdev->ept = ept;
 	filp->private_data = eptdev;
 	mutex_unlock(&eptdev->ept_lock);
@@ -166,6 +185,7 @@ static int rpmsg_eptdev_release(struct inode *inode, struct file *filp)
 		eptdev->ept = NULL;
 	}
 	mutex_unlock(&eptdev->ept_lock);
+	eptdev->flow_control = false;
 
 	/* Discard all SKBs */
 	skb_queue_purge(&eptdev->queue);
@@ -279,6 +299,9 @@ static __poll_t rpmsg_eptdev_poll(struct file *filp, poll_table *wait)
 	if (!skb_queue_empty(&eptdev->queue))
 		mask |= EPOLLIN | EPOLLRDNORM;
 
+	if (eptdev->flow_control)
+		mask |= EPOLLPRI;
+
 	mask |= rpmsg_poll(eptdev->ept, filp, wait);
 
 	return mask;
@@ -289,14 +312,35 @@ static long rpmsg_eptdev_ioctl(struct file *fp, unsigned int cmd,
 {
 	struct rpmsg_eptdev *eptdev = fp->private_data;
 
-	if (cmd != RPMSG_DESTROY_EPT_IOCTL)
-		return -EINVAL;
-
-	/* Don't allow to destroy a default endpoint. */
-	if (eptdev->default_ept)
-		return -EINVAL;
+	bool set;
+	u32 val;
+	int ret;
+	
+	switch (cmd) {
+	case RPMSG_GET_SIGNAL_IOCTL:
+		eptdev->flow_control = false;
+		ret = put_user(eptdev->remote_signals, (int __user *)arg);
+		break;
+	case RPMSG_SET_SIGNAL_IOCTL:
+		ret = get_user(val, (int __user *)arg);
+		if (ret)
+			break;
+		set = (val & RPMSG_FLOW_CONTROL_ON) ? true : false;
+		ret = rpmsg_set_flow_control(eptdev->ept, set);
+		break;
+	case RPMSG_DESTROY_EPT_IOCTL:
+		/* Don't allow to destroy a default endpoint. */
+		if (eptdev->default_ept) {
+			ret = -EINVAL;
+			break;
+		}
+		ret = rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
+		break;
+	default:
+		ret = -EINVAL;
+	}
 
-	return rpmsg_chrdev_eptdev_destroy(&eptdev->dev, NULL);
+	return ret;
 }
 
 static const struct file_operations rpmsg_eptdev_fops = {
diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
index 1637e68..e9aa6b9 100644
--- a/include/uapi/linux/rpmsg.h
+++ b/include/uapi/linux/rpmsg.h
@@ -10,6 +10,7 @@
 #include <linux/types.h>
 
 #define RPMSG_ADDR_ANY		0xFFFFFFFF
+#define RPMSG_FLOW_CONTROL_ON  0x001
 
 /**
  * struct rpmsg_endpoint_info - endpoint info representation
@@ -43,4 +44,14 @@ struct rpmsg_endpoint_info {
  */
 #define RPMSG_RELEASE_DEV_IOCTL	_IOW(0xb5, 0x4, struct rpmsg_endpoint_info)
 
+/**
+ * Get the remote rpmsg char device's flow control signal.
+ */
+#define RPMSG_GET_SIGNAL_IOCTL _IOW(0xb5, 0x5, struct rpmsg_endpoint_info)
+
+/**
+ * Set the flow control for the local rpmsg char device.
+ */
+#define RPMSG_SET_SIGNAL_IOCTL _IOW(0xb5, 0x6, struct rpmsg_endpoint_info)
+
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

