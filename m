Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBD83547D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 01:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfFDXnX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jun 2019 19:43:23 -0400
Received: from gateway23.websitewelcome.com ([192.185.50.129]:29007 "EHLO
        gateway23.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726269AbfFDXnW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jun 2019 19:43:22 -0400
X-Greylist: delayed 1452 seconds by postgrey-1.27 at vger.kernel.org; Tue, 04 Jun 2019 19:43:22 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway23.websitewelcome.com (Postfix) with ESMTP id 62BAB5A245
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2019 18:16:18 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id YIfChQkE72PzOYIfChlJVJ; Tue, 04 Jun 2019 18:16:18 -0500
X-Authority-Reason: nr=8
Received: from [189.250.127.120] (port=45750 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.91)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hYIfB-000fBA-4A; Tue, 04 Jun 2019 18:16:17 -0500
Date:   Tue, 4 Jun 2019 18:16:16 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] irqchip/qcom: Use struct_size() in devm_kzalloc()
Message-ID: <20190604231616.GA31969@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.127.120
X-Source-L: No
X-Exim-ID: 1hYIfB-000fBA-4A
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.127.120]:45750
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 7
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct foo {
    int stuff;
    struct boo entry[];
};

size = sizeof(struct foo) + count * sizeof(struct boo);
instance = devm_kzalloc(dev, size, GFP_KERNEL);

Instead of leaving these open-coded and prone to type mistakes, we can
now use the new struct_size() helper:

instance = devm_kzalloc(dev, struct_size(instance, entry, count), GFP_KERNEL);

Notice that, in this case, variable alloc_sz is not necessary, hence it
is removed.

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/irqchip/qcom-irq-combiner.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/qcom-irq-combiner.c b/drivers/irqchip/qcom-irq-combiner.c
index 7f0c0be322e0..d269a7722032 100644
--- a/drivers/irqchip/qcom-irq-combiner.c
+++ b/drivers/irqchip/qcom-irq-combiner.c
@@ -237,7 +237,6 @@ static int get_registers(struct platform_device *pdev, struct combiner *comb)
 static int __init combiner_probe(struct platform_device *pdev)
 {
 	struct combiner *combiner;
-	size_t alloc_sz;
 	int nregs;
 	int err;
 
@@ -247,8 +246,8 @@ static int __init combiner_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	alloc_sz = sizeof(*combiner) + sizeof(struct combiner_reg) * nregs;
-	combiner = devm_kzalloc(&pdev->dev, alloc_sz, GFP_KERNEL);
+	combiner = devm_kzalloc(&pdev->dev, struct_size(combiner, regs, nregs),
+				GFP_KERNEL);
 	if (!combiner)
 		return -ENOMEM;
 
-- 
2.21.0

