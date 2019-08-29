Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B999AA13A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 10:28:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727051AbfH2I2H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 04:28:07 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33093 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbfH2I2G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 04:28:06 -0400
Received: by mail-wr1-f65.google.com with SMTP id u16so2516011wrr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 01:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oQKJ4w6YoHutt4+BvrwIpTgCCRkhhS0pM3V90Cc8mHA=;
        b=M8VNqIQNjtwzg/2qW6autWdJppvUlnXIbFJQA+oIzdQRjJ02mldBl5mucPrvv+WNOm
         ZLBcX3ZavEOwGS4GL6xzrwg+eiEgE+igk5tR2585eUBE6V2UMogk3hyESMoLhNOj6fxo
         iOZhgC9yUG+MyCj+efiHkHXa1jMMdNprsOl7fuAv8/qh6oGuw5/OvmQitiYcX6VQnobL
         x16PFEkXTI/wdWNRm+hHewO7OohAyYtghKzJ1YifA9auzzhwgrhoOxf9hvFyjdWpEXwu
         9GmWM5KhSSBiMGO9TheO5yxKXsW7mF2mxi4HZ5vkqtTvuKWwVCprIgZwDZJOtXcDLfwN
         ic1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oQKJ4w6YoHutt4+BvrwIpTgCCRkhhS0pM3V90Cc8mHA=;
        b=mCsXe3ZlKRouNddyOFOneu6a0UwzXa75jiDETjEomXa6uoQJTGQZlJtV1pEPc2KDt1
         lb7pRFUl/gcUJI3XQZVsN85Jk2J4SLsBIAHaZI8lcYl8HyWV5jJ1CPfZaB5s2nmoJWlA
         jzqj3Lscoyjw7ihCK8EpjAA51QYDneKdTAqf59tItbD41jwVc7LXDR9frh0MFoxXIhd8
         kQYhIaPJ6f/gLqMDWTMGUPRoc631m5aaWoB9yJf6nu9F9Jw62mKeriVRr/AlSj3XRc+2
         pKiN62IudAyHPZDGdFIx/qwdppoyiSneYWu9ddgm87hXO74q5+t3g5OiL6FsJB5wSiY+
         4VXA==
X-Gm-Message-State: APjAAAUDrJtwIUK+1aA84v3TvdnOnav0pgykkXAIBg2SL8XalWyBJQxt
        uadv9w6niRxiscMFT7WjSg+QQg==
X-Google-Smtp-Source: APXvYqy0MrPyIrGBeNLd2n0PD8UK6uHuUVl45cMyiHumdivt0qu+Y4eISNgGBFhgPst+AF403vhpIw==
X-Received: by 2002:adf:8444:: with SMTP id 62mr6920038wrf.202.1567067284493;
        Thu, 29 Aug 2019 01:28:04 -0700 (PDT)
Received: from localhost.localdomain (124.red-83-36-179.dynamicip.rima-tde.net. [83.36.179.124])
        by smtp.gmail.com with ESMTPSA id f24sm1884489wmc.25.2019.08.29.01.28.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 29 Aug 2019 01:28:03 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        agross@kernel.org, jassisinghbrar@gmail.com
Cc:     niklas.cassel@linaro.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mbox: qcom: replace integer with valid macro
Date:   Thu, 29 Aug 2019 10:27:59 +0200
Message-Id: <20190829082759.6256-3-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829082759.6256-1-jorge.ramirez-ortiz@linaro.org>
References: <20190829082759.6256-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the correct macro when registering the platform device.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index d3676fd3cf94..7870edb4405b 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -96,7 +96,8 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 	if (of_match_device(apcs_clk_match_table, &pdev->dev)) {
 		apcs->clk = platform_device_register_data(&pdev->dev,
 							  "qcom-apcs-msm8916-clk",
-							  -1, NULL, 0);
+							  PLATFORM_DEVID_NONE,
+							  NULL, 0);
 		if (IS_ERR(apcs->clk))
 			dev_err(&pdev->dev, "failed to register APCS clk\n");
 	}
-- 
2.22.0

