Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C59F01E12FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 18:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389160AbgEYQsV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 12:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389087AbgEYQsV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 12:48:21 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03CCFC061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:48:21 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a25so9770967ljp.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qFuxiaLQtj25y9sBPvZbzcmOPRrE2+OoU7mnXmLdh80=;
        b=AAkQHu34gVqwD+D2io1X/xsVdIEw5/KTRUNCC/awsiMQ7KbAutU7D0Y6s7rtgmWObv
         Zi//1vNOknwT67jcp752ncHZHZmVuzUv8CaK3P1lHjNrxZUqfhhQv2YiCzPT4+PMXxHt
         fEE+b0SIKZS66MDiQCMKoJehuSg/kotgyd/+oUhBS0Sqq5dblAiVlGJ67aejHulH7PKD
         4ZpllbZtsuxUOjvq8z+ubrFYZEUa+Zyq3cmG6ReT1nMbqxDsQujN1wfqUO2VUCsO4r3I
         GOlwv7hIA3RVr2E1QGWDGfZ5wVhl1zebLP6Yoqe8sN75tXTR0z69yj4SgO0/ZTbylcM3
         khhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qFuxiaLQtj25y9sBPvZbzcmOPRrE2+OoU7mnXmLdh80=;
        b=V6qITQ2wFceUTAYk2LzgM7sYIZhdTjhrD6gSztPojBs2tYHmDKB8Z6Q77x401ACA2X
         +lkkJaA+z2y9mpqELM++ZuYuivAvIW3r9j5tqHGc/OMhl6+kSDQE9I80rjp+ZYlFGHyN
         XxcIxrYoOzpX62OkOXbLWyckVQLJYoljP9eY79lZaLxlBQLE/pwl8w5ia3FuErEtssbl
         jYPRJU4kUIpiVzUXigWVEyH7ithRb5rdBjixXljakB25ISxfY6+7ff7bDPyNI2YkQpiF
         1j+tH3/Ieiglo5Xa8D3fjdv/E2q/T8k9oqsxaLViKKXS7UP2swO6ORCOR4kfr8betyAm
         msEg==
X-Gm-Message-State: AOAM531ngb3crPAMo6XFFzyV9Eni0eemMCPWu+MUHk6t2xO3Z66dYcQt
        pMfc+n4vyLnfCstBeZ8oZs9FqpA7J68=
X-Google-Smtp-Source: ABdhPJyeiI7t9sxbcbWgBBAvyIrby0YcjkJfjSkpCvcX492Za8Xf13NcKAnKE4AknK9Swn5an8h1MA==
X-Received: by 2002:a2e:8018:: with SMTP id j24mr13760743ljg.99.1590425299065;
        Mon, 25 May 2020 09:48:19 -0700 (PDT)
Received: from lothlann.lan ([188.162.64.24])
        by smtp.gmail.com with ESMTPSA id y21sm2914337ljg.48.2020.05.25.09.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 09:48:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: [PATCH 1/4] soc: qcom: socinfo: add support for newer socinfo data
Date:   Mon, 25 May 2020 19:48:14 +0300
Message-Id: <20200525164817.2938638-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for newer Qualcomm SoC info structures (up to version 0.15).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/socinfo.c | 55 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index ebb49aee179b..0e6adf1161c0 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -24,6 +24,7 @@
 #define SOCINFO_VERSION(maj, min)  ((((maj) & 0xffff) << 16)|((min) & 0xffff))
 
 #define SMEM_SOCINFO_BUILD_ID_LENGTH           32
+#define SMEM_SOCINFO_CHIP_ID_LENGTH            32
 
 /*
  * SMEM item id, used to acquire handles to respective
@@ -121,6 +122,16 @@ struct socinfo {
 	__le32 chip_family;
 	__le32 raw_device_family;
 	__le32 raw_device_num;
+	/* Version 13 */
+	__le32 nproduct_id;
+	char chip_id[SMEM_SOCINFO_CHIP_ID_LENGTH];
+	/* Version 14 */
+	__le32 num_clusters;
+	__le32 ncluster_array_offset;
+	__le32 num_defective_parts;
+	__le32 ndefective_parts_array_offset;
+	/* Version 15 */
+	__le32 nmodem_supported;
 };
 
 #ifdef CONFIG_DEBUG_FS
@@ -135,6 +146,12 @@ struct socinfo_params {
 	u32 raw_ver;
 	u32 hw_plat;
 	u32 fmt;
+	u32 nproduct_id;
+	u32 num_clusters;
+	u32 ncluster_array_offset;
+	u32 num_defective_parts;
+	u32 ndefective_parts_array_offset;
+	u32 nmodem_supported;
 };
 
 struct smem_image_version {
@@ -268,9 +285,19 @@ static int qcom_show_pmic_die_revision(struct seq_file *seq, void *p)
 	return 0;
 }
 
+static int qcom_show_chip_id(struct seq_file *seq, void *p)
+{
+	struct socinfo *socinfo = seq->private;
+
+	seq_printf(seq, "%s\n", socinfo->chip_id);
+
+	return 0;
+}
+
 QCOM_OPEN(build_id, qcom_show_build_id);
 QCOM_OPEN(pmic_model, qcom_show_pmic_model);
 QCOM_OPEN(pmic_die_rev, qcom_show_pmic_die_revision);
+QCOM_OPEN(chip_id, qcom_show_chip_id);
 
 #define DEFINE_IMAGE_OPS(type)					\
 static int show_image_##type(struct seq_file *seq, void *p)		  \
@@ -309,6 +336,34 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 	qcom_socinfo->info.fmt = __le32_to_cpu(info->fmt);
 
 	switch (qcom_socinfo->info.fmt) {
+	case SOCINFO_VERSION(0, 15):
+		qcom_socinfo->info.nmodem_supported = __le32_to_cpu(info->nmodem_supported);
+
+		debugfs_create_u32("nmodem_supported", 0400, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.nmodem_supported);
+		/* Fall through */
+	case SOCINFO_VERSION(0, 14):
+		qcom_socinfo->info.num_clusters = __le32_to_cpu(info->num_clusters);
+		qcom_socinfo->info.ncluster_array_offset = __le32_to_cpu(info->ncluster_array_offset);
+		qcom_socinfo->info.num_defective_parts = __le32_to_cpu(info->num_defective_parts);
+		qcom_socinfo->info.ndefective_parts_array_offset = __le32_to_cpu(info->ndefective_parts_array_offset);
+
+		debugfs_create_u32("num_clusters", 0400, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.num_clusters);
+		debugfs_create_u32("ncluster_array_offset", 0400, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.ncluster_array_offset);
+		debugfs_create_u32("num_defective_parts", 0400, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.num_defective_parts);
+		debugfs_create_u32("ndefective_parts_array_offset", 0400, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.ndefective_parts_array_offset);
+		/* Fall through */
+	case SOCINFO_VERSION(0, 13):
+		qcom_socinfo->info.nproduct_id = __le32_to_cpu(info->nproduct_id);
+
+		debugfs_create_u32("nproduct_id", 0400, qcom_socinfo->dbg_root,
+				   &qcom_socinfo->info.nproduct_id);
+		DEBUGFS_ADD(info, chip_id);
+		/* Fall through */
 	case SOCINFO_VERSION(0, 12):
 		qcom_socinfo->info.chip_family =
 			__le32_to_cpu(info->chip_family);
-- 
2.26.2

