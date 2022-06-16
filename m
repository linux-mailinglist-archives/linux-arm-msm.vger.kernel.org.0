Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 196DC54EB14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 22:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378640AbiFPU0J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 16:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378684AbiFPU0D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 16:26:03 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07C3C5D1B8
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 13:25:58 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id c196so2446463pfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 13:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bbDBGGsEK1jYVvzMKav/qd1WKubS1sd2Uxf8fAcgTzE=;
        b=SzuOeAxrAHt0py68MK2MIKGmUae4mH1tPgKxoBU+O3Ad0mZeCj815Hr2gdTa4Z0eEd
         fkCdCCHFucZ/fZ+epsJHDTv5Uk/wbPgKxpai4ch9DpoNH5rh2BxbBWwIlsVgvD9oT3Oa
         2D50jvtsAeqfvD5tV5+1iIBNFIwJ7+pgqCtt0KmdEQXT6Ekrb8r6mHZcSV5cjIaByWq0
         +LyEXmySiRwAedVixgeFjDRG4LmjXVdR1h2wFbBAdf18rlII+TYY/302odDf3SH1qHMm
         4+8p8KHwBp64v+PYypFeZxI0EJ2eRzk/JCdRLZ3IDSGd7AaEMWry0OsTg3CNZ6lOfVsK
         K5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bbDBGGsEK1jYVvzMKav/qd1WKubS1sd2Uxf8fAcgTzE=;
        b=N4IQHm7qzo7ehJe4DwDkWbV3CpFnC05XTOUmzxb7evCYWROsJof33x8h4tkiX4ZXIA
         lR3dr+cOW2308nsiHTsRe6Y3xHb3lkacjvDQtZk9LySO0WKfpJPdSCwpaRBsgmas5Am7
         o7QYKPOft3HEpqZD7AhKqf+GS9uai4fkqfuZs8ePy+CZdDBf6NKEMClgsot3fuu/IJQr
         YtTmtDkWHEj8JdagPJKBU/7s4UooX5ny/8dJSTMoDFl2kCc63iwsZZsIV9T6+6G/QjWd
         s6aldJlLn92+WqZ+LATpzA04BIIdysFehlY9lW129vMYBSji378rrVqxTuMmpJ3xVep5
         UQpA==
X-Gm-Message-State: AJIora9huTl8qUE8w3Cp9yc9BamY87El1YUUvcf72mXKst+Wx7FMvfSW
        W7Pyt8PyQ3Cm5dzC5uF58AhUhA==
X-Google-Smtp-Source: AGRyM1tlCYvbmuJBdptri1XDWzKflhHxLGFw/IhDdS1HUrdh8pPFurAGKffCF5X93axKER/tI3VlyQ==
X-Received: by 2002:a05:6a00:1a48:b0:522:9716:4e0a with SMTP id h8-20020a056a001a4800b0052297164e0amr6452320pfv.22.1655411157949;
        Thu, 16 Jun 2022 13:25:57 -0700 (PDT)
Received: from mai.imgcgcw.net ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id a5-20020aa79705000000b0051bb0be7109sm2182960pfg.78.2022.06.16.13.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:25:57 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        linux-arm-msm@vger.kernel.org (open list:QUALCOMM TSENS THERMAL DRIVER)
Subject: [PATCH 1/3] thermal/drivers/qcom: Remove get_trend function
Date:   Thu, 16 Jun 2022 22:25:35 +0200
Message-Id: <20220616202537.303655-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is a get_trend function which is a wrapper to call a private
get_trend function. However, this private get_trend function is not
assigned anywhere.

Remove this dead code.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/qcom/tsens.c | 12 ------------
 drivers/thermal/qcom/tsens.h |  2 --
 2 files changed, 14 deletions(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 7963ee33bf75..e49f58e83513 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -933,17 +933,6 @@ static int tsens_get_temp(void *data, int *temp)
 	return priv->ops->get_temp(s, temp);
 }
 
-static int tsens_get_trend(void *data, int trip, enum thermal_trend *trend)
-{
-	struct tsens_sensor *s = data;
-	struct tsens_priv *priv = s->priv;
-
-	if (priv->ops->get_trend)
-		return priv->ops->get_trend(s, trend);
-
-	return -ENOTSUPP;
-}
-
 static int  __maybe_unused tsens_suspend(struct device *dev)
 {
 	struct tsens_priv *priv = dev_get_drvdata(dev);
@@ -1004,7 +993,6 @@ MODULE_DEVICE_TABLE(of, tsens_table);
 
 static const struct thermal_zone_of_device_ops tsens_of_ops = {
 	.get_temp = tsens_get_temp,
-	.get_trend = tsens_get_trend,
 	.set_trips = tsens_set_trips,
 };
 
diff --git a/drivers/thermal/qcom/tsens.h b/drivers/thermal/qcom/tsens.h
index 1471a2c00f15..ba05c8233356 100644
--- a/drivers/thermal/qcom/tsens.h
+++ b/drivers/thermal/qcom/tsens.h
@@ -65,7 +65,6 @@ struct tsens_sensor {
  * @disable: Function to disable the tsens device
  * @suspend: Function to suspend the tsens device
  * @resume: Function to resume the tsens device
- * @get_trend: Function to get the thermal/temp trend
  */
 struct tsens_ops {
 	/* mandatory callbacks */
@@ -77,7 +76,6 @@ struct tsens_ops {
 	void (*disable)(struct tsens_priv *priv);
 	int (*suspend)(struct tsens_priv *priv);
 	int (*resume)(struct tsens_priv *priv);
-	int (*get_trend)(struct tsens_sensor *s, enum thermal_trend *trend);
 };
 
 #define REG_FIELD_FOR_EACH_SENSOR11(_name, _offset, _startbit, _stopbit) \
-- 
2.25.1

