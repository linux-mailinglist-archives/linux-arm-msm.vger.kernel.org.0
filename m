Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 002CC806AF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Aug 2019 16:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbfHCOUp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Aug 2019 10:20:45 -0400
Received: from onstation.org ([52.200.56.107]:57298 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727716AbfHCOUo (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Aug 2019 10:20:44 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 9456C3E9AC;
        Sat,  3 Aug 2019 14:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1564842044;
        bh=WZRqHuWS+4CgfWMQ+vkxByG3uN+4wC/60aklIyk/h6c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GODeDzNHD37XkndGz2lDLyg4EeEnAnu3rqNQowxls9Uw/i12Sj70rAxTZfDrCSwVF
         B26rRo6pTVkbImfLXOhg1JcA13MfWkwH9Z/y62RMf9+qyPUrg0oNRcqhf/wAUa1Cua
         NlmC3pa6lwS/EPByPily+5mbIt6bn7O7T6KUQdEw=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org
Subject: [PATCH v4 4/6] firmware: qcom: scm: add support to restore secure config to qcm_scm-32
Date:   Sat,  3 Aug 2019 10:20:24 -0400
Message-Id: <20190803142026.9647-5-masneyb@onstation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803142026.9647-1-masneyb@onstation.org>
References: <20190803142026.9647-1-masneyb@onstation.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@gmail.com>

Add support to restore the secure configuration for qcm_scm-32.c. This
is needed by the On Chip MEMory (OCMEM) that is present on some
Snapdragon devices.

Signed-off-by: Rob Clark <robdclark@gmail.com>
[masneyb@onstation.org: ported to latest kernel; set ctx_bank_num to
 spare parameter.]
Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Changes since v3:
- None

Changes since v2:
- None

Changes since v1:
- Use existing __qcom_scm_restore_sec_cfg() function stub in
  qcom_scm-32.c that was unimplemented
- Set the cfg.ctx_bank_num to the spare function parameter. It was
  previously set to the device_id.

 drivers/firmware/qcom_scm-32.c | 17 ++++++++++++++++-
 drivers/firmware/qcom_scm.c    | 13 +++++++++++++
 include/linux/qcom_scm.h       | 11 +++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 4c2514e5e249..5d90b7f5ab5a 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -617,7 +617,22 @@ int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
 			       u32 spare)
 {
-	return -ENODEV;
+	struct msm_scm_sec_cfg {
+		__le32 id;
+		__le32 ctx_bank_num;
+	} cfg;
+	int ret, scm_ret = 0;
+
+	cfg.id = cpu_to_le32(device_id);
+	cfg.ctx_bank_num = cpu_to_le32(spare);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP, QCOM_SCM_RESTORE_SEC_CFG,
+			    &cfg, sizeof(cfg), &scm_ret, sizeof(scm_ret));
+
+	if (ret || scm_ret)
+		return ret ? ret : -EINVAL;
+
+	return 0;
 }
 
 int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 7e285ff3961d..27c1d98a34e6 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -367,6 +367,19 @@ static const struct reset_control_ops qcom_scm_pas_reset_ops = {
 	.deassert = qcom_scm_pas_reset_deassert,
 };
 
+/**
+ * qcom_scm_restore_sec_cfg_available() - Check if secure environment
+ * supports restore security config interface.
+ *
+ * Return true if restore-cfg interface is supported, false if not.
+ */
+bool qcom_scm_restore_sec_cfg_available(void)
+{
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_MP,
+					    QCOM_SCM_RESTORE_SEC_CFG);
+}
+EXPORT_SYMBOL(qcom_scm_restore_sec_cfg_available);
+
 int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare)
 {
 	return __qcom_scm_restore_sec_cfg(__scm->dev, device_id, spare);
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index b49b734d662c..04382e1798e4 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -34,6 +34,16 @@ enum qcom_scm_ocmem_client {
 	QCOM_SCM_OCMEM_DEBUG_ID,
 };
 
+enum qcom_scm_sec_dev_id {
+	QCOM_SCM_MDSS_DEV_ID    = 1,
+	QCOM_SCM_OCMEM_DEV_ID   = 5,
+	QCOM_SCM_PCIE0_DEV_ID   = 11,
+	QCOM_SCM_PCIE1_DEV_ID   = 12,
+	QCOM_SCM_GFX_DEV_ID     = 18,
+	QCOM_SCM_UFS_DEV_ID     = 19,
+	QCOM_SCM_ICE_DEV_ID     = 20,
+};
+
 #define QCOM_SCM_VMID_HLOS       0x3
 #define QCOM_SCM_VMID_MSS_MSA    0xF
 #define QCOM_SCM_VMID_WLAN       0x18
@@ -70,6 +80,7 @@ extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 extern void qcom_scm_cpu_power_down(u32 flags);
 extern u32 qcom_scm_get_version(void);
 extern int qcom_scm_set_remote_state(u32 state, u32 id);
+extern bool qcom_scm_restore_sec_cfg_available(void);
 extern int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare);
 extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
 extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
-- 
2.21.0

