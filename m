Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2923D248B17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 18:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgHRQHN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 12:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727063AbgHRQHF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 12:07:05 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BE17C061342
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 09:07:04 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id f19so11016338qtp.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2020 09:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y386kLDluYhTkeZZcoth4CmBIL7yeTWq5GsKaF+vTi0=;
        b=L+AiYF7wIH6A3JnmlEsCVFMWKj6Hc1oNQjevz0x+hQXBWjTNitoWNoLLzaXhN5P8nY
         T+c+cRfXlO4rvNAITs9KG9JqnfcLDy4LbF8D0XK7v3BDPJFPRJmnobWbigymyJQMD+sm
         hN/yBUuqb7V2bBFwGrywJtvL4jafxPgUvplu2LVLaZg8yoyrnv9XU88+xc/Y4f2yZ9kh
         FTfq668It2Sji0vHv5sbgV2k0+ehS6gXUXMx16hT3w6uzNOjKfPail1bkxE8FRz2Cb/u
         plJ9paM72XzvcM+elxADP/wGQ+hLpgkLte7sIZNRQhhzmYZoeJ75XoFx5LSA6HsUUU3b
         ZFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y386kLDluYhTkeZZcoth4CmBIL7yeTWq5GsKaF+vTi0=;
        b=CY6uj9HUMKdu8aqhYmRMmuTdAuCAnuGShUKTt0B2D8frHR8Bsmr4SrCKl/GgQ12sGf
         BWQVkkySZw+JqzzzYt15BDZE7WQKr7VU/i7DsZKz69K7SoOOjPnZrsFFOz2EIWBhlcQm
         92WomH+q5188LQcVvI53YETT9MsBQoSRME5npLjESJYrZeyi7SUJRpQl4Eoo4AAYqi0Z
         RkU4EQlxyrM3AD5tWsMdLUEAJnlBT83p/qilvax8L8/eyG+IeVJTx6+hxMILWRgeGzwb
         6RK7StSJJkRvdNlDWJJST+JIfIIIuj32aNu1C/bAb00ec0WB6RWxDCTN6fB1M3CqGEwX
         UjpA==
X-Gm-Message-State: AOAM532K9RgICnP9p28wPbZdWnnVYOLede5bGfYUie5Br1KL3InyNVZb
        Q06DWQyzZKFSK+MU/5I0RFHaKR9HM+ktavfp
X-Google-Smtp-Source: ABdhPJw6YK6zbb7lcw9y5lvgjXDy9DqHhKgTNBaFMkwYLP14JDsE/uxgxu5Qty/6l6GsILNdk5DfMA==
X-Received: by 2002:ac8:1b0f:: with SMTP id y15mr19000781qtj.144.1597766823586;
        Tue, 18 Aug 2020 09:07:03 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q68sm21096654qke.123.2020.08.18.09.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 09:07:03 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list:VOLTAGE AND CURRENT REGULATOR
        FRAMEWORK)
Subject: [PATCH] regulator: set of_node for qcom vbus regulator
Date:   Tue, 18 Aug 2020 12:06:49 -0400
Message-Id: <20200818160649.19585-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This allows the regulator to be found by devm_regulator_get().

Fixes: 4fe66d5a62fb ("regulator: Add support for QCOM PMIC VBUS booster")
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

