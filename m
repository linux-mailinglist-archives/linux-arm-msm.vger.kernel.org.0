Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C0F357128
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2019 21:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726418AbfFZTAD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jun 2019 15:00:03 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59336 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfFZTAD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jun 2019 15:00:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DD20A60F3A; Wed, 26 Jun 2019 19:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561575601;
        bh=JmaYluC2jIHHTyrJ5x9JzHAPgd+URwYgydmYYxHfVsE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NEOZqMlkmKhoM+YkxKw8OTHvUT+rsLFUnEW849ftn1c14cxikgQ1e9vQYVlf1LnEL
         2X4ZQmzYkGW0tfBJ1o42f1FhbBxK/moCXxBx2UWRnvQvJcqqFQKi+5rD3XgA8O7Syb
         0LpYDEQTcVQIexEEUAI63h3+IfWmWk7vHJuf7750=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2AA2760AA8;
        Wed, 26 Jun 2019 18:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561575601;
        bh=JmaYluC2jIHHTyrJ5x9JzHAPgd+URwYgydmYYxHfVsE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NEOZqMlkmKhoM+YkxKw8OTHvUT+rsLFUnEW849ftn1c14cxikgQ1e9vQYVlf1LnEL
         2X4ZQmzYkGW0tfBJ1o42f1FhbBxK/moCXxBx2UWRnvQvJcqqFQKi+5rD3XgA8O7Syb
         0LpYDEQTcVQIexEEUAI63h3+IfWmWk7vHJuf7750=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2AA2760AA8
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv4 1/1] coresight: Do not default to CPU0 for missing CPU phandle
Date:   Thu, 27 Jun 2019 00:29:30 +0530
Message-Id: <ff521c4556aca533eb3c730ab911bad9277d8203.1561575087.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1561575087.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1561575087.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Coresight platform support assumes that a missing "cpu" phandle
defaults to CPU0. This could be problematic and unnecessarily binds
components to CPU0, where they may not be. Let us make the DT binding
rules a bit stricter by not defaulting to CPU0 for missing "cpu"
affinity information.

Also in coresight etm and cpu-debug drivers, abort the probe
for such cases.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 .../bindings/arm/coresight-cpu-debug.txt      |  4 ++--
 .../devicetree/bindings/arm/coresight.txt     |  8 +++++---
 .../hwtracing/coresight/coresight-cpu-debug.c |  3 +++
 drivers/hwtracing/coresight/coresight-etm3x.c |  3 +++
 drivers/hwtracing/coresight/coresight-etm4x.c |  3 +++
 .../hwtracing/coresight/coresight-platform.c  | 20 +++++++++----------
 6 files changed, 26 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt b/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
index 298291211ea4..f1de3247c1b7 100644
--- a/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
+++ b/Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
@@ -26,8 +26,8 @@ Required properties:
 		processor core is clocked by the internal CPU clock, so it
 		is enabled with CPU clock by default.
 
-- cpu : the CPU phandle the debug module is affined to. When omitted
-	the module is considered to belong to CPU0.
+- cpu : the CPU phandle the debug module is affined to. Do not assume it
+        to default to CPU0 if omitted.
 
 Optional properties:
 
diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
index 8a88ddebc1a2..fcc3bacfd8bc 100644
--- a/Documentation/devicetree/bindings/arm/coresight.txt
+++ b/Documentation/devicetree/bindings/arm/coresight.txt
@@ -59,6 +59,11 @@ its hardware characteristcs.
 
 	* port or ports: see "Graph bindings for Coresight" below.
 
+* Additional required property for Embedded Trace Macrocell (version 3.x and
+  version 4.x):
+	* cpu: the cpu phandle this ETM/PTM is affined to. Do not
+	  assume it to default to CPU0 if omitted.
+
 * Additional required properties for System Trace Macrocells (STM):
 	* reg: along with the physical base address and length of the register
 	  set as described above, another entry is required to describe the
@@ -87,9 +92,6 @@ its hardware characteristcs.
 	* arm,cp14: must be present if the system accesses ETM/PTM management
 	  registers via co-processor 14.
 
-	* cpu: the cpu phandle this ETM/PTM is affined to. When omitted the
-	  source is considered to belong to CPU0.
-
 * Optional property for TMC:
 
 	* arm,buffer-size: size of contiguous buffer space for TMC ETR
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

