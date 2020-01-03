Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25F7512FE95
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2020 23:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728698AbgACWIc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jan 2020 17:08:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:48642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728549AbgACWIc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jan 2020 17:08:32 -0500
Received: from localhost.localdomain (unknown [194.230.155.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E7B1821835;
        Fri,  3 Jan 2020 22:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578089311;
        bh=d3/j7z2yjI7lEIuDxbgdAHv52WUhDcszZmPvZvTiEp8=;
        h=From:To:Cc:Subject:Date:From;
        b=Nie4K1gpZcU3az/rdhD9XkV6Ern8kdkfy421SNl/iDVQ/g5YQU2nnA+BgHq2hfB6O
         8Mp9BFQYnwT9pHO7Mlu6zQfgIF32nWIgb374YZmzW5x2ZrQAn0a7NtNVMq0L+EivJS
         FZGa096PHMarzvD+4BRZ9ZmwCzetosVMomxg1jls=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] firmware: scm: Add stubs for OCMEM and restore_sec_cfg_available
Date:   Fri,  3 Jan 2020 23:08:25 +0100
Message-Id: <20200103220825.28710-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add few more stubs (for OCMEM-related functions and
qcom_scm_restore_sec_cfg_available()) in case of !CONFIG_QCOM_SCM.
These are actually not necessary for builds but provide them for
completeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 include/linux/qcom_scm.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index d05ddac9a57e..2c1d20312ce0 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -105,6 +105,11 @@ static inline bool qcom_scm_is_available(void) { return false; }
 static inline bool qcom_scm_hdcp_available(void) { return false; }
 static inline int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
 				    u32 *resp) { return -ENODEV; }
+static inline bool qcom_scm_ocmem_lock_available(void) { return false; }
+static inline int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
+				      u32 size, u32 mode) { return -ENODEV; }
+static inline int qcom_scm_ocmem_unlock(enum qcom_scm_ocmem_client id, u32 offset,
+					u32 size) { return -ENODEV; }
 static inline bool qcom_scm_pas_supported(u32 peripheral) { return false; }
 static inline int qcom_scm_pas_init_image(u32 peripheral, const void *metadata,
 					  size_t size) { return -ENODEV; }
@@ -121,6 +126,7 @@ static inline void qcom_scm_cpu_power_down(u32 flags) {}
 static inline u32 qcom_scm_get_version(void) { return 0; }
 static inline u32
 qcom_scm_set_remote_state(u32 state,u32 id) { return -ENODEV; }
+static inline bool qcom_scm_restore_sec_cfg_available(void) { return false; }
 static inline int qcom_scm_restore_sec_cfg(u32 device_id, u32 spare) { return -ENODEV; }
 static inline int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size) { return -ENODEV; }
 static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare) { return -ENODEV; }
-- 
2.17.1

