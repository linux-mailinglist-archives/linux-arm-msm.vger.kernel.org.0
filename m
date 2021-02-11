Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 753EB3191A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Feb 2021 18:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbhBKRyr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Feb 2021 12:54:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbhBKRwl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Feb 2021 12:52:41 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8093C061221
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Feb 2021 09:52:15 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 4DF101F897;
        Thu, 11 Feb 2021 18:50:18 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     elder@kernel.org
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, davem@davemloft.net,
        kuba@kernel.org, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, phone-devel@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH v1 3/7] net: ipa: gsi: Avoid some writes during irq setup for older IPA
Date:   Thu, 11 Feb 2021 18:50:11 +0100
Message-Id: <20210211175015.200772-4-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211175015.200772-1-angelogioacchino.delregno@somainline.org>
References: <20210211175015.200772-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some IPA versions (v3.1 and older), writing to registers
GSI_INTER_EE_SRC_CH_IRQ_OFFSET and GSI_INTER_EE_SRC_EV_CH_IRQ_OFFSET
will generate a fault and the SoC will lockup.

Avoid clearing CH and EV_CH interrupts on GSI probe to fix this bad
behavior: we are anyway not going to get spurious interrupts.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/net/ipa/gsi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ipa/gsi.c b/drivers/net/ipa/gsi.c
index 6315336b3ca8..b5460cbb085c 100644
--- a/drivers/net/ipa/gsi.c
+++ b/drivers/net/ipa/gsi.c
@@ -207,11 +207,14 @@ static void gsi_irq_setup(struct gsi *gsi)
 	iowrite32(0, gsi->virt + GSI_CNTXT_SRC_IEOB_IRQ_MSK_OFFSET);
 
 	/* Reverse the offset adjustment for inter-EE register offsets */
-	adjust = gsi->version < IPA_VERSION_4_5 ? 0 : GSI_EE_REG_ADJUST;
-	iowrite32(0, gsi->virt + adjust + GSI_INTER_EE_SRC_CH_IRQ_OFFSET);
-	iowrite32(0, gsi->virt + adjust + GSI_INTER_EE_SRC_EV_CH_IRQ_OFFSET);
+	if (gsi->version > IPA_VERSION_3_1) {
+		adjust = gsi->version < IPA_VERSION_4_5 ? 0 : GSI_EE_REG_ADJUST;
+		iowrite32(0, gsi->virt + adjust + GSI_INTER_EE_SRC_CH_IRQ_OFFSET);
+		iowrite32(0, gsi->virt + adjust + GSI_INTER_EE_SRC_EV_CH_IRQ_OFFSET);
+	}
 
 	iowrite32(0, gsi->virt + GSI_CNTXT_GSI_IRQ_EN_OFFSET);
+
 }
 
 /* Turn off all GSI interrupts when we're all done */
-- 
2.30.0

