Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5B82DBBE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Dec 2020 08:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgLPHUM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 02:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgLPHUL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 02:20:11 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35FFFC0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 23:19:29 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id c22so1566048pgg.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 23:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xzt16Xi0FHR8n70/x4G7HQRoohpjQkqkV6KKbVOY9gM=;
        b=EIU7gzne4KxL4fpAUFiuf7HWWZLhuWCwys2lakpMNCu8yUGCPLPPyWas/Jz2M/oUhx
         F2gRZxhXQr0bKgZGkejVV+JW0DHrOXGrMXuzr9AIcNM30FPr7ra9Gxhswxzl7mlbaTru
         75RJpZWn2sEdX9H+rsQ8EoQh9Wqg0rph48vj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xzt16Xi0FHR8n70/x4G7HQRoohpjQkqkV6KKbVOY9gM=;
        b=rYIq3cg4VlS6UKiFjbVaXBqPFKKZldRRRQU8AzGa+3hnJ7DctGUCk12cQQZaiNB6m7
         kJG5aGW52Y/4Mvaw5FydRjEBNL4USv0ZklVgnnvzM3LXKwL6QpfkZ/te4E/p/gxUR+Q1
         Fm8n8e4SfSzZa7XAGVQXNdoTTz8zfazjGMfYiHKX2P86q6lSmmpBZT6n2zPvcm7JfEgb
         qqdknn5fJhKn9EAsDW33bhyHl/ZF6B3QPh7YtjZ18AkfNu2AXZ2H7FsX6GDAS9Fk613F
         UKaGWtELgsirHJ0zOZY9OPX82buUiUnRKm/aHumHRdueT4nMSoquKziVFgDLRD2LCPr7
         aGkQ==
X-Gm-Message-State: AOAM531u9H0CgcqDOE8rxmWTNBsyKbW2ljm3/iUXynVdBhHTBsPODIvv
        EfUcconc2otjr5n7rlszacvs4sj6qAFxFA==
X-Google-Smtp-Source: ABdhPJzUS3IYQaKMA+7Nff6vG17WGeJqNNq88L1/ujAD2Vlx2OaosGEQo0Kpz2snyvKsC/mqFOj6qg==
X-Received: by 2002:a63:3d8:: with SMTP id 207mr26330776pgd.215.1608103168718;
        Tue, 15 Dec 2020 23:19:28 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id a26sm1288968pgd.64.2020.12.15.23.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 23:19:28 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] soc: qcom: socinfo: Open read access to all for debugfs
Date:   Tue, 15 Dec 2020 23:19:26 -0800
Message-Id: <20201216071926.3147108-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There doesn't seem to be any reason to limit this to only root user
readable. Let's make it readable by all so that random programs can
read the debugfs files in here instead of just root. The information is
just that, informational, so this is fine.

Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/soc/qcom/socinfo.c | 40 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index b44ede48decc..4e4946d9e4ab 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -258,7 +258,7 @@ static const struct file_operations qcom_ ##name## _ops = {		\
 }
 
 #define DEBUGFS_ADD(info, name)						\
-	debugfs_create_file(__stringify(name), 0400,			\
+	debugfs_create_file(__stringify(name), 0444,			\
 			    qcom_socinfo->dbg_root,			\
 			    info, &qcom_ ##name## _ops)
 
@@ -349,14 +349,14 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 
 	qcom_socinfo->info.fmt = __le32_to_cpu(info->fmt);
 
-	debugfs_create_x32("info_fmt", 0400, qcom_socinfo->dbg_root,
+	debugfs_create_x32("info_fmt", 0444, qcom_socinfo->dbg_root,
 			   &qcom_socinfo->info.fmt);
 
 	switch (qcom_socinfo->info.fmt) {
 	case SOCINFO_VERSION(0, 15):
 		qcom_socinfo->info.nmodem_supported = __le32_to_cpu(info->nmodem_supported);
 
-		debugfs_create_u32("nmodem_supported", 0400, qcom_socinfo->dbg_root,
+		debugfs_create_u32("nmodem_supported", 0444, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.nmodem_supported);
 		fallthrough;
 	case SOCINFO_VERSION(0, 14):
@@ -365,19 +365,19 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		qcom_socinfo->info.num_defective_parts = __le32_to_cpu(info->num_defective_parts);
 		qcom_socinfo->info.ndefective_parts_array_offset = __le32_to_cpu(info->ndefective_parts_array_offset);
 
-		debugfs_create_u32("num_clusters", 0400, qcom_socinfo->dbg_root,
+		debugfs_create_u32("num_clusters", 0444, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.num_clusters);
-		debugfs_create_u32("ncluster_array_offset", 0400, qcom_socinfo->dbg_root,
+		debugfs_create_u32("ncluster_array_offset", 0444, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.ncluster_array_offset);
-		debugfs_create_u32("num_defective_parts", 0400, qcom_socinfo->dbg_root,
+		debugfs_create_u32("num_defective_parts", 0444, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.num_defective_parts);
-		debugfs_create_u32("ndefective_parts_array_offset", 0400, qcom_socinfo->dbg_root,
+		debugfs_create_u32("ndefective_parts_array_offset", 0444, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.ndefective_parts_array_offset);
 		fallthrough;
 	case SOCINFO_VERSION(0, 13):
 		qcom_socinfo->info.nproduct_id = __le32_to_cpu(info->nproduct_id);
 
-		debugfs_create_u32("nproduct_id", 0400, qcom_socinfo->dbg_root,
+		debugfs_create_u32("nproduct_id", 0444, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.nproduct_id);
 		DEBUGFS_ADD(info, chip_id);
 		fallthrough;
@@ -389,12 +389,12 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		qcom_socinfo->info.raw_device_num =
 			__le32_to_cpu(info->raw_device_num);
 
-		debugfs_create_x32("chip_family", 0400, qcom_socinfo->dbg_root,
+		debugfs_create_x32("chip_family", 0444, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.chip_family);
-		debugfs_create_x32("raw_device_family", 0400,
+		debugfs_create_x32("raw_device_family", 0444,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.raw_device_family);
-		debugfs_create_x32("raw_device_number", 0400,
+		debugfs_create_x32("raw_device_number", 0444,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.raw_device_num);
 		fallthrough;
@@ -403,7 +403,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 	case SOCINFO_VERSION(0, 9):
 		qcom_socinfo->info.foundry_id = __le32_to_cpu(info->foundry_id);
 
-		debugfs_create_u32("foundry_id", 0400, qcom_socinfo->dbg_root,
+		debugfs_create_u32("foundry_id", 0444, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.foundry_id);
 		fallthrough;
 	case SOCINFO_VERSION(0, 8):
@@ -415,7 +415,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		qcom_socinfo->info.hw_plat_subtype =
 			__le32_to_cpu(info->hw_plat_subtype);
 
-		debugfs_create_u32("hardware_platform_subtype", 0400,
+		debugfs_create_u32("hardware_platform_subtype", 0444,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.hw_plat_subtype);
 		fallthrough;
@@ -423,28 +423,28 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 		qcom_socinfo->info.accessory_chip =
 			__le32_to_cpu(info->accessory_chip);
 
-		debugfs_create_u32("accessory_chip", 0400,
+		debugfs_create_u32("accessory_chip", 0444,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.accessory_chip);
 		fallthrough;
 	case SOCINFO_VERSION(0, 4):
 		qcom_socinfo->info.plat_ver = __le32_to_cpu(info->plat_ver);
 
-		debugfs_create_u32("platform_version", 0400,
+		debugfs_create_u32("platform_version", 0444,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.plat_ver);
 		fallthrough;
 	case SOCINFO_VERSION(0, 3):
 		qcom_socinfo->info.hw_plat = __le32_to_cpu(info->hw_plat);
 
-		debugfs_create_u32("hardware_platform", 0400,
+		debugfs_create_u32("hardware_platform", 0444,
 				   qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.hw_plat);
 		fallthrough;
 	case SOCINFO_VERSION(0, 2):
 		qcom_socinfo->info.raw_ver  = __le32_to_cpu(info->raw_ver);
 
-		debugfs_create_u32("raw_version", 0400, qcom_socinfo->dbg_root,
+		debugfs_create_u32("raw_version", 0444, qcom_socinfo->dbg_root,
 				   &qcom_socinfo->info.raw_ver);
 		fallthrough;
 	case SOCINFO_VERSION(0, 1):
@@ -461,11 +461,11 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
 
 		dentry = debugfs_create_dir(socinfo_image_names[i],
 					    qcom_socinfo->dbg_root);
-		debugfs_create_file("name", 0400, dentry, &versions[i],
+		debugfs_create_file("name", 0444, dentry, &versions[i],
 				    &qcom_image_name_ops);
-		debugfs_create_file("variant", 0400, dentry, &versions[i],
+		debugfs_create_file("variant", 0444, dentry, &versions[i],
 				    &qcom_image_variant_ops);
-		debugfs_create_file("oem", 0400, dentry, &versions[i],
+		debugfs_create_file("oem", 0444, dentry, &versions[i],
 				    &qcom_image_oem_ops);
 	}
 }

base-commit: 2c85ebc57b3e1817b6ce1a6b703928e113a90442
-- 
https://chromeos.dev

