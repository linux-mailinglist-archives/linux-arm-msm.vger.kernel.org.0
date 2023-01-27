Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C87667EF8A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 21:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjA0U2H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 15:28:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjA0U2G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 15:28:06 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E81913518
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 12:28:02 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so6143858wml.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 12:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E36sg80cHuyRt0XGtoLq9DTjdMzSXiI8iQQN7CENzSA=;
        b=r9y9DJaKCGGii9qXCniQ7ae7UoZsPcGFTXpyZ4XcO7FToGCeApaKLsS+z2rIMJ/IVy
         CRGHdjFf2P4YPlNhIFErtdSd9ryNfQlV/QIO3yJdDscd3tF6umznqgddgokHPJIP3B0R
         ftI3FtJcCDhZ1xRP54MYAY9jhFm2xYBk+MKBvh0PfiCy3HZ4ddfVRoqUk1136ZGoQKdg
         xHQXKDzT4p1q54glFMlJ5JqGpWsqPGi/u2cowQCmeNqc7xzRnelvjXpqWi8mp6DPIWGj
         IPuvlDZxHYX58EAvB6Os1RidiQ/CclZFt8A/RZftEPNZxsYhE9e2NDR8Q5XA/ymJh/UM
         LujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E36sg80cHuyRt0XGtoLq9DTjdMzSXiI8iQQN7CENzSA=;
        b=0bJn3rLCy7a3Eefi3rXKuDpUOtqJRTQFe7YaZWaArrwyNARtW8sHwxUu1LNmf9wqtY
         DN/7hgS2/0QcMe6jZo1eaSkVsDu7Lt8BCUN5zgKjQ4HB4eR1Mjf7mRaV74EOzK1pME5a
         hJLTb8oykjosmKehVa4SKkrVqKJSKK+xZVcqiBQS7cnmkCuSjKJU3cQCTLIZS3Qwr5qg
         E84G5VNXCta3yQ+I2AKYepnpC38wwBxHe3gdQQEP0x9j40tfmZYpszeXiFOotUqkWctU
         8QChvi+mY7VdYvbwKtheeCZqW+1buBS1pUYeH/X06oY/fHf9XIW62ZMCgivKZRW1KbIa
         TDZA==
X-Gm-Message-State: AFqh2ko0zRRMc9voJw4aJbBZr5H0le0f95llTw71BVIuQD+FG9kvrtVD
        S/tKdjQc/VZmRX2Q8vdxYbO/mA==
X-Google-Smtp-Source: AMrXdXu/50ah/BTrwPVEMgEt0G96C4r5Q5YlMv/QfqVvKscWkfCDovsrSso0O5kPHDfOQKym/6OyFg==
X-Received: by 2002:a05:600c:225a:b0:3d3:5c21:dd99 with SMTP id a26-20020a05600c225a00b003d35c21dd99mr40514413wmm.18.1674851281070;
        Fri, 27 Jan 2023 12:28:01 -0800 (PST)
Received: from lion.. (cpc76484-cwma10-2-0-cust274.7-3.cable.virginm.net. [82.31.201.19])
        by smtp.gmail.com with ESMTPSA id f21-20020a5d58f5000000b00236883f2f5csm4836124wrd.94.2023.01.27.12.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 12:28:00 -0800 (PST)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     Alex Elder <elder@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc:     elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: [PATCH net-next] net: ipa: use dev PM wakeirq handling
Date:   Fri, 27 Jan 2023 20:27:58 +0000
Message-Id: <20230127202758.2913612-1-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace the enable_irq_wake() call with one to dev_pm_set_wake_irq()
instead. This will let the dev PM framework automatically manage the
the wakeup capability of the ipa IRQ and ensure that userspace requests
to enable/disable wakeup for the IPA via sysfs are respected.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 drivers/net/ipa/ipa_interrupt.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ipa/ipa_interrupt.c b/drivers/net/ipa/ipa_interrupt.c
index c19cd27ac852..9a1153e80a3a 100644
--- a/drivers/net/ipa/ipa_interrupt.c
+++ b/drivers/net/ipa/ipa_interrupt.c
@@ -22,6 +22,7 @@
 #include <linux/types.h>
 #include <linux/interrupt.h>
 #include <linux/pm_runtime.h>
+#include <linux/pm_wakeirq.h>
 
 #include "ipa.h"
 #include "ipa_reg.h"
@@ -269,9 +270,9 @@ struct ipa_interrupt *ipa_interrupt_config(struct ipa *ipa)
 		goto err_kfree;
 	}
 
-	ret = enable_irq_wake(irq);
+	ret = dev_pm_set_wake_irq(dev, irq);
 	if (ret) {
-		dev_err(dev, "error %d enabling wakeup for \"ipa\" IRQ\n", ret);
+		dev_err(dev, "error %d registering \"ipa\" IRQ as wakeirq\n", ret);
 		goto err_free_irq;
 	}
 
@@ -289,11 +290,8 @@ struct ipa_interrupt *ipa_interrupt_config(struct ipa *ipa)
 void ipa_interrupt_deconfig(struct ipa_interrupt *interrupt)
 {
 	struct device *dev = &interrupt->ipa->pdev->dev;
-	int ret;
 
-	ret = disable_irq_wake(interrupt->irq);
-	if (ret)
-		dev_err(dev, "error %d disabling \"ipa\" IRQ wakeup\n", ret);
+	dev_pm_clear_wake_irq(dev);
 	free_irq(interrupt->irq, interrupt);
 	kfree(interrupt);
 }
-- 
2.39.0

