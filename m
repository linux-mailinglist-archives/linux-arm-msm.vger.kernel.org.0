Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 186991F6D9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 20:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726180AbgFKSu6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 14:50:58 -0400
Received: from zimbra2.kalray.eu ([92.103.151.219]:51870 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726531AbgFKSu5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 14:50:57 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id DF09327E0839;
        Thu, 11 Jun 2020 20:50:55 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id n-Caf7a-VzZg; Thu, 11 Jun 2020 20:50:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 730AC27E082F;
        Thu, 11 Jun 2020 20:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 730AC27E082F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1591901455;
        bh=eIVTjMZkPCllcNhF64IckkXf+qBbunAsTJvT/KJioIg=;
        h=From:To:Date:Message-Id;
        b=M5HSITPBqIhn/T5rqBWlfHaglhbVKAmeQdsWLNLqukR5DftE5t43HFhLG0A1gJZRN
         AKFBk3OvkDk0fYrVyCDxp/Nga+1uY49DgXx2vCRXMFJP+EzCz2LWNPpy+i+LXPPjad
         hIY54L4ezvdN4uTH+b/Knl+9AA/oYgzx44/Se51A=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id dTLu1IoVhv5Z; Thu, 11 Jun 2020 20:50:55 +0200 (CEST)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 5CC5527E06CB;
        Thu, 11 Jun 2020 20:50:55 +0200 (CEST)
From:   Clement Leger <cleger@kalray.eu>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Clement Leger <cleger@kalray.eu>
Subject: [PATCH] rpmsg: fix driver_override memory leak
Date:   Thu, 11 Jun 2020 20:50:12 +0200
Message-Id: <20200611185012.23815-1-cleger@kalray.eu>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

rpmsg_core allows to override driver using driver_override sysfs
attribute. When used, the sysfs store function will duplicate the user
provided string using kstrndup. However, when the rpdev is released,
the driver_override attribute is not freed. In order to have a
consistent allocation and release, use kstrdup in
rpmsg_chrdev_register_device and move it in rpmsg_core.c to avoid
header dependencies. Moreover, add a rpmsg_release_device function to
be called in device release. Drivers using rpmsg have been modified to
use this function and ensure there will be no more memory leak when
releasing rpmsg devices.
This was found with kmemleak while using remoteproc and virtio.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/rpmsg/qcom_glink_native.c |  1 +
 drivers/rpmsg/qcom_smd.c          |  1 +
 drivers/rpmsg/rpmsg_core.c        | 22 ++++++++++++++++++++++
 drivers/rpmsg/rpmsg_internal.h    | 15 ++-------------
 drivers/rpmsg/virtio_rpmsg_bus.c  |  1 +
 5 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 1995f5b3ea67..076997afc638 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1373,6 +1373,7 @@ static void qcom_glink_rpdev_release(struct device *dev)
 	struct glink_channel *channel = to_glink_channel(rpdev->ept);
 
 	channel->rpdev = NULL;
+	rpmsg_release_device(rpdev);
 	kfree(rpdev);
 }
 
diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 4abbeea782fa..f01174d0d4d9 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1047,6 +1047,7 @@ static void qcom_smd_release_device(struct device *dev)
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 	struct qcom_smd_device *qsdev = to_smd_device(rpdev);
 
+	rpmsg_release_device(rpdev);
 	kfree(qsdev);
 }
 
diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index a6361cad608b..31de89c81b27 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -554,6 +554,28 @@ int rpmsg_unregister_device(struct device *parent,
 }
 EXPORT_SYMBOL(rpmsg_unregister_device);
 
+void rpmsg_release_device(struct rpmsg_device *rpdev)
+{
+	kfree(rpdev->driver_override);
+}
+EXPORT_SYMBOL(rpmsg_release_device);
+
+/**
+ * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
+ * @rpdev:	prepared rpdev to be used for creating endpoints
+ *
+ * This function wraps rpmsg_register_device() preparing the rpdev for use as
+ * basis for the rpmsg chrdev.
+ */
+int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
+{
+	strcpy(rpdev->id.name, "rpmsg_chrdev");
+	rpdev->driver_override = kstrdup("rpmsg_chrdev", GFP_KERNEL);
+
+	return rpmsg_register_device(rpdev);
+}
+EXPORT_SYMBOL(rpmsg_chrdev_register_device);
+
 /**
  * __register_rpmsg_driver() - register an rpmsg driver with the rpmsg bus
  * @rpdrv: pointer to a struct rpmsg_driver
diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 3fc83cd50e98..043b28f912fd 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -75,19 +75,8 @@ int rpmsg_unregister_device(struct device *parent,
 struct device *rpmsg_find_device(struct device *parent,
 				 struct rpmsg_channel_info *chinfo);
 
-/**
- * rpmsg_chrdev_register_device() - register chrdev device based on rpdev
- * @rpdev:	prepared rpdev to be used for creating endpoints
- *
- * This function wraps rpmsg_register_device() preparing the rpdev for use as
- * basis for the rpmsg chrdev.
- */
-static inline int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev)
-{
-	strcpy(rpdev->id.name, "rpmsg_chrdev");
-	rpdev->driver_override = "rpmsg_chrdev";
+int rpmsg_chrdev_register_device(struct rpmsg_device *rpdev);
 
-	return rpmsg_register_device(rpdev);
-}
+void rpmsg_release_device(struct rpmsg_device *rpdev);
 
 #endif
diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 07d4f3374098..af4ea6170f89 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -381,6 +381,7 @@ static void virtio_rpmsg_release_device(struct device *dev)
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 	struct virtio_rpmsg_channel *vch = to_virtio_rpmsg_channel(rpdev);
 
+	rpmsg_release_device(rpdev);
 	kfree(vch);
 }
 
-- 
2.17.1

