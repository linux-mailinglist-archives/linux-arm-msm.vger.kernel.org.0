Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2A204B017
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 04:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730250AbfFSCcP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 22:32:15 -0400
Received: from onstation.org ([52.200.56.107]:35146 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726037AbfFSCcP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 22:32:15 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id C43423EA0C;
        Wed, 19 Jun 2019 02:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1560911534;
        bh=m+FjFG/O2+MtKXdWsou3HV7U4Yd6HH276SCkzTon7/w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y7NUoMc2caX/QxxoMDR4ZMBHT3uEIT20W7mDzY43a2HkV9VWzNGkJ95sNrs4dG8u+
         +AjqoRgupBpuDwQDhAI7WJHkmuW7ZQVBmK7dHKMWk4nsFkLkQsGEB8POaQy2H5xvjU
         Xf/MXphxoedf+cuOvmSU54FZLBZYfLM76EVIJidA=
From:   Brian Masney <masneyb@onstation.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        david.brown@linaro.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/6] firmware: qcom: scm: add OCMEM lock/unlock interface
Date:   Tue, 18 Jun 2019 22:32:06 -0400
Message-Id: <20190619023209.10036-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190619023209.10036-1-masneyb@onstation.org>
References: <20190619023209.10036-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@gmail.com>

Add support for the OCMEM lock/unlock interface that is needed by the
On Chip MEMory (OCMEM) that is present on some Snapdragon devices.

Signed-off-by: Rob Clark <robdclark@gmail.com>
[masneyb@onstation.org: ported to latest kernel; minor reformatting.]
Signed-off-by: Brian Masney <masneyb@onstation.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Rob's last version of this patch:
https://patchwork.kernel.org/patch/7340711/

Changes since v1:
- None

 drivers/firmware/qcom_scm-32.c | 35 +++++++++++++++++++++++++++++
 drivers/firmware/qcom_scm-64.c | 12 ++++++++++
 drivers/firmware/qcom_scm.c    | 40 ++++++++++++++++++++++++++++++++++
 drivers/firmware/qcom_scm.h    |  9 ++++++++
 include/linux/qcom_scm.h       | 15 +++++++++++++
 5 files changed, 111 insertions(+)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 215061c581e1..4c2514e5e249 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -442,6 +442,41 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 		req, req_cnt * sizeof(*req), resp, sizeof(*resp));
 }
 
+int __qcom_scm_ocmem_lock(struct device *dev, u32 id, u32 offset, u32 size,
+			  u32 mode)
+{
+	struct ocmem_tz_lock {
+		__le32 id;
+		__le32 offset;
+		__le32 size;
+		__le32 mode;
+	} request;
+
+	request.id = cpu_to_le32(id);
+	request.offset = cpu_to_le32(offset);
+	request.size = cpu_to_le32(size);
+	request.mode = cpu_to_le32(mode);
+
+	return qcom_scm_call(dev, QCOM_SCM_OCMEM_SVC, QCOM_SCM_OCMEM_LOCK_CMD,
+			     &request, sizeof(request), NULL, 0);
+}
+
+int __qcom_scm_ocmem_unlock(struct device *dev, u32 id, u32 offset, u32 size)
+{
+	struct ocmem_tz_unlock {
+		__le32 id;
+		__le32 offset;
+		__le32 size;
+	} request;
+
+	request.id = cpu_to_le32(id);
+	request.offset = cpu_to_le32(offset);
+	request.size = cpu_to_le32(size);
+
+	return qcom_scm_call(dev, QCOM_SCM_OCMEM_SVC, QCOM_SCM_OCMEM_UNLOCK_CMD,
+			     &request, sizeof(request), NULL, 0);
+}
+
 void __qcom_scm_init(void)
 {
 }
diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 91d5ad7cf58b..c3a3d9874def 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -241,6 +241,18 @@ int __qcom_scm_hdcp_req(struct device *dev, struct qcom_scm_hdcp_req *req,
 	return ret;
 }
 
+int __qcom_scm_ocmem_lock(struct device *dev, uint32_t id, uint32_t offset,
+			  uint32_t size, uint32_t mode)
+{
+	return -ENOTSUPP;
+}
+
+int __qcom_scm_ocmem_unlock(struct device *dev, uint32_t id, uint32_t offset,
+			    uint32_t size)
+{
+	return -ENOTSUPP;
+}
+
 void __qcom_scm_init(void)
 {
 	u64 cmd;
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 2ddc118dba1b..2e12ea56c34c 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -190,6 +190,46 @@ bool qcom_scm_pas_supported(u32 peripheral)
 }
 EXPORT_SYMBOL(qcom_scm_pas_supported);
 
+/**
+ * qcom_scm_ocmem_lock_available() - is OCMEM lock/unlock interface available
+ */
+bool qcom_scm_ocmem_lock_available(void)
+{
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_OCMEM_SVC,
+					    QCOM_SCM_OCMEM_LOCK_CMD);
+}
+EXPORT_SYMBOL(qcom_scm_ocmem_lock_available);
+
+/**
+ * qcom_scm_ocmem_lock() - call OCMEM lock interface to assign an OCMEM
+ * region to the specified initiator
+ *
+ * @id:     tz initiator id
+ * @offset: OCMEM offset
+ * @size:   OCMEM size
+ * @mode:   access mode (WIDE/NARROW)
+ */
+int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset, u32 size,
+			u32 mode)
+{
+	return __qcom_scm_ocmem_lock(__scm->dev, id, offset, size, mode);
+}
+EXPORT_SYMBOL(qcom_scm_ocmem_lock);
+
+/**
+ * qcom_scm_ocmem_unlock() - call OCMEM unlock interface to release an OCMEM
+ * region from the specified initiator
+ *
+ * @id:     tz initiator id
+ * @offset: OCMEM offset
+ * @size:   OCMEM size
+ */
+int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset, u32 size)
+{
+	return __qcom_scm_ocmem_unlock(__scm->dev, id, offset, size);
+}
+EXPORT_SYMBOL(qcom_scm_ocmem_unlock);
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 99506bd873c0..ef293ee67ec1 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -42,6 +42,15 @@ extern int __qcom_scm_hdcp_req(struct device *dev,
 
 extern void __qcom_scm_init(void);
 
+#define QCOM_SCM_OCMEM_SVC			0xf
+#define QCOM_SCM_OCMEM_LOCK_CMD		0x1
+#define QCOM_SCM_OCMEM_UNLOCK_CMD		0x2
+
+extern int __qcom_scm_ocmem_lock(struct device *dev, u32 id, u32 offset,
+				 u32 size, u32 mode);
+extern int __qcom_scm_ocmem_unlock(struct device *dev, u32 id, u32 offset,
+				   u32 size);
+
 #define QCOM_SCM_SVC_PIL		0x2
 #define QCOM_SCM_PAS_INIT_IMAGE_CMD	0x1
 #define QCOM_SCM_PAS_MEM_SETUP_CMD	0x2
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index 3f12cc77fb58..521b089be1c9 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -24,6 +24,16 @@ struct qcom_scm_vmperm {
 	int perm;
 };
 
+enum qcom_scm_ocmem_client {
+	QCOM_SCM_OCMEM_UNUSED_ID = 0x0,
+	QCOM_SCM_OCMEM_GRAPHICS_ID,
+	QCOM_SCM_OCMEM_VIDEO_ID,
+	QCOM_SCM_OCMEM_LP_AUDIO_ID,
+	QCOM_SCM_OCMEM_SENSORS_ID,
+	QCOM_SCM_OCMEM_OTHER_OS_ID,
+	QCOM_SCM_OCMEM_DEBUG_ID,
+};
+
 #define QCOM_SCM_VMID_HLOS       0x3
 #define QCOM_SCM_VMID_MSS_MSA    0xF
 #define QCOM_SCM_VMID_WLAN       0x18
@@ -41,6 +51,11 @@ extern bool qcom_scm_is_available(void);
 extern bool qcom_scm_hdcp_available(void);
 extern int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
 			     u32 *resp);
+extern bool qcom_scm_ocmem_lock_available(void);
+extern int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
+			       u32 size, u32 mode);
+extern int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset,
+				 u32 size);
 extern bool qcom_scm_pas_supported(u32 peripheral);
 extern int qcom_scm_pas_init_image(u32 peripheral, const void *metadata,
 				   size_t size);
-- 
2.20.1

