Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB2814A88F5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 17:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242631AbiBCQrF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 11:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240972AbiBCQrF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 11:47:05 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58F2C06173B
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 08:47:04 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id i34so7289997lfv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 08:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=npRH7vRKW6sr8ga77ZpB533YBv6nJOMH1HOGWpxJJcI=;
        b=e7EbWgjxdid5lXnkoPKdVoMyRMXw6MVrUbkyyKb2/dSYFi/Wdv4EZdp31RUmxrLJd3
         2A1rbICAOqawWk/Dhdu2BXbc+y/+jRcSsLfTdOv1O8wuMZnePO5p0zoZcpt5XN3/PL0w
         F321/cw73+Mk+fvw0wlAGVNQwe+Ej+T5YL7rmObAlZkwKJwrxPgkGvKOlhPCZ6O3CUqa
         jP/mXZavbzTa3KS9Oa4BclfnYgfdVBoAnnbfubCY8/c7YvJw2VGfCz/CS+hrVKeoAQYh
         kDC1CugIbuHHrkUaVm00mlDuJ+219SOTe7BDkGUxvGrwEdB4bW2caemdNImal9EFL2Et
         ED+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=npRH7vRKW6sr8ga77ZpB533YBv6nJOMH1HOGWpxJJcI=;
        b=03gvXWJQytKUjglAgxxSpdKiCoQCxKRjSx72ZR2p5nawC8VlHPaQ2b/JPdsak5CBnb
         nYHYrLgbqnno2xQuUSkRuL4NqCwg8npUqRv9ayW+jUWtJSa93TZe4a72h9w1NcfLhq8g
         qkxeTG6/xko0ZyZO3owa+h1fQdk1I/lFOmYQxPv/t0yznCFcvtZhmchaaKxLzPfLRRPZ
         6aM6aM3MUZSxluBzbtZQItn31npTXtv+qH5ZP4iNn05qNEYVa0bclM52bdcRhE/uiaxa
         e1clyggsT6bhq1HdWbbZBo1QjO6X6C3XNAl9k0ZtYGf3nlM3LabEtlhyme8hSR3yGcyd
         tGXg==
X-Gm-Message-State: AOAM533NcPBgIerSJONCuYS2FtqVkYoJFCDnb7JplT7tCwYvQwMwz9j7
        +xqiMxwqAZL63jCFC9WvTn++jA==
X-Google-Smtp-Source: ABdhPJwlb9LKAPt+1JJZfwzI5qnxiLn1plPZB/hVTFD7Wsr9En8QaO8UILxVT11UIzG7DUYveun9cg==
X-Received: by 2002:a19:f24a:: with SMTP id d10mr27531787lfk.649.1643906823163;
        Thu, 03 Feb 2022 08:47:03 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id u9sm4328650lfc.168.2022.02.03.08.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 08:47:02 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/9] i2c: qcom-cci: don't delete an unregistered adapter
Date:   Thu,  3 Feb 2022 18:47:00 +0200
Message-Id: <20220203164700.1711985-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If i2c_add_adapter() fails to add an I2C adapter found on QCOM CCI
controller, on error path i2c_del_adapter() is still called.

Fortunately there is a sanity check in the I2C core, so the only
visible implication is a printed debug level message:

    i2c-core: attempting to delete unregistered adapter [Qualcomm-CCI]

Nevertheless it would be reasonable to correct the probe error path.

Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index c1de8eb66169..fd4260d18577 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -655,7 +655,7 @@ static int cci_probe(struct platform_device *pdev)
 	return 0;
 
 error_i2c:
-	for (; i >= 0; i--) {
+	for (--i ; i >= 0; i--) {
 		if (cci->master[i].cci)
 			i2c_del_adapter(&cci->master[i].adap);
 	}
-- 
2.33.0

