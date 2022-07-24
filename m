Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0EBE57F4EC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 14:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbiGXMYn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 08:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbiGXMYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 08:24:39 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09F913FB4
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 05:24:38 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id 23so8019934pgc.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 05:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=knYZVAmP/Bzeklaj6dd4onpv7s/0aWzK0OLPNMow6Oo=;
        b=Gu/HsqrR9MvT05KxBVxXKeCcEKFqxofoWaMoiatvoYkYAxidxsH0gNet+xxosibt+h
         UjNlWW8o3T7RTrwGRonynQUAGAlc6PmUdLXVsQBM3bP7iMs4l4AkHNrNltMvYOOYMp3A
         fZJrgpfEbyuVWyFYhBfEw0tEPPcD+bxIIi9FrkePcBprt1DhHzi2Q8NUERUZI2R52BY/
         xN3/OV573jce/dQMTvpix3z/e9CCO1vcFqCPquF4aAgA1xGDfEUvm+5i4mfjoQSLyfR4
         Qr6sXwo9DJvdb1vKCqlg05HxNcleMrdIySZTns+CzXq2sN5W922dO1HHoRmkbTQ5TE0/
         f2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=knYZVAmP/Bzeklaj6dd4onpv7s/0aWzK0OLPNMow6Oo=;
        b=QFHRTxxRGQaLLdEBDcg1zsNT2yL7ZSV3rLdXOjB8aKHb8CWg9MKFRmbjt65M8kgIUx
         eingSIsS/zB5BlEM9FawtLKRRffcpMdMDIigLqoHzch7QQiOG46ntmL1sqblQWffHJy3
         0DydaoNGnyyaYSh7jF2jZ5iklTfgMc5es9WlX9sFJ4vzeiHTnvaQqtqrtivWycRyhD2a
         W6pmIyoE7JIXSgXZKeS6yeRMWmCW2WAHNV2hkbpttS07J2Mc9tYpMv9uaxuySTyfY8oC
         mgTKWejesoEF50jeSOQ/yk1BP+Cbq4N/1+ddK+NF7Snc1m2fl3lELVNlrb7hscRp2zw+
         SaEQ==
X-Gm-Message-State: AJIora+PkWSkxu5qp50yunz1SCLOG54aVYHprx6TTjn9D7vyE5gNyBFW
        n+u3lNFgKrQU7mHQOhFx8OLWmQGJHnVIlw==
X-Google-Smtp-Source: AGRyM1sVMDpgLT6PsBP5HWNqYDJYwXEDCznpcdZ6v7L2qW3t8MvY+9T7wKFcgyxeP+CWu5xfXPA9jg==
X-Received: by 2002:a63:b1d:0:b0:41a:20e7:6811 with SMTP id 29-20020a630b1d000000b0041a20e76811mr7172464pgl.75.1658665478186;
        Sun, 24 Jul 2022 05:24:38 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3a:5a45:a9cd:d7dd:fd01:73c0])
        by smtp.gmail.com with ESMTPSA id p23-20020a1709027ed700b0016c0474fbd0sm7048133plb.34.2022.07.24.05.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 05:24:37 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-pm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, robh+dt@kernel.org, rafael@kernel.org,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
Subject: [PATCH v2 1/5] firmware: qcom: scm: Add support for tsens reinit workaround
Date:   Sun, 24 Jul 2022 17:54:20 +0530
Message-Id: <20220724122424.2509021-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220724122424.2509021-1-bhupesh.sharma@linaro.org>
References: <20220724122424.2509021-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some versions of Qualcomm tsens controller might enter a
'bad state' while running stability tests causing sensor
temperatures/interrupts status to be in an 'invalid' state.

It is recommended to re-initialize the tsens controller
via trustzone (secure registers) using scm call(s) when that
happens.

Add support for the same in the qcom_scm driver.

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Amit Kucheria <amitk@kernel.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/firmware/qcom_scm.c | 15 +++++++++++++++
 drivers/firmware/qcom_scm.h |  4 ++++
 include/linux/qcom_scm.h    |  2 ++
 3 files changed, 21 insertions(+)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index cdbfe54c8146..93adcc046a62 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -858,6 +858,21 @@ int qcom_scm_mem_protect_video_var(u32 cp_start, u32 cp_size,
 }
 EXPORT_SYMBOL(qcom_scm_mem_protect_video_var);
 
+int qcom_scm_tsens_reinit(void)
+{
+	int ret;
+	const struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_TSENS,
+		.cmd = QCOM_SCM_TSENS_INIT_ID,
+	};
+	struct qcom_scm_res res;
+
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+
+	return ret ? : res.result[0];
+}
+EXPORT_SYMBOL(qcom_scm_tsens_reinit);
+
 static int __qcom_scm_assign_mem(struct device *dev, phys_addr_t mem_region,
 				 size_t mem_sz, phys_addr_t src, size_t src_sz,
 				 phys_addr_t dest, size_t dest_sz)
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 0d51eef2472f..495fa00230c7 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -94,6 +94,10 @@ extern int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
 
+/* TSENS Services and Function IDs */
+#define QCOM_SCM_SVC_TSENS		0x1E
+#define QCOM_SCM_TSENS_INIT_ID		0x5
+
 #define QCOM_SCM_SVC_IO			0x05
 #define QCOM_SCM_IO_READ		0x01
 #define QCOM_SCM_IO_WRITE		0x02
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index f8335644a01a..5c37e1658cef 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -124,4 +124,6 @@ extern int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 extern int qcom_scm_lmh_profile_change(u32 profile_id);
 extern bool qcom_scm_lmh_dcvsh_available(void);
 
+extern int qcom_scm_tsens_reinit(void);
+
 #endif
-- 
2.35.3

