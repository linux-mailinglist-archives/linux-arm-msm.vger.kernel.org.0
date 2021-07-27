Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C37E3D79B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 17:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236978AbhG0PZx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 11:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236905AbhG0PZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 11:25:45 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F487C0613D5
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 08:25:15 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id 190so12657915qkk.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 08:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8WOrNxoMZRaE3XcZqAlR+PM8cMsZjto7dFuOpUUbU8E=;
        b=iJrM9+IWurMTIUIVmIMribDjFzHvbbx8lNhN7/IHkIcAZdFUF0Bjwm5NtYKKwV89Gq
         aCWNDtTHuw6+EHdKi18+lz6ypSUDDRHYEuIE+tXMNVet7G0oLClf6L0UGomPq1UqMwKx
         Yxg/t0I0lFJAWMnxT/EYFO6NvlsbUXl/o6qn6yev/Sysx0E3UxaO6L3jyIMCMbCC6t/e
         cnMEod/hTeKiiyzcGs39xpSPpPayL+vql5Qh6C6byHih2FYsdemZ2vImE60OdOJLRjow
         teYVzp1cMbl+nPR8tQ0Gn2kS0KpbF2eSxjHzptUE6ZYz6uXun4gq0I2rPxJzTBj9Lhfz
         pa+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8WOrNxoMZRaE3XcZqAlR+PM8cMsZjto7dFuOpUUbU8E=;
        b=Y9t2LpkTzEK9yHXPseB6pvgqT6ktVJsfmOIhm/k+AQ+Alg6Fs/Ji60c+1gw/0mlIQs
         hXAM5BHgJ9ixndM4HO7nVytmpMtk+cD5k63G2hCS4bFyGtc/E8DYlHTMGWBML56XyChX
         hq6DItJrab5JQVohodiPj17ya1V8Tavaabbc34ZzddaQCJcxsRkxnh9r5pmvwGqgiyVs
         u3Xrr6JmGi/NbOcTZ5XJ0oB4RhyvPmbi1gkTgAT2uwHwqWiVJ6JZjF7HC8ALLVX/RyKJ
         uRLveel+aCwHHwJbrq78Yn4J0DzXX3diDU67j6HGYWjC7CVM4u/kahOdSH1QLf8zRRRS
         h8ZA==
X-Gm-Message-State: AOAM532+MmlYDuX3MymQXdR9SoZxDBgO8QiLPJTfGXIBhC1+6/bTDEv1
        iOA5M1k0GZV8bAFCYn7iwXuKcQ==
X-Google-Smtp-Source: ABdhPJxcHZBK9HQMdu6pYkouO5Ahbo4MgTDm777OOkbzKGq3CiGP9uv5s7A1ZoP4CWkngotpcL/uqg==
X-Received: by 2002:a37:6753:: with SMTP id b80mr22986817qkc.140.1627399514533;
        Tue, 27 Jul 2021 08:25:14 -0700 (PDT)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id q4sm1539663qtr.20.2021.07.27.08.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 08:25:14 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, rui.zhang@intel.com,
        daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
        rjw@rjwysocki.net, robh+dt@kernel.org
Cc:     steev@kali.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [Patch v4 1/6] firmware: qcom_scm: Introduce SCM calls to access LMh
Date:   Tue, 27 Jul 2021 11:25:07 -0400
Message-Id: <20210727152512.1098329-2-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210727152512.1098329-1-thara.gopinath@linaro.org>
References: <20210727152512.1098329-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce SCM calls to access/configure limits management hardware(LMH).

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

v2->v3:
	Added freeing of payload_buf after the scm call in qcom_scm_lmh_dcvsh as per
	Matthias review comments.

v1->v2:
	Changed the input parameters in qcom_scm_lmh_dcvsh from payload_buf and
	payload_size to payload_fn, payload_reg, payload_val as per Bjorn's review
	comments.

 drivers/firmware/qcom_scm.c | 58 +++++++++++++++++++++++++++++++++++++
 drivers/firmware/qcom_scm.h |  4 +++
 include/linux/qcom_scm.h    | 14 +++++++++
 3 files changed, 76 insertions(+)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 47ea2bd42b10..8a503753fe2a 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1147,6 +1147,64 @@ int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
 }
 EXPORT_SYMBOL(qcom_scm_qsmmu500_wait_safe_toggle);
 
+bool qcom_scm_lmh_dcvsh_available(void)
+{
+	return __qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_LMH, QCOM_SCM_LMH_LIMIT_DCVSH);
+}
+EXPORT_SYMBOL(qcom_scm_lmh_dcvsh_available);
+
+int qcom_scm_lmh_profile_change(u32 profile_id)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_LMH,
+		.cmd = QCOM_SCM_LMH_LIMIT_PROFILE_CHANGE,
+		.arginfo = QCOM_SCM_ARGS(1, QCOM_SCM_VAL),
+		.args[0] = profile_id,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	return qcom_scm_call(__scm->dev, &desc, NULL);
+}
+EXPORT_SYMBOL(qcom_scm_lmh_profile_change);
+
+int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
+		       u64 limit_node, u32 node_id, u64 version)
+{
+	dma_addr_t payload_phys;
+	u32 *payload_buf;
+	int ret, payload_size = 5 * sizeof(u32);
+
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_LMH,
+		.cmd = QCOM_SCM_LMH_LIMIT_DCVSH,
+		.arginfo = QCOM_SCM_ARGS(5, QCOM_SCM_RO, QCOM_SCM_VAL, QCOM_SCM_VAL,
+					QCOM_SCM_VAL, QCOM_SCM_VAL),
+		.args[1] = payload_size,
+		.args[2] = limit_node,
+		.args[3] = node_id,
+		.args[4] = version,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+
+	payload_buf = dma_alloc_coherent(__scm->dev, payload_size, &payload_phys, GFP_KERNEL);
+	if (!payload_buf)
+		return -ENOMEM;
+
+	payload_buf[0] = payload_fn;
+	payload_buf[1] = 0;
+	payload_buf[2] = payload_reg;
+	payload_buf[3] = 1;
+	payload_buf[4] = payload_val;
+
+	desc.args[0] = payload_phys;
+
+	ret = qcom_scm_call(__scm->dev, &desc, NULL);
+
+	dma_free_coherent(__scm->dev, payload_size, payload_buf, payload_phys);
+	return ret;
+}
+EXPORT_SYMBOL(qcom_scm_lmh_dcvsh);
+
 static int qcom_scm_find_dload_address(struct device *dev, u64 *addr)
 {
 	struct device_node *tcsr;
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 632fe3142462..d92156ceb3ac 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -114,6 +114,10 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 #define QCOM_SCM_SVC_HDCP		0x11
 #define QCOM_SCM_HDCP_INVOKE		0x01
 
+#define QCOM_SCM_SVC_LMH			0x13
+#define QCOM_SCM_LMH_LIMIT_PROFILE_CHANGE	0x01
+#define QCOM_SCM_LMH_LIMIT_DCVSH		0x10
+
 #define QCOM_SCM_SVC_SMMU_PROGRAM		0x15
 #define QCOM_SCM_SMMU_CONFIG_ERRATA1		0x03
 #define QCOM_SCM_SMMU_CONFIG_ERRATA1_CLIENT_ALL	0x02
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index 0165824c5128..c0475d1c9885 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -109,6 +109,12 @@ extern int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
 			     u32 *resp);
 
 extern int qcom_scm_qsmmu500_wait_safe_toggle(bool en);
+
+extern int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
+			      u64 limit_node, u32 node_id, u64 version);
+extern int qcom_scm_lmh_profile_change(u32 profile_id);
+extern bool qcom_scm_lmh_dcvsh_available(void);
+
 #else
 
 #include <linux/errno.h>
@@ -170,5 +176,13 @@ static inline int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
 
 static inline int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
 		{ return -ENODEV; }
+
+static inline int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
+				     u64 limit_node, u32 node_id, u64 version)
+		{ return -ENODEV; }
+
+static inline int qcom_scm_lmh_profile_change(u32 profile_id) { return -ENODEV; }
+
+static inline bool qcom_scm_lmh_dcvsh_available(void) { return -ENODEV; }
 #endif
 #endif
-- 
2.25.1

