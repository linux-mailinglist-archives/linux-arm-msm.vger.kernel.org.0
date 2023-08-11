Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A71C7798DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 22:51:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235459AbjHKUvJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 16:51:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236587AbjHKUvG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 16:51:06 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E6E30EB
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 13:51:03 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe2de785e7so3853772e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 13:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691787062; x=1692391862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QB5xPzqWzKOoML0l3PVSjUAWLn+OWEjXc30hnsMTP30=;
        b=fBmCkYdDOdODeooFLeiVItqNPuPMPFnsB2sguQDoHmPAbHa7mBkfKmxoJpZXpbayW9
         yqkHuR5uj9WVDaS6qIQ3GM4Z6P6U6Z2xmkNyZTmx5a0poyfVZFHHkjB9p0GSUbSITy5T
         Vqqe/Cus5frPq6pT5Pg2jlZYCc7Mr+ZnnK8KlV7rXK0JDRVRPXCSBq5zZCiYiVSURHIc
         ggWR37h9BBUMhYCAFIot+/xPLOj35MkHl2GE3d0Taz2NnFc4D6TsByIsmDyw2wXMLNjj
         HChGL1aKNx/tKbxfCV7C+l20cp3iWPbK6NZpRE1wQACf9qpY5+wITo0V1VRLQTgRK4EB
         DVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691787062; x=1692391862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QB5xPzqWzKOoML0l3PVSjUAWLn+OWEjXc30hnsMTP30=;
        b=Rpc802xetfqKEJqQEH3mCnyhEkntSYw2m5jeLJm56pKja43KmR/K93m8snBs02+cLU
         4pLX9YF/v4rX0+QFvSNyBwgx3QVBsmVps48r1lrMNg/1UqLQCW9U4Zmn+Aj9fQqsvYrp
         XpViJiQN8CBN3ugYZQrwd54jpqejy7O1RWY5F+M7FgKz3wpGNVScsariU4ZWy7upU8Gi
         D5DSt4Cg1kDYHDpNW5YSuYlpXTIS5as9B1AwG3KMLUHEo3YyqLzhszbj3UwDjde8+e6A
         zC+S2GtjMKea8/NcB/2CtP7Cim137Pj1DC/jm7xU2zNMWlDhbUuKrVZmF98/mUiEBIXc
         3RYQ==
X-Gm-Message-State: AOJu0Yx2Dxs5wOK0jnM/2MFTrU33/fF167fjIZ0qY9fSX7FvCK3Enum0
        qrcBKh7sSh3ZR+zvxP6MvuXWKg==
X-Google-Smtp-Source: AGHT+IFz+rCkKcqd0YzQc8eu1kZyDXmDzxIVaGMt3ZEHL79F0JeFtqROLu1tLVU1YdhHiMY9MUonuw==
X-Received: by 2002:a05:6512:1194:b0:4f5:a181:97b8 with SMTP id g20-20020a056512119400b004f5a18197b8mr2670689lfr.25.1691787062202;
        Fri, 11 Aug 2023 13:51:02 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id w26-20020a19c51a000000b004fb964d48e6sm858285lfe.95.2023.08.11.13.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 13:51:01 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 11 Aug 2023 22:50:57 +0200
Subject: [PATCH 2/3] crypto: qcom-rng: Make the core clock optional
 regardless of ACPI presence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230811-topic-8450_prng-v1-2-01becceeb1ee@linaro.org>
References: <20230811-topic-8450_prng-v1-0-01becceeb1ee@linaro.org>
In-Reply-To: <20230811-topic-8450_prng-v1-0-01becceeb1ee@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691787056; l=1084;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=RzvdGw3IEkgoyMi6gKDkVuP1H4j8B0h8WD5wZuY2HnM=;
 b=+9SEp37pEI+KIv4leu0konNKFkQlJyzX4N8S00ogXVAhEo4UoRef+dyDlDBl7nifWIr6voJO7
 /JIK/XDll/eBBzVyMALXSlpwdsVVy6H4VVHp417WyQtwBxZpzBR0Gx3
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some newer SoCs (like SM8450) do not require a clock vote for the PRNG
to function. Make it entirely optional and rely on the bindings checker
to ensure platforms that need it, consume one.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/crypto/qcom-rng.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/qcom-rng.c b/drivers/crypto/qcom-rng.c
index 72dd1a4ebac4..825a729f205e 100644
--- a/drivers/crypto/qcom-rng.c
+++ b/drivers/crypto/qcom-rng.c
@@ -173,13 +173,9 @@ static int qcom_rng_probe(struct platform_device *pdev)
 	if (IS_ERR(rng->base))
 		return PTR_ERR(rng->base);
 
-	/* ACPI systems have clk already on, so skip clk_get */
-	if (!has_acpi_companion(&pdev->dev)) {
-		rng->clk = devm_clk_get(&pdev->dev, "core");
-		if (IS_ERR(rng->clk))
-			return PTR_ERR(rng->clk);
-	}
-
+	rng->clk = devm_clk_get_optional(&pdev->dev, "core");
+	if (IS_ERR(rng->clk))
+		return PTR_ERR(rng->clk);
 
 	rng->skip_init = (unsigned long)device_get_match_data(&pdev->dev);
 

-- 
2.41.0

