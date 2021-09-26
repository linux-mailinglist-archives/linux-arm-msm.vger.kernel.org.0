Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEDFA41854A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 02:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbhIZASu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Sep 2021 20:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhIZASt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Sep 2021 20:18:49 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5102FC061714
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 17:17:14 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id u18so56546933lfd.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 17:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=55iHUMzFFyoxNfHYv5W5Wm8oMzXKeDg6FrgyetZh2+M=;
        b=T+VX3ch8D0gBkFU/UV99bm4qwjRtkQttFzQoWYkQfqGpVO+OYRww5KBl6am/YUfMhi
         7frE7cVb6JFJPrmVpoJcMK+TE3yFlfbLbhbXFXPAb4ab2widABSEgbpBmNfRzdLrpCDd
         XSj7eDEYFpijqSk0UdYpdyfCXWgvkqqddl2iHioVTxeYxMIatJms4BQ3OJYWUsqw7R2m
         ijxiaDlIBj7cZHGlkmab8daDHF/jNGjPLpQcQxwkpB0amL9OhRncOleXB0mNPDeVmmvV
         tCNxJMZw2O25H5woan6i11qPhB0+xNcLm4zkR70xp+twHnFZX2iJFPhRj4hutPlyomm9
         QXMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=55iHUMzFFyoxNfHYv5W5Wm8oMzXKeDg6FrgyetZh2+M=;
        b=o+Xc1K3uQBLbmSsiIP14GOXJbETT4poYbAH2saHUqQPl3R8rFkT9boGH4wJAvTnbiV
         NNhBwIm+TykJgc28GDDPcy9Byza9I7utW79VBNE43nZwVRdZK6UkJcPmGj9nJU1H/pVp
         1FEEdns4yYaYf63D64vFgcmtl5bUkyjt24LaXnHM5i6zVzsgzfd52QskEnZilbjsqG+o
         JZ2Zfr7rCwIPdUq5HEYKs7oiyLXGEB4IAYJr51grWp1V0sJR5x6SZBxEuip7YTyFXEj2
         3xXQ2xdFFb3uQhdQE7zXCCAOYeAkKInwzBzFbO8DDj2C9aGp49ZKmthaRM7oitPEeAfm
         Ooyg==
X-Gm-Message-State: AOAM530GJBjwbgnunwfUwRE9A/9L45Qkqw8jFDSPGYepx0hCHfoCgD0n
        b6peE6pKZhQpF1ckzqhSqMS3cg==
X-Google-Smtp-Source: ABdhPJzUHZ3JA2P9yO9fh1lUwUgN4f6tpLFgNxxUICLMfXtyd5nraLhyfd2z9VkBEMECNssdD/Lgjg==
X-Received: by 2002:a2e:7f04:: with SMTP id a4mr20879634ljd.308.1632615432668;
        Sat, 25 Sep 2021 17:17:12 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i10sm1146270lfu.71.2021.09.25.17.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 17:17:12 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] thermal: qcom: tsens: fix VER_0 support
Date:   Sun, 26 Sep 2021 03:17:11 +0300
Message-Id: <20210926001711.2431912-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210926001711.2431912-1-dmitry.baryshkov@linaro.org>
References: <20210926001711.2431912-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For VER_0 tsens shares the device with the clock controller, but
nevertheless it does not use syscon for these registers. Drop
syscon_node_to_regmap() and acquire the regmap on our own.

apq8064 has tsens as a part of gcc device tree node, ipq8064 puts tsens
node as a child node of gcc. Thus check whether tsens resource can be
fetched either from the device itself or from it's parent.

Fixes: 53e2a20e4c41 ("thermal/drivers/tsens: Add VER_0 tsens version")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 6aeea74c1bb0..4c3960c188da 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -773,19 +773,19 @@ int __init init_common(struct tsens_priv *priv)
 	if (tsens_version(priv) >= VER_0_1) {
 		res = platform_get_resource(op, IORESOURCE_MEM, 0);
 		tm_base = devm_ioremap_resource(dev, res);
-		if (IS_ERR(tm_base)) {
-			ret = PTR_ERR(tm_base);
-			goto err_put_device;
-		}
-
-		priv->tm_map = devm_regmap_init_mmio(dev, tm_base, &tsens_config);
 	} else { /* VER_0 share the same gcc regs using a syscon */
-		struct device *parent = priv->dev->parent;
+		res = platform_get_resource(op, IORESOURCE_MEM, 0);
+		if (!res)
+			res = platform_get_resource(priv->dev->parent, IORESOURCE_MEM, 0);
+		tm_base = devm_ioremap(dev, res->start, resource_size(res));
+	}
 
-		if (parent)
-			priv->tm_map = syscon_node_to_regmap(parent->of_node);
+	if (IS_ERR(tm_base)) {
+		ret = PTR_ERR(tm_base);
+		goto err_put_device;
 	}
 
+	priv->tm_map = devm_regmap_init_mmio(dev, tm_base, &tsens_config);
 	if (IS_ERR_OR_NULL(priv->tm_map)) {
 		if (!priv->tm_map)
 			ret = -ENODEV;
-- 
2.30.2

