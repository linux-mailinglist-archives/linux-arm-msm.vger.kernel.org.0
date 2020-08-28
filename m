Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1EF9255443
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 08:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728379AbgH1GIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 02:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbgH1GId (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 02:08:33 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 515CBC061235
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 23:08:30 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id d22so120334pfn.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 23:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qLAjxAlrCMxjNqyejiXq+bbcpAkao+Zf6GfSzx0XooU=;
        b=nswnWFQbby8eZequAZEvYr5Jjuak9S+823ghqqWSTOTx7ja8VvGzt34RFq7Gzj5Abi
         mqqgRT9USNbs7wAf6cAaSnQZr+w/4wYerRcnbL0oOEWM6hCcY3Vocb/SSmcZPg78yRE6
         q75+qzqdofCkOZl0rpSPtLVi0c8EVv9FLOS+Zx6tMtvpWUMnEdb7ZWmLnZgV3ycdstGM
         r9XQWao1BfH0AB4xtBxP222lSqQy1FDwukTDHWeDDY70cCjFlBWLkUKv4awU1xLUWw3b
         Dur0w0aqQ2Pmdxn7V2PB6RKn1yWMuRkcK+mf+/9QcVmjV88175vdUHylZ2X32cRE1u8W
         mR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qLAjxAlrCMxjNqyejiXq+bbcpAkao+Zf6GfSzx0XooU=;
        b=SKG2zBFX3XMCdmnULp0ZPPFZzgn/6/UfLQKBMo4THW5+v42VfEmCrb1oiYPXb/tjGD
         VR50L1UkAyt8ltxrvDn3qouG5P+b+8hV2WklbtqFREoA8lvqqJS6/Tu1z5nC7xYyIjnV
         i+5oOnfQr0KJARePAGrjYxhxX3Na+Lx0HRWJQuORgckfisbUElpvua67yDo5sUcTgf60
         RHYShUTJmVE6V5CQlpObsC0jLGG6SvF2bzDtvy3FinfpNGAXOUVT0B9ek6E8pDe6DJET
         sQAx51HGH5cpx7WePKN8cRo/zojxB7nmX8qfNuPPScXgbocdb2lBjKfj4IjIfR6USBmx
         bHdg==
X-Gm-Message-State: AOAM530BgNgO9s5aYgdiu2CusmOu6H0i+D/GHumz21HqmmxZus53Ma5i
        vrEeHBdQnSd0zaSWLv4nT01X4A==
X-Google-Smtp-Source: ABdhPJyOvvn+Q4rakrGQQ+Rd00VJpVXkec/r5tPCVFYNJTonrdI62sp+3CUmwsvFmBSkJ4FswUjBUQ==
X-Received: by 2002:a63:1d5c:: with SMTP id d28mr96622pgm.82.1598594909878;
        Thu, 27 Aug 2020 23:08:29 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id cv3sm92193pjb.45.2020.08.27.23.08.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2020 23:08:29 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     rnayak@codeaurora.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 5/8] spi: spi-geni-qcom: Unconditionally call dev_pm_opp_of_remove_table()
Date:   Fri, 28 Aug 2020 11:37:50 +0530
Message-Id: <ea0864d41277e61fa31d304fbd4cf9af6b314269.1598594714.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1598594714.git.viresh.kumar@linaro.org>
References: <cover.1598594714.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dev_pm_opp_of_remove_table() doesn't report any errors when it fails to
find the OPP table with error -ENODEV (i.e. OPP table not present for
the device). And we can call dev_pm_opp_of_remove_table()
unconditionally here.

While at it, create a new label and put clkname on errors.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

---
V2:
- Compare with -ENODEV only for failures.
- Create new label to put clkname.
---
 drivers/spi/spi-geni-qcom.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 80cea5cd3612..0dc3f4c55b0b 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -613,11 +613,9 @@ static int spi_geni_probe(struct platform_device *pdev)
 		return PTR_ERR(mas->se.opp_table);
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(&pdev->dev);
-	if (!ret) {
-		mas->se.has_opp_table = true;
-	} else if (ret != -ENODEV) {
+	if (ret && ret != -ENODEV) {
 		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		return ret;
+		goto put_clkname;
 	}
 
 	spi->bus_num = -1;
@@ -669,8 +667,8 @@ static int spi_geni_probe(struct platform_device *pdev)
 spi_geni_probe_runtime_disable:
 	pm_runtime_disable(dev);
 	spi_master_put(spi);
-	if (mas->se.has_opp_table)
-		dev_pm_opp_of_remove_table(&pdev->dev);
+	dev_pm_opp_of_remove_table(&pdev->dev);
+put_clkname:
 	dev_pm_opp_put_clkname(mas->se.opp_table);
 	return ret;
 }
@@ -685,8 +683,7 @@ static int spi_geni_remove(struct platform_device *pdev)
 
 	free_irq(mas->irq, spi);
 	pm_runtime_disable(&pdev->dev);
-	if (mas->se.has_opp_table)
-		dev_pm_opp_of_remove_table(&pdev->dev);
+	dev_pm_opp_of_remove_table(&pdev->dev);
 	dev_pm_opp_put_clkname(mas->se.opp_table);
 	return 0;
 }
-- 
2.25.0.rc1.19.g042ed3e048af

