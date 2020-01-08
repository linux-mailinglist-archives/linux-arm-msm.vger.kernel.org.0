Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18F73134F00
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2020 22:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726895AbgAHVkg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jan 2020 16:40:36 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35171 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgAHVkg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jan 2020 16:40:36 -0500
Received: by mail-pf1-f196.google.com with SMTP id i23so2282987pfo.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2020 13:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dU+cqK2vGaSDxrRnxvi2psMzqLLnalkciJUAyk86ZBU=;
        b=YtJXxx1wmpivmGu8hBVp7GbEdN06ilTi8VaUV4EdzyQWpDW9xvfA9df9bpyXzaB1pd
         nuC5N0emRB0DRZwq3j2/oJzxT67q6hD+bcXf1fXqiR4UkCuf2IJNYMPyBoL2x2j+eBzu
         NjVQakLR/n/Pgl2AfSUAr9ybGICsARWHSvg9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dU+cqK2vGaSDxrRnxvi2psMzqLLnalkciJUAyk86ZBU=;
        b=RyDQMbUtunAPJYZqvNJat5W70lB1cBu3enR01ZaJ9RSofzTNKoxMCsQtDk5CfIeARV
         sWdQfMcLu3WZAxrKVyyXIp44xJWl6WVSjBQNNfHh9DDU1C0ffZG6s9Oco9N5C4HKbPSD
         95yOyKYQ+ORQsm24e+2cBdDBIQDVKobsQ7M+I4Ss/3/2f6/h19Oo0UDFFHt7bVCtamXW
         yq7V/AwX5/H0qygD3P+6D/AkzqJ4IlbKZLu5tPM3E9fGamn1mC0J675Tia3hGa4QOP5B
         SAQxd5tI4qi9FS0bkOhrmak5ad9UEVRjXv+XcMkBmVXCHE2DsFrT4Z5paePV6d4JgJa2
         /jrg==
X-Gm-Message-State: APjAAAVCsKcN1UtGXGKiJLTrfDvOjTV7U7qY1slWl32nyDpCfjN+u6Oh
        tLu8yscdTnjl1Tv+uJ6+bWJOlQ==
X-Google-Smtp-Source: APXvYqxVWThgBBejpadmCqe91Js8fQMbUY7eCZS7DVK6OYqWPx0pAxMntbxtjELFbKdXu0WKnlVuyA==
X-Received: by 2002:a63:62c2:: with SMTP id w185mr7810930pgb.271.1578519635537;
        Wed, 08 Jan 2020 13:40:35 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id a4sm216749pjh.32.2020.01.08.13.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 13:40:35 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>, Mark Brown <broonie@kernel.org>,
        Girish Mahadevan <girishm@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] spi: spi-qcom-qspi: Use device managed memory for clk_bulk_data
Date:   Wed,  8 Jan 2020 13:40:32 -0800
Message-Id: <20200108133948.1.I35ceb4db3ad8cfab78f7cd51494aeff4891339f5@changeid>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currrently the memory for the clk_bulk_data of the QSPI controller
is allocated with spi_alloc_master(). The bulk data pointer is passed
to devm_clk_bulk_get() which saves it in clk_bulk_devres->clks. When
the device is removed later devm_clk_bulk_release() is called and
uses the bulk data referenced by the pointer to release the clocks.
For this driver this results in accessing memory that has already
been freed, since the memory allocated with spi_alloc_master() is
released by spi_controller_release(), which is called before the
managed resources are released.

Use device managed memory for the clock bulk data to fix the issue
described above.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 drivers/spi/spi-qcom-qspi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 250fd60e167821..3c4f83bf7084c8 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -137,7 +137,7 @@ enum qspi_clocks {
 struct qcom_qspi {
 	void __iomem *base;
 	struct device *dev;
-	struct clk_bulk_data clks[QSPI_NUM_CLKS];
+	struct clk_bulk_data *clks;
 	struct qspi_xfer xfer;
 	/* Lock to protect xfer and IRQ accessed registers */
 	spinlock_t lock;
@@ -445,6 +445,13 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 		goto exit_probe_master_put;
 	}
 
+	ctrl->clks = devm_kcalloc(dev, QSPI_NUM_CLKS,
+				  sizeof(*ctrl->clks), GFP_KERNEL);
+	if (!ctrl->clks) {
+		ret = -ENOMEM;
+		goto exit_probe_master_put;
+	}
+
 	ctrl->clks[QSPI_CLK_CORE].id = "core";
 	ctrl->clks[QSPI_CLK_IFACE].id = "iface";
 	ret = devm_clk_bulk_get(dev, QSPI_NUM_CLKS, ctrl->clks);
-- 
2.25.0.rc1.283.g88dfdc4193-goog

