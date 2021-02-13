Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB3331AB12
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Feb 2021 12:38:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbhBMLhn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Feb 2021 06:37:43 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:47937 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229775AbhBMLft (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Feb 2021 06:35:49 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613216119; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=5PS2bxjSvwm5Zn+3sDa3ZDHOpuOIrQqj3tvCLimQzWo=; b=ShEQX/Q1/hRkJK2FApp/ELxSuWexM0kb3XPLyb2tlP0TWu1y45Ctu2/0/s8Yy/p2/cEjMk8k
 xuVZzEKuMtS3d+O9Q+bvzIBflm9WzJamH45Etg+8AO+VaRYX71TTARe55kdw1aXD/eKKvqkb
 stYJB+wFU5s/zivwR1muT9Zz8/0=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6027b7f88e43a988b7504292 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 13 Feb 2021 11:28:56
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 30139C43463; Sat, 13 Feb 2021 11:28:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E0A4CC433C6;
        Sat, 13 Feb 2021 11:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E0A4CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>
Cc:     coresight@lists.linaro.org, Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2] coresight: etm4x: Add ETM PID for Cortex-A78
Date:   Sat, 13 Feb 2021 16:58:29 +0530
Message-Id: <20210213112829.26834-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add ETM PID for Cortex-A78 to the list of supported ETMs.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---

Changes in v2:
 * Rebased on top of coresight/next from kernel.org coresight repo.

---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 15016f757828..a5b13a7779c3 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1951,6 +1951,7 @@ static const struct amba_id etm4_ids[] = {
 	CS_AMBA_UCI_ID(0x000bbd05, uci_id_etm4),/* Cortex-A55 */
 	CS_AMBA_UCI_ID(0x000bbd0a, uci_id_etm4),/* Cortex-A75 */
 	CS_AMBA_UCI_ID(0x000bbd0c, uci_id_etm4),/* Neoverse N1 */
+	CS_AMBA_UCI_ID(0x000bbd41, uci_id_etm4),/* Cortex-A78 */
 	CS_AMBA_UCI_ID(0x000f0205, uci_id_etm4),/* Qualcomm Kryo */
 	CS_AMBA_UCI_ID(0x000f0211, uci_id_etm4),/* Qualcomm Kryo */
 	CS_AMBA_UCI_ID(0x000bb802, uci_id_etm4),/* Qualcomm Kryo 385 Cortex-A55 */

base-commit: 06c18e28c402ecfb842df8e22a19a097c35ffca9
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

