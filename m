Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEFA46C7B50
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 10:28:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232058AbjCXJ2y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 05:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjCXJ2x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 05:28:53 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EC084C2D
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 02:28:52 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id h17so1046280wrt.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 02:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679650131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YClmJDKz6cZns1Ia5c/sLtO34LHFlQQl6zHxRMVgDX8=;
        b=mr6ClSCp6Tr1hWXkuQ+WvJcUgf8qbHXaE6mQqhEasdKrCz/keIHhDzxYvqHBKKjZGE
         WmzNct1x11dzJMvPVuGjXkHyA2g2wVnTMH8bZITHLp6EDB6HsiaAhOHkGuBaWvEpCXgC
         8a/73zAqmcAo8Jq44FpiAPL2hXvBp777qRpMasj4dOSz0eMHTYSras+6/MALwDFhib0a
         bkuWyakWMjpD05mlRHr/9oJgW44oIDJvnKaYD+glDArKfsrDbtmS4j0BFC+bCb4Olu+i
         kuPtTBEE/xP1dtHkkQvvQic4fOFxw/C8a4iEekioF0f0WU3h69lhmOcI2pNEd4z4bZ9t
         qc7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679650131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YClmJDKz6cZns1Ia5c/sLtO34LHFlQQl6zHxRMVgDX8=;
        b=vKXu4wadVmR0aYUIAhDa+KIIwN7J2Nz4sKP/dQ+FVQ/NgfGS1nZjSgPW5rOtUmdll4
         oEh0d8jV9ttOjbRzrlHQmKQTNeAOmdrIRsMJgcIMsMiYSdZ1BiprHR9vGSj542Q888Fh
         bBBlBEboOqNQ1V1F2uYybJqYoMOb3ybkDLzKCid1OuLjup0Q1zOn4jmjRYMH85mxMCPf
         GSFtkVotrd4qw++CztPrCdI/IPgSQDZRM+W6PGnmCDSnjIcFHUZOyRSaWkznpQXexuqR
         CMCb4qDSIuaoed+rZg4dwvtTeLIhQjvVl4A9J5ftUQi/XLZ/lzKnlqwTrMi5WG4CGZHy
         sOiQ==
X-Gm-Message-State: AAQBX9fp0uECH99+LY2aY5cFc61PuslNMPFPbqY04x7qX6W/j+Z0shwv
        ZR5DlgdMSVMxlCXG/qtrqkz7AVIVOKKnHuWZH7UKVA==
X-Google-Smtp-Source: AKy350YPqtf7wMdZLg60x7SHKleSr8f4qz+JIvgKdsMXSPhn/X6wC4nfLVIdzdPM+av+LAOKJUEokQ==
X-Received: by 2002:a5d:570b:0:b0:2dc:d670:5351 with SMTP id a11-20020a5d570b000000b002dcd6705351mr1690298wrv.62.1679650130755;
        Fri, 24 Mar 2023 02:28:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id v14-20020adfe28e000000b002c5a790e959sm18029980wri.19.2023.03.24.02.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 02:28:50 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Fri, 24 Mar 2023 10:28:46 +0100
Subject: [PATCH v2 1/4] dt-bindings: display: msm: sm8450-mdss: Fix DSI
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-1-0ca1bea1a843@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The DSI compatible changed between patchset revisions, but that wasn't
reflected in the bindings. Fix it.

Fixes: 0eda3c6cb1c5 ("dt-bindings: display/msm: add support for the display on SM8450")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
index 4c6929e2534c..f26eb5643aed 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml
@@ -54,7 +54,7 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-phy-5nm-8450
+        const: qcom,sm8450-dsi-phy-5nm
 
 required:
   - compatible
@@ -254,7 +254,7 @@ examples:
         };
 
         dsi0_phy: phy@ae94400 {
-            compatible = "qcom,dsi-phy-5nm-8450";
+            compatible = "qcom,sm8450-dsi-phy-5nm";
             reg = <0x0ae94400 0x200>,
                   <0x0ae94600 0x280>,
                   <0x0ae94900 0x260>;
@@ -325,7 +325,7 @@ examples:
         };
 
         dsi1_phy: phy@ae96400 {
-            compatible = "qcom,dsi-phy-5nm-8450";
+            compatible = "qcom,sm8450-dsi-phy-5nm";
             reg = <0x0ae96400 0x200>,
                   <0x0ae96600 0x280>,
                   <0x0ae96900 0x260>;

-- 
2.34.1

