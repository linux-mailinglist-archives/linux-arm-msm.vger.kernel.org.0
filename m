Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8398B62B815
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 11:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbiKPK04 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 05:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233100AbiKPK0A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 05:26:00 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 030395589
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:23:35 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id z14so28969432wrn.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 02:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abB2Tf530H//bUhqVyc/iAo07/dh8OakivCuKDN/7YM=;
        b=TCTylYO7TwCOJevFShDQWN3S8vJ4vVKPYy3ZkbYDV3nLG51A0Fj6i7O56liH3PbYsX
         6vaYGc9yPjMY2bspqLy9MGpLXGQvI4uBC1XgcTAoqRKhdD7TTsQm684uh3Yq3IkbCohx
         binjMcNPZit36b53EJf6+0wuHo1G3lpP1i2/X9m+zpdSU3whSKc7tRL2PkWmby3qg8t+
         6maV8hLoitZmMpKn+AkMcVz3lxafA/EuW31toat4A/Ut7WHRibRLj06dOVGd+iBZhJqP
         mYasNuybF8zFYduoiOdh4bE9d6M8h/95goWFR5DeS7NaUJ5if1kZ0vspjrgBeTvPfOFw
         LKwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abB2Tf530H//bUhqVyc/iAo07/dh8OakivCuKDN/7YM=;
        b=iiOMOeeTRJRmL/5FMz9l+eJc7g/4Z41oPWscHxR/e1MVPqpEjtrhTxSolPcIqHPjcw
         zP//Hm85WSiDZCudRN29D+Z4jRVnjYLbmegjZ2noDJa9o8S8pM7dlCw5xRefddpKtSF3
         +mXWA8gSMykWbwlis6HkOkNijiihpf8/J2wpitc7BMVDXQTEYreFun4ifDQYJF3E+l8g
         eNIE/3jKQuTPIMMKyiV95yV5rlYweayHUkt7kjOthq0f63u061QsJM6aByecaR6Fx5P0
         MpD4k369i6zKC7KgPyt1V2Ejcv+fjyZUsFGz/9wh+ZyGUuw+R1k5Px+h85Eo1fkZg3mJ
         2Cpg==
X-Gm-Message-State: ANoB5pnxsJMdcev2M9o1Rw6U9fIGUwwgF+Mmdzd+qF5rstZbqmvjHwPg
        t+uUU9R9BtYdBx9FxTI7J3c1TA==
X-Google-Smtp-Source: AA0mqf7O4xuJgmNks4wBYBU8i02T4+NNp3T0jvYeUDpMRUp6IljLUlrwFMFjC2zgkSuvQ0zsqprbBA==
X-Received: by 2002:a5d:4346:0:b0:22e:2e3b:7ecf with SMTP id u6-20020a5d4346000000b0022e2e3b7ecfmr13322295wrr.304.1668594192958;
        Wed, 16 Nov 2022 02:23:12 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id i9-20020adfefc9000000b00228dbf15072sm14927047wrp.62.2022.11.16.02.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:23:12 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 16 Nov 2022 11:23:10 +0100
Subject: [PATCH 3/4] dt-bindings: qcom-qce: document sm8550 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221114-narmstrong-sm8550-upstream-qce-v1-3-31b489d5690a@linaro.org>
References: <20221114-narmstrong-sm8550-upstream-qce-v1-0-31b489d5690a@linaro.org>
In-Reply-To: <20221114-narmstrong-sm8550-upstream-qce-v1-0-31b489d5690a@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.10.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This documents the compatible used for QCE on SM8550.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index f25089bf9a2b..544ff67202a1 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -24,6 +24,7 @@ properties:
       - qcom,sm8150-qce
       - qcom,sm8250-qce
       - qcom,sm8350-qce
+      - qcom,sm8550-qce
 
   reg:
     maxItems: 1

-- 
b4 0.10.1
