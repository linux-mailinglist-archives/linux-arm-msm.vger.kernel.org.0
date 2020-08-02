Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB550235693
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Aug 2020 13:16:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgHBLP5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Aug 2020 07:15:57 -0400
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133]:58146 "EHLO
        out30-133.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728311AbgHBLPw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Aug 2020 07:15:52 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R521e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07484;MF=tianjia.zhang@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0U4TCtCH_1596366946;
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com fp:SMTPD_---0U4TCtCH_1596366946)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sun, 02 Aug 2020 19:15:47 +0800
From:   Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        vkoul@kernel.org, dovl@codeaurora.org, ygardi@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        tianjia.zhang@alibaba.com
Subject: [PATCH] phy: qcom-ufs: Fix wrong return value in ufs_qcom_phy_calibrate()
Date:   Sun,  2 Aug 2020 19:15:46 +0800
Message-Id: <20200802111546.5611-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On an error exit path, a negative error code should be returned
instead of a positive return value.

Fixes: adaafaa393ef1 ("phy: qcom-ufs: add support for QUALCOMM Technologies UFS PHY drivers")
Cc: Yaniv Gardi <ygardi@codeaurora.org>
Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
---
 drivers/phy/qualcomm/phy-qcom-ufs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ufs.c b/drivers/phy/qualcomm/phy-qcom-ufs.c
index 763c8d396af1..49d47dc5bfd4 100644
--- a/drivers/phy/qualcomm/phy-qcom-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-ufs.c
@@ -24,7 +24,7 @@ int ufs_qcom_phy_calibrate(struct ufs_qcom_phy *ufs_qcom_phy,
 
 	if (!tbl_A) {
 		dev_err(ufs_qcom_phy->dev, "%s: tbl_A is NULL", __func__);
-		ret = EINVAL;
+		ret = -EINVAL;
 		goto out;
 	}
 
@@ -42,7 +42,7 @@ int ufs_qcom_phy_calibrate(struct ufs_qcom_phy *ufs_qcom_phy,
 		if (!tbl_B) {
 			dev_err(ufs_qcom_phy->dev, "%s: tbl_B is NULL",
 				__func__);
-			ret = EINVAL;
+			ret = -EINVAL;
 			goto out;
 		}
 
-- 
2.26.2

