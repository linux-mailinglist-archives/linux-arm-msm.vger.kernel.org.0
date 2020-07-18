Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE788224759
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jul 2020 02:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728817AbgGRAGx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 20:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728805AbgGRAGu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 20:06:50 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A8EC0619D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 17:06:50 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id a8so7999403pff.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 17:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=cSGrpEWuKSVf97iW7EL4KZRFYPfb7+inZKxBuLQuvAE=;
        b=oFBiOJFotgQsYiohUpKbkZXbMk0anIOETUAPGMRKbKBtkpfPEd8xLg6XTAXbyZcfoi
         BwNvvIaw6/t2CBTYGbvsBkLGxWK6++vWST3Aj1KHKgiLKceg0RQ/9jN9Ao2iWcVkzj7h
         2Q0AYvvuyzQfl95ZIplngHYn1lLuX9YOT4GvpS3gMS4mvYXyjnqEy+kxckIutRo4ELHv
         PD8Cy2kj4InW3oDPlbSPrZZ65B1YVO/rND51vigqVYZQjN2CHT4NeULpOgwFAekw8cce
         JpLLDWTXvh8nLo3nGfEzbkbAHILC+wrXQ/qljDHEhrL2d39+3a69ylcOh6DBU7A+ud7z
         0n3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=cSGrpEWuKSVf97iW7EL4KZRFYPfb7+inZKxBuLQuvAE=;
        b=dqGedn0FHOPS+0VCMSNNFAjYPSkhpgXrLEZPII8De45mOe32obNa6P7Ql08o7vCsjn
         vPiUrrfjTOyTq7aSIdXvxjKbYu8XGsOFHWCJ/AFM/UUbcmc2il5OFqmyLyQWWeK+YzPe
         k+Ao8AgbEFK0P3hrFmrHlNHZbgfitHf8ASJLPOKe23av3jm674GekqhRHNPn/cWybhYL
         C87hRiys+YLgjqrzDm/htCPgnAmZRf+qfNDjVgOkpssZVgGHbX/3lI83sri6F/gLH7Kc
         5jl9eC4cmHPM95YYM1pHDc+B1z0tCB/xHWOabA2Kc7gys38J32pyqyVo2elZTMnG1U/g
         e25g==
X-Gm-Message-State: AOAM533XdJX0Q1e7ZNp5clDzf5ILVbE6rNBHr8Qh0E4juBGoBTcXMZO3
        /v4tF6qSaU9j2uuWBXmHG9nHHCJHGvuvT5I=
X-Google-Smtp-Source: ABdhPJzKJZr8KDd4Yo0Wm5lo4eKhPkLN/TRhN4fCypWCbhR0OyB2ssX8VqDuXN35b/Dzh+f6roB+vXsTyHzgnyQ=
X-Received: by 2002:a63:7d16:: with SMTP id y22mr10135672pgc.136.1595030810200;
 Fri, 17 Jul 2020 17:06:50 -0700 (PDT)
Date:   Fri, 17 Jul 2020 17:06:37 -0700
In-Reply-To: <20200718000637.3632841-1-saravanak@google.com>
Message-Id: <20200718000637.3632841-5-saravanak@google.com>
Mime-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH v3 4/4] irqchip/mtk-cirq: Convert to a platform driver
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
 drivers/irqchip/irq-mtk-cirq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-mtk-cirq.c b/drivers/irqchip/irq-mtk-cirq.c
index 69ba8ce3c178..62a61275aaa3 100644
--- a/drivers/irqchip/irq-mtk-cirq.c
+++ b/drivers/irqchip/irq-mtk-cirq.c
@@ -295,4 +295,6 @@ static int __init mtk_cirq_of_init(struct device_node *node,
 	return ret;
 }
 
-IRQCHIP_DECLARE(mtk_cirq, "mediatek,mtk-cirq", mtk_cirq_of_init);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(mtk_cirq)
+IRQCHIP_MATCH("mediatek,mtk-cirq", mtk_cirq_of_init)
+IRQCHIP_PLATFORM_DRIVER_END(mtk_cirq)
-- 
2.28.0.rc0.105.gf9edc3c819-goog

