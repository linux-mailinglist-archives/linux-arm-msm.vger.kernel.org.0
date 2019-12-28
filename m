Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7ED212BE50
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2019 19:35:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfL1Sfx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 13:35:53 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:52808 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbfL1Sfw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 13:35:52 -0500
Received: by mail-pj1-f68.google.com with SMTP id a6so6130419pjh.2;
        Sat, 28 Dec 2019 10:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=EpYT0fAEZoJoOZIDpiQY1oBPoWcKuknBnZk8A3TEsPc=;
        b=vKiwJbQktB/yDQ3otya9rtDE8p6fqKEysJmAKuEUbVtc7Hp/GlMTlnbHpdHzz+23LA
         K3I/kFAxXFft8S+LDEmic49DQCSn6DnsZQYob/yY+GL3Bi4ZeuqFc0DQb+w1ckRgZ3zb
         pgsvvlp+r2z8BkO4qGkrViUoLKOVflsuwF8egIx0MaPHzoF19frOrVJReh7w373MN34N
         dYuV7tmJaDrie72lcADl96GobSb1c5DNNkIDdw/hCM821qi8JusXrbrd6KseHkIVHIje
         o+PxDKh9YIumZWtaz1bSNUHPoSdfT4o6PQ5zsCEF/oM+PxjaxYThcvTuD1Mgf1lg4MR8
         LG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=EpYT0fAEZoJoOZIDpiQY1oBPoWcKuknBnZk8A3TEsPc=;
        b=UTRHXMnNakrp4rKcdCL9bd625H2TWTDI91//z/YGJC+nJ5DPm4tLpjS8nci2aUU0GN
         mC8RFVhe2onOXf+p0WTmLtk9xTYy7PwviY/o1N7lKQ4TP4banZmFvR7+rZ9lduOr8RbQ
         LWBDcVrxsdb8t5jr03RI1ecUYNTNvKOixtUyiOJa6nPTLtg2yOJRNimPntyhPKa4JalZ
         DiF7ZRiGLx0si1kj31IVSpx2QE+DSge6BHwmevH1SnhN2KLmbFmuMAaR5hj6+hyEbpRt
         bdHg3vDjJe1VeZlX3Fk3OerMnPwqP0yFCWUaPjvci6ZYSbb5T9xnk2V50FsqXxL9fKmQ
         QBkg==
X-Gm-Message-State: APjAAAVhjPXDxpoULNx6DOm2sQpaE28y6GcLZZ6ZJ0vTrQUEkKlmXKsD
        oOQPUWs3fDUy/1f2k1lQz9I=
X-Google-Smtp-Source: APXvYqxaL1bhfI+SzfCWF5xfdSHs4X/qPlTpf9l3TG5tgOk3eb7YlJe0jzmEPnG066uA83lfsS3rzQ==
X-Received: by 2002:a17:902:bd46:: with SMTP id b6mr58947367plx.239.1577558151829;
        Sat, 28 Dec 2019 10:35:51 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id w5sm40623989pgb.78.2019.12.28.10.35.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2019 10:35:51 -0800 (PST)
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
Subject: [PATCH 08/13] mailbox: stm32-ipcc: convert to devm_platform_ioremap_resource
Date:   Sat, 28 Dec 2019 18:35:33 +0000
Message-Id: <20191228183538.26189-8-tiny.windzz@gmail.com>
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
 drivers/mailbox/stm32-ipcc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/stm32-ipcc.c b/drivers/mailbox/stm32-ipcc.c
index ef966887aa15..0a7e9ce0fb31 100644
--- a/drivers/mailbox/stm32-ipcc.c
+++ b/drivers/mailbox/stm32-ipcc.c
@@ -205,7 +205,6 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct stm32_ipcc *ipcc;
-	struct resource *res;
 	unsigned int i;
 	int ret;
 	u32 ip_ver;
@@ -235,8 +234,7 @@ static int stm32_ipcc_probe(struct platform_device *pdev)
 	}
 
 	/* regs */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ipcc->reg_base = devm_ioremap_resource(dev, res);
+	ipcc->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ipcc->reg_base))
 		return PTR_ERR(ipcc->reg_base);
 
-- 
2.17.1

