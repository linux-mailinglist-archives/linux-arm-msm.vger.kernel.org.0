Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D9F224758
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jul 2020 02:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbgGRAGu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 20:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728768AbgGRAGs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 20:06:48 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739D6C0619D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 17:06:48 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id d202so13332125ybh.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 17:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=9lliIP397BkHUMIYOIiz1lmKlM09rTtKqti3dJZq5NI=;
        b=Pc3OXUSRMtC51Xe5/XMfqVgGHTzqEztWThvDswR20yBvK4q20Xw3ZNE+8dkR19OmDD
         gDksFj5HOd268anWSSimT3Gn9d+v7SfcYJjjCEJY6k3KED8/Qg0cUFL25Q3MLk3u6WzP
         6SQOsdECq3m8nfn4B/G+qcw93FKsucGX6KBj42CnWiZKaOz2sMFI1iIBqIg8B/YnRj6U
         VozP0QbaLKiXIdIxryY+7xaJJEGEd8+z9ZmQZXSjBMWae0vTANsynMnqxGRMmmAY2Nz7
         y01D9HdzUEov/4to4JpMNjFHQb5ZWpIPNEGfCjmvUCtCL/gSUXe19cgBOBtkE/HRrupU
         dKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=9lliIP397BkHUMIYOIiz1lmKlM09rTtKqti3dJZq5NI=;
        b=K2j4z4Y2GK71U+iFPtgVjoV8IFZDzw8bTVbMzBrgB7bTGoECxSZsn6JL7ZAodSHYvk
         uDcWLAgg8G7HZyuUAynyXTPROgNhcqPq8dNFbPB7t8slTedi3+EDEPtATdc3x4CBc5Kv
         Tq59QPZVnrbBahYTKNUFFC6hphqIMS6EtLwrwKZG8ZnJSCxir1uDiegOsHYaQFyVoB7r
         xs7f7GNqJOG4UIyI0qmpSAjT9CZTq6TDL/MAJjl9Dt3M/+6v0LxbWmbEKBVUEX4ZM+I7
         X7HtuzGCN6C+Sni8tSdjz85rqVUaGA2ivbsGpely5XsTxaOxImwLTDmQW4HYfrtXVqKo
         XViA==
X-Gm-Message-State: AOAM533A2Ev7Vn4GRqysH0GCbWOS7iCPvrEcy4F4qiW5G4sJ/WWrPp2h
        8x4waWWt6J11OZHqKfmIK3UPHucHFV9CL1U=
X-Google-Smtp-Source: ABdhPJzaoGGT2QOhK85hcWY30M8zasDny3EJDQN0UI4RBnyRl5EEGtO+6Y9IPCYksqge9OpTXg7V9ykOWjui2KA=
X-Received: by 2002:a25:abc5:: with SMTP id v63mr17904281ybi.148.1595030807668;
 Fri, 17 Jul 2020 17:06:47 -0700 (PDT)
Date:   Fri, 17 Jul 2020 17:06:36 -0700
In-Reply-To: <20200718000637.3632841-1-saravanak@google.com>
Message-Id: <20200718000637.3632841-4-saravanak@google.com>
Mime-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v3 3/4] irqchip/mtk-sysirq: Convert to a platform driver
From:   Saravana Kannan <saravanak@google.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Saravana Kannan <saravanak@google.com>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>,
        Hanks Chen <hanks.chen@mediatek.com>,
        CC Hwang <cc.hwang@mediatek.com>,
        Loda Chou <loda.chou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This driver can work as a platform driver. So covert it to a platform
driver.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/irqchip/irq-mtk-sysirq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mtk-sysirq.c b/drivers/irqchip/irq-mtk-sysirq.c
index 6ff98b87e5c0..7299c5ab4d10 100644
--- a/drivers/irqchip/irq-mtk-sysirq.c
+++ b/drivers/irqchip/irq-mtk-sysirq.c
@@ -231,4 +231,6 @@ static int __init mtk_sysirq_of_init(struct device_node *node,
 	kfree(chip_data);
 	return ret;
 }
-IRQCHIP_DECLARE(mtk_sysirq, "mediatek,mt6577-sysirq", mtk_sysirq_of_init);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(mtk_sysirq)
+IRQCHIP_MATCH("mediatek,mt6577-sysirq", mtk_sysirq_of_init)
+IRQCHIP_PLATFORM_DRIVER_END(mtk_sysirq)
-- 
2.28.0.rc0.105.gf9edc3c819-goog

