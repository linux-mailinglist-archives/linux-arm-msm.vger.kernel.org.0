Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FA7473C347
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 23:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjFWVuV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 17:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbjFWVtt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 17:49:49 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85B852718
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 14:49:47 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f87592ecaeso1577421e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 14:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687556985; x=1690148985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlONZ8TKyqT3PdFqD54Nj2aaobJzFqkktvSArbuqu70=;
        b=d14/Sqwli0wZo1aDlP1ix49NXOgH7Az2yJI2ZTAVgrTdZSAY7laI7V8/5jk5KRaB17
         AkfudzVs4F6WQpi4MMr9O9Q9KJfSbkDlfrEjzJOZN6gcso065RCdVNJSLcgbgbP7Dl9n
         IvQw3hiDFbkZmIliWWNSV0d5wk+8/wOWjWBO2B14YUSvteqaWZuZKpEZXUo8k8f4R0Iv
         OqashMtNr449Lv4lT1EJkhZTe5gFcnXfivHmOWY/AOdYwFern7SpF6nTxcDMCVUmSJnJ
         J3SdsSxKBvwxgmKCINkEGS2BE+CkRW6QYSjjQTV6Ktf16AKbB14BZ7T8zoBkFAGJjhkG
         WCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687556985; x=1690148985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SlONZ8TKyqT3PdFqD54Nj2aaobJzFqkktvSArbuqu70=;
        b=JlmHce35wlRM5Eikb9wg13LPiJaC3Jg0rLCC/uQIsQ2Oec0iqzzqrY2aO6ndcs3yAx
         2avmVr93iMK9ze1s5aYDWYL162hBgiFGGn7tlPzMAQM7d7ajK5yvXmg66jCeiPUiQQFR
         T5FbC4ndlTwciqlEfVkKleoHhzR8ui3RszCe8bkkRjxlh3VttYg0HvrGNgISUDtZThb4
         n+6cdD5aRxa6V2tfBQFZCtYtOps4VAeY4dWJL4a7EqsyjtYd0GCC4RdYi/3jIMO/Iqbx
         yKBhehLG3PJGBJwZ0l6gFnTHX/O6C1qYwe623aSfCfRcnLV4efdQl2a+Ih/pixw1Bxzz
         yIJA==
X-Gm-Message-State: AC+VfDxQ6G+kJUJXfH/Q/3YWFPyIqf51cSpoaXAIaaCWCKlLCVkL7vgt
        ly/zIS6tX7+Uqx6nJ59bOvHwhTtD/Ibu0p35gXY=
X-Google-Smtp-Source: ACHHUZ4tA49jt4MntzmSZCt35XsZBv0Q4GrQYvthIP75Bx6oK9QUCwzfeEzGH+ZZRCY1jlN33JTxUg==
X-Received: by 2002:a2e:9854:0:b0:2b4:756b:8e71 with SMTP id e20-20020a2e9854000000b002b4756b8e71mr12630714ljj.44.1687556985660;
        Fri, 23 Jun 2023 14:49:45 -0700 (PDT)
Received: from [192.168.1.101] (abyk30.neoplus.adsl.tpnet.pl. [83.9.30.30])
        by smtp.gmail.com with ESMTPSA id x20-20020a2e9c94000000b002b48437dcaasm1840919lji.103.2023.06.23.14.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 14:49:45 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 23 Jun 2023 23:49:44 +0200
Subject: [PATCH 3/3] firmware: qcom_scm: Drop useless compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230623-topic-scm_cleanup-v1-3-383089eae98d@linaro.org>
References: <20230623-topic-scm_cleanup-v1-0-383089eae98d@linaro.org>
In-Reply-To: <20230623-topic-scm_cleanup-v1-0-383089eae98d@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687556981; l=1502;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=YeauYl4ZQZY5xFS1G6VWl/VwUEAHSGaL4eh3BOpBnEE=;
 b=sxaKygGpuvRJhsRXCw9CfYWD83iHXn9UfSEtVsNIFx5potBlUyoyY1D2CYYobi0D7yey7a337
 E0RwUnUXfZ8AGyqZCKQAgdFaZSKTNauXyrqi4F2T0Z3LFUmHT+N4uKo
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are three categories of compatibles within the driver:

1. Ones which were introduced without a qcom,scm fallback
2. Ones which were introduced with a qcom,scm fallback
3. Ones which were defined but never used

Keep 1 for backwards compatibility and axe 2 & 3.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/firmware/qcom_scm.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index d7fc972b20ab..ff0e8911499c 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -1481,20 +1481,15 @@ static void qcom_scm_shutdown(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_scm_dt_match[] = {
+	{ .compatible = "qcom,scm" },
+
+	/* Legacy entries kept for backwards compatibility */
 	{ .compatible = "qcom,scm-apq8064" },
 	{ .compatible = "qcom,scm-apq8084" },
 	{ .compatible = "qcom,scm-ipq4019" },
-	{ .compatible = "qcom,scm-mdm9607" },
-	{ .compatible = "qcom,scm-msm8660" },
-	{ .compatible = "qcom,scm-msm8960" },
-	{ .compatible = "qcom,scm-msm8916" },
 	{ .compatible = "qcom,scm-msm8953" },
 	{ .compatible = "qcom,scm-msm8974" },
-	{ .compatible = "qcom,scm-msm8976" },
-	{ .compatible = "qcom,scm-msm8994" },
 	{ .compatible = "qcom,scm-msm8996" },
-	{ .compatible = "qcom,scm-sm6375" },
-	{ .compatible = "qcom,scm" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_scm_dt_match);

-- 
2.41.0

