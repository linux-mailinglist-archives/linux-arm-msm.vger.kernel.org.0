Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F552306BDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 05:09:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbhA1EGA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 23:06:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbhA1EFI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 23:05:08 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B4B7C061356
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 20:04:28 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id v1so3959253ott.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 20:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbTyrwsOUFeBKx/wZBbc/RTueffgUmDZNCpk3OrcQUc=;
        b=ChVoei/DhScC9Gpja9dK8cCUFgP0rOt5TK8HXznv4PXif/JHazoXu1SRciZogaw6P+
         8Blg9wNWM945EsmAS9O6UKkFs+gK60+8YUo5VlXoLZXgdBYZe5S4XWFGWhekl4T1+C5g
         ORJJr6EJjq8bU5i/uLm5MZPjnFTKBTgYAytEtl4xt470vwZSiU/Npmc39sCHwqm6/D1l
         ZFXLtuMGqXxEiFf0ZGIsncdF61rMzsruJAS8OV0eUYwScC3taNYDguJAn/rGoJsOFzMS
         MRo0cAw5FAdBKUgFCVxQX4hy1hO1Rd2l6Q31HPmu3IVVvZlGGble7L6Lc90OqOq+1a0y
         3kbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cbTyrwsOUFeBKx/wZBbc/RTueffgUmDZNCpk3OrcQUc=;
        b=EcKLgFmdukFwEkxSc3e7qsqC8Ab1YZbVeBNcU0NqiXPYavx2FJm9CWDzr4rrq7I5S3
         B6Ca+bM5Gus5OWRfJ1tEljb/s3buv/QC5sk/mrupSFtNkw7S7YATiU3ztlwXA0h098vx
         MaCs1rA8C0qGCuXqcBgNM03ZUaR2A23GEEPwLl7OoxbSOTtxBGgH8ZMLFR2j74z5/XtI
         lB1bF/sUl+qLexK8Zer1JpYg5XnIlsH3X0TLWAbjDM7zsfrGnW3QMhypy2OQ8uVffZ+x
         13PNnhYh3y1+wckRzGt+veRePDoEB/NAMkrT9GM7F/WhhacQjyeyPiOK++A6cA2Pn5Xs
         uqYg==
X-Gm-Message-State: AOAM530ZHajOg19X++oSkyWrxTsLLuDVS4+Pwo6j3n0uDDgSyQ1UruJh
        eVODkbuOpSqMW6e/LGLz2vGQ3g==
X-Google-Smtp-Source: ABdhPJxGfqVHUm+2Z5bAjtM7pk9jPcdyIL6KBmg3RYFwdLJHvzNMFduWntEiPNXss68vK/KeFyE03w==
X-Received: by 2002:a05:6830:1d73:: with SMTP id l19mr9893373oti.245.1611806667872;
        Wed, 27 Jan 2021 20:04:27 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g23sm810745otk.72.2021.01.27.20.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 20:04:27 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] opp: Allow dev_pm_opp_set_opp() to be called without opp
Date:   Wed, 27 Jan 2021 20:04:26 -0800
Message-Id: <20210128040426.953529-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

a6xx_gmu_stop() calls dev_pm_opp_set_opp() with NULL as opp in order to
drop its bandwidth request, which was valid with dev_pm_opp_set_bw().
But after the transition to dev_pm_opp_set_opp() this leads to a NULL
dereference before jumping into _set_opp(), which does disable the
vote as expected.

Fixes: a0d67b94e2ef ("opp: Implement dev_pm_opp_set_opp()")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/opp/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index 583bb1274df9..3ff05f40e443 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -1157,7 +1157,7 @@ int dev_pm_opp_set_opp(struct device *dev, struct dev_pm_opp *opp)
 		return PTR_ERR(opp_table);
 	}
 
-	ret = _set_opp(dev, opp_table, opp, opp->rate);
+	ret = _set_opp(dev, opp_table, opp, opp ? opp->rate : 0);
 	dev_pm_opp_put_opp_table(opp_table);
 
 	return ret;
-- 
2.29.2

