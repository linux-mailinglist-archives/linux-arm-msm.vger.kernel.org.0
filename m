Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92DAC6CBAC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 11:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbjC1J24 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 05:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232576AbjC1J2v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 05:28:51 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5964B6180
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 02:28:40 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id l7so10241179pjg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 02:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679995719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZX8cxV4gmi38o9Pi6mmNL+xnFc7tlNvHJgTN5N6z5i8=;
        b=apzKnvIitSI/0WTFCPr0IhmcMljZeuRif+xWlXzw//hp7biuZMW+mEyGg8x0t72cer
         /T8HMiCeyZ0338n7h8aiKrGSX5fCGUNfA9xc/PLkwcziR9YOnbc1iqWaIZJ972AVMNGS
         4vSDNsV3xIDCKYwtWwdNc9hZP/PuMySyy/OqdLHtcXwbgjoknFlmy4x3VkcLZyFMHbqf
         PIkN55HNJcemfSj3WkfFdGHhiaUNUw/NTzim0J25RpQkeK3HCUg921fR5QMjVCgB7JUp
         W3Uqf+ERgD5Tld4AxO33d5J/CYAcw/+Bnj8sY6KGmtmXFsR5cAgu8Nxzy/BOKFXyi6uS
         23WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679995719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZX8cxV4gmi38o9Pi6mmNL+xnFc7tlNvHJgTN5N6z5i8=;
        b=TTutSGeGo+R67xXJky1Uq0F/rWULmzFXoruyqhxTGhy6Jwt4uDHhTUz4TaBwk9SLV9
         6TSgjQ4h2mPkr+MkkYW4AsUIpNqRP6FqoClEn5owxX5EYkm4ZW0V3nM3BHvXaEzyC2Fh
         E8m0CHlhn+M7v377tm6lPeguW7ZCzLXUEMhM1d6MIWhfCjv98ipuKDaOCXZ7AVhhZ6Q3
         5aMNYsy+qv4KzXnlWGCrtQj1AcjkHojh4MeVn11OYXtdQhXUYopuk/iH1Ro7G3Ftz7qw
         +9y0Lq5aHU8YgMzSJ+Y+wKK+JZ6bgmzetR9IHVQoZ9cPREE9FYESy2IofSUTAjAvHzjv
         eVUA==
X-Gm-Message-State: AO0yUKVCNk756mAtA8PbSywjjiI9PC4mytixS6JKabB7hrmO1Fi5GOlv
        RmdvyFGLL26SLLePjluZJ0zvr1A8wgUhQOai5p4=
X-Google-Smtp-Source: AK7set8smGMl8U9nMCJ3GwkZbTsYCWJDbk3rI8HmACPZpKWp77dqK8lAMva6k047wkQUMjhCNoDWRg==
X-Received: by 2002:a05:6a20:2a29:b0:db:9131:dd7c with SMTP id e41-20020a056a202a2900b000db9131dd7cmr12890996pzh.39.1679995719309;
        Tue, 28 Mar 2023 02:28:39 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:449a:10df:e7c1:9bdd:74f0])
        by smtp.gmail.com with ESMTPSA id a24-20020aa78658000000b005a8bc11d259sm21261518pfo.141.2023.03.28.02.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:28:39 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, andersson@kernel.org,
        bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        konrad.dybcio@linaro.org, vladimir.zapolskiy@linaro.org,
        rfoss@kernel.org, neil.armstrong@linaro.org
Subject: [PATCH v3 3/9] dt-bindings: qcom-qce: Fix compatibles combinations for SM8150 and IPQ4019 SoCs
Date:   Tue, 28 Mar 2023 14:58:09 +0530
Message-Id: <20230328092815.292665-4-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230328092815.292665-1-bhupesh.sharma@linaro.org>
References: <20230328092815.292665-1-bhupesh.sharma@linaro.org>
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

Currently the compatible list available in 'qce' dt-bindings does not
support SM8150 and IPQ4019 SoCs directly, leading to following
'dtbs_check' error:

 arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano-griffin.dtb:
  crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sm8150-qce', 'qcom,qce'] is too long
	['qcom,sm8150-qce', 'qcom,qce'] is too short

Fix the same.

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

