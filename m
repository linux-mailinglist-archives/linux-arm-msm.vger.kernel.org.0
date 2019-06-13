Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A26B43BB6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbfFMPa6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:30:58 -0400
Received: from ns.iliad.fr ([212.27.33.1]:57000 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728630AbfFMLFe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 07:05:34 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 0CE9220AC3;
        Thu, 13 Jun 2019 13:05:32 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id ECEB720A7E;
        Thu, 13 Jun 2019 13:05:31 +0200 (CEST)
To:     Kishon Vijay Abraham <kishon@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v1] phy: qcom-qmp: Drop useless msm8998_pciephy_cfg setting
Message-ID: <5ed5df09-1335-127e-3624-6d1a883b5a54@free.fr>
Date:   Thu, 13 Jun 2019 13:05:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jun 13 13:05:32 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

'mask_com_pcs_ready' is only useful if 'has_phy_com_ctrl' is true.
Since msm8998_pciephy_cfg.has_phy_com_ctrl is false, let's drop
msm8998_pciephy_cfg.mask_com_pcs_ready altogether.

Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
This was a relic from copying msm8996_pciephy_cfg
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 43abdfd0deed..bb522b915fa9 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1255,7 +1255,6 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
 	.start_ctrl             = SERDES_START | PCS_START,
 	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
 	.mask_pcs_ready		= PHYSTATUS,
-	.mask_com_pcs_ready	= PCS_READY,
 };
 
 static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
-- 
2.17.1
