Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB3B95747E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 11:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235728AbiGNJK5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 05:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237664AbiGNJKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 05:10:51 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB5EA23BDB
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:10:50 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a9so1733776lfk.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 02:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QeR3DFLgzM8qo6wNayqmpjIsz3WLvihoJpHEg++lMwQ=;
        b=M7BhE574Me+yvLXZ6Xij24gXgaXCtQq3v67mXre6GxQ8vC/RVAcZDmOv/be+cOTi/+
         ksEM6bRwNQaDvDTrSTfrJc7hgZLZJXtLji886bzG70FCKn6hZh7Nw/f6+AH7MHF0laWS
         G2+D+Rsa2xdOJoYQT/o4955QBbLfA1LOG5FMItuoZPmObuLjiYm6a0SYrQTczzTLNvFV
         GoltiqMoBEk3p27P5ZUHAcO3irtOnGVlfZgA3KVvc+9i8K/+27vUnsxtdqCMZz6XBtDm
         zfqUQr/Xfckd0mBvAYjqpWuuI2md7/n76QNciMgvb2BPwuB8Q3tBxRRgAv6aFB/qbCkU
         P9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QeR3DFLgzM8qo6wNayqmpjIsz3WLvihoJpHEg++lMwQ=;
        b=nvRTGgX9RVCCwMCzGxIJ50MJUiJAlZUw7S5KaqbqJN0ndaK6s24c6CJdUMJSqWKjOF
         /mBNz6iDa+dYP+QND2mN88Dl9GrJa5xQVlOmrIKeSvZLLwqAa0wFXShrvjWczQkXRWbS
         SCjJpwidV0jnMxMGF7oACFrrlo938wjWRVIhmCWIj+IVD9nHdJsE4iM2NsWLBj9kEiEv
         olOWZxEmF2xb3sVnpwJ68AHB90mnw3wDrbtmunGcGnhWarMTqo+qyBuz9M15sDTS9mea
         pO2/C0Le1AQN9r8Tbzl1B964ySvISzU22DCS6KSi7qBTIev+Bnj85ecDxG8+VXO0EkSo
         EIPQ==
X-Gm-Message-State: AJIora9uSuZ0NqeNXJACDn5/nkUzodORsBo4ZfDiZpRN3av7n8L9Zx02
        xmLo9XoyaMiucI0g4EJxtQgDDg==
X-Google-Smtp-Source: AGRyM1t8330HgtAwWfP+SD3hrM0LmatOLtfN60is05O//2BlvyszFHD5/EgfOJja6qrNjWZ5aU5Pjg==
X-Received: by 2002:a05:6512:2241:b0:479:6426:15af with SMTP id i1-20020a056512224100b00479642615afmr4548835lfu.631.1657789849190;
        Thu, 14 Jul 2022 02:10:49 -0700 (PDT)
Received: from krzk-bin.. (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id d8-20020a056512368800b004790ef191e3sm250006lfs.216.2022.07.14.02.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 02:10:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 1/3] dt-bindings: mmc: sdhci-msm: add MSM8998
Date:   Thu, 14 Jul 2022 11:10:40 +0200
Message-Id: <20220714091042.22287-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220714091042.22287-1-krzysztof.kozlowski@linaro.org>
References: <20220714091042.22287-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a MSM8998-specific SDCC compatible, because using only a generic
qcom,sdhci-msm-v4 fallback is deprecated.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>

---

Cc: Konrad Dybcio <konrad.dybcio@somainline.org>
Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index 31a3ce208e1a..0853d0c32dc7 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -30,6 +30,7 @@ properties:
               - qcom,msm8992-sdhci
               - qcom,msm8994-sdhci
               - qcom,msm8996-sdhci
+              - qcom,msm8998-sdhci
           - const: qcom,sdhci-msm-v4 # for sdcc versions less than 5.0
       - items:
           - enum:
-- 
2.34.1

