Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A194AA06E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 20:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234990AbiBDTvB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 14:51:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234931AbiBDTvA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 14:51:00 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39A8CC06173E
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 11:50:55 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id x6so5730062ilg.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 11:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pUf+PCh+TXxcthO6K+0yXDdvKrWCHt/PS/ocodABFUM=;
        b=XYtFs0GAaPChPsV6fugdX3/KwPRFUc7fOhot7UWWhNBTABRBq//tRQEJ5PJqKM+dXd
         ZOKUNXyqq2NoXhf8k63H+ChbhiHrBo3gScX2+edBqDtlsbFnxoXmTbZkGG6tH2TG59hg
         1gKBvw3ylB9gmGBrL+viDL/xP7Wg2RHAP/IsXqy8CQkEEIY+DF5+Ne0UKmO43Pq6kzeT
         Dl3cKBeM+XRtkNWBqtqYV/hBKv4ybraJRIoaL+HDVQGxBnJhWxYV63jMrYlgp6N1TQ7D
         BoRBFZuuMHrSmDSzIJZKFDXUgkGA6uk/2PIcr6seUJYSE/9Eyl8r8NBrGsUV+fFRGVDJ
         VsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pUf+PCh+TXxcthO6K+0yXDdvKrWCHt/PS/ocodABFUM=;
        b=mkDRk+I8of3GZIRILJXLFdzC619wwhcq2a35dWB79o4SJ8AcqWGRZ+XqxL67Jp4snt
         dE6OjTfUSpax4yuqXAEfQGolAQop3sMuqOTY3X/lPgnPooTm3baTczTKrQ6j2XF+pjRV
         xG4WjnOD1fkKngFRnGhwFLrMibwKNRSkyiIX48qFke2VTJOKqLR3f5q+pOa9dHqrGwAv
         tVe3evmgS7cYYapneuh7mdSWKWmO2CUda0V5y0tJr4xSheMTWr8w0t6JtH6KyxrdA3rK
         1MJEUoRj/PiUSqpntpjfpH29TQnZxQ2ZLIF6oJuTpZZLALO9iAEi23hcZxWfebZjcZdQ
         lo+Q==
X-Gm-Message-State: AOAM531BQ/v8HPvpCivPMG2o2gHjSarwAuuP44n0f1F7n5YUU+tz+AM7
        rxag05R5T1cbsm4ke6QqZZuGlw==
X-Google-Smtp-Source: ABdhPJzPP2eOSeqCq6tU4c6HCqyIwDVGReJxWNvlCRO8Aksx0W0xi+fITf+26isG5S/B1za8BKGktg==
X-Received: by 2002:a05:6e02:1c8f:: with SMTP id w15mr359448ill.103.1644004254584;
        Fri, 04 Feb 2022 11:50:54 -0800 (PST)
Received: from localhost.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id k13sm1417564ili.22.2022.02.04.11.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 11:50:54 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     davem@davemloft.net, kuba@kernel.org
Cc:     djakov@kernel.org, bjorn.andersson@linaro.org, mka@chromium.org,
        evgreen@chromium.org, cpratapa@codeaurora.org,
        avuyyuru@codeaurora.org, jponduru@codeaurora.org,
        subashab@codeaurora.org, elder@kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/7] net: ipa: use bulk operations to set up interconnects
Date:   Fri,  4 Feb 2022 13:50:41 -0600
Message-Id: <20220204195044.1082026-5-elder@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220204195044.1082026-1-elder@linaro.org>
References: <20220204195044.1082026-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use of_icc_bulk_get() and icc_bulk_put(), icc_bulk_set_bw(), and
icc_bulk_enable() and icc_bulk_disable() to initialize individual
IPA interconnects.  Those functions already log messages in the
event of error so we don't need to.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_power.c | 40 ++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index 67f76e6a6ae59..c0da1274f5d67 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -74,41 +74,31 @@ static int ipa_interconnect_init_one(struct device *dev,
 				     struct icc_bulk_data *interconnect,
 				     const struct ipa_interconnect_data *data)
 {
-	struct icc_path *path;
 	int ret;
 
-	path = of_icc_get(dev, data->name);
-	if (IS_ERR(path)) {
-		ret = PTR_ERR(path);
-		dev_err_probe(dev, ret, "error getting %s interconnect\n",
-			      data->name);
-
-		return ret;
-	}
-
-	/* All interconnects are initially disabled */
-	(void)icc_disable(path);
-
-	/* Set the bandwidth values to be used when enabled */
-	ret = icc_set_bw(path, data->average_bandwidth, data->peak_bandwidth);
-	if (ret) {
-		dev_err(dev, "error %d setting %s interconnect bandwidths\n",
-			ret, data->name);
-
-		return ret;
-	}
-
-	interconnect->path = path;
+	/* interconnect->path is filled in by of_icc_bulk_get() */
 	interconnect->name = data->name;
 	interconnect->avg_bw = data->average_bandwidth;
 	interconnect->peak_bw = data->peak_bandwidth;
 
-	return 0;
+	ret = of_icc_bulk_get(dev, 1, interconnect);
+	if (ret)
+		return ret;
+
+	/* All interconnects are initially disabled */
+	icc_bulk_disable(1, interconnect);
+
+	/* Set the bandwidth values to be used when enabled */
+	ret = icc_bulk_set_bw(1, interconnect);
+	if (ret)
+		icc_bulk_put(1, interconnect);
+
+	return ret;
 }
 
 static void ipa_interconnect_exit_one(struct icc_bulk_data *interconnect)
 {
-	icc_put(interconnect->path);
+	icc_bulk_put(1, interconnect);
 	memset(interconnect, 0, sizeof(*interconnect));
 }
 
-- 
2.32.0

