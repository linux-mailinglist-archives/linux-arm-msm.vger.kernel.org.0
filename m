Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E154EB7EEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2019 18:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390448AbfISQSZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 12:18:25 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:41134 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390392AbfISQSY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 12:18:24 -0400
Received: by mail-qk1-f196.google.com with SMTP id p10so3955491qkg.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Sep 2019 09:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=3Yye6iqRCV5drve2C5oFfaJYT6iHjklqWnjrwbuk4nU=;
        b=DfOsUoTIpzx2QhunV87jDAkhaGaTZF2Wq9kXmOpB+RnTf0cmun6xSFOeGFWc1nlk8i
         Vbi2UOvCcag/k7KveMGBxKzBCg6linJ09RjddursD6qERVdl8RmzZcglttS95B1AtRz6
         t0IdbZ8RQ+GvXnvBMXLvdH/2Wqp8GvwjAwV5dnZ+0E9T/erjw84k5KwDogl1K9OSL3VL
         1v5O8ENeEjqq3rbwd2pzUsMXosH69kJ4BcjnYaBudSzO8rxxyM0a/p67VWhjO9pIZ7vH
         6h//AyT8kI2oXAKMshKUTETDne/WMwb/v06zc89YrcaE1VSOwHQ3Mu6c8Pnl6eplsePJ
         iSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3Yye6iqRCV5drve2C5oFfaJYT6iHjklqWnjrwbuk4nU=;
        b=frxkmjuQ5G6CAJubOaKd26FX+AJs4mUjWLXB7RIVq0AkHuBgmNbClgLyfQ7615JJuV
         iz45N1Wy/fdU/9q08DfuhcUmsayknL7T9oncwq/PFe6FweKakeX0xuIDdSLyS3lEyECj
         /8dyrzdL3TkGPD9YZttkyedO7IAbo3b35IxOW+wbyQI+Byfmey7+vaA4dEjtjJqriEPA
         TJaf9PuLUlMIcsz9w1NPGTAti0rTMEJf9b3VeyDlKUnvebBj1MOW3RatP2CxM2FQriW3
         qNZhU6XwpCPrV9X7fcJCKkiq2COipcQ8vhqfiuDbfCszq4tlny7MDjAP4ZGG8AbddAex
         EBMQ==
X-Gm-Message-State: APjAAAXASzeQ0EUYgJ1RLSLF/r2gFoTlx6C30Zb7rie7mHI/9M+pcmgy
        hFOgOxbKffIvwvXvwrRFRAWi7g==
X-Google-Smtp-Source: APXvYqwxFzSC67Uj/43CUBfNaRyYl2MKB2Q0JUrBMbcegGoYZlv0KJ4P+lO0843mrSwB6NClo3xNdQ==
X-Received: by 2002:a05:620a:694:: with SMTP id f20mr3781309qkh.379.1568909903952;
        Thu, 19 Sep 2019 09:18:23 -0700 (PDT)
Received: from Thara-Work-Ubuntu.fios-router.home (pool-71-255-246-27.washdc.fios.verizon.net. [71.255.246.27])
        by smtp.googlemail.com with ESMTPSA id q62sm4561185qkb.69.2019.09.19.09.18.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 19 Sep 2019 09:18:23 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: Invert the cooling states for the aoss resources that can act as warming devices
Date:   Thu, 19 Sep 2019 12:18:22 -0400
Message-Id: <1568909902-8446-1-git-send-email-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.1.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thermal framework takes 0 as the lowest/default state for a
cooling/warming device. The current code has the order reverted with
1 corresponding to lowest state in hardware and 0 the highest state.
Invert this for a better fit with the thermal framework.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/soc/qcom/qcom_aoss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 33a27e6..006ac40 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -44,7 +44,7 @@
 
 #define QMP_NUM_COOLING_RESOURCES	2
 
-static bool qmp_cdev_init_state = 1;
+static bool qmp_cdev_max_state = 1;
 
 struct qmp_cooling_device {
 	struct thermal_cooling_device *cdev;
@@ -402,7 +402,7 @@ static void qmp_pd_remove(struct qmp *qmp)
 static int qmp_cdev_get_max_state(struct thermal_cooling_device *cdev,
 				  unsigned long *state)
 {
-	*state = qmp_cdev_init_state;
+	*state = qmp_cdev_max_state;
 	return 0;
 }
 
@@ -432,7 +432,7 @@ static int qmp_cdev_set_cur_state(struct thermal_cooling_device *cdev,
 	snprintf(buf, sizeof(buf),
 		 "{class: volt_flr, event:zero_temp, res:%s, value:%s}",
 			qmp_cdev->name,
-			cdev_state ? "off" : "on");
+			cdev_state ? "on" : "off");
 
 	ret = qmp_send(qmp_cdev->qmp, buf, sizeof(buf));
 
@@ -455,7 +455,7 @@ static int qmp_cooling_device_add(struct qmp *qmp,
 	char *cdev_name = (char *)node->name;
 
 	qmp_cdev->qmp = qmp;
-	qmp_cdev->state = qmp_cdev_init_state;
+	qmp_cdev->state = !qmp_cdev_max_state;
 	qmp_cdev->name = cdev_name;
 	qmp_cdev->cdev = devm_thermal_of_cooling_device_register
 				(qmp->dev, node,
-- 
2.1.4

