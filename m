Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C19892E076A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 09:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgLVIti (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 03:49:38 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:45532 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725300AbgLVIth (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 03:49:37 -0500
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 22 Dec 2020 00:48:56 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 22 Dec 2020 00:48:55 -0800
X-QCInternal: smtphost
Received: from mdalam-linux.qualcomm.com ([10.201.2.71])
  by ironmsg01-blr.qualcomm.com with ESMTP; 22 Dec 2020 14:18:38 +0530
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
        id 3E7A421BA0; Tue, 22 Dec 2020 14:18:37 +0530 (IST)
From:   Md Sadre Alam <mdalam@codeaurora.org>
To:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        ulf.hansson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     mdalam@codeaurora.org, sricharan@codeaurora.org
Subject: [PATCH] mmc: sdhci-msm: Fix possible NULL pointer exception
Date:   Tue, 22 Dec 2020 14:18:33 +0530
Message-Id: <1608626913-16675-1-git-send-email-mdalam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

of_device_get_match_data returns NULL when no match.
So add the NULL pointer check to avoid dereference.

Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 9c7927b..f20e424 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -2235,6 +2235,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	 * the data associated with the version info.
 	 */
 	var_info = of_device_get_match_data(&pdev->dev);
+	if (!var_info)
+		goto pltfm_free;
 
 	msm_host->mci_removed = var_info->mci_removed;
 	msm_host->restore_dll_config = var_info->restore_dll_config;
-- 
2.7.4

