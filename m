Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20D5E12BE72
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2019 19:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726603AbfL1Sfq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 13:35:46 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44619 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfL1Sfp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 13:35:45 -0500
Received: by mail-pf1-f193.google.com with SMTP id 195so15455016pfw.11;
        Sat, 28 Dec 2019 10:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=hqSfykticrVROnPZePmOru2pp1VCz0LFD/v0VexrqBA=;
        b=TN5UMyKtGRFA9r24t/ZYgRXLOw/LCoKmhLVbbsgo4/9YAbF01PPDODx3Tg5TIqMice
         9+t2T8Cz0hK+BqG+Xyey3W3XOXnNK/H9hEE7XXjFeftyMBA2os7fKbrgmOF3Uf5qv4wY
         Kad1ZksLn7TWdjNFT78COriJqMCYMQlUSNkosa2FmFDxWXLUSMcitCKdiboBnxd0zQWr
         hi88HS+npw/ogvjqq/+jY0hby/cENDfini7neUTe9xDcEijGSkGIfMgDPXTucJ+luVYd
         g5QYLr1IVKvSeLPoTvbnpyRgJMJu43ss8Kly5/kDA+r+v1DElUws4jNDk1dao/QCykbv
         jxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=hqSfykticrVROnPZePmOru2pp1VCz0LFD/v0VexrqBA=;
        b=iiKvZfjaifAXr+pbem5ned0VqFj6B97ryWgr8rmqoLXngJj660r7Se2/j8ne7WhxgE
         oOy+ZvAlK/IPKmpZuHGcWg67F1wWmzyRVu5Ps7uNLQhJoB1WuZwkcNxM9oRBcQm6f6PF
         aDafIBqrkUs75W+XCHO1KUSVz8jVt63PHrZT5s/UugY3qNWOH4XVo4JKCCR4k6t33noa
         97Be+zVSDqxIEl4F8hvPW3tdZbx5ieDtlb49qUH6/ZpxYvWLa25/Mhc8LU+E9qdsRqSL
         o0CGBZSvz/rmhzFso0tMrNmWsTSrvlpiIGuH9mr3J9k+tfCzvNqsXfJu60MPO8G9ArH4
         W8FA==
X-Gm-Message-State: APjAAAXdNaws+QxC/3FgH8sWWIbdPagn6nOt5d7/LjpXtvZvD0joK+yy
        EO1jVjh6kHpMEqXAMVPk9Mc=
X-Google-Smtp-Source: APXvYqxhLmtho2czElmGfzLozaAqFNdvpPt2BmXqglNEJ0AN6V99RjBsDbUR/heJgBjeBiaCFQdPeA==
X-Received: by 2002:a65:621a:: with SMTP id d26mr59969401pgv.151.1577558144795;
        Sat, 28 Dec 2019 10:35:44 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id k190sm42068720pga.73.2019.12.28.10.35.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2019 10:35:44 -0800 (PST)
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
Subject: [PATCH 04/13] mailbox: mediatek: cmdq: convert to devm_platform_ioremap_resource
Date:   Sat, 28 Dec 2019 18:35:29 +0000
Message-Id: <20191228183538.26189-4-tiny.windzz@gmail.com>
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
 drivers/mailbox/mtk-cmdq-mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 9a6ce9f5a7db..7f9e34b021c8 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -458,7 +458,6 @@ static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
 static int cmdq_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct cmdq *cmdq;
 	int err, i;
 
@@ -466,8 +465,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	if (!cmdq)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	cmdq->base = devm_ioremap_resource(dev, res);
+	cmdq->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(cmdq->base)) {
 		dev_err(dev, "failed to ioremap gce\n");
 		return PTR_ERR(cmdq->base);
-- 
2.17.1

