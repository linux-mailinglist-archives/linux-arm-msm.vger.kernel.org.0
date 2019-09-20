Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13253B9962
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2019 23:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727607AbfITVx6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Sep 2019 17:53:58 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:32968 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727185AbfITVwq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Sep 2019 17:52:46 -0400
Received: by mail-pl1-f196.google.com with SMTP id d22so2488915pls.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Sep 2019 14:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=BcKGfqptsJMIyqg8m+kdv7mwKKvvYfua8/fbCWYYrS8=;
        b=gC01BHP1P590aH1DpG92/2a9eu0OC50zfmGm/ISqUL+Edf8eKtzKtYupItgKC3NC4V
         YnGr79289Q1KN/q09yX1oZGTwgPpeMNTg9Ms/0sHXfbVLv+eRLYFb0iS5h2kMPx2Pt/H
         nm3cx01VKVxgVY7U6ZdSgX73IFqs2evm5lYv/fFrllMl3gQ4UBsg77QnTCUAkR1sLsfv
         OHXm5zlBci/Ps2gD1m7LsdNXuUKp9Um7cQeKq6bNJV3q2wNiCpKa2nBUTmnazNXOrJGL
         24l+eQUYSg4WyryPMS4GYEZtqovCvhGgbQKyYxqim1UAVkBeE/IRUSQB1o5u83ISfFJj
         yZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=BcKGfqptsJMIyqg8m+kdv7mwKKvvYfua8/fbCWYYrS8=;
        b=ehDab8P0xf/cIkVUvLRys5f2L0Hy9IOixAHzmqNDLqqO6oKmBm1Qpd3kusoBdrvD4P
         1zJn/ZHWp/ulW4j2bQQyfnNt+FYVCrz2U1ziZMTwjeLAnQEPnnWXSxzEu2MS3SlvlSEh
         kLBdkr9pWJYNc1RIswYO58+F134BJt7SVRvORDi55gYcXfw2wjLmI8o1BEtpAbP/jX75
         Lopqu0SapJ983+rLoY3QGOg5Kj7ng0EC/cykuNejP8bPq/oU8umarMxTllGv8eOKKMB/
         ZaUiQPLvAeokhM7cnWQ7Nr/d/1N5xijV48Ljl1KBMiSJn81Xz2CM/12561EwDzVhdH6o
         kWcg==
X-Gm-Message-State: APjAAAWEgGOqIBxFqgiz1u55MzbWawqJFSWCmcaU79cwEKOrjgG8HFlY
        0sJid+VaTJxCKFI0IexakA7l9w==
X-Google-Smtp-Source: APXvYqzQfIiJEn2m3GVJXE8ugbnOGc3O1v8GA0STmdXQCDw0YRuUJmFyxBWT9guY6rp6NxoKhxOtwg==
X-Received: by 2002:a17:902:8bca:: with SMTP id r10mr4121889plo.43.1569016364897;
        Fri, 20 Sep 2019 14:52:44 -0700 (PDT)
Received: from localhost (wsip-98-175-107-49.sd.sd.cox.net. [98.175.107.49])
        by smtp.gmail.com with ESMTPSA id 22sm3480863pfo.131.2019.09.20.14.52.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Sep 2019 14:52:44 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org
Subject: [PATCH v4 02/15] drivers: thermal: tsens: Simplify code flow in tsens_probe
Date:   Fri, 20 Sep 2019 14:52:17 -0700
Message-Id: <dc5468cdf64e5acccd37fa9b5e849f423874764a.1569015835.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1569015835.git.amit.kucheria@linaro.org>
References: <cover.1569015835.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1569015835.git.amit.kucheria@linaro.org>
References: <cover.1569015835.git.amit.kucheria@linaro.org>
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

