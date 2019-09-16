Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10D6CB41CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 22:29:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403770AbfIPU3l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 16:29:41 -0400
Received: from smtp11.smtpout.orange.fr ([80.12.242.133]:43679 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733018AbfIPU3l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 16:29:41 -0400
Received: from localhost.localdomain ([90.126.97.183])
        by mwinf5d90 with ME
        id 2LVe2100A3xPcdm03LVfSU; Mon, 16 Sep 2019 22:29:39 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 16 Sep 2019 22:29:39 +0200
X-ME-IP: 90.126.97.183
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     agross@kernel.org, robdclark@gmail.com, joro@8bytes.org
Cc:     linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] iommu/qcom: Simplify a test in 'qcom_iommu_add_device()'
Date:   Mon, 16 Sep 2019 22:29:36 +0200
Message-Id: <20190916202936.30403-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'iommu_group_get_for_dev()' never returns NULL, so this test can be
simplified a bit.

This way, the test is consistent with all other calls to
'iommu_group_get_for_dev()'.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/iommu/qcom_iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index c31e7bc4ccbe..3d99ec868892 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -539,8 +539,8 @@ static int qcom_iommu_add_device(struct device *dev)
 	}
 
 	group = iommu_group_get_for_dev(dev);
-	if (IS_ERR_OR_NULL(group))
-		return PTR_ERR_OR_ZERO(group);
+	if (IS_ERR(group))
+		return PTR_ERR(group);
 
 	iommu_group_put(group);
 	iommu_device_link(&qcom_iommu->iommu, dev);
-- 
2.20.1

