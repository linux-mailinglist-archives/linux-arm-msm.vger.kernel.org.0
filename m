Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B18BD8999
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 09:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732328AbfJPHeb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 03:34:31 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36721 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732301AbfJPHeb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 03:34:31 -0400
Received: by mail-pf1-f195.google.com with SMTP id y22so14159745pfr.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 00:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=BcKGfqptsJMIyqg8m+kdv7mwKKvvYfua8/fbCWYYrS8=;
        b=zr8Jj6FLnbAxHmN67Iiq1ZcLMchv+Ks/Xp8pWezcbvbe+OApPGXcik/g3TNk3LpCdn
         WqiMviPLfH4XpdhwwAjIO0HcaT+jzOcX1q19E/1nhHn4RLP03eszEg5BwAv95ODScHzl
         JZmDR3UbqSJzvqzT8KUI1AEZZgg+FUOEvnXpRfbq1Z+6/U7JBZLYCt1cwitQd0wmLkEA
         AKngyASWhgcLKrJNFfYpZfi9yZSyBTJX6NCr2Xyk6ck1mmcSjHH1UqHvZ3Cubx0wclSo
         /yJy0+zURpm9IagVQz5jHEmUPlKj0gbgX2093XrBsL3LVGxRTuvRHwsgexb+USPuV9WW
         fdwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=BcKGfqptsJMIyqg8m+kdv7mwKKvvYfua8/fbCWYYrS8=;
        b=l7hCw8H37GyG7w/Nk1oWOWlPEk5YCVIBTiNnn8/hMTXd+X9HjhgUgYq6Wv6T966DhK
         +7j66puuQxvKR1x83q2h/VoLpFgNUzhjV5yKTWK6zEzt2JddPnnYa1K1UKGkYsqC6bLp
         RGLZucA5Ys3ucMdHGlrBkeHCyErMDhnE28gKXk5PUUZ1g7NWwOW+BsmLCqiyXC0VO/un
         OSqlWmNuSKrxzO8+wjDQoriX6H2PRk9gN6ETwpQJYlX/MdXtlTuos6m9gZAy14pGvH4b
         gki9YNRZ8ZEItJ32RXGEoDNHIYiZTDFT0wHdYBbEvTPTN6We8bqGPNM4Lbmqdh5LpteV
         KMwA==
X-Gm-Message-State: APjAAAURq56V59pU5EC+kwlLFebohy/5YRtjCyftLRk0RCuDIy8SR6Jz
        B4iHZXylhPGZevEMNZQFFeLUWA==
X-Google-Smtp-Source: APXvYqz/f+bAtA7I6hems7QAH02boX7g84MW1lkIWuTJsAVZzW+Lu4LV9zafC9ZRTqEO7vnRVZ0M5w==
X-Received: by 2002:a63:1423:: with SMTP id u35mr5608555pgl.122.1571211270181;
        Wed, 16 Oct 2019 00:34:30 -0700 (PDT)
Received: from localhost ([49.248.175.127])
        by smtp.gmail.com with ESMTPSA id h186sm31611631pfb.63.2019.10.16.00.34.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 00:34:29 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 02/15] drivers: thermal: tsens: Simplify code flow in tsens_probe
Date:   Wed, 16 Oct 2019 13:04:01 +0530
Message-Id: <184422dcc1c12553e71a58c62e01425fd7d1172a.1571210269.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571210269.git.amit.kucheria@linaro.org>
References: <cover.1571210269.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571210269.git.amit.kucheria@linaro.org>
References: <cover.1571210269.git.amit.kucheria@linaro.org>
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

