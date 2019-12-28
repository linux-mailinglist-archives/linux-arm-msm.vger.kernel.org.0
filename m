Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 454A612BE4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2019 19:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbfL1Sft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 13:35:49 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38609 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfL1Sft (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 13:35:49 -0500
Received: by mail-pf1-f196.google.com with SMTP id x185so16327965pfc.5;
        Sat, 28 Dec 2019 10:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=y/sE4xh1t2Cj8E77giYRBaNWrpcKyHc3i8dVPSovTK4=;
        b=HggcovvR0ogFzw+dm8PvFlPesZYlhG5KhXgOaKns7flxoEPrBu2JbFjj1rJ6TylBUY
         grdEZJwUdf8Xt8x/KKOFpBrBeOIxlvRIAkzmjrokl6/A1Kum3J51+xwWoZGyZtEnN0M/
         pBWNiO2rVL2Xx7w8NBxv93DExpYLnn02bNA8fy3tGYc6dqqbaD2IQBCzu7pIqqj2z9yP
         ZRgyB7YwrSGb4TzirAWob2TYmGDLSc7FisDS+xCLyDfmK+EyfAvKzSFXJegZnhpYpt0x
         Ghqc2ZFAS9Snl1W4wohZrcH7c7vQ9Mcpq2GI2OByddPXR3b/pAqdlIWJ7vHUFsfgavdk
         P+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y/sE4xh1t2Cj8E77giYRBaNWrpcKyHc3i8dVPSovTK4=;
        b=iRzxcslb4qfL1KKklUpEg30TD/f1pNJSze+w7vEbANDkT10F0ERUhBYXmxrTaZJS+l
         umy4albJCcGQAvWBthsy7fudPK59jICQbbfo3hHg7CI5zrOFCIFyuA6bGpRdYJV1bDzO
         a+BAQNwFr32V3RtXX3d/l1EzV6SfhvvlvMf/55PruwlIQfJ6jNVo0/DwtCJFxrEnQLTG
         iclp1KWLFFCnySuuqB9gIrBX9oOSHh0NdLYrJUgD80jgK9xYdFP1KjXRoxb7/ssRB75e
         0xfaXaYuntgkMudrjLtQzrYrboH96okloud0Q2o3IzlLJTpMg7M3X7CgOYPIeC9UZdMA
         KoFg==
X-Gm-Message-State: APjAAAUd25jK55ZpIbm6V/x3atem6Uzzz0dNFDS6DIjYibAXpeVSB0SO
        sPEitA08Cq1VV3zorN5GTT0=
X-Google-Smtp-Source: APXvYqy67ub/4Rasa9TpN7ktqWdCOG7h8UEvzxw+QTUrNSPvo1fREyMoMw31xtaDb43AL7S++RClqQ==
X-Received: by 2002:a63:1b49:: with SMTP id b9mr61252160pgm.258.1577558148388;
        Sat, 28 Dec 2019 10:35:48 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id t1sm42242427pgq.23.2019.12.28.10.35.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2019 10:35:47 -0800 (PST)
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
Subject: [PATCH 06/13] mailbox: hi3660: convert to devm_platform_ioremap_resource
Date:   Sat, 28 Dec 2019 18:35:31 +0000
Message-Id: <20191228183538.26189-6-tiny.windzz@gmail.com>
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
 drivers/mailbox/hi3660-mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/hi3660-mailbox.c b/drivers/mailbox/hi3660-mailbox.c
index 53f4bc2488c5..97e2c4ed807d 100644
--- a/drivers/mailbox/hi3660-mailbox.c
+++ b/drivers/mailbox/hi3660-mailbox.c
@@ -240,7 +240,6 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct hi3660_mbox *mbox;
 	struct mbox_chan *chan;
-	struct resource *res;
 	unsigned long ch;
 	int err;
 
@@ -248,8 +247,7 @@ static int hi3660_mbox_probe(struct platform_device *pdev)
 	if (!mbox)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mbox->base = devm_ioremap_resource(dev, res);
+	mbox->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->base))
 		return PTR_ERR(mbox->base);
 
-- 
2.17.1

