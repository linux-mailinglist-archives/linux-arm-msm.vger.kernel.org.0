Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24D59AF6A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2019 09:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfIKHQt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Sep 2019 03:16:49 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44826 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbfIKHQs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Sep 2019 03:16:48 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so11038989pgl.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Sep 2019 00:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=BcKGfqptsJMIyqg8m+kdv7mwKKvvYfua8/fbCWYYrS8=;
        b=o7pSB/lBJepCsIAK9wwEl+41gBqxhzj1JE5Xk93Xw+PiLLGCJiaRXIgX89oRURyZnw
         l3RtJSgM55DVzGJjWn4+MDNVoP63T55tIwc6Q5UURuq4/Y3FFS5V23mHe1sVX1K7hWed
         oQ2vD5nDD4cKYHQMqs1ShVZ7s1ZcieLRdx12COreB9e9vazjIAfQH0qkMOxgbAvMis7H
         /3XEpCvRHuhZx7j6J3FmzwjCMwDqLMzZd/sIa4LxZhl+TIQWHZbDva4KqVoad2s5xT7S
         x0eDDX5jO85RYBiiXqBTADEBhZwbO15EZfMLKNsiNqF+bExaugY7uXjyl2+5UEzDL894
         EKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=BcKGfqptsJMIyqg8m+kdv7mwKKvvYfua8/fbCWYYrS8=;
        b=TXg0U8v03XE8QmoCLBKWdvxZjUmSEoABJ4QSv8Eh+7nmMPMl+h3nwBd1cary/I4uvf
         WKw4Vw1bfCkP7E7lthz/DiSQ6n5t/Hjxs7HL0QxEMTd8nuS46dvi/YBLpiDWDvZDPf0s
         LP/58QADXMtj1nERhjCGwd85EHS1oV7GXsONHOATt+Im7nYCcHbDk9NQI5dsc+aKD+b0
         sWrkeOLM2UP1KFecpiOLFUhtGvpHosKkjSLv2r3KAPj9uXAcqgCSUygm9vwFSRCfokvA
         EO7HXqGc6HVkvhQGkCteq8UMmKv5CoP19ufQ2pojUMJnxUDFSPdbHWKq22RwaohAm5de
         P7bA==
X-Gm-Message-State: APjAAAXHwoes879nRDM8ZUwVAkp7aeyGLISrucaZ0TddR0AnRhDzD1aE
        M9xSXWR40ujzJzTNhbCRWob5pQ==
X-Google-Smtp-Source: APXvYqzuDX6VHtcQh0PUvMrGvJDnEXpgaLZvpgIkZ3I0Se0OK+dS/HGC/5ZNZQgJPkc+n6GUjwf73w==
X-Received: by 2002:a62:e508:: with SMTP id n8mr20353567pff.199.1568186207721;
        Wed, 11 Sep 2019 00:16:47 -0700 (PDT)
Received: from localhost ([49.248.201.118])
        by smtp.gmail.com with ESMTPSA id 20sm24094678pfh.72.2019.09.11.00.16.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 00:16:47 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH v3 02/15] drivers: thermal: tsens: Simplify code flow in tsens_probe
Date:   Wed, 11 Sep 2019 12:46:19 +0530
Message-Id: <dc5468cdf64e5acccd37fa9b5e849f423874764a.1568185732.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1568185732.git.amit.kucheria@linaro.org>
References: <cover.1568185732.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1568185732.git.amit.kucheria@linaro.org>
References: <cover.1568185732.git.amit.kucheria@linaro.org>
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
index 6ed687a6e53c..542a7f8c3d96 100644
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

