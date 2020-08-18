Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43082248B7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 18:25:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgHRQZR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 12:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726990AbgHRQZE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 12:25:04 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDEE1C061389
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 09:25:03 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id w2so9796186qvh.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 09:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TqDr2bIlDLtYnNvZqpiixZQmHFVnxcx4iPQhqi0JosM=;
        b=mYMkTOrzXL2mg6SR9UVW8uflezWrPRs/DctiC1r8m+fUPDVFQLdFdeboWF4U1YTc+t
         T4IuBIdES/07OHLsd5RfUS5PAOk9+FSuTPjhKEKObEA+L7HwwKVzdFySMdRRSUhhmWPr
         qP1qAFIwym901nzt1m8xtlm8NwLmsom3pt8rav9/dPaaCG0uU0gbSTowUNrMSjFEyBLN
         1/EyMGXUXlKchiCkJRRkjxjFdPijtPpyXIqdubcPhumnAT9KHNqlK4nnloVWwWK9LomT
         W7r0F7XLLgRrd776Skp0WqG2xzS3qHVKig9o4lWRhfWMqwJjCHhk45yZF76GaE5JgqD9
         IPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TqDr2bIlDLtYnNvZqpiixZQmHFVnxcx4iPQhqi0JosM=;
        b=FIuu/BiU9Kif3FTh07/5NNoRfmAlpE174kPDViR299sNDg/PVHUbC8wJY67b60McLL
         ntYAAcY9AiV1jyRYWAj1eJjRIdlr02ICJY+Gf4vnkWJx966Pehry53DScen0IgePBM+z
         G2mTfaskLK1ava2WpvawVjohhsXn7pmypnL9AwXla0iMlwg8Lj3I2JsYXG2mBpr6aRU6
         CLIWfqeS1yOmY4IwIXkfebdfL0jI6EZqTuDF0UXWmhejhqP3GIFojj2RGfIKsSEWC7iP
         f3vTQKEBjFVtw0FyVrus4/dgZZYOWEza4lK7MsTocHjqeIColA11qGOObToqigjF1sjx
         D0uw==
X-Gm-Message-State: AOAM533doxi+zKWgtyCcut6LVbJxA8toAXLsg66MlO+29Hd2n4Dk3VnG
        a068r12I0XZ28unhylbMYR+xLgaNU9PPo+nC
X-Google-Smtp-Source: ABdhPJxdyaNiqroS8WWKqzRJMEB/vseMFbiquHGIKVAhsS/bA/m2taL4B7/61/7Fjf/i0dzWoCgz6w==
X-Received: by 2002:a0c:b52b:: with SMTP id d43mr20176800qve.158.1597767902819;
        Tue, 18 Aug 2020 09:25:02 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id d16sm20868571qkk.106.2020.08.18.09.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 09:25:01 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list:VOLTAGE AND CURRENT REGULATOR
        FRAMEWORK)
Subject: [RESEND PATCH] regulator: set of_node for qcom vbus regulator
Date:   Tue, 18 Aug 2020 12:25:08 -0400
Message-Id: <20200818162508.5246-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This allows the regulator to be found by devm_regulator_get().

Fixes: 4fe66d5a62fb ("regulator: Add support for QCOM PMIC VBUS booster")

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/regulator/qcom_usb_vbus-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/qcom_usb_vbus-regulator.c b/drivers/regulator/qcom_usb_vbus-regulator.c
index 8ba947f3585f..457788b50572 100644
--- a/drivers/regulator/qcom_usb_vbus-regulator.c
+++ b/drivers/regulator/qcom_usb_vbus-regulator.c
@@ -63,6 +63,7 @@ static int qcom_usb_vbus_regulator_probe(struct platform_device *pdev)
 	qcom_usb_vbus_rdesc.enable_mask = OTG_EN;
 	config.dev = dev;
 	config.init_data = init_data;
+	config.of_node = dev->of_node;
 	config.regmap = regmap;
 
 	rdev = devm_regulator_register(dev, &qcom_usb_vbus_rdesc, &config);
-- 
2.26.1

