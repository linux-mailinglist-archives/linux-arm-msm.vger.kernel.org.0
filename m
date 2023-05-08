Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA4316F9D00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 02:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbjEHAdT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 20:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232024AbjEHAdQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 20:33:16 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5D0900D
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 17:33:13 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4efd6e26585so4404446e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 17:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683505991; x=1686097991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8of//y9tmokmOnW15e6yt8zqMt9fsDSSEcIh47rbdE=;
        b=ukzmHOvAzKhbsC+vRRu8jnk5KuhLDT8OPvpzT7L5H1KT2yrZ18KyLdRB0g1SL9AuNi
         uoz6lT90CVsqvoovRcDnDHXtZFT3X3eQTz0uLXELkImq6Rx8HqMYOKTQXg3kmmvsORoF
         AWNlV3tWPggfh9hlG/lrTX0ZN4WzP7lCkqFhn4H3RHlgz34OoF4+7tePiQZ2z19ZJNAC
         Qn2ymMC4nVLPSD9nVo+tLO4r+05Ce3fj7rAyL8TKMFIxlYeQG5ZMkP8feUNV6xFhB/8c
         r7RjYXeFT6C0xs6xUncjF68l9OXx674isYnZw+NyWUsCaobOaniuCGydHYLyq/6eri4k
         5KQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683505991; x=1686097991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8of//y9tmokmOnW15e6yt8zqMt9fsDSSEcIh47rbdE=;
        b=H7AlcHBuIPZsEN0pv/yVVrCH63GvfTfr/aW7126ABw6AYFno472y9d1iP2u2qJin3t
         nqkRgkKU8xoXYBobbAKESVIWbUH1s41M1fOIlDIfcUCjiXGvwlOah8Hl0PZh9KcYELvF
         m46Q36SQ5uYWSeX6Wz5UQ21gD7t0lXEB+JNKy7y1m5n8blEo8lBTkkac5zt9SwJ/tyeU
         W5gEzZc4Psb7adGXK6wZapARETE2EFbgguhF9IoiH60i+sOxWdBrnHIFZKYBUzeoXTjG
         eCPIOQfiKilbkYTUwZzagMvKkTpjcTf0orTBTcyQ0AJe/eM2JoVrIW+wLnakwgrTZPk9
         SWcA==
X-Gm-Message-State: AC+VfDzytw0riIVVtFaMw8VxJ+IeQKasIkX69wt5jdeVKaZxXDvhgf4Y
        wNZ9QBlFXKAky/1pN0AOU+oirA==
X-Google-Smtp-Source: ACHHUZ44NqiQ1895aRzXNFMIqcgVMZnXUn1OTYCnD9yL63LfBMUD/9kIqLcMvXZ3h5jGYN74eZ4msA==
X-Received: by 2002:ac2:4907:0:b0:4ee:c134:8220 with SMTP id n7-20020ac24907000000b004eec1348220mr2187824lfi.30.1683505991620;
        Sun, 07 May 2023 17:33:11 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id m22-20020ac24256000000b004eca2b8b6bdsm1114807lfl.4.2023.05.07.17.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 17:33:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/6] power: reset: qcom-pon: add support for pm8941-pon
Date:   Mon,  8 May 2023 03:33:05 +0300
Message-Id: <20230508003309.2363787-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508003309.2363787-1-dmitry.baryshkov@linaro.org>
References: <20230508003309.2363787-1-dmitry.baryshkov@linaro.org>
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

For PM8941 we don't have a defined field to store the reset reason.
Support wrapping pwrkey and resin, but without writing the reset
reason.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/power/reset/qcom-pon.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 16bc01738be9..d42475bc0ee6 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -17,6 +17,8 @@
 #define GEN1_REASON_SHIFT		2
 #define GEN2_REASON_SHIFT		1
 
+#define NO_REASON_SHIFT			0
+
 struct pm8916_pon {
 	struct device *dev;
 	struct regmap *regmap;
@@ -45,6 +47,7 @@ static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
 static int pm8916_pon_probe(struct platform_device *pdev)
 {
 	struct pm8916_pon *pon;
+	long reason_shift;
 	int error;
 
 	pon = devm_kzalloc(&pdev->dev, sizeof(*pon), GFP_KERNEL);
@@ -64,13 +67,17 @@ static int pm8916_pon_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	pon->reboot_mode.dev = &pdev->dev;
-	pon->reason_shift = (long)of_device_get_match_data(&pdev->dev);
-	pon->reboot_mode.write = pm8916_reboot_mode_write;
-	error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
-	if (error) {
-		dev_err(&pdev->dev, "can't register reboot mode\n");
-		return error;
+	reason_shift = (long)of_device_get_match_data(&pdev->dev);
+
+	if (reason_shift != NO_REASON_SHIFT) {
+		pon->reboot_mode.dev = &pdev->dev;
+		pon->reason_shift = reason_shift;
+		pon->reboot_mode.write = pm8916_reboot_mode_write;
+		error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
+		if (error) {
+			dev_err(&pdev->dev, "can't register reboot mode\n");
+			return error;
+		}
 	}
 
 	platform_set_drvdata(pdev, pon);
@@ -80,6 +87,7 @@ static int pm8916_pon_probe(struct platform_device *pdev)
 
 static const struct of_device_id pm8916_pon_id_table[] = {
 	{ .compatible = "qcom,pm8916-pon", .data = (void *)GEN1_REASON_SHIFT },
+	{ .compatible = "qcom,pm8941-pon", .data = (void *)NO_REASON_SHIFT },
 	{ .compatible = "qcom,pms405-pon", .data = (void *)GEN1_REASON_SHIFT },
 	{ .compatible = "qcom,pm8998-pon", .data = (void *)GEN2_REASON_SHIFT },
 	{ .compatible = "qcom,pmk8350-pon", .data = (void *)GEN2_REASON_SHIFT },
-- 
2.39.2

