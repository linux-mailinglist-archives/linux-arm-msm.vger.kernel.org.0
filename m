Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF26411A85F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2019 10:58:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728848AbfLKJ6m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Dec 2019 04:58:42 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45828 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728743AbfLKJ6l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Dec 2019 04:58:41 -0500
Received: by mail-pg1-f196.google.com with SMTP id b9so10123348pgk.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2019 01:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OXx9XO53uVwi3ak33l4H3Z3fkUzEjfR6oeMiOmgyZYM=;
        b=I0d3LklYC8p3N+I8ufKTUua0HdRPrRWT2UM79MwNgcNWopaJgAZoM5w608Sn2fEArm
         0B8kjBtprDc2SBjxf8O4R5JxQVH9T6msgIwr64CLTWSnwmCGPDCSoLS7urmCtycp2ob3
         SnFRYSPVGmEhhSTi4m5XwvIONSxoVrHybqJXmHv+OUzLa8yra6MXqS9j9Fdw/hAyKfmC
         vTK4sew6blqVyKjxv/Rl5jZOsC2H9lOMwpxqVJTdKe6JJ4D1/ydXHAPzK6Ik0AO3WcMa
         x9INvVeJcY6vbd1eBd4/iYus2wDImrH64Obl9gWzGJbZkn4gjn3YzXTy2xkKF2348OMU
         7R+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OXx9XO53uVwi3ak33l4H3Z3fkUzEjfR6oeMiOmgyZYM=;
        b=LZs2hOu5vuzdrjG9HFNpawKnHy7U40sarC7rgfa+bhmQZHsyBG5hZAlRt1TCA5n7D4
         kCoWEwhINK/gjMk2/jlmYsZ7DQARBOVKrzAPPU9hHrmTYdiNaQlzxeGG9LBTeR5/PZg5
         u6osyQpihcBP1RyDZ9NGYWMn2P2heAbiKd13ZETZrRkGEAKQABT2JB6sTwCgSRKLDbYQ
         bh5GJyOPRRZhiOriX7e/1pvBJD6DTg8JC87W7EvGTfZ19pFwR+fP1q8kNhRKqJSMSP1y
         QxEKY3w44MPcu015xILTDXQECSVQ5i8Ye4Sonye9MiVA8d0xk8gkqqkABN32dWoxTrRJ
         SYpA==
X-Gm-Message-State: APjAAAWm98hr9mKy5eTnbkgkIM5NI24S+wbHx2iD+GZiymy1U+LM3TTv
        tLHa+vP+5l3TBUeCbaluWun0cJj12Iqm3A==
X-Google-Smtp-Source: APXvYqxG/vLlTnOdVHbynSL9RXJzBKUtTgt7S6F51j51B8Y5fyyQi+GBiJvAjtAnDfI3RphqoAKrOw==
X-Received: by 2002:a63:e648:: with SMTP id p8mr3102185pgj.259.1576058320583;
        Wed, 11 Dec 2019 01:58:40 -0800 (PST)
Received: from localhost ([14.96.106.177])
        by smtp.gmail.com with ESMTPSA id q6sm2311917pfl.140.2019.12.11.01.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 01:58:39 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org, swboyd@chromium.org,
        stephan@gerhold.net, olof@lixom.net,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH] drivers: thermal: tsens: Work with old DTBs
Date:   Wed, 11 Dec 2019 15:28:33 +0530
Message-Id: <39d6b8e4b2cc5836839cfae7cdf0ee3470653b64.1576058136.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1576058136.git.amit.kucheria@linaro.org>
References: <cover.1576058136.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order for the old DTBs to continue working, the new interrupt code
must not return an error if interrupts are not defined.

Fixes: 634e11d5b450a ("drivers: thermal: tsens: Add interrupt support")
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/qcom/tsens.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 015e7d2015985..d8f51067ed411 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -109,7 +109,7 @@ static int tsens_register(struct tsens_priv *priv)
 
 	irq = platform_get_irq_byname(pdev, "uplow");
 	if (irq < 0) {
-		ret = irq;
+		dev_warn(&pdev->dev, "Missing uplow irq in DT\n");
 		goto err_put_device;
 	}
 
@@ -118,7 +118,8 @@ static int tsens_register(struct tsens_priv *priv)
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					dev_name(&pdev->dev), priv);
 	if (ret) {
-		dev_err(&pdev->dev, "%s: failed to get irq\n", __func__);
+		dev_warn(&pdev->dev, "%s: failed to get uplow irq\n", __func__);
+		ret = 0;
 		goto err_put_device;
 	}
 
-- 
2.20.1

