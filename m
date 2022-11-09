Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02DD4622DD5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 15:27:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231213AbiKIO1R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 09:27:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231584AbiKIO05 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 09:26:57 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF66F014
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 06:26:37 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id c25so26012179ljr.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 06:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1puYbvV3BBw2uUHTBpwVqMdBJxbx12reSCzoMBBxdjY=;
        b=kzu1EyV1aV2pofuK4QdBWzRGgFDw5fmb4qNQ5LyCgF9VeZuC29FD6FufF0WBQjlWko
         FibfHH/v9WPCxRVR/1dmUaqrslwECLe5QWYqmy4XjifcvmEyKHGXHtDKj8TfN/lIVQlz
         i3z3lrs/t6hbHbSzxvYsJC68bchQkOpcTgIBPFj6cyJMHAMZTTbBZoMmLVKdIekRvs0G
         9Vc3DtYaFyD0PKQBkHW/jSMkYepUlXkv0xogTE/zt48AfGseD7sdouvEXDoww5xhu+xM
         Z5DQyVyuz+EkXoMfgLx5G2q6D5B+j55Jerac6cGyJBGAp8+xJtfaJXLun2hzaM6FDeyd
         GAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1puYbvV3BBw2uUHTBpwVqMdBJxbx12reSCzoMBBxdjY=;
        b=IbBaCOhzUhKXSilJ4YR0PO9GhMeUAy7PkGXUHPdSQRfRsgy1Pj3ceRgpP0Gfx5roDn
         BRS5f80M/+vXqd6P2uSgSIi2yRylG1+LUMWIwqDM0YATOFnjIFiAOoPee6Mw21CoLFaO
         B1LhqeIHRBMoq6o83HJXXNA6L9RCUK0a9dwlu+M3tMDUo9AweWCnZzxV4qYuhEEIJ+2H
         DCoJwSszx0sCn386ryplolAQ+twTqd/bfrJsz3IlESBEW9rXtxVcBJsDlWYNL4TwB9+/
         YXxE6pAQd4HprrIL2DX5kXME//ooOGiPHVyVOKOR59cLkrTgIMqp8Prx4yZJq50uFumO
         KVHw==
X-Gm-Message-State: ACrzQf0rapxSsCEeeRaWVSMEygE2hnEjLYAQjhQ2v0XopY6P7E57AGqe
        bc1JvcUyubAZ2BiOoA/3l8xGjWmh4d0MsEJv
X-Google-Smtp-Source: AMsMyM7mKATFyBk3GS1QOkEosdXKj4Wo958Ts0D2K7Fwe59WQHhbkkcI4pbdyUgQHitqGntVMhT+xQ==
X-Received: by 2002:a05:651c:98a:b0:26d:fd1f:10 with SMTP id b10-20020a05651c098a00b0026dfd1f0010mr21197490ljq.323.1668003995514;
        Wed, 09 Nov 2022 06:26:35 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id q18-20020a056512211200b004a2ae643b99sm2241008lfr.170.2022.11.09.06.26.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Nov 2022 06:26:35 -0800 (PST)
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
Subject: [PATCH 1/3] dt-bindings: mmc: sdhci-msm: Document the SM6375 compatible
Date:   Wed,  9 Nov 2022 15:26:21 +0100
Message-Id: <20221109142623.53052-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221109142623.53052-1-konrad.dybcio@linaro.org>
References: <20221109142623.53052-1-konrad.dybcio@linaro.org>
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

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
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

