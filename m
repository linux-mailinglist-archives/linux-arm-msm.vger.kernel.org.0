Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C74C12BE61
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2019 19:36:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726885AbfL1SgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 13:36:02 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33068 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbfL1SgB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 13:36:01 -0500
Received: by mail-pl1-f195.google.com with SMTP id c13so13039600pls.0;
        Sat, 28 Dec 2019 10:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ADqPq+9Qjf/3isyeDy4/Z1hzrmcF+XODskWY/MSDCzg=;
        b=pUXBq1ZSttMQqrQedS6P3sf1POS/rPvRylB5k3jq1APu8c7p2pyt0Bi04CAVKALzjF
         mPkoRNynqJkKKKbubehHQ3+9IO5OqtImXGsEmJpiIFuAWI+EiXbIvwd9UQW4ZMC6M68s
         ed/W0lBfQ6ox96LOSikKs5fzgb/eLXOyhFgvFViHP8w7Aa50/yH69Z6WSlEjPBQ5YagM
         w/LDGD63x99SDV9D6NspjiK/aq60dQIlAfRolapH8LpMppixENiGo10ax6WBq8YV7SNS
         i7kgAhJgTiEjKLctxdjFNGrsF/q0hObxNFxPMyNymGY1GUapBkfBfb8Hl4CV2cGuUYwX
         45JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ADqPq+9Qjf/3isyeDy4/Z1hzrmcF+XODskWY/MSDCzg=;
        b=VbGJpVH8xHMTixWSbUXoRn3tx3qqIuH7tyr8vznHylZOVdsT49Omvu3BbMZEVcEaSE
         RflwwOuDufLB26kE571dkIQWHBhWIJe5/mrIT48nFeiQxxoocUAkBANXhAMnNhfvKSMW
         G/0iW+nstVj9iJ50MdPzYQzworILd7MAuhbwNIiwV60ai/J1Y6KftJvEg8eKEYzUcM6b
         Ma/gqrqvGZUCqSm/+FjUWraxBonCyf4Gra9ArQZI0F1atKh8CQ5/KLlOYcASz5gpRKhe
         APOXivflp+FTa5QjltqnqmdIMO7Y5ulI1Dts5+8EgxsJrfNzlJ5Y6swI9M3PYGYNwOjI
         /CKA==
X-Gm-Message-State: APjAAAUyK+Qlh+dSDPm4zQYYCAI6glUYWSiYgoxW5UShW/hA9htcXA57
        6QDfW4DRNbmylkjQ0SaedFo=
X-Google-Smtp-Source: APXvYqwLD6B860LYYvLn0ujeh8QzH5CpAMQoA7FqjdVBqgwpvrGi+q9HmCi2Rey62ZR7dzLVq7TOLA==
X-Received: by 2002:a17:90a:db0f:: with SMTP id g15mr33432010pjv.40.1577558160406;
        Sat, 28 Dec 2019 10:36:00 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id c26sm40294665pfj.101.2019.12.28.10.35.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2019 10:36:00 -0800 (PST)
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
Subject: [PATCH 13/13] mailbox: armada-37xx-rwtm: convert to devm_platform_ioremap_resource
Date:   Sat, 28 Dec 2019 18:35:38 +0000
Message-Id: <20191228183538.26189-13-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191228183538.26189-1-tiny.windzz@gmail.com>
References: <20191228183538.26189-1-tiny.windzz@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/armada-37xx-rwtm-mailbox.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mailbox/armada-37xx-rwtm-mailbox.c b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
index 19f086716dc5..02b7b28e6969 100644
--- a/drivers/mailbox/armada-37xx-rwtm-mailbox.c
+++ b/drivers/mailbox/armada-37xx-rwtm-mailbox.c
@@ -143,7 +143,6 @@ static const struct mbox_chan_ops a37xx_mbox_ops = {
 static int armada_37xx_mbox_probe(struct platform_device *pdev)
 {
 	struct a37xx_mbox *mbox;
-	struct resource *regs;
 	struct mbox_chan *chans;
 	int ret;
 
@@ -156,9 +155,7 @@ static int armada_37xx_mbox_probe(struct platform_device *pdev)
 	if (!chans)
 		return -ENOMEM;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	mbox->base = devm_ioremap_resource(&pdev->dev, regs);
+	mbox->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->base)) {
 		dev_err(&pdev->dev, "ioremap failed\n");
 		return PTR_ERR(mbox->base);
-- 
2.17.1

