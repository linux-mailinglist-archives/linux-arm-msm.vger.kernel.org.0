Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D17756BD1F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 15:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjCPONW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 10:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbjCPONK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 10:13:10 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865C39F067
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 07:13:07 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id a32so1850435ljq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 07:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678975985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HNoZo2uT81mxVeKLelFqU53D98fdSiAid3ySyEFFUc=;
        b=OZXcUOkjYPuyo/kEj7oXIvQmAgqkee8YC7CzGHFDvFCLiYiPt+YAXku484VxFauoAO
         fMS5DbRcBHiAI1hxrL82ChRTGWpUUdNymKBa2WemrEFZwiYfjknq+tE2RsBH9KrrAHLf
         Tr5twCLurPfJQGqgUrECd01DwuXZ6X5nE7PPuxo4EouZUIiEYM5o6xJ11vw60/Omu5i+
         66zMW3bmzuUuOd1pNy/q/1dcZC1Bhaej7xst63a09OD2sGF+bkSLZmVy4q5/2e6rjaGS
         ajnHwG9BgUkR0+uMXSF0PD2DppsyHEOQeBdWGmTiOhHAixlG8tp52e+MDCkmnej4i5Ga
         5BeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678975985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HNoZo2uT81mxVeKLelFqU53D98fdSiAid3ySyEFFUc=;
        b=O5pGxyc67DdpPkOlRARhpwQcw+8MgOJVO+TdYryYs3SjLER7hFn6ETglzBMH2OhE+J
         DgaxfHPEj3geyvj/JVArpvKtPv5cnQXtx6U5+6/9DisLXOtO0B93cxjXnBKTzF/ULHfD
         g+/U9dafZkgoOg8vl+u7XBEqu1drqeuYClDI98Pl328dHzAl/JtZU/9EaAotwALn3nWe
         /o0DNH+oU1RGaQIfWwxCym1TA3yDmN/TlJCvFE51ImEhY++RW5WFwqPq1L7Q1T4gHQHx
         IGldk2Q1NHWJLbRg3UpuPoKMowVwSBTWWu0Ynf82JCYuKAyID+bnZWsqo8+9TSqtsrRg
         lLUw==
X-Gm-Message-State: AO0yUKVTxG9NsM6RHw4+P6issGSYiw1ebGGJ6uzgXGwJNnisfEe3sDdU
        I8quymH3BeKLlqu2ShatdREEaQ==
X-Google-Smtp-Source: AK7set8FzGv3wDhpfbCvBHGhmP74/TFh+5YiXdcXB8cu3s891aix25cnhj3DblLjZi0aT8XHIFj3pQ==
X-Received: by 2002:a2e:8718:0:b0:299:ab8a:b2d1 with SMTP id m24-20020a2e8718000000b00299ab8ab2d1mr608839lji.41.1678975985347;
        Thu, 16 Mar 2023 07:13:05 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id a9-20020a2eb549000000b00295735991edsm1261639ljn.38.2023.03.16.07.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 07:13:04 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 16 Mar 2023 15:12:52 +0100
Subject: [PATCH v2 03/14] dt-bindings: sram: qcom,imem: document SM6375
 IMEM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230303-topic-sm6375_features0_dts-v2-3-708b8191f7eb@linaro.org>
References: <20230303-topic-sm6375_features0_dts-v2-0-708b8191f7eb@linaro.org>
In-Reply-To: <20230303-topic-sm6375_features0_dts-v2-0-708b8191f7eb@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678975978; l=798;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9sriG6OohvcstL9pTBH/SrGNaq/ftoFlv/MrKKmr1+Y=;
 b=IndxXPxby0uI6TQ3S+VX1e7DW5de3aC7UelsLhcNRGVpQY1n0C1n95eUPmdmQerD9cppRAwG0vn6
 JG4t0SkVCRtnO1c2rJO0Y5Dgef/ATQcT4zvSMvqwy7pfvuoFwV86
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible for SM6375 IMEM.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index ba694ce4a037..0548e8e0d30b 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,sdm845-imem
           - qcom,sdx55-imem
           - qcom,sdx65-imem
+          - qcom,sm6375-imem
           - qcom,sm8450-imem
       - const: syscon
       - const: simple-mfd

-- 
2.39.2

