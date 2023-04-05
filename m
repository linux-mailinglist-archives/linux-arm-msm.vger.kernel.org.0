Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 834A16D8294
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 17:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239111AbjDEPvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Apr 2023 11:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239116AbjDEPvG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Apr 2023 11:51:06 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4DFE6A7B
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Apr 2023 08:50:58 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id y15so47236043lfa.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Apr 2023 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680709856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2V+//3qTRfFc+qesLfjECY8KgEgnYIKHLOTmqMjRH5c=;
        b=yOIQlCoGLLRMd0MCmdFYsvIBSkIOKodtOVe2CbnKWndNGqtHaM4S7t24GhUWQBJef9
         g4gmZFojqthXo9Yw4mX7M2+lzZ8YqZaYEpRWek+3NgYHdlQ/KSo3VSIzX5sYyxMph9TN
         71DPSEJkhOveg3FyVvTd3Hragn+y7+s68NhoATER1LBnEyE4vX2yOFo3bFELC9bxV34K
         vBY3PlynFCr/G1zhAi15IaoJvGHDHznRwDRSkD+w4wJry3ppDCu5ts/CJDHET086o4d8
         2/IM5CDwAI6qFcmpzNP/iud01hwLER0LqbKmHioESDkF6ZBkow0evvmZLvPfdUEG9ZoW
         a7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680709856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2V+//3qTRfFc+qesLfjECY8KgEgnYIKHLOTmqMjRH5c=;
        b=04M9TeCrQG3rej0k8wDB/WEhJW2aRfberJT42dyGfU9/3olGwLTUgRVS6BSUukCuOe
         QUwv48EmlUJNBdvliTWRosTaxYM0bEo2JofVmqS7J5tnhrcxYGDM9SZdm+du7zm6u4Qf
         6HwSr7AVXD4WOqUcQgrwOGIMfY67zB4bborXOAJK/jQomx5iUwk6B5UXXsfpY5wIBetv
         UFFz5+8aZ3To7HrxtDv0PrpnVYPqSAJC5tyECRuHDn9vtrGsEunX9/B2pXPjLkiteCPd
         O0HSaczIThRmXy2LeuQCksNtcxs9TNVH2krcuL6ApayKs28ifu78WA+mpu0vtUYU6nbt
         8pqw==
X-Gm-Message-State: AAQBX9fuCNHTJjHy8EsbFnR2eo2g6hysRalO8GuUEBqPXdm5/9ATBYt9
        Qmir+asxElptbgz2XwjWrMj56yv+Un5mwmGXzZ8=
X-Google-Smtp-Source: AKy350YvUrKb1ng1AX2KabnQcR5gCfWOoQV5dLrPuM7el0H9QJYKsgv51Pu86Iba2vbavkl5loVMjQ==
X-Received: by 2002:ac2:55a4:0:b0:4e2:337d:65d3 with SMTP id y4-20020ac255a4000000b004e2337d65d3mr1632694lfg.40.1680709856665;
        Wed, 05 Apr 2023 08:50:56 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id o28-20020ac2495c000000b004eb2db994e7sm2869344lfi.239.2023.04.05.08.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 08:50:56 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 05 Apr 2023 17:50:30 +0200
Subject: [PATCH v2 1/5] dt-bindings: firmware: document Qualcomm QCM2290
 SCM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230403-topic-rb1_qcm-v2-1-dae06f8830dc@linaro.org>
References: <20230403-topic-rb1_qcm-v2-0-dae06f8830dc@linaro.org>
In-Reply-To: <20230403-topic-rb1_qcm-v2-0-dae06f8830dc@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680709854; l=1346;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=6P3gasE9HThpbkJ1H0jL6BprGLBwZW+LMCHOpIgamGE=;
 b=yLE4K4siLVQtQF1Yk5ZlF/2gvKl7bnU6LOupzvdjI8M7IFmvt65md1dVf7F7tMYUsqKrf6gge9FN
 nrrK5sQtANxJuX3SE+7PeFt92TZwrNUa9K993o7PiYPgekhSqZNm
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible for Qualcomm QCM2290 SCM and add it to the core clock
users list.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 543feb3b6c58..35540f292bfd 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -40,6 +40,7 @@ properties:
           - qcom,scm-msm8994
           - qcom,scm-msm8996
           - qcom,scm-msm8998
+          - qcom,scm-qcm2290
           - qcom,scm-qdu1000
           - qcom,scm-sa8775p
           - qcom,scm-sc7180
@@ -109,6 +110,7 @@ allOf:
               - qcom,scm-msm8960
               - qcom,scm-msm8974
               - qcom,scm-msm8976
+              - qcom,scm-qcm2290
               - qcom,scm-sm6375
     then:
       required:
@@ -127,6 +129,7 @@ allOf:
               - qcom,scm-apq8064
               - qcom,scm-msm8660
               - qcom,scm-msm8960
+              - qcom,scm-qcm2290
               - qcom,scm-sm6375
     then:
       properties:

-- 
2.40.0

