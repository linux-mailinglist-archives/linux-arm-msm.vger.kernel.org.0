Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8D512BE6E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2019 19:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726653AbfL1Sfr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 13:35:47 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39844 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfL1Sfr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 13:35:47 -0500
Received: by mail-pg1-f196.google.com with SMTP id b137so16046830pga.6;
        Sat, 28 Dec 2019 10:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=u+WdsyKuKa5bxoF7O7EsreiiwOikxQI6yqVLLirGymc=;
        b=MOQRbWcFusjgAy4ALA0dRNwculnnf95IqWhwN+bI2m3VphYLVZFzUqdeNUJcfF7thl
         8Oo9SDyajObSomXnWDn4kLV7+lz97x8nR/7HN4y5d/JmKKCsuEl1aQrwGrxxU9hi3YAG
         tjBb4iRdN/pj3HarVM+/KzxZkLjXXEHQI+yH/sRvbCys5nO4SWzv7rqdNHrZiyIl2vxo
         TImjGbjwLoYHAfaIsoFlFP4cRJGFO/7eHgxPe1zcjmgBTBwhWCibX4aYc2ek2vXwbxIE
         TciifP5yqkjOxQ6NYC3r438SclSN9iySvH5xd3vVkdWVNV3WTs5Ssh2mceJPkuJNepf3
         +KUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=u+WdsyKuKa5bxoF7O7EsreiiwOikxQI6yqVLLirGymc=;
        b=pT24kAy90C44QgunUrbd5Hk8LspSfkJZ1LKy/79qvjq76gtJURJQPFIjWUIgJjkHGl
         3N9Pzn63viu5PoaxpkGM29QibyCH3YbxFSepicvQeL45hnciLX8+RcZLGnOd3NWSjjrs
         zs/3RNiaNW5VTpZ3h35C4AvYXJLa/0V7bKh2Se7XpXicqJrfEw8YLi1LvryCQeI9A3yd
         2w5F4FBEN0P998rcveIe9di0d6QKejPSU+hkJx0mJghPKJs9h9qZHyNfcyhK6/ZS9Lll
         wSZb2JE3dF3F30hZuFwy5aN8H2SKgM1XBMbY0tSZYNkX8oerxQTIBgfkCLGNtb9NdzSi
         XPjw==
X-Gm-Message-State: APjAAAUXvdx8Xgm+YaXPy6rr/nq/oi0pYS2wiZZcinrR5W/K24ROEg6X
        1WrXvkUOMYoBqEH6GGUre+E=
X-Google-Smtp-Source: APXvYqz2FR0K8hzJVrRbKbBnQhFSr/aRNMbMRVtI8SoK2qjVYEADTjjwXnt98+L2VAfYvOqI5TwzYQ==
X-Received: by 2002:a63:111e:: with SMTP id g30mr63255423pgl.251.1577558146603;
        Sat, 28 Dec 2019 10:35:46 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id 7sm35621652pfx.52.2019.12.28.10.35.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2019 10:35:46 -0800 (PST)
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
Subject: [PATCH 05/13] mailbox: bcm2835: convert to devm_platform_ioremap_resource
Date:   Sat, 28 Dec 2019 18:35:30 +0000
Message-Id: <20191228183538.26189-5-tiny.windzz@gmail.com>
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
 drivers/mailbox/bcm2835-mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/bcm2835-mailbox.c b/drivers/mailbox/bcm2835-mailbox.c
index 39761d190545..79f93c9c7682 100644
--- a/drivers/mailbox/bcm2835-mailbox.c
+++ b/drivers/mailbox/bcm2835-mailbox.c
@@ -137,7 +137,6 @@ static int bcm2835_mbox_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	int ret = 0;
-	struct resource *iomem;
 	struct bcm2835_mbox *mbox;
 
 	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
@@ -153,8 +152,7 @@ static int bcm2835_mbox_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mbox->regs = devm_ioremap_resource(&pdev->dev, iomem);
+	mbox->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mbox->regs)) {
 		ret = PTR_ERR(mbox->regs);
 		dev_err(&pdev->dev, "Failed to remap mailbox regs: %d\n", ret);
-- 
2.17.1

