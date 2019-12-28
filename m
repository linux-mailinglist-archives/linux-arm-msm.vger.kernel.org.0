Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9981712BE5B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2019 19:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfL1Sf6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 13:35:58 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44575 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726709AbfL1Sfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 13:35:51 -0500
Received: by mail-pl1-f193.google.com with SMTP id az3so13017475plb.11;
        Sat, 28 Dec 2019 10:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wHDWNkKUY/7HcK7MqADsWD8av4WLf/lhpq+f70oOVx4=;
        b=Nyg2CImHIlC00wE5qnxxCd4xvhYPSTqURjgeLIlpMMiH+Hv5taQKrd8r720IzIBAGR
         nZRD2oKDccKM/yuGWeJRcmnj2+SYaO0cStDR4fRrmidSo76bcIhoTbCfYR0PlGyb2fFd
         emyVPlFXLJi9tObOLVe+/5iePjUhXIrC39i3wjkLInXeLkqTHHH4cYIueyRGCiqVVpT7
         oqEep1j22vmUS8N8PkBcEdMibggLi1RMRklHW4jnAP49yx6KEcvqsAFIoG939aoRxKDH
         EFq2ycJTA5aeOUf2Y1/Bge3TG8s9hNorF0D2GyfxQRa3Od50CwHYL7+JIMw4qmOOS3xM
         G/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wHDWNkKUY/7HcK7MqADsWD8av4WLf/lhpq+f70oOVx4=;
        b=ZYqR4mIQzrWQnzMMNPokRfbzGcg4w11OPiDw9tjj00fX3ZWbC1w+Y/vam8zoo25vME
         AHHZ2oI5vP8YquCpTDbyhIUaHbdz57aSZhHqXUOzeosXoEVXApzzXc/nzWA8IhYwTcxq
         oXAHGaj9UhpiS1NzJN18ofoN1VYVEXEYEOIs3ooMCLSb2XSSY9iZOlG1dmRCZGszitQS
         1mUv9EfAgZL0weiHB1zttaBqYB4Wl/OCLry1d2ojwNZYPWLDogm84WQ5kzvmNupsFuAb
         nahR2K5cU5TrTzDDwmHf/u0J/S3BMws9m6kWxwCUhQHqDcLP5DuWcC868+gVmfn7kFnM
         lDmg==
X-Gm-Message-State: APjAAAX5fsrhwkzC4e6q+F1yEL0lTmXF8B1xZhGvlDU76JtcKNdfoWnQ
        VLZ52YvazAwCh+8BoazAHYk=
X-Google-Smtp-Source: APXvYqzg4HSZcS//Fgz3qJ6tuCit2iLqCHRWiMt5cWev8Yt8+UHZ0o3AuJy9vdLOuNpfASdbLD8YRA==
X-Received: by 2002:a17:902:b187:: with SMTP id s7mr59226454plr.104.1577558150166;
        Sat, 28 Dec 2019 10:35:50 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id n7sm18754871pjq.8.2019.12.28.10.35.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2019 10:35:49 -0800 (PST)
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
Subject: [PATCH 07/13] mailbox: platform-mhu: convert to devm_platform_ioremap_resource
Date:   Sat, 28 Dec 2019 18:35:32 +0000
Message-Id: <20191228183538.26189-7-tiny.windzz@gmail.com>
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
 drivers/mailbox/platform_mhu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/platform_mhu.c b/drivers/mailbox/platform_mhu.c
index b6e34952246b..a5922ac0b0bf 100644
--- a/drivers/mailbox/platform_mhu.c
+++ b/drivers/mailbox/platform_mhu.c
@@ -117,7 +117,6 @@ static int platform_mhu_probe(struct platform_device *pdev)
 	int i, err;
 	struct platform_mhu *mhu;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int platform_mhu_reg[MHU_CHANS] = {
 		MHU_SEC_OFFSET, MHU_LP_OFFSET, MHU_HP_OFFSET
 	};
@@ -127,8 +126,7 @@ static int platform_mhu_probe(struct platform_device *pdev)
 	if (!mhu)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mhu->base = devm_ioremap_resource(dev, res);
+	mhu->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mhu->base)) {
 		dev_err(dev, "ioremap failed\n");
 		return PTR_ERR(mhu->base);
-- 
2.17.1

