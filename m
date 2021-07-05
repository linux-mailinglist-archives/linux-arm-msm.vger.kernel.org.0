Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12BFF3BB554
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 04:51:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhGECxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 22:53:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhGECxh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 22:53:37 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89487C0613DB
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 19:51:00 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id f11so9515187plg.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 19:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0w/ce/936AZE4PtNhcMd+7r7gKVsqIHrI5nqRlAtLJk=;
        b=HS4DyokZjNGvEUjCkb3k7+6tLiLu+9QZbUual5EICb3H0E611KtRHmRo8JYvg0TfNO
         Y8kF+Uoy50inNABUw+jcEhAO2vk5lzCbo5cwGzVXbvm3kMflpVoG1R2EBxe29QkX2lNS
         YA5SPYNUXVAK0gL19ki+6EURzdH4Gwt+3OPNGWvCxN/uMitaMWwHt3W86ORvMXf0Uw92
         kzsXMRAJRoO4yOxPxTmYD4zVhadsDfn5ol2kq4nI2PzTtJegJ3+Fo8fBV0vKovxl7lg2
         9KTqQxARG5Zlj0G+6r8qvayrlxpY02gA2pWg//f1Yxi1tNVvs76AalKd1Y2CtibjLqL+
         93cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0w/ce/936AZE4PtNhcMd+7r7gKVsqIHrI5nqRlAtLJk=;
        b=AC4g6wjWiZuQyKOKlWmJCJj/KC0+yPAeXf+KE6AMKQUHmtVASqKjcWBvS1AK3I8llx
         JjnMhHrS2R11DFJC8TUXufwI6xahc6CeJc5xzMHLeIgCWRl1gcsLDr+4nxB70etbueIx
         nrmeuA3dAhs4KtHuw8Lei7vABik13av3zsFUANFfKtbZVvL6z53ReRPK+cpEKbD+1rNG
         +gxPumJfWQxt8Y2sEFlXx1JVk/CJQiEF56pN0RtXzovLrcFpFiQRpBU43/X96ejhaiOZ
         cNAR7+9PsFb8DOB2R18v94dvp3nlvTEhFMEJCKUQAz0C4B52gJWd1lQJgfOdNO9IKJ2Y
         JyNQ==
X-Gm-Message-State: AOAM530O1ZZHXVX9isDzXyRoeJrZ0JjbHtOiqaBGuGcMnzZhX4wMfOWJ
        X3n5QsFe9D6uE0T+q+BPr1CiYA==
X-Google-Smtp-Source: ABdhPJxH+9i4yo7wFWjD0w0TRpb1iYk8WxY/FIwfzUZgWVgaPg6VBySJA65RG9M5Ibx19O7PxyP1uw==
X-Received: by 2002:a17:902:b203:b029:127:16e0:286a with SMTP id t3-20020a170902b203b029012716e0286amr10451169plr.0.1625453460017;
        Sun, 04 Jul 2021 19:51:00 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id i13sm11891041pgm.26.2021.07.04.19.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 19:50:59 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/3] power: reset: qcom-pon: Add support for 'qcom,pon-reboot-not-used'
Date:   Mon,  5 Jul 2021 10:50:32 +0800
Message-Id: <20210705025032.12804-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210705025032.12804-1-shawn.guo@linaro.org>
References: <20210705025032.12804-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Check property 'qcom,pon-reboot-not-used' and skip reboot-mode setup
if the property is present.  This is useful for devices that use IMEM
instead of PON register to pass reboot mode, but still want to populate
pwrkey and resin devices.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/power/reset/qcom-pon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/power/reset/qcom-pon.c b/drivers/power/reset/qcom-pon.c
index 4a688741a88a..85fae9e85878 100644
--- a/drivers/power/reset/qcom-pon.c
+++ b/drivers/power/reset/qcom-pon.c
@@ -47,6 +47,14 @@ static int pm8916_pon_probe(struct platform_device *pdev)
 	struct pm8916_pon *pon;
 	int error;
 
+	if (device_property_present(&pdev->dev, "qcom,pon-reboot-not-used")) {
+		/*
+		 * Skip reboot-mode setup and registration if PON is not used
+		 * for passing reboot mode at all.
+		 */
+		goto done;
+	}
+
 	pon = devm_kzalloc(&pdev->dev, sizeof(*pon), GFP_KERNEL);
 	if (!pon)
 		return -ENOMEM;
@@ -75,6 +83,7 @@ static int pm8916_pon_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pon);
 
+done:
 	return devm_of_platform_populate(&pdev->dev);
 }
 
-- 
2.17.1

