Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12ABF12BE74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2019 19:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbfL1Sfm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 13:35:42 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44615 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbfL1Sfm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 13:35:42 -0500
Received: by mail-pf1-f194.google.com with SMTP id 195so15454954pfw.11;
        Sat, 28 Dec 2019 10:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ck7TpFNaYsTfHjkSWvol6O0HxhZOnUYsxWnfPAIODG0=;
        b=SEK8+t673PBtRzm98GmczaWYIBSNYcOrsEXBKK6zpG07VibtJQX62dTHYPFL4w+jn8
         J20u/cIUNnFSow7+ZChaXz0UVQuYAZd8oCZy7nnV/qto1fHLZWL/W5re1lp/81kjaOOB
         0XTi/yHyByCZ8cUJeKUMhCHhH5hUe7VYE/9t2Lum5P7P4pY5ew4fu2nA0QzW4bY/jFRE
         g9cF4BVNx3T84j2SNec0geRbXtvFbo+UyEeTSJ54I8iOJF2CSVxIYb2HDbqnWdvaP1H6
         ZTaEXNeqmvV4XlhIL/ZrmGrACVgGlzp8uUPkzAv+dPL/pbV6GLtTuPbwRs8FyhFH8yDq
         pVrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ck7TpFNaYsTfHjkSWvol6O0HxhZOnUYsxWnfPAIODG0=;
        b=jPDvWlY6fj6PiP4/RgBZW1w+mDyw2S4ZoReOtxyNgpPuPKvOFldSm9wZZ60HF+ikgv
         1dhQRKZPnOwqpAfZ5YpO1sHYhSJcJBdFQVPOEMpjvaseSLvs94IJbVU1o/xQ9y3gbz3L
         KT9pKBVOinf/2iJlG2bMEFU38/G1LGcMk52r2LJyFFoUX50u7/HokmeGIUbZKuX6fQx/
         0I2kvY0rVUZt5V4AywnaGC1A8u7O4K+3vCJvXbRNqwoXPn22CQSG6KDcO8bAMvthd3ko
         PIwHgV7uOrnLPJzT2x4l0YhUi98YD+eJmQJermd8dU4x3hByaoK1yKnNsSaV1FKhpLNf
         VHUA==
X-Gm-Message-State: APjAAAWJVu7lJhZB2c6vd6E7jS19raGG2CzzVJ+CiPtq8Ji2VAth2/xt
        dx2Wwyzu0uSYYY7Mbr1+RQM=
X-Google-Smtp-Source: APXvYqx5/QP/GNVoyrkVJfv4Aq0NGpfhph/LLs+Iu2oE/kr2AvgV3Rb9EKdPNpuSs0gUI6foQXJ/1A==
X-Received: by 2002:a63:338e:: with SMTP id z136mr62252030pgz.60.1577558141763;
        Sat, 28 Dec 2019 10:35:41 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id o31sm42035078pgb.56.2019.12.28.10.35.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2019 10:35:41 -0800 (PST)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     jassisinghbrar@gmail.com, nsaenzjulienne@suse.de,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, lftan@altera.com,
        matthias.bgg@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        nios2-dev@lists.rocketboards.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org
Cc:     Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 02/13] mailbox: xgene-slimpro: do some cleanup
Date:   Sat, 28 Dec 2019 18:35:27 +0000
Message-Id: <20191228183538.26189-2-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.
'i' and 'rc' are variables of the same type and there is no
need to use two lines.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/mailbox-xgene-slimpro.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mailbox-xgene-slimpro.c b/drivers/mailbox/mailbox-xgene-slimpro.c
index de260799f1b9..908c0eb99b5a 100644
--- a/drivers/mailbox/mailbox-xgene-slimpro.c
+++ b/drivers/mailbox/mailbox-xgene-slimpro.c
@@ -170,10 +170,8 @@ static const struct mbox_chan_ops slimpro_mbox_ops = {
 static int slimpro_mbox_probe(struct platform_device *pdev)
 {
 	struct slimpro_mbox *ctx;
-	struct resource *regs;
 	void __iomem *mb_base;
-	int rc;
-	int i;
+	int rc, i;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(struct slimpro_mbox), GFP_KERNEL);
 	if (!ctx)
@@ -181,8 +179,7 @@ static int slimpro_mbox_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctx);
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mb_base = devm_ioremap_resource(&pdev->dev, regs);
+	mb_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mb_base))
 		return PTR_ERR(mb_base);
 
-- 
2.17.1

