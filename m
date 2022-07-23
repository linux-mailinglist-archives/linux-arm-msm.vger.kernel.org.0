Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4405757ECE9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Jul 2022 11:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237116AbiGWJJt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Jul 2022 05:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236129AbiGWJJs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Jul 2022 05:09:48 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186815E336
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 02:09:47 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u19so11164501lfs.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 Jul 2022 02:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7GNDO2wV++3CS7hKS3KK9Ui+AR2lPsXYWnoRN/5ZAjU=;
        b=gSGPHaNbDj72a8bkDxRiaJLLL1mZseO85fpUg/p6Tn4P+alTLCGuB7KNfzj1z5Nioo
         RsZCAvdl4jmDn15XSsbOdvMkMzhMr1uEnGhIGz8dtToDenEMEHLTX22LD2pRzWuDe5OJ
         +M6eYOoCFKNhiAMqaH/qLmubKfIyqfyIOdnwxKG4gVHCBxgN3KyS44XdgBnBFg5V3eZ1
         i58HRNgADApv6n/biQtFHbEjYHcrueWGgvmLGKhXaTAvqawsBy9rq/kiTu1WhQrmnWXw
         7V4Qtwm/qqeMCOfdJyauRj4e45s0dOUBF+J7afoB6X5fVBFl7PK1uvSE0AmcLngb/9RS
         oSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7GNDO2wV++3CS7hKS3KK9Ui+AR2lPsXYWnoRN/5ZAjU=;
        b=S8MNDuIyw9oVQYAa7s71nB7pytqLTruzpVOzYgyJcurTGIxxLacniedv9ZWy5Sy0xt
         ta685qf3Qjnt7jp66xy5b/GVzGPxykmWaXf66ljm4KRtPYSi1VeDOz5cJywbOwzEsj1c
         MIF+6QTKV/+An0bPKuxCR3FPz33oPFr5byLLSq2sXzZeQPIv2krSPafzb3WNVG+ZH6DJ
         u2Q071JE07EWXTkK2/wAQR78sEUsX9JiT3IGTrxD1YNpyg/EgJjdlmvGkP0d1+3AVHyM
         gAv2jgrRJvbZahkja1HsL1SqSpendQn957PS8UyPfJ5JvMBA1pSuvAgQ1OlBbohY3s2g
         gYvg==
X-Gm-Message-State: AJIora+aAWRF259zSdEpJRx6mPLL5mQinhFgKaBAICGouvmjdbEKlCn2
        nvstpNH1Ap2TgzK1whKyvXvqod84JXE7pw==
X-Google-Smtp-Source: AGRyM1ukMuBXLJ5/gcwoG2xjDcuwEQY7mRbPGj+ueSqE0hGilNRYHuFkWc039LAfokYembPbjXkPhQ==
X-Received: by 2002:ac2:53a8:0:b0:486:777f:a1b6 with SMTP id j8-20020ac253a8000000b00486777fa1b6mr1509368lfh.298.1658567384527;
        Sat, 23 Jul 2022 02:09:44 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s29-20020a05651c049d00b0025d6a975c47sm1537636ljc.94.2022.07.23.02.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Jul 2022 02:09:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Anderson <dianders@chromium.org>
Subject: [PATCH 1/3] dt-bindings: arm: qcom: stop describing individual boards
Date:   Sat, 23 Jul 2022 12:09:40 +0300
Message-Id: <20220723090942.1637676-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
References: <20220723090942.1637676-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Describing each compatible board in DT schema seems wrong to me. It
means that each new board is incompatible by default, until added to the
DT schema. If any of the vendors for whatever reasons tries to validate
their new device's DT, they will be stuck with it being incompatible
with arm/qcom.yaml until the file is expanded to include such devices.

Rework simple cases by dropping individual board compatible strings and
replacing them with the empty schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/arm/qcom.yaml         | 203 ++++--------------
 1 file changed, 39 insertions(+), 164 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index fb1d00bcc847..d4d945a43178 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -107,60 +107,39 @@ properties:
   compatible:
     oneOf:
       - items:
-          - enum:
-              - qcom,apq8016-sbc
+          - {}
           - const: qcom,apq8016
 
       - items:
-          - enum:
-              - asus,sparrow
-              - lg,lenok
+          - {}
           - const: qcom,apq8026
 
       - items:
-          - enum:
-              - asus,nexus7-flo
-              - lg,nexus4-mako
-              - sony,xperia-yuga
-              - qcom,apq8064-cm-qs600
-              - qcom,apq8064-ifc6410
+          - {}
           - const: qcom,apq8064
 
       - items:
-          - enum:
-              - qcom,apq8074-dragonboard
+          - {}
           - const: qcom,apq8074
 
       - items:
-          - enum:
-              - qcom,apq8060-dragonboard
-              - qcom,msm8660-surf
+          - {}
           - const: qcom,msm8660
 
       - items:
-          - enum:
-              - qcom,apq8084-mtp
-              - qcom,apq8084-sbc
+          - {}
           - const: qcom,apq8084
 
       - items:
-          - enum:
-              - samsung,s3ve3g
+          - {}
           - const: qcom,msm8226
 
       - items:
-          - enum:
-              - qcom,msm8960-cdp
+          - {}
           - const: qcom,msm8960
 
       - items:
-          - enum:
-              - fairphone,fp2
-              - lge,hammerhead
-              - samsung,klte
-              - sony,xperia-amami
-              - sony,xperia-castor
-              - sony,xperia-honami
+          - {}
           - const: qcom,msm8974
 
       - items:
@@ -169,16 +148,7 @@ properties:
           - const: qcom,msm8916
 
       - items:
-          - enum:
-              - alcatel,idol347
-              - asus,z00l
-              - huawei,g7
-              - longcheer,l8910
-              - samsung,a3u-eur
-              - samsung,a5u-eur
-              - samsung,j5
-              - samsung,serranove
-              - wingtech,wt88047
+          - {}
           - const: qcom,msm8916
 
       - items:
@@ -187,26 +157,15 @@ properties:
           - const: qcom,msm8916
 
       - items:
-          - enum:
-              - lg,bullhead
-              - microsoft,talkman
-              - xiaomi,libra
+          - {}
           - const: qcom,msm8992
 
       - items:
-          - enum:
-              - sony,karin_windy
+          - {}
           - const: qcom,apq8094
 
       - items:
-          - enum:
-              - huawei,angler
-              - microsoft,cityman
-              - sony,ivy-row
-              - sony,karin-row
-              - sony,satsuki-row
-              - sony,sumire-row
-              - sony,suzuran-row
+          - {}
           - const: qcom,msm8994
 
       - items:
@@ -217,49 +176,23 @@ properties:
           - const: qcom,apq8096
 
       - items:
-          - enum:
-              - qcom,msm8996-mtp
-              - sony,dora-row
-              - sony,kagura-row
-              - sony,keyaki-row
-              - xiaomi,gemini
-              - xiaomi,natrium
-              - xiaomi,scorpio
+          - {}
           - const: qcom,msm8996
 
       - items:
-          - enum:
-              - asus,novago-tp370ql
-              - fxtec,pro1
-              - hp,envy-x2
-              - lenovo,miix-630
-              - oneplus,cheeseburger
-              - oneplus,dumpling
-              - qcom,msm8998-mtp
-              - sony,xperia-lilac
-              - sony,xperia-maple
-              - sony,xperia-poplar
+          - {}
           - const: qcom,msm8998
 
       - items:
-          - enum:
-              - qcom,ipq4019-ap-dk01.1-c1
-              - qcom,ipq4019-ap-dk04.1-c3
-              - qcom,ipq4019-ap-dk07.1-c1
-              - qcom,ipq4019-ap-dk07.1-c2
-              - qcom,ipq4019-dk04.1-c1
+          - {}
           - const: qcom,ipq4019
 
       - items:
-          - enum:
-              - qcom,ipq8064-ap148
+          - {}
           - const: qcom,ipq8064
 
       - items:
-          - enum:
-              - qcom,ipq8074-hk01
-              - qcom,ipq8074-hk10-c1
-              - qcom,ipq8074-hk10-c2
+          - {}
           - const: qcom,ipq8074
 
       - description: Qualcomm Technologies, Inc. SC7180 IDP
@@ -576,146 +509,88 @@ properties:
           - const: qcom,sc7280
 
       - items:
-          - enum:
-              - lenovo,flex-5g
-              - microsoft,surface-prox
-              - qcom,sc8180x-primus
+          - {}
           - const: qcom,sc8180x
 
       - items:
-          - enum:
-              - lenovo,thinkpad-x13s
-              - qcom,sc8280xp-crd
-              - qcom,sc8280xp-qrd
+          - {}
           - const: qcom,sc8280xp
 
       - items:
-          - enum:
-              - sony,discovery-row
-              - sony,kirin-row
-              - sony,pioneer-row
-              - sony,voyager-row
+          - {}
           - const: qcom,sdm630
 
       - items:
-          - enum:
-              - inforce,ifc6560
+          - {}
           - const: qcom,sda660
 
       - items:
-          - enum:
-              - fairphone,fp3
+          - {}
           - const: qcom,sdm632
 
       - items:
-          - enum:
-              - sony,mermaid-row
+          - {}
           - const: qcom,sdm636
 
       - items:
-          - enum:
-              - xiaomi,lavender
+          - {}
           - const: qcom,sdm660
 
       - items:
-          - enum:
-              - qcom,sdx55-mtp
-              - qcom,sdx55-telit-fn980-tlb
-              - qcom,sdx55-t55
+          - {}
           - const: qcom,sdx55
 
       - items:
-          - enum:
-              - qcom,sdx65-mtp
+          - {}
           - const: qcom,sdx65
 
       - items:
-          - enum:
-              - qcom,ipq6018-cp01
-              - qcom,ipq6018-cp01-c1
+          - {}
           - const: qcom,ipq6018
 
       - items:
-          - enum:
-              - qcom,qcs404-evb-1000
-              - qcom,qcs404-evb-4000
+          - {}
           - const: qcom,qcs404-evb
           - const: qcom,qcs404
 
       - items:
-          - enum:
-              - qcom,sa8155p-adp
+          - {}
           - const: qcom,sa8155p
 
       - items:
-          - enum:
-              - qcom,sa8295p-adp
+          - {}
           - const: qcom,sa8540p
 
       - items:
-          - enum:
-              - lenovo,yoga-c630
-              - lg,judyln
-              - lg,judyp
-              - oneplus,enchilada
-              - oneplus,fajita
-              - qcom,sdm845-mtp
-              - shift,axolotl
-              - samsung,w737
-              - sony,akari-row
-              - sony,akatsuki-row
-              - sony,apollo-row
-              - thundercomm,db845c
-              - xiaomi,beryllium
-              - xiaomi,polaris
+          - {}
           - const: qcom,sdm845
 
       - items:
-          - enum:
-              - sony,pdx201
+          - {}
           - const: qcom,sm6125
 
       - items:
-          - enum:
-              - sony,pdx213
+          - {}
           - const: qcom,sm6350
 
       - items:
-          - enum:
-              - fairphone,fp4
+          - {}
           - const: qcom,sm7225
 
       - items:
-          - enum:
-              - microsoft,surface-duo
-              - qcom,sm8150-hdk
-              - qcom,sm8150-mtp
-              - sony,bahamut-generic
-              - sony,griffin-generic
+          - {}
           - const: qcom,sm8150
 
       - items:
-          - enum:
-              - qcom,qrb5165-rb5
-              - qcom,sm8250-hdk
-              - qcom,sm8250-mtp
-              - sony,pdx203-generic
-              - sony,pdx206-generic
+          - {}
           - const: qcom,sm8250
 
       - items:
-          - enum:
-              - microsoft,surface-duo2
-              - qcom,sm8350-hdk
-              - qcom,sm8350-mtp
-              - sony,pdx214-generic
-              - sony,pdx215-generic
+          - {}
           - const: qcom,sm8350
 
       - items:
-          - enum:
-              - qcom,sm8450-hdk
-              - qcom,sm8450-qrd
+          - {}
           - const: qcom,sm8450
 
 additionalProperties: true
-- 
2.35.1

