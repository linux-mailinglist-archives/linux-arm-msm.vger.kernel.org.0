Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57A045F60D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 11:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbfGDJxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 05:53:31 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59194 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727551AbfGDJxa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 05:53:30 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CF9DC6118E; Thu,  4 Jul 2019 09:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562234008;
        bh=Dx/nOPbZkwpJ9AHATBiKD0jqD2Sgzm8Dt1KVZbF6eG4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lvHWqRBOhp6SEzkNcdt23bLzDH3HjX9S57WAYxHoqEnVW9UvRAHRYLQImXWnsmCJ/
         fzkpmJlLVDd8aAJ6TdQKs7CJljY6NvbL78/iQUDHVyt9D6TbApzXLSkbTNZpsQnkeA
         CmKf9o7jOwFs1D4AkxNHF0xq90W3ljrOT3PD1kUc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-311.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 251E360F3C;
        Thu,  4 Jul 2019 09:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562234007;
        bh=Dx/nOPbZkwpJ9AHATBiKD0jqD2Sgzm8Dt1KVZbF6eG4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cqOAQYncrTYsCYObK1Vj8Zl7HFj6XCUaBbBOhCwFveZmGHr/UWQtod2S8sDsw8hhg
         Bbn8Su2I/nQ81R9NLVLQ/XNexUlIgnXGOVPjHIHqJxs81wGEOmn2YcomYtsn3oxJ5C
         dE1BJ8L4CzK/t50Ma3GIIFccVPq2uM9fMjk9fyxc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 251E360F3C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [RESEND PATCHv5 2/2] coresight: Do not default to CPU0 for missing CPU phandle
Date:   Thu,  4 Jul 2019 15:23:05 +0530
Message-Id: <f1955ea19c714cf64ea54ec356a9aa85f3cd17b8.1562229018.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1562229018.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1562229018.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Coresight platform support assumes that a missing "cpu" phandle
defaults to CPU0. This could be problematic and unnecessarily binds
components to CPU0, where they may not be. In coresight etm and
cpu-debug drivers, abort the probe for such cases.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 .../hwtracing/coresight/coresight-cpu-debug.c |  3 +++
 drivers/hwtracing/coresight/coresight-etm3x.c |  3 +++
 drivers/hwtracing/coresight/coresight-etm4x.c |  3 +++
 .../hwtracing/coresight/coresight-platform.c  | 20 +++++++++----------
 4 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 07a1367c733f..58bfd6319f65 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -579,6 +579,9 @@ static int debug_probe(struct amba_device *adev, const struct amba_id *id)
 		return -ENOMEM;
 
 	drvdata->cpu = coresight_get_cpu(dev);
+	if (drvdata->cpu < 0)
+		return drvdata->cpu;
+
 	if (per_cpu(debug_drvdata, drvdata->cpu)) {
 		dev_err(dev, "CPU%d drvdata has already been initialized\n",
 			drvdata->cpu);
diff --git a/drivers/hwtracing/coresight/coresight-etm3x.c b/drivers/hwtracing/coresight/coresight-etm3x.c
index 225c2982e4fe..e2cb6873c3f2 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x.c
@@ -816,6 +816,9 @@ static int etm_probe(struct amba_device *adev, const struct amba_id *id)
 	}
 
 	drvdata->cpu = coresight_get_cpu(dev);
+	if (drvdata->cpu < 0)
+		return drvdata->cpu;
+
 	desc.name  = devm_kasprintf(dev, GFP_KERNEL, "etm%d", drvdata->cpu);
 	if (!desc.name)
 		return -ENOMEM;
diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
index 7fe266194ab5..7bcac8896fc1 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x.c
@@ -1101,6 +1101,9 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
 	spin_lock_init(&drvdata->spinlock);
 
 	drvdata->cpu = coresight_get_cpu(dev);
+	if (drvdata->cpu < 0)
+		return drvdata->cpu;
+
 	desc.name = devm_kasprintf(dev, GFP_KERNEL, "etm%d", drvdata->cpu);
 	if (!desc.name)
 		return -ENOMEM;
diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
index 3c5ceda8db24..cf580ffbc27c 100644
--- a/drivers/hwtracing/coresight/coresight-platform.c
+++ b/drivers/hwtracing/coresight/coresight-platform.c
@@ -159,16 +159,16 @@ static int of_coresight_get_cpu(struct device *dev)
 	struct device_node *dn;
 
 	if (!dev->of_node)
-		return 0;
+		return -ENODEV;
+
 	dn = of_parse_phandle(dev->of_node, "cpu", 0);
-	/* Affinity defaults to CPU0 */
 	if (!dn)
-		return 0;
+		return -ENODEV;
+
 	cpu = of_cpu_node_to_id(dn);
 	of_node_put(dn);
 
-	/* Affinity to CPU0 if no cpu nodes are found */
-	return (cpu < 0) ? 0 : cpu;
+	return cpu;
 }
 
 /*
@@ -310,7 +310,7 @@ of_get_coresight_platform_data(struct device *dev,
 
 static inline int of_coresight_get_cpu(struct device *dev)
 {
-	return 0;
+	return -ENODEV;
 }
 #endif
 
@@ -734,14 +734,14 @@ static int acpi_coresight_get_cpu(struct device *dev)
 	struct acpi_device *adev = ACPI_COMPANION(dev);
 
 	if (!adev)
-		return 0;
+		return -ENODEV;
 	status = acpi_get_parent(adev->handle, &cpu_handle);
 	if (ACPI_FAILURE(status))
-		return 0;
+		return -ENODEV;
 
 	cpu = acpi_handle_to_logical_cpuid(cpu_handle);
 	if (cpu >= nr_cpu_ids)
-		return 0;
+		return -ENODEV;
 	return cpu;
 }
 
@@ -769,7 +769,7 @@ acpi_get_coresight_platform_data(struct device *dev,
 
 static inline int acpi_coresight_get_cpu(struct device *dev)
 {
-	return 0;
+	return -ENODEV;
 }
 #endif
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

