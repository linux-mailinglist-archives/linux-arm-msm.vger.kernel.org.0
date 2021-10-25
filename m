Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9C3438D96
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 04:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232093AbhJYC7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Oct 2021 22:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231610AbhJYC7A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Oct 2021 22:59:00 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A615FC061764
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 19:56:38 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id v2-20020a05683018c200b0054e3acddd91so10419111ote.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 19:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sD/r59PKJF8BA6V0tj6cDBdaq9ZIh5LOathYW2KppA8=;
        b=A/JasjeKBzNxZNNHFgcl18/fIkccWIa2NDiR0W2jjIYkIGVurgfvGFBqVfRnD0x4f8
         N8OxFwjfAwwpWA7K+yWSK3yRvYrjLH1SgcqkCn6R7KYtvCRF15VSCSVGEkmqaldEDFNg
         snLI9unHZ1KKzCZAiZgQaCKas6GCePA/7+JtTgGjpDt8Z1C36T/fZj4bKeBqsGtZVs0t
         tSSe+wrN047eVNot5AbQyDVizPPydU1G83hXvXWBDziBeSJrjXcIugtTPQdf3YoC8WzM
         Z8UKAgAgP8ooNRfHy64MvyGqFfejoyCmpETnzjqz3u4AZl5vWH9CrtfsLt0Ey0ZC+Lsd
         OoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sD/r59PKJF8BA6V0tj6cDBdaq9ZIh5LOathYW2KppA8=;
        b=0A3IkR7+CCZxYa7E+i7PbI0kPT9EyyaAOs8o22j8gf/msnYvZGU8RrTSqWZyglKPSG
         DC/2I9+wkvYyfHtcheETC1BhM9fUvD3pq9e/dBd7/atY1WvycnnvLUDD30cWfZH2UP/w
         Awd6V7q6Y86LrETm29KfXFG0iKqCuHMD3f6UKSPd/MebRrKkQE2lRBOAb4rjPBc5I+Lu
         ON8mZ9rtGY3cSgIlg0PsCgelsJL6fjyTsnyIODp3l+tLTW5X59pDkPCbmLdCK7ffxIu0
         nxH2IKf/SAfbgtwuzqfJF5NpvYl+4OrQZOv4dDxHxbaI6uHB2TXvqbBrbirvhepivNMO
         T6kA==
X-Gm-Message-State: AOAM530Sg9njaYD33g3oifktsvjoAUtAzDdsS3fOHvGCumVk9QlWxdNy
        i54pPNnKE+dGI0J1WiQX666ANg==
X-Google-Smtp-Source: ABdhPJxFRWJQzu9LsuslBzTtB4Euxx7R8wF91MFMlLoABj4DaO1JG8LUAQsCiq3CU0CDOuIs3ywQrA==
X-Received: by 2002:a9d:2ac2:: with SMTP id e60mr11359954otb.92.1635130598016;
        Sun, 24 Oct 2021 19:56:38 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id w2sm2794853ooa.26.2021.10.24.19.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 19:56:37 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: qcom: scm: Don't break compile test on non-ARM platforms
Date:   Sun, 24 Oct 2021 19:58:16 -0700
Message-Id: <20211025025816.2937465-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The introduction of __qcom_scm_set_boot_addr_mc() relies on
cpu_logical_map() and MPIDR_AFFINITY_LEVEL() from smp_plat.h, but only
ARM and ARM64 has this include file, so the introduction of this
dependency broke compile testing on e.g. x86_64.

Make the inclusion of smp_plat.h and the affected function depend on
ARM || ARM64 to allow the code to still be compiled.

Fixes: 55845f46df03 ("firmware: qcom: scm: Add support for MC boot address API")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/firmware/qcom_scm.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 7dd9e5e10f23..11464f6502be 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -17,7 +17,9 @@
 #include <linux/reset-controller.h>
 #include <linux/arm-smccc.h>
 
+#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
 #include <asm/smp_plat.h>
+#endif
 
 #include "qcom_scm.h"
 
@@ -262,6 +264,7 @@ static bool __qcom_scm_is_call_available(struct device *dev, u32 svc_id,
 	return ret ? false : !!res.result[0];
 }
 
+#if defined(CONFIG_ARM) || defined(CONFIG_ARM64)
 static int __qcom_scm_set_boot_addr_mc(void *entry, const cpumask_t *cpus,
 				       unsigned int flags)
 {
@@ -290,6 +293,13 @@ static int __qcom_scm_set_boot_addr_mc(void *entry, const cpumask_t *cpus,
 
 	return qcom_scm_call(__scm->dev, &desc, NULL);
 }
+#else
+static inline int __qcom_scm_set_boot_addr_mc(void *entry, const cpumask_t *cpus,
+					      unsigned int flags)
+{
+	return -EINVAL;
+}
+#endif
 
 static int __qcom_scm_set_warm_boot_addr(void *entry, const cpumask_t *cpus)
 {
-- 
2.29.2

