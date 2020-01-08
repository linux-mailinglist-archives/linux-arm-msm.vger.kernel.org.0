Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFC24133972
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 04:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgAHDJ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 22:09:57 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37250 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726146AbgAHDJ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 22:09:56 -0500
Received: by mail-pl1-f195.google.com with SMTP id c23so517053plz.4;
        Tue, 07 Jan 2020 19:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=hZU5YxHkU3BPXm/EGoWnc2P2DRdz8maIfOi1+S2ITKQ=;
        b=r9s5L3T11EwmGK8s+uj6IfNr8tKsayCKEi9uM0itMZUjvH5vHw2n8fXuLmefjLMshG
         sXZfsZFD1cV+vrrYIWDeHPt6oFGh51bbVcd+ZurxPA1ucQwPwkNDzryArNk/YB3aHKWd
         ZB6XyY45Sxk4sEz48gGciTCiMo5ep16wgMEmPyN9fcPT3roGf+RBEBpSnb9xizqJ/AxV
         F6a2Fw+jovC/P7UYEYsbxJOUr7x+ePqaZfO7XTkCO1RK3gBFsfTXdCcN/6QQGDvXw2U4
         aVuMgOFpKOeY7VXU/6EUXpEkTKblbsTXti9hbGfAWPrTT+UeKYMwTNFmSNiTHFK2qv6e
         cPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=hZU5YxHkU3BPXm/EGoWnc2P2DRdz8maIfOi1+S2ITKQ=;
        b=DMIeB2PSnekh1AHpkfjDIiG9kCK5K7N1titdfjsC7Vqd5yE19uFOm0HMZxv0uqPzNF
         A9m4SYPTSOUChYWiDAOjN/DbQcip77j/bD8xUVUNRsJlBV1P9Jp0FjHhFKeRDLKve+75
         xMLkJTz9ZWfna3TW5PIOgy/CcZAORht715fPpmO5oKb9QEfppruq/tGtQDSsNSWne77e
         OG8/SiHaR3Z4n7ejCbiRmBmWktlF1LRLHKeStsftpuINNCAfRxK+YAWLQDT4JpwZjbX0
         y+/77NZbYoUCIa+3fT8TAejtytq/qUeLpZyvqw3R2L8TQAmvkxbfNRsXHP1OBSkLEVqu
         mfKw==
X-Gm-Message-State: APjAAAWidQMkkVYMLGbuDQfxPuclmdIu9GIofLnkaE51RL3TLIZryClX
        GNqlZ+PsRN3JqPvAyCE2FwSceeGne0M=
X-Google-Smtp-Source: APXvYqz+aQ8I/zfUUYqbpZQhlWeuQoPfStzqT/fUpcarS/+IQmWbOXTujKDTFiGiHJiOsEOfaa9bkA==
X-Received: by 2002:a17:902:a9ca:: with SMTP id b10mr3075322plr.23.1578452995858;
        Tue, 07 Jan 2020 19:09:55 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id l8sm946980pjy.24.2020.01.07.19.09.52
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 07 Jan 2020 19:09:55 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     baolin.wang7@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/2] hwspinlock: qcom: Use devm_hwspin_lock_register() to register hwlock controller
Date:   Wed,  8 Jan 2020 11:09:11 +0800
Message-Id: <d69ad8611a68b0cac3c927d19901f3c113c5435c.1578452735.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1578452735.git.baolin.wang7@gmail.com>
References: <cover.1578452735.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1578452735.git.baolin.wang7@gmail.com>
References: <cover.1578452735.git.baolin.wang7@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use devm_hwspin_lock_register() to register the hwlock controller instead of
unregistering the hwlock controller explicitly when removing the device.

Signed-off-by: Baolin Wang <baolin.wang7@gmail.com>
---
 drivers/hwspinlock/qcom_hwspinlock.c |   19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 5a736b0..f0da544 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -121,27 +121,12 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 							     regmap, field);
 	}
 
-	return hwspin_lock_register(bank, &pdev->dev, &qcom_hwspinlock_ops,
-				    0, QCOM_MUTEX_NUM_LOCKS);
-}
-
-static int qcom_hwspinlock_remove(struct platform_device *pdev)
-{
-	struct hwspinlock_device *bank = platform_get_drvdata(pdev);
-	int ret;
-
-	ret = hwspin_lock_unregister(bank);
-	if (ret) {
-		dev_err(&pdev->dev, "%s failed: %d\n", __func__, ret);
-		return ret;
-	}
-
-	return 0;
+	return devm_hwspin_lock_register(&pdev->dev, bank, &qcom_hwspinlock_ops,
+					 0, QCOM_MUTEX_NUM_LOCKS);
 }
 
 static struct platform_driver qcom_hwspinlock_driver = {
 	.probe		= qcom_hwspinlock_probe,
-	.remove		= qcom_hwspinlock_remove,
 	.driver		= {
 		.name	= "qcom_hwspinlock",
 		.of_match_table = qcom_hwspinlock_of_match,
-- 
1.7.9.5

