Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C977312D228
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2019 17:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfL3QmY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Dec 2019 11:42:24 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39436 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbfL3QmY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Dec 2019 11:42:24 -0500
Received: by mail-wr1-f66.google.com with SMTP id y11so33154553wrt.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2019 08:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Z+sAs+AYDGqWiFrN+aBgvSMMWZqMnIfoLolRJJqL6y8=;
        b=vit36bm4NvFURpM0kIpzqYTQp0cqIddaqZ0h0ogzMOk17+46bi8SqhDTw+as8EPWx6
         soAOOxbSwZ/zqPmin2ZIHer7117oN6l7GCQ0GDtZchdPeL81NAogpmBkQzY4yZ/nLURK
         N3/OL0kUSWMKHyTjBA1RkhWD8H/OcIXqHR0QuH51Y9WUDfnlifYGJpyiIC+KqVpbh+4S
         aPdjFkKnBOQkCH46+2rbb+zcRQ03OqDoF1RIbIJnuyFU97lHekvMiSrLUMIJ5WOcWaou
         hjHaC3MiCqeYtBOTKMEEAEvWHXhDsO2pxv4Sa+V3JLrLJHYeXkzuOP2f0tpRPu0xLDhE
         dcqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Z+sAs+AYDGqWiFrN+aBgvSMMWZqMnIfoLolRJJqL6y8=;
        b=nuy2JzpukXLIuVLvm4F7SgY2cRHCDqFIofSaAPsSW+b6KfxICqMM7kWWB8Eo65skf7
         uiRd/8R4cESLn2KDvdeuLR+Wca/YsKDcOKEM+BYGrcB1OPdwMdfCRj5s7CivR6AqEH5z
         Pna8dMB28vEIGPz50o46R2vRqaIFGgf2ycDQ9kOjKDgRa0OGFWdUktYd9fCLOgfNyj97
         8S109+3h7rRMdeM/S7qeNyGJhHtV6yGRbVDtTBovnrEjrTSoYM0SfSc9qiQFi3YhpHnA
         y/AaGYdtz6vmbNYlcgDB9UkpoM2ewYVP1IKXqg/UIq1q0HZNmWvcEXUPS5XJnDS8AEv7
         uCMQ==
X-Gm-Message-State: APjAAAX3No09ZISqPRdm4nDc+muDGrJ52WRX0TmBYvUedhLdRzodEsS4
        c80306sWKR0TeJ2GNEU6ciNaRQ==
X-Google-Smtp-Source: APXvYqx9HLq2Z2XE+l63yV56fja3Rn/09iYbBY5ssmxMgvmrArYwVQRvyrQ+ZKcQlyT8e8ov8zZYDw==
X-Received: by 2002:a5d:50d2:: with SMTP id f18mr67795642wrt.366.1577724140556;
        Mon, 30 Dec 2019 08:42:20 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id j12sm47001207wrt.55.2019.12.30.08.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2019 08:42:20 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org,
        Mike Leach <mike.leach@linaro.org>
Subject: [PATCH v7 08/15] coresight: cti: Enable CTI associated with devices.
Date:   Mon, 30 Dec 2019 16:42:16 +0000
Message-Id: <20191230164216.28195-2-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230164216.28195-1-mike.leach@linaro.org>
References: <20191230164216.28195-1-mike.leach@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The CoreSight subsystem enables a path of devices from source to sink.
Any CTI devices associated with the path devices must be enabled at the
same time.

This patch adds an associated coresight_device element to the main
coresight device structure, and uses this to create associations between
the CTI and other devices based on the device tree data. The associated
device element is used to enable CTI in conjunction with the path elements.

CTI devices are reference counted so where a single CTI is associated with
multiple elements on the path, it will be enabled on the first associated
device enable, and disabled with the last associated device disable.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/hwtracing/coresight/coresight-cti.c   | 129 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-cti.h   |   1 +
 .../hwtracing/coresight/coresight-platform.c  |   1 +
 drivers/hwtracing/coresight/coresight-priv.h  |  12 ++
 drivers/hwtracing/coresight/coresight.c       |  71 +++++++++-
 include/linux/coresight.h                     |   4 +
 6 files changed, 213 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
index 77c2af247917..2be1b310e854 100644
--- a/drivers/hwtracing/coresight/coresight-cti.c
+++ b/drivers/hwtracing/coresight/coresight-cti.c
@@ -4,6 +4,7 @@
  * Author: Mike Leach <mike.leach@linaro.org>
  */
 
+#include <linux/property.h>
 #include "coresight-cti.h"
 
 /**
@@ -440,6 +441,131 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 	return err;
 }
 
+/*
+ * Look for a matching connection device name in the list of connections.
+ * If found then swap in the csdev name, set trig con association pointer
+ * and return found.
+ */
+static bool
+cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
+		      struct coresight_device *csdev)
+{
+	struct cti_trig_con *trig_con;
+	const char *csdev_name;
+
+	list_for_each_entry(trig_con, &ctidev->trig_cons, node) {
+		if (trig_con->con_dev_name) {
+			if (!strcmp(node_name, trig_con->con_dev_name)) {
+				/* match: so swap in csdev name & dev */
+				kfree(trig_con->con_dev_name);
+				csdev_name = dev_name(&csdev->dev);
+				trig_con->con_dev_name =
+					kstrdup(csdev_name, GFP_KERNEL);
+				trig_con->con_dev = csdev;
+				return true;
+			}
+		}
+	}
+	return false;
+}
+
+/*
+ * Search the cti list to add an associated CTI into the supplied CS device
+ * This will set the association if CTI declared before the CS device.
+ * (called from coresight_register() with coresight_mutex locked).
+ */
+void cti_add_assoc_to_csdev(struct coresight_device *csdev)
+{
+	struct cti_drvdata *ect_item;
+	struct cti_device *ctidev;
+	const char *node_name = NULL;
+
+	/* protect the list */
+	mutex_lock(&ect_mutex);
+
+	/* exit if current is an ECT device.*/
+	if ((csdev->type == CORESIGHT_DEV_TYPE_ECT) || list_empty(&ect_net))
+		goto cti_add_done;
+
+	/* if we didn't find the csdev previously we used the fwnode name */
+	node_name = cti_plat_get_node_name(dev_fwnode(csdev->dev.parent));
+	if (!node_name)
+		goto cti_add_done;
+
+	/* for each CTI in list... */
+	list_for_each_entry(ect_item, &ect_net, node) {
+		ctidev = &ect_item->ctidev;
+		if (cti_match_fixup_csdev(ctidev, node_name, csdev)) {
+			/*
+			 * if we found a matching csdev then update the ECT
+			 * association pointer for the device with this CTI.
+			 */
+			csdev->ect_dev = ect_item->csdev;
+			break;
+		}
+	}
+cti_add_done:
+	mutex_unlock(&ect_mutex);
+}
+EXPORT_SYMBOL_GPL(cti_add_assoc_to_csdev);
+
+/*
+ * Removing the associated devices is easier.
+ * A CTI will not have a value for csdev->ect_dev.
+ */
+void cti_remove_assoc_from_csdev(struct coresight_device *csdev)
+{
+	struct cti_drvdata *ctidrv;
+	struct cti_trig_con *tc;
+	struct cti_device *ctidev;
+
+	mutex_lock(&ect_mutex);
+	if (csdev->ect_dev) {
+		ctidrv = csdev_to_cti_drvdata(csdev->ect_dev);
+		ctidev = &ctidrv->ctidev;
+		list_for_each_entry(tc, &ctidev->trig_cons, node) {
+			if (tc->con_dev == csdev->ect_dev) {
+				tc->con_dev = NULL;
+				break;
+			}
+		}
+		csdev->ect_dev = NULL;
+	}
+	mutex_unlock(&ect_mutex);
+}
+EXPORT_SYMBOL_GPL(cti_remove_assoc_from_csdev);
+
+/*
+ * Update the cross references where the associated device was found
+ * while we were building the connection info. This will occur if the
+ * assoc device was registered before the CTI.
+ */
+static void cti_update_conn_xrefs(struct cti_drvdata *drvdata)
+{
+	struct cti_trig_con *tc;
+	struct cti_device *ctidev = &drvdata->ctidev;
+
+	list_for_each_entry(tc, &ctidev->trig_cons, node) {
+		if (tc->con_dev)
+			/* set tc->con_dev->ect_dev */
+			coresight_set_assoc_ectdev_mutex(tc->con_dev,
+							 drvdata->csdev);
+	}
+}
+
+static void cti_remove_conn_xrefs(struct cti_drvdata *drvdata)
+{
+	struct cti_trig_con *tc;
+	struct cti_device *ctidev = &drvdata->ctidev;
+
+	list_for_each_entry(tc, &ctidev->trig_cons, node) {
+		if (tc->con_dev) {
+			coresight_set_assoc_ectdev_mutex(tc->con_dev,
+							 NULL);
+		}
+	}
+}
+
 /** cti ect operations **/
 int cti_enable(struct coresight_device *csdev)
 {
@@ -474,6 +600,7 @@ static void cti_device_release(struct device *dev)
 	struct cti_drvdata *ect_item, *ect_tmp;
 
 	mutex_lock(&ect_mutex);
+	cti_remove_conn_xrefs(drvdata);
 
 	/* remove from the list */
 	list_for_each_entry_safe(ect_item, ect_tmp, &ect_net, node) {
@@ -565,6 +692,8 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	/* add to list of CTI devices */
 	mutex_lock(&ect_mutex);
 	list_add(&drvdata->node, &ect_net);
+	/* set any cross references */
+	cti_update_conn_xrefs(drvdata);
 	mutex_unlock(&ect_mutex);
 
 	/* set up release chain */
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 469a06a1bb78..578d7e9ac67e 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -216,6 +216,7 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
 		      u32 channel_idx);
 struct coresight_platform_data *
 coresight_cti_get_platform_data(struct device *dev);
+const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
 
 /* cti powered and enabled */
 static inline bool cti_active(struct cti_config *cfg)
diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 43418a2126ff..421d4fc95f41 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -313,6 +313,7 @@ static int of_get_coresight_platform_data(struct device *dev,
 
 	return 0;
 }
+
 #else
 static inline int
 of_get_coresight_platform_data(struct device *dev,
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 357ffef7b825..890f9a5c97c6 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -162,6 +162,16 @@ static inline int etm_readl_cp14(u32 off, unsigned int *val) { return 0; }
 static inline int etm_writel_cp14(u32 off, u32 val) { return 0; }
 #endif
 
+#ifdef CONFIG_CORESIGHT_CTI
+extern void cti_add_assoc_to_csdev(struct coresight_device *csdev);
+extern void cti_remove_assoc_from_csdev(struct coresight_device *csdev);
+
+#else
+static inline void cti_add_assoc_to_csdev(struct coresight_device *csdev) {}
+static inline void
+cti_remove_assoc_from_csdev(struct coresight_device *csdev) {}
+#endif
+
 /*
  * Macros and inline functions to handle CoreSight UCI data and driver
  * private data in AMBA ID table entries, and extract data values.
@@ -204,5 +214,7 @@ static inline void *coresight_get_uci_data(const struct amba_id *id)
 void coresight_release_platform_data(struct coresight_platform_data *pdata);
 struct coresight_device *
 coresight_find_csdev_by_fwnode(struct fwnode_handle *r_fwnode);
+void coresight_set_assoc_ectdev_mutex(struct coresight_device *csdev,
+				      struct coresight_device *ect_csdev);
 
 #endif
diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
index 39a5d9f7a395..c71553c09f8e 100644
--- a/drivers/hwtracing/coresight/coresight.c
+++ b/drivers/hwtracing/coresight/coresight.c
@@ -216,6 +216,44 @@ void coresight_disclaim_device(void __iomem *base)
 	CS_LOCK(base);
 }
 
+/* enable or disable an associated CTI device of the supplied CS device */
+static int
+coresight_control_assoc_ectdev(struct coresight_device *csdev, bool enable)
+{
+	int ect_ret = 0;
+	struct coresight_device *ect_csdev = csdev->ect_dev;
+
+	if (!ect_csdev)
+		return 0;
+
+	if (enable) {
+		if (ect_ops(ect_csdev)->enable)
+			ect_ret = ect_ops(ect_csdev)->enable(ect_csdev);
+	} else {
+		if (ect_ops(ect_csdev)->disable)
+			ect_ret = ect_ops(ect_csdev)->disable(ect_csdev);
+	}
+
+	/* output warning if ECT enable is preventing trace operation */
+	if (ect_ret)
+		dev_info(&csdev->dev, "Associated ECT device (%s) %s failed\n",
+			 dev_name(&ect_csdev->dev),
+			 enable ? "enable" : "disable");
+	return ect_ret;
+}
+
+/*
+ * Set the associated ect / cti device while holding the coresight_mutex
+ * to avoid a race with coresight_enable that may try to use this value.
+ */
+void coresight_set_assoc_ectdev_mutex(struct coresight_device *csdev,
+				      struct coresight_device *ect_csdev)
+{
+	mutex_lock(&coresight_mutex);
+	csdev->ect_dev = ect_csdev;
+	mutex_unlock(&coresight_mutex);
+}
+
 static int coresight_enable_sink(struct coresight_device *csdev,
 				 u32 mode, void *data)
 {
@@ -228,9 +266,14 @@ static int coresight_enable_sink(struct coresight_device *csdev,
 	if (!sink_ops(csdev)->enable)
 		return -EINVAL;
 
-	ret = sink_ops(csdev)->enable(csdev, mode, data);
+	ret = coresight_control_assoc_ectdev(csdev, true);
 	if (ret)
 		return ret;
+	ret = sink_ops(csdev)->enable(csdev, mode, data);
+	if (ret) {
+		coresight_control_assoc_ectdev(csdev, false);
+		return ret;
+	}
 	csdev->enable = true;
 
 	return 0;
@@ -246,6 +289,7 @@ static void coresight_disable_sink(struct coresight_device *csdev)
 	ret = sink_ops(csdev)->disable(csdev);
 	if (ret)
 		return;
+	coresight_control_assoc_ectdev(csdev, false);
 	csdev->enable = false;
 }
 
@@ -269,8 +313,15 @@ static int coresight_enable_link(struct coresight_device *csdev,
 	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_SPLIT && outport < 0)
 		return outport;
 
-	if (link_ops(csdev)->enable)
-		ret = link_ops(csdev)->enable(csdev, inport, outport);
+	if (link_ops(csdev)->enable) {
+		ret = coresight_control_assoc_ectdev(csdev, true);
+		if (!ret) {
+			ret = link_ops(csdev)->enable(csdev, inport, outport);
+			if (ret)
+				coresight_control_assoc_ectdev(csdev, false);
+		}
+	}
+
 	if (!ret)
 		csdev->enable = true;
 
@@ -300,8 +351,10 @@ static void coresight_disable_link(struct coresight_device *csdev,
 		nr_conns = 1;
 	}
 
-	if (link_ops(csdev)->disable)
+	if (link_ops(csdev)->disable) {
 		link_ops(csdev)->disable(csdev, inport, outport);
+		coresight_control_assoc_ectdev(csdev, false);
+	}
 
 	for (i = 0; i < nr_conns; i++)
 		if (atomic_read(&csdev->refcnt[i]) != 0)
@@ -322,9 +375,14 @@ static int coresight_enable_source(struct coresight_device *csdev, u32 mode)
 
 	if (!csdev->enable) {
 		if (source_ops(csdev)->enable) {
-			ret = source_ops(csdev)->enable(csdev, NULL, mode);
+			ret = coresight_control_assoc_ectdev(csdev, true);
 			if (ret)
 				return ret;
+			ret = source_ops(csdev)->enable(csdev, NULL, mode);
+			if (ret) {
+				coresight_control_assoc_ectdev(csdev, false);
+				return ret;
+			};
 		}
 		csdev->enable = true;
 	}
@@ -347,6 +405,7 @@ static bool coresight_disable_source(struct coresight_device *csdev)
 	if (atomic_dec_return(csdev->refcnt) == 0) {
 		if (source_ops(csdev)->disable)
 			source_ops(csdev)->disable(csdev, NULL);
+		coresight_control_assoc_ectdev(csdev, false);
 		csdev->enable = false;
 	}
 	return !csdev->enable;
@@ -964,6 +1023,7 @@ static void coresight_device_release(struct device *dev)
 {
 	struct coresight_device *csdev = to_coresight_device(dev);
 
+	cti_remove_assoc_from_csdev(csdev);
 	fwnode_handle_put(csdev->dev.fwnode);
 	kfree(csdev->refcnt);
 	kfree(csdev);
@@ -1246,6 +1306,7 @@ struct coresight_device *coresight_register(struct coresight_desc *desc)
 
 	coresight_fixup_device_conns(csdev);
 	coresight_fixup_orphan_conns(csdev);
+	cti_add_assoc_to_csdev(csdev);
 
 	mutex_unlock(&coresight_mutex);
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index b3e582d96a34..193cc9dbf448 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -163,6 +163,8 @@ struct coresight_connection {
  *		activated but not yet enabled.  Enabling for a _sink_
  *		appens when a source has been selected for that it.
  * @ea:		Device attribute for sink representation under PMU directory.
+ * @ect_dev:	Associated cross trigger device. Not part of the trace data
+ *		path or connections.
  */
 struct coresight_device {
 	struct coresight_platform_data *pdata;
@@ -176,6 +178,8 @@ struct coresight_device {
 	/* sink specific fields */
 	bool activated;	/* true only if a sink is part of a path */
 	struct dev_ext_attribute *ea;
+	/* cross trigger handling */
+	struct coresight_device *ect_dev;
 };
 
 /*
-- 
2.17.1

