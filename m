Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA5930DCF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2019 14:06:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbfEaMGD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 May 2019 08:06:03 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:45699 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727112AbfEaMGD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 May 2019 08:06:03 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hWgIJ-0000iw-Lk; Fri, 31 May 2019 12:05:59 +0000
From:   Colin King <colin.king@canonical.com>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] phy: qcom-qusb2: fix missing assignment of ret when calling clk_prepare_enable
Date:   Fri, 31 May 2019 13:05:59 +0100
Message-Id: <20190531120559.2202-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error return from the call to clk_prepare_enable is not being assigned
to variable ret even though ret is being used to check if the call failed.
Fix this by adding in the missing assignment.

Addresses-Coverity: ("Logically dead code")
Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 1cbf1d6f28ce..bf94a52d3087 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -564,7 +564,7 @@ static int __maybe_unused qusb2_phy_runtime_resume(struct device *dev)
 	}
 
 	if (!qphy->has_se_clk_scheme) {
-		clk_prepare_enable(qphy->ref_clk);
+		ret = clk_prepare_enable(qphy->ref_clk);
 		if (ret) {
 			dev_err(dev, "failed to enable ref clk, %d\n", ret);
 			goto disable_ahb_clk;
-- 
2.20.1

