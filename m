Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74FC61535D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 18:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbgBERBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 12:01:40 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:57211 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727054AbgBERBj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 12:01:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580922098; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7DUhFiRSM+eRxfIS8UQQZG95uYXWL3eYV9xeTSLQqKg=; b=PTz0lOqHWNJsbrvzANXCuJidZ9X4rCIL2M290EhJjLqg4/QzCnGMVmK8vq/ERtwgqZ1nc5fh
 RoZBtIn6J/Ce7OSUfLfIYT00DcwH3Ncm/5lRx2KraJLUpJbzacVM0MFLJaFvoj0Ti+rUZPqs
 JcjE1bRc70PR3w1uiAWFDdbqGwU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3af4e9.7f4300106068-smtp-out-n03;
 Wed, 05 Feb 2020 17:01:29 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 919E8C447A1; Wed,  5 Feb 2020 17:01:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EF247C43383;
        Wed,  5 Feb 2020 17:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EF247C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     Sharat Masetty <smasetty@codeaurora.org>, dianders@chromium.org,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/msm/a6xx: Update the GMU bus tables for sc7180
Date:   Wed,  5 Feb 2020 10:01:21 -0700
Message-Id: <1580922081-25177-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixup the GMU bus table values for the sc7180 target.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 85 ++++++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index eda11ab..e450e0b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -7,6 +7,7 @@
 
 #include "a6xx_gmu.h"
 #include "a6xx_gmu.xml.h"
+#include "a6xx_gpu.h"
 
 #define HFI_MSG_ID(val) [val] = #val
 
@@ -216,48 +217,82 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
-static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
+static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
 {
-	struct a6xx_hfi_msg_bw_table msg = { 0 };
+	/* Send a single "off" entry since the 618 GMU doesn't do bus scaling */
+	msg->bw_level_num = 1;
+
+	msg->ddr_cmds_num = 3;
+	msg->ddr_wait_bitmask = 0x01;
+
+	msg->ddr_cmds_addrs[0] = 0x50000;
+	msg->ddr_cmds_addrs[1] = 0x5003c;
+	msg->ddr_cmds_addrs[2] = 0x5000c;
+
+	msg->ddr_cmds_data[0][0] =  0x40000000;
+	msg->ddr_cmds_data[0][1] =  0x40000000;
+	msg->ddr_cmds_data[0][2] =  0x40000000;
 
 	/*
-	 * The sdm845 GMU doesn't do bus frequency scaling on its own but it
-	 * does need at least one entry in the list because it might be accessed
-	 * when the GMU is shutting down. Send a single "off" entry.
+	 * These are the CX (CNOC) votes - these are used by the GMU but the
+	 * votes are known and fixed for the target
 	 */
+	msg->cnoc_cmds_num = 1;
+	msg->cnoc_wait_bitmask = 0x01;
+
+	msg->cnoc_cmds_addrs[0] = 0x5007c;
+	msg->cnoc_cmds_data[0][0] =  0x40000000;
+	msg->cnoc_cmds_data[1][0] =  0x60000001;
+}
 
-	msg.bw_level_num = 1;
+static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
+{
+	/* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
+	msg->bw_level_num = 1;
 
-	msg.ddr_cmds_num = 3;
-	msg.ddr_wait_bitmask = 0x07;
+	msg->ddr_cmds_num = 3;
+	msg->ddr_wait_bitmask = 0x07;
 
-	msg.ddr_cmds_addrs[0] = 0x50000;
-	msg.ddr_cmds_addrs[1] = 0x5005c;
-	msg.ddr_cmds_addrs[2] = 0x5000c;
+	msg->ddr_cmds_addrs[0] = 0x50000;
+	msg->ddr_cmds_addrs[1] = 0x5005c;
+	msg->ddr_cmds_addrs[2] = 0x5000c;
 
-	msg.ddr_cmds_data[0][0] =  0x40000000;
-	msg.ddr_cmds_data[0][1] =  0x40000000;
-	msg.ddr_cmds_data[0][2] =  0x40000000;
+	msg->ddr_cmds_data[0][0] =  0x40000000;
+	msg->ddr_cmds_data[0][1] =  0x40000000;
+	msg->ddr_cmds_data[0][2] =  0x40000000;
 
 	/*
 	 * These are the CX (CNOC) votes.  This is used but the values for the
 	 * sdm845 GMU are known and fixed so we can hard code them.
 	 */
 
-	msg.cnoc_cmds_num = 3;
-	msg.cnoc_wait_bitmask = 0x05;
+	msg->cnoc_cmds_num = 3;
+	msg->cnoc_wait_bitmask = 0x05;
 
-	msg.cnoc_cmds_addrs[0] = 0x50034;
-	msg.cnoc_cmds_addrs[1] = 0x5007c;
-	msg.cnoc_cmds_addrs[2] = 0x5004c;
+	msg->cnoc_cmds_addrs[0] = 0x50034;
+	msg->cnoc_cmds_addrs[1] = 0x5007c;
+	msg->cnoc_cmds_addrs[2] = 0x5004c;
 
-	msg.cnoc_cmds_data[0][0] =  0x40000000;
-	msg.cnoc_cmds_data[0][1] =  0x00000000;
-	msg.cnoc_cmds_data[0][2] =  0x40000000;
+	msg->cnoc_cmds_data[0][0] =  0x40000000;
+	msg->cnoc_cmds_data[0][1] =  0x00000000;
+	msg->cnoc_cmds_data[0][2] =  0x40000000;
+
+	msg->cnoc_cmds_data[1][0] =  0x60000001;
+	msg->cnoc_cmds_data[1][1] =  0x20000001;
+	msg->cnoc_cmds_data[1][2] =  0x60000001;
+}
+
+
+static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
+{
+	struct a6xx_hfi_msg_bw_table msg = { 0 };
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 
-	msg.cnoc_cmds_data[1][0] =  0x60000001;
-	msg.cnoc_cmds_data[1][1] =  0x20000001;
-	msg.cnoc_cmds_data[1][2] =  0x60000001;
+	if (adreno_is_a618(adreno_gpu))
+		a618_build_bw_table(&msg);
+	else
+		a6xx_build_bw_table(&msg);
 
 	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_BW_TABLE, &msg, sizeof(msg),
 		NULL, 0);
-- 
2.7.4
