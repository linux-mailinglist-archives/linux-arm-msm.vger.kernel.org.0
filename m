Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85C3C12BE75
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2019 19:36:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbfL1Sfl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 13:35:41 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43161 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726359AbfL1Sfl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 13:35:41 -0500
Received: by mail-pl1-f193.google.com with SMTP id p27so13028150pli.10;
        Sat, 28 Dec 2019 10:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=HA6ap3YBH12tN/wspc69xBp95EQn1Xx2HPN8PjoD5hA=;
        b=bMNVXsQnfKQRZaTsu5Z4AlXDdYOeCeNqaFJy6GuQn3oLSfJwG9BLmRwdcgIQlFlbNy
         EP9p+FhRGyY5d/kNaZZ/FQh+S8zTAaVojQm0ho0mKz/n7SyWATXKht31JKeKnjFN32Cl
         20d24NLqMfuGPZsWRCGsu8wMeGu885WX5Et9aJxLatjZlj2i2S1qOIbVLOnvxuSk50t3
         znbIrDGBqKfswBC49tmawJBrxKn+XK0NLWKMu+TT/PmB5Nr0nwBo3MeS0bPy5REXS51M
         b6k28+Easl0LQeyRJGDG6CTosoeO1HNpHTHKvl8xHyllA3Pu9GHV6gjRRhPvqFP+CHu+
         BjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=HA6ap3YBH12tN/wspc69xBp95EQn1Xx2HPN8PjoD5hA=;
        b=gzx65Zlbu+qywI1U0Up01jiBVCIgHbjWqN7Ukl5wj5Y1G+58XKxUww+2zVDLTL6gFP
         0xRmf3VrYXpnD+0KYFknpA3DW+BNZdOO3ELapJqBPTPMSUdeJnJD9YRNMN+wrGZ5AGln
         lToeY6+/Q8+QZ3FH11cEzho9Whh9URHE6J580/A20BJrLRduHbPcxIMlSmfc+VvmEVKs
         8bUhFirv+7WfTmNgI/oNgttCW1AfwhTSfk6qJiCht2eq+6GtaKvqyj8YUQR0NKlYsHwv
         R9R3vLQmjLY/2FaF+Y7cU6bCOSSWXAKNaKtpI/7z2tZYFAUqapN/fV5mfjAeN9lBE//u
         tFMQ==
X-Gm-Message-State: APjAAAUuReNFVfdraAy2AJZf4yrpKnpJpCrbGfiN17S7YtBSx1mkTs7L
        3UHEiiNE4+oi9XGiKPQGhns=
X-Google-Smtp-Source: APXvYqx4E8Eu7c2uGoKiMs4QJKyvTXmA+WIuNXF86bL2KzPp6818QAcgzM+bVVUzJc2A+S93588ywA==
X-Received: by 2002:a17:902:7288:: with SMTP id d8mr56643250pll.341.1577558140530;
        Sat, 28 Dec 2019 10:35:40 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id k21sm31679513pfa.63.2019.12.28.10.35.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2019 10:35:39 -0800 (PST)
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
Subject: [PATCH 01/13] mailbox: altera: convert to devm_platform_ioremap_resource
Date:   Sat, 28 Dec 2019 18:35:26 +0000
Message-Id: <20191228183538.26189-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mailbox/mailbox-altera.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/mailbox/mailbox-altera.c b/drivers/mailbox/mailbox-altera.c
index 75282666fb06..afb320e9d69c 100644
--- a/drivers/mailbox/mailbox-altera.c
+++ b/drivers/mailbox/mailbox-altera.c
@@ -285,7 +285,6 @@ static const struct mbox_chan_ops altera_mbox_ops = {
 static int altera_mbox_probe(struct platform_device *pdev)
 {
 	struct altera_mbox *mbox;
-	struct resource	*regs;
 	struct mbox_chan *chans;
 	int ret;
 
@@ -299,9 +298,7 @@ static int altera_mbox_probe(struct platform_device *pdev)
 	if (!chans)
 		return -ENOMEM;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-
-	mbox->mbox_base = devm_ioremap_resource(&pdev->dev, regs);
+	mbox->mbox_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->mbox_base))
 		return PTR_ERR(mbox->mbox_base);
 
-- 
2.17.1

