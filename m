Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06D8448F5AF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jan 2022 08:35:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231363AbiAOHf0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Jan 2022 02:35:26 -0500
Received: from smtp03.smtpout.orange.fr ([80.12.242.125]:58505 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbiAOHfZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Jan 2022 02:35:25 -0500
Received: from pop-os.home ([90.126.236.122])
        by smtp.orange.fr with ESMTPA
        id 8darniBFzhTNk8darn3hMm; Sat, 15 Jan 2022 08:35:24 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 15 Jan 2022 08:35:24 +0100
X-ME-IP: 90.126.236.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Sinan Kaya <okaya@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org
Subject: [PATCH v2] dmaengine: qcom_hidma: Remove useless DMA-32 fallback configuration
Date:   Sat, 15 Jan 2022 08:35:20 +0100
Message-Id: <4deb32b0c7838da66608022c584326eb01d0da03.1642232106.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As stated in [1], dma_set_mask() with a 64-bit mask never fails if
dev->dma_mask is non-NULL.
So, if it fails, the 32 bits case will also fail for the same reason.

Simplify code and remove some dead code accordingly.

[1]: https://lore.kernel.org/linux-kernel/YL3vSPK5DXTNvgdx@infradead.org/#t

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: have the subject and updated driver match
---
 drivers/dma/qcom/hidma.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/dma/qcom/hidma.c b/drivers/dma/qcom/hidma.c
index 65d054bb11aa..51587cf8196b 100644
--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -838,9 +838,7 @@ static int hidma_probe(struct platform_device *pdev)
 	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
 	if (rc) {
 		dev_warn(&pdev->dev, "unable to set coherent mask to 64");
-		rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
-		if (rc)
-			goto dmafree;
+		goto dmafree;
 	}
 
 	dmadev->lldev = hidma_ll_init(dmadev->ddev.dev,
-- 
2.32.0

