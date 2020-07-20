Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BABA225E16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 14:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728058AbgGTMCc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 08:02:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:15408 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728691AbgGTMCc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 08:02:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595246551; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=queCfgOJI3AAE09b/o9QMvwXMlpczM7BLcztMQjytbU=; b=SlE89JdqOnYKCtiefzUP+0F6qXMHxxvCvOXUTO5ER05gp4QZX6MdGtmrn6FG6hIiTjJaKXN8
 RgVo/dvsyB3Uj7eaFaEeRf212Ni/mO067REGiWjcG9HgTKB3ALN8ai3I83hVjVzULpX8EfJF
 yqsiiEyCDUwFkw4aWBGC4N/dwYQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-west-2.postgun.com with SMTP id
 5f1587c0cf983e60a86a734e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 20 Jul 2020 12:02:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E7F7AC43395; Mon, 20 Jul 2020 12:02:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 862B1C433CA;
        Mon, 20 Jul 2020 12:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 862B1C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] drm/msm: dsi: dev_pm_opp_put_clkname() only when an opp_table exists
Date:   Mon, 20 Jul 2020 17:31:49 +0530
Message-Id: <1595246509-6584-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Its possible for msm_dsi_host_init() to fail early, before
dev_pm_opp_set_clkname() is called. In such cases, unconditionally
calling dev_pm_opp_put_clkname() in msm_dsi_host_destroy() results
in a crash. Put an additional check so that dev_pm_opp_put_clkname()
is called only when an opp_table exists.

Fixes: f99131fa7a23 ("drm/msm: dsi: Use OPP API to set clk/perf state")
Reported-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 0a14c4a..4f580f7 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1936,7 +1936,8 @@ void msm_dsi_host_destroy(struct mipi_dsi_host *host)
 
 	if (msm_host->has_opp_table)
 		dev_pm_opp_of_remove_table(&msm_host->pdev->dev);
-	dev_pm_opp_put_clkname(msm_host->opp_table);
+	if (msm_host->opp_table)
+		dev_pm_opp_put_clkname(msm_host->opp_table);
 	pm_runtime_disable(&msm_host->pdev->dev);
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

