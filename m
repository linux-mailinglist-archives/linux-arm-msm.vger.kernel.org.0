Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0314A345E1D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 13:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbhCWM2v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 08:28:51 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:8078 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230417AbhCWM2k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 08:28:40 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12NCN2Dv029871;
        Tue, 23 Mar 2021 13:28:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=U0PCpjkba8UMGjDr85sbHdJLoyzztXsf67NJxKJ+3Qg=;
 b=s25y03f7PlZEj5kp3mdI8yQ7JbrNtDZvtHIQF8isacSKVu8Vh1sNUdcT3HK151ylD24W
 bu2/Yg9NKqdxHhi3xFZb1vy7yts1FZzPZMFesjjPkzlFynGSL6rhWVa3bpLaECmYsClB
 FW7uAUsN3nGapuxHDiTqOu8/yA0Q9nEgeZWf3wFHKNmbRukyTjqcZ3Hk1bZ0vRQeEDJy
 r1ZGfGjXD7DdgXJfackg6gcTy+1JGSY6qSKRapJmJqJoFz/YnsxxzQuO/kn9I+JfFujJ
 /loxcjUu3u0Tj+JAi4PO9kPSZGFxMU0mPGRipLIWViOmOIaOpLRHcH/BBnID+oprK3eu MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37d72dqkxv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 23 Mar 2021 13:28:32 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C35E0100034;
        Tue, 23 Mar 2021 13:28:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AFA8024CF45;
        Tue, 23 Mar 2021 13:28:31 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 23 Mar 2021 13:28:30
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 4/7] rpmsg: char: Introduce __rpmsg_chrdev_create_eptdev function
Date:   Tue, 23 Mar 2021 13:27:34 +0100
Message-ID: <20210323122737.23035-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
References: <20210323122737.23035-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-23_06:2021-03-22,2021-03-23 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce the __rpmsg_chrdev_create_eptdev internal function that returns
the rpmsg_eptdev context structure.

This patch prepares the introduction of a rpmsg channel device for the
char device. The rpmsg device will need a reference to the context.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---
update from [1]
- propagate parent param in rpmsg_chrdev_create_eptdev,
- fix changelog.

[1] https://patchwork.kernel.org/project/linux-remoteproc/patch/20210219111501.14261-14-arnaud.pouliquen@foss.st.com/
---
 drivers/rpmsg/rpmsg_char.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
index 5d4a768002ce..7f6d46078179 100644
--- a/drivers/rpmsg/rpmsg_char.c
+++ b/drivers/rpmsg/rpmsg_char.c
@@ -325,7 +325,8 @@ static void rpmsg_eptdev_release_device(struct device *dev)
 	kfree(eptdev);
 }
 
-int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
+static struct rpmsg_eptdev *__rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev,
+							 struct device *parent,
 			       struct rpmsg_channel_info chinfo, struct class *rpmsg_class)
 {
 	struct rpmsg_eptdev *eptdev;
@@ -334,7 +335,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
 
 	eptdev = kzalloc(sizeof(*eptdev), GFP_KERNEL);
 	if (!eptdev)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	dev = &eptdev->dev;
 	eptdev->rpdev = rpdev;
@@ -378,7 +379,7 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
 		put_device(dev);
 	}
 
-	return ret;
+	return eptdev;
 
 free_ept_ida:
 	ida_simple_remove(&rpmsg_ept_ida, dev->id);
@@ -388,7 +389,19 @@ int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent
 	put_device(dev);
 	kfree(eptdev);
 
-	return ret;
+	return ERR_PTR(ret);
+}
+
+int rpmsg_chrdev_create_eptdev(struct rpmsg_device *rpdev, struct device *parent,
+			       struct rpmsg_channel_info chinfo,  struct class *rpmsg_class)
+{
+	struct rpmsg_eptdev *eptdev;
+
+	eptdev = __rpmsg_chrdev_create_eptdev(rpdev, parent, chinfo, rpmsg_class);
+	if (IS_ERR(eptdev))
+		return PTR_ERR(eptdev);
+
+	return 0;
 }
 EXPORT_SYMBOL(rpmsg_chrdev_create_eptdev);
 
-- 
2.17.1

