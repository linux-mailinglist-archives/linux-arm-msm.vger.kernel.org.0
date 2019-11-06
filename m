Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59C2FF1568
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 12:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfKFLth (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 06:49:37 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:51720 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfKFLth (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 06:49:37 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CD077611AD; Wed,  6 Nov 2019 11:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573040976;
        bh=1dpV706bZTuScFAR17edEPKOVhlZyfhlbJYNG58DizU=;
        h=From:To:Cc:Subject:Date:From;
        b=RaSSsofD1vViYXpfy4/wmxyzmwv1qsn0N+iYoTIDofh59P6E4hN+Jf1dV7OKrsduu
         Ln2tfuzSZ5V8tFVmt2Ko61ErevMu1/gAO0KaPw2hVi//6R6kZ/SgrghgjqHNsMxrq/
         jKB9K3viFZR27exdUB0KLJhBBizBM6onSbD82wFM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from smasetty-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BFE3160EE3;
        Wed,  6 Nov 2019 11:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573040976;
        bh=1dpV706bZTuScFAR17edEPKOVhlZyfhlbJYNG58DizU=;
        h=From:To:Cc:Subject:Date:From;
        b=RaSSsofD1vViYXpfy4/wmxyzmwv1qsn0N+iYoTIDofh59P6E4hN+Jf1dV7OKrsduu
         Ln2tfuzSZ5V8tFVmt2Ko61ErevMu1/gAO0KaPw2hVi//6R6kZ/SgrghgjqHNsMxrq/
         jKB9K3viFZR27exdUB0KLJhBBizBM6onSbD82wFM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BFE3160EE3
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH] drm: msm: a6xx: fix debug bus register configuration
Date:   Wed,  6 Nov 2019 17:19:23 +0530
Message-Id: <1573040963-24148-1-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the cx debugbus related register configuration, to collect accurate
bus data during gpu snapshot. This helps with complete snapshot dump
and also complete proper GPU recovery.

Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 483e100..c5764b4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -353,26 +353,26 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
 		cxdbg = ioremap(res->start, resource_size(res));

 	if (cxdbg) {
-		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_CNTLT,
+		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLT,
 			A6XX_DBGC_CFG_DBGBUS_CNTLT_SEGT(0xf));

-		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_CNTLM,
+		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_CNTLM,
 			A6XX_DBGC_CFG_DBGBUS_CNTLM_ENABLE(0xf));

-		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_0, 0);
-		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_1, 0);
-		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_2, 0);
-		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_IVTL_3, 0);
+		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_0, 0);
+		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_1, 0);
+		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_2, 0);
+		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_IVTL_3, 0);

-		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_0,
+		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_0,
 			0x76543210);
-		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_BYTEL_1,
+		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1,
 			0xFEDCBA98);

-		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_0, 0);
-		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_1, 0);
-		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_2, 0);
-		cxdbg_write(cxdbg, REG_A6XX_DBGC_CFG_DBGBUS_MASKL_3, 0);
+		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_0, 0);
+		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_1, 0);
+		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_2, 0);
+		cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_MASKL_3, 0);
 	}

 	nr_debugbus_blocks = ARRAY_SIZE(a6xx_debugbus_blocks) +
--
1.9.1

