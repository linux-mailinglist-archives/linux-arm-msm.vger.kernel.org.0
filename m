Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67374712D40
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 21:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237066AbjEZTXT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 15:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243630AbjEZTXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 15:23:08 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82007E4D
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:23:03 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1ae3ed1b08eso11081985ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685128982; x=1687720982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpPwFY/HaOY0pRrudkg3nKNQcds7yLTTcGxLx+E7yvc=;
        b=nZQpG6XjCRIqdjJ97HJtAVdHuT1jvfE5pxEBmtp5eh9nn1h8JGQ3nZH9EUL3Hjh6Nt
         +W/CA7MU0r1vgzW7Kcxjn3iCWfKpR2ofORw70PL+TqhHTrXDdtaLC6BWCUNOUmSBSyAh
         rrlGYAt48vpx9pe2i1R+6WK1gzlgDrF8RCdvJQ2uc9BGlcEqa0i1bJBSWeatOLb36g7f
         5GaAbc5V3ujgJTB7ntSA27x3Di91GXQYJDGWE0PMvWYWl33SFz4se9ZkCZZaE5cQXPMl
         Cd8qMPgrCOwue075A07tVRpGTL31OcrtuKeHMxIZaZxAZqEVlitOx0qDKkpaoFMoWafY
         INhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685128982; x=1687720982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZpPwFY/HaOY0pRrudkg3nKNQcds7yLTTcGxLx+E7yvc=;
        b=CtdRmaRafg9kpfZKSlf/GfRUGavC9gDalogms7aEOb6AyOVx5veDW2+/0o2KgXRQ+r
         O+Of52CFyeZpcenPbiIn7C2cGb8t+czHg9esIJ7sYpghkZXR5m3YYVRii5AB8PQhQGlZ
         g5xCsSxoZZ4v5IwTOBHbmZA8QdCn0Rn8a6lGU555F6jj+Ij7WbM73U2+O+ty88C2hPVe
         1M50gxvBTVKWwPeyRqV4/NgF7o9jn+mdnsVJWxMlkOnvwm3hJQvhbateCiMOEAuzB2Sm
         f9xvvU95Ubw2EdV0eONDA76j1p/MuzJg5wfUU+JbpQ8hKg2jZ/h8DQ4/E4w9XPb13kL2
         hAYg==
X-Gm-Message-State: AC+VfDw1nNbXGCRN94msMybWSLIZ1xk2+Q00MCMkCsLQoWWOSWlRJXBj
        Fybzqkzh9ejjjX4uQxm/olyMXMizFPtPonXF82Q=
X-Google-Smtp-Source: ACHHUZ7XYpVClx7JLDKuJ1eXmUISuCMmvGE9KcNe309uhN+vHxT/tRg4Qv0NpJRgB569/wa6/dZK5w==
X-Received: by 2002:a17:902:e54d:b0:1ae:6e7b:9bb4 with SMTP id n13-20020a170902e54d00b001ae6e7b9bb4mr4013984plf.59.1685128982454;
        Fri, 26 May 2023 12:23:02 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f3a:6990:1a5c:b29f:f8cf:923c])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090311d200b001b008b3dee2sm1955079plh.287.2023.05.26.12.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 12:23:02 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org, djakov@kernel.org,
        stephan@gerhold.net, Rob Herring <robh@kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v8 05/11] dt-bindings: qcom-qce: Fix compatible combinations for SM8150 and IPQ4019 SoCs
Date:   Sat, 27 May 2023 00:52:04 +0530
Message-Id: <20230526192210.3146896-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230526192210.3146896-1-bhupesh.sharma@linaro.org>
References: <20230526192210.3146896-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently the compatible list available in 'qce' dt-bindings does not
support SM8150 and IPQ4019 SoCs directly which may lead to potential
'dtbs_check' error(s).

Fix the same.

Fixes: 00f3bc2db351 ("dt-bindings: qcom-qce: Add new SoC compatible strings for Qualcomm QCE IP")
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Tested-by: Anders Roxell <anders.roxell@linaro.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index e375bd981300..90ddf98a6df9 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -24,6 +24,12 @@ properties:
         deprecated: true
         description: Kept only for ABI backward compatibility
 
+      - items:
+          - enum:
+              - qcom,ipq4019-qce
+              - qcom,sm8150-qce
+          - const: qcom,qce
+
       - items:
           - enum:
               - qcom,ipq6018-qce
-- 
2.38.1

