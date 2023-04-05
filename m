Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 082226D7590
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 09:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237146AbjDEHcD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 03:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237151AbjDEHbf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 03:31:35 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B66CC59CF
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 00:31:20 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id p3-20020a17090a74c300b0023f69bc7a68so36409449pjl.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 00:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680679879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScrPtwLifF81mLBCSzco8cbRfT+aGGc+R4ZbxOTPL28=;
        b=yo1E1yoKY/0EEUjn6/jguZggtiYUWH+mD44H2FkHddBMrSJuWJcHQWSDVCQNmY7FVp
         pe7VOZp36hWx40gL8Hx+cajf8mhR4hBMjx+v01GEVAnuLfHqUciud4cO/f7L3sCJl4Ar
         h2xTHNgkIpUBTnn18SlCyJfZJUHJ97Pbxw+IvYkfWQIfOe1RPcHv90jxjwXoR/gGm5E0
         RnPT3LEGLzwKRTR+apQ0yPjazPOn+oBj54pk/+tRYh7dQd7eTtowELjwnIQqmnz9l59t
         jdbR4BGjUerkQ55UFu260XundYpLzhisMh39RVzT/QZc1S0702FRuBVw7gZ8WiodnHMS
         NCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680679879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ScrPtwLifF81mLBCSzco8cbRfT+aGGc+R4ZbxOTPL28=;
        b=axig4oWeXYdMXqFP/vpRhTS+6t5sCH5/Wgu5Meyxe9kCrBuGlzRbHCejLZ+Aq8OWaq
         /rNOzIukx/mQn748AfStyU6mmwBLN0O7QXOgkw8AX9tnjiZGEGK0OmXZnlthU35boVGA
         Ays1qrT4JvJwPdsQVwFUv711YZIzaRMf0EC7q15dD+d3Bfj25xzk+MRA+Ec5++pp9BXb
         93197biCBUmO+Qrk7EtClnAHNKfiiKROsfP3A9Dont8zyA48JGCD10Kcjh1fX0nMDZ7A
         SWXBIwkFVMbBf8ey3cyZyPyBNSsHfq8V5tady/nGqudaLSNcuDFh1JDSJRlw5nrYs3sw
         zy6A==
X-Gm-Message-State: AAQBX9ff1uxsJ3/vtYQdLjJgO6C6oMWxQyLCJmbxR84s667/GRuNhczd
        3XmawpDOXuFYJkO2T5Ty7a5bz91cQxundCoDa4E=
X-Google-Smtp-Source: AKy350aMaZhBNcxFxbE9JlpaBqLSlaYmaAs4/UkCgsP7H00LbSh2jLBO3P8aHiryTuypoxgD89Adyg==
X-Received: by 2002:a05:6a20:bf1e:b0:d9:3937:43a7 with SMTP id gc30-20020a056a20bf1e00b000d9393743a7mr4416074pzb.55.1680679879122;
        Wed, 05 Apr 2023 00:31:19 -0700 (PDT)
Received: from localhost.localdomain ([223.233.67.41])
        by smtp.gmail.com with ESMTPSA id l7-20020a635b47000000b004facdf070d6sm8781507pgm.39.2023.04.05.00.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 00:31:18 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org, djakov@kernel.org
Subject: [PATCH v6 06/11] dt-bindings: qcom-qce: Add compatibles for SM6115 and QCM2290
Date:   Wed,  5 Apr 2023 12:58:31 +0530
Message-Id: <20230405072836.1690248-7-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405072836.1690248-1-bhupesh.sharma@linaro.org>
References: <20230405072836.1690248-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Crypto Engine block on Qualcomm SoCs SM6115 and QCM2290
do not require clocks strictly, so add compatibles for these
SoCs, indicating that they are similar to the flavour
found on SM8150.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 90ddf98a6df9..82ea97568008 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -41,6 +41,8 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcm2290-qce
+              - qcom,sm6115-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
               - qcom,sm8450-qce
-- 
2.38.1

