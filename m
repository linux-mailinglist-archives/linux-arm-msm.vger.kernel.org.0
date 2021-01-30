Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02E203096CD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Jan 2021 17:37:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhA3QgF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Jan 2021 11:36:05 -0500
Received: from mail.z3ntu.xyz ([128.199.32.197]:60246 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231617AbhA3O0i (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Jan 2021 09:26:38 -0500
Received: from localhost.localdomain (91-115-28-172.adsl.highway.telekom.at [91.115.28.172])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id E4EE1C4D09;
        Sat, 30 Jan 2021 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1612016642; bh=ogHO0gWBqB7dfJUJ5LmZsuLbW5GwhjBNOZ4Ucl5LvUs=;
        h=From:To:Cc:Subject:Date;
        b=PVkyvSmszVmxI+29mJcJCWSQvkRTOAW2+YTixg8ohhLUUiTrkX4oYII8L1vhJzOcR
         xTNJECme5qbB82+Vw13pxFZZEH6T9p09+7sw5k98Ux52tI8t/7T2q9RGNvL5z4RlEB
         li0zPWANvnPXpwy0kbzETFbTr18wOtD9Qm5JeYNE=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: ocmem: don't return NULL in of_get_ocmem
Date:   Sat, 30 Jan 2021 15:23:49 +0100
Message-Id: <20210130142349.53335-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If ocmem probe fails for whatever reason, of_get_ocmem returned NULL.
Without this, users must check for both NULL and IS_ERR on the returned
pointer - which didn't happen in drivers/gpu/drm/msm/adreno/adreno_gpu.c
leading to a NULL pointer dereference.

Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/soc/qcom/ocmem.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index 7f9e9944d1ea..f1875dc31ae2 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -189,6 +189,7 @@ struct ocmem *of_get_ocmem(struct device *dev)
 {
 	struct platform_device *pdev;
 	struct device_node *devnode;
+	struct ocmem *ocmem;
 
 	devnode = of_parse_phandle(dev->of_node, "sram", 0);
 	if (!devnode || !devnode->parent) {
@@ -202,7 +203,12 @@ struct ocmem *of_get_ocmem(struct device *dev)
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	return platform_get_drvdata(pdev);
+	ocmem = platform_get_drvdata(pdev);
+	if (!ocmem) {
+		dev_err(dev, "Cannot get ocmem\n");
+		return ERR_PTR(-ENODEV);
+	}
+	return ocmem;
 }
 EXPORT_SYMBOL(of_get_ocmem);
 
-- 
2.30.0

