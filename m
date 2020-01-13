Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE305139B89
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 22:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728831AbgAMVcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 16:32:12 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50738 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728802AbgAMVcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 16:32:12 -0500
Received: by mail-wm1-f67.google.com with SMTP id a5so11486205wmb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 13:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NWvg2plk8dLdSHAWazpvsxc1joMZq3uJRjtKChLL7eE=;
        b=mnb9Fy7FYQq1Vh+zy3kQLLeWldDHn6fALoCeLMUYEtDRxv3S09+BYJo4uTFTJG9hde
         mFxWoIBnYgFOKjvnEGUaOVfPUI2s9QfrMVxhKWJ8Idj4N1AnnHRShOMcsrfEWKxDUsol
         XDLWbCFHOxsU73mneMPgCGbCbruTuX3VOfslD7/PeOiFB/YCY5GS5wAdn+X+FwKA8aMY
         QBxu7g6mfzAvS60s7SQojhfrunvIIfpb9B1xGFCxP+uzpwfefzzsNRxGwZUSkumLJUfX
         zQXZmkccN/ERB9SqQS8jpw8GDU5GzVr+Gl1wD5QxMtfmYEtxoRyXpxLo65T5Ybo6q4Zw
         MtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NWvg2plk8dLdSHAWazpvsxc1joMZq3uJRjtKChLL7eE=;
        b=GUVCYe6TehcvzWMP2Ii7PYrFVREwYQhjUFwFqaOG1qTqPcbYidRv8U6tAqfBj5K2mr
         /Ur/igXcDctFBbrM0jrUmPwMv+vBstyve6vjhy/SwGNDqzh8y7zNcrwLMRVE2YTN4xsZ
         3LAbTWUJEP9xvcpx6ZSbcRggueJREG3feFVpcLsC2TqhLwL4JtzLfHDgUIE1cAueO9eQ
         UiD6JQDaopLj7+QNO+qU/NAJyzJSJSHQ3nuTBLXPctTbS/+ZZBOkhI85C1jNUxxcoh/M
         HgAwMkihfWWuSb0FW1S/kkVc+SZOLceqG6PLfohBk2gDl8QZm7IbAOPyQ2Neq2g80U/A
         NGJA==
X-Gm-Message-State: APjAAAVgRLff1D+EqPzs7NXJMhVgx2BaBp5OpFQWcO35jlmdRv8b2kIE
        t2Boa4+h3FPofKefIZ1jRmP2bQ==
X-Google-Smtp-Source: APXvYqxlnVxZj2PKOJCeqgs457GcVbVghvOmBN+raXkcTeytdb6aWfxOFyVFmcCfiFyybOP44Y1New==
X-Received: by 2002:a7b:c934:: with SMTP id h20mr22175174wml.103.1578951130118;
        Mon, 13 Jan 2020 13:32:10 -0800 (PST)
Received: from linaro.org ([2a00:23c5:6815:3901:a1cf:b00b:5683:ed40])
        by smtp.gmail.com with ESMTPSA id j12sm16725120wrt.55.2020.01.13.13.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 13:32:09 -0800 (PST)
From:   Mike Leach <mike.leach@linaro.org>
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com, robh+dt@kernel.org, maxime@cerno.tech,
        liviu.dudau@arm.com, sudeep.holla@arm.com,
        lorenzo.pieralisi@arm.com, agross@kernel.org, corbet@lwn.net
Subject: [PATCH v8 07/15] coresight: cti: Add device tree support for custom CTI.
Date:   Mon, 13 Jan 2020 21:31:41 +0000
Message-Id: <20200113213149.25599-8-mike.leach@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200113213149.25599-1-mike.leach@linaro.org>
References: <20200113213149.25599-1-mike.leach@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Adds support for CTIs whose connections are implementation defined at
hardware design time, and not constrained by v8 architecture.

These CTIs have no standard connection setup, all the settings have to
be defined in the device tree files. The patch creates a set of connections
and trigger signals based on the information provided.

Signed-off-by: Mike Leach <mike.leach@linaro.org>
---
 .../coresight/coresight-cti-platform.c        | 235 +++++++++++++++++-
 .../hwtracing/coresight/coresight-cti-sysfs.c |  11 +
 2 files changed, 242 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index 36a276eda50a..b44d83142b62 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -13,9 +13,19 @@
 #define NR_V8PE_OUT_SIGS	3
 #define NR_V8ETM_INOUT_SIGS	4
 
+/* CTI device tree trigger connection node keyword */
+#define CTI_DT_CONNS		"trig-conns"
+
 /* CTI device tree connection property keywords */
 #define CTI_DT_V8ARCH_COMPAT	"arm,coresight-cti-v8-arch"
 #define CTI_DT_CSDEV_ASSOC	"arm,cs-dev-assoc"
+#define CTI_DT_TRIGIN_SIGS	"arm,trig-in-sigs"
+#define CTI_DT_TRIGOUT_SIGS	"arm,trig-out-sigs"
+#define CTI_DT_TRIGIN_TYPES	"arm,trig-in-types"
+#define CTI_DT_TRIGOUT_TYPES	"arm,trig-out-types"
+#define CTI_DT_FILTER_OUT_SIGS	"arm,trig-filters"
+#define CTI_DT_CONN_NAME	"arm,trig-conn-name"
+#define CTI_DT_CTM_ID		"arm,cti-ctm-id"
 
 #ifdef CONFIG_OF
 /*
@@ -87,6 +97,14 @@ cti_plat_get_csdev_or_node_name(struct fwnode_handle *fwnode,
 	return name;
 }
 
+static bool cti_plat_node_name_eq(struct fwnode_handle *fwnode,
+				  const char *name)
+{
+	if (is_of_node(fwnode))
+		return of_node_name_eq(to_of_node(fwnode), name);
+	return false;
+}
+
 static int cti_plat_create_v8_etm_connection(struct device *dev,
 					     struct cti_drvdata *drvdata)
 {
@@ -205,6 +223,211 @@ static int cti_plat_check_v8_arch_compatible(struct device *dev)
 	return 0;
 }
 
+static int cti_plat_count_sig_elements(const struct fwnode_handle *fwnode,
+				       const char *name)
+{
+	int nr_elem = fwnode_property_count_u32(fwnode, name);
+
+	return (nr_elem < 0 ? 0 : nr_elem);
+}
+
+static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
+				    const struct fwnode_handle *fwnode,
+				    const char *grp_name)
+{
+	int idx, err = 0;
+	u32 *values;
+
+	if (!tgrp->nr_sigs)
+		return 0;
+
+	values = kcalloc(tgrp->nr_sigs, sizeof(u32), GFP_KERNEL);
+	if (!values)
+		return -ENOMEM;
+
+	err = fwnode_property_read_u32_array(fwnode, grp_name,
+					     values, tgrp->nr_sigs);
+
+	if (!err) {
+		/* set the signal usage mask */
+		for (idx = 0; idx < tgrp->nr_sigs; idx++)
+			tgrp->used_mask |= BIT(values[idx]);
+	}
+
+	kfree(values);
+	return err;
+}
+
+static int cti_plat_read_trig_types(struct cti_trig_grp *tgrp,
+				    const struct fwnode_handle *fwnode,
+				    const char *type_name)
+{
+	int items, err = 0, nr_sigs;
+	u32 *values = NULL, i;
+
+	/* allocate an array according to number of signals in connection */
+	nr_sigs = tgrp->nr_sigs;
+	if (!nr_sigs)
+		return 0;
+
+	/* see if any types have been included in the device description */
+	items = cti_plat_count_sig_elements(fwnode, type_name);
+	if (items > nr_sigs)
+		return -EINVAL;
+
+	/* need an array to store the values iff there are any */
+	if (items) {
+		values = kcalloc(items, sizeof(u32), GFP_KERNEL);
+		if (!values)
+			return -ENOMEM;
+
+		err = fwnode_property_read_u32_array(fwnode, type_name,
+						     values, items);
+		if (err)
+			goto read_trig_types_out;
+	}
+
+	/*
+	 * Match type id to signal index, 1st type to 1st index etc.
+	 * If fewer types than signals default remainder to GEN_IO.
+	 */
+	for (i = 0; i < nr_sigs; i++) {
+		if (i < items) {
+			tgrp->sig_types[i] =
+				values[i] < CTI_TRIG_MAX ? values[i] : GEN_IO;
+		} else {
+			tgrp->sig_types[i] = GEN_IO;
+		}
+	}
+
+read_trig_types_out:
+	kfree(values);
+	return err;
+}
+
+static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
+					const struct fwnode_handle *fwnode)
+{
+	struct cti_trig_grp *tg = NULL;
+	int err = 0, nr_filter_sigs;
+
+	nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
+						     CTI_DT_FILTER_OUT_SIGS);
+	if (nr_filter_sigs == 0)
+		return 0;
+
+	if (nr_filter_sigs > drvdata->config.nr_trig_max)
+		return -EINVAL;
+
+	tg = kzalloc(sizeof(*tg), GFP_KERNEL);
+	if (!tg)
+		return -ENOMEM;
+
+	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
+	if (!err)
+		drvdata->config.trig_out_filter |= tg->used_mask;
+
+	kfree(tg);
+	return err;
+}
+
+static int cti_plat_create_connection(struct device *dev,
+				      struct cti_drvdata *drvdata,
+				      struct fwnode_handle *fwnode)
+{
+	struct cti_trig_con *tc = NULL;
+	int cpuid = -1, err = 0;
+	struct fwnode_handle *cs_fwnode = NULL;
+	struct coresight_device *csdev = NULL;
+	const char *assoc_name = "unknown";
+	char cpu_name_str[16];
+	int nr_sigs_in, nr_sigs_out;
+
+	/* look to see how many in and out signals we have */
+	nr_sigs_in = cti_plat_count_sig_elements(fwnode, CTI_DT_TRIGIN_SIGS);
+	nr_sigs_out = cti_plat_count_sig_elements(fwnode, CTI_DT_TRIGOUT_SIGS);
+
+	if ((nr_sigs_in > drvdata->config.nr_trig_max) ||
+	    (nr_sigs_out > drvdata->config.nr_trig_max))
+		return -EINVAL;
+
+	tc = cti_allocate_trig_con(dev, nr_sigs_in, nr_sigs_out);
+	if (!tc)
+		return -ENOMEM;
+
+	/* look for the signals properties. */
+	err = cti_plat_read_trig_group(tc->con_in, fwnode,
+				       CTI_DT_TRIGIN_SIGS);
+	if (err)
+		goto create_con_err;
+
+	err = cti_plat_read_trig_types(tc->con_in, fwnode,
+				       CTI_DT_TRIGIN_TYPES);
+	if (err)
+		goto create_con_err;
+
+	err = cti_plat_read_trig_group(tc->con_out, fwnode,
+				       CTI_DT_TRIGOUT_SIGS);
+	if (err)
+		goto create_con_err;
+
+	err = cti_plat_read_trig_types(tc->con_out, fwnode,
+				       CTI_DT_TRIGOUT_TYPES);
+	if (err)
+		goto create_con_err;
+
+	err = cti_plat_process_filter_sigs(drvdata, fwnode);
+	if (err)
+		goto create_con_err;
+
+	/* read the connection name if set - may be overridden by later */
+	fwnode_property_read_string(fwnode, CTI_DT_CONN_NAME, &assoc_name);
+
+	/* associated cpu ? */
+	cpuid = cti_plat_get_cpu_at_node(fwnode);
+	if (cpuid >= 0) {
+		drvdata->ctidev.cpu = cpuid;
+		scnprintf(cpu_name_str, sizeof(cpu_name_str), "cpu%d", cpuid);
+		assoc_name = cpu_name_str;
+	} else {
+		/* associated device ? */
+		cs_fwnode = fwnode_find_reference(fwnode,
+						  CTI_DT_CSDEV_ASSOC, 0);
+		if (!IS_ERR_OR_NULL(cs_fwnode)) {
+			assoc_name = cti_plat_get_csdev_or_node_name(cs_fwnode,
+								     &csdev);
+			fwnode_handle_put(cs_fwnode);
+		}
+	}
+	/* set up a connection */
+	err = cti_add_connection_entry(dev, drvdata, tc, csdev, assoc_name);
+
+create_con_err:
+	return err;
+}
+
+static int cti_plat_create_impdef_connections(struct device *dev,
+					      struct cti_drvdata *drvdata)
+{
+	int rc = 0;
+	struct fwnode_handle *fwnode = dev_fwnode(dev);
+	struct fwnode_handle *child = NULL;
+
+	if (IS_ERR_OR_NULL(fwnode))
+		return -EINVAL;
+
+	fwnode_for_each_child_node(fwnode, child) {
+		if (cti_plat_node_name_eq(child, CTI_DT_CONNS))
+			rc = cti_plat_create_connection(dev, drvdata,
+							child);
+		if (rc != 0)
+			break;
+	}
+	fwnode_handle_put(child);
+
+	return rc;
+}
+
 /* get the hardware configuration & connection data. */
 int cti_plat_get_hw_data(struct device *dev,
 			 struct cti_drvdata *drvdata)
@@ -212,12 +435,16 @@ int cti_plat_get_hw_data(struct device *dev,
 	int rc = 0;
 	struct cti_device *cti_dev = &drvdata->ctidev;
 
+	/* get any CTM ID - defaults to 0 */
+	device_property_read_u32(dev, CTI_DT_CTM_ID, &cti_dev->ctm_id);
+
 	/* check for a v8 architectural CTI device */
-	if (cti_plat_check_v8_arch_compatible(dev)) {
+	if (cti_plat_check_v8_arch_compatible(dev))
 		rc = cti_plat_create_v8_connections(dev, drvdata);
-		if (rc)
-			return rc;
-	}
+	else
+		rc = cti_plat_create_impdef_connections(dev, drvdata);
+	if (rc)
+		return rc;
 
 	/* if no connections, just add a single default based on max IN-OUT */
 	if (cti_dev->nr_trig_con == 0)
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 37e71724b67b..8af1986ed69f 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -56,9 +56,20 @@ static ssize_t enable_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable);
 
+static ssize_t ctmid_show(struct device *dev,
+			  struct device_attribute *attr,
+			  char *buf)
+{
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return scnprintf(buf, PAGE_SIZE, "%d\n", drvdata->ctidev.ctm_id);
+}
+static DEVICE_ATTR_RO(ctmid);
+
 /* attribute and group sysfs tables. */
 static struct attribute *coresight_cti_attrs[] = {
 	&dev_attr_enable.attr,
+	&dev_attr_ctmid.attr,
 	NULL,
 };
 
-- 
2.17.1

