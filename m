Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CFF931D57F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 07:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbhBQGuM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 01:50:12 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:51321 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231552AbhBQGuI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 01:50:08 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613544581; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=KgYRqtD85+j2Wj8Krs0tNSaLtLrxZJlfK2RzY8zmWMU=; b=NeY1o8Y8hj8PKeu/IwZMa/PedcQBiUAvFidmf1/9RCfPmzJRuYI2EpjRDB5Ofg8psgM2nhju
 bUilJtaEvxNj4Tus4XqZf9nZrgAyvLx8TDiPIxZFU0bR9mMKFG3w6zniIvH+c7VUV2J0eDSy
 Lo0+lZ12Ijr9nNMH1t6paNEkFe4=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 602cbc6b2d3aa2c7089a549d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 06:49:15
 GMT
Sender: schowdhu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E5A37C433ED; Wed, 17 Feb 2021 06:49:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-525.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: schowdhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D9A8C433CA;
        Wed, 17 Feb 2021 06:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7D9A8C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=schowdhu@codeaurora.org
From:   Souradeep Chowdhury <schowdhu@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Souradeep Chowdhury <schowdhu@codeaurora.org>
Subject: [PATCH V0 4/6] soc: qcom: dcc:Add the sysfs variables to the Data Capture and Compare driver(DCC)
Date:   Wed, 17 Feb 2021 12:18:25 +0530
Message-Id: <0b478cfd38cc01e43f4af3445b070327fa907db5.1613541226.git.schowdhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1613541226.git.schowdhu@codeaurora.org>
References: <cover.1613541226.git.schowdhu@codeaurora.org>
In-Reply-To: <cover.1613541226.git.schowdhu@codeaurora.org>
References: <cover.1613541226.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Added the sysfs variables to expose the user space functionalities
like DCC enable,disable,configure addresses and software triggers.
Also added the necessary methods along with the same.

Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
---
 drivers/soc/qcom/dcc.c | 519 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 519 insertions(+)

diff --git a/drivers/soc/qcom/dcc.c b/drivers/soc/qcom/dcc.c
index d67452b..02eee96 100644
--- a/drivers/soc/qcom/dcc.c
+++ b/drivers/soc/qcom/dcc.c
@@ -185,6 +185,82 @@ static int dcc_sram_writel(struct dcc_drvdata *drvdata,
 	return 0;
 }
 
+static bool dcc_ready(struct dcc_drvdata *drvdata)
+{
+	u32 val;
+
+	/* poll until DCC ready */
+	if (!readl_poll_timeout((drvdata->base + DCC_STATUS), val,
+				(BMVAL(val, 0, 1) == 0), 1, TIMEOUT_US))
+		return true;
+
+	return false;
+}
+
+static int dcc_read_status(struct dcc_drvdata *drvdata)
+{
+	int curr_list;
+	u32 bus_status;
+	u32 ll_cfg = 0;
+	u32 tmp_ll_cfg = 0;
+
+	for (curr_list = 0; curr_list < drvdata->nr_link_list; curr_list++) {
+		if (!drvdata->enable[curr_list])
+			continue;
+
+		bus_status = dcc_readl(drvdata, DCC_LL_BUS_ACCESS_STATUS(curr_list));
+
+		if (bus_status) {
+			dev_err(drvdata->dev,
+				"Read access error for list %d err: 0x%x.\n",
+				curr_list, bus_status);
+
+			ll_cfg = dcc_readl(drvdata, DCC_LL_CFG(curr_list));
+			tmp_ll_cfg = ll_cfg & ~BIT(9);
+			dcc_writel(drvdata, tmp_ll_cfg, DCC_LL_CFG(curr_list));
+			dcc_writel(drvdata, 0x3,
+				DCC_LL_BUS_ACCESS_STATUS(curr_list));
+			dcc_writel(drvdata, ll_cfg, DCC_LL_CFG(curr_list));
+			return -ENODATA;
+		}
+	}
+
+	return 0;
+}
+
+static int dcc_sw_trigger(struct dcc_drvdata *drvdata)
+{
+	int ret = 0;
+	int curr_list;
+	u32 ll_cfg = 0;
+	u32 tmp_ll_cfg = 0;
+
+	mutex_lock(&drvdata->mutex);
+
+	for (curr_list = 0; curr_list < drvdata->nr_link_list; curr_list++) {
+		if (!drvdata->enable[curr_list])
+			continue;
+		ll_cfg = dcc_readl(drvdata, DCC_LL_CFG(curr_list));
+		tmp_ll_cfg = ll_cfg & ~BIT(9);
+		dcc_writel(drvdata, tmp_ll_cfg, DCC_LL_CFG(curr_list));
+		dcc_writel(drvdata, 1, DCC_LL_SW_TRIGGER(curr_list));
+		dcc_writel(drvdata, ll_cfg, DCC_LL_CFG(curr_list));
+	}
+
+	if (!dcc_ready(drvdata)) {
+		dev_err(drvdata->dev,
+			"DCC is busy after receiving sw tigger.\n");
+		ret = -EBUSY;
+		goto err;
+	}
+
+	ret = dcc_read_status(drvdata);
+
+err:
+	mutex_unlock(&drvdata->mutex);
+	return ret;
+}
+
 static int _dcc_ll_cfg_read_write(struct dcc_drvdata *drvdata,
 struct dcc_config_entry *entry, struct dcc_cfg_attr *cfg)
 {
@@ -628,6 +704,211 @@ static int dcc_enable(struct dcc_drvdata *drvdata)
 	return ret;
 }
 
+static void dcc_disable(struct dcc_drvdata *drvdata)
+{
+	int curr_list;
+
+	mutex_lock(&drvdata->mutex);
+
+	if (!dcc_ready(drvdata))
+		dev_err(drvdata->dev, "DCC is not ready Disabling DCC...\n");
+
+	for (curr_list = 0; curr_list < drvdata->nr_link_list; curr_list++) {
+		if (!drvdata->enable[curr_list])
+			continue;
+		dcc_writel(drvdata, 0, DCC_LL_CFG(curr_list));
+		dcc_writel(drvdata, 0, DCC_LL_BASE(curr_list));
+		dcc_writel(drvdata, 0, DCC_FD_BASE(curr_list));
+		dcc_writel(drvdata, 0, DCC_LL_LOCK(curr_list));
+		drvdata->enable[curr_list] = false;
+	}
+	memset_io(drvdata->ram_base, 0, drvdata->ram_size);
+	drvdata->ram_cfg = 0;
+	drvdata->ram_start = 0;
+	mutex_unlock(&drvdata->mutex);
+}
+
+static ssize_t curr_list_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	int ret;
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	mutex_lock(&drvdata->mutex);
+	if (drvdata->curr_list == DCC_INVALID_LINK_LIST) {
+		dev_err(dev, "curr_list is not set.\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = scnprintf(buf, PAGE_SIZE, "%d\n",	drvdata->curr_list);
+err:
+	mutex_unlock(&drvdata->mutex);
+	return ret;
+}
+
+static ssize_t curr_list_store(struct device *dev,
+						struct device_attribute *attr,
+						const char *buf, size_t size)
+{
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+	unsigned long val;
+	u32 lock_reg;
+	bool dcc_enable = false;
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+
+	if (val >= drvdata->nr_link_list)
+		return -EINVAL;
+
+	mutex_lock(&drvdata->mutex);
+
+	dcc_enable = is_dcc_enabled(drvdata);
+	if (drvdata->curr_list != DCC_INVALID_LINK_LIST	&& dcc_enable) {
+		dev_err(drvdata->dev, "DCC is enabled, please disable it first.\n");
+		mutex_unlock(&drvdata->mutex);
+		return -EINVAL;
+	}
+
+	lock_reg = dcc_readl(drvdata, DCC_LL_LOCK(val));
+	if (lock_reg & 0x1) {
+		dev_err(drvdata->dev, "DCC linked list is already configured\n");
+		mutex_unlock(&drvdata->mutex);
+		return -EINVAL;
+	}
+	drvdata->curr_list = val;
+	mutex_unlock(&drvdata->mutex);
+
+	return size;
+}
+
+static DEVICE_ATTR_RW(curr_list);
+
+
+static ssize_t trigger_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t size)
+{
+	int ret = 0;
+	unsigned long val;
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+	if (val != 1)
+		return -EINVAL;
+
+	ret = dcc_sw_trigger(drvdata);
+	if (!ret)
+		ret = size;
+
+	return ret;
+}
+static DEVICE_ATTR_WO(trigger);
+
+static ssize_t enable_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	int ret;
+	bool dcc_enable = false;
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	mutex_lock(&drvdata->mutex);
+	if (drvdata->curr_list >= drvdata->nr_link_list) {
+		dev_err(dev, "Select link list to program using curr_list\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	dcc_enable = is_dcc_enabled(drvdata);
+
+	ret = scnprintf(buf, PAGE_SIZE, "%u\n",
+				(unsigned int)dcc_enable);
+err:
+	mutex_unlock(&drvdata->mutex);
+	return ret;
+}
+
+static ssize_t enable_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t size)
+{
+	int ret = 0;
+	unsigned long val;
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+
+	if (val)
+		ret = dcc_enable(drvdata);
+	else
+		dcc_disable(drvdata);
+
+	if (!ret)
+		ret = size;
+
+	return ret;
+
+}
+
+static DEVICE_ATTR_RW(enable);
+
+static ssize_t config_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+	struct dcc_config_entry *entry;
+	char local_buf[64];
+	int len = 0, count = 0;
+
+	buf[0] = '\0';
+
+	mutex_lock(&drvdata->mutex);
+	if (drvdata->curr_list >= drvdata->nr_link_list) {
+		dev_err(dev, "Select link list to program using curr_list\n");
+		count = -EINVAL;
+		goto err;
+	}
+
+	list_for_each_entry(entry,
+	&drvdata->cfg_head[drvdata->curr_list], list) {
+		switch (entry->desc_type) {
+		case DCC_READ_WRITE_TYPE:
+			len = snprintf(local_buf, 64, "Index: 0x%x, mask: 0x%x, val: 0x%x\n",
+				entry->index, entry->mask, entry->write_val);
+			break;
+		case DCC_LOOP_TYPE:
+			len = snprintf(local_buf, 64, "Index: 0x%x, Loop: %d\n",
+				entry->index, entry->loop_cnt);
+			break;
+		case DCC_WRITE_TYPE:
+			len = snprintf(local_buf, 64,
+				"Write Index: 0x%x, Base: 0x%x, Offset: 0x%x, len: 0x%x APB: %d\n",
+				entry->index, entry->base, entry->offset, entry->len,
+				entry->apb_bus);
+			break;
+		default:
+			len = snprintf(local_buf, 64,
+				"Read Index: 0x%x, Base: 0x%x, Offset: 0x%x, len: 0x%x APB: %d\n",
+				entry->index, entry->base, entry->offset,
+				entry->len, entry->apb_bus);
+		}
+
+		if ((count + len) > PAGE_SIZE) {
+			dev_err(dev, "DCC: Couldn't write complete config\n");
+			break;
+		}
+		strlcat(buf, local_buf, PAGE_SIZE);
+		count += len;
+	}
+
+err:
+	mutex_unlock(&drvdata->mutex);
+	return count;
+}
+
 static int dcc_config_add(struct dcc_drvdata *drvdata, unsigned int addr,
 				unsigned int len, int apb_bus)
 {
@@ -709,6 +990,38 @@ static int dcc_config_add(struct dcc_drvdata *drvdata, unsigned int addr,
 	return ret;
 }
 
+static ssize_t config_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t size)
+{
+	int ret, len, apb_bus;
+	unsigned int base;
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+	int nval;
+
+	nval = sscanf(buf, "%x %i %d", &base, &len, &apb_bus);
+	if (nval <= 0 || nval > 3)
+		return -EINVAL;
+
+	if (nval == 1) {
+		len = 1;
+		apb_bus = 0;
+	} else if (nval == 2) {
+		apb_bus = 0;
+	} else {
+		apb_bus = 1;
+	}
+
+	ret = dcc_config_add(drvdata, base, len, apb_bus);
+	if (ret)
+		return ret;
+
+	return size;
+
+}
+
+static DEVICE_ATTR_RW(config);
+
 static void dcc_config_reset(struct dcc_drvdata *drvdata)
 {
 	struct dcc_config_entry *entry, *temp;
@@ -730,6 +1043,80 @@ static void dcc_config_reset(struct dcc_drvdata *drvdata)
 	mutex_unlock(&drvdata->mutex);
 }
 
+static ssize_t config_reset_store(struct device *dev,
+	struct device_attribute *attr,
+	const char *buf, size_t size)
+{
+	unsigned long val;
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+
+	if (val)
+		dcc_config_reset(drvdata);
+
+	return size;
+}
+
+static DEVICE_ATTR_WO(config_reset);
+
+static ssize_t ready_show(struct device *dev,
+	struct device_attribute *attr, char *buf)
+{
+	int ret;
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	mutex_lock(&drvdata->mutex);
+
+	if (drvdata->curr_list >= drvdata->nr_link_list) {
+		dev_err(dev, "Select link list to program using curr_list\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (!drvdata->enable[drvdata->curr_list]) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = scnprintf(buf, PAGE_SIZE, "%u\n",
+			(unsigned int)BVAL(dcc_readl(drvdata, DCC_STATUS), 1));
+err:
+	mutex_unlock(&drvdata->mutex);
+	return ret;
+}
+
+static DEVICE_ATTR_RO(ready);
+
+static ssize_t interrupt_disable_show(struct device *dev,
+						struct device_attribute *attr,
+						char *buf)
+{
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	return scnprintf(buf, PAGE_SIZE, "%u\n",
+				(unsigned int)drvdata->interrupt_disable);
+}
+
+static ssize_t interrupt_disable_store(struct device *dev,
+	struct device_attribute *attr,
+	const char *buf, size_t size)
+{
+	unsigned long val;
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (kstrtoul(buf, 16, &val))
+		return -EINVAL;
+
+	mutex_lock(&drvdata->mutex);
+	drvdata->interrupt_disable = (val ? 1:0);
+	mutex_unlock(&drvdata->mutex);
+	return size;
+}
+
+static DEVICE_ATTR_RW(interrupt_disable);
+
 static int dcc_add_loop(struct dcc_drvdata *drvdata, unsigned long loop_cnt)
 {
 	struct dcc_config_entry *entry;
@@ -747,6 +1134,40 @@ static int dcc_add_loop(struct dcc_drvdata *drvdata, unsigned long loop_cnt)
 	return 0;
 }
 
+static ssize_t loop_store(struct device *dev,
+	struct device_attribute *attr,
+	const char *buf, size_t size)
+{
+	int ret;
+	unsigned long loop_cnt;
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	mutex_lock(&drvdata->mutex);
+
+	if (kstrtoul(buf, 16, &loop_cnt)) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (drvdata->curr_list >= drvdata->nr_link_list) {
+		dev_err(dev, "Select link list to program using curr_list\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	ret = dcc_add_loop(drvdata, loop_cnt);
+	if (ret)
+		goto err;
+
+	mutex_unlock(&drvdata->mutex);
+	return size;
+err:
+	mutex_unlock(&drvdata->mutex);
+	return ret;
+}
+
+static DEVICE_ATTR_WO(loop);
+
 static int dcc_rd_mod_wr_add(struct dcc_drvdata *drvdata, unsigned int mask,
 				unsigned int val)
 {
@@ -784,6 +1205,30 @@ static int dcc_rd_mod_wr_add(struct dcc_drvdata *drvdata, unsigned int mask,
 	return ret;
 }
 
+static ssize_t rd_mod_wr_store(struct device *dev,
+	struct device_attribute *attr,
+	const char *buf, size_t size)
+{
+	int ret;
+	int nval;
+	unsigned int mask, val;
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	nval = sscanf(buf, "%x %x", &mask, &val);
+
+	if (nval <= 1 || nval > 2)
+		return -EINVAL;
+
+	ret = dcc_rd_mod_wr_add(drvdata, mask, val);
+	if (ret)
+		return ret;
+
+	return size;
+
+}
+
+static DEVICE_ATTR_WO(rd_mod_wr);
+
 static int dcc_add_write(struct dcc_drvdata *drvdata, unsigned int addr,
 				unsigned int write_val, int apb_bus)
 {
@@ -806,6 +1251,77 @@ static int dcc_add_write(struct dcc_drvdata *drvdata, unsigned int addr,
 	return 0;
 }
 
+static ssize_t config_write_store(struct device *dev,
+						struct device_attribute *attr,
+						const char *buf, size_t size)
+{
+	int ret;
+	int nval;
+	unsigned int addr, write_val;
+	int apb_bus = 0;
+	struct dcc_drvdata *drvdata = dev_get_drvdata(dev);
+
+	mutex_lock(&drvdata->mutex);
+
+	nval = sscanf(buf, "%x %x %d", &addr, &write_val, &apb_bus);
+
+	if (nval <= 1 || nval > 3) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (drvdata->curr_list >= drvdata->nr_link_list) {
+		dev_err(dev, "Select link list to program using curr_list\n");
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (nval == 3 && apb_bus != 0)
+		apb_bus = 1;
+
+	ret = dcc_add_write(drvdata, addr, write_val, apb_bus);
+	if (ret)
+		goto err;
+
+	mutex_unlock(&drvdata->mutex);
+	return size;
+err:
+	mutex_unlock(&drvdata->mutex);
+	return ret;
+}
+
+static DEVICE_ATTR_WO(config_write);
+
+static const struct device_attribute *dcc_attrs[] = {
+	&dev_attr_trigger,
+	&dev_attr_enable,
+	&dev_attr_config,
+	&dev_attr_config_reset,
+	&dev_attr_ready,
+	&dev_attr_interrupt_disable,
+	&dev_attr_loop,
+	&dev_attr_rd_mod_wr,
+	&dev_attr_curr_list,
+	&dev_attr_config_write,
+	NULL,
+};
+
+static int dcc_create_files(struct device *dev,
+					const struct device_attribute **attrs)
+{
+	int ret = 0, i;
+
+	for (i = 0; attrs[i] != NULL; i++) {
+		ret = device_create_file(dev, attrs[i]);
+		if (ret) {
+			dev_err(dev, "DCC: Couldn't create sysfs attribute: %s\n",
+				attrs[i]->attr.name);
+			break;
+		}
+	}
+	return ret;
+}
+
 static int dcc_sram_open(struct inode *inode, struct file *file)
 {
 	struct dcc_drvdata *drvdata = container_of(inode->i_cdev,
@@ -1018,6 +1534,9 @@ static int dcc_probe(struct platform_device *pdev)
 	ret = dcc_sram_dev_init(drvdata);
 	if (ret)
 		goto err;
+	ret = dcc_create_files(dev, dcc_attrs);
+	if (ret)
+		goto err;
 
 	return ret;
 err:
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

