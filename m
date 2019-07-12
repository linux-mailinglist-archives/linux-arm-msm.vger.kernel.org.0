Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA5C67131
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2019 16:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727550AbfGLOR1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jul 2019 10:17:27 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:34356 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727127AbfGLOR0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jul 2019 10:17:26 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 75E5460F3E; Fri, 12 Jul 2019 14:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562941045;
        bh=ZLyrLF3gxoij3tWd6LLpsaHVZE9/f37v1XHJJ32CDWo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Bj//fmGhOcCIoZYprVWSUOYjENy0HOKhhexrJpR97A5vVv6LNFBhAGvXy+M/JLkr2
         0xbhv0J2bU0NFyza6EkUvi705kVHVyHRD84exP3w1H7KH/osm2uKFY/NqMFeA+Wpgq
         CQ38uYXBx6OZkdZCbUrJbf+kKUUJc6aaE1lAvU8o=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A6CB660E3F;
        Fri, 12 Jul 2019 14:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562941042;
        bh=ZLyrLF3gxoij3tWd6LLpsaHVZE9/f37v1XHJJ32CDWo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xhe34wh3Rv4s9lSEFglyofbPRkR1qLSCI5lbeRncgZSsXYs6dg/jADkquEvbX9tdU
         sb+dm9YbR2r9JlwLjpC9jN1LOyUCcxd5HptD6B2SbvQR8tLg3a/6sR8BaBtaUybrSr
         sNsCmZAaDGEPeVKNxyRvYlcgdEX63mAB7EK7J3dM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A6CB660E3F
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
Subject: [PATCHv8 4/5] coresight: etm4x: Add ETM PIDs for SDM845 and MSM8996
Date:   Fri, 12 Jul 2019 19:46:26 +0530
Message-Id: <2694eae0731a07eeda11f666526ccff8c6b5842e.1562940244.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1562940244.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Instead of overriding the peripheral id(PID) check in AMBA
by hardcoding them in DT, add the PIDs to the ETM4x driver.
Here we use Unique Component Identifier(UCI) for MSM8996
since the ETM and CPU debug module shares the same PIDs.
SDM845 does not support CPU debug module.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
index 7bcac8896fc1..28bcc0e58d7a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x.c
@@ -1192,11 +1192,15 @@ static struct amba_cs_uci_id uci_id_etm4[] = {
 };
 
 static const struct amba_id etm4_ids[] = {
-	CS_AMBA_ID(0x000bb95d),		/* Cortex-A53 */
-	CS_AMBA_ID(0x000bb95e),		/* Cortex-A57 */
-	CS_AMBA_ID(0x000bb95a),		/* Cortex-A72 */
-	CS_AMBA_ID(0x000bb959),		/* Cortex-A73 */
-	CS_AMBA_UCI_ID(0x000bb9da, uci_id_etm4),	/* Cortex-A35 */
+	CS_AMBA_ID(0x000bb95d),			/* Cortex-A53 */
+	CS_AMBA_ID(0x000bb95e),			/* Cortex-A57 */
+	CS_AMBA_ID(0x000bb95a),			/* Cortex-A72 */
+	CS_AMBA_ID(0x000bb959),			/* Cortex-A73 */
+	CS_AMBA_UCI_ID(0x000bb9da, uci_id_etm4),/* Cortex-A35 */
+	CS_AMBA_UCI_ID(0x000f0205, uci_id_etm4),/* Qualcomm Kryo */
+	CS_AMBA_UCI_ID(0x000f0211, uci_id_etm4),/* Qualcomm Kryo */
+	CS_AMBA_ID(0x000bb802),			/* Qualcomm Kryo 385 Cortex-A55 */
+	CS_AMBA_ID(0x000bb803),			/* Qualcomm Kryo 385 Cortex-A75 */
 	{},
 };
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

