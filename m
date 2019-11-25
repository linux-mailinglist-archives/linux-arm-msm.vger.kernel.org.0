Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3E32108F65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 14:59:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbfKYN7e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 08:59:34 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33372 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727904AbfKYN7e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 08:59:34 -0500
Received: by mail-lj1-f195.google.com with SMTP id t5so16005950ljk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2019 05:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mFx2G6rwu7kpdvcXD41l6BM92KOVYIpnpySewMnY058=;
        b=zmgWdTfearD+sHjWeRlK/bx0dgy/bakLlEYxv8GGf+siHKTg8Pd29fjMZvoTWR5uS7
         Pv7/bI+YTelbau7+aLwKBalnifKR5722jLwOg9/+0nRfFVE4bv7QWmUyupBm123opiZw
         LzPE7f/aWEugYp1FYSUNUyfZCVWJXnrAwcsjeR3p5f3LWlTfuY3uLWhx4HjaCtjW1INw
         3bAMgT0va6MHiOYgdrTP5MQQT0R/aODxvK/vi3aFRW+tojJkrsJPMlMf+gy/UmteOfbF
         W2/HXRW/Nnod0De3hIAseGbAiGbExUflxWVqtbM9uXV1rjs/qC/1TtDPoiOabAAmvqTQ
         lzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mFx2G6rwu7kpdvcXD41l6BM92KOVYIpnpySewMnY058=;
        b=mWGWPqZjCKFz5Sv5aGxBjtHb1I71UXmDKI1+JEtbi4XRCdLfNhkUNAz4YAdzKvW2ah
         QUulGynkmcyp+ly8epBvwObNiVFZwju+aw3IwvV139ghXdbO+ax/4PNzfF9ZCgrajOkD
         fzf/U8ma+hr9iWQ2ndboRXCZOTPRndDwidSKCzbbOzl2an8UPPGzWNqWeO/jx3hZVKa3
         RDylrY1JaZsdeg4BOVrUKzlG3X3DYn/Sx4yj9tbDWQ6r+h5dGu35RrPTkp8isjOYMsoO
         Y/Di2/zAs+gEIXmoogyGrqC6WIC01Zl6wufRCjZfv3xqU+xBR5dY0wzdpte9S4g+8Rx1
         rzQQ==
X-Gm-Message-State: APjAAAUrMTI55oJFLjNhjtJToa7kUb2Z5qp18yeJuYaVsQCHVNk/CcSi
        nVoJFPUXD7qR6xOBfopMGCIcwg==
X-Google-Smtp-Source: APXvYqxGNrTj7vs2qjFmDS+0SCPs2ZtKT71xpKo78ewxlVGZ16eFWb8x11iJovyeZ7uQJznUoZr7Yg==
X-Received: by 2002:a2e:7016:: with SMTP id l22mr22669006ljc.227.1574690371750;
        Mon, 25 Nov 2019 05:59:31 -0800 (PST)
Received: from centauri.lan (ua-84-217-220-205.bbcust.telenor.se. [84.217.220.205])
        by smtp.gmail.com with ESMTPSA id s23sm4041871ljm.20.2019.11.25.05.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 05:59:31 -0800 (PST)
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] clk: qcom: hfpll: register as clock provider
Date:   Mon, 25 Nov 2019 14:59:05 +0100
Message-Id: <20191125135910.679310-4-niklas.cassel@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191125135910.679310-1-niklas.cassel@linaro.org>
References: <20191125135910.679310-1-niklas.cassel@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Make the output of the high frequency pll a clock provider.
On the QCS404 this PLL controls cpu frequency scaling.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
Changes since v2:
-None

 drivers/clk/qcom/hfpll.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
index a6de7101430c..e64c0fd82fe4 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -57,6 +57,7 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 		.num_parents = 1,
 		.ops = &clk_ops_hfpll,
 	};
+	int ret;
 
 	h = devm_kzalloc(dev, sizeof(*h), GFP_KERNEL);
 	if (!h)
@@ -79,7 +80,14 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 	h->clkr.hw.init = &init;
 	spin_lock_init(&h->lock);
 
-	return devm_clk_register_regmap(&pdev->dev, &h->clkr);
+	ret = devm_clk_register_regmap(dev, &h->clkr);
+	if (ret) {
+		dev_err(dev, "failed to register regmap clock: %d\n", ret);
+		return ret;
+	}
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+					   &h->clkr.hw);
 }
 
 static struct platform_driver qcom_hfpll_driver = {
-- 
2.23.0

