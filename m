Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 169301100FC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2019 16:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfLCPQQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Dec 2019 10:16:16 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:54622
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726847AbfLCPQQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Dec 2019 10:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575386175;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=A74fUr+wlRBeqINSy7GC0MlEpjVR7ldbwLR8jac705A=;
        b=hiLhpqZ01h1QGIcDYSur0FindSr8qcPUMx2f9+XE6BR92mBX/Pz65hqwg0lDPEf/
        t3CmH7o8czqat0CuFB23M0XutvfgCRWXpjIW2Hj39g+gFg40ZwkLn+x9687o/Y7xKzD
        87D/pLWH8Qxa/1AW83g7C4lbar9HKB0s6wWegeDY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575386175;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=A74fUr+wlRBeqINSy7GC0MlEpjVR7ldbwLR8jac705A=;
        b=dnUzTyORjT5WKbR572C3xIwQCYxLcAHwrw6vmX6TocXrsFS5OTEczbfu8yt43Cpu
        Bhz2YISNphQG5RSLcaJR/7N4Wu9eyZO9tKQDqtbbvwZn2KW458NGBAyaKrxCYRkBsru
        VLtjd7iCtbafNiRcCRry5qw6UaUpzJ3TflZJcs+A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 78C28C447B0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 4/5] drm: msm: a6xx: fix debug bus register configuration
Date:   Tue, 3 Dec 2019 15:16:15 +0000
Message-ID: <0101016ecc55582f-e66a1b59-13f0-4792-8f5f-03d4b96ffd74-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org>
References: <1575386150-13299-1-git-send-email-smasetty@codeaurora.org>
X-SES-Outgoing: 2019.12.03-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
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
index 99b5a41..d6023ba 100644
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

