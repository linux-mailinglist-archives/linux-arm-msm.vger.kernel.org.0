Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E5A2EA3E0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 04:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbhAEDYh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 22:24:37 -0500
Received: from labrats.qualcomm.com ([199.106.110.90]:35354 "EHLO
        labrats.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbhAEDYh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 22:24:37 -0500
X-Greylist: delayed 444 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Jan 2021 22:24:36 EST
IronPort-SDR: AhtnQ7Xvm5KUQEloCh418sowHolS6f/H+MggmN/W9Cb7w7aDXzHIZdUABr9EP9P2Po7XvzvA1a
 D8ReidcUSlH2XWfRy7pO2LkG27JKL+ss/62Ae96nARrCYi4ecvLYPeeeFtNZ5qxbkw+N1+lI7X
 lDkp8aMwfbrHlNrZKzEkgDTu+Wovxbr39bjsxl3wLyKWcE5+ZPEwQWAlbupjXJ5V+noEUsZ1Qr
 LlfdZY7Oh4dbhcHw6U/dJTJgzPoA66v+FP7f3R8kfTP7A3McdyZ2MrnOtJOmvhr+Jqv6WdGxoS
 Kao=
X-IronPort-AV: E=Sophos;i="5.78,475,1599548400"; 
   d="scan'208";a="29488174"
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by labrats.qualcomm.com with ESMTP; 04 Jan 2021 19:16:08 -0800
X-QCInternal: smtphost
Received: from wsp769891wss.qualcomm.com (HELO stor-presley.qualcomm.com) ([192.168.140.85])
  by ironmsg03-sd.qualcomm.com with ESMTP; 04 Jan 2021 19:16:06 -0800
Received: by stor-presley.qualcomm.com (Postfix, from userid 359480)
        id 7C7582184B; Mon,  4 Jan 2021 19:16:06 -0800 (PST)
From:   Can Guo <cang@codeaurora.org>
To:     asutoshd@codeaurora.org, nguyenb@codeaurora.org,
        hongwus@codeaurora.org, rnayak@codeaurora.org,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com, cang@codeaurora.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] scsi: ufs-qcom: Add one sysfs node to monitor performance
Date:   Mon,  4 Jan 2021 19:15:51 -0800
Message-Id: <1609816552-16442-3-git-send-email-cang@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609816552-16442-1-git-send-email-cang@codeaurora.org>
References: <1609816552-16442-1-git-send-email-cang@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add one sysfs node to monitor driver layer performance data. One can
manipulate it to get performance related statistics during runtime.

Signed-off-by: Can Guo <cang@codeaurora.org>

diff --git a/drivers/scsi/ufs/ufs-qcom.c b/drivers/scsi/ufs/ufs-qcom.c
index 2206b1e..5303ce9 100644
--- a/drivers/scsi/ufs/ufs-qcom.c
+++ b/drivers/scsi/ufs/ufs-qcom.c
@@ -42,6 +42,7 @@ static struct ufs_qcom_host *ufs_qcom_hosts[MAX_UFS_QCOM_HOSTS];
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
 static int ufs_qcom_set_dme_vs_core_clk_ctrl_clear_div(struct ufs_hba *hba,
 						       u32 clk_cycles);
+static int ufs_qcom_init_sysfs(struct ufs_hba *hba);
 
 static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
 {
@@ -1088,6 +1089,8 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 		err = 0;
 	}
 
+	ufs_qcom_init_sysfs(hba);
+
 	goto out;
 
 out_variant_clear:
@@ -1453,6 +1456,85 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
 }
 #endif
 
+static inline int ufs_qcom_opcode_rw_dir(u8 opcode)
+{
+	if (opcode == READ_6 || opcode == READ_10 || opcode == READ_16)
+		return READ;
+	else if (opcode == WRITE_6 || opcode == WRITE_10 || opcode == WRITE_16)
+		return WRITE;
+	else
+		return -EINVAL;
+}
+
+static inline bool ufs_qcom_should_start_monitor(struct ufs_qcom_host *host,
+						 struct ufshcd_lrb *lrbp)
+{
+	return (host->monitor.enabled && lrbp && lrbp->cmd &&
+		ktime_before(host->monitor.enabled_ts, lrbp->issue_time_stamp));
+}
+
+static void ufs_qcom_monitor_start_busy(struct ufs_hba *hba, int tag)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct ufshcd_lrb *lrbp;
+	int dir;
+
+	lrbp = &hba->lrb[tag];
+	if (ufs_qcom_should_start_monitor(host, lrbp)) {
+		dir = ufs_qcom_opcode_rw_dir(*lrbp->cmd->cmnd);
+		if (dir >= 0 && host->monitor.nr_queued[dir]++ == 0)
+			host->monitor.busy_start_ts[dir] =
+						lrbp->issue_time_stamp;
+	}
+}
+
+static void ufs_qcom_update_monitor(struct ufs_hba *hba, int tag)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct ufshcd_lrb *lrbp;
+	int dir;
+
+	lrbp = &hba->lrb[tag];
+	if (ufs_qcom_should_start_monitor(host, lrbp)) {
+		dir = ufs_qcom_opcode_rw_dir(*lrbp->cmd->cmnd);
+		if (dir >= 0 && host->monitor.nr_queued[dir] > 0) {
+			struct request *req;
+			struct ufs_qcom_perf_monitor *mon;
+			ktime_t now, inc, lat;
+
+			mon = &host->monitor;
+			req = lrbp->cmd->request;
+			mon->nr_sec_rw[dir] += blk_rq_sectors(req);
+			now = ktime_get();
+			inc = ktime_sub(now, mon->busy_start_ts[dir]);
+			mon->total_busy[dir] =
+				ktime_add(mon->total_busy[dir], inc);
+			/* push forward the busy start of monitor */
+			mon->busy_start_ts[dir] = now;
+			mon->nr_queued[dir]--;
+
+			/* update latencies */
+			mon->nr_req[dir]++;
+			lat = ktime_sub(now, lrbp->issue_time_stamp);
+			mon->lat_sum[dir] += lat;
+			if (mon->lat_max[dir] < lat || !mon->lat_max[dir])
+				mon->lat_max[dir] = lat;
+			if (mon->lat_min[dir] > lat || !mon->lat_min[dir])
+				mon->lat_min[dir] = lat;
+		}
+	}
+}
+
+static void ufs_qcom_setup_xfer_req(struct ufs_hba *hba, int tag, bool is_scsi_cmd)
+{
+	ufs_qcom_monitor_start_busy(hba, tag);
+}
+
+static void ufs_qcom_compl_xfer_req(struct ufs_hba *hba, int tag, bool is_scsi_cmd)
+{
+	ufs_qcom_update_monitor(hba, tag);
+}
+
 /*
  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
  *
@@ -1476,8 +1558,112 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.device_reset		= ufs_qcom_device_reset,
 	.config_scaling_param = ufs_qcom_config_scaling_param,
 	.program_key		= ufs_qcom_ice_program_key,
+	.setup_xfer_req         = ufs_qcom_setup_xfer_req,
+	.compl_xfer_req         = ufs_qcom_compl_xfer_req,
 };
 
+static ssize_t monitor_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct ufs_qcom_perf_monitor *mon = &host->monitor;
+	unsigned long nr_sec_rd, nr_sec_wr, busy_us_rd, busy_us_wr;
+	unsigned long lat_max_rd, lat_min_rd, lat_sum_rd, lat_avg_rd, nr_req_rd;
+	unsigned long lat_max_wr, lat_min_wr, lat_sum_wr, lat_avg_wr, nr_req_wr;
+	bool is_enabled;
+
+	/*
+	 * Don't lock the host lock since user needs to cat the entry very
+	 * frequently during performance test, otherwise it may impact the
+	 * performance.
+	 */
+	is_enabled = mon->enabled;
+	if (!is_enabled)
+		goto print_usage;
+
+	nr_sec_rd = mon->nr_sec_rw[READ];
+	nr_sec_wr = mon->nr_sec_rw[WRITE];
+	busy_us_rd = ktime_to_us(mon->total_busy[READ]);
+	busy_us_wr = ktime_to_us(mon->total_busy[WRITE]);
+
+	nr_req_rd = mon->nr_req[READ];
+	lat_max_rd = ktime_to_us(mon->lat_max[READ]);
+	lat_min_rd = ktime_to_us(mon->lat_min[READ]);
+	lat_sum_rd = ktime_to_us(mon->lat_sum[READ]);
+	lat_avg_rd = lat_sum_rd / nr_req_rd;
+
+	nr_req_wr = mon->nr_req[WRITE];
+	lat_max_wr = ktime_to_us(mon->lat_max[WRITE]);
+	lat_min_wr = ktime_to_us(mon->lat_min[WRITE]);
+	lat_sum_wr = ktime_to_us(mon->lat_sum[WRITE]);
+	lat_avg_wr = lat_sum_wr / nr_req_wr;
+
+	return scnprintf(buf, PAGE_SIZE, "Read %lu %s %lu us, %lu %s max %lu | min %lu | avg %lu | sum %lu\nWrite %lu %s %lu us, %lu %s max %lu | min %lu | avg %lu | sum %lu\n",
+		 nr_sec_rd, "sectors (in 512 bytes) in ", busy_us_rd,
+		 nr_req_rd, "read reqs completed, latencies in us: ",
+		 lat_max_rd, lat_min_rd, lat_avg_rd, lat_sum_rd,
+		 nr_sec_wr, "sectors (in 512 bytes) in ", busy_us_wr,
+		 nr_req_wr, "write reqs completed, latencies in us: ",
+		 lat_max_wr, lat_min_wr, lat_avg_wr, lat_sum_wr);
+
+print_usage:
+	return scnprintf(buf, PAGE_SIZE, "%s\n%s",
+			 "To start monitoring, echo 1 > monitor, cat monitor.",
+			 "To stop monitoring, echo 0 > monitor.");
+}
+
+static ssize_t monitor_store(struct device *dev, struct device_attribute *attr,
+			     const char *buf, size_t count)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	unsigned long value, flags;
+
+	if (kstrtoul(buf, 0, &value))
+		return -EINVAL;
+
+	value = !!value;
+	spin_lock_irqsave(hba->host->host_lock, flags);
+	if (value == host->monitor.enabled)
+		goto out_unlock;
+
+	if (!value) {
+		memset(&host->monitor, 0, sizeof(host->monitor));
+	} else {
+		host->monitor.enabled = true;
+		host->monitor.enabled_ts = ktime_get();
+	}
+
+out_unlock:
+	spin_unlock_irqrestore(hba->host->host_lock, flags);
+	return count;
+}
+
+static DEVICE_ATTR_RW(monitor);
+
+static struct attribute *ufs_qcom_sysfs_attrs[] = {
+	&dev_attr_monitor.attr,
+	NULL
+};
+
+static const struct attribute_group ufs_qcom_sysfs_group = {
+	.name = "qcom",
+	.attrs = ufs_qcom_sysfs_attrs,
+};
+
+static int ufs_qcom_init_sysfs(struct ufs_hba *hba)
+{
+	int ret;
+
+	ret = sysfs_create_group(&hba->dev->kobj, &ufs_qcom_sysfs_group);
+	if (ret)
+		dev_err(hba->dev, "%s: Failed to create qcom sysfs group (err = %d)\n",
+			__func__, ret);
+
+	return ret;
+}
+
 /**
  * ufs_qcom_probe - probe routine of the driver
  * @pdev: pointer to Platform device handle
diff --git a/drivers/scsi/ufs/ufs-qcom.h b/drivers/scsi/ufs/ufs-qcom.h
index 8208e3a..4c7e8ac 100644
--- a/drivers/scsi/ufs/ufs-qcom.h
+++ b/drivers/scsi/ufs/ufs-qcom.h
@@ -177,6 +177,23 @@ struct ufs_qcom_testbus {
 
 struct gpio_desc;
 
+/* Host performance monitor */
+struct ufs_qcom_perf_monitor {
+	/* latencies*/
+	ktime_t lat_sum[2];
+	ktime_t lat_max[2];
+	ktime_t lat_min[2];
+	unsigned long nr_req[2];
+	unsigned long nr_sec_rw[2];
+
+	u32 nr_queued[2];
+	ktime_t busy_start_ts[2];
+	ktime_t total_busy[2];
+
+	ktime_t enabled_ts;
+	bool enabled;
+};
+
 struct ufs_qcom_host {
 	/*
 	 * Set this capability if host controller supports the QUniPro mode
@@ -220,6 +237,8 @@ struct ufs_qcom_host {
 	struct reset_controller_dev rcdev;
 
 	struct gpio_desc *device_reset;
+
+	struct ufs_qcom_perf_monitor monitor;
 };
 
 static inline u32
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

