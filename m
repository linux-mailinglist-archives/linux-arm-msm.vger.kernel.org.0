Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17D3874F265
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 16:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbjGKOfv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 10:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbjGKOfo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 10:35:44 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DA310F6
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:35:23 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b6fbf0c0e2so90029371fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 07:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689086119; x=1691678119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oyco5JDx037j3CC/5Ihu7xd9SFL7i1B5RPFit6DU5NA=;
        b=w23R4XLZWoALYIhRhp+TogWJwABOEn2vt1cbkdZ2tGM9PHf4528vjlapChg8/xYAPt
         tCMP9c1NZ+Ro/pahFhbg6iIlrdHgeRj7HIwJksVEskQnIMoWVlMT1gmEChCnbODahxfa
         /DGRtrHzhG9JNGIG6PV4Gqsfj6h+T+wQWqsmCw02FQfOdgB4jU1SdNgb1rMJoEZIiriG
         GXEBlcgZUl17w/zrEDTfG73ff87Val3pFLoks29DV+UzjE8ODKUgP6dU8QMwsXm9bf02
         eQ3DNvACQuEe0KUE2PMEwfPH15Yb2tvH/0Vpr/MkK4Rz3wmlZQPhzKMYrLDj5YqTH/FK
         R+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689086119; x=1691678119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oyco5JDx037j3CC/5Ihu7xd9SFL7i1B5RPFit6DU5NA=;
        b=FTNXVN0QS00W1D/46wCzadtSt2idaD4kp7iAGQw8Jp87RnAaGai2y262tHZvOlnIi0
         R3X4qb/SaTUQWJiCkriylYpIWB565L0QaKmPXyEGBGdUK9Q6wZconqzoaO+mvlbl1hIi
         JBgfic8PYg/zwDXMpQHHEby59y6zBgQxIm5C72clsy5UjBXDCKjyV1bVxKllDD/4VHuT
         8s73LIVGbzOX2xtOub3QIvoG422ytJMEHolkc+Y0o/PKAFaWLUm5G0622bTapxIuJ5ML
         ZSEdnvDQK+pgYI6eyM7zsjc2wQeP/jIiaBNcYViInipxAZgkGGS7CADdx06GN07bVyWP
         XscQ==
X-Gm-Message-State: ABy/qLab8pWN/cnuA7qYOo3kdr4OJ0AOMd4gdGE5lwex5eeUq8/vIp8q
        RM44SBkWvCGo2oszWmtcNzCPTQ==
X-Google-Smtp-Source: APBJJlGEYQVfM84jtfrOqvF4dt3dPWC/ym7m72/wY+N6vRgRd3QwMLpt5h8S7fF1Mx3QEV2CJJYb3g==
X-Received: by 2002:a2e:8eca:0:b0:2b6:fa92:479e with SMTP id e10-20020a2e8eca000000b002b6fa92479emr14208937ljl.42.1689086119325;
        Tue, 11 Jul 2023 07:35:19 -0700 (PDT)
Received: from [192.168.1.101] (abyl96.neoplus.adsl.tpnet.pl. [83.9.31.96])
        by smtp.gmail.com with ESMTPSA id o11-20020a2e90cb000000b002b71c128ea0sm484221ljg.117.2023.07.11.07.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 07:35:18 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 11 Jul 2023 16:35:14 +0200
Subject: [PATCH 2/4] dt-bindings: interconnect: qcom,msm8998-bwmon: Add
 SM6350 bwmon instances
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230711-topic-sm638250_bwmon-v1-2-bd4bb96b0673@linaro.org>
References: <20230711-topic-sm638250_bwmon-v1-0-bd4bb96b0673@linaro.org>
In-Reply-To: <20230711-topic-sm638250_bwmon-v1-0-bd4bb96b0673@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1689086115; l=1271;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=y8JreLdLXyJLqMWdu1OHC8XLto0h/XQOLRW3FKQUVDc=;
 b=TJkZnuVQFZcromYVHOBquze+DCg5ojW6C/LKh3G/LeyhIhmrHFfzWKs/5+qpl4uzyUR4QwoXf
 iz/D0silT+1Bfh+PBV4hINAYh4XsIK925W+Rrn4S8jOBTObnPbfPnNQ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM6350 has a BWMONv4 for LLCC and a BWMONv5 for CPU. Document them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
index 51ba6490c951..73f809cdb783 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8998-bwmon.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sc7280-cpu-bwmon
               - qcom,sc8280xp-cpu-bwmon
               - qcom,sdm845-cpu-bwmon
+              - qcom,sm6350-llcc-bwmon
               - qcom,sm8250-cpu-bwmon
               - qcom,sm8550-cpu-bwmon
           - const: qcom,sdm845-bwmon    # BWMON v4, unified register space
@@ -36,6 +37,7 @@ properties:
           - enum:
               - qcom,sc7180-llcc-bwmon
               - qcom,sc8280xp-llcc-bwmon
+              - qcom,sm6350-cpu-bwmon
               - qcom,sm8250-llcc-bwmon
               - qcom,sm8550-llcc-bwmon
           - const: qcom,sc7280-llcc-bwmon

-- 
2.41.0

