Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0609E778
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 14:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729619AbfH0MOc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 08:14:32 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33975 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727910AbfH0MOc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 08:14:32 -0400
Received: by mail-pf1-f193.google.com with SMTP id b24so14043112pfp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Aug 2019 05:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=ByQuSAprS9jXkayR9k8WNXgC0XRVOmuonTQ+tfTnFgQ=;
        b=oFeXeHu81LKsmIt7qd79KgGaAgbRDvhtHEbzcJsDTIyDIb1vjLZzGCUYrlXBrhVh0H
         EHqo53y0jOX76nzMTDHT60A74TY5VPOzJaptg87naVQX71fv2xpUsxrdf4JTzLrG3P9y
         UL+fVDfDy5e0LgG3YOKlutwrj2KKTkzGaKwTcvEXR39Hw++yOHdyn+wW/CiylqacqCS6
         GlSyL25Rws+1zruhvD5N06QYOcT3XfLU/SmgccDhL185GVlWBljOK/DMxbk9IAphVKYL
         27bUZP8p16RYF5L+sU1wsRzIpSnaCjctervDPIayul04UHC9uV6HMHbAhT5l+AaamjTu
         da/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=ByQuSAprS9jXkayR9k8WNXgC0XRVOmuonTQ+tfTnFgQ=;
        b=ngLG9y70ZidE7j+AhOLvuwbHiZ+SrRoPhggQpDPS91T/HJ3jF/IW+eKLtR4+bbie4Z
         YW+R0hwQGgk3GRFh3phB1i44l6cFzsLWIOyUJ4TsMFLHnrMYCzQ+3xZEDafII22D9KVQ
         3Vmzji/YSA0bKSYUNiW7CMdl0vbaKw8I+XkT52LHdJkR7IkJPvSH2bYcZNZeTqe7kOxF
         liCR7MlSvcpOmGi+azFfg5sx88WC7x0PiiDtCTUvq2qu13ZdOHjCt40T1aCgKyfQZ/ql
         50Bve2q1YXRAZ3kHtvdngJwxFaAQRlxXTg5WQLQrd0fCUJLnLeML2TO9oDiwqsyjp0h6
         R0vQ==
X-Gm-Message-State: APjAAAUXrEdiANLnfivlq9L02FLNb2qCAE4atEpqKkVphrVFUfybT/+t
        VBKVoMGWfS4inIzqBf0JPGO1bg==
X-Google-Smtp-Source: APXvYqyftonu9jTlmH0ayDH7TOr6DaBwh6U/L04HWzIFTKUkLf8Jos0TyIP4+efo1N2uctISUk0afQ==
X-Received: by 2002:a63:3c5:: with SMTP id 188mr20528160pgd.394.1566908071328;
        Tue, 27 Aug 2019 05:14:31 -0700 (PDT)
Received: from localhost ([49.248.54.193])
        by smtp.gmail.com with ESMTPSA id e13sm18207682pfl.130.2019.08.27.05.14.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 05:14:30 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        sboyd@kernel.org, masneyb@onstation.org, marc.w.gonzalez@free.fr,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH v2 02/15] drivers: thermal: tsens: Simplify code flow in tsens_probe
Date:   Tue, 27 Aug 2019 17:43:58 +0530
Message-Id: <e54d2381f481e688429b6910d2f76871b3b8fe9e.1566907161.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1566907161.git.amit.kucheria@linaro.org>
References: <cover.1566907161.git.amit.kucheria@linaro.org>
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

