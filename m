Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CED2F12BE64
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2019 19:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbfL1SgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 13:36:14 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36080 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbfL1Sf5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 13:35:57 -0500
Received: by mail-pg1-f195.google.com with SMTP id k3so16058867pgc.3;
        Sat, 28 Dec 2019 10:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=D52kDZpItpEgyWtODzvm9zhNNB9VSkcFYK/HjZsI8Go=;
        b=buKvAITmrchkgml3RJ6rno8p2jfN0GrgBL0OBWLGNScbzpz89Wi31X8nu5grIh2TgZ
         +HeBPzjiNWMSmpky1ys0RIWzNzfxJLuwU2j1XKXIureYlpNYyTZJarlNQPpIRI8CeuaV
         W/0IZLMK43cqLRqwF3LLOSsNZZmiNVCn+uAqIAmbhe1FMs27Qc2orshWchJEj+FMmRG/
         WXNwA+UN+8BKCgsvXgClCPwvuKrNhpd6KzTi7/b2ysycQ/Fh+sYggOJicyXnAVkoQrO6
         rSn4FFH2EFrTKI2MY3LxbeaxoxC927l9BGsCFCHMh0+roRj1Wmjggspkn1KcA80ND6Jp
         TNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=D52kDZpItpEgyWtODzvm9zhNNB9VSkcFYK/HjZsI8Go=;
        b=uJ+Y1gbDS2xZUY8lWQRpqrmk56kAEEwOoDDGvCQuKhyhPB3R0dzMVqjaI3Rnh7UdD5
         IUYeGqB5cZGmSIg7EVRoNJhCSfp3U4Gf82ElIXNDLwxrIB9EHpbeesqXlESzTshlSxKE
         P22xxvBVQX0XStBfBR0hepj8KHFiARkD5Cag1YaB124sPuVjw0CCk3V5GtoNOsu9R1O8
         MYkNxBXqMq0u6WIrE0fjoNlQie/+c+Vd9DCQNMJEV+4P+flZCSNWyTYXVC8JNa5OR8IH
         Ow08VErB2qSHEfHDZatgmGFmW6CFIGDB+VHkBMnT5LDXnYE03qB4H6BTQ/6jSzRMpsc8
         f9sw==
X-Gm-Message-State: APjAAAWwoDvFD7dq2XahdvHEH85zZc8tbEFvMy4wu4nQAv+mmv36QxzK
        Yr045t/JJAau+kiwlpVle4M=
X-Google-Smtp-Source: APXvYqxRDjC1yrZLagxhy9lKRDbplLhgf+LIWifgAoLN74eEtUbWySnjvGyIR5MxLdy/F0goyOL2Xw==
X-Received: by 2002:aa7:968d:: with SMTP id f13mr59926148pfk.67.1577558156956;
        Sat, 28 Dec 2019 10:35:56 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id f43sm19419481pje.23.2019.12.28.10.35.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2019 10:35:56 -0800 (PST)
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
Subject: [PATCH 11/13] mailbox: hi6220: convert to devm_platform_ioremap_resource
Date:   Sat, 28 Dec 2019 18:35:36 +0000
Message-Id: <20191228183538.26189-11-tiny.windzz@gmail.com>
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
 drivers/mailbox/hi6220-mailbox.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/hi6220-mailbox.c b/drivers/mailbox/hi6220-mailbox.c
index cc236ac7a0b5..d9140a016170 100644
--- a/drivers/mailbox/hi6220-mailbox.c
+++ b/drivers/mailbox/hi6220-mailbox.c
@@ -264,7 +264,6 @@ static int hi6220_mbox_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	struct hi6220_mbox *mbox;
-	struct resource *res;
 	int i, err;
 
 	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
@@ -287,15 +286,13 @@ static int hi6220_mbox_probe(struct platform_device *pdev)
 	if (mbox->irq < 0)
 		return mbox->irq;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mbox->ipc = devm_ioremap_resource(dev, res);
+	mbox->ipc = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->ipc)) {
 		dev_err(dev, "ioremap ipc failed\n");
 		return PTR_ERR(mbox->ipc);
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	mbox->base = devm_ioremap_resource(dev, res);
+	mbox->base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(mbox->base)) {
 		dev_err(dev, "ioremap buffer failed\n");
 		return PTR_ERR(mbox->base);
-- 
2.17.1

