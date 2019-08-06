Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A59F8289D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2019 02:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731137AbfHFAW7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 20:22:59 -0400
Received: from onstation.org ([52.200.56.107]:35920 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731079AbfHFAW6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 20:22:58 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 87B033E9AC;
        Tue,  6 Aug 2019 00:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1565050977;
        bh=S/QdnhMCwKW5JSFlLDs+tHo/hKIlLBjJoq6uDPtLTwI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GUBViSodITe0a+hZ/1CA/MDR88/ZQhQ7C6C83qMDPKdOZWazTFrCncZr8uIrtLXqp
         RsAxQMFYmnKMe7rsUMjfCQsEn8UthVKpMpzl4CII4ZSs9+X6ShyqyKsXaZiF7ieFp4
         5WEf5lx8YouE6iaUPwJoiWh57vz2LKMviSnsf+Tw=
From:   Brian Masney <masneyb@onstation.org>
To:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        robh+dt@kernel.org, bjorn.andersson@linaro.org
Cc:     airlied@linux.ie, daniel@ffwll.ch, mark.rutland@arm.com,
        jonathan@marek.ca, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org
Subject: [PATCH v5 3/7] firmware: qcom: scm: add OCMEM lock/unlock interface
Date:   Mon,  5 Aug 2019 20:22:25 -0400
Message-Id: <20190806002229.8304-4-masneyb@onstation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806002229.8304-1-masneyb@onstation.org>
References: <20190806002229.8304-1-masneyb@onstation.org>
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

Changes since v4:
- None

Changes since v3:
- None

Changes since v2:
- None

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
index 4802ab170fe5..7e285ff3961d 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -191,6 +191,46 @@ bool qcom_scm_pas_supported(u32 peripheral)
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
index 2d5eff506e13..b49b734d662c 100644
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
2.21.0

