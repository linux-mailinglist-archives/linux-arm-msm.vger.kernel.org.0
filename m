Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C217D7CE5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 22:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730592AbfGaU3n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 16:29:43 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45119 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730618AbfGaU3m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 16:29:42 -0400
Received: by mail-wr1-f67.google.com with SMTP id f9so71055783wre.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jul 2019 13:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NEmCczScxOjFfK/GsZ795dKDEuO/wf3t9hNmpIlsOQI=;
        b=hVxBbGLxp9nBG9Wcv2HdfdMCNV32nrL7qr4oIHv6YAjNjZuP6DD7+KIkdTr3G8XtqO
         GNfKrWRdzVaTPUf5iYS1UPRE/b4fb4iv04MkxPSmoUA0Qw2D0hlnABROeUOEuf6tDQz+
         9DktQ0M6HjCpCmqYB+ilZfaERcLvPYmt/rjB1UHqD96XuhqohGRjIF/a1JUudwTqWwXv
         TQu64FrrknFGTgJpdR3Oe/fzOxiDv2ra9nXAUPJy1E7gy1TUrRJyeloZtEQvehEw91iy
         VeXRmgeRYNM71OCIf8j5Ofbm3Wmyz0+QgG6zvUHiSaOM46hQ3PZZV+0YnB2SwWPiNVa7
         3UTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NEmCczScxOjFfK/GsZ795dKDEuO/wf3t9hNmpIlsOQI=;
        b=XkNV+dAkYTG/64aE2ixfuTN/DjjoQ2GKXMrhQZvYR4Br5zy4RAG1SZPcAvCiOzC5LO
         JrdTEDVqzaRv0x0woM3L5sWxU9aZ4CViQ/t7qQ592XgfUoi5AJ4HJJSBLMNkQn+mnc/6
         psxCqjwPEJ8wqdkNu6NLFkqUg7jy/ITmALntOrBNe3ZSqbnZVL73hzzHNC50s8w7+Y4T
         2BmsdIrjHkVK8hpC9VrI2GbRRBtXXQkqVYTGRcic45ZH/Npjy9Nxp/ESWkgNsYslxBqB
         YLFE81u+WtS6rnKinOAOEvwgWGlC3mpOLmeqj+TmLWpzG6b+wTnpM0HfSPgfBz8MFKob
         amSQ==
X-Gm-Message-State: APjAAAU8ocojeX7YDgY+86a3koXLWc5wcoSEpRxZ7DrPrb0mLTBao9Ne
        wEWUPVlPPmPYPQrEg6OcXuaDKg==
X-Google-Smtp-Source: APXvYqwxqNh76ilAXBl0acEjqmK4eWnyg7XTy6i4qt2w/M1m7vLbwwMLhIUJnvXnxMJ7Mj1hB0zAVQ==
X-Received: by 2002:adf:e444:: with SMTP id t4mr34971356wrm.262.1564604980079;
        Wed, 31 Jul 2019 13:29:40 -0700 (PDT)
Received: from localhost.localdomain (19.red-176-86-136.dynamicip.rima-tde.net. [176.86.136.19])
        by smtp.gmail.com with ESMTPSA id i18sm91905591wrp.91.2019.07.31.13.29.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 31 Jul 2019 13:29:39 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, bjorn.andersson@linaro.org,
        sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v4 03/13] mbox: qcom: replace integer with valid macro
Date:   Wed, 31 Jul 2019 22:29:19 +0200
Message-Id: <20190731202929.16443-4-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
References: <20190731202929.16443-1-jorge.ramirez-ortiz@linaro.org>
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
index 76e1ad433b3f..dc198802bdf7 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -96,7 +96,8 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 
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

