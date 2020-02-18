Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA7DA162DE5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 19:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgBRSMh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 13:12:37 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:38637 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726701AbgBRSMh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 13:12:37 -0500
Received: by mail-pf1-f194.google.com with SMTP id x185so11046363pfc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Feb 2020 10:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+YirIPkJXuIir4GmYePAIggm+McOm90/Zl24VPr8SRk=;
        b=jswkyQD1LeaxGwcvJdqJn4XVZpLtuqcbPeNaccCVCjIcpcOu1rNR8vdETNL96gZ0zh
         RyXsscw4Ue6zgjpT9/vA8qBcST12eb4siBsq/WB/BVDevcco5oXYHfqdHUDGj+hDnuer
         a+fjOaVCL+Mvl+hxpBr9qDGb9Eh0cGPHaT6OFsWumb8OLgipOUEdoWo3HMshBvf/o3fD
         X21CXstzSwaR+bxdSBss8UP1wggaxiNWdklCbT4T9C+Glx9c7fx9upfKRyCfHGj/A5ZS
         9CHh+Fu/vTwCT4XHAOxTLHDBUNpTztJbNVdAaxAqAeqLJb5cixhkQGPaONXZELDELAaM
         d7yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+YirIPkJXuIir4GmYePAIggm+McOm90/Zl24VPr8SRk=;
        b=H+Hi1SzkdkLO8q7i52b3HmbvZ07vlJZMLVviARVsboJfPhwKCIiRHkM1OpguYCr7kV
         UxGaiCWU+1hD2fEmv5sTZJDX/ib735zv50P4mBmsj6Q9jGW4jjOD8zJpoWaboBQXjRtj
         3J49TvdhcaVZZ6hTd+w13nl3L/BiQh9x5CjSObpZdfpbXenn2pcce6JprFv5ITE6o4Ko
         mSUwgjCLItUZM3kZjdVqcEkar3Li9n0hJoZMTtrhNkVSBzMUyxpU3J5kTcUtgnLjPPn8
         JI5gfMmTPpxtrNdKcqb5brR5zK1jD34z9TaSNY6azbhhZ67cV4zwqYPbqxxhu3o8LxQE
         iEZQ==
X-Gm-Message-State: APjAAAXD7YQyXUZXoF4EN+AsDCs4J+kHL+blr8pR0+9zGMxXycCmG2wg
        QWhTrJzyVksOcqZ8bJlDhZSzWA==
X-Google-Smtp-Source: APXvYqyZUR7Zba9XFFXCAAR5vcZCiXrM7oXRZZH1QPzTLivsBxopFB1qjAgkaMI4xA0ikxsuf6ZLLg==
X-Received: by 2002:a62:1889:: with SMTP id 131mr22541039pfy.250.1582049556211;
        Tue, 18 Feb 2020 10:12:36 -0800 (PST)
Received: from localhost ([103.195.202.120])
        by smtp.gmail.com with ESMTPSA id b25sm4888300pfo.38.2020.02.18.10.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 10:12:35 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        daniel.lezcano@linaro.org, bjorn.andersson@linaro.org,
        swboyd@chromium.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
Subject: [PATCH v5 4/8] drivers: thermal: tsens: Release device in success path
Date:   Tue, 18 Feb 2020 23:42:08 +0530
Message-Id: <9fa8a4e09b6fcff4b9d4facc9f9e9f8e3c4a41d5.1582048155.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582048155.git.amit.kucheria@linaro.org>
References: <cover.1582048155.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't currently call put_device in case of successfully initialising
the device.

Allow control to fall through so we can use same code for success and
error paths to put_device.

As a part of this fixup, change devm_ioremap_resource to act on the same
device pointer as that used to allocate regmap memory. That ensures that
we are free to release op->dev after examining its resources.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/thermal/qcom/tsens-common.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
index 1cbc5a6e5b4f..013750fff8b2 100644
--- a/drivers/thermal/qcom/tsens-common.c
+++ b/drivers/thermal/qcom/tsens-common.c
@@ -602,7 +602,7 @@ int __init init_common(struct tsens_priv *priv)
 		/* DT with separate SROT and TM address space */
 		priv->tm_offset = 0;
 		res = platform_get_resource(op, IORESOURCE_MEM, 1);
-		srot_base = devm_ioremap_resource(&op->dev, res);
+		srot_base = devm_ioremap_resource(dev, res);
 		if (IS_ERR(srot_base)) {
 			ret = PTR_ERR(srot_base);
 			goto err_put_device;
@@ -620,7 +620,7 @@ int __init init_common(struct tsens_priv *priv)
 	}
 
 	res = platform_get_resource(op, IORESOURCE_MEM, 0);
-	tm_base = devm_ioremap_resource(&op->dev, res);
+	tm_base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(tm_base)) {
 		ret = PTR_ERR(tm_base);
 		goto err_put_device;
@@ -687,8 +687,6 @@ int __init init_common(struct tsens_priv *priv)
 	tsens_enable_irq(priv);
 	tsens_debug_init(op);
 
-	return 0;
-
 err_put_device:
 	put_device(&op->dev);
 	return ret;
-- 
2.20.1

