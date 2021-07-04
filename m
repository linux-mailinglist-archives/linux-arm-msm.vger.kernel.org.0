Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B333BABDD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jul 2021 09:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229636AbhGDHnw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 03:43:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhGDHnw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 03:43:52 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A507C061764
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 00:41:17 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id b14-20020a17090a7aceb029017261c7d206so6401409pjl.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 00:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=HDIrJvvsYWuc6ETGsLx0yysZhuZFRshLStXAyTVxX4g=;
        b=G9buf/mi2kfYFqNAooOgyOcPIo1rXsZbVNvtetH9l8NOmQEN5UgVNjEQLaufuxZBct
         C6NoODOdpBytyS5VVR7o7isLsfrIQ0cHw6I+H057eDB/oVKE7g6xMp2ivmAHOrtmmK3x
         o+wkarBQqhC9//45GRpSVZpUEIwO3UxUfnCN/fEtXH3W+v3fMecfCrkBjzaNBFHy26O8
         01pQ2MqU4ibhIhQkRzllM8uSZJpjShNXUonMqxVhi7/K+Rnv/wdLO5SmRi/nnWThqmiZ
         v2yp/rwEtZEa8FL6uzM1bn2yviBSJn36D+YVh9T5lVSq2ckIH9N28JEyHIORogWctRgJ
         zx+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=HDIrJvvsYWuc6ETGsLx0yysZhuZFRshLStXAyTVxX4g=;
        b=NGbL5b1ksyh1XnoZhK1wR+HgdvX3Ig4/IH/+3NjqDfT/p9RM/fV14158u9N8gGq+7V
         RCRZAU3ryTQq63dE8W9J+ey+Kt9c90QyjXVNbsAQSxWvdKP5r7WSMemyP9AiyttVoOip
         UboWlXWhTvsaLuL236Te9Usi7qO9ok7p3XgjB4pUOoeYWyx5vzOy33rrpH69h7f/+LsS
         T9x98m5Na6oG57wBAwI8ek3JRKtytDrd1yRJtNUbHX4dpnrKiVgg+Js7gy5sDzy3sldG
         vA35bXVqIdpLT4jVNWIh9ArlK5WlzIsgOkrD0gwuI8Edsf8bt+U71Aa7+5u8s0BRMWkK
         pmNg==
X-Gm-Message-State: AOAM532ETho0xHTRVyu8YJXX03Xa2GXie8wNh+42WQsVQ23WNsryIWoI
        ZPytr8fJeNDxyuTrAT1xh9iIqA==
X-Google-Smtp-Source: ABdhPJzEyyuaiMSgs2qvy6BH1qMn/CvKTYdpLqMmpQi/HCaX7JNhwS1XTVdpaFoqucne6QjasGQBMg==
X-Received: by 2002:a17:902:d217:b029:105:e265:65c7 with SMTP id t23-20020a170902d217b0290105e26565c7mr7290765ply.16.1625384477169;
        Sun, 04 Jul 2021 00:41:17 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id gz24sm7052956pjb.0.2021.07.04.00.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 00:41:16 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/3] power: reset: qcom-pon: Add support for 'qcom,mode-in-imem'
Date:   Sun,  4 Jul 2021 15:40:45 +0800
Message-Id: <20210704074045.21643-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210704074045.21643-1-shawn.guo@linaro.org>
References: <20210704074045.21643-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for DT property 'qcom,mode-in-imem', which is used on
devices like Sony Xperia M4 Aqua phone (MSM8939) to store a different
set of mode values IMEM rather than PON register.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/power/reset/qcom-pon.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 4a688741a88a..f63d49c72f55 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -42,6 +42,24 @@ static int pm8916_reboot_mode_write(struct reboot_mode_driver *reboot,
 	return ret;
 }
 
+static int pm8916_reboot_mode_write_imem(struct reboot_mode_driver *reboot,
+					 unsigned int magic)
+{
+	struct pm8916_pon *pon = container_of(reboot, struct pm8916_pon,
+					      reboot_mode);
+	void __iomem *imem;
+
+	imem = devm_ioremap(pon->dev, pon->baseaddr, 4);
+	if (!imem) {
+		dev_err(pon->dev, "failed to map imem\n");
+		return -ENOMEM;
+	}
+
+	writel(magic, imem);
+
+	return 0;
+}
+
 static int pm8916_pon_probe(struct platform_device *pdev)
 {
 	struct pm8916_pon *pon;
@@ -66,7 +84,12 @@ static int pm8916_pon_probe(struct platform_device *pdev)
 
 	pon->reboot_mode.dev = &pdev->dev;
 	pon->reason_shift = (long)of_device_get_match_data(&pdev->dev);
-	pon->reboot_mode.write = pm8916_reboot_mode_write;
+
+	if (device_property_present(&pdev->dev, "qcom,mode-in-imem"))
+		pon->reboot_mode.write = pm8916_reboot_mode_write_imem;
+	else
+		pon->reboot_mode.write = pm8916_reboot_mode_write;
+
 	error = devm_reboot_mode_register(&pdev->dev, &pon->reboot_mode);
 	if (error) {
 		dev_err(&pdev->dev, "can't register reboot mode\n");
-- 
2.17.1

