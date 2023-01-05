Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 021ED65E6DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 09:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbjAEIds (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 03:33:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbjAEIdr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 03:33:47 -0500
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70DD4C707
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 00:33:44 -0800 (PST)
X-QQ-mid: bizesmtp73t1672907600t7kiowh9
Received: from localhost.localdomain ( [58.240.82.166])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 05 Jan 2023 16:33:11 +0800 (CST)
X-QQ-SSF: 01400000000000C0N000000A0000000
X-QQ-FEAT: D2GZf6M6C/iCwLhI5s4pAMrmi3WaBAl8232OajtLA+18VBi+HhOkSrocauFMs
        FPY+2WP+fpkQ7ThDF3rVWoeFrwR1RcPBZOQVoaVf5Mk07xz1816dAz+kthCZhpAGDTXooy9
        AJDYGUmctSY6GAL8O0cbCtnrM2lcFMjACfPnDivoxiPNgMZ4hsoC4Kjj4BqhwNeZ/kW6GdW
        o+ELXD1SaWXQaytCqpCRZe8+pnRe6HZ9F9uk6UUZ9lTH/wZa90Eeq1HSZF5BOuKRN1WcC+P
        uTa+Dpfl4VqsFh7RU2tJfDHhhgaCGachH9l2KeaHqIhC9eg2efPaZYHxG6TAMpj8hxvL0Zg
        ev4VnH3dWQ0L9LznFzgSAmRsVHmLNIzrgW7sSllwr3nDKwIUJNRbi49Rp0Le+dONQ9Qwkny
        q5aRa0zFAUQ=
X-QQ-GoodBg: 1
From:   Zhen Ni <nizhen@uniontech.com>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, airlied@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Zhen Ni <nizhen@uniontech.com>
Subject: [PATCH] drm: msm: Fix error check return value of irq_of_parse_and_map()
Date:   Thu,  5 Jan 2023 16:33:06 +0800
Message-Id: <20230105083306.1638656-1-nizhen@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr5
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The irq_of_parse_and_map() function returns 0 on failure, and does not
return an negative value.

Signed-off-by: Zhen Ni <nizhen@uniontech.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 89aadd3b3202..3891d9d4a602 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1953,9 +1953,9 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	}
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (msm_host->irq < 0) {
-		ret = msm_host->irq;
-		dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
+	if (!msm_host->irq) {
+		ret = -EINVAL;
+		dev_err(&pdev->dev, "failed to get irq\n");
 		return ret;
 	}
 
-- 
2.20.1

