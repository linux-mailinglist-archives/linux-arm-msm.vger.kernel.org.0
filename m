Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33FA030FAA2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 19:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238870AbhBDSFB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 13:05:01 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:59026 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238784AbhBDSEA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 13:04:00 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1l7iyH-0005JS-IL; Thu, 04 Feb 2021 18:03:13 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] phy: qcom-qmp: make a const array static, makes object smaller
Date:   Thu,  4 Feb 2021 18:03:13 +0000
Message-Id: <20210204180313.108876-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the const array cfg1_settings on the stack but instead make
it static. Makes the object code smaller by 24 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  73585	  20240	     64	  93889	  16ec1	drivers/phy/qualcomm/phy-qcom-qmp.o

After:
   text	   data	    bss	    dec	    hex	filename
  73465	  20336	     64	  93865	  16ea9	drivers/phy/qualcomm/phy-qcom-qmp.o

(gcc version 10.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index a679b5fb7b48..d0dfb6743965 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -3421,7 +3421,7 @@ static int qcom_qmp_phy_configure_dp_phy(struct qmp_phy *qphy)
 static int qcom_qmp_dp_phy_calibrate(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	const u8 cfg1_settings[] = { 0x13, 0x23, 0x1d };
+	static const u8 cfg1_settings[] = { 0x13, 0x23, 0x1d };
 	u8 val;
 
 	qphy->dp_aux_cfg++;
-- 
2.29.2

