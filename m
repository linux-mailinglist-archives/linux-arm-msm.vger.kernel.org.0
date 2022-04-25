Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E791850EBB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Apr 2022 00:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235699AbiDYWYs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Apr 2022 18:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343521AbiDYVbB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Apr 2022 17:31:01 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9238C3CA5C
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 14:27:55 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id y32so28549930lfa.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Apr 2022 14:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qCBZ0j+ES0QNdxwqckFAUR3wGLW9E7d1PkVjGCIYt/4=;
        b=tfwRU6PjP2z7GtTk8zFEqbic2HdeSUCv+l17OSytmRIosB+xRy4hev7E+z/t1OOv/7
         FqPPCtnSu0r9iPis8lzP3t0ics4vx5B/SKLRghQCr9JOvvn/Tuqa7RdxUSZHDCLhv6Ap
         WvN0K0roJRcbQeJf2LuMV8bj2oxHw7atNJRdGFF+HHHc6kno0DVlRMWygNbi+wP+2d+L
         zJnqzLOWoqbQWl4J3XSvlFKkPQoqcUowFFd/8zowKT6ZnooTRTPCvynYG0a88th0o5fZ
         dpBirZyVMpeC24AXrP1Hb3Lz9rF8GCCo0eOx+0x9KaRPa56mDKBeJP14TEZjqTOcyZX9
         3Oow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qCBZ0j+ES0QNdxwqckFAUR3wGLW9E7d1PkVjGCIYt/4=;
        b=wEDWPoADErZWVnIlw/Q4ktH9pUrML+6TnxbgCyJqk6rBIqTXB7fNM5Hecp7PdxDReo
         l7V0w3rgMkYfDMzMFaV1my7iAH+9vHT7lIwQR5kIGvLecIJ2vON2HBi0KotYr3ua0dhw
         7Y8uuRDEYH82GEhdhLM7rg3AlGSJG43V7fGmArm0Vg7ylRXkVgtuyc7xLzV85tzcy2l5
         oTO+tSNqULEX10SJxi2nci15iX/gqafrFD8oltrL3xN6R740I5dUNB4Pq7UiigVjpPdp
         Rpy7j+r+cQk0RJen65j1CL5oRg3gMR1sNLjAqIjMm8oe9mYKVzjtUCszG+nE7XBHFKEa
         3BXw==
X-Gm-Message-State: AOAM5308nYUaKylNCH/jo56bo2VReqERkeFANgOCGfR82773ha1UVLve
        +yXj8uKlQ/iVd6Exps3hyL8kgQ==
X-Google-Smtp-Source: ABdhPJxPWNml4l/27j85PwCcp8D+OzEMrTnQLdwPO6otEFklP8LzdUGs6ynDRCbv+ttEB0i2Bgqaew==
X-Received: by 2002:ac2:4bd0:0:b0:46b:c3ea:ea04 with SMTP id o16-20020ac24bd0000000b0046bc3eaea04mr14292158lfq.537.1650922073765;
        Mon, 25 Apr 2022 14:27:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l13-20020a19494d000000b0046ba0e38750sm1533314lfj.3.2022.04.25.14.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 14:27:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 1/3] clk: qcom: gcc-msm8960: create tsens device if there are no child nodes
Date:   Tue, 26 Apr 2022 00:27:48 +0300
Message-Id: <20220425212750.2749135-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220425212750.2749135-1-dmitry.baryshkov@linaro.org>
References: <20220425212750.2749135-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently gcc-msm8960 driver manually creates tsens platform device
manually. It would be better to follow IPQ8064 approach, where tsens
device is defined as gcc's child device in the device tree. If nothing
else, it removes gcc's dependency on QFPROM, thus allowing clock
controller to be probed earlier.

Don't create it in case there are available child nodes (tsens) inside
the gcc's device tree node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8960.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 051745ef99c8..a6e13b91e4c8 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -3641,6 +3641,9 @@ static int gcc_msm8960_probe(struct platform_device *pdev)
 		hfpll_l2.d = &hfpll_l2_8064_data;
 	}
 
+	if (of_get_available_child_count(pdev->dev.of_node) != 0)
+		return devm_of_platform_populate(&pdev->dev);
+
 	tsens = platform_device_register_data(&pdev->dev, "qcom-tsens", -1,
 					      NULL, 0);
 	if (IS_ERR(tsens))
@@ -3655,7 +3658,8 @@ static int gcc_msm8960_remove(struct platform_device *pdev)
 {
 	struct platform_device *tsens = platform_get_drvdata(pdev);
 
-	platform_device_unregister(tsens);
+	if (tsens)
+		platform_device_unregister(tsens);
 
 	return 0;
 }
-- 
2.35.1

