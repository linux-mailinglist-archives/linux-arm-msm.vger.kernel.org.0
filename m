Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8170E10D1E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Nov 2019 08:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfK2Hju (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Nov 2019 02:39:50 -0500
Received: from a27-11.smtp-out.us-west-2.amazonses.com ([54.240.27.11]:40872
        "EHLO a27-11.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726360AbfK2Hju (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Nov 2019 02:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575013189;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=ZbBL0YlCdFMCj/S3gwNbtzQ3ZaZijak+AHAvDHCVEKg=;
        b=TwY1eixXaDG9fqdbbgAcYwh1jbu5GU9wXNuJu7oRI67c3l6JhJmg8uViOQilWM3D
        kOjyOJNlRyLIvaeIARawbmUQo20/bSFpHVL7CSVR+/kESd1KVA7gmzN4bmQ/BiiQQeM
        Ft4XNGl0tHj3Ky6hYF4IyLVDnwZ6CJWRUbCNHST4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575013189;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=ZbBL0YlCdFMCj/S3gwNbtzQ3ZaZijak+AHAvDHCVEKg=;
        b=ZUV6uoZW1RCuanEdno+LnbA5W7nzIdXL7aPuYuXDgw5cahELv6ayc0sv57vCELWf
        AXLDIvNGdpFsiB9xCF1YgREg32+F1V1aaLTCPVKTosZ2vDk72lHIHyNn2Pe54U42d3n
        zN4IgWvsP4ORXuP6ZS+vbeuHcsTTcFFyX5TuNULY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9FA06C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH] rnndb: Add GBIF registers for a6xx GPU
Date:   Fri, 29 Nov 2019 07:39:49 +0000
Message-ID: <0101016eb61a0601-14bd7732-c07c-4674-899f-0e570c145195-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
X-SES-Outgoing: 2019.11.29-54.240.27.11
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add GBIF register definitions required to implement a618
GPU revision

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 rnndb/adreno/a6xx.xml | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/rnndb/adreno/a6xx.xml b/rnndb/adreno/a6xx.xml
index 747f071..2d2063a 100644
--- a/rnndb/adreno/a6xx.xml
+++ b/rnndb/adreno/a6xx.xml
@@ -1748,6 +1748,32 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x3119" name="VBIF_PERF_PWR_CNT_HIGH1"/>
 	<reg32 offset="0x311a" name="VBIF_PERF_PWR_CNT_HIGH2"/>
 
+	<!-- GBIF registers -->
+	<reg32 offset="0x3c02" name="GBIF_SCACHE_CNTL1"/>
+	<reg32 offset="0x3c03" name="GBIF_QSB_SIDE0"/>
+	<reg32 offset="0x3c04" name="GBIF_QSB_SIDE1"/>
+	<reg32 offset="0x3c05" name="GBIF_QSB_SIDE2"/>
+	<reg32 offset="0x3c06" name="GBIF_QSB_SIDE3"/>
+	<reg32 offset="0x3c45" name="GBIF_HALT"/>
+	<reg32 offset="0x3c46" name="GBIF_HALT_ACK"/>
+
+	<reg32 offset="0x3cc0" name="GBIF_PERF_PWR_CNT_EN"/>
+	<reg32 offset="0x3cc2" name="GBIF_PERF_CNT_SEL"/>
+	<reg32 offset="0x3cc3" name="GBIF_PERF_PWR_CNT_SEL"/>
+	<reg32 offset="0x3cc4" name="GBIF_PERF_CNT_LOW0"/>
+	<reg32 offset="0x3cc5" name="GBIF_PERF_CNT_LOW1"/>
+	<reg32 offset="0x3cc6" name="GBIF_PERF_CNT_LOW2"/>
+	<reg32 offset="0x3cc7" name="GBIF_PERF_CNT_LOW3"/>
+	<reg32 offset="0x3cc8" name="GBIF_PERF_CNT_HIGH0"/>
+	<reg32 offset="0x3cc9" name="GBIF_PERF_CNT_HIGH1"/>
+	<reg32 offset="0x3cca" name="GBIF_PERF_CNT_HIGH2"/>
+	<reg32 offset="0x3ccb" name="GBIF_PERF_CNT_HIGH3"/>
+	<reg32 offset="0x3ccc" name="GBIF_PWR_CNT_LOW0"/>
+	<reg32 offset="0x3ccd" name="GBIF_PWR_CNT_LOW1"/>
+	<reg32 offset="0x3cce" name="GBIF_PWR_CNT_LOW2"/>
+	<reg32 offset="0x3ccf" name="GBIF_PWR_CNT_HIGH0"/>
+	<reg32 offset="0x3cd0" name="GBIF_PWR_CNT_HIGH1"/>
+	<reg32 offset="0x3cd1" name="GBIF_PWR_CNT_HIGH2"/>
 	<!-- move/rename these.. -->
 
 	<reg32 offset="0x88d4" name="RB_WINDOW_OFFSET2" type="adreno_reg_xy"/>
-- 
1.9.1

