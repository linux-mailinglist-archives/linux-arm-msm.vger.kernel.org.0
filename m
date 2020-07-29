Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F9E231A83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 09:44:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgG2HoW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 03:44:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:57782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726290AbgG2HoV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 03:44:21 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B964D20809;
        Wed, 29 Jul 2020 07:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596008661;
        bh=EAAEADU7DSjaLvXALOCEsiBzv+cV9IYKsedOqf641lM=;
        h=From:To:Cc:Subject:Date:From;
        b=yike37CLVQmHz0JUqQNOKjuZ3Am1/pbaBIWrX2PWKJHTCJ5QY9PKb6B1SIA/HVxhu
         Tot/6jU8FXITkwE/DI3HTqeqIdmxRg7Bi+QsHhamZDK7kn+9st8Cp+AWJ3i8624dZ1
         gjFvMo05FB5c3t4plz2TvdczGhJgbDX8bI3q3D8E=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 1/2] soc: mediatek: mtk-infracfg: Fix kerneldoc
Date:   Wed, 29 Jul 2020 09:44:14 +0200
Message-Id: <20200729074415.28393-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix W=1 compile warnings (invalid kerneldoc):

    drivers/soc/mediatek/mtk-infracfg.c:34: warning: Function parameter or member 'infracfg' not described in 'mtk_infracfg_set_bus_protection'
    drivers/soc/mediatek/mtk-infracfg.c:34: warning: Excess function parameter 'regmap' description in 'mtk_infracfg_set_bus_protection'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/soc/mediatek/mtk-infracfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-infracfg.c b/drivers/soc/mediatek/mtk-infracfg.c
index 341c7ac250e3..4a123796aad3 100644
--- a/drivers/soc/mediatek/mtk-infracfg.c
+++ b/drivers/soc/mediatek/mtk-infracfg.c
@@ -19,7 +19,7 @@
 
 /**
  * mtk_infracfg_set_bus_protection - enable bus protection
- * @regmap: The infracfg regmap
+ * @infracfg: The infracfg regmap
  * @mask: The mask containing the protection bits to be enabled.
  * @reg_update: The boolean flag determines to set the protection bits
  *              by regmap_update_bits with enable register(PROTECTEN) or
@@ -50,7 +50,7 @@ int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
 
 /**
  * mtk_infracfg_clear_bus_protection - disable bus protection
- * @regmap: The infracfg regmap
+ * @infracfg: The infracfg regmap
  * @mask: The mask containing the protection bits to be disabled.
  * @reg_update: The boolean flag determines to clear the protection bits
  *              by regmap_update_bits with enable register(PROTECTEN) or
-- 
2.17.1

