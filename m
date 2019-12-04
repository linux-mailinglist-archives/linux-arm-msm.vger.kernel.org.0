Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 093DE112710
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 10:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfLDJWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 04:22:44 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41706 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfLDJWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 04:22:43 -0500
Received: by mail-pl1-f196.google.com with SMTP id bd4so2917975plb.8;
        Wed, 04 Dec 2019 01:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=hZU5YxHkU3BPXm/EGoWnc2P2DRdz8maIfOi1+S2ITKQ=;
        b=SJQU3xhDgVQLlqA2PNtmG0PvjtPCUUFyIjwfkUQwJg5y6Fl0apVSgQohqruxl80yaA
         NacX44nKHdGBRWHkNNaneKAV4PnO+SJTAafIId/KbpgyqXo80LHYLyXBIw63Yr7x+gHK
         HD1IQot5k1EHAs8UY1vJJHSEbmazKaoWAvOwd7ukxsb+HUfx+Ou1ZggyA13Z9dO07PRy
         B2hGCqKEjrQ4Gxwsey6NMhd33mkrPBZUsIhFJMYatvKVpescHhkzXJLJq4Sw55z8vgEL
         CDNTul6c6XPKAzzstA7BfEMYZD1QPZSeFagu620532gYaqEg9tfFvVCZb2Ty07wSAhVN
         ySTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=hZU5YxHkU3BPXm/EGoWnc2P2DRdz8maIfOi1+S2ITKQ=;
        b=ivP1dZRfGmDxnhoTg6p7dJeLygml8ECqLneeZWdWMX5yOJFp+O1qJaQaXmSJmGAKXL
         Ie2ZhBae7m+ClSU232KG2PJAM9t+x8tH4aojrSwlowBfLZkvQ9pOw6xpVQpt2WD7d9c1
         1bqUrGx+kRi/hfawW1EuTIXWyPTN/zHUgciSFBX0zjlCJ/Y5OaqugkuVoYLAOn40f24w
         36Uaq4slMJVOJG0gbxjX0zdLigBfBNyyDpkr8NFUtJAwNuQlxKpfc/ueGyu/4Ss8H59I
         cQX2upS1wijn+LD1QhnHHpxaNqKkbjPLAcO+KvVeTddFA804oh1ryd9V6K8yGy6CRnXM
         oaYw==
X-Gm-Message-State: APjAAAUfnZhte2wan2T/q/ESFMjuh0Ae7Mc7jprUBLdU3AesP1YVzQAx
        wfq3X0oV4YXEjRNfr7hxEWY=
X-Google-Smtp-Source: APXvYqwtJxyIzM+0Lur95xbbn08J833jO87snr2ayTE6zkLZjZzC/85XdLOqOU6pNai9yJyCEFTX1w==
X-Received: by 2002:a17:902:968b:: with SMTP id n11mr125690plp.120.1575451362767;
        Wed, 04 Dec 2019 01:22:42 -0800 (PST)
Received: from baolinwangubtpc.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id k21sm6482914pgt.22.2019.12.04.01.22.40
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 04 Dec 2019 01:22:42 -0800 (PST)
From:   Baolin Wang <baolin.wang7@gmail.com>
To:     agross@kernel.org, ohad@wizery.com, bjorn.andersson@linaro.org
Cc:     baolin.wang7@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwspinlock: qcom: Use devm_hwspin_lock_register() to register hwlock controller
Date:   Wed,  4 Dec 2019 17:21:57 +0800
Message-Id: <b75f06a1a9d91762cbeb041203d47f1ffc2f8204.1575450802.git.baolin.wang7@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1575450802.git.baolin.wang7@gmail.com>
References: <cover.1575450802.git.baolin.wang7@gmail.com>
In-Reply-To: <cover.1575450802.git.baolin.wang7@gmail.com>
References: <cover.1575450802.git.baolin.wang7@gmail.com>
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

