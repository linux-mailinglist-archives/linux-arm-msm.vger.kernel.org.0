Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3684474C5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Jun 2019 15:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727255AbfFPNaE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jun 2019 09:30:04 -0400
Received: from onstation.org ([52.200.56.107]:53676 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727235AbfFPN3s (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jun 2019 09:29:48 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id EAA6B3EA09;
        Sun, 16 Jun 2019 13:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1560691787;
        bh=IvihjvxJrpflaZx8L6IactS1thBLIM/+BYBN9VVX/oE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HK+XvpQX8trVvroDCRyK56lSu0KgsbaSsefd8SPk6qv2oMdAFMXfbUyMfNib26j4j
         nR3xOCe7NlhD1i2stlnjDRV6YYC+v0g7j9/p5E0CRb5II9FczIo1iWUkekdtszh5St
         cWXKBCCNfXmWw9JasfMm9MguyjZ1CxEU2JwDG410=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, airlied@linux.ie, daniel@ffwll.ch,
        mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/6] firmware: qcom: scm: add support to restore secure config
Date:   Sun, 16 Jun 2019 09:29:27 -0400
Message-Id: <20190616132930.6942-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190616132930.6942-1-masneyb@onstation.org>
References: <20190616132930.6942-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@gmail.com>

Add support to restore the secure configuration that is needed by the
On Chip MEMory (OCMEM) that is present on some Snapdragon devices.

Signed-off-by: Rob Clark <robdclark@gmail.com>
[masneyb@onstation.org: ported to latest kernel; minor reformatting.]
Signed-off-by: Brian Masney <masneyb@onstation.org>
---
Rob's last version of this patch:
https://patchwork.kernel.org/patch/7340701/

 drivers/firmware/qcom_scm-32.c | 21 +++++++++++++++++++++
 drivers/firmware/qcom_scm-64.c |  6 ++++++
 drivers/firmware/qcom_scm.c    | 23 +++++++++++++++++++++++
 drivers/firmware/qcom_scm.h    |  6 ++++++
 include/linux/qcom_scm.h       | 13 +++++++++++++
 5 files changed, 69 insertions(+)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 215061c581e1..089b47124933 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -442,6 +442,27 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 		req, req_cnt * sizeof(*req), resp, sizeof(*resp));
 }
 
+int __qcom_scm_restore_sec_config(struct device *dev, u32 sec_id,
+				  u32 ctx_bank_num)
+{
+	struct msm_scm_sec_cfg {
+		__le32 id;
+		__le32 ctx_bank_num;
+	} cfg;
+	int ret, scm_ret = 0;
+
+	cfg.id = cpu_to_le32(sec_id);
+	cfg.ctx_bank_num = cpu_to_le32(sec_id);
+
+	ret = qcom_scm_call(dev, QCOM_SCM_MP_SVC, QCOM_SCM_MP_RESTORE_SEC_CFG,
+			    &cfg, sizeof(cfg), &scm_ret, sizeof(scm_ret));
+
+	if (ret || scm_ret)
+		return ret ? ret : -EINVAL;
+
+	return 0;
+}
+
 void __qcom_scm_init(void)
 {
 }
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 91d5ad7cf58b..b6b78da7f9c9 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -241,6 +241,12 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 	return ret;
 }
 
+int __qcom_scm_restore_sec_config(struct device *dev, u32 sec_id,
+				  u32 ctx_bank_num)
+{
+	return -ENOTSUPP;
+}
+
 void __qcom_scm_init(void)
 {
 	u64 cmd;
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 2ddc118dba1b..5495ef994c5d 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -170,6 +170,29 @@ int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt, u32 *resp)
 }
 EXPORT_SYMBOL(qcom_scm_hdcp_req);
 
+/**
+ * qcom_scm_restore_sec_config_available() - Check if secure environment
+ * supports restore security config interface.
+ *
+ * Return true if restore-cfg interface is supported, false if not.
+ */
+bool qcom_scm_restore_sec_config_available(void)
+{
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_MP_SVC,
+					    QCOM_SCM_MP_RESTORE_SEC_CFG);
+}
+EXPORT_SYMBOL(qcom_scm_restore_sec_config_available);
+
+/**
+ * qcom_scm_restore_sec_config() - call restore-cfg interface
+ */
+int qcom_scm_restore_sec_config(struct device *dev,
+				enum qcom_scm_sec_dev_id sec_id)
+{
+	return __qcom_scm_restore_sec_config(dev, sec_id, 0);
+}
+EXPORT_SYMBOL(qcom_scm_restore_sec_config);
+
 /**
  * qcom_scm_pas_supported() - Check if the peripheral authentication service is
  *			      available for the given peripherial
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 99506bd873c0..bccc7d10c5c2 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -42,6 +42,12 @@ extern int __qcom_scm_hdcp_req(struct device *dev,
 
 extern void __qcom_scm_init(void);
 
+#define QCOM_SCM_MP_SVC			0xc
+#define QCOM_SCM_MP_RESTORE_SEC_CFG	0x2
+
+extern int __qcom_scm_restore_sec_config(struct device *dev, u32 sec_id,
+					 u32 ctx_bank_num);
+
 #define QCOM_SCM_SVC_PIL		0x2
 #define QCOM_SCM_PAS_INIT_IMAGE_CMD	0x1
 #define QCOM_SCM_PAS_MEM_SETUP_CMD	0x2
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index 3f12cc77fb58..b5c0afaca955 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -24,6 +24,16 @@ struct qcom_scm_vmperm {
 	int perm;
 };
 
+enum qcom_scm_sec_dev_id {
+	QCOM_SCM_MDSS_DEV_ID	= 1,
+	QCOM_SCM_OCMEM_DEV_ID	= 5,
+	QCOM_SCM_PCIE0_DEV_ID	= 11,
+	QCOM_SCM_PCIE1_DEV_ID	= 12,
+	QCOM_SCM_GFX_DEV_ID	= 18,
+	QCOM_SCM_UFS_DEV_ID	= 19,
+	QCOM_SCM_ICE_DEV_ID	= 20,
+};
+
 #define QCOM_SCM_VMID_HLOS       0x3
 #define QCOM_SCM_VMID_MSS_MSA    0xF
 #define QCOM_SCM_VMID_WLAN       0x18
@@ -41,6 +51,9 @@ extern bool qcom_scm_is_available(void);
 extern bool qcom_scm_hdcp_available(void);
 extern int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
 			     u32 *resp);
+extern bool qcom_scm_restore_sec_config_available(void);
+extern int qcom_scm_restore_sec_config(struct device *dev,
+				       enum qcom_scm_sec_dev_id sec_id);
 extern bool qcom_scm_pas_supported(u32 peripheral);
 extern int qcom_scm_pas_init_image(u32 peripheral, const void *metadata,
 				   size_t size);
-- 
2.20.1

