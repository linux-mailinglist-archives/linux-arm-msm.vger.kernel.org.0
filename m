Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2FA9DE999
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 12:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbfJUKfy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 06:35:54 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:40749 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728228AbfJUKfv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 06:35:51 -0400
Received: by mail-pg1-f194.google.com with SMTP id 15so2200475pgt.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=ByQuSAprS9jXkayR9k8WNXgC0XRVOmuonTQ+tfTnFgQ=;
        b=F20sjx0yS3J6Y1j5JsXZ2Gpm20YNzlBp1Q9Sh/pFUqGmdiaOG2MjLbZMFn+mL+S7py
         7Djb+E855QkNZOggjigBXw87iY0cOhXI27sUJwGAlVjCuJi1TaE+qHGoc98Ek08e3cpu
         4vMffBQ+hcVwtddGYa1fPuYCu5mq2MYAL0l/iCEvWK+KdjIORO4pLVmaUmJjBpl8cJp3
         VaDydgsopnGKZJzZ82yjCH4xJNyw//AaQLkLHFubBpHqrwF0IouKcslwojVBzUtI2uaQ
         6r2SqNedzxv7HvJVJ0W+2OjkO81BdXDQfyVuPQoYVOccXuAZLQUY1J6qJhPiQWHpzpj0
         +dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=ByQuSAprS9jXkayR9k8WNXgC0XRVOmuonTQ+tfTnFgQ=;
        b=X0YUB0oIkoB9Iz222ccLJezE4ZwTBxZbVNUnVHIbkBWtYFxJDtVMQ+D3jbBJ7xaWGy
         IqDN69GcDDcssliYaD74YSH1XqVem4ApTuG/DuogsCBJb7kp9tSqAiGJ7If9pfBeTyzB
         0LxoX6ZxAhoh7yFRxsz60B1xP/O9a8Epo6IcZuW09dh850w8Hs2ZzwUtviumqSmj6guK
         KaasTcWnC0kkXVgrYGKlUpZFEGIA+KidC3E7pmUtzvMwAiKD4LwpNTmb1wUFzAtlxi5J
         Pw7/ZSHWSRkMt4osfXIMsfwxXk5CGEuYcdk20ZeP5J9qmZlo0NNBRV0zDBY7JYRzCpkH
         +WhQ==
X-Gm-Message-State: APjAAAXMyp0hihODY5xcxhO9d1nvNLUiv0RfiZvHlnF1BiIhbwe3Yfmd
        QR2zEIrGNbq3XPUbTs57K+xasw==
X-Google-Smtp-Source: APXvYqw8mOldgAv9TgODpiePm40wSv2U6xzhPuz5EzTZlRD31gCmwEJm055KUgqDoP55S4P5kUZ1Ow==
X-Received: by 2002:a17:90a:b304:: with SMTP id d4mr28610421pjr.27.1571654149379;
        Mon, 21 Oct 2019 03:35:49 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id k6sm20516678pfg.162.2019.10.21.03.35.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:35:48 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH v6 02/15] drivers: thermal: tsens: Simplify code flow in tsens_probe
Date:   Mon, 21 Oct 2019 16:05:21 +0530
Message-Id: <184422dcc1c12553e71a58c62e01425fd7d1172a.1571652874.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move platform_set_drvdata up to avoid an extra 'if (ret)' check after
the call to tsens_register.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/qcom/tsens.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 6ed687a6e53cd..542a7f8c3d962 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -149,6 +149,8 @@ static int tsens_probe(struct platform_device *pdev)
 	priv->feat = data->feat;
 	priv->fields = data->fields;
 
+	platform_set_drvdata(pdev, priv);
+
 	if (!priv->ops || !priv->ops->init || !priv->ops->get_temp)
 		return -EINVAL;
 
@@ -167,11 +169,7 @@ static int tsens_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = tsens_register(priv);
-
-	platform_set_drvdata(pdev, priv);
-
-	return ret;
+	return tsens_register(priv);
 }
 
 static int tsens_remove(struct platform_device *pdev)
-- 
2.17.1

