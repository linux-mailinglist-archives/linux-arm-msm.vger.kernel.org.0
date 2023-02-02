Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF3B687F3A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 14:51:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbjBBNvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 08:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbjBBNvH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 08:51:07 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F78C8FB47
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 05:50:57 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id fi26so2055896edb.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 05:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnZ4Sd2YODcDYA7OAgTUgwmpZPLk3snZO1ph9Ml4xaw=;
        b=y5gctVTvEyV+jf6SE2ZDAH8jJMLfKnhYQYazC/xZwLoovvRhtnIldun94egmr5Vlo4
         dXSuOv6SZqmQjG/EjmqkSHIRmSBbROrnaiBaXylf8cymwsa11y0EHZ3aUafmBcORqRIb
         hWALb6fOcXjeCXgcuWlq1+vHC2JGvs3Jxzb/BObp1VwIDOiU6waPmTyyK6m9VJRpTFZO
         rk45A57DJeXaQXrIkXcvFm0KiWpd9LyQK0cEnGWKcBO/a580I1AEHXe/u5qoI5e9E0GM
         RCYNotyiHP6bSFGqU+CxI8toQ1PLZA3V+kOzC5AFo0xaz6iRzIjl07nGeAg8Nt/94Y+B
         iAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bnZ4Sd2YODcDYA7OAgTUgwmpZPLk3snZO1ph9Ml4xaw=;
        b=TZl5UJJyD/IjuRmAs1ZgYITvf8pyxSbdC89ESjbsgEIIiuvgGqunW450gRlk/Hu8vt
         fr8hr8I4GXAeSAbNgrMQvfBM72i5dMwk06uN6w9/WwDJwy6JXQYBfjkdoIZcHedouJPw
         nZBJSuwlEui2jrR0KJc4WyjpLPjB0GHDQqaWahuigrfTD3jxotn9ipG4+tg8Wv6DRzRm
         TgYlpj6TP89vUpMZTQSoUeB5minHYDn5w7A5sZclwy95MKoSIju7Wbr3rRcjll8aCQab
         HaqFLy7aGqmHypCgbk7cGAbcvtg9rpq6eB9w3JklqDSx/ufxigtneCfCl9ZRt5yW3zFP
         Ql3A==
X-Gm-Message-State: AO0yUKXryGyImoWabAOLh8TnPXsex5vvLUBI/9i542w3VnIrnlG69EOT
        Qc8RegFlsJoYGwb96FGGUvyNHQ==
X-Google-Smtp-Source: AK7set/hwBTHqpLOwfstIVfiAKLMsbwFdgJzBBiwQPIytgA0gSi9CTKiorTNia9dedR3AI8H+fRDYg==
X-Received: by 2002:a05:6402:34cc:b0:4a2:5b11:1a51 with SMTP id w12-20020a05640234cc00b004a25b111a51mr6761353edc.2.1675345855901;
        Thu, 02 Feb 2023 05:50:55 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7c157000000b0049e1f167956sm7596332edp.9.2023.02.02.05.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:50:55 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v8 9/9] crypto: qce: core: Add new compatibles for qce crypto driver
Date:   Thu,  2 Feb 2023 15:50:36 +0200
Message-Id: <20230202135036.2635376-10-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
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

From: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Since we decided to use soc specific compatibles for describing
the qce crypto IP nodes in the device-trees, adapt the driver
now to handle the same.

Keep the old deprecated compatible strings still in the driver,
to ensure backward compatibility.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: herbert@gondor.apana.org.au
Tested-by: Jordan Crouse <jorcrous@amazon.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
[vladimir: added more SoC specfic compatibles]
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/crypto/qce/core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index 8e496fb2d5e2..2420a5ff44d1 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -291,8 +291,20 @@ static int qce_crypto_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id qce_crypto_of_match[] = {
+	/* Following two entries are deprecated (kept only for backward compatibility) */
 	{ .compatible = "qcom,crypto-v5.1", },
 	{ .compatible = "qcom,crypto-v5.4", },
+	/* Add compatible strings as per updated dt-bindings, here: */
+	{ .compatible = "qcom,ipq4019-qce", },
+	{ .compatible = "qcom,ipq6018-qce", },
+	{ .compatible = "qcom,ipq8074-qce", },
+	{ .compatible = "qcom,msm8996-qce", },
+	{ .compatible = "qcom,sdm845-qce", },
+	{ .compatible = "qcom,sm8150-qce", },
+	{ .compatible = "qcom,sm8250-qce", },
+	{ .compatible = "qcom,sm8350-qce", },
+	{ .compatible = "qcom,sm8450-qce", },
+	{ .compatible = "qcom,sm8550-qce", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
-- 
2.33.0

