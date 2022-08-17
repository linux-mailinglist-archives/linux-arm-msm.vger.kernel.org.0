Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49DBF596F5A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239749AbiHQNOm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:14:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239160AbiHQNOe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:14:34 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521A34C605
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:14:27 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id x9so13509476ljj.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Yg02g9RCBzELEXyS88kfi01jTvYemBxzwaKsyEKanCE=;
        b=wrxaq7kIOpkPNFTiLpjulwCD7pviXkUQGvHL9K/EVHN5XsO7SN2JLubqS+u9PCcp5v
         q0vOZVwTtxD1x5mYS+/y7aa68SIKuzE8DZuOm4+sRD0zzLTLLwk488pBr5EicLQAly/1
         jQWEu7D26Z+pT4ShEDmBxsziUSiTd288fmynPp/5uP9gitFdW75iasYactInEaasMu40
         Nta7yv0NpCMRYB/Mn7lcN2dyUvFyfiPl3H6JMjDbs1ffzgvgDB3K0WXit+xgqIowB3vc
         QWrwxpvvsgXv9CiWC1iIiMdTEq0DnmfAI4Lee40+6ZyUzN/V8OJ92T9vc5cpgGVP/H+i
         kYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Yg02g9RCBzELEXyS88kfi01jTvYemBxzwaKsyEKanCE=;
        b=ezdUvQzaUzTfbb3hkcNxIoBhzB4J1fqRKb0qRurUskdccWZKRZNegbaES7845Hj3fX
         2JCMYqaNPmLwGaw1yfQCh84+5xmJ44CkBbWmpj2oZK5yojSosj0TiEK0r2S0h33jAcl0
         FyTOeq6JSAzG/IE3K1FEc1UnjH/N5DlGu88I1mFSVGIuh5rr1oRlEz7Yu+b83hh5PmEs
         hLhsB74Vx9ZCrv6PqQWFmCAJWTdpb1H/LV2iG/2Gm13nb7eAtS/mGF2N0881N2hJe3nY
         phbi0z7KIeLK3dI38ZnlDA2cTqE5YTjUNYVZLpkbCjCt8JAbkTtZYDMMVPipYfPgJrzq
         oFiw==
X-Gm-Message-State: ACgBeo2HzO2JhykftYJu597usR0CeINfmRH5FvmPdgvy+Hx5i/Z/KJqS
        vWTLBk8SKdTGxaPqktel+7a6eQ==
X-Google-Smtp-Source: AA6agR5uzwpyakQr42iVyz1uBf4J8T2NX3T081uUgaSAx0+liX43Wz9QFyk9NN8TtSGeujw5eecP3A==
X-Received: by 2002:a05:651c:555:b0:25f:f134:de3a with SMTP id q21-20020a05651c055500b0025ff134de3amr8354626ljp.376.1660742065551;
        Wed, 17 Aug 2022 06:14:25 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id k1-20020a2ea261000000b0026182f31aa0sm1411307ljm.1.2022.08.17.06.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:14:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 03/12] dt-bindings: mfd: qcom,tcsr: add MSM8974
Date:   Wed, 17 Aug 2022 16:14:06 +0300
Message-Id: <20220817131415.714340-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
References: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
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

Document new MSM8974 TCSR compatible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index e1c4936a0352..e7383dcad83b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,msm8974-tcsr
               - qcom,msm8998-tcsr
               - qcom,sc7180-tcsr
               - qcom,sc7280-tcsr
-- 
2.34.1

