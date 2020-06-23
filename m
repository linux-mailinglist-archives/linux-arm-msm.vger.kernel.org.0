Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCD952053AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 15:41:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732738AbgFWNlX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 09:41:23 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:37533 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732631AbgFWNlU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 09:41:20 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 23 Jun 2020 06:35:14 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Jun 2020 06:35:13 -0700
Received: from vbadigan-linux.qualcomm.com ([10.206.24.109])
  by ironmsg01-blr.qualcomm.com with ESMTP; 23 Jun 2020 19:05:07 +0530
Received: by vbadigan-linux.qualcomm.com (Postfix, from userid 76677)
        id 793984140; Tue, 23 Jun 2020 19:05:06 +0530 (IST)
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH V5 2/3] mmc: core: Set default power mode in mmc_alloc_host
Date:   Tue, 23 Jun 2020 19:04:47 +0530
Message-Id: <1592919288-1020-3-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1592919288-1020-1-git-send-email-vbadigan@codeaurora.org>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1592919288-1020-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set the default power mode (which is MMC_POWER_UNDEFINE)
in mmc_alloc_host, so that the vendor drivers can make use of this
state to perform needed actions during the platform driver probe.

Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 drivers/mmc/core/host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 6141a85749ca..793597556cd7 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -434,6 +434,7 @@ struct mmc_host *mmc_alloc_host(int extra, struct device *dev)
 
 	host->fixed_drv_type = -EINVAL;
 	host->ios.power_delay_ms = 10;
+	host->ios.power_mode = MMC_POWER_UNDEFINED;
 
 	return host;
 }
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

