Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02C2219F70
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 13:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727831AbgGIL7C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 07:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgGIL7B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 07:59:01 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53573C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 04:59:01 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id w3so1504848wmi.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=60WfY+m9rAT3c40Anjh0dgZrb+4tb57pCpohXHwky7M=;
        b=zDb2DpIwU3L53HsRgS/+PlDUuvCyut3NQ0S0RlY9MO5td14XWI1SaXbeH+esMYCy6s
         gUQLS9rpt2yFJPaeIegIjMQpzHhlpb/XxMEwpwT7NuIEzRhkk3ysklzzGlrYG5F2RG0j
         WK+T7uIhP8tEX4GB0Bm11CLRNR/u2RNJH3GFsdLrP3/s7kKnwEUMYBMMcME6MRhL6HL6
         Y1DJ1WkGFUbkKS1c/P5nredeIfPvacuDQdSsq63syyPbX7TptFrcrP3+XPyPiDscPu9b
         ygc6yeCh6idE/5y+yU87lpNfEhazSM1ssMNsSIYCItfHzbp7hZjxQf4vNXTLdo/1iOiU
         /UlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=60WfY+m9rAT3c40Anjh0dgZrb+4tb57pCpohXHwky7M=;
        b=dUcTXZYFYU+0hHBzUf7bwmWi5aTuUcg08jydn3pSDPFsdZYnGmM50YRZV+S/i3Tphe
         3N9LFFKoe/POESPV2rLk/oUnwH+qVDVzrcB90N1zSpImqnqiLVbLQLrFXZ9VXjWJaYlR
         sy71kXMjdUgsNhg2YmYlFrDfOeQQwsE/Y6AYxgUhvJ1dVFJdyOg++PHd9hUPAc+ALrHa
         Sm9EznTeqStX5DjNddek1v1bak90jfmNS5tOdaJdrHAiA3RTfGSMTQ+tm1cj6OWClaUx
         DTHwQngVTXsFnoxGJM6kYnPBjRheeKZp7G0YKGDo/H3OxUTqnARAx2Oz3OUJmRCio1Hs
         gRBA==
X-Gm-Message-State: AOAM530izTt+gNUTRju7kyh7J+U0kAhn46l6/2qzLhaSDDr565ew67RX
        lkQNVcZKG1cb3eMEVjZ/K9I0mMt+5s/33Q==
X-Google-Smtp-Source: ABdhPJyzYeDIv9/PuYMDhLwugLRuG7CeYqHSYkqVlbtq7TwVD/kt5RVit16Iai60khSTCyyzgUw0FA==
X-Received: by 2002:a1c:bb03:: with SMTP id l3mr13183337wmf.24.1594295939797;
        Thu, 09 Jul 2020 04:58:59 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-112.ip.btc-net.bg. [212.5.158.112])
        by smtp.gmail.com with ESMTPSA id v7sm5140737wrp.45.2020.07.09.04.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 04:58:59 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/2] firmware: qcom_scm: Add memory protect virtual address ranges
Date:   Thu,  9 Jul 2020 14:58:28 +0300
Message-Id: <20200709115829.8194-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709115829.8194-1-stanimir.varbanov@linaro.org>
References: <20200709115829.8194-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds a new SCM memprotect command to set virtual address ranges.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/firmware/qcom_scm.c | 24 ++++++++++++++++++++++++
 drivers/firmware/qcom_scm.h |  1 +
 include/linux/qcom_scm.h    |  8 +++++++-
 3 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 0e7233a20f34..a73870255c2e 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -864,6 +864,30 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 }
 EXPORT_SYMBOL(qcom_scm_assign_mem);
 
+int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
+				   u32 cp_nonpixel_start,
+				   u32 cp_nonpixel_size)
+{
+	int ret;
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_MP,
+		.cmd = QCOM_SCM_MP_VIDEO_VAR,
+		.arginfo = QCOM_SCM_ARGS(4, QCOM_SCM_VAL, QCOM_SCM_VAL,
+					 QCOM_SCM_VAL, QCOM_SCM_VAL),
+		.args[0] = cp_start,
+		.args[1] = cp_size,
+		.args[2] = cp_nonpixel_start,
+		.args[3] = cp_nonpixel_size,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	struct qcom_scm_res res;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+
+	return ret ? : res.result[0];
+}
+EXPORT_SYMBOL(qcom_scm_mem_protect_video_var);
+
 /**
  * qcom_scm_ocmem_lock_available() - is OCMEM lock/unlock interface available
  */
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index d9ed670da222..14da834ac593 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -97,6 +97,7 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 #define QCOM_SCM_MP_RESTORE_SEC_CFG		0x02
 #define QCOM_SCM_MP_IOMMU_SECURE_PTBL_SIZE	0x03
 #define QCOM_SCM_MP_IOMMU_SECURE_PTBL_INIT	0x04
+#define QCOM_SCM_MP_VIDEO_VAR			0x08
 #define QCOM_SCM_MP_ASSIGN			0x16
 
 #define QCOM_SCM_SVC_OCMEM		0x0f
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index 3d6a24697761..19b5188d17f4 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -81,7 +81,9 @@ extern int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 			       unsigned int *src,
 			       const struct qcom_scm_vmperm *newvm,
 			       unsigned int dest_cnt);
-
+extern int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
+					  u32 cp_nonpixel_start,
+					  u32 cp_nonpixel_size);
 extern bool qcom_scm_ocmem_lock_available(void);
 extern int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
 			       u32 size, u32 mode);
@@ -131,6 +133,10 @@ static inline int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
 static inline int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 		unsigned int *src, const struct qcom_scm_vmperm *newvm,
 		unsigned int dest_cnt) { return -ENODEV; }
+extern inline int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
+						 u32 cp_nonpixel_start,
+						 u32 cp_nonpixel_size)
+		{ return -ENODEV; }
 
 static inline bool qcom_scm_ocmem_lock_available(void) { return false; }
 static inline int qcom_scm_ocmem_lock(enum qcom_scm_ocmem_client id, u32 offset,
-- 
2.17.1

