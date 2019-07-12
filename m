Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 544A767132
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2019 16:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727495AbfGLORb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jul 2019 10:17:31 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34732 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbfGLORa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jul 2019 10:17:30 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7180F618DC; Fri, 12 Jul 2019 14:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562941049;
        bh=j34YjdOI22zXeGZb1tMjjkyFGeXTEfmtACkRK82dp6w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oyW9mtD/R3K+xw45vMeHawqWd6bNOhhaCcfkniWrpcN9LGqGO2WQCREnlWXtRdur1
         MH33lAw2psv27U+iYMWYSGdJWWLAPH2ZmhYPB8f/fxljvbBsq20+LaTtO2/eYNpuQ7
         JtvazmXLbROL41rn+6tHeVhwPqYSE/xFbKxQEqJo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BC901617A3;
        Fri, 12 Jul 2019 14:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562941048;
        bh=j34YjdOI22zXeGZb1tMjjkyFGeXTEfmtACkRK82dp6w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I1Q43Zi+CwcMNDPK2F6kSyCxRvtugaCZMOTtnNkdIXixxWFZrk+NDqO8R3OfC1BUH
         R5Wi4gkotdTEOSAkbCh4dMcuG9JIf/2zv7896yGOGbTHm9sqEz+SN/+N17tLAl2OdP
         hqDUsmOsxRXrdOLUomowCpCVjIKcVKyXrtidbFgY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BC901617A3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, David Brown <david.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv8 5/5] coresight: cpu-debug: Add support for Qualcomm Kryo
Date:   Fri, 12 Jul 2019 19:46:27 +0530
Message-Id: <e2c4cc7c6ccaa5695f25af20c8e487ac53b39955.1562940244.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for coresight CPU debug module on Qualcomm
Kryo CPUs. This patch adds the UCI entries for Kryo CPUs
found on MSM8996 which shares the same PIDs as ETMs.

Without this, below error is observed on MSM8996:

[    5.429867] OF: graph: no port node found in /soc/debug@3810000
[    5.429938] coresight-etm4x: probe of 3810000.debug failed with error -22
[    5.435415] coresight-cpu-debug 3810000.debug: Coresight debug-CPU0 initialized
[    5.446474] OF: graph: no port node found in /soc/debug@3910000
[    5.448927] coresight-etm4x: probe of 3910000.debug failed with error -22
[    5.454681] coresight-cpu-debug 3910000.debug: Coresight debug-CPU1 initialized
[    5.487765] OF: graph: no port node found in /soc/debug@3a10000
[    5.488007] coresight-etm4x: probe of 3a10000.debug failed with error -22
[    5.493024] coresight-cpu-debug 3a10000.debug: Coresight debug-CPU2 initialized
[    5.501802] OF: graph: no port node found in /soc/debug@3b10000
[    5.512901] coresight-etm4x: probe of 3b10000.debug failed with error -22
[    5.513192] coresight-cpu-debug 3b10000.debug: Coresight debug-CPU3 initialized

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 .../hwtracing/coresight/coresight-cpu-debug.c | 33 +++++++++----------
 drivers/hwtracing/coresight/coresight-priv.h  | 10 +++---
 2 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 2463aa7ab4f6..96544b348c27 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -646,24 +646,23 @@ static int debug_remove(struct amba_device *adev)
 	return 0;
 }
 
+static const struct amba_cs_uci_id uci_id_debug[] = {
+	{
+		/*  CPU Debug UCI data */
+		.devarch	= 0x47706a15,
+		.devarch_mask	= 0xfff0ffff,
+		.devtype	= 0x00000015,
+	}
+};
+
 static const struct amba_id debug_ids[] = {
-	{       /* Debug for Cortex-A53 */
-		.id	= 0x000bbd03,
-		.mask	= 0x000fffff,
-	},
-	{       /* Debug for Cortex-A57 */
-		.id	= 0x000bbd07,
-		.mask	= 0x000fffff,
-	},
-	{       /* Debug for Cortex-A72 */
-		.id	= 0x000bbd08,
-		.mask	= 0x000fffff,
-	},
-	{       /* Debug for Cortex-A73 */
-		.id	= 0x000bbd09,
-		.mask	= 0x000fffff,
-	},
-	{ 0, 0 },
+	CS_AMBA_ID(0x000bbd03),				/* Cortex-A53 */
+	CS_AMBA_ID(0x000bbd07),				/* Cortex-A57 */
+	CS_AMBA_ID(0x000bbd08),				/* Cortex-A72 */
+	CS_AMBA_ID(0x000bbd09),				/* Cortex-A73 */
+	CS_AMBA_UCI_ID(0x000f0205, uci_id_debug),	/* Qualcomm Kryo */
+	CS_AMBA_UCI_ID(0x000f0211, uci_id_debug),	/* Qualcomm Kryo */
+	{},
 };
 
 static struct amba_driver debug_driver = {
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 7d401790dd7e..41ae5863104d 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -185,11 +185,11 @@ static inline int etm_writel_cp14(u32 off, u32 val) { return 0; }
 	}
 
 /* coresight AMBA ID, full UCI structure: id table entry. */
-#define CS_AMBA_UCI_ID(pid, uci_ptr)	\
-	{				\
-		.id	= pid,		\
-		.mask	= 0x000fffff,	\
-		.data	= uci_ptr	\
+#define CS_AMBA_UCI_ID(pid, uci_ptr)		\
+	{					\
+		.id	= pid,			\
+		.mask	= 0x000fffff,		\
+		.data	= (void *)uci_ptr	\
 	}
 
 /* extract the data value from a UCI structure given amba_id pointer. */
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

