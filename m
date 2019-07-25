Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB4C975A84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 00:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfGYWTG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jul 2019 18:19:06 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35607 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbfGYWTG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jul 2019 18:19:06 -0400
Received: by mail-pg1-f194.google.com with SMTP id s1so17404320pgr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jul 2019 15:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=xgmSGdIDu0v4P5hRNEQENmsRjAPMzQvZ2XtfdY307wY=;
        b=bjUFoDkwwtUAE9rjXGY/yoZmv4SUpw3zs28N86CLMnkSz3U+2bn3+TLJS+4walCtmB
         PVQpuIprCpvqgGD1hWDh4l6z7HtvdCGuNaShzu+KiztS8VV1ubwC6cMtXT9B8gqsYZpA
         sP3T9ywIr4mAS+PZ98Ckn5ZGC1sZ/ATKTqJeDkZ6+0YlEmEEbN14p+4uUcVmseHdfP5s
         DHmjxk72WKm+GFVr/biN9GvWyyvLqP7zztIloxDv1rrIieRYpNA9mjJheq0ihmCV9jNW
         CXiQyERh4pgRHH5XRbCVnmwwLYv4sqP3LBIHGx5fH3LcaAWNjeAgBfH788SsDqKtqjyb
         eLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=xgmSGdIDu0v4P5hRNEQENmsRjAPMzQvZ2XtfdY307wY=;
        b=C1S7LcIzEQnzItSd+C+Rf+3nV1fFusdOcBCCfSdi6WEay5WZnYSow/+EH96jN2jW3F
         dhkPYsYQ8EmVCueIqC7pyDNBJACgLnT9rocwoCtlattfOvsnxpFu+TBDSETqYNGBDAk9
         kGs7ebpBQrEt02fRv+eg7xvg72PMoZ835NONgW6nTsg1QCC5IiTpU2pxb4AIPCohc8/0
         S/34a0lX8xOwOe0nBnHtKTWNxdXkFlPqxa05s1ZQ5vALTTQTCeogQQ1agpmVXmsihps1
         v+3NcwQcOtMfEJnoydhVzROgXpks9SVBwiTTVfAD41z1vL1itKJurG3e9cAGsvaJr+76
         kd+Q==
X-Gm-Message-State: APjAAAVd7AwEnG5ZIUiaKmtVFEfk+qVtvMs4h/yK0v61xN5PL/kFeVuK
        IJALyXxWD2UcsPHEblHnpl6SLw==
X-Google-Smtp-Source: APXvYqwaSRF2/JeVa1u/7Y6W3dTGdYmgn066tsuvQjuj18nF/sNUfRqKZ0YJ1r2l5P9c6PXW8ZIQ8w==
X-Received: by 2002:a62:16:: with SMTP id 22mr19525541pfa.151.1564093145400;
        Thu, 25 Jul 2019 15:19:05 -0700 (PDT)
Received: from localhost ([49.248.170.216])
        by smtp.gmail.com with ESMTPSA id 21sm46989303pjh.25.2019.07.25.15.19.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 15:19:04 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com,
        andy.gross@linaro.org, Andy Gross <agross@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH 02/15] drivers: thermal: tsens: Simplify code flow in tsens_probe
Date:   Fri, 26 Jul 2019 03:48:37 +0530
Message-Id: <355cd15c91e02716140d7114fd403559487b66b6.1564091601.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1564091601.git.amit.kucheria@linaro.org>
References: <cover.1564091601.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move platform_set_drvdata up to avoid an extra 'if (ret)' check after
the call to tsens_register.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
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

