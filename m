Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B93A5F608
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 11:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbfGDJx0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 05:53:26 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58812 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727508AbfGDJxZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 05:53:25 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 777A460AE0; Thu,  4 Jul 2019 09:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562234004;
        bh=lSCRmpdQlCEd/Kj8Ntu2jR3/PZflhefTpXcBTNR9qDk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y4uuTthmGafAC0u/UrIeqk12SrX26Bg6zbfUaqfUNB+A/rQapXdLSOh3Semg+idZg
         m+LkjMQlXRaNlodRbxv5H6dozjMPAuUZ1RO1L6wu65nUnkhSC/7uO1LGLUWMKuV+6C
         38cTy0rkYkvVRTIuiDJA9hIgvj8iXiuNux9+pBBQ=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 414FB60A44;
        Thu,  4 Jul 2019 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562234001;
        bh=lSCRmpdQlCEd/Kj8Ntu2jR3/PZflhefTpXcBTNR9qDk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IDed2RoA9pvh4fkzjnfjW6cplh1uxpriqW9kZW7wY1JcEwBlX+Kf3AuiSDv0b8shZ
         aciHGwkeIZJrSFlm6YdhGA78o9Y5wrMeLIssWaKwXzYnhVaT1ajxY9N3v0nW/aGAD6
         iVD37F0EqmGjwBQbqSp3UIo4yNVH0q1fTimnZBEA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 414FB60A44
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
Subject: [RESEND PATCHv5 1/2] dt-bindings: coresight: Change CPU phandle to required property
Date:   Thu,  4 Jul 2019 15:23:04 +0530
Message-Id: <0f7f4105d5ffea6ca4313271f3b3fee69da2106a.1562229018.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1562229018.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1562229018.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Do not assume the affinity to CPU0 if cpu phandle is omitted.
Update the DT binding rules to reflect the same by changing it
to a required property.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 .../devicetree/bindings/arm/coresight-cpu-debug.txt       | 4 ++--
 Documentation/devicetree/bindings/arm/coresight.txt       | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

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
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

