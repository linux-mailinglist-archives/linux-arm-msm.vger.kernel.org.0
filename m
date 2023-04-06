Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C53626D9B68
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 16:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239081AbjDFO7A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 10:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239021AbjDFO65 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 10:58:57 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4D35189
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 07:58:55 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id v1so39810595wrv.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 07:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680793134; x=1683385134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNY1WgFE5W0+EDCsEQWZ33KMDgDEFiFDJkuxdC14U6c=;
        b=lsMZ/tmQGh0+Gqb95YSagOXlgovDFj8+1loUBZniBPTntn/h5IVkYuQn7ILSUiUVYq
         aYG9W1n2NKs2RptvcozWQPSf7ZiDwxLfvfzk9UiJw/4tHPRk21e260kkMA/jnzZBPjfN
         Gr1plOLPrjpPSR0yFk6Z9QNGTRVpkWqLhnZ5Vm0GN/LuZ6WsYtGrUpFFzHamAhcbP87e
         3RvCX7bxDIB/qxO3F1sgfYMCRb/6l9ygjdBvhYUwzHTy9HYG0+SS4BsOfB+47W4hrlhQ
         yOTzP4LrDo7vULF8GRQ+uS04+C8AOlUZ5dpWBOexEQRaejsNhuHOFUDwU6oQEmdmu5xY
         z0AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680793134; x=1683385134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zNY1WgFE5W0+EDCsEQWZ33KMDgDEFiFDJkuxdC14U6c=;
        b=nmz8+mqyvMYYp7Wm0eII4e0OxUYgxMComyjjgNz8gNK6evicYvyn76MCfQT3+712pb
         X911iRB3+zqAQHsn+HmD2t2ID29gBEgiJRVbKRGhmHdKoZtzqhsDg//3Rbtl89mu6maq
         NcpqedLshnBw4YHBW7z63lu0GGtkWeoH5tDKhOCf6h+3bZC1KXaeFL0g5/fXUy5bIVhV
         sW0oyHjYqPWJJKkkVKS345l25nQbPOO8IOL0yoKro0KNGmXoOsbzNUcvgb6i5VN8YNkP
         4PfbLoIMl7wBqR3arjUj+tBdR27X+2RfUDk/XEq/EcwPjZqsxAm+uFJvfxTXIIdXfgnv
         n/XA==
X-Gm-Message-State: AAQBX9coZlIW3TeVjfWgFp9LTla8V74jQCD0DDofZ8AQL49ZQOArEV4y
        pNUlzSHzYfZWiBbX94E7vcbjOQ==
X-Google-Smtp-Source: AKy350Y5/8nzIFtA5GLno7AkNOE83NgVqaQKljVOSMfIXaK0nWcT0TmjC4AnNwjBHz1+YX5CvUKlMw==
X-Received: by 2002:a5d:440d:0:b0:2d8:cacd:797e with SMTP id z13-20020a5d440d000000b002d8cacd797emr7051511wrq.10.1680793133951;
        Thu, 06 Apr 2023 07:58:53 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d10-20020a1c730a000000b003f0373d077csm1768160wmb.47.2023.04.06.07.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 07:58:53 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     amitk@kernel.org, thara.gopinath@gmail.com, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com,
        dmitry.baryshkov@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 1/3] thermal/drivers/tsens: Add error/debug prints to calibration read
Date:   Thu,  6 Apr 2023 15:58:48 +0100
Message-Id: <20230406145850.357296-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406145850.357296-1-bryan.odonoghue@linaro.org>
References: <20230406145850.357296-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add in some dev_dbg() to aid in viewing of raw calibration data extracted.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/thermal/qcom/tsens.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index d3218127e617d..7165b0bfe8b9f 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -115,8 +115,12 @@ int tsens_read_calibration(struct tsens_priv *priv, int shift, u32 *p1, u32 *p2,
 			return ret;
 
 		ret = nvmem_cell_read_variable_le_u32(priv->dev, name, &p1[i]);
-		if (ret)
+		if (ret) {
+			dev_err(priv->dev, "Failed to read %s\n", name);
 			return ret;
+		}
+
+		dev_dbg(priv->dev, "%s 0x%x\n", name, p1[i]);
 
 		ret = snprintf(name, sizeof(name), "s%d_p2%s", priv->sensor[i].hw_id,
 			       backup ? "_backup" : "");
@@ -124,8 +128,12 @@ int tsens_read_calibration(struct tsens_priv *priv, int shift, u32 *p1, u32 *p2,
 			return ret;
 
 		ret = nvmem_cell_read_variable_le_u32(priv->dev, name, &p2[i]);
-		if (ret)
+		if (ret) {
+			dev_err(priv->dev, "Failed to read %s\n", name);
 			return ret;
+		}
+
+		dev_dbg(priv->dev, "%s 0x%x\n", name, p2[i]);
 	}
 
 	switch (mode) {
-- 
2.39.2

