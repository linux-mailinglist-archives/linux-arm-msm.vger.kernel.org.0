Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4864F31DAA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 14:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233104AbhBQNdr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 08:33:47 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:14348 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232967AbhBQNck (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 08:32:40 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11HDSSkm000981;
        Wed, 17 Feb 2021 14:31:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=6z3VyblW4vdPr+7pCRXqS9Ch4EjY9Xj7v8l9KPmZHEU=;
 b=GW5EUxRfy4kKCLaH44/fuKloQ+S3PvWuwQOSPC6oEchnTD2oZwKCeqhJ9SXpQ+6RLbgM
 Ger8AJ9l+w3HYPUq/G7IbcCNya7y5ttKLteMypaD3kdIbt4uXmjfhg73CzEl9d5nX4Jd
 u0jynZr+AlRcak70M5ah+8GTpVhvpuaiz6gHfkkJhFQj6mDjQshJhOgLrjNSvFFVPi4J
 jpVXD1cu9pbp+OzQ9VOBi3ThT/cD69jJOt0iveKHnrdn7MwciMDL/I/B370XMNwCANyp
 4xatJeE+WDrPx3WIUmTeI/FUkVNRav63R4+ip4QWmJpvX3116ujUxi2vOmBvmFapPuoH GQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36p4sffc32-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 17 Feb 2021 14:31:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5CCC6100034;
        Wed, 17 Feb 2021 14:31:55 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4D2002370CE;
        Wed, 17 Feb 2021 14:31:55 +0100 (CET)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 17 Feb 2021 14:31:55
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 11/16] rpmsg: virtio: register the rpmsg_ctrl device
Date:   Wed, 17 Feb 2021 14:29:00 +0100
Message-ID: <20210217132905.1485-12-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
References: <20210217132905.1485-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-17_11:2021-02-16,2021-02-17 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instantiate the rpmsg_ioctl device on virtio RPMsg bus creation.
This provides the possibility to expose the RPMSG_CREATE_EPT_IOCTL
to create RPMsg chdev endpoints.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---
V3:
Fix compilation issue
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

warnings:
drivers/rpmsg/virtio_rpmsg_bus.c:978 rpmsg_probe() error: uninitialized symbol 'vch'.
drivers/rpmsg/virtio_rpmsg_bus.c:979 rpmsg_probe() error: uninitialized symbol 'rpdev_ctrl'.
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 37 +++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index e87d4cf926eb..5143fdeca306 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -813,6 +813,35 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
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
+	/* Link the channel to the vrp */
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
+	err = rpmsg_ctrl_register_device(rpdev_ctrl);
+	if (err)
+		return ERR_PTR(err);
+
+	return rpdev_ctrl;
+}
+
 static int rpmsg_probe(struct virtio_device *vdev)
 {
 	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
@@ -820,7 +849,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 	struct virtqueue *vqs[2];
 	struct virtproc_info *vrp;
 	struct virtio_rpmsg_channel *vch;
-	struct rpmsg_device *rpdev_ns;
+	struct rpmsg_device *rpdev_ns = NULL, *rpdev_ctrl = NULL;
 	void *bufs_va;
 	int err = 0, i;
 	size_t total_buf_space;
@@ -918,6 +947,11 @@ static int rpmsg_probe(struct virtio_device *vdev)
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
@@ -941,6 +975,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 free_coherent:
 	kfree(vch);
+	kfree(to_virtio_rpmsg_channel(rpdev_ctrl));
 	dma_free_coherent(vdev->dev.parent, total_buf_space,
 			  bufs_va, vrp->bufs_dma);
 vqs_del:
-- 
2.17.1

