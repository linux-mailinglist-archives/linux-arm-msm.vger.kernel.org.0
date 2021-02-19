Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1013831F839
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Feb 2021 12:21:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhBSLUU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Feb 2021 06:20:20 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:11592 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230408AbhBSLTx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Feb 2021 06:19:53 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11JBGjGH016690;
        Fri, 19 Feb 2021 12:19:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=f6gGwgoPcV2gF5we9bLFFlVpDk5mfORKVkwS1Bo2ZdU=;
 b=L+fEw+Ht0wXiDyCDTfnCiJAuxFIuoVi9Gidq9+vaxfZnUuh7S8qvUSw9hBGn8qglaWyF
 EemwYgm6Itq29S5LsZL+dLWI6i/LiB0xUQ609Rbo6YEq83UZrJSDWTx+pW3UyKzR8DpG
 FpetGWWUD5FjiCAmIpIKzCBfuizpcWQFmmyFvs+QFcxaSjLFApEqroeVOpxzk8EsHaO2
 p8otiskykkBYlcSE0MojUoUczsgUHFjGehIRp8rGyBKj2hGpUUL6a9eKyHLf7q0+qUJ6
 mk4VJae70e6bUqsj4Z65dPdxcKep+aeNZPJhzhVdY5t4byU0jcMBbX29UliJV6zJ4FbL PA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 36sse3xhbt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 19 Feb 2021 12:19:08 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E53B110002A;
        Fri, 19 Feb 2021 12:19:07 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D80F0221760;
        Fri, 19 Feb 2021 12:19:07 +0100 (CET)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Feb 2021 12:19:07
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v5 11/16] rpmsg: virtio: register the rpmsg_ctrl device
Date:   Fri, 19 Feb 2021 12:14:56 +0100
Message-ID: <20210219111501.14261-12-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
References: <20210219111501.14261-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-19_04:2021-02-18,2021-02-19 signatures=0
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instantiate the rpmsg_ioctl device on virtio RPMsg bus creation.
This provides the possibility to expose the RPMSG_CREATE_EPT_IOCTL
to create RPMsg chdev endpoints.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

---
V5:
Fix compilation issue
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 57 +++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index e87d4cf926eb..2e6b34084012 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -813,14 +813,52 @@ static void rpmsg_xmit_done(struct virtqueue *svq)
 	wake_up_interruptible(&vrp->sendq);
 }
 
+static struct rpmsg_device *rpmsg_virtio_add_ctrl_dev(struct virtio_device *vdev)
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
+	if (err) {
+		kfree(vch);
+		return ERR_PTR(err);
+	}
+
+	return rpdev_ctrl;
+}
+
+static void rpmsg_virtio_del_ctrl_dev(struct rpmsg_device *rpdev_ctrl)
+{
+	if (!rpdev_ctrl)
+		return;
+	kfree(to_virtio_rpmsg_channel(rpdev_ctrl));
+}
+
 static int rpmsg_probe(struct virtio_device *vdev)
 {
 	vq_callback_t *vq_cbs[] = { rpmsg_recv_done, rpmsg_xmit_done };
 	static const char * const names[] = { "input", "output" };
 	struct virtqueue *vqs[2];
 	struct virtproc_info *vrp;
-	struct virtio_rpmsg_channel *vch;
-	struct rpmsg_device *rpdev_ns;
+	struct virtio_rpmsg_channel *vch = NULL;
+	struct rpmsg_device *rpdev_ns = NULL, *rpdev_ctrl;
 	void *bufs_va;
 	int err = 0, i;
 	size_t total_buf_space;
@@ -894,12 +932,18 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 	vdev->priv = vrp;
 
+	rpdev_ctrl = rpmsg_virtio_add_ctrl_dev(vdev);
+	if (IS_ERR(rpdev_ctrl)) {
+		err = PTR_ERR(rpdev_ctrl);
+		goto free_coherent;
+	}
+
 	/* if supported by the remote processor, enable the name service */
 	if (virtio_has_feature(vdev, VIRTIO_RPMSG_F_NS)) {
 		vch = kzalloc(sizeof(*vch), GFP_KERNEL);
 		if (!vch) {
 			err = -ENOMEM;
-			goto free_coherent;
+			goto free_ctrldev;
 		}
 
 		/* Link the channel to our vrp */
@@ -915,7 +959,7 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 		err = rpmsg_ns_register_device(rpdev_ns);
 		if (err)
-			goto free_coherent;
+			goto free_vch;
 	}
 
 	/*
@@ -939,8 +983,11 @@ static int rpmsg_probe(struct virtio_device *vdev)
 
 	return 0;
 
-free_coherent:
+free_vch:
 	kfree(vch);
+free_ctrldev:
+	rpmsg_virtio_del_ctrl_dev(rpdev_ctrl);
+free_coherent:
 	dma_free_coherent(vdev->dev.parent, total_buf_space,
 			  bufs_va, vrp->bufs_dma);
 vqs_del:
-- 
2.17.1

