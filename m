Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA5C12BE6D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2019 19:36:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726853AbfL1SgO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 13:36:14 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:43904 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbfL1Sf4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 13:35:56 -0500
Received: by mail-pf1-f196.google.com with SMTP id x6so15232559pfo.10;
        Sat, 28 Dec 2019 10:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ui3H4sw6TXQZWyHZyumXfMS536ZRAUjdYlFCGuvHxAE=;
        b=QR/5gU3bd29uWtBlob2vq9WqKJ3hQUz+QbCW77CdxMCDaWVnA0C/c5Lx8ui8kEF7E4
         EJow2hD7opQrUZ22y3QHevj4gAvdDrI+hipJ2NNfxEZsOyHb444K1XGg/QZQJkKNH9n6
         hDfRLiS1l0jR5Krj2XWoSBuz5HpaMLXUGGuvcRI/vccwwizylRM35WopdZZg925EqhPy
         n0e08sqtH3zgT/f3gSypGJpdp4GCNnBueiPK26DJIb3wHYNUPrqr+S/8LRhfKekIp3Ev
         qRbJwKA7g1M6NqZUbhNvwoZPWSdTsI5x1Hy7jNncmQnUGUXYbl1tupuGX/2eLm0XD5Ny
         hmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ui3H4sw6TXQZWyHZyumXfMS536ZRAUjdYlFCGuvHxAE=;
        b=njHo1OL1fZZIPqBXGNJxQ3cuflRpUJ63Tdytq1Dy6Nfloi1VZBaeDvSG0Vh4c7wOjz
         PtGPAmYM3Fw9lurVB1pB+QAXWh3ntxCfHkyhiGcQC2VfOskn1FZ1PLmtY+slON4CJFUX
         x3nSjcdE57+UqCvZQ7OmGTTZZq63kuoIlvNm+PtkuKqY2tUgFMlorMDLTqgaMSWITDg8
         OFTe0eE5BnQ2XqkAQqrfPNmtkvz6q4MCu5H6AzW9QYHgqSW5EPE/ABbqqMaLQBYtZg6K
         RJAlFYjIp+tqu8dIv6/fvIiW1LzMNkn1z8hfShrEAbNkqkNQolESrLS/MSzZ0r8pz0qG
         b8MA==
X-Gm-Message-State: APjAAAVqs9Wl4/rfdTfMO/z02Re7i97AkUo8MW1pOPYLj5aZkLkoArp1
        rYJBH6+Ey3ro7WtzPxa6yvg=
X-Google-Smtp-Source: APXvYqzHr4KeI0b8gMJWBokRn8PKrEYYqhG+ocElUlfVhzxi6A9/q0OMkXH/noLIQBQBJ/jS6urxWg==
X-Received: by 2002:a62:ed0b:: with SMTP id u11mr60416235pfh.46.1577558155293;
        Sat, 28 Dec 2019 10:35:55 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id w187sm27832830pfw.62.2019.12.28.10.35.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2019 10:35:54 -0800 (PST)
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
Subject: [PATCH 10/13] mailbox: tegra: convert to devm_platform_ioremap_resource
Date:   Sat, 28 Dec 2019 18:35:35 +0000
Message-Id: <20191228183538.26189-10-tiny.windzz@gmail.com>
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
 drivers/mailbox/tegra-hsp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 834b35dc3b13..6d16e56942ff 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -631,7 +631,6 @@ static int tegra_hsp_request_shared_irq(struct tegra_hsp *hsp)
 static int tegra_hsp_probe(struct platform_device *pdev)
 {
 	struct tegra_hsp *hsp;
-	struct resource *res;
 	unsigned int i;
 	u32 value;
 	int err;
@@ -645,8 +644,7 @@ static int tegra_hsp_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&hsp->doorbells);
 	spin_lock_init(&hsp->lock);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	hsp->regs = devm_ioremap_resource(&pdev->dev, res);
+	hsp->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hsp->regs))
 		return PTR_ERR(hsp->regs);
 
-- 
2.17.1

