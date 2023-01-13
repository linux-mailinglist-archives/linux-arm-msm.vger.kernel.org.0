Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD9D669B75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 16:09:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbjAMPJ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 10:09:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbjAMPH5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 10:07:57 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B31C97495
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:59:03 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id vm8so52916925ejc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 06:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XU/dHO8DVmGPpqkb7r01X1pAdFG84fFdf1WtxGiiHvQ=;
        b=ARnoDLgerC10W1udjRPEt/GqBBzqwMsZyw7cRxy9pAmrdaWhWipPNrxDp8DBWRpYG+
         Iea+vxk4XoiUXFG//j9I13kfV+No6IlbMzurvbDOSa8gJIJ7jVIhkQwtRNZC2GtD/WQl
         79tRkeKdEqvkoIvDjk7Eg6qqOwqxqDhh3dkJHf/2TMxpGesmbtrczYR68uFVNXqOd7Mg
         9vvQ/zaF+WdZCC567si2DOhLTihqGrCKEIJ/GpoR+zyrxB4HLBzDz28JUWXMonFTufTi
         tzrEcMZoHzRylV3/dN2XRl+t+JSa6Mg/8+Cn18L2q7Lqr8VfmriCR0tI1KaRlhtW1+L0
         nZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XU/dHO8DVmGPpqkb7r01X1pAdFG84fFdf1WtxGiiHvQ=;
        b=tztWYlDqa8nOkJ91Clb0SME5ApSsvmuD2xszJMOrSgeNVKouhtjuSGEEQGD0Fu5Qly
         dwffyMBh57abdArF8b2QtDgoUhfeAW8KzasQerX0GUMpc6bjNqgbmejevmk79+sBNjni
         i1dgQhFOrkeheYZp70lTjJmA/agRSSAYvJdJmEZtl7iEJ+e0imFg6srB84ocX9wtveZd
         hobhDQKvk8g2HVmyCUa6h5P8QH7bxxLHnqAYrmwcBfONZOl/Gmcvs2Q+7uikBbiGwE5W
         BBlHbVrTHeOazPhQppedC1GeVdRC6bU1Ydbh9R9ol44uNLB7RvgXk2SHb/uprpGNdjCE
         ijgA==
X-Gm-Message-State: AFqh2kpqT075vCorwaF1Fc432/jRA/29PqFPPrB2FZwwVQQfnMvPf1DL
        KcJmWfUFWQqgNCF5galVMhef5Q==
X-Google-Smtp-Source: AMrXdXvQMbq4TsL6YlyMhhJSIvA4tsjszzryU1CY+N0v6fsjTiGu3umfQ6d6YPAX7S+tZ+ikL7UVbw==
X-Received: by 2002:a17:906:2813:b0:7c0:f9ef:23a2 with SMTP id r19-20020a170906281300b007c0f9ef23a2mr84066794ejc.30.1673621942178;
        Fri, 13 Jan 2023 06:59:02 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f1-20020a17090631c100b007aea1dc1840sm8621468ejf.111.2023.01.13.06.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 06:59:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: clock: qcom,a53pll: drop operating-points-v2
Date:   Fri, 13 Jan 2023 15:58:59 +0100
Message-Id: <20230113145859.82868-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The CPU PLL clock node does not use OPP tables (neither driver).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
index 525ebaa93c85..6bf70af948d7 100644
--- a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
@@ -35,8 +35,6 @@ properties:
     items:
       - const: xo
 
-  operating-points-v2: true
-
 required:
   - compatible
   - reg
-- 
2.34.1

