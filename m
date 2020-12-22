Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91FA82E0A41
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 14:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgLVNFg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 08:05:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgLVNFg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 08:05:36 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3935C061793
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 05:04:55 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id o13so31811398lfr.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 05:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cYkvDM+JjtsHyuhPBxoKAqQnB1uujIDD73cQOpWHLB8=;
        b=GIr1606Hi8p7LResTLRhR/y/hVYL30TsuwUx4zViJsDcCCLqS8INs8GYBvn0EtchFX
         i26FLy+/6Y0OFffrdKTRgE4sxZb+Hjv4dVwPV5pvjA9d0GP1T0P/T9Unk8YF6qs/xsL4
         e7lCSOwmFKbwdWDDGd/XTh1jF/9EeKEIud2Pw3blSBx1FPrtCCgBIwX9JCpyMimuNhbV
         StCCarFE2kabxpDzLGrXc+c3vj6QDJESD8L5+eO3vbxegYlFylruV9JAg6lMeThG8djz
         eT2Yz+4e0AMM10ZIQWMMO9inJ3q/9+Gjd20XfjJIoheTGKgxzSEa5S7vIRKffxCUm8cz
         EdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cYkvDM+JjtsHyuhPBxoKAqQnB1uujIDD73cQOpWHLB8=;
        b=MQIoDtLjpWUmxbBHe/Ag5gkqRJH+r4WiVjglyozO0YOfDcZb2J37vyD58CPOc4LQ1i
         BlOLas6ZX4DVTRLhZJ2Frjkds2YEcdqX8IYExYndGoCGRhVgCxfNcqdG+5iez1b/F3vL
         Fd+HTGXyhSUFLDjkmsGKjWzZD30rH7jBF3f6OHfK0zkK5FbqWtxDi04MYKli6HVBPX2E
         1tbV1N8aOmrGNGPqnu+XQCxk1ZT4YtOATvUptGTNmlBF67se4+tUupPofGxAWhJojl1m
         UbdbEM4gYsmjZGHfMUVI4K5BiUFEJZWNJ2B18C1Qi4rpVhjfdDyZHOPfJhRPebiSuNJP
         Ra/g==
X-Gm-Message-State: AOAM5309iuD31qekoWdKkqLfk0KwFCt4iL6xbCgo9XjMEA3UNbYvVF8q
        3uKoKfCVQbBe9T+HdcUbmFpd2w==
X-Google-Smtp-Source: ABdhPJzoHTdN/YbnLWjRAYOtmVOKMLcsARiq5nH8JwsmrZQGMLdFom25IEA04ntvoEKQ4PmtaMWp0A==
X-Received: by 2002:a2e:a402:: with SMTP id p2mr9559714ljn.270.1608642294284;
        Tue, 22 Dec 2020 05:04:54 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.224])
        by smtp.gmail.com with ESMTPSA id k18sm2864235ljb.80.2020.12.22.05.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 05:04:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/3] soc: qcom: socinfo: add info from PMIC models array
Date:   Tue, 22 Dec 2020 16:04:48 +0300
Message-Id: <20201222130448.4125297-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201222130448.4125297-1-dmitry.baryshkov@linaro.org>
References: <20201222130448.4125297-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add debugfs file showing information from PMIC model array.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 42 +++++++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 7229c3c04083..d255034a2b6f 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -15,6 +15,8 @@
 #include <linux/sys_soc.h>
 #include <linux/types.h>
 
+#include <asm/unaligned.h>
+
 /*
  * SoC version type with major number in the upper 16 bits and minor
  * number in the lower 16 bits.
@@ -294,6 +296,32 @@ static int qcom_show_pmic_model(struct seq_file *seq, void *p)
 	return 0;
 }
 
+static int qcom_show_pmic_model_array(struct seq_file *seq, void *p)
+{
+	struct socinfo *socinfo = seq->private;
+	unsigned int num_pmics = le32_to_cpu(socinfo->num_pmics);
+	unsigned int pmic_array_offset = le32_to_cpu(socinfo->pmic_array_offset);
+	int i;
+	void *ptr = socinfo;
+
+	ptr += pmic_array_offset;
+
+	/* No need for bounds checking, it happened at socinfo_debugfs_init */
+	for (i = 0; i < num_pmics; i++) {
+		unsigned int model = SOCINFO_MINOR(get_unaligned_le32(ptr + 2 * i * sizeof(u32)));
+		unsigned int die_rev = get_unaligned_le32(ptr + (2 * i + 1) * sizeof(u32));
+
+		if (model <= ARRAY_SIZE(pmic_models) && pmic_models[model])
+			seq_printf(seq, "%s %u.%u\n", pmic_models[model],
+					SOCINFO_MAJOR(le32_to_cpu(die_rev)),
+					SOCINFO_MINOR(le32_to_cpu(die_rev)));
+		else
+			seq_printf(seq, "unknown (%d)\n", model);
+	}
+
+	return 0;
+}
+
 static int qcom_show_pmic_die_revision(struct seq_file *seq, void *p)
 {
 	struct socinfo *socinfo = seq->private;
@@ -316,6 +344,7 @@ static int qcom_show_chip_id(struct seq_file *seq, void *p)
 
 QCOM_OPEN(build_id, qcom_show_build_id);
 QCOM_OPEN(pmic_model, qcom_show_pmic_model);
+QCOM_OPEN(pmic_model_array, qcom_show_pmic_model_array);
 QCOM_OPEN(pmic_die_rev, qcom_show_pmic_die_revision);
 QCOM_OPEN(chip_id, qcom_show_chip_id);
 
@@ -344,12 +373,14 @@ DEFINE_IMAGE_OPS(variant);
 DEFINE_IMAGE_OPS(oem);
 
 static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
-				 struct socinfo *info)
+				 struct socinfo *info, size_t info_size)
 {
 	struct smem_image_version *versions;
 	struct dentry *dentry;
 	size_t size;
 	int i;
+	unsigned int num_pmics;
+	unsigned int pmic_array_offset;
 
 	qcom_socinfo->dbg_root = debugfs_create_dir("qcom_socinfo", NULL);
 
@@ -405,6 +436,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 				   &qcom_socinfo->info.raw_device_num);
 		fallthrough;
 	case SOCINFO_VERSION(0, 11):
+		num_pmics = le32_to_cpu(info->num_pmics);
+		pmic_array_offset = le32_to_cpu(info->pmic_array_offset);
+		if (pmic_array_offset + 2 * num_pmics * sizeof(u32) <= info_size)
+			DEBUGFS_ADD(info, pmic_model_array);
+		fallthrough;
 	case SOCINFO_VERSION(0, 10):
 	case SOCINFO_VERSION(0, 9):
 		qcom_socinfo->info.foundry_id = __le32_to_cpu(info->foundry_id);
@@ -482,7 +518,7 @@ static void socinfo_debugfs_exit(struct qcom_socinfo *qcom_socinfo)
 }
 #else
 static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
-				 struct socinfo *info)
+				 struct socinfo *info, size_t info_size)
 {
 }
 static void socinfo_debugfs_exit(struct qcom_socinfo *qcom_socinfo) {  }
@@ -522,7 +558,7 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
 	if (IS_ERR(qs->soc_dev))
 		return PTR_ERR(qs->soc_dev);
 
-	socinfo_debugfs_init(qs, info);
+	socinfo_debugfs_init(qs, info, item_size);
 
 	/* Feed the soc specific unique data into entropy pool */
 	add_device_randomness(info, item_size);
-- 
2.29.2

