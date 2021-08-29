Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 693713FABC7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 15:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235492AbhH2NPI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 09:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235493AbhH2NOL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 09:14:11 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAA80C0612A4
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 06:13:17 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id c12so20745712ljr.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gLxBTtcfVl4dtJ5J9RXz2IWihrIE1icg8208P8LI768=;
        b=eLd/CdzikufAJoC+IWYRwvNs/Ql43QYVNlpuhiAPvhXzK3//Di9TCZafUPMM5EBULL
         Mo7y7RQS5b6C83VsilbdzSAvFTfgRwq9R6PJqo+k6+JPE6UTqoKCXW5SxiMrryD/RYk1
         MQtk5NojhV6O5mVIyn4SLnYNe8drwgcqVngKycpPETjynfImIykdyRPNbJnWCR2gmidg
         zqSJ8xjaa55tkihcjiHk6+WjAFbO/PUtvtMessLfsw6NBVGRhhRtV7mZrqceZU91XyXp
         WVS598gLcNzThW5YhN+k5gzLYDy22dy7DJAXHZVF0i22qsRLVdcWSKv6nT1GmZzaEgeN
         LpCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gLxBTtcfVl4dtJ5J9RXz2IWihrIE1icg8208P8LI768=;
        b=RgNJWa/rnA2sU0w+6InDFKLWwHD4mn3BfkTSZtyDO/+jGpw4XTx0xBbD1wwc3pS2iF
         cCsqhN1kvs8w4T29g8ETofO4PMtlyr6zHm1ZQTu+wlp4gJrZ1JzJstXwrxninX+sSweP
         PakVeveZRSOnHTgnuu+NOh2wW8iMqJtjEHKqaoxp3mz4XHiV37d6tJrl0UfIsaj7IHd4
         XlhR3daYQk5bm/gJ026IEK9VtK8YL6Pf6PQSrKgHKGBXiw/Q/Ns83tcpXW3ha8MDHKNQ
         0xWwollqoHsS7xxKhZ16wF9JGPUk3EEb0mBlMOQUUg5SRSv+qZtjdDGr2rAoNyttID6s
         34RQ==
X-Gm-Message-State: AOAM533Vq22hss7MAD8nqUjOVcl5xgFVOCmqpxuhGXSRib6+lQSvS6OK
        4i8KpplGQjL/X8nh46sA8UFv4A==
X-Google-Smtp-Source: ABdhPJwtyTp/w9lWaYotVNpODsQf+S4wJ2V3YCPsSXqB7W2BUqqv7USVpkUFF3pFpTY6r+3biVWKuw==
X-Received: by 2002:a2e:97cf:: with SMTP id m15mr16094354ljj.125.1630242796087;
        Sun, 29 Aug 2021 06:13:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x13sm712503lfq.262.2021.08.29.06.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 06:13:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [RFC v2 08/13] ath10k: add support for pwrseq sequencing
Date:   Sun, 29 Aug 2021 16:13:00 +0300
Message-Id: <20210829131305.534417-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
References: <20210829131305.534417-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Power sequencing for Qualcomm WiFi+BT chipsets are being reworked to use
pwrseq rather than individually handling all the regulators. Add support
for pwrseq to ath10k SNOC driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/net/wireless/ath/ath10k/snoc.c | 45 +++++++++++++-------------
 drivers/net/wireless/ath/ath10k/snoc.h |  4 +--
 2 files changed, 25 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index ea00fbb15601..8578c56982df 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -14,6 +14,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/of_address.h>
 #include <linux/iommu.h>
+#include <linux/pwrseq/consumer.h>
 
 #include "ce.h"
 #include "coredump.h"
@@ -41,14 +42,6 @@ static char *const ce_name[] = {
 	"WLAN_CE_11",
 };
 
-static const char * const ath10k_regulators[] = {
-	"vdd-0.8-cx-mx",
-	"vdd-1.8-xo",
-	"vdd-1.3-rfa",
-	"vdd-3.3-ch0",
-	"vdd-3.3-ch1",
-};
-
 static const char * const ath10k_clocks[] = {
 	"cxo_ref_clk_pin", "qdss",
 };
@@ -1010,10 +1003,14 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 
 	ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
 
-	ret = regulator_bulk_enable(ar_snoc->num_vregs, ar_snoc->vregs);
+	ret = pwrseq_full_power_on(ar_snoc->pwrseq);
 	if (ret)
 		return ret;
 
+	ret = regulator_enable(ar_snoc->vreg_cx_mx);
+	if (ret)
+		goto vreg_pwrseq_off;
+
 	ret = clk_bulk_prepare_enable(ar_snoc->num_clks, ar_snoc->clks);
 	if (ret)
 		goto vreg_off;
@@ -1021,11 +1018,14 @@ static int ath10k_hw_power_on(struct ath10k *ar)
 	return ret;
 
 vreg_off:
-	regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
+	regulator_disable(ar_snoc->vreg_cx_mx);
+vreg_pwrseq_off:
+	pwrseq_power_off(ar_snoc->pwrseq);
+
 	return ret;
 }
 
-static int ath10k_hw_power_off(struct ath10k *ar)
+static void ath10k_hw_power_off(struct ath10k *ar)
 {
 	struct ath10k_snoc *ar_snoc = ath10k_snoc_priv(ar);
 
@@ -1033,7 +1033,9 @@ static int ath10k_hw_power_off(struct ath10k *ar)
 
 	clk_bulk_disable_unprepare(ar_snoc->num_clks, ar_snoc->clks);
 
-	return regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
+	regulator_disable(ar_snoc->vreg_cx_mx);
+
+	pwrseq_power_off(ar_snoc->pwrseq);
 }
 
 static void ath10k_snoc_wlan_disable(struct ath10k *ar)
@@ -1691,20 +1693,19 @@ static int ath10k_snoc_probe(struct platform_device *pdev)
 		goto err_release_resource;
 	}
 
-	ar_snoc->num_vregs = ARRAY_SIZE(ath10k_regulators);
-	ar_snoc->vregs = devm_kcalloc(&pdev->dev, ar_snoc->num_vregs,
-				      sizeof(*ar_snoc->vregs), GFP_KERNEL);
-	if (!ar_snoc->vregs) {
-		ret = -ENOMEM;
+	ar_snoc->pwrseq = devm_pwrseq_get(&pdev->dev, "wifi");
+	if (IS_ERR(ar_snoc->pwrseq)) {
+		ret = PTR_ERR(ar_snoc->pwrseq);
+		if (ret != -EPROBE_DEFER)
+			ath10k_warn(ar, "failed to acquire pwrseq: %d\n", ret);
 		goto err_free_irq;
 	}
-	for (i = 0; i < ar_snoc->num_vregs; i++)
-		ar_snoc->vregs[i].supply = ath10k_regulators[i];
 
-	ret = devm_regulator_bulk_get(&pdev->dev, ar_snoc->num_vregs,
-				      ar_snoc->vregs);
-	if (ret < 0)
+	ar_snoc->vreg_cx_mx = devm_regulator_get(&pdev->dev, "vdd-0.8-cx-mx");
+	if (IS_ERR(ar_snoc->vreg_cx_mx)) {
+		ret = PTR_ERR(ar_snoc->vreg_cx_mx);
 		goto err_free_irq;
+	}
 
 	ar_snoc->num_clks = ARRAY_SIZE(ath10k_clocks);
 	ar_snoc->clks = devm_kcalloc(&pdev->dev, ar_snoc->num_clks,
diff --git a/drivers/net/wireless/ath/ath10k/snoc.h b/drivers/net/wireless/ath/ath10k/snoc.h
index 5095d1893681..5188d6f6f850 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.h
+++ b/drivers/net/wireless/ath/ath10k/snoc.h
@@ -70,10 +70,10 @@ struct ath10k_snoc {
 	struct ath10k_snoc_ce_irq ce_irqs[CE_COUNT_MAX];
 	struct ath10k_ce ce;
 	struct timer_list rx_post_retry;
-	struct regulator_bulk_data *vregs;
-	size_t num_vregs;
+	struct regulator *vreg_cx_mx;
 	struct clk_bulk_data *clks;
 	size_t num_clks;
+	struct pwrseq *pwrseq;
 	struct ath10k_qmi *qmi;
 	unsigned long flags;
 	bool xo_cal_supported;
-- 
2.33.0

