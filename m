Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE5312BE49
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Dec 2019 19:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbfL1Sfo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Dec 2019 13:35:44 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:35005 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfL1Sfn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Dec 2019 13:35:43 -0500
Received: by mail-pl1-f193.google.com with SMTP id g6so13039838plt.2;
        Sat, 28 Dec 2019 10:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fo5K0TPliEV99faGCrDAtoXjqd/u/f/pgI4tXILZggE=;
        b=bwDm/LYmefFJ+yrVjqwVqleBC+dVr4zFymT/XmDlSRZmDs39PHAJyYv6Rv/syLbg3+
         k70t6WZ4z+KBbkrD/38bHo0vozwx9mUI3ZZIU1WjRz++gkUPTiBVpANkWy8hRJUtQooc
         5AsLJzpS+cDTcgox6s63deyucKFJQl20XFFo2aWRMMKTn3Ey4qiZ73EQ8X4HF+u/Szoq
         AxTNjN4C0e7WRtsEJTwEXB59yZ3b/EFo+PVSwD2JJNujM3Jo65fFFlkCFCkkCWxz+MKe
         vTUL7DOlgV/vSe9n4Z8/QrDaA/8AGjRG/35ydwEpQOWUjA6MPMm6rLT40g4dCeGdRt78
         l5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fo5K0TPliEV99faGCrDAtoXjqd/u/f/pgI4tXILZggE=;
        b=Xj3Q2kUWZ5vSLHsZnxRBsZNHByaJuAQ1F1kA+2w+yVViNvBy+u+i2H1jUNltizDZ31
         uz4Fgk5GeoYQ938Vm0bx+w+3g6XGjRni/j9hCUtR08wV1mGErVUvTa4+erOwlaAjnka2
         zN/fGMg8pKsGCKD/vX+IW6anBF+MHygZjsaoXu8c5OQxHM4Qw5ubO2Ud7CSd/IPkfGjb
         Sy4WKl0SZS/0as9ruIdzYREhVVhbY/aqhLuOIUr8ulrsHDuBOEjY+4Fr20+Uwv+EPjCB
         f0a2Jx7WbPBLO29oKy75AFGAKm7CdWL55o0Q7NwDi7YWKZytke1ERna02w9QqT7tKvsJ
         CJhw==
X-Gm-Message-State: APjAAAUyiFB9WpDVnKt8kuMYv0oXi6VRQbKfCA5NZ9iYVOcQukm7Dego
        mMW0naxCpFdVi/E4b7aiQrg=
X-Google-Smtp-Source: APXvYqwUmRdS/j5Ko1syf2WgkT7LxHN76wS8zqcKdPBh656bSiwfHZJ5FFjisEcSZu9ospl02un4HA==
X-Received: by 2002:a17:90a:a881:: with SMTP id h1mr34064320pjq.50.1577558142809;
        Sat, 28 Dec 2019 10:35:42 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
        by smtp.gmail.com with ESMTPSA id u18sm42980854pgn.9.2019.12.28.10.35.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Dec 2019 10:35:42 -0800 (PST)
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
Subject: [PATCH 03/13] mailbox: qcom-apcs: convert to devm_platform_ioremap_resource
Date:   Sat, 28 Dec 2019 18:35:28 +0000
Message-Id: <20191228183538.26189-3-tiny.windzz@gmail.com>
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
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index eeebafd546e5..0faf69137780 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -49,7 +49,6 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 {
 	struct qcom_apcs_ipc *apcs;
 	struct regmap *regmap;
-	struct resource *res;
 	unsigned long offset;
 	void __iomem *base;
 	unsigned long i;
@@ -64,8 +63,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 	if (!apcs)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1

