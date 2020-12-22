Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DE42E0943
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 12:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgLVK7T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 05:59:19 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:39112 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726472AbgLVK6z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 05:58:55 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BMAw9pW004543;
        Tue, 22 Dec 2020 11:58:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=c2XvvSMgDCCnTaAY3jbSmk9uGPUA2xW5xqLUmTInDws=;
 b=C6kLm2urh/nNP2rHpTyJquSyFfD/bhecqA2xfmCpcsduiLLQt1uR9/liJJIYPGqnQhQ6
 2knMTojgTIJ91Lmvv4dSbSiIlUi6J53E0BXIExXVcv9iZmMAH8FugTG0mo0CxdxFTXEz
 R3cE1cn/+Z+eM+lXwCKvzb2sIjZlWTHvkHpjjLWWDoezlZz19divlGrBaPp8e45vJnM7
 JFOxc4DswdQpZrAFlx0KsuAQ1jEcgH9njGB4A+BVsRZJW3vhTK9CKZh9CstSydHbHZzv
 gfYqsB7m9nbjj6iPuY+O+9AI8reFUmztSBPC/FkJ+LNu8OPNgFw3mZCcFyDY3GfSNMYj jg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 35k0cgky5m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Dec 2020 11:58:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 03781100034;
        Tue, 22 Dec 2020 11:58:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E9A4022ECB4;
        Tue, 22 Dec 2020 11:58:08 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 22 Dec 2020 11:58:08
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v2 13/16] rpmsg: virtio: probe the rpmsg_ctl device
Date:   Tue, 22 Dec 2020 11:57:23 +0100
Message-ID: <20201222105726.16906-14-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
References: <20201222105726.16906-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-22_04:2020-12-21,2020-12-22 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Probe the rpmsg_ctl driver on virtio rpmsg bus creation.
This provides the possibility to expose an ioctrl to create
RPMsg channels.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 37 +++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index c1d4bc08b2a5..e8caccb2d298 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -814,6 +814,35 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
 	wake_up_interruptible(&vrp->sendq);
 }
 
+static struct rpmsg_device *rpmsg_virtio_add_char_dev(struct virtio_device *vdev)
+{
+	struct virtproc_info *vrp = vdev->priv;
+	struct virtio_rpmsg_channel *vch;
+	struct rpmsg_device *rpdev_ctrl;
+	int err = 0;
+
+	vch = kzalloc(sizeof(*vch), GFP_KERNEL);
+	if (!vch)
+		return ERR_PTR(-ENOMEM);
+
+	/* Link the channel to our vrp */
+	vch->vrp = vrp;
+
+	/* Assign public information to the rpmsg_device */
+	rpdev_ctrl = &vch->rpdev;
+	rpdev_ctrl->ops = &virtio_rpmsg_ops;
+
+	rpdev_ctrl->dev.parent = &vrp->vdev->dev;
+	rpdev_ctrl->dev.release = virtio_rpmsg_release_device;
+	rpdev_ctrl->little_endian = virtio_is_little_endian(vrp->vdev);
+
+	err = rpmsg_ctl_register_device(rpdev_ctrl);
+	if (err)
+		return ERR_PTR(err);
+
+	return rpdev_ctrl;
+}
+
 static int rpmsg_probe(struct virtio_device *vdev)
 {
 	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
@@ -821,7 +850,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	struct virtqueue *vqs[2];
 	struct virtproc_info *vrp;
 	struct virtio_rpmsg_channel *vch;
-	struct rpmsg_device *rpdev_ns;
+	struct rpmsg_device *rpdev_ns, *rpdev_ctrl;
 	void *bufs_va;
 	int err = 0, i;
 	size_t total_buf_space;
@@ -919,6 +948,11 @@ static int rpmsg_probe(struct virtio_device *vdev)
 			goto free_coherent;
 	}
 
+	rpdev_ctrl = rpmsg_virtio_add_char_dev(vdev);
+	if (IS_ERR(rpdev_ctrl)) {
+		err = PTR_ERR(rpdev_ctrl);
+		goto free_coherent;
+	}
 	/*
 	 * Prepare to kick but don't notify yet - we can't do this before
 	 * device is ready.
@@ -942,6 +976,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 free_coherent:
 	kfree(vch);
+	kfree(to_virtio_rpmsg_channel(rpdev_ctrl));
 	dma_free_coherent(vdev->dev.parent, total_buf_space,
 			  bufs_va, vrp->bufs_dma);
 vqs_del:
-- 
2.17.1

