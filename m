Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00BDF255446
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Aug 2020 08:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgH1GIh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 02:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbgH1GId (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 02:08:33 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44571C061264
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 23:08:33 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id c15so1424856plq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2020 23:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W5JEvLx/kGgYmOG8XtJ4S9to1B/pZ75QIWOnP5VQYf4=;
        b=yFVGFQnOS4KNqIKtBL7mmGQ5uo5VXN9yJhK3RPtU7p1esz0OX71XfY6oSObv6qgzHE
         lGKhCLfUiDGiDzc+hYhL9KwSUdk57dX+2e99nSgthYWlLpBkSv7UGQhFf2ZDiw5RxgiE
         OcMHzyPn8fcNpjJUoyD/rl0NRRuvA0aInKx0lkwohVrpNKdYjtCV2L+Yv5R2aNIYPy1p
         yA8L16DK1aCOWWv9EFPlgeAxEMGSJTQ9DpZMeDopWeUEiv0kEYCCR2Sq2nv+0pGL4aEj
         gTwS3ad9RLsCDpndJG15ZqlOamawfENoS+I7+k6TXNgP8KuDEGzfN11WKABbt5twJucC
         EaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W5JEvLx/kGgYmOG8XtJ4S9to1B/pZ75QIWOnP5VQYf4=;
        b=qMBwsde8QE6ndXNzF8BK6CRfmItvporBa+GbZSi8gXCaBmeJOBUjaNaG8wcwxZOXro
         cQ+rj4+YWanWeqIxuVjqBdJ0/hm+0rd1e8hGp+5bhAD/3UIemWtbu8MFCavUpKow601A
         9zDPJdbIbNNgoouSdlt5OST1KDahKFMWqZggOvLJBVDoiF91kJw7ARJn1C706Hr730k7
         U26cfPFXYYhpy6jyj3rOvWNxG8XUh8mr0h45/+IM4ih3Uo7JQoO7XrUrzEsP3+03tzNM
         cMzSbTh+mu7VjBNt0Vfgoq6fTIeun2BBKdLUzEMy2y34QeFrW/mqVtKSHmI6dIahZLPf
         uGGQ==
X-Gm-Message-State: AOAM5332LbJT2wCwI0N2lo54D9iwQSz5Xmx4ALf+YG0u5z3ZxKQwfuXZ
        KTmf2daFjU4ejb0kmOCDBMtYyw==
X-Google-Smtp-Source: ABdhPJw5TyhQ+BG9F3GNSYNU3SmNQPAE9gppP+h6Cf0ITslpZibZIS2iM0DFLIRO4xhSU7kxYIlDCA==
X-Received: by 2002:a17:902:8f82:: with SMTP id z2mr80379plo.177.1598594912781;
        Thu, 27 Aug 2020 23:08:32 -0700 (PDT)
Received: from localhost ([122.167.135.199])
        by smtp.gmail.com with ESMTPSA id l9sm333978pgg.29.2020.08.27.23.08.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Aug 2020 23:08:32 -0700 (PDT)
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
Subject: [PATCH V2 6/8] spi: spi-qcom-qspi: Unconditionally call dev_pm_opp_of_remove_table()
Date:   Fri, 28 Aug 2020 11:37:51 +0530
Message-Id: <b77aa0bbe82a580508e321a34da488b4b27966d0.1598594714.git.viresh.kumar@linaro.org>
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
 drivers/spi/spi-qcom-qspi.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index b8857a97f40a..e5829c56650b 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -143,7 +143,6 @@ struct qcom_qspi {
 	struct qspi_xfer xfer;
 	struct icc_path *icc_path_cpu_to_qspi;
 	struct opp_table *opp_table;
-	bool has_opp_table;
 	unsigned long last_speed;
 	/* Lock to protect data accessed by IRQs */
 	spinlock_t lock;
@@ -546,11 +545,9 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 	}
 	/* OPP table is optional */
 	ret = dev_pm_opp_of_add_table(&pdev->dev);
-	if (!ret) {
-		ctrl->has_opp_table = true;
-	} else if (ret != -ENODEV) {
+	if (ret && ret != -ENODEV) {
 		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		goto exit_probe_master_put;
+		goto exit_probe_put_clkname;
 	}
 
 	pm_runtime_use_autosuspend(dev);
@@ -562,8 +559,9 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 		return 0;
 
 	pm_runtime_disable(dev);
-	if (ctrl->has_opp_table)
-		dev_pm_opp_of_remove_table(&pdev->dev);
+	dev_pm_opp_of_remove_table(&pdev->dev);
+
+exit_probe_put_clkname:
 	dev_pm_opp_put_clkname(ctrl->opp_table);
 
 exit_probe_master_put:
@@ -581,8 +579,7 @@ static int qcom_qspi_remove(struct platform_device *pdev)
 	spi_unregister_master(master);
 
 	pm_runtime_disable(&pdev->dev);
-	if (ctrl->has_opp_table)
-		dev_pm_opp_of_remove_table(&pdev->dev);
+	dev_pm_opp_of_remove_table(&pdev->dev);
 	dev_pm_opp_put_clkname(ctrl->opp_table);
 
 	return 0;
-- 
2.25.0.rc1.19.g042ed3e048af

