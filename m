Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4737F27F9F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Oct 2020 09:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbgJAHJY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Oct 2020 03:09:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:42844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbgJAHJY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Oct 2020 03:09:24 -0400
Received: from localhost.localdomain (unknown [122.167.37.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5D85F21481;
        Thu,  1 Oct 2020 07:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601536164;
        bh=RrOO/dbEnbrwC702tlxo6/rizE5c9N9saYv9zBvOWMs=;
        h=From:To:Cc:Subject:Date:From;
        b=IBjNcf7YOD7SmkwdBQudIQxU8fB8F2GLQO+bZv2O0AByBC2ZNgWzx8PuzxM0YLiml
         Detw1tjJd1vclcoOyUbkz9MFkV+qb3UCb7M0lvmY57AniFlMNXswmJBpeK0kQojkqO
         U2CD3tT7SeXMXJqaQSkN8WDhXGL2fcbdsUCmUFSo=
From:   Vinod Koul <vkoul@kernel.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] phy: qcom-qmp: initialize the pointer to NULL
Date:   Thu,  1 Oct 2020 12:39:11 +0530
Message-Id: <20201001070911.140019-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Smatch complains:
drivers/phy/qualcomm/phy-qcom-qmp.c:3899 qcom_qmp_phy_probe() error: uninitialized symbol 'dp_cfg'.
drivers/phy/qualcomm/phy-qcom-qmp.c:3900 qcom_qmp_phy_probe() error: uninitialized symbol 'dp_serdes'.
drivers/phy/qualcomm/phy-qcom-qmp.c:3902 qcom_qmp_phy_probe() error: uninitialized symbol 'usb_cfg'.

This is a warning but not a practical one as dp_cfg, dp_serdes and
usb_cfg will be set and used when valid. So we can set the pointers to
NULL to quiesce the warnings.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 52e013d0bffa ("phy: qcom-qmp: Add support for DP in USB3+DP combo phy")
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 6171b44da050..5d33ad4d06f2 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3928,9 +3928,9 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 	void __iomem *usb_serdes;
 	void __iomem *dp_serdes;
 	const struct qmp_phy_combo_cfg *combo_cfg = NULL;
-	const struct qmp_phy_cfg *cfg;
-	const struct qmp_phy_cfg *usb_cfg;
-	const struct qmp_phy_cfg *dp_cfg;
+	const struct qmp_phy_cfg *cfg = NULL;
+	const struct qmp_phy_cfg *usb_cfg = NULL;
+	const struct qmp_phy_cfg *dp_cfg = NULL;
 	int num, id, expected_phys;
 	int ret;
 
-- 
2.26.2

