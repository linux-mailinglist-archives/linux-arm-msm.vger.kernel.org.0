Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC75455510
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 18:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729972AbfFYQst (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 12:48:49 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:36121 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730860AbfFYQro (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 12:47:44 -0400
Received: by mail-wr1-f65.google.com with SMTP id n4so17474026wrs.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 09:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bWqeg/uRBmP4v1S0mrfdgUlh6T/cak+6t6geY/+2zUc=;
        b=unkd+FMrbJN9AzanjOJ4wpmc5HlH/ET5TudwrnAvOcWYz1FhJuNWwwXVCCo/y84G6i
         nH2bHVyL1b8OXnBdWWvQ9MPcfVs/5S5DYUf7iCUuZS47RVYNIleEcEDKbEsYWLMeLJ6e
         TLKLP7ZrGuZSCTyJbu20xIi0iuhnhI4FBK6EYE/Os57yaBo1IYfBAiv9pUjyFW/4j6Q2
         rpsOjD52BAjQRBC4//y1jisx8bzNWSTn0Xf52FSCHwQHBaHwrjO82XvDAsHMtRvJpfDn
         9iuwnV+CGdKw0aqvwaspbpSaq14/rrZ3eqD1COJr+X3VxcezUlVryu0Eo02Tqu9s5TrR
         DbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bWqeg/uRBmP4v1S0mrfdgUlh6T/cak+6t6geY/+2zUc=;
        b=a1cgpsoFHDyjMgAc6It1EK0k+vdXxOMqtphfDCul3MdkOfpe4TN3USCblHmp3g4tLV
         8C5l003Ns7pN2S5A/a6dIOxfBctrnNmYldPuQ2QttfL//fetY7ARkcm1tne0bGdsQdnO
         rciJXL57hGl1hjHCcED0ZwApmnOWfI7Vy/HZHjp6UdG/12/pmWocCrA5/A5kGvZW3X7Z
         Z/BU4V+ZJ2HCjZDD8oGmi2GYJJNnM9gM3VZoTYKrnteUayD8tIBOlB/3VcyqEhoSRusm
         pXybzD0HWHBu4xXBlNJ2CvDo3+peszeIFkpQvNVuVZIOymzumMO2aO26Jr1/nL+D1gXj
         fgwA==
X-Gm-Message-State: APjAAAWyxts7gKUcmb48uVmUfwWmepQIcPqvsFRwIXHG5MXrYJWPflaf
        rW0YtbeSZuKzkryRKzONbe237w==
X-Google-Smtp-Source: APXvYqy6K2OKJaRWYw2cM2myPOUo982DJCOgC+HO5QqOBSGkx5aQTFdQWGebuD8lsFMVewG0rHya+Q==
X-Received: by 2002:adf:f948:: with SMTP id q8mr17100963wrr.196.1561481262770;
        Tue, 25 Jun 2019 09:47:42 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.41
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:42 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        jassisinghbrar@gmail.com, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com,
        arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de,
        sibis@codeaurora.org, enric.balletbo@collabora.com,
        jagan@amarulasolutions.com, olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v3 03/14] mbox: qcom: replace integer with valid macro
Date:   Tue, 25 Jun 2019 18:47:22 +0200
Message-Id: <20190625164733.11091-4-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
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
---
 drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
index a05dc3aabac7..c8088e9caf02 100644
--- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
+++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
@@ -97,7 +97,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
 
 	apcs->clk = platform_device_register_data(&pdev->dev,
 						  "qcom-apcs-msm8916-clk",
-						  -1, NULL, 0);
+						  PLATFORM_DEVID_NONE, NULL, 0);
 	if (IS_ERR(apcs->clk))
 		dev_err(&pdev->dev, "failed to register APCS clk\n");
 
-- 
2.21.0

