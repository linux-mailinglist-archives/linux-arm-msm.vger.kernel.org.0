Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12CD627B00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 11:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235772AbiKNKux (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 05:50:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235639AbiKNKuw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 05:50:52 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB7C1A39A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:50:51 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ft34so27174718ejc.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 02:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O82IdtMN4gU2HPdWYJ4k/Ae4A8assTn2dDMpMVtowGw=;
        b=txB1X4GT186dmbeGXeIIwIamZIk2UtUpnIl9NptygNxW0hHhi8FeNkijyxN7OvDPu6
         ++YXt0DR11UBd/RSStujeTgzhiB21mBdDRsdsxJl5MXBJlArSj0m8V0NqJoWyPDNkcmb
         AObqiV9lKX0bB3k7M9c3+U2T2gNgL+7qAyZDuMm1OvqBnZzFGcktGYUQMMup7p1cN+zm
         qbil9d5nOG7Ebsl9KG1foKZNfZKAAEtgiA5OZcWWXuqLsUXP3gY23BleZZuNs0pO9kNU
         lg5RnmC0wQgDObRxj5H6RunNTwEyMgocfKVEQgXQU4cROkqO8PpZaYLc4vqBaqKNd1gb
         TUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O82IdtMN4gU2HPdWYJ4k/Ae4A8assTn2dDMpMVtowGw=;
        b=aF1/hy9ra52ca0kOT/On95gAi31F/MkbZoopSl65Gv3S6JzFw+9vzRlatCYkrm6i1z
         F+Y+mVOOowp61LUVz0yeu19A0+Xi7vU+ymlKztHU3klPWqvJ/AWPFSruKPbDkRMzqp0L
         xkVvu3UFGsU3QPFwFd0vdIx35JFQYkUDhfci6pJRVdVcdngzEZucl7P5cSyf1T9iMs0a
         sbOkwE/EU1qumYcajwhcFuKMjhFRhJEfhavPvAdTWWFJJJ9Z56hhD7edcfQsXXXa8ZCJ
         qBHoPlXhdATZ7lMmM27Y8y99wF8MLYcAFGEOraVkfyvWAujT6YjmO+EJlvl76ZcXZC0n
         98JA==
X-Gm-Message-State: ANoB5pnSJl5E+LoXNMzXyUvK3vDeG2xflAfHmY17Bg4Rj01RLJlw+OR7
        O5glhfU0YGDGYdZUomXlrXLAy904RlE5mOJC
X-Google-Smtp-Source: AA0mqf4DhiiUYgCZoIx6i3TSrYBciP3BDWtYhM4xbTCH9ibd42LoFFJte4VhLeXdm8d6RN5wXMDzUQ==
X-Received: by 2002:a17:906:414d:b0:781:951:2fb with SMTP id l13-20020a170906414d00b00781095102fbmr9849462ejk.64.1668423049581;
        Mon, 14 Nov 2022 02:50:49 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id kv20-20020a17090778d400b007402796f065sm4037053ejc.132.2022.11.14.02.50.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 02:50:49 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: mmc: sdhci-msm: Document the SM6375 compatible
Date:   Mon, 14 Nov 2022 11:50:41 +0100
Message-Id: <20221114105043.36698-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221114105043.36698-1-konrad.dybcio@linaro.org>
References: <20221114105043.36698-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the compatible for SDHCI on SM6375.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
No changes in v3.

Changes in v2:
- pick up rb

 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index fc8a6b345d97..12def0f57e3e 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -46,6 +46,7 @@ properties:
               - qcom,sm6115-sdhci
               - qcom,sm6125-sdhci
               - qcom,sm6350-sdhci
+              - qcom,sm6375-sdhci
               - qcom,sm8150-sdhci
               - qcom,sm8250-sdhci
               - qcom,sm8450-sdhci
-- 
2.38.1

