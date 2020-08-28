Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B401425544C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 08:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728355AbgH1GIg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 02:08:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728363AbgH1GIg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 02:08:36 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA1AC061235
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 23:08:36 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id t185so103714pfd.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 23:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6WRaTf2Gohs3TLDF3wGUQ9G9N5Tc23L6BtLjYGmLUEU=;
        b=SrxGfjlSHtoZ53w0yyeRWoksRPUDvXuF1tQa3TC5eogwV/wMrojFJRLdBDMb3Ib8mD
         i7go8otHdJq4x1NpJaeFnV8xSSLxcGZmmVjFfAetnMo50XydrewRQU9KxK/sW22Myw4e
         tmyNlpYJIspq1QaTaVJ10pL2hyZ8S3nXjPJL8oF8taR7RmxlGBm5zCeVwAbMhSHzUlhd
         AMES7c2ZwjCskrC9mBKSuFz8eQWRRf1fi1SJEffyVFwIv1IPK4e2+OXNISP0w2pTv4cl
         HvUScEBmNMhQb1UA8GCjSvkzM+uhJaVzu5MJyPnEKm02E86ci7Zu1uetDtUuEV6VpBz0
         MHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6WRaTf2Gohs3TLDF3wGUQ9G9N5Tc23L6BtLjYGmLUEU=;
        b=URa4KYV7b3c8GaqKjHbG5XzAwk2pwgqUEyr8vk+Yuz/Vft3zuEe6p1bzV4xSrHQFb6
         mF8InUDGh+xIxzqd1D6OyKLTOBfeOxeQOyOimXSXUP34nyxGy2awPFb7XrFvsCLNXLww
         HKyqNvFg3UZj72dmUFvsyGRWWp34ktIgHW7fAwIN5w4oBA9qHkMimDISqzRDmGaScH1B
         0IK/HMwYu0XIxMmq08yardMVQi0sx5dCSYya5per8YgY4th/txRgZKHYCzkRr70XRe6I
         ivwoEG2jEDYZ0/RGr3ittyeqfaYQByLNHz88DCh44Uk4yy7ScEFM/i9ARvagtzEie0Yx
         x3kw==
X-Gm-Message-State: AOAM531hsHe+xl+0W/iCx37ukglp/KI3Iqsq/pkS+OMP9Y3Sl1dqNNka
        wA4AL24CKIS4PDS4fMu9WkEUXw==
X-Google-Smtp-Source: ABdhPJyGTO78SC04OqqG8B5jV4bqsUywCgAvAfGbb9iF7Ff+fqHfnL3QGRFHp0TSHPGGcRjTCncCZA==
X-Received: by 2002:a63:754:: with SMTP id 81mr61971pgh.435.1598594915684;
        Thu, 27 Aug 2020 23:08:35 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id t19sm125832pjy.22.2020.08.27.23.08.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2020 23:08:35 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     rnayak@codeaurora.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Rafael Wysocki <rjw@rjwysocki.net>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        Douglas Anderson <dianders@chromium.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 7/8] tty: serial: qcom_geni_serial: Unconditionally call dev_pm_opp_of_remove_table()
Date:   Fri, 28 Aug 2020 11:37:52 +0530
Message-Id: <583003f385a103b4c089ce8144a215c58cfb117a.1598594714.git.viresh.kumar@linaro.org>
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

While at it, create a new label to put clkname on errors.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

---
V2:
- Compare with -ENODEV only for failures.
- Create new label to put clkname.
---
 drivers/tty/serial/qcom_geni_serial.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 3aa29d201f54..33f1af6c61d1 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1433,11 +1433,9 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		return PTR_ERR(port->se.opp_table);
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(&pdev->dev);
-	if (!ret) {
-		port->se.has_opp_table = true;
-	} else if (ret != -ENODEV) {
+	if (ret && ret != -ENODEV) {
 		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		return ret;
+		goto put_clkname;
 	}
 
 	port->private_data.drv = drv;
@@ -1478,8 +1476,8 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 
 	return 0;
 err:
-	if (port->se.has_opp_table)
-		dev_pm_opp_of_remove_table(&pdev->dev);
+	dev_pm_opp_of_remove_table(&pdev->dev);
+put_clkname:
 	dev_pm_opp_put_clkname(port->se.opp_table);
 	return ret;
 }
@@ -1489,8 +1487,7 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
 	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
 	struct uart_driver *drv = port->private_data.drv;
 
-	if (port->se.has_opp_table)
-		dev_pm_opp_of_remove_table(&pdev->dev);
+	dev_pm_opp_of_remove_table(&pdev->dev);
 	dev_pm_opp_put_clkname(port->se.opp_table);
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
-- 
2.25.0.rc1.19.g042ed3e048af

